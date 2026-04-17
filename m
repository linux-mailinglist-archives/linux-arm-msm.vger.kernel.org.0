Return-Path: <linux-arm-msm+bounces-103501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJpgOJj94Wn50AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:30:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DF419458
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 739BE302A528
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C28371CFF;
	Fri, 17 Apr 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha0enODd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8THfom1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBCB344023
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417792; cv=none; b=m8x8eR0UvTJ9MBfxBfeHh7eLm8aUV7IP3nA5s/YG5O37AuaJ4ZV6+OsE+pQ4InPblzdmJ+rJuvA1h66x71OjV2RcAuBqgNzgDViOzgz2mphN6TrxrimaaqAR9l0ccgh4k/abTBunEZtA48UJWBQbpx6E7KICnYgc1RunPRsyhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417792; c=relaxed/simple;
	bh=2shIHeFcFKqjZ95jW4Vx29dUWa6l9PR8yAiG06v4dQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5dEO1L2lem/PeqeG42g7mbHVDzXSWj4R/MvP3w0PD0R+0IFCQaHzdxeIxDVCfPAblzsmJBr+Az8rpgeKvUMYk1aWsEGCP1v4Rl4B/MaXpYg0P4SXlmcyq7zHIOB1N/6ci7tPJogW3mec0phEMOeNSPJpA73cOoMqWxMRy2dmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha0enODd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8THfom1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8Oa0C1981934
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDT6bG//biEbiFpAOOIJaupEFsvw4HKKTh0BeExEgow=; b=ha0enODd1FRFNQvH
	6166uSBHHlQ0nJi5he1oiFTEZsjlZcRWF7Rvk5OHwwo7thjAK9B7ICrafS98w/4B
	sOwwGh37UpT0ddYuXc3qcZTIKFG/cz5jExiS3/iPIk2vMOpU8KocPKFMJ1QLd57P
	LFoOkfvJn1UeMozmBCFf6MNcQs6GNHjXeM5vijoYkW4tMAyRHB0uJmvmYo07w/W1
	yGm2CAv1xjq7EbdzOzPlOOFjL2AczTlWJWqmU+kDxrKzLnZGkTwhsf/7atltpm/3
	ZreONYAwUgZVDVhuDDVRf1MrLeiVlUbnO9me8ZYScsoVfV4HvuMPJsKQYQ4fKrhQ
	u9SvBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jjm85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:23:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3595485abbbso559932a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776417790; x=1777022590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDT6bG//biEbiFpAOOIJaupEFsvw4HKKTh0BeExEgow=;
        b=J8THfom1FFwJZJRaTMg57hk8jxYLjInIhd0pt/p+WlZwe2aCxZDCmH83K8BslILMBg
         07g3EJHxY7YfQzW/reOgEh2esGQ9UWCsruyxNsz5DDumM5PuuhKrLV4VhyCosLLgYBmr
         8PkRzBUU6jAzc0vn/GoipadUTqB5h70vD1mX8zMQubyefaU0QFzyWALBrrUm3A3KihoF
         4txcC64oZEgCMNi9ZdoEsqGap8jEjB5BOL72GEU5ollt/AG3r9KA0jaUdQca78En3I+e
         MlEHeqlT7rU+meNZV/HLTccUN6XGktOF5wSJIU/y3JcWekvJ9rbpqQHzzkr91HWJlQZd
         XLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776417790; x=1777022590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDT6bG//biEbiFpAOOIJaupEFsvw4HKKTh0BeExEgow=;
        b=Ys5UJFiaspyNNnJf5S3ynhWyNG8qgD5QARwVVFnvxoMaPc0BxLT1Foi6cAdu9Xnlsn
         a8M6CVhEd+V5wwGFIdWtLYE8PKnwpM22ujLbAW/Mgv+hHlrYfyhXCzFgYw5pSRp7tyKp
         gIpnVx6WDqqjOZhesWmlt72LKXzBsP4fnC4N9rJmgAmddip6eIDLmIRpmq0iv1BOitph
         nMAvC9tfMjlFMrCyUn09P2wEXlmwy551VMyBgZCFj82BjZdD4XR2SD3QcZ3RooUzmVCt
         fUGVtHIIuqSbm3jJFQEbAzv4jfFFE2mGNU5rOPb12vqY+CkMx/vcG2zfCTYRGPR2R+Qf
         /8TA==
X-Gm-Message-State: AOJu0YxP2VKWU2+y5PLXX32wd9PRo7TIGTMPsaaSpv0dZ0+FeLECrGbU
	zSEgSGxUeCB9qSUowLvqs+Urpa8zx5QI7Vz9al0JoCIEylbF27ECLA94bcEyCnjLbXcMG5sCfzN
	xMX0DKohS6txREBoRpTU/DsUUKeTMjmhQUO3RPIo38MZZzLWFcNgWl70xsG3rSqCNPfey
X-Gm-Gg: AeBDies9+5jer7Ngo8IzGBk7bmoLUgqzHdHduyMzR3IYlFV0elHpesNLa9n6lrYz54b
	PzttkuBCKw8OYNjVgf4exmtkp3pzrVuQg836q0mgHPAKxF/oYEdHtQv+WKWC+BtoYBc/Jvx7dBN
	qFIienjhvaJTzm97Y+90iv3Okx9/U0jKeF0ReXJrEtIv0rN+IFoTQqweta5J/RwvaHZyI/4Fjdo
	Yv5nmL5c9QOpjIMZNsAftxEQ1CHlPMzpS5cMCvJYjC+IcbxPWExSn7LHvj8ZCkPYCHfCPt73TmR
	VrVYYqqd8qrthfH1oF2PI0DESxkL5lQU+OYpGE892RPxDCI7H548ePU1d8mAbhojt1T63jUYU6R
	kTpEhi09DsoeLxNWFAS4h+E8EM65HTFAEcuLW+FKjSp70mIETtPzYH2xz3gdgWQ==
X-Received: by 2002:a17:90b:1846:b0:35f:c796:ca5f with SMTP id 98e67ed59e1d1-3614047a264mr2204578a91.19.1776417790406;
        Fri, 17 Apr 2026 02:23:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1846:b0:35f:c796:ca5f with SMTP id 98e67ed59e1d1-3614047a264mr2204538a91.19.1776417789920;
        Fri, 17 Apr 2026 02:23:09 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba13a4sm568153a91.9.2026.04.17.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:23:09 -0700 (PDT)
Message-ID: <030ff8b4-c553-4e3d-84fc-30ae8bb24aaf@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 14:53:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
 <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
 <28108ec6-2b06-4b63-8e41-fa75b7858acf@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <28108ec6-2b06-4b63-8e41-fa75b7858acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e1fbff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V3ZMZ3GGzncCEMzdExUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: JHm9R-MtQ9sZ3nSpU5uuWlawFc8HSrxW
X-Proofpoint-ORIG-GUID: JHm9R-MtQ9sZ3nSpU5uuWlawFc8HSrxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5MyBTYWx0ZWRfX/3Asf9A1Gl1i
 8nmQ1ddrwfsER1AJaKngW4mS+SJEUfQZbglHcgWXlaqz0UvQClcEDM6SfCWZcTx2kif3TrIhDQ7
 SgMt4WOkuIryaTWHssvFPjPJxluyZalJyQTcAPX4fVF4buU+aivM73nzdkLc3776YRwQMfLgrOX
 zzZl73a3hUbldn/REp09b2cgmNIe3BOxBuxA420sPPUgMJQhBhTusITtkqHJDkeOFn28xMJdAcX
 P1/dHBEWTm5TPGcAkREH8fXMdLmCde566aqs8jzDZNqWYdvbXZ6viY+KyW4M9MU104CBZ6dZqyx
 LI4zbmZdbKJMdprmYfv1XXYKgMdvfwEzgGbY18IafHrwCv8f978Yohk+ath9k0ZXysfX4zkSANY
 0C/ZJlAhpn8gKeS2+no6Nf3Km+ZuxX6tEhriF3dcAxiwtmigYvaP3PfmUaBpNm9dI9eQOFFqZdk
 BTkx08lfVydF3futUKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103501-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,10c3000:email,f10000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D7DF419458
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/2026 6:03 PM, Konrad Dybcio wrote:
> On 4/16/26 2:26 PM, Harshal Dev wrote:
>> Glymur has a True Random Number Generator, add the node with the correct
>> compatible set.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c9d46ec82ccc 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		rng: rng@10c3000 {
>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>> +			reg = <0x0 0x10c3000 0x0 0x1000>;
> 
> Please pad the address part to 8 hex digits with leading zeroes
> 

Ack.

Regards,
Harshal

> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


