Return-Path: <linux-arm-msm+bounces-108199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAQvEe4UC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:32:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95F56DA97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2F4302B38E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D4748166D;
	Mon, 18 May 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDUYHZCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75E481665
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111016; cv=none; b=jIu94QVC0OeMkUA2dtqg5vujK6mtFSUDjIfxSqKyBHxFDwSaS7BjDSKmpJpmaQYzGW1Wfj+izLXFVn7j+Z0ypyPC84LJcjv53GJTV7NH9l3CaSTMorNe0o3f0YrY/PnOIJzQLg+xsHdSzK6MO0eqhSY/4QQxOS/ePzMg0TZbSqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111016; c=relaxed/simple;
	bh=mu23A1aKnbeL7rnlaNrVWc1PIofIv55ss+9iNQCP2Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiZcxumczIreMQzmSiEh5Whwdxd+yW/xtDu6k6Dlv1PywA4+UfOU2nT9qzPDlkSkcyzN1ZHmhuDg3/w1xJSjZQL7D5Xua39klUfZPHamhiKiZB9hRvTZL0BQgRbVfupfCYS4ocW1IXN3JZp+cGWBw2uoBpTT/LteI5c9t1OChLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDUYHZCM; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c80167f56cdso893400a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111015; x=1779715815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQopvD0wIDefYue48AQBWjS2nKzSpK8pu+iCNPo/i64=;
        b=iDUYHZCMncKajtPHSi8bBHhTyhh/EVf1wSmGb2juYgOFr7QUGxUYXBML7NX7GrWvlQ
         uQrvt+As55ET5qGAtcpNAM9b6lzcfB29d9srLeJ+hKBjPy9jcw4G0lR/tVuEmWfNfKvt
         vORdBR7W4UgQ46HbwX/mt8ogr/wk5rUd5nCAVhiuBpea98fCvKC80ppWeWOFa8M7V//h
         y8ttnsAMcDFlHYpWNZbz2hVRLQ8NQ+ZOhi434p6JIlr9uzG7zVRseCqBABc8wfUvnmR8
         z7dRiBjaX1jhCDxdq+vl4niW+JizVVrWtWGK+kzJ5renFyv6RKAU0IkuIP4BUTHWSMDP
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111015; x=1779715815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQopvD0wIDefYue48AQBWjS2nKzSpK8pu+iCNPo/i64=;
        b=PlYO43B9uCsnFXet9NlSZGKBHVY66BllD7Eabk0j9kQMytdODfrKYO+SPmYOIsBPrm
         I0F6dQmFKZLHvIFgS6mBLFGtjgw/nasG/f0DSFqAoB5p3W/6yp1+JlDZPTmaJ5V/dVWT
         bUwdJF11smp4gBp4hK12UgCvuxwoXsoDsqc4ilmsZM5oWVFnjJpe3ynQX6ZEOekoeC0j
         NEv5c1oOm9rdfxE4S5fTjrm/YqHnLNbfNEKcMT8/XB4ROIQeDIZvWWi95V87cDX5H7pM
         WEHfLTS9mz5A9XjbUX0uLQOmAGU5NTiS59wVPBtyLWuhJha4x/XLrlEi7Ri04dlXCIpt
         Mujg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ab5hEuxhg+x7liJpUrBMT3ZJxfHfuTqcIEIbbDdjk9okyPqZ2/DnemG2eCqjDPGXDoNeevqyPWe3zQ0EU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5DMOIhEf4A80VEGaEjQpqI5K7TP513TyTOXR0GzkofcucjrP
	KcIP+pfiKo0H9modOx+UWFFkiXEnKDg6v8nUBWpLlwzvjNcnAQ0DOZLh
X-Gm-Gg: Acq92OFJmk/uIDzIaGUViI6SuEzb6u5XnAcAnDYX0ZCxQMuY9RBK5ReI+LSjjqOHlJS
	DKrZfm8YTiIWJCmpqXyr8KyeVtU3mFMTltPm7KX5ZJY/zLqatHc3a057YhS4V3R2tRKg88Xb2tW
	MlqXVaoilcMipP564Hc9g3MKrfj+1qNAPcU5ZiuKOx+ZS8kmazs0ZuDyiJJErZhl/YLG3hCctdw
	MD+oc0RgeqLq7W6kZd7Q6zKC5+/xXG7lr7vXJu9nKR12ulX6f0fM2MbcDwDZgpXluxXMnRX4OaT
	gHKIRQAmm115Y5JtvbqL4Efc8zkkrl4HglLiPRN97gohBh9fFBVP4YyV8N2fnsJicmwCp9Q8bNx
	3B3M7bbe9yBPCqjMgfZWoptrvhs4lWn8m9flucOh+gY4eAyegDYOERuDE79NBFnMUcxZs+1qbxk
	0+8sFKc1sPZvmd3omYTSLy2jyK/PFWRYq8+jicBm5jGg4=
X-Received: by 2002:a05:6a20:7f93:b0:3a2:d79c:4149 with SMTP id adf61e73a8af0-3b22ebc3ce2mr17090144637.28.1779111014583;
        Mon, 18 May 2026 06:30:14 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1231c7sm13912652a12.31.2026.05.18.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:30:14 -0700 (PDT)
Date: Mon, 18 May 2026 19:00:07 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <agsS5SFk3kwffBL0@page.local>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518110435.16262-4-blfizzyy@gmail.com>
 <eb04cc0c-f62d-44d1-a78b-ec4fea7891c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb04cc0c-f62d-44d1-a78b-ec4fea7891c6@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9A95F56DA97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108199-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 01:44:25PM +0530, Konrad Dybcio wrote:
> On 5/18/26 1:04 PM, Ajit Singh wrote:
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe,
> > support along with regulators.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
> 
> Hello, this looks good overall, I have a couple comments below
> 
> [...]
> 
> > +	vcc_3v3: regulator-vcc-3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		vin-supply = <&vcc_5v0>;
> > +
> > +		gpio = <&tlmm 113 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&vcc_3v3_en>;
> 
> nit: Please put 
> 
> property-n
> property-names
> 
> in this order, consistently
> 
> [...]
> 
> > +&usb_2 {
> > +	dr_mode = "host";
> > +	status = "okay";
> 
> Let's also keep a \n before the 'status' property, file-wide
> 
> > +};
> > +
> > +&eud {
> > +	status = "disabled";
> > +};
> 
> It's already disabled in kodiak.dtsi, you can drop this override
> 
> > +
> > +&usb_2_hsphy {
> 
> Please sort the top-level &label references alphabetically
> 
> [...]
> 
> > +&ice {
> > +	status = "disabled";
> 
> It should be working fine, any reason?
ICE is kept disabled because enabling the ICE node currently causes a
fatal SError during ICE probe on this board:

    qcom_ice_create+0x90/0x274 [qcom_ice]
    qcom_ice_probe+0x38/0x80 [qcom_ice]
    Kernel panic - not syncing: Asynchronous SError Interrupt

UFS works without ICE, so I kept ICE disabled for the initial board
support.
> 
> [...]
> 
> > +&ufs_mem_hc {
> > +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> > +	vcc-supply = <&vreg_l7b_2p96>;
> > +	vcc-max-microamp = <800000>;
> > +	vccq-supply = <&vreg_l9b_1p2>;
> > +	vccq-max-microamp = <900000>;
> > +	vccq2-supply = <&vreg_l9b_1p2>;
> > +	vccq2-max-microamp = <900000>;
> > +
> > +	status = "okay";
> > +
> > +	/delete-property/ qcom,ice;
> 
> similarly here
> 
> [...]
> 
> > +&pcie0 {
> > +	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> > +
> > +	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> 
> Is there anything interesting connected to these buses?
PCIe0 is routed to the onboard NVMe slot. PCIe1 is routed to the
modular HAT connector, where the attached endpoint depends on the HAT
module, for example Ethernet or USB.
> 
> Konrad

