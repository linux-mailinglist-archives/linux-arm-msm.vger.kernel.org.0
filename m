Return-Path: <linux-arm-msm+bounces-94413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOO9HqxSoWkfsAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:15:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5F1B457B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1003B300B51D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5536224AF1;
	Fri, 27 Feb 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYB2L8gr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5TLYL87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A6284B3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180127; cv=none; b=et+QqZ3gV1GNuFaWMbA65yjMWFSwA4LGeuVilwqjPUZoSQKtVMyICHd62HiZ/bMnQyAAzLStKlTVY/C9/I/tkfFMRNYkIrwwm8qAUMiSGvc2CWH3nZnP/iiMr+5CBfgxfrQ9jFAUWZvNbAFKhh4f0tVidJ/gFJYxF2uiEJmlKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180127; c=relaxed/simple;
	bh=0wY2wvK34Kz99cZ9WTMxbRGaNub0JhbkNlz1kAYRc5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsPA5rk0rLJXVjsypUeGjY/PYkdOAGAGOAIRiNHSAfn7lbqAaetm6eTSvqkeKfj0yro4uOARN7PGjvC1HkbwDdpKAwO8tWB/WmPNERoTvIx9eAz3d8ASpv4uB5XBtcZxpLdTU8vh4RnOV6yw8ylsT9VINIpNyVBiP6GU3dCFwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYB2L8gr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5TLYL87; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jxn9235868
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=; b=mYB2L8grqptsSvhW
	z+T5yd7Jx3GFFwAEFIVTlbdPpyxkuUNhMsJGywvF/N2zrpYUbFIVCGDTou55qwqk
	hWD0xvhQY4/n+YDBC7c1lex6C+hL8KlnfNrOiH6IWCOXBvlGlxR4/6WWAkkpXyeh
	oS6bleU03MwAiHOequ4rtSAjYOfHPC9O3kvOqcctqA2m1/AQtpfvKMDFZM6Kwe9t
	kLXEodG0CRORKP0DD+PwKkCmfVaaiz2cZUN48x/U2aTZf4DdakXYn6vOzbNBvN3Z
	uEqQrLnzn5bafACF91y3x/7sEON4PxBTocLAGhwRdWLjFMx0Cnmi44lAX+5PXOL3
	JjpTyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xspj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:15:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so1673023a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772180125; x=1772784925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=;
        b=T5TLYL87TyDKkefvmfQiOe2BqsEoCVvX6Aem8K5SzkfTUSTUhIpa5KdCavPnkgj63H
         Nos3faDITzGTc2zVBHH9bYTe4iWA8QWe2W+RPdgNOZV24WfeV7RZl5HINZV6QnHs0qjq
         XcLgI6PgHY55sCZ2CgJLrurEgSDAMclEMebN2GUAUlsiafyB1RV0273fjgcgC8jxIak4
         qXhC4jIc2qo2CkY+mIXe4Qf0l3d2l/86myQz6hoRBOM0VL1pXwW9yxtvmOXW1Ny9Pf9h
         PDw0Rl7hvd+HcfY0ACNQAbZkOBu3A+/ZwpImTgx7AH6p32hgWclL+y/KoGUY4mihFqjf
         WRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180125; x=1772784925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=;
        b=CzODL/An6rZQUH5KlbJ3yF/CXKCCwqY0lcO382WAw3pDynUR4JfU+8Nh5UWZCgsDKN
         mAiQ6qMP6LCW2g0mUFryahcw+XkXLLSAZtfvonvCas15BAe3og7nqXQwVW0GsT1bLKmd
         3/tcVIgaV3q9pNWBMFns0ukRrytqKffCh1WJzvwSVfc5Ec8S0MobENSXMcCfKtYAtrDY
         t+5SZllWiasFj0bGw0kiVQ2SSoRepj3mx90V+FYCYNzMfdZ97H1JJ0yUH3kqYA8d6Op1
         oPbFY8lN0E7G3VvYXpO/XAOOIYD6WKlYOsM7f0LykG/cbP/uFHJLUTE1iQ4fapyriRJ6
         CknQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi0k20cVD6efSf3CaVr/8JWoCkjxks79+xzgkCUDTolYIghwZyaKybrDiEFcOHYBT4LDV7a/kmsmhPDKI5@vger.kernel.org
X-Gm-Message-State: AOJu0YwwH2oEnA0KyKZ/+UEt1wDsGmMa3HfmTFxrcNkFpkqSAa5hFU3M
	vBAntjK5aEVxWK6EU3jF8+yqixX4VT5hTCWgLHbkRzkd95EuXBXeWi9500bFOslhoRMy+WeNzKD
	9kRCAgAqFqar889vy2vSHg2xTiTbcXKQaR6j9gM9agBBvn4uaaCd7Y3Nl3zxyyrSG5mmR
X-Gm-Gg: ATEYQzz5VujPtVAL6NzKf6nDnYXJzR2yeyFbUTQWiSeyvMCHs7jEN/PprhyIO5QTcBb
	vxlfToeZIxEUGyWiaMQicL2V1RXYPyQDB82Lo8/MJCg8WvuXV0/6LQ9adQ00tb5JhZPnB75jtBO
	cuo0GkkK/BhvOBcb3D+QyNQnfHnr5QlCd+BKYxmfEsgV3kNedPlyfYBL9t5q6C91Fz9QkdHredc
	ECr6iu6Yh6r/VvesOn3fBK2F5CzClEPAMpJCUyfMSTOkb0bouARAeefDJPzAkOGNyEMq5U/0EBy
	eKDegh/KnlC5gaqF5Hrmv2iVVA8K3vC6E04ogMiJM+YocAseOgcMfIJYn5H+MElsv33hEzv4X9J
	wrldb+hz1Wl6At4pdtlv4vd8Z5rcDsNDdmUyFPmgnWQGnczWA2fekMcUTeAfFBe88bcn6nN2hxH
	tNt5i+UtNasQ==
X-Received: by 2002:a05:6a21:1bc4:b0:38e:95f9:8cc1 with SMTP id adf61e73a8af0-395c4601a3bmr1915940637.12.1772180125066;
        Fri, 27 Feb 2026 00:15:25 -0800 (PST)
X-Received: by 2002:a05:6a21:1bc4:b0:38e:95f9:8cc1 with SMTP id adf61e73a8af0-395c4601a3bmr1915913637.12.1772180124526;
        Fri, 27 Feb 2026 00:15:24 -0800 (PST)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b940asm46244515ad.67.2026.02.27.00.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:15:24 -0800 (PST)
Message-ID: <38fc2905-aa89-4b9d-8ad0-c289642899f0@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:15:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-binding: document QCOM platforms for CTCU
 device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
 <20260205-hungry-kudu-of-maturity-aa0dbe@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260205-hungry-kudu-of-maturity-aa0dbe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CTnb5VvtSfth4PAy5YarIbeKm22VO1aQ
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a1529d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tRX3X1fM6C1DGB9reTwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2OSBTYWx0ZWRfX7FVAqREIZf1x
 VCDSViYLEyuQUf8QkX8msypDQ6Fu/1XXkZwo9SHaJUkv58sq9Njxx7rq8i+IfqxBmar08O0IneN
 0V1jL7O96kheRld/6WtOBt+Q/L/SNiXewr5J6LTpGvSp45WHdbQIP94ILdjm56BxVRSCG9y8km8
 yig4bokLUyCE0QXTVetpVOHls6S83lMPFikAK8aA7ijxlAWBH0JHzIdxuuOJfNt09rCvXfz7lon
 YvjmGXsYDQ8BqLdZ881vHg1Qew0Edy+gTbwOx7nM0YKx9/h+/LkM8M0uHUWm+w3uxz/qpGOwnbx
 dyKbVchkxLnarhQWa+Gpy3z2yxfqdIgc+dPZX3HQBzH/NxFLKGFEX3O1BsTrGF6ZMzndKlpJrR5
 CmZrfcVBDEmhReAFAmEO23X79TBRYb/h9sm/GBQjBX9MGESrXPGLaAOhD3r4tLwQfedqBV6sSf5
 YIDPu6BbT3TBlRTgODg==
X-Proofpoint-GUID: CTnb5VvtSfth4PAy5YarIbeKm22VO1aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94413-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3A5F1B457B
X-Rspamd-Action: no action



On 2/5/2026 7:50 PM, Krzysztof Kozlowski wrote:
> On Wed, Feb 04, 2026 at 10:22:01AM +0800, Jie Gan wrote:
>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>> compatible for probing.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Gentle reminder.

> Best regards,
> Krzysztof
> 




