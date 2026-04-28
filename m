Return-Path: <linux-arm-msm+bounces-104940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AzzEOGG8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:07:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8C4823A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A950330A60C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5DF3D8121;
	Tue, 28 Apr 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGmRWLkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR9adaM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A93BBA1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368722; cv=none; b=ojNyyj9NN7QjZQsT1OU5w6MjwyNv1/ntuHv6kK07U2xFOX5NMrWyraKcKXhBQXuYRJxVJ4e8bG1KmN08PwIqPPm1VO++TtAVy5EOTjZJo/IscvJW+yEmw8Vj+w7gNP0/D0N2/Zn2adl4HTSiV47i8lVtGlMQ60GZq8GUKTCImVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368722; c=relaxed/simple;
	bh=RTNGG1oBjylw5WInHSS/Bhmq34TlF2xruXPC1zPQYu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMHBuGWINPx933cN0a7phh64Oi5ioZZdZYXVMEXnTeWQn5ZBUzaCPbrdSdplaKT1QX2pCHgtua6hZ4qIMOMMXC3zfvJcD5hjgHEuMs8Kl9CcW+ITFR7AQqifFXOyBa9yMCv2m7HruAEr5a+81duDjZTcswZZZ7Qbc+1NU0/f9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGmRWLkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YR9adaM1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4Jo4J429177
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCix2WwSQZTaFU6BabqTi+usW62DHqdG6ZVKuM7pkp4=; b=KGmRWLkpxgKDdl5U
	azdoUMZIS15OpVD9UdTI2seB2A+pveRUqgyL5htkHzur4xDEkw5ZB1US99e7xBvp
	8EpsPzFMtjLMQV9ZKB6Cn9rK9d7Ln7tKKYlu5SSei2Xm83P7ClcXCR2ghw42lP5M
	0JNWMyboMFPA9HVv3SabqhOU4MZ5CPl2SezQeaGvNA1j4kzrNXExhJscifDEgEcX
	BucXH1MTrT9eA6SzdgISXaZhxR4lxfVDHPmBuNw1tZDtHWLHWxEK79DOYF9RzfaK
	XIDC8HDzHJM5b2sxwyEgOQcFF0422eXbf5N6WY+J7QjaLFBfdxe1pDdcxJL8dizG
	SE3flg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x34cnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:31:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b2156efafeso11715356d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368719; x=1777973519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCix2WwSQZTaFU6BabqTi+usW62DHqdG6ZVKuM7pkp4=;
        b=YR9adaM1mpGa5JilD6BI/H8bWRDHvD+QvLroolE29xQa7hvMovEjJ3QGpiWPTGjBWb
         oBKYN/pw8U3lZnMbrqdwwog1lsheyehtEEBt9IdfKNtcw3Y4Dt6vRf5ZHtupvxjr4Ijr
         dHsBq1k8PPJklouFFU1mxjsLptvThcvgc5JNlQMwhS0zgUH7kgZ/KYYNBqgpTIp3xLRk
         8AC4H9YIZkYykCLh+g+qqFBZvCUP3aFEfEbPdvKKlKIo50/9NbDLUOVzITpF6L9oF0bV
         83krT6GtMWOmJLBTNXCY3vbnbLf+aKzBJJq4HMX22bWpk01iQFMaJ4sAqsN6ihODuNDC
         MFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368719; x=1777973519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCix2WwSQZTaFU6BabqTi+usW62DHqdG6ZVKuM7pkp4=;
        b=OlwuOIElGT5Yrw6rG/9ivN/a9QaNMNyxnzlCdcM/ih5wF7R5HtIdr5EVOefRpTbekz
         WeOwRn4Eb+WQDxPHI3GcA8vE4wsxQ/Yj1SKgUbSDvcUvt7lu8brmtfawy1GoawPMcecc
         nBCfda6nGQN6wX0GguGmeGRwipJ/fs8TEcgJl9lUxoTa4rF5qodxBmdhVd2c8q9rzn+x
         NcR2tCl7sxji1/CfneDEK4LBIVws6CtJtqZjJLKq9tt7iMsqCQWUYxnihSkL1Sw1W5I2
         f49M4JiJAKQXC29urtgbSgaKjcmLzsHWIfcr2k19pC4qK2ks7gbrXVjikffRM/4auv6y
         1KZw==
X-Gm-Message-State: AOJu0YxKrMd9LTZ8syql2zMbAylE+sTGTOoqf8KZvm8LXokMVBKnNTuh
	mD5EVUvaKWSLNe1xkdc/8VJfkHIcwuVnPkTXV4AOjeB7hGqcbrUjJ4/AbhvOweQeTCtmql1czvH
	kvMbdINAgGTLPBe6nGDaMZQeftrwEJ4YfmagEt2DXL19LPXPfIkX2cNvc1OdPbgvOFnpj
X-Gm-Gg: AeBDietLDX3iNuqF34SEGsNKOS+5hpnTpz+PNHgH256Wscr0LskdN+1WlKTnaS94WKY
	bpj+luWK6OpazSaezcfV+Y1zx+x6Wtl7KnQrzzivCbNx6fIv6jylWg/StllO9AX5XZsRQA1x8L7
	H8IAc1vZwCvJq8Y2lddfM3VU8LQ5VlC/HBQ5IDJSwNEwb3Dd1GtwEBf7rR8NzG8H7byIdFnUpob
	dD3hGsomZeAQncXZEmjtMFGRVyU+hBguzIip8BiYjWZRmw7TvSqaKmnnd6KCnDHvNuSjPr4IlTO
	C8vmyZj5etW/xhaa+lQ54VqBh7m19y3uUqAvgVj6eOqYDF/dlK8A5J8b3RVVhnp/RGXzEqhrmAs
	u6tlSDB5zcBxQkQK+wRe4Rl8e+L0cOo7jvXlSxUmp40rkBZE0TH0vAY/9/54CHax+nC3Xltqnib
	9TBeB0As6H+RkB0g==
X-Received: by 2002:a05:6214:629:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b3e2a0dfa3mr28573726d6.8.1777368718951;
        Tue, 28 Apr 2026 02:31:58 -0700 (PDT)
X-Received: by 2002:a05:6214:629:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b3e2a0dfa3mr28573486d6.8.1777368718524;
        Tue, 28 Apr 2026 02:31:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c081c40sm74244866b.55.2026.04.28.02.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:31:57 -0700 (PDT)
Message-ID: <828c59ee-c30e-4a47-9ff8-6fbbe05bbdde@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:31:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART
 node
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MyBTYWx0ZWRfX2fGdWBVKmBFp
 yUcFG42jKISTFQ0mqOwUsSJ5DDhRd9g2YVhO/mZ/RZctJcwWDsbtr07pMmRoXTOQ8grGu1lo5n2
 tHDrC/+eAdcp5P5jV/c05nCUdOuaRJ5suk9mqmIWy5LCR8zQhvKMcMr/z+fvSNLJRHR9TQkO+nq
 yZds0LT6TQXWmhIszH7JLP8CWA7ob/8TP6ciOdI3lKV1Go5ZEZ0uM8Jd7mbQ/DLVQWaoYRGopAZ
 3NPfAIRuFhrM6O7PjMPQ9tseYqc/KEXYLf2kYeg3zruo1Ed3MbnDD2x06lKMqAmQ/3EuGM2olV5
 CoO9FVdP/MG3o8BlKXppLmp5NEJwximMD6UUwgYVn8i7kjujFBR9Ngy6LvPTyZK7PJflgh+sHRV
 Bel0aLOb/kANwEEJ/U9LLkLt4964cgyYciZrHjnrwCIHHsO0PQqWq8MbdPZ93l9wu16LkJprxuh
 orovDB3e4bp2z6XGD+g==
X-Proofpoint-ORIG-GUID: 5psWEfapiMt28CYxSfTJqv25WjKOnJVB
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f07e8f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=U7gHpUSv1cUObH_NKCQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 5psWEfapiMt28CYxSfTJqv25WjKOnJVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280083
X-Rspamd-Queue-Id: 23B8C4823A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-104940-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 4:56 AM, Shuai Zhang wrote:
> enable bt on monac-arduino-monza
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

This sign-off chain is invalid as-is - should this patch have
"From: Loic"? Who is the author?

> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4..092ca0b59 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -21,6 +21,7 @@ aliases {
>  		ethernet0 = &ethernet0;
>  		i2c1 = &i2c1;
>  		serial0 = &uart7;
> +		serial1 = &uart10;
>  	};
>  
>  	chosen {
> @@ -454,6 +455,16 @@ &uart7 {
>  	status = "okay";
>  };
>  
> +&uart10 {
> +	status = "okay";
> +	bluetooth: bluetooth {

Please keep a \n above the subnode definition

> +		compatible = "qcom,qca2066-bt";
> +		max-speed = <3200000>;
> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
> +		status = "okay";

The node is enabled already, because nothing disabled it. Drop the
status line.

Konrad

