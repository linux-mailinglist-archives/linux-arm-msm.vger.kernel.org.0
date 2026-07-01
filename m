Return-Path: <linux-arm-msm+bounces-115624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cmmYJkfkRGq82goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:56:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4396EBC92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AdVObgKr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB67B30EC956
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A3C3FFAC6;
	Wed,  1 Jul 2026 09:51:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630EE3EA96E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:51:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899481; cv=none; b=vCRTyqDANHUyVrnwA1zm1s6bRKEH5S2Eus2fin94Z6XxbEtVW3pEw6nokodNfP4uiDsRNs8mzZNzJJDT4CXv6r6nus62OqRvjwA4Ek8b7OTAGKXVXJaLbHfqvT1K2+KpFAN2P9s1spSixJy87XYjJzlfsupz7j5B6bFwbt6u0PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899481; c=relaxed/simple;
	bh=tbugZwh8oSW3Rx3tk9D6PDyspG9yCZ/BZYVqALg3Xvo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+fLxhA/2Q6X5RM+ZVkVlk8ZV+WeJTqCG83me/qHYN4tBivMs14oMF+M6vfqYMnsct8a456Q8lf8FxAUm+qzUCddY4mpJ4jbUmDHd9CvtaKsFNmxik79Gia1/DDWCR7VGB2/IVoxlLzVMBJyoS89X5rUOFRRig26vwPzwEE57Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdVObgKr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FC11F00AC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782899479;
	bh=ShGWDXttH5/Ho+7oUrait9j1SNVndDs13zI0h4c4YmQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AdVObgKrM+PoufyZXyhVAsgOOYwZakJfmCDNeuqGAjgsZyzlmt3aY6OgrEyxETmYb
	 gIzH9DBIfHTLWqqCB7ii4mgd5Baa9tJ0j/ijIDOzmYfoXET/GR54AVFGwde5OQ8h4B
	 0ZFsBkOWN85yRKgTApUYVptBhHGdkfOTD64JefqqcHG3ma6Uydd0IwapVRONw2JYEe
	 udw+vIIjzwMYyX0u8kOGrfVOlLdZ2FfRnLgsbJdj5wsnAIBAF/ze2wiHH9j+YWsm6m
	 UATxmlniD01vqYMVplB40UjniY+sY2InGx8O/NQXMXKBFN30nd/KElYytgjH6ihAIY
	 iX44KLSqQJsMg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b0c6488e6so3774091fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:51:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YweXOFLd3ACibUlVL1l2G+/0VRAKvDn99+X++XEmHjzXPJ7tySt
	rpwELkHqKl+6JC4fxHcZqshWUEtt6YMWsAFMB4IdRsdZiu2yhSGGaRomgeTA4/SOZaL6JUxm+rJ
	prz7eOjo4gp04+cIxoUOqhWhnPOhb7wayBTIox/DxXw==
X-Received: by 2002:a2e:a988:0:b0:39b:be5:6d95 with SMTP id
 38308e7fff4ca-39b341228fbmr2172921fa.29.1782899477765; Wed, 01 Jul 2026
 02:51:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 04:51:15 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 04:51:15 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260701-shikra-upstream-v1-4-e1a721eb8943@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com> <20260701-shikra-upstream-v1-4-e1a721eb8943@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 04:51:15 -0500
X-Gmail-Original-Message-ID: <CAMRc=McsmvR5SaBcr3FNjQLvp46MdG-mj8bgYnjvWn2yG-oSEg@mail.gmail.com>
X-Gm-Features: AVVi8Cc_rp-y3aP8VcLiH5YFSe4JsqHhLKXDLZf5g-tl8E57HeVVA8iw88E74Ag
Message-ID: <CAMRc=McsmvR5SaBcr3FNjQLvp46MdG-mj8bgYnjvWn2yG-oSEg@mail.gmail.com>
Subject: Re: [PATCH 4/9] PCI: qcom: Add support for Shikra
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115624-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sushrut.trivedi@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C4396EBC92

On Tue, 30 Jun 2026 21:02:46 +0200, Sushrut Shree Trivedi
<sushrut.trivedi@oss.qualcomm.com> said:
> Add support for the single PCIe controller on Shikra platform
> which is capable of Gen2x1 operation.
>
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index d8eb52857f69..19daadee65f7 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
> +	{ .compatible = "qcom,shikra-pcie", .data = &cfg_1_9_0 },
>  	{ }
>  };
>
>
> --
> 2.43.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

