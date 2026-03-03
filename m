Return-Path: <linux-arm-msm+bounces-95220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFYEFntmp2mghAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:53:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07E1F82F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2392630361A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 22:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D3C37EFEF;
	Tue,  3 Mar 2026 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5U4EcsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27BA384222
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578425; cv=none; b=tZpF7JZ3Fh9r/qSlDP0MIE+Bp50n0bD9ky1c8TFC833tLFFQ22WA+tpInYupuwTUG9g1bLJeTQr/XQH6mDF7Q7V4lzrWOzPe/TTGEcV6KGbXVpwS6UDR9080d8UdmpmyGiOBuDhlxcU4qYy0UnDHqCgEkjetdKsgZoP64OmyOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578425; c=relaxed/simple;
	bh=jLuXQS5uqPs5ikIuKXGCNbVWA/IDbgIXTJL0nPYHNNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbduCEFLmjfeNkYZwjUtnR595eEjo0oatkRrh3HeLeDjhtYe5rSzwCRhat5jK7gP0TTtT/0hSZU2QPmncJBXPyC4ZlUftT4XzzUFtWyOMrQ9B4lvY88LYEKGyVYbcxLLyGPgu+Dr2MkfHrI1wXTHyW7924QlAI94Xd73pBMW05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5U4EcsH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so1665685f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 14:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772578422; x=1773183222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YS4rmu/Plq/GT8U8U/B/TnIeQy/JnY6psImqbAy1u5E=;
        b=u5U4EcsHE16Zna6ek1DZ2UZPoG8wkYa4KoK32TRJjGyIobpWvKL6ENvB0wQINrav7A
         bKsaK8W6pcU+hpd5DYgcknTTv2/av7UC8PeSGp435tWGP4KV0m6HWdGqN7djvzvkqwBj
         4SViMdsNd1yLIdjV/Is4BSFbcdZ/WBuBIUky4JkmvTjnv1YuTaJ5kNNWYAQ0uSZ0n0sJ
         v+mVJ1FrSm7F0ytyFp1qWSunSfxVJQvwGEQyXBORKs5O29l8tCzt+k8TGgBHcxdtTe84
         HWnT6q01JQyIXypUSNkS6OmxGTvRXwBdUNRCIFICYnOakK9o5FibaJEJq1G7nBaBT33N
         d2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772578422; x=1773183222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS4rmu/Plq/GT8U8U/B/TnIeQy/JnY6psImqbAy1u5E=;
        b=nZcCnh/a23fLLiu6K11scCuva9CnmMBgC1nMLtlknHmHTSaZrtKf1TnxURCZLMWT3V
         TqqBYSMTx6BKFPeaw87hYL4EYArDVil08Y/0Jn04H9/N+bmfbv1lVdseDSoeLiKgZfyi
         OSZ1x8mSBMd6Iqyv2Tv7TjAzjVrLOXRDULMFfZXZCpCLHsp3D93gc4sSHOraAbFs+5dA
         NKc3WbK1NquvgGTfmfkdufn5enVnV+I7E4tuwbGYOXqNJ/6IYmIoqCbUtMJbGDSkqFJU
         IM2l4noKx1iH4HFy2IycVLAy3d2OOeXvPbyKnJfDougB/8Kk/KMzvNrgJJyb6zkCUzZs
         KhbA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Sk7yjbj6+W+JxX2rE10zpr6fm26+Me8Z2uHl0JUnSuO5mJKbyHfvEdWy227S+YGiT4Izej5USK0ka4SG@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfHIg7hFDXtN77Zijfn5xbZvgthxNj8SSseuaIz7Zs7BVkBgs
	fFiNt2+3d40R2AECxu6wfoGbaNlff3CH7lM6SBFqFBnOsijkRzkiScc7yQM6b/ORuL4=
X-Gm-Gg: ATEYQzwsdHBDZGf2v8lKQKCbCnWZeSonRatEzYOD82pm3BCAR7cy7fS+Wd6qzdWywvu
	LsrRnrrYaqEGGkPClKRkcNIzYgC/MZnzb+uDFIxczDTIu5JD+0gdS14KO39rr+F0zf58U38WbAQ
	ESa3ErndGw4foVv/PO1GiSSzEc5+fhnGll1Y7vJYIP3QblPtJfqqmMBrpMKvJezEsPxE21yKJws
	o/xLkDX7vfJLtscO9DXpDi6G0mu9SfdYBBBkNgN3keZ2n/W6UG/uM1YZJprwCtr2DZbyX9LPeBz
	qpjODKS89dA8KwUDquxq39ns5mctGQjdWufmrEIMDQ2V3SO0T/DjJyxTkWFvQPnEmEH7y3Ikm+z
	UgOl1UvvhsrEy2Xwfy9ahkzQV2ZTtsGvVNTyRDatP1oXYKy4io5PJ1IuPQLewUFJsgA7ober+/D
	70OxNFY41nDtuSAhsHUscnBRB1bSwd/OOnabPnab1PwUPbgEed5/9rtNKb4l6nsq4lqxttTTVYG
	44=
X-Received: by 2002:a05:6000:2207:b0:439:bc2b:cb50 with SMTP id ffacd0b85a97d-439c7f64eadmr257072f8f.4.1772578422246;
        Tue, 03 Mar 2026 14:53:42 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm20135391f8f.25.2026.03.03.14.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 14:53:40 -0800 (PST)
Message-ID: <4fea7117-ebd3-4279-9973-3ac4f2a78835@linaro.org>
Date: Tue, 3 Mar 2026 22:53:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
 <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
 <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ED07E1F82F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95220-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 03/03/2026 18:58, Vijay Kumar Tumati wrote:
>>> - TITAN_TOP_GDSC
>>> - MXC
>>> - MMCX
>>> - MXA - first time I've heard of this rail, from memory I don't remember
>>>          having seen this in ipcat when I could do so.
>> MCX and MMCX are comminly required power domains across the PHYs but a 
>> subset of PHYs have the dependency on MXA.
> Actually, it's a bit more complicated on this target as 
> cam_cc_cphy_rx_clk_src also depends on MXA, which means all the CBCs 
> connected this RCG do as well.

Right but that's something to model in the clock-controller then not the 
PHY.

i.e. if a clock depends on MXA then the clock controller should 
represent that dependency - not the PHY that depends on the clock.

camcc on hamoa looks like this

                 camcc: clock-controller@ade0000 {
                         compatible = "qcom,x1e80100-camcc";
                         reg = <0 0x0ade0000 0 0x20000>;
                         clocks = <&gcc GCC_CAMERA_AHB_CLK>,
                                  <&bi_tcxo_div2>,
                                  <&bi_tcxo_ao_div2>,
                                  <&sleep_clk>;
                         power-domains = <&rpmhpd RPMHPD_MXC>,
                                         <&rpmhpd RPMHPD_MMCX>;
                         required-opps = <&rpmhpd_opp_low_svs>,
                                         <&rpmhpd_opp_low_svs>;
                         #clock-cells = <1>;
                         #reset-cells = <1>;
                         #power-domain-cells = <1>;
                 };

So... we may need to add MXA here, probably do based on what you've said 
but I believe TITAN_TOP_GDSC is the only power-domain we need to list 
for the PHYs themselves, as what you've described above is a clock power 
dependency which we basically already capture in the clock controller - 
absent the MXA - which is apparently always on...

Sidenote, is MXA required for videocc too ?

                 videocc: clock-controller@aaf0000 {
                         compatible = "qcom,x1e80100-videocc";
                         reg = <0 0x0aaf0000 0 0x10000>;
                         clocks = <&bi_tcxo_div2>,
                                  <&gcc GCC_VIDEO_AHB_CLK>;
                         power-domains = <&rpmhpd RPMHPD_MMCX>,
                                         <&rpmhpd RPMHPD_MXC>;
                         required-opps = <&rpmhpd_opp_low_svs>,
                                         <&rpmhpd_opp_low_svs>;
                         #clock-cells = <1>;
                         #reset-cells = <1>;
                         #power-domain-cells = <1>;
                 };

---
bod

