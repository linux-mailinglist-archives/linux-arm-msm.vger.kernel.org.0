Return-Path: <linux-arm-msm+bounces-112630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l4VgHnhhKmrtoQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:19:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE966F52E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OldRZJg4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 835C9300A4BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C9535E549;
	Thu, 11 Jun 2026 07:19:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E51F5821;
	Thu, 11 Jun 2026 07:19:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162355; cv=none; b=Swv/JkHVFVvcqVAuvW6xDs+plgMT3q0PtM1Zwdkl0VGld2RHIR34Z19JGHSDqARFB3tj899KSgJE1cH2Av3AjWCJHYosApSfkPotN3izmuHGjG/VkqiUq2TbUeE3x23pZpt4wIMyo2kp76C1o3EJYeX7rUvUB8RVb8JR2A10MBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162355; c=relaxed/simple;
	bh=qWiheM4BZI9VVY77CZq618g3xfyg6lVDaj5UYiTUw1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAfH9OoL/nMjjKeiuOBMn5RmRWjGjcoU5l3BTqkF0a9hlf6AHrZsg5GFRok5O3wCHq0QSgCpKzwSpBTSbIUOAYkyuaRA996Ho20jobLcYVr6Wl4sHzeOIZS8ZZbQcX5pJdDDw50fqFRQJbg3yWjhEb4IQVefgeiOnUHS3RBl/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OldRZJg4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8521F00893;
	Thu, 11 Jun 2026 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781162354;
	bh=fJDlxxsLRKCJxE4tq/bQfb7kaHEjPHmrFHttZV3A8Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OldRZJg4cl2BkuUG5C8sWo2X/W1MHVERfrYW+skyNmJ+xGMaTofH37rv9MxovbJTd
	 1iVHx8limBNypRMyzcf2bmxW5hH3OUjdwkwt3G6G9Jw3gDmGDZPkppGSDtz3zmUcxg
	 JFUya95s27aInYuvlzGbZ/uOWV1xozzE0AeQr659eeswVfaa6vJ9h9ZLrxkGCLq2ck
	 lqnfUyTBJ272ZyNlm8r0v9P7LmIDg5shmHeJhy7dVwWpO0YQXhg4N3L/yOKl/yvKpn
	 +OxM+JbYKxc5gQoiFTcrRK5nsPCOyVGWQxG25V+VNdfvOgKEkzwFKlZcEDCzCKxr4K
	 VElwRlj3C54AQ==
Date: Thu, 11 Jun 2026 09:19:01 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Maili
 Platform
Message-ID: <dwe3yexvmaciuvhw5ahbnqe3fww534hulpbt7hkx2nblujafr2@pgyjmkkfr3ze>
References: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:jassisinghbrar@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:yijie.yang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112630-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FDE966F52E

On Tue, May 26, 2026 at 11:38:03AM +0800, Chunkai Deng wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Maili Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index f5c584cf2146..4b69a281971a 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
> +          - qcom,maili-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260512-mailbox-qcom-maili-7c5cce6e672f
> 
> Best regards,
> --  
> Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

