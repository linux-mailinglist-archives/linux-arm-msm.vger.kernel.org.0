Return-Path: <linux-arm-msm+bounces-97101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JnbNJENsmnuIAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:49:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480D26BC17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B5C2304F22C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447BF2ECE93;
	Thu, 12 Mar 2026 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="P3w8HCvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD453264C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773276556; cv=none; b=PvQcADRr+Zd+H1bmjwYsVD5Rja+R8ivzXzOju1ERWV8dZWpBDc50VehK1UFKCQA67uJcYiF6VPiCd0idEXiiVoc2by3nynKIy47VQy8yodl1lCVT3l3U+OelZztJPZfBbuu9g7MPVZ9G6rzcULrjHJbwzQT+mMDQqKkSz5ySelo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773276556; c=relaxed/simple;
	bh=jxRiM74xtktJ2UsuXQWMdp4RWyhOuG6IadKGbymRflo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2Z1ug8bmTZpkuhy1s70Fd+mZHaKZEwANkijpN9ncOYTayliz8Td0ir6GkWut8lVOVzx+IxkkC+941Qzc6W+bNKxtLF2zdGlphj7uDcAhz3bRrDYZBaS6l1KTgoNMr+76aUYobwsG5de9ykPdL9qeVVUXD79BRXeccCyUrFoV0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=P3w8HCvm; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773276542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8a5KXG/hMVU/lPDot7HGqxD42gLldyhHtK4z1zxunk=;
	b=P3w8HCvmZfl123M85LGVf5P8Uj/NhppSQzV3BD+MoSHdzvbwejMXQvIbJup59gNsPw7NWm
	8r9SIPbzmr2UZrW2zMP3Nx5h366edQdo16WHaUzNAo6paposEaDOovdn1s3RWXTe+LlV8a
	bKwofOpnzUdD2a3K6iCF9SitMLKNZTg+eI87q8DAzXbjwkx/tQ6OiDBPHiD/qCujr42Cse
	JbiO9i+brVjwSiGtG6QQZ6v7t4Vz8cATa/n7knn1/RrK36MrTG3ON4XauzzEe248MD7xC3
	skmXh2b28LJ3r21JceHjJXZihJATwvqC+9vGLTgO1rE6JGky7Usy8R1LPa5w/g==
Date: Wed, 11 Mar 2026 21:48:55 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97101-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sobir.in:email]
X-Rspamd-Queue-Id: 3480D26BC17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 2:44 PM, Aaron Kling wrote:

> From: Teguh Sobirin <teguh@sobir.in>
>
> This adds a base dtb of everything common between the AYN QCS8550
> devices. It is intended to be extended by device specific overlays.
>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 ++++++++++++++++++++
>   2 files changed, 1778 insertions(+)
> […]
> +/ {
> +	model = "AYN QCS8550 Common";
> +	compatible = "ayntec,qcs8550-common", "qcom,qcs8550", "qcom,sm8550";

Huh?.. All existing -common files are .dtsi includes without their own 
model/compatible, and the compile-time "dtbo" support is only used for 
EL2 where we want to apply the same thing to many many devices without 
polluting the tree with extra glue files. I don't see why this should be 
a "common device" with its own compatible string, and not just a dtsi.

> […]
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	};
> +};

Please use the &gpu_zap_shader label.

And does the generic zap actually just work?

> […]
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c12 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
If the individual devices actually use these busses, better to enable 
them inside of their .dts as well I think?
> +&iris {
> +	status = "okay";
> +};
Works with generic firmware?
> […]
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
Current binding is to put these inside of the &pcieportN (renaming 
'perst' to 'reset' which I just noticed I failed to do for one of my own 
files :D), see x1e78100-lenovo-thinkpad-t14s.dtsi for an example.
> […]

Thanks for this work, very cool overall!

~val


