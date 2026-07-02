Return-Path: <linux-arm-msm+bounces-115978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2bqyBXJPRmr8QQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:45:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CF6F6F0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:45:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LFzsrvZ5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ARS4i+kr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115978-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115978-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83098300C006
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9905D46AECF;
	Thu,  2 Jul 2026 11:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B3425CC3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:45:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992749; cv=none; b=hPNbkUZv4mqdFPrfScmVRpe0Aka//Y1J4zNxa2epltO5DjCj9jQUZaP56VWe2kY6dQxX9dprNA+HGXbeKdW5s6e7CYl59sEJQEi7WW26fa12GrIB8HWIcayFj3CjZtbjrZAqH9y6E2w9j8nJQbyRNfN2wfXXMnwsTplvfsbBCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992749; c=relaxed/simple;
	bh=wOlWyg/m5+WBA5guaBklrIRBbI18xdA/OgntwyXfss8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOmM7uH1gGIrwJbGtIlSNP0lBas1V3H95T38K3HIlroIeTJPMWG0jRhx8uYuSfe3ped9n4hzLuCdm9s5oaE3ywpC0Om45XtNrSG5kdZXLR4eC2O2AHRQOXIMLyOZfrgL+Wf95QASPiHNQBlBfEx06tgIC5b3kx8VtW4sEiSFgYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFzsrvZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARS4i+kr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AtAM83591717
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dybK6HRyXiWQKemurPx7YNQf+boY3o1Qdlwxmz9ca4Y=; b=LFzsrvZ5A7pGSBNk
	XWxleAYj5ipCTX633CvsB4kd5ZsE0n/g0PxT1Ct1374Dfucd5rfRUEvUTxXV9v0s
	qERrTX4CM5J6Cbnu5l/V76DZpEXeyMKC9CodTOnaq4m+p30JPdFtBc/VS4R1kuZ7
	naXWRieOu3ghYbIwbFVR62CHmjx4xN1+uBXFgmRNzDdi5XuE9oL+aPm00IRi8+BV
	ZtAdhfodnMIybkddG/oryYwwXzTAnD6ww9uUQR39jyh3iH+dnuKbrQZpMXYBnNo3
	NDugDpV9zl8oO+0ozXUHj1SStEBjYiiy/agn6aAwvXi2rmtwtCIl4USLJ306ZkYR
	XmhxOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9h3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:45:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6b97afe7so44756685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992740; x=1783597540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dybK6HRyXiWQKemurPx7YNQf+boY3o1Qdlwxmz9ca4Y=;
        b=ARS4i+krX7ckTiA7ylt/PLsfOEy+1tk8bWx/BeJOhnidX9Q3CedtfNoi7YzkCnooD7
         AzbvBBnPWrCZmANAaZrCDU+AMtgNL+L8g5S0XWcEUlxNVQom+WmmJjDq3UdltnCucTKh
         Xu4vnXHtiQaoApy+u7JuQ+p0DYOJLYzH/2CWbpugW8bN7hwXDeqR5m8PIG8SBdvDw7fq
         4cCJ7Y8mpVruC8fedrFwHSewyy4L3Xhz+xS8QdjCkpgOQC1FVAuG5Ha5qt/MoHRMZThi
         OuptT4HQvuET2yeUyZISjP3N9qcER3ltKEMPSeSC5aOaNAHO6jQOmWC5VDSwGRmSGZCR
         l1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992740; x=1783597540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dybK6HRyXiWQKemurPx7YNQf+boY3o1Qdlwxmz9ca4Y=;
        b=H01xbjMSCCugT7eZQlWexJX5J0PX1C9F0VqNwvE9BIZs+EqzCHnarnvmQQCKSJnVj3
         xq1wz+Sit2rerXYHlYwWH1Fa1l8RBt/qDZNpRZhJtu+ILUuPSB4vX3Lul9uCZtyJCHjE
         0JJjFOiJQFVymbO9HHEkSMbBTaM2CaizTGRq5/8L6kiTTjt2vGKQrLe6KC71wa/KkGna
         0D0QKI5C+MLGeQr6/jRSVfqhwyIa21o+L9sOAc3sKHviAQ/nozS2XSgx6f/llfoIl80A
         4vNFB2sxxwJnrwOta5DNRpFnQ0VnzbwajBUL6lSiRnUR4i+JmY3osjtSVJSYqi0AQ2EN
         9LFg==
X-Gm-Message-State: AOJu0Yx7BQvZjXq+JU4o8926UCt1nFS6NW+/HTUzozz9caEmIUMNE+M7
	sdQMcwgrwKXb0gKejnOST4r0QwHYsTH4rEodHbZ9gB4e8OlNefmvaaJfLGtIHdn/UV+qjGHz/jB
	B0bYJfv/A9A3iUoXlCqsHq1ZJjGpiM07q3Llaxvdz6GHCFE695xy+vWDCJyeibvTmHY3IAMq0fl
	IX
X-Gm-Gg: AfdE7cnxxkWdH88GZOMAeG9dq1CjIWiQBUP+4E7dUyQ5lMxnVLMqO1ZQwikYV4hj6Y5
	FQLmvepNn1xDZm6ttKMAhNevqFu44LwLPACn5I1tjwY1IYF525LyJ/tzxHDN0blRqtWDQNLdvEA
	V93VVfycNLEjdb+sg6XZcCTPPQ0HH4D4wEX5bGMFR02OzX7Rax2qQgjxLAJK3H/UQL8i5CzDUXR
	nx6pQ1O0brixcOu7msKtN7AFK8bWezvjnRej8tmGQ8E8/xG+6SZnS/BLLXvb0XgZe55IXc+RA7I
	/wsQm+1MC+Wl6FcxTsoHQam8GxVEaxzLlkPrup0VZMA3V7Sh28j4rCAJbFNzuRzdbWJ/hLbtTI5
	LGAF8qWuhYXNLT2EWdv2SfKe9QbQttobD2do=
X-Received: by 2002:a05:620a:4612:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e7809b875mr489467685a.0.1782992739730;
        Thu, 02 Jul 2026 04:45:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4612:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e7809b875mr489465285a.0.1782992739297;
        Thu, 02 Jul 2026 04:45:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm117572666b.19.2026.07.02.04.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:45:38 -0700 (PDT)
Message-ID: <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 13:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702063156.35169-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX1V4jIypQKRwk
 GURe+7u2UI560/B92TawDG7KYoTWWyV1ha5ujz9VMr9xGHzLtr8ynFR2SaowwEbMJP1E9M4Idgy
 S25iPJ3PUHYeZ9NhQhKVgJ+wnjRD+YoXddwbRHUemkqbuGJG06MbApWeqSBzzT2K26x7brtPioo
 YeIh1Bl30cRqEuc2dgP6Ek6wIjVu6tWgQdhN+Nydkt1O3pTKvMCipRhRiF7xQSzblsqPSau93di
 UiCwij9YoifHPvSlIjfA2h1KQoSteZYgLpnVRXfGH65bgwPbaStAv7+8dGjbkyGHNav335ubZjf
 QxU7oDv0kCHn7m1KZrmWO1sSIq/u2oKGilSSERmtmn1jvJg6A3bRW5LwgO9wp8MYMC9TMT1T//m
 2pm+KQtTCEg/uSJWZanuRlMBv1+tFIw3+3N3ytEhyDVAQdvKBouYFgnsDhrNadwQluRdIkYsUTY
 TByZk7Zz1u5ziF7XxzQ==
X-Proofpoint-ORIG-GUID: -neAlUs8nOGVdmtn8Aywt9DSAvIQCJEz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX9wded1dzpdvp
 Ea5O1tR5Kd7cFuKoEC88VT+P5lse3rT9IZXFML1p6ah1Ikk1vRez++5fF5hkoj8hr4bUOU9E+Db
 ttuRaXGKGw0p2qDwGgSWugdx1JrTITo=
X-Proofpoint-GUID: -neAlUs8nOGVdmtn8Aywt9DSAvIQCJEz
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a464f65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=R6a7uwYVqKW5caTnw1UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaipeng94@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 954CF6F6F0F

On 7/2/26 8:31 AM, Kaipeng Zeng wrote:
> Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> This device tree implementation references nodes from the x1-crd.dtsi.
> 
> Supported features:
> 
>  - Internal display & Brightness control
>  - Keyboard & Touchpad
>  - USB Type-C, Type-A
>  - Wi-Fi & Bluetooth
>  - ADSP & CDSP
>  - Adreno X1-85 GPU
>  - HDMI & USB Type-C display
>  - Webcam
> 
> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> ---

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		nvmem-cells = <&charge_limit_en>,
> +			      <&charge_limit_end>,
> +			      <&charge_limit_delta>;
> +		nvmem-cell-names = "charge_limit_en",
> +				   "charge_limit_end",
> +				   "charge_limit_delta";
> +
> +		/* have only one typec */

I think this comment is superfluous

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +		adsp_fastrpc_mem: fastrpc-adsp {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x800000>;
> +		};
> +		cdsp_fastrpc_mem: fastrpc-cdsp {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x800000>;
> +		};
> +	};

The latter two will (likely?) be assigned in the common DTSI soon, you
can drop them


> +
> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-CRD";

This must match your machine

[...]

> +	wcd938x: audio-codec {

Nodes should be sorted - by 'reg' and unit address if there's one,
by name if there isn't (minus some special cases like GPIOs), see:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +		compatible = "qcom,wcd9385-codec";


> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

in this order, file-wide, please

[...]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id = "b";

Have you verified this against the DSDT of your device? Incorrect
settings may lead to hw damage

[...]

> +&iris {
> +	status = "okay";

You need to specify a firmare path

Konrad

