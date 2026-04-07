Return-Path: <linux-arm-msm+bounces-102220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICr5FqdV1Wmu4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:06:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED713B3303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 527A63019822
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798ED33A9DE;
	Tue,  7 Apr 2026 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMnXt+8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598622083;
	Tue,  7 Apr 2026 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588772; cv=none; b=ZvMZhaWOYSRO69kR9yCgi8oD9mXtBZIky2AOkY/G44taySwrLY1+3JKcAwUJtQxtCAXxPm2UZ6qxRZjiTnQjxjpJEmS42iAY57VGh5Ba2Z2GtxaKX1gvjpDdgnP2xXhqVxzhBRQknkGzYtPjoxRRrHZmjVLqJTmf3iZ3iip5lsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588772; c=relaxed/simple;
	bh=lPIilq/uq9DXQOmuPLnwo3pM67Y4HykvoJOE43Gkroo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpLTBqXekwHOZ6NSdARKYmNvGJz+s4Ep7FHqs6ypRd8s40UNP8AjqxIYLB1WGBqXAh3Kj2Apqs6RTJBfyGsLKCi5qQ7a57xYjB3I4TMg5REurZ2GsLlkHnMNuMf3sv2H6P8al1flZLCO1Ad/N9BedSkpfdFwqzX1+Xf2dAObU1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMnXt+8Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9033C116C6;
	Tue,  7 Apr 2026 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588772;
	bh=lPIilq/uq9DXQOmuPLnwo3pM67Y4HykvoJOE43Gkroo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMnXt+8Z8J/C08cmelJ1UYxDoryXXEvUAmkrIyJD4GXvtpVgxOZ2pq/j4u5HKcRl6
	 ocdGJVDzsqtDSP1P5aw9LXfAJ+Lv1L056I//mTRvVvjD8oHzxpK3PE9pHEp/mXIoRo
	 2pQI8gwCRh7/3feCmWITTVuZJ9hr3i62ynmWZIEfqJKIBZlHfsDWmTDBVN/AnLPaRB
	 UUvFeI2vLTRTzz4Bp4FLvBlxoUSbLwgtlSmNMo5gmUIru95lyioKgmHZZEhsYf38xH
	 unWtMKU3TghOrMpIigf/IY4uS/JEzzhygQim9PWQGAkizdvpnckq9fO4miM52Gj2Sy
	 yZxiXc6Mj6XFQ==
Date: Tue, 7 Apr 2026 14:06:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	phone-devel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org,
	~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
	Jonathan Marek <jonathan@marek.ca>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: display: msm-dsi-phy-7nm: document
 the Milos DSI PHY
Message-ID: <177558876975.3405237.15393961747581849793.robh@kernel.org>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-1-bc586683f5ca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-milos-mdss-v2-1-bc586683f5ca@fairphone.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,pm.me,kernel.org,linux.intel.com,vger.kernel.org,poorly.run,linux.dev,gmail.com,suse.de,oss.qualcomm.com,somainline.org,lists.sr.ht,marek.ca,linaro.org,ffwll.ch,quicinc.com];
	TAGGED_FROM(0.00)[bounces-102220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: AED713B3303
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 17:12:20 +0100, Luca Weiss wrote:
> Document the DSI PHY on the Milos Platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


