Return-Path: <linux-arm-msm+bounces-106085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO0gM+EG+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A91664D8735
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74F0B300370E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323D93DC4C4;
	Wed,  6 May 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnObDoAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbhAhGAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43A322B8B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058766; cv=none; b=JpsHsyD8Z1zh+LwkhejQF5wwnniv1EvoeldxXDeegax8ubGPmQdNzxUZHr+xhkmayKV9CQPW0wMY8lpi5Ij8rs95YxvCc3pwRP3jKMRinqg8JX4ToKMHgNlkxURybF5JsKS++2mCJaA51KpI2YQTc9m8sS2LAT4mb2HX4zPMRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058766; c=relaxed/simple;
	bh=LKYZUkcCpsEGxqu5clSz/v06FaXbrAaDfBJeB6zn8PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJJYegq85voPHUbIP+9sMrMhijY7NOp1Ae7lvyoXgEzMb1fVgBiw9Ezvk2iV6oJ8YMivL9nmugo4mc0f0x8erWEn2NjUOzW3FYIPjfLC9xTky2XuMrnLJguMCPJZ0KlhOl584fd3QLps/aMPVPiwgVZBcrVllv2v1WbcDtsU/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnObDoAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbhAhGAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467Qke4911956
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=; b=XnObDoALF18hvUry
	gOB5dQhjQR/M8vW04bRwE5I8iZmWU2sF7ne0nKXJQp30xr3TKp8hbv54EJWqeL0G
	15VqWhoDRnE8fDg9MgHtwAPLH56aP7TJ4omG3LShosf8EInIGi9GgEJy1VCTlxD7
	E4JvdiGrgIOEjsxEN1qiC9UxgG2PGcZIEo/YFGLWOfIS5EH179Dcut7UWsLpz4mT
	jLgxFa9TCcuO3gqJz3MJlJG7C/GVbBWs+9YgZ9RESJDh/giveKt/Zl92GpQSB+ho
	Pd0pUUcvxUkpmk3JXL82r+u8m46CDyQDb9dzBhEec/ZDVuHP3kJmHOUPAjEl53Qu
	jVTFIw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jky8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:12:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5755f6c9bf5so8468e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058762; x=1778663562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=;
        b=MbhAhGAEQVm9vA3JBInBQw2NleibV96bjIq3EXc9QFd0gNxW06GyRzPusRVw3h5UrU
         yIy4Q7DK8t2Z79LHQziJ+eOf1z4XQ6td2/wL7ee4nijOJrvTMwBINPsdmzQVxWQ9Rmpq
         QZsNV3GFVFn1yTjF8LlpcfclWaoT0+EWIeo1Gy5LaWeB61La0wktO81z/4NvuVqPaXGb
         9ujGfx5qdgtxMnx5v7nC5ncrRz5VYGANlaQIndNaV9hnXdDbT/IrhnmEWBhx5RhcDJKe
         XqzR6YsQhTxV6/n1GHYvOwCpeIo4qynZ4bOy7+1venQcN3DVPxLnaedy2v3Jfsz2nkdn
         aLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058762; x=1778663562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=;
        b=b6edWTSRZ85SxwZuIiQXMsJm36R7z8+YfspEy9tjursThB5hgMTpljj5uHl9UPSeZS
         nzq42GcRRqAwIIu1NkDEG27cfqO0aTNkDm3QztZTOdoaENPcVVbav7JFQiI0Dhq+Ir/T
         neVC733YLQjXMzfGpWKprUkzrRC/Kn+M8G6o9+8wYxNfy1E/yAgD0cVbcjdzVdwk7y4p
         LCneCB4i8e6KUYRY1JwGE1EgIPqEgkpzQogYNxvapmtwQuLk/TSLJMKWLkV6o69DwNXY
         qTc2X52Fo0yBSsIzU3/YALENS8tV+RYQ/PwY0HCDfqxb98wHScTbP08JS4vhpsFNaCE0
         AcJw==
X-Forwarded-Encrypted: i=1; AFNElJ+i/qSLjE0iyvw3LUpS/A80dRGfOfvyxm8DOS8HDM0v+mFtWtrXSdzm5vSjYCM7NoLMk5E1A6+zxLRd6wNt@vger.kernel.org
X-Gm-Message-State: AOJu0YyerqZhQMFGmgOjb+peGw45OppxLPg7PmkeVRwcVNanJEZerP7z
	ZsSTBiEMzDblXm2TRe9CrievVoEiM7kQyGM/o+UcPnWKM0NO/ZSL8Xmi7nwNT014FcZ005LoL8V
	+ZEU5xbWSBXQiqUdJMqPicf+Fu9gyOVaJg4grmNOLwreSn1QsJxO6K4iiHz+7T6Plv7c/
X-Gm-Gg: AeBDievxyOD8Ee7q375PlzxejEow0U9RtECUMYbAlgxdnZ4dbIi2fz/O1gedPf4wMN0
	9kAfpWwX+oRWPSOhsic2FYYfTH2Tt97C57fT8VyBTt4WCrS9rYw5eBQSjTynnCmRo5PxX0ReaP3
	5Le3Y0aJBfpjc9WyfvTOLFk4O3yo15NLGNIuriw4wscObpJysmQF/PUvoYC0rwCivFxWPsU3dEP
	CVuMl8G3C0crnC3c+epVQSCT7hmf7z+253Af1hQ8RajSedjXTRQnHNuVv/f8hdCsZgDeEWhvABp
	TAAaX3cEzWyYTn3xbcjbL/udJsRL/4/nK4L6bx/M3uxwc2WgV59y71GlkA2TJ3qELb43YjmXqeB
	c85X0Qltl5pMGkKMSEWldWzY6+T0YX/bHl01nbkN2zqTsjITHJOhn4pMtykWpLrnkFHX+suuSas
	BmDQQ3qoSgrFxEcA==
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr163186e0c.3.1778058762079;
        Wed, 06 May 2026 02:12:42 -0700 (PDT)
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr163179e0c.3.1778058761689;
        Wed, 06 May 2026 02:12:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17c5f1sm60531966b.1.2026.05.06.02.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:12:40 -0700 (PDT)
Message-ID: <b031b46e-7ee5-4289-8034-83a547153e56@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Fix address
 in fb node name
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfX1+KS9d8fwHYY
 JInI1SFgHkeRKN/sLza+t+LoMo1ske9ijyeJlEsEDnVWPOAhMgojge8P6aHLIN6xQw6SZSdws1V
 2rGtP2tHxRM1IqnbxmH86Ok2N/qKbb+EfnAJZe20PPiH2roBuWJz067hbm1iuVk5eg5c02XGYh0
 0wwqEtwVrgR4BzQnnvTuE1J3IqK9/Q7bqYyrSJzbWbqbgbq7IqkWychIhKC1HnsoKouBf1wYqKs
 KdRr8tRCPqRXodJVsQhveEqubvB2MPxgi4qfZr7/Z+DzbrztyPUN183t6YbsamUK3S/uPceKEoB
 DFUdk165MYKSqbrsxDEX8P3mDGjWSzjWeaOpR2NoHyGK3bYvDzEBKIf4mYFx8SxTcQdhT4koklA
 J2ylg8vpkooh2YVqXzBzfKg7oZxrGiSsyh1NmkxSzc323kPQkhP96TwmE90YK8OruUUMLEQZo2v
 plJWYgEs04Eicg6t13w==
X-Proofpoint-GUID: Wm6hVHkG6Ty_zc2FO-5GAJnrjPVR71Hq
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fb060b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=y3nCg1YZ4dlb0M9iUO0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Wm6hVHkG6Ty_zc2FO-5GAJnrjPVR71Hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060088
X-Rspamd-Queue-Id: A91664D8735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106085-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 5:08 PM, Luca Weiss wrote:
> 'reg' is 0xa0000000 so the node name is missing a zero. Add it, so that
> the reg and address in the node name matches.
> 
> No functional impact.
> 
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

