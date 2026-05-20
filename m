Return-Path: <linux-arm-msm+bounces-108682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIL4LbuJDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:15:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664C58B85D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49695302D0AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62243D3CE5;
	Wed, 20 May 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3ErrWh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX/paOfQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE33D1A97
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271791; cv=none; b=CrLYgggR0zpSR/YCSARNZQUQOMC4zbubYQ4/5Mi7qLbA0YHrSRdyEEkUJbfeOaSRJmDhVWZF3VwRft5qhG2wINjYND1+wU0Ij4Ny6jvDwsh5yQMOXhDbqwqa7shr1JBpnOF84S9iGwwmJljDqn5+pnpkhFOTcn5i1U4rOOkU6P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271791; c=relaxed/simple;
	bh=Hb8Ru3Ec5tQFrqQePI5nyGJln9JvgH9I3bGx/nz8IAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thk7ldtVr/6L82G8BlwV65gfuVKYc+FjSew16FMJzCJHq3W5X8enjEWe/fS14dIDLCdX3lRZk1eQRTwuwNU4L7b3D90lZVDbM/RDqIWSfE2MbCMrUwNY7F8BXwzW/D7auGxWwdUpPKPdwDgLiAZK60N161CTUsFwk4ZHi64tx3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3ErrWh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX/paOfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nWVj446901
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ChH+YiH1DkMdV42pQD6rWpCy1qsIy2yrGYnw2f4wJEo=; b=K3ErrWh67GfXqK2y
	WDXI8uJ/fuPbhjpQ88ROzzd8yFVc2kOayZykeyS2X/pn6gWlqsqfAzLr/37jCpIT
	TuNAKN+b35qttz+vyCv4WFo8EnAT2fvkkSwwuvlMr0EEGsePABulr6bn3lg5XLbV
	TGVLkxYYoZ5iO4Z4RRyVasZ80bCsTfyasnajjZ1AT8NGosazHvAIzlFIdG6hGgXV
	cTCSPbrx8mDdyiZhAun6Ft9elLAcrOfwSq2B1Au36IaEVY5Xvyaqa+XWHFArhjuY
	pzSmZm5S1eO/44lGq8yk2JkrQ7hdZEmNEpUM9/5644BayFGkkubDaKD+V3NMK0g0
	l02OSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg2ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:09:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f5edb7516so102106785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271789; x=1779876589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChH+YiH1DkMdV42pQD6rWpCy1qsIy2yrGYnw2f4wJEo=;
        b=iX/paOfQiJAKehSTkTklyxmjqhMMmvJWV5ew83QEQxk++d5lyfc7deo1OladvRi4Qo
         C9R4RXLcdxdG6PDWENn+J0eiWlF1H6ryHJuVRmOgOOar4aJWYDdLPud/YfdP7LO9XeC8
         jtR9Hh1KCq8eEc4lzAw2+LY0xfNSOQ/EODlwsJqNKGkA6++biYOpr5jaQATtVtODNsUj
         8nAh+HepqLgv9W+vFEyWQS+yM2I6I4nJz+AM4A1ydfWvQDaYbtwPlQNSPT/K5diswWAE
         wSDRPWboVVILe+uO8SkUcCU8DuGcj09YlG6oe6DjBHY0I7v+UkIF3oLchwHtOibc6fjp
         /xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271789; x=1779876589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChH+YiH1DkMdV42pQD6rWpCy1qsIy2yrGYnw2f4wJEo=;
        b=X7sk2KROaPdb4HX+H6mbw7DnHqs2z99Jt/WH+h2QognG7ZayyN1SUZX7q5wgmyGZzX
         UPlIPXRDKjCezPQEDWOLSib9hykJhkSZsRZlYCj622fGfD0YXE0mfniaMQdgYRvNleYn
         qqSDEnO87YIr1HstagE9GrbKEd6IRfEFTqBTjQsZGnNPPnQRvq1zFq/9aAMKclbHchXU
         mLt1EzTA0AKn7uNoB9PCneNlrfhJsovMNvwxPtbXjFuV7AEwRMt7kdtTKvBgIY7e3Tbm
         BOT1LpZl+rrV+XmEyvXNCzv1UZHC07wgDxhHoIqhcQbJPTCNp+f1V7wR5y+6DqfpkYL0
         jhtQ==
X-Gm-Message-State: AOJu0Yy+vO/BkP8O/CD8VBgoZvM0wkHjSo5s+EOCcQ437Oory/0jnvmR
	aP2umFOUUT9pdEgv6IyRoFkSeJlba+1I20ygB7pQbTz9fJBxChPHy3skGFx++yCYsac1ecF+ZbY
	zO5njEEWUAUUV5wjIXsxywqGzQJE69bNpXdqT3B1s87fFOjQScGVHmesiFxFPBgodHNt9
X-Gm-Gg: Acq92OFuMhlH108j66SzZ6UY9OvxmbTWvsvfLu/SQwQfu3qrMJNvBV6b12faUpUr1dh
	95jmY9+KvY7+2iqdn1k1hasPRgsp5qkadRwNip1eQ9tA5PAPPXeIC8NNMI7a2Zsbn5Blc64Cin0
	Be3I145mfBgheqyPhH0D/W+tZ0xV7e8seodhwspAiFGV6BlzihYyD12W0i+WN6YqQdqC9SJBaxi
	KghIxZ01ssrefVkcbVA1EMqXgdNNW7dW0xYinUsko8QLKnFl5KbtmZAQrlSRV7GlHVZ2Xyn9KZK
	HRd8/6M9tvl/YC7K+11++L6kBGLBTCq/xWrz06LeV/pDI3P1fGMY9hptWy6IykXm7QlShGdRZTj
	gR6aBCWUE2Jy0htoIC5OfGL4u8lKzEVlCheJQC49ZLWksodWmIqzcjKvvR7PPIb1DK5bKQFktzL
	eaxGk=
X-Received: by 2002:a05:620a:1a22:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-911d180c177mr2220752085a.8.1779271788776;
        Wed, 20 May 2026 03:09:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-911d180c177mr2220749485a.8.1779271788355;
        Wed, 20 May 2026 03:09:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e4d54dsm830421966b.47.2026.05.20.03.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:09:47 -0700 (PDT)
Message-ID: <967d8640-765a-4d23-8806-fb2f664ff3cb@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:09:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 17AAsL9xEwmjNwCCg3RWZWM_VrE8uWPk
X-Proofpoint-ORIG-GUID: 17AAsL9xEwmjNwCCg3RWZWM_VrE8uWPk
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d886d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ol475T_WYazQVyRVlUEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX8mdomHNC2Jof
 uHXbSndU+kS8/ubFV7UdHJl99m32Blb2x90FWPs9CSSsGDvBgN9zjMbRqA3q11/BmERi/dQg6pM
 +ahfP/JmCyHP14TrXrK7HxzL7jQnJn96k4sRYmp35olXeO5KyCmLb/+hNoR0v1thl8IdUbl2RfK
 Ge2kbRDiATkCfyg87I+6Ia8TYQcw6BcSGPp4r4w3KzcWD7ZIYpUQpsd+MP28FV66KLZl72+B9ov
 NYDnan8oghvr9doZGo7uBYYMGQgcHdSRGUeEzc6HcWWwexuX5YoDT8+I07PrMC9ErNFPWZLhNfB
 PE8EN29I2wybMCRmNGoYnsuT+CxxIwgz2ECf0N9uoXL0eLCXvFCwWUe/03nQrfBbuP5YAYPvIP8
 r6vsNlm5NbANH8EhTJVYu/KhzQhLfIjNFEki9ju79mcVDyKCmMONZxotM4EZk1kjeNFiNVlFdBX
 hhAfW6whzvz2aJmOXIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,d0600000:email,f8500000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108682-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1664C58B85D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 11:54 AM, Dmitry Baryshkov wrote:
> Downstream kernels for RB3 Gen2 don't specify the RMTFS address, instead
> the kernel is supposed to allocate rmtfs buffers dynamically. The
> upstream kernel doesn't support dynamic allocation of RMTFS buffers, so
> use the fixed allocation. The RMTFS node (and corresponding interface)
> is required for the modem DSP to work (which otherwise would crash).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index ceb68a890bf4..37a3b51323ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -165,6 +165,15 @@ debug_vm_mem: debug-vm@d0600000 {
>  			reg = <0x0 0xd0600000 0x0 0x100000>;
>  			no-map;
>  		};
> +
> +		rmtfs_mem: memory@f8500000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0xf8500000 0x0 0x600000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

