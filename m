Return-Path: <linux-arm-msm+bounces-105595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDutOCVA92k2dwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:31:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 671554B5C60
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4475D3005D17
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 12:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D6E3B6343;
	Sun,  3 May 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMIGUTiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF5346AD4;
	Sun,  3 May 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811319; cv=none; b=QSA0ZyGy7bbC/++i9F4IRMiAxOA2EueeRV+GeKgg0SV2oSenS+01nXueT6J+mHFItcjhxKICoryHXU7bStw8Sjk2AGrW40KrUEeCY+hmjUvMMo7ho/JXXFffQNxWTNYhOu9X5lRz/C7a86K6kuM8zETMXvHtwzp+AhBFlq7qnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811319; c=relaxed/simple;
	bh=XtoxY7F7drKLhqW/BysRjAd6l6jCIyfrkg3zJNE1UDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjl5y0OX+46CY9IymOXHoMP49LHEr5yMFHE3SMhxJ9ymxtNQN1hHQLmcrC+DwlOePHg/qpQwntjlfnqh53+l73WMsbYBuqzeu4eCecTSPCuj/M17rim9Y91eO8pxVbupHEcJAKBUYeSSbHXjvi79AWf3JQpIwQiSamfcwCCZBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMIGUTiT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CD4C2BCB4;
	Sun,  3 May 2026 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811318;
	bh=XtoxY7F7drKLhqW/BysRjAd6l6jCIyfrkg3zJNE1UDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMIGUTiT+pI3yKKnqP8fl9NpK6Xyd7zShKBlPCB2cb97zRrPP6HHnGTZKRmF2lq7b
	 IAPLP+ZqfRnYPh4sRxX1G0QgA40khFSCvaWWRJ/s2SsUbjWZX3ROXn/dH7iDBAfUAg
	 qFW103nqNgc/tAwa3YckHVEhcmf4bna/xCZYQBphh4JKEl94uz2zCHoV+lWjOcuKMy
	 slKCTxOzXXOcIq4Sp+xgLZqjcOPBjiFJfxQfY6Xb49icOr4ictuEKwNX5mXpx5Ms/m
	 gNQFhBabp0rxGK1TbDXDYN2br08XneR+zfIoWxeFDw/xgp4nlHTQupXHiYreuslp/M
	 O/y8AwcseAdrA==
Date: Sun, 3 May 2026 14:28:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Marek <jonathan@marek.ca>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alexander Koskovich <akoskovich@pm.me>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
Message-ID: <20260503-crazy-macho-starling-be7a1a@quoll>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
 <20260501-milos-mdss-v3-4-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-milos-mdss-v3-4-58bfc58c0e13@fairphone.com>
X-Rspamd-Queue-Id: 671554B5C60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105595-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]

On Fri, May 01, 2026 at 09:14:46AM +0200, Luca Weiss wrote:
> Document the Mobile Display Subsystem (MDSS) on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/msm/qcom,milos-mdss.yaml      | 286 +++++++++++++++++++++
>  1 file changed, 286 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


