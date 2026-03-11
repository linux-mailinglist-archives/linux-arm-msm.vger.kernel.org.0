Return-Path: <linux-arm-msm+bounces-96935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCS9GbNCsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:23:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8402620C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DE13309A9AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205B93C457E;
	Wed, 11 Mar 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGF92Cag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4E3C2770;
	Wed, 11 Mar 2026 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773223398; cv=none; b=Pt1q1hzBKBdZ3jPk81U+tasrCgzcpvfA+oEIViy4yau1lgUbGjoMmpXG8aZBzBovmI3VT7T1QTwpAxn7gwofVXiCOmNlO82x64Jw/3TWeZilr3RY1etsvckUIytfsTln1TL/1MXhD1CzfRPeF/OkDnq03rtvn8U4a6Uj4GUmFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773223398; c=relaxed/simple;
	bh=WUJI4BLLgBImiMYylOdI7as7n855S//PJzZHdABIc9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZccFcK2Lvuswu36DdO4Dn9uvXweTeCdJoTZAWnzeI8KpXTjiS9NG22eKkF7WI9MtnfIJqPAB5hBlsZhWwL5UMmYLzq6w2iapKOB9X1/42m7ay0qj+Zgsa4eZdVzvKkvqOs2KEIJ5iIil2/tQ2xBgGZGSQWDEzSvHMm+LuGRZPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGF92Cag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E4C2BC86;
	Wed, 11 Mar 2026 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773223397;
	bh=WUJI4BLLgBImiMYylOdI7as7n855S//PJzZHdABIc9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGF92CagwJyqkzGm6eppgRDfLl4tYqdUFdAnfayKyQDnT9hdMtM/vL3/mIV5jctZY
	 Xb99b9yAYpeX4U+Bil9Vps3nfMj466L6AzOSNKn2slDLvEkWp8WZbSy0DlGKqie50Z
	 bkMJeO3ltGj66CN826Jp3M95AtCKjk7eIqyXXUmtGLdgRSQ3ZKejs4VLanjVHWpweI
	 WFJKIqL0n34Atk0rhzvB01RPFUqtcvmfDLneyhUC4Yuj52aE3OeebmdfXqB36AbgHm
	 wetPB9d04JCIB1M8zgQNv+HxiLtQU/GdRY27/IYpxZYmG+O7Mm8/xyWbE0l+eQTkzS
	 6/H8cG23BPDIA==
Date: Wed, 11 Mar 2026 11:03:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, sudeep.holla@kernel.org, 
	angelogioacchino.delregno@collabora.com, viresh.kumar@linaro.org, neil.armstrong@linaro.org, 
	festevam@gmail.com, Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: cpus: Extend Qualcomm Oryon
 compatibles
Message-ID: <20260311-premium-meaty-bullfinch-f01b0b@quoll>
References: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
 <20260310040751.3132523-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310040751.3132523-2-sibi.sankar@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5A8402620C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 09:37:49AM +0530, Sibi Sankar wrote:
> The generic Qualcomm Oryon CPU compatible documented in the binding
> doesn't account for differences between core types and has been
> deprecated. Introduce core-specific compatibles, based on MIDR part and
> variant numbers.

What do the "-x-y" stand for? What are their meanings? Your commit msg
or comment in the file should explain that briefly.

> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 700255e9a002..fb6e5871b625 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -218,6 +218,13 @@ properties:
>            - qcom,kryo685
>            - qcom,kryo780
>            - qcom,scorpion
> +          - qcom,oryon-1-1
> +          - qcom,oryon-1-2
> +          - qcom,oryon-1-3
> +          - qcom,oryon-1-4
> +          - qcom,oryon-2-1

Best regards,
Krzysztof


