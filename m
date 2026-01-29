Return-Path: <linux-arm-msm+bounces-91200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG5rEHWQe2nOGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:53:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F5B276B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4ED23002B59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DDA33F8DA;
	Thu, 29 Jan 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9GB03m2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7878F2F;
	Thu, 29 Jan 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705584; cv=none; b=t9gvF/DXFy7/+lG2ef+BI2WYo8bmEvdR6dL/Wmuz/U5r9qSfYtWZaMYtrnoyJT7ETIK6+4/6Q+w0hWKf17ppE87uXOoTejtUa66b64p/u6pnbN9ljXWqqwKrmUVVbZjUKj2oA3TECytMbIR40OpxpfQxUOF9sddCX0zPahpew54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705584; c=relaxed/simple;
	bh=4Go8r+auphjo22TcuXvyOWWNojSmrb+RGzHfXTGMbzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1EZ81E/BVjHH+xHlxmNR/fKmc1kUAsdnCPLAXdSXOEH+6qm2/3lveMZZpy5RSWNEgvRxAm+qveEu9WFo2emFpuIRdGyeafGKj2gBtn0JI61etIpCZj619WMHfIkVTcvZZkhq0DohOIMHTTCdYKm39uQT9mfjUWodKl/r6cw070=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9GB03m2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E040BC4CEF7;
	Thu, 29 Jan 2026 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705584;
	bh=4Go8r+auphjo22TcuXvyOWWNojSmrb+RGzHfXTGMbzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9GB03m2rvW1q2q52DbPwCtjUQP5aHy6q0i/GQtvQPaBJ77SGI9HEANAdjlN+ue50
	 cz4KCQVvudBzPtTloSt7N4Bxq+AiQLUVj8DXVEVb6Jp6PlksHW8ir0Xjg1x9AwJqw7
	 BPg8jwfYNyiCs1SAMC5wdYwvHw4ApXjcGxAGrGoolFt8swmCiXrGX0mck+fC/4epLG
	 AtBxiVddh00hmQJtFZhy8nvi+gRGAs3QG6/ybnz3rRwvtYa9EH6ATp1RkpXUgrQ6iU
	 /nyBDnOmmeLghKnZ3q+SvgvkFNEw0yuvjZgXWZEaDcQ/auR7l+TTjmMXkNDl0df/L7
	 RXZBPHnedKVaw==
Date: Thu, 29 Jan 2026 10:53:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: quic_mahap@quicinc.com, robin.clark@oss.qualcomm.com,
	mripard@kernel.org, krzk+dt@kernel.org,
	dri-devel@lists.freedesktop.org, martin.petersen@oracle.com,
	tzimmermann@suse.de, lumag@kernel.org, simona@ffwll.ch,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	sean@poorly.run, kishon@kernel.org,
	James.Bottomley@hansenpartnership.com,
	marijn.suijten@somainline.org, devicetree@vger.kernel.org,
	andersson@kernel.org, cros-qcom-dts-watchers@chromium.org,
	linux-scsi@vger.kernel.org, vkoul@kernel.org, mani@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	quic_vproddut@quicinc.com, abhinav.kumar@linux.dev,
	conor+dt@kernel.org, konradybcio@kernel.org,
	freedreno@lists.freedesktop.org, airlied@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock
 for sa8775p eDP PHY
Message-ID: <176970558251.1269081.4205775234649909264.robh@kernel.org>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
 <20260128114853.2543416-2-quic_riteshk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128114853.2543416-2-quic_riteshk@quicinc.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,oss.qualcomm.com,kernel.org,lists.freedesktop.org,oracle.com,suse.de,ffwll.ch,vger.kernel.org,linux.intel.com,poorly.run,hansenpartnership.com,somainline.org,chromium.org,lists.infradead.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-91200-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email]
X-Rspamd-Queue-Id: 5F1F5B276B
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 17:18:49 +0530, Ritesh Kumar wrote:
> The initial sa8775p eDP PHY binding contribution missed adding support for
> voting on the eDP reference clock. This went unnoticed because the UFS PHY
> driver happened to enable the same clock.
> 
> After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
> calls"), the eDP reference clock is no longer kept enabled, which results
> in the following PHY power-on failure:
> 
> phy phy-aec2a00.phy.10: phy poweron failed --> -110
> 
> To fix this, explicit voting for the eDP reference clock is required.
> This patch adds the eDP reference clock for sa8775p eDP PHY and updates
> the corresponding example node.
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


