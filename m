Return-Path: <linux-arm-msm+bounces-97640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA+tMJCNtGnBpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:20:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D709828A543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 537E7301B866
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 22:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB2D372699;
	Fri, 13 Mar 2026 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnyeCv1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855128852E;
	Fri, 13 Mar 2026 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773440389; cv=none; b=f7wIy4rmjNCL240FANfeB0F8S5/XQM7DX/mAe3GMwQt5yO3DO7kgKhP8dPJC5QHr0KWDAp/2smeEvC3u+4gS175rbWJdmy1oDyA5Qaf+v0q2zXntZ7jpxCSX5F2QIgCcI4Zm9z94Pw9WJKpinWVFnR38NXOM9vzn8UwlPm36dDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773440389; c=relaxed/simple;
	bh=0MkZk4pZGxHmnsDZni06Nwrm9u06R9hz2Qn+nuX7Cvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgPSRtWJZvOvB0Uekxo6NFLEHL4JIejc4KFUDlVJpIhRoag8IMI4s2J7RICttLX7epK5iTKLMboP/LCPewcgEwNlqJd39G2y4d3u6ku+7drXnCtE88oVH1heN73OoW3cMtd/5BSyOrtrGYAsW8yE1RZW1M6+wP11cApow+LzBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnyeCv1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6D6C19421;
	Fri, 13 Mar 2026 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773440389;
	bh=0MkZk4pZGxHmnsDZni06Nwrm9u06R9hz2Qn+nuX7Cvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnyeCv1gSsIriEpaxrHzP+lygHlT20gcMrzLgx4mwTE9NC003vla9SwA6mjLFJo3V
	 N9PUfcT0xJjk5ahSc++qRBynsjJ+/IgpBthKjD/l+QTbShW47g3X9/rFXEebQB1Cl5
	 pE2R67JWynOy/FtJqcF60LBRmjxO/NuhLuyO5OxdahYFbDfGKzaRgMCQwLtNxwy887
	 AdFaDjrmiLIleuGmc6HDd5sxF70qT6MVLSDUGy1hoDeOO7UPsL+JuLgDUlePxBYTD2
	 9soSwKPHAGVr262Kto0nhn2O9XrpA8aKGkfcCRYuYj3W6JdLLlTUys/BxzzFYCtOpq
	 Z182JWHydSmWg==
Date: Fri, 13 Mar 2026 17:19:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Add
 Eliza SoC
Message-ID: <177344038742.3527195.4769688326442777545.robh@kernel.org>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,somainline.org,quicinc.com,gmail.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linux.dev,ffwll.ch,marek.ca,linux.intel.com,suse.de,poorly.run,linaro.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97640-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D709828A543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 13:58:43 +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
> 4nm v7.0, SM8750 uses 3nm v8.0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Commit msg
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


