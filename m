Return-Path: <linux-arm-msm+bounces-92999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKO9N0NAk2kg2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 17:05:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2B145E8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 17:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7589A3009CE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7A53321D4;
	Mon, 16 Feb 2026 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYBW+CHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A782328B56
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257918; cv=none; b=sBnfVdl3fEiQVDlzj+FYP2LjpvwGQjdlq7xXgdTddsKondoLxUxu6DTpe+HJjWGZDLeKTHbscemBHz4qk5VeTn6ojw079IS+RQK6YWaclCLeb5Hr0Ud9yTXmw6wp/lnyIoihcGM8y8Ab8a7nU2YFv5cYvHYMBfNQNwYg5nROX0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257918; c=relaxed/simple;
	bh=Ug0bv2q+MJyHMxXUhfuIzRES2n74yPYoafPq/Crx5xk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6tdOnCD4XvPUBi/vDuRWTX+ey13lDqkpjaCKzoutir6th6gv6NqgeQf9ODA9j+w7F4k96adYkrx/YFLIPOt8BT1zx/QFZ7e4cxsJiGyWKpJR92EFApkPWXqtKyowLL3Xrz1TnyzVlV7i0HTLLKHT8TVPyP6Y0zY27/mLHbeydY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYBW+CHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5875BC2BCB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771257918;
	bh=Ug0bv2q+MJyHMxXUhfuIzRES2n74yPYoafPq/Crx5xk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=iYBW+CHplOx33/O2WVqyNRi2MEOw8eDXFDQOas9ZlvDY3O5Os1XHVZBS35/telWBV
	 NP05f4Jr5Fh0kmZjM4DZEMbO/DguaFTwIu6TamlNG2+yGAlGtR+govm8mW6Y8TYDlH
	 1OdeM7Kbhb4VL7x+Tvctyw9z6h0q448WCSbuPs+pcEWJyEvCmfPxPJRFZTxFOlJNyv
	 FhI1AnEBSYVkrr37Asxuzd8pP4L9GWfsMBVIHozCZoy5zp7IZBm86DMWyet5hJP5mB
	 MDqKh31qWy4MbA14dthX6DOQ3E7S5gO7cLlerqfBI1PSkOOUN/XikEv2q2kfXTb86Z
	 fQi1Mn/tZqGlw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e5bfa4f33so2812588e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:05:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVriS4DhNxgWifi2dvb8yxXfqrORdlE3uOIo5FtSRsu22Yihu88nj0nPkGfLpxyNkOXjAuyRIMcs/wtKKi4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRD+Xm7FCY1WkAyv/ZwFPLpeauKDau0tmZHwonaA+Nak1qluqm
	MjVpcs89MpPHPcwZEpLyKsEgM96x2gl1jlyslRknc/zWCX0aXMcHheFQG+yX3wdCXb21C4Gnl5h
	J3yTUg18lbYwcaOwk0EZBKeAsoeVweAs9UK3GRg7NqQ==
X-Received: by 2002:a05:6512:2351:b0:59e:2aee:7439 with SMTP id
 2adb3069b0e04-59f6d375968mr2731986e87.31.1771257916893; Mon, 16 Feb 2026
 08:05:16 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:05:15 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:05:15 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-4-802c82795431@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
 <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-4-802c82795431@linaro.org>
Date: Mon, 16 Feb 2026 08:05:15 -0800
X-Gmail-Original-Message-ID: <CAMRc=McWrc7uG=HSZEGybiG+d0DMw_U4c=A22aGV8DM1+h1ubA@mail.gmail.com>
X-Gm-Features: AaiRm52M5Hr-VX4bzyAyiWWbvFrECG2u4oIptkEYguyjaGQVcwZSpUCmWBHLcCM
Message-ID: <CAMRc=McWrc7uG=HSZEGybiG+d0DMw_U4c=A22aGV8DM1+h1ubA@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92999-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,linaro.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DE2B145E8A
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 15:21:48 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> Enable the generic pwrctrl driver to control the power of the
> PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/pci/pwrctrl/generic.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> index a5b7b7965f46..1afda639f0c4 100644
> --- a/drivers/pci/pwrctrl/generic.c
> +++ b/drivers/pci/pwrctrl/generic.c
> @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_generic_of_match[] = {
>  	{
>  		.compatible = "pciclass,0604",
>  	},
> +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
> +	{
> +		.compatible = "pci1912,0014",
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pci_pwrctrl_generic_of_match);
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

