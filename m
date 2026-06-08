Return-Path: <linux-arm-msm+bounces-111872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FwZXBM68Jmo0cAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72A656605
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:59:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MVhAjlKK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VLsM3q0c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8F9B3007C8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778DD2989B0;
	Mon,  8 Jun 2026 12:55:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48366296BC8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923309; cv=none; b=Qlm+Qo9fQ/McTlX0s1yK1HIxKZ2X2VA9jTuE51vvRLxeDXtSK4bpQYAj7ia5edDe8uiD2JpPVo60R7X71M2WCJ5vFZgmqES2W3kSYrLuAsBcEVw7ziJVRFolMe7fU+aBLzxHpPO/M8I7c4/L3apGLkc/R8aDJdrFoma3FRZn+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923309; c=relaxed/simple;
	bh=ZgcJb2lpQ8TwBeBu4wA0l1geqtRhtrSfzrq0TIwr25Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heUT5sD+xGwjXETrA/yWjQfp7E3BadCLSAepoOf+fgEBPviUyezWo06VFhf6hTPaZgCO54eeENISUtzGg7j4KofA4SIv1ReZPAcsq3PmiXzxeg8vcXE5qw2YSis5lI1I8NZ+HZRoXksB7JEHNRLeZ+q9xUdDSe6qi/s9Gzj3dxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVhAjlKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLsM3q0c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9QgM2965339
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 12:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnEU/cGXr24KnB3ToaxPSDLshaLZ3TpTyHn764tJZxc=; b=MVhAjlKKMCZApg2Y
	DDVPkDgMWRiw0XQsO0k8+IqMGHcTgOFkA5jGiILMnSybZjRLzge/BWJpUpGW8zzd
	mLimRiKocKexkWe6A5t7k4d4cIUtVX5Q6bCEraG17ryaD1bWGImLeHBQp1QBJKb+
	WxLPLVHQYBt0OKWTFB6HI1G4p4///lSyOZnAyRDAraY+IB3DlBiq1zCgbyBgTJNp
	+cpsHkQph6dJMUB9csjNp42wDRVmfXgBtMT3YrNCtq5oYxOeqlgD4EHW7SviyIwg
	EN7GZ8Idwc5XSAfoKWCCE/0wh3pwCEYISeIf7J0EPoGlsxdCpwZLf4k/VnIMHmBJ
	omQkOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkryj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 12:55:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf281d523eso32574855ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923307; x=1781528107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnEU/cGXr24KnB3ToaxPSDLshaLZ3TpTyHn764tJZxc=;
        b=VLsM3q0cjBaG2jTYdj0NIBtTmA4P2SaY5eY5s1IREU+qfgWVM3oRn5PI2BOnsZCM8j
         lBSdxT8lqR0pRh86RKE18T5rTbfsvWLaVxcgQGeXAHUOdqD32wdy7Te8pWMRMRoOFcPV
         ksqkaSd6KLhuIklc9Z+6H1zEorl+HKokWkhGRSHc+eQQBiZXQhXztmeCxlRC1w1bEeEA
         gtiDeI4vItzr4oecxIlEA5nQlnPY266Zk7Xp4pLzB1jwYH/QXydaAMKuqbR59gALD+S7
         7IalCACej704d413H/AOaFRPV+watvpN7EU1mLLYtHEwJ8vI7ipNgazb9+AGYaGn9CZn
         D60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923307; x=1781528107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnEU/cGXr24KnB3ToaxPSDLshaLZ3TpTyHn764tJZxc=;
        b=QwPHZXUMk+sohgieh4DjjtLXMZ3drwnqslcDYZSURZPCMUPdaZQXXtEF2MDFt+RmHT
         HW4W1cHT988UyM99zN9c6673PHPjBLMs5mVkfs7NCbcCX8gDUE886gLqG7yRm11H2B78
         QUBQSlTo/T4vGRc6A1DlUecIYnNc8yZdfQ+MqkxU+6Gkvj9gOizrzSKeKPwImqxq3B47
         KLbhOA8xxRxFpIKaTaEJOpvrZRYLikgSPWIZwvog4Z6alNQvpfxuu0Yh7ErONDbzXzQT
         c7L7ZrnebwDUSZKCARaPvOGpO/3ib4BXS9n7D9v38NLt+geAgY1jRaZ5MhQTaoMY9B14
         Bj3g==
X-Forwarded-Encrypted: i=1; AFNElJ8UWJ3JqOHhClWXzcnRI38nS6rmbgQBKxssp5hiK5QVXqOGL5ArxnsusUAAp7pKnBV8rTKwQFLy9nffjHl1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2F6Ujqwy+bKKi4ah+WF0FzeUUM5eJ2OxiZyhZviJ3a4iTpTN
	2/tIxLEVhfytQYME/sxhU+Sl6DsJAj2+4lQH2WMeRE4vMVaZ6OBkcwGJ0IElyNKdAM28PlQbJBs
	Z1dV5VXC+3w4Fz+yQKOTfOe5cjp5KUM0OD+AaLx2zeCX5lY0XE3s8pHfICDw4Ny2I3gpw
X-Gm-Gg: Acq92OHWX2DonHHloxyqEBkmkSvbfvrg/mAO3cnKEnWJlVDDss2gMmOmkry71TeSIPe
	jIfWJ4gEF1iffOnNN3OruHsaVAjdX6rVKlhagyqMqTokJWGyZEhuKyhJRZdQJqiuz9O9djNaQsg
	h6ZUMtJilt3OniTpTtItbmC8ogqtCCu4cacOfJeSvBnISNi/GzCqMUTfFKXqN9nx1OaOxL6VdDQ
	mOSq/gSai+AKgeosJ+oBIyVU0x6I/4vKls5o/IaIb2ByUUpkf2X9NAbgtt54839IV0aL6tlk380
	rs74sCpraG5DnyrLQgKrwLU2C2UCue9Z3OrDLQgU1JAf0UVj3f0+2ZaaRK+H40hOdv5Y5SLRWHh
	2lpfmaQIBdJJe1HCQ9NkV6OgWDp5lMV1n+fObm9DxNaCmtdZQzFXMu193JWkj
X-Received: by 2002:a17:903:248:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2c1e7b457femr178770655ad.14.1780923306879;
        Mon, 08 Jun 2026 05:55:06 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2c1e7b457femr178769985ad.14.1780923306336;
        Mon, 08 Jun 2026 05:55:06 -0700 (PDT)
Received: from [10.219.56.230] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629c08bsm185130265ad.61.2026.06.08.05.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:55:05 -0700 (PDT)
Message-ID: <18325758-eb01-4b2c-9e9b-b06252f50b73@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:24:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-8-0fe3f8d9ec48@oss.qualcomm.com>
 <ykcbo7dkl2rrjdzutpwsc3wmnub5r7h3zuspxiyh5v432whb65@sbaar24glpta>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ykcbo7dkl2rrjdzutpwsc3wmnub5r7h3zuspxiyh5v432whb65@sbaar24glpta>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FAeESWFuhKMdEZSdSYf6p3wauk7gncyF
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26bbab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ppHF_k0_RADCBk5xbaAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FAeESWFuhKMdEZSdSYf6p3wauk7gncyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMiBTYWx0ZWRfXyYohy5XwQziZ
 2ZtP7BTPeTyhEEImnZlnUJVJCwNdwSmiRxdKSgimTsNUqKR081xaOun/FyJ1ee5BtzsoPoUgq7p
 zBTXV5MxmTbqUwGYm18FrXDrs0ZMULb02tlKS5wdKvSuuTwPyGwjUD8EQbKHT6bzTTF3H/F2rxT
 RyDpDXwULtER1OqvFp4Ehi+VVIR8BTKuPuK00Dpv7C3hdcSIkoCXQtJKAPLM97RUXmtZGfEzFvn
 oq2GmScRQbSxcysBldCYUZ33hzBUDqMC4MgykY6XJ7p+GvmkuO9FhBrbnJB1MLe3xrQGS1azsTQ
 S3TKHP1DCnqLl0bgChlrL4GnUpCTiKtfPTAUNbjTqlBO8cKPZwSUMW+DiKEQ/GyVUIw2SM3TVPE
 1usQEIhKRicw8OCg722lo9VapJTxZ0hVWzgeY6BFxK1a94vCMqiaQZwB9WKVMMJ0GTu4pXh4+2p
 jMFrvrI6lwlUkqNKiTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111872-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A72A656605

On 6/6/2026 6:02 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:25:10PM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
>> IQS EVK board.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c..b112b21b1d79 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
> qcom/shikra/qdsp6sw.mbn
>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7ae..e62ba5aef71f 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
> qcom/shikra/qdsp6sw_nm.mbn

We cannot change the firmware name, as our vendor builds and internal 
tooling depend on the same naming convention for all three Shikra 
variants. This is also why the binaries are placed under different paths.

Thanks
Komal

>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 3003a47bd759..727809430fd1 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
> qcom/shikra/qdsp6sw_nm.mbn
>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm8150_l17>;
>>   	vqmmc-supply = <&pm8150_s4>;
>>
>> -- 
>> 2.34.1
>>


