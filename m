Return-Path: <linux-arm-msm+bounces-85511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8FCC8535
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D35F030DD605
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A535C347BC1;
	Wed, 17 Dec 2025 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVtu5EWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rz6C82v+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23382345CB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976468; cv=none; b=BqN0eOkBvEEGnLS6S5Mzd2lmJpzqlkJY67/xIriZGZ4dRVcjLvezDaAnNAcj3yF0pyzansHfO86bwt6wguigGR6l+If6XZuEJksdxjLBfpJB3OhDtx4hxIesks+IbSkMY+uu8vtLY3kYePwqdSsYFt+csvLKTQPuJUj0XTZ4mwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976468; c=relaxed/simple;
	bh=HVgZAWbpr1kTkiTZYFcNNunlRt/FqtlF7sf5AeKZyKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOGEFR6+lQeRJ9oXrAU4PS3qOgfaRs1kWqNdFtn0U1togvaduwYG9CMQLHJ8lkr1nOKCrEBUYPtK9Tyi2bALhwH71DZ5k7RwXq8E3QJ4XIyhV3CE9jlIfViz9Z0MkOfNXXalCeiFMNdHX/Mov68Jqh54mxDoEuevYKa83mUCKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVtu5EWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rz6C82v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL6vP3001915
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHzlg4EzmcOyOoQd+RcJlLn2pewRmU7gpHgVURI/Mgs=; b=RVtu5EWVK+IZcdBh
	Abuza281fFQSDLSnOYNXZwunUGsmyCTR9NltGkIPknPUFEbmsBPFNAqn3usNrrv3
	cuYiMRnFXPcnRIkW7rNvQOcBMMLwvCTvuvT2hVt/gmsKoSlxIj098v3+dzwH9Jzv
	AmLLjxtzWSZ0ulxANWxTGCfrFxFAeXHWanvd/CC62yF9kx9c5NLEeY1xm1ehRmU4
	6ffBIy5sAyMgizXJXyPpWpPMm0+1zmSEcvgMDwfjCPHFnrRnSkMelDCZ4dmGxoGW
	/8S9jVoKJdSa8ypwWj+2rwxcixGN+jFwIh9uT+ei8avuzo84KzbZ2BxtGz10t2RY
	S6NVjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n331mj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:01:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927183so7490811cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976463; x=1766581263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHzlg4EzmcOyOoQd+RcJlLn2pewRmU7gpHgVURI/Mgs=;
        b=Rz6C82v+ks8WfvmCavfnjDNxh8dkO7UZv1uyZW4EjOJo4DCssvnWQRjlNZFhs4LqgR
         Rxo0NB/HZ8kcAxvjd0vksg837SQxmJdon/xy33wgX6tkm9tKM42Ravj0SUYMFR+KooKZ
         dq/TR1xWBloilnC+EVdB4vS+/yBSDieDvEG3tF08gp+pKM7BsngJ5+85wDhRXkPMsy8h
         EvHCcA2ZYMyoJQj7syRki4Ui2J9n8cud5TIlc2LUDtIzGOA55qG7ChKj9HoyRcNUhPPW
         IvkpaBj0slf57qtPW0/96HMAnsC/hdW6CbAUqUsPZl6DhTXWyek9qBXQDkwf2b9XgQ4j
         fkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976463; x=1766581263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHzlg4EzmcOyOoQd+RcJlLn2pewRmU7gpHgVURI/Mgs=;
        b=i22++CFcuf6Mqp9/HBicFbrs332AE206+TV6GwIK851b3mZreUa8i9RTB0ufI9aU2Q
         3ckDY6clN42wnGOR8S1nL4vobikG2EqWZQXKuiruw8c077gUpL7qeEbAuqxUKYLR90Qv
         o67ZrYDeCENUtaYLe7Azf2yp0xDJxQS24bsKtNlhwkZ2AxWg6WjCtlo3elwNUuNhJnlM
         uVtapQbJXILhUXdNgMJyP/3BmZWxdxo5nQzo2bopUWQpwBhUwKigS6E3sQqh4WDuKZ4k
         jKKkfF23MbKm0KrGY4WJlIYM+ULdp2Jc4oqDcwaVNfCXB/BRxQ+EDYHSIY55MkjMRx45
         aHUA==
X-Forwarded-Encrypted: i=1; AJvYcCUiCXnxrcNmi47T3rDokK4Gbeefn1+7kT/SJvgVrJaIjbM3C23x336znJEM2tFITrfW3F82DTCUK9vkxjGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNKcXdaUPjTx9BbCakHHkEknFypcoDyh8ZCecuxpViZVsUgiM
	OM/hj82VbY8wRmwNLqGUTRZQ+0hnK7KxPBkeoSTdbt3gGcy0ulLUUazCqPhgFhdgUcu0p8DcllF
	Tm/9o6oU2KZuthZu3oCvoI/0jViLZCr5sOzvdHTjFSXHR2jTfVL1RREb/Wz1CUaVeemGb
X-Gm-Gg: AY/fxX523ol2tZFJqcX7rSts/8nQZGvVQLI4/fetPSqzNvHt3OveU1aptvIQqk822Br
	e5LWK160eKWFqLZaTlfZCJdCFi/zDrj27x+9imrUKvZjny0sFWg3YKX2op+j/DEYbxnu/4qF7ap
	CIth0EUxGswnxF39dQgcByyOcv8CUX29i0iY9ezi2pGG4EKdkxMyjzDMli+FsHqIh6DdpzGS8n5
	GqXjCbR7aGtmCZGV1o+ZqtcMqnhtUktQFBgBJqazmfKW6raJ+BgVfi+wPrYQTd+r8C0owdRMPC2
	O2RWewd9GM3VBomJZaTPUMTct9sgnuAP8Js5caxV0eboojIO/3r4bNZ6t9AXYwyipnWI17oyzK3
	1VrxcOm9Txlt0lCR1pW++v9j9JPJfnq3SLDoL5cXo7j1PTffAncc0ZpVNGZ/Y0edUBQ==
X-Received: by 2002:ac8:7d14:0:b0:4f1:be96:568a with SMTP id d75a77b69052e-4f1d01680b8mr184598141cf.0.1765976463387;
        Wed, 17 Dec 2025 05:01:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTy37xBIPLDeC4Jh6SE+/qv5pBcSn+YMZ+pzSoKGAlcjT6pNaPLlls/0sjvGivcG1kNzuwhg==
X-Received: by 2002:ac8:7d14:0:b0:4f1:be96:568a with SMTP id d75a77b69052e-4f1d01680b8mr184597231cf.0.1765976462463;
        Wed, 17 Dec 2025 05:01:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56be0bsm1892480266b.52.2025.12.17.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:01:01 -0800 (PST)
Message-ID: <c1f9c746-0ebb-4b65-a992-9f60ea5689d6@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:00:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: kaanapali: Add base MTP board
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMSBTYWx0ZWRfX7AiqGh2f79Sb
 1E7lKZ1sSvN5zelmiJyxGLQidohGlo29O27XA+3PVIgdYQFnaBPJaz5Bt4SWvuWrqrRqnRajJ9S
 c00YtFaOj1z1LpsXOCfvnNidkpa3L/QNx0An1h/9KCsRG/xBP6kFJTGeMGSjWU1HTzXRuVx3II2
 +uolC2qmjrJRTVZyjuG8QmTnUEjSdoOcGvyhLm+UZ5dLQzZMR7TFqJ9n6A3vsKMI05B3/ZB2I5W
 TX9CjyoapSh5lbwyn2f4VMcmcb/5Gp4hGhFONjzNWM046tpFFwWjWZ2L8aS/EyRHJpuvJaktHDc
 dCWSJh8X0mbhy1gLZYTy+yBaYRHNuIXuEOm/CEYC3Ve/So57em76OrhQ1YbTfUd+eS/deCY9HdV
 4bJT1Dw5esjx/V1Jl0QFKrv+VsjR+Q==
X-Proofpoint-GUID: dbmK2JC2KRDXgPGgbUZte4riVCYVi2ba
X-Proofpoint-ORIG-GUID: dbmK2JC2KRDXgPGgbUZte4riVCYVi2ba
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6942a990 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVI_ATdNTQjFCBPYYL8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170101

On 12/15/25 10:07 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali MTP board which enables PCIe,
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added UFS), Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

