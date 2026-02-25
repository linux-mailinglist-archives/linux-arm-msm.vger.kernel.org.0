Return-Path: <linux-arm-msm+bounces-94075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDWhM7rOnmnwXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:28:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C881195C2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D6D3301324B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388C938F93B;
	Wed, 25 Feb 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biNWW5Ov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1534C3242D8;
	Wed, 25 Feb 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015090; cv=none; b=nfF05kSsAWuZrU4WfgrfCQ9uzLC8zPZjfb55xXAOOwUF8FyoUX0bhzUcJI1IGCbWJXm98wudnump7KysUPTMM1O44PZc32dOA+1+Tu07/9PoLToIaUExAFc0RrR3HZUBwDgIqWdoJFC1rV2RXDGj3BukRzktJ6dpskwMNgWdHx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015090; c=relaxed/simple;
	bh=Zc0nbgCA4DVx+xuQ9oYoqJMkJpai3NWH+Lkg10VOKgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoAHKFJ3Fyv8oEMrpwuYxYSzs7W6uPSmbcJz4SpwMM/YPEteBjwXrsPmkJcKwtO0QKbGZ3W5cQL1V72nyQq+xrmCG2ApVIBzMnkIaJLSAAoyUM7O8iRAP+iwAdRK6MNbTpmbIWm9MjFmYTlKPlvdvb2u+xc+wDPiW506wsvqa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biNWW5Ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C77FC116D0;
	Wed, 25 Feb 2026 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772015090;
	bh=Zc0nbgCA4DVx+xuQ9oYoqJMkJpai3NWH+Lkg10VOKgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biNWW5OvYmga3K972akVnQTXrDlPlk/oKJ1xw1c9/gH4/iy/oAZ0/aphuE2f6SHLo
	 rIfD8po8ySPwm1pkjaHYG2Pxa/yS1xT+gwkSpffr70JJR4MD1jKYWPw2jEAEvJ93Gt
	 JgPDu0CYT8ShafX9OBkOUNHY4j85Kg18X5sr9va9fFmyyoUuFb6S607CQDOdJPyOqB
	 5UzhFdzH5x+8Dqp3Jgis0B4g+FefTcMH4BgVAhNMWlVXKuLKBdYOypGU3zaWTCVdEb
	 TZ2BBvBtYRDwCSeea2i5A0B5vUG+iJo8U6h4K6S5WUR0YQMEdB4/MyNTNx5cz1HSAM
	 83vVsNJERdAAQ==
Date: Wed, 25 Feb 2026 11:24:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Message-ID: <20260225-analytic-economic-parrot-4c3a45@quoll>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-2-mitltlatltl@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94075-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C881195C2D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> Document DSI PHY on SC8280XP Platform.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 9a9a6c4ab..9223af1f4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,sa8775p-dsi-phy-5nm
>                - qcom,sar2130p-dsi-phy-5nm
>                - qcom,sc7280-dsi-phy-7nm
> +              - qcom,sc8280xp-dsi-phy-5nm

Your other commit claims it is compatible with sa8775p, just like some
other devices here.

Best regards,
Krzysztof


