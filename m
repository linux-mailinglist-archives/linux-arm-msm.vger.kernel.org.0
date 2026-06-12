Return-Path: <linux-arm-msm+bounces-112934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +vvRGFcDLGpzJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:02:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4967998F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:02:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=d3JrJzp1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112934-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112934-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B7EA301E3FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DEB303A35;
	Fri, 12 Jun 2026 13:02:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB623DC875
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269329; cv=none; b=Kj8KKkYXxTWagyjt4Ajp7gfxpNSRFptz6O7j5wAWk2mzEjViyVBBcBEZkWKY9ISO/yIUUq3I/Mo9/wF5uVbHWEOJaveA2wmxITgwGap70gJAgNAFeqLwXLX1bIwIaiftfOTXmUTCBLoFByFT/W2XEgUddakSqN0f9w8OarLJ8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269329; c=relaxed/simple;
	bh=BqUHj3OyZ5XxeRrjjNn/bQIx3mif9N/UHlTx3xGLarU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0ICAdOZNJ/1cv1/3eO8K8WEeRNqAmvLxZgwx5aC0G/WVA6EFowaSbGWJLmk6V+oEblFKNEkCbiP2N90dlTAlnOTCrgabbRKStxJ+RBtOzk34lgJ/4UwOkiKegqTMCsEO/BQ1L8lBOVjXthwlFimpfXTmL03u4+UEZh6nOQvy+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3JrJzp1; arc=none smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so133003e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781269324; x=1781874124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tJu8lRphXkXqJvq1i24dWnhS2R0S2p0Jn7kZcCwfdk=;
        b=d3JrJzp1rK+pYlXEoYfHHrAZrrFMeLEyTBdbfZaEj4PXKE6JhOgLNin5q8VAeUN0jk
         8ltg891K+veWmUjaztQQk6ms/FolX3DODDJw72SOQM6FPI4CfuNsnElI1xG7fXjcdU5w
         nT1ffqD6GaBj+OgK4gWnFWltcgyNiXqUlmRUuEylxP1ykuvnJlJR5QF0LMC3oWJB9Kx5
         Pc8oK7Mo59lxhbTQSwuC671tUTJOLufqLhgyW1CrhDYxO/lIt6Hwde1gU9xp2OdConkQ
         UZ8FuTHmwkTfp+gGRfjONWXVz6DEiFDn7uS4hYR4NuyLVDHdKVcCHjwY9SdxeifUKGM6
         1thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781269324; x=1781874124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tJu8lRphXkXqJvq1i24dWnhS2R0S2p0Jn7kZcCwfdk=;
        b=WuMziTR5+n+qm51X/jucnundjMRrD08kR4eXDS5NkSZ7tnymxrHoyQ/5deKWX6gcDz
         CETmOv+WNBEIU4XoE036FvHaJu5kiFtmj+wcrji8tLorBKv84F2cfihNEzQshxkjwOKC
         8JE2+6JIHTqBaaQb7bGsuEOELVyO5j3LRvpiUrOA+oIN3BvDtw4aF/vWlGtf4sFLlUDl
         VK8nciTMg1Cd8sW4VewEBI6Ce6HrXBbVy6yLw4HbTE/YHRwGtWjXlKXLbAhDN86R9M1p
         xvFAwKLEyGdT8VbIRxJwLpkkpu5FyfJQaFG9FFBg4MsbrSju+o5YcLk2SA5b/BmtdGW+
         bgqw==
X-Forwarded-Encrypted: i=1; AFNElJ/o6D1DCEnyhvpU/TY3jr/qClmYvVCxrFGARiYywuM0Txb4v79z9TLWWV5/Zn4IFnFyo9yH7tVMZJPCLjVm@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/Gm7zHqNlqCN3LuskngmmEZMDOVgAjKk3+L5VKqN49TxK77+
	vYmcw46ojuvSHjL5b0PjYIlDike53gDSIsQNKBi/SiHeg5Krt7qHgFk3L0C2EdbHPuA=
X-Gm-Gg: Acq92OHaSkNosYV9rvFKG0o99VGhA744JTLg4Gw+it+gWbMyJq37BjLlJnc0M1XNZQJ
	OTRCbuqKlNGd3pNMsfu8VP2LrAh11/fzTfnE+kqbtBwuqszke23L0Pr1IPjvvKQlfNMwwqhIlpj
	VwNX5/de7ueSl/PWxh0R75115mdIk5RVUO6b1l8FtXDMBKc8+crxIyAUfCbdW/6iERtYiaO+ekT
	0y5oKtPtBuXUX/HMqh+Ywrl36dJjyuY5Zq08Jn127KBAnmmeTlHD3ZePR1yJfPNKbI7B18NPfRr
	6Y5wx9smeKdK7h7D1RbxtkeEceWr9AMJgz89EfCVXl1yhf1qQBbPRXBEBlr/mUcsa8YMxPPanfc
	JLqlmhrBsnQYZFWNfUgv4ukymexymainIXRWe33zOxfk0KhK/q0q4b6wiJzSGfL1+QgW21SvMyM
	d3W8bGdiKB4u5PBtrQ+7tJp4wwPtgiZthmeYDUtRI/uNiX2Z1XSgdJER44Fxgc8+w/L3ib7G9Pa
	PNRFA==
X-Received: by 2002:ac2:414c:0:b0:5aa:635f:7c08 with SMTP id 2adb3069b0e04-5ad2db710dcmr281855e87.7.1781269323606;
        Fri, 12 Jun 2026 06:02:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e170d4csm538304e87.33.2026.06.12.06.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:02:02 -0700 (PDT)
Message-ID: <ba610863-cd38-4c31-bd6b-0748c86adfc4@linaro.org>
Date: Fri, 12 Jun 2026 16:02:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112934-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61A4967998F

On 6/12/26 13:55, Luca Weiss wrote:
> On different boards the cameras are connected to different pins with the
> cam_mclk function. Add the definitions so that mclk0-5 are covered.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 62daef726d32..903937947811 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -6505,6 +6505,27 @@ qup_uart15_rx: qup-uart15-rx-state {
>   				function = "qup17";
>   			};
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio64";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio65";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio66";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cam_mclk3_default: cam-mclk3-default-state {
>   				pins = "gpio67";
>   				function = "cam_mclk";
> @@ -6512,6 +6533,13 @@ cam_mclk3_default: cam-mclk3-default-state {
>   				bias-disable;
>   			};
>   
> +			cam_mclk4_default: cam-mclk4-default-state {
> +				pins = "gpio68";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci0_default: cci0-default-state {
>   				pins = "gpio69", "gpio70";
>   				function = "cci_i2c";
> @@ -6578,6 +6606,13 @@ pcie0_clkreq_n: pcie0-clkreq-n-state {
>   				function = "pcie0_clkreqn";
>   			};
>   
> +			cam_mclk5_default: cam-mclk5-default-state {
> +				pins = "gpio93";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			mi2s0_mclk: mi2s0-mclk-state {
>   				pins = "gpio96";
>   				function = "pri_mi2s";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

