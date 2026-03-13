Return-Path: <linux-arm-msm+bounces-97642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL74J/2NtGnBpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:21:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D228A5B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A158930D131A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 22:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0803E376463;
	Fri, 13 Mar 2026 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxvcIc5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969426A08A;
	Fri, 13 Mar 2026 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773440505; cv=none; b=P3xB70MTSCbsXyzRNj3pq0Cd+NzP0fra3kZk/iiAQ9BSowfpQ1W8Ne0o9X5KsLXs4Z60uMrk+mBsW+x1TrqTYNfrhZhmwzyYOMSo22N+818jULSOXN2nZjIlNJadlVHgDCp2k8tqiKm5+8EZNFV62+gp93cfh7Y+nZoZQ8x6VPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773440505; c=relaxed/simple;
	bh=slTUBvEk2/VauNtzlqOM1N32mBa6lkN38sBtq4JuXCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYJCYFyv/DnATxOCoLQy6KwWLZH4cRR4aNCGTsl5GAuAxkoscr473OCjtbeyIU+OMBp/0cIMwu9Ru5vmNdYnfEwDpwrvb7VaeiPXBFNXZ1sySsjPFxF07kfHiF6wHOO1eMb6d6DCirl+CjFZ3+OZMO1h1huj0Bm1ufuK33Gl2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxvcIc5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDD3C19421;
	Fri, 13 Mar 2026 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773440505;
	bh=slTUBvEk2/VauNtzlqOM1N32mBa6lkN38sBtq4JuXCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxvcIc5xVmgRXcUWNzELYdshfb2Cswzyw3mdYbT45IbyCOf4UxClkuHxK/cuF46um
	 V4AA8Llhq5sG4pBed2y1oucMkmua2aQ8Ee5KNDveF5Pe7dBvoounbGbXPzMdUF6aKh
	 z2mSWmeHBCIPObO+gxhxS/QTNBRQ5J+/1vU3VcHyHuKQg48VbCbJq3mrR8RWx+NyYq
	 DtGWjawhi9lVz7Q/iIQYgtnqiLlRHtA1bnKgITsUGYZOpcXeCnvQ5Iwn7zknGsJmvw
	 6t4v3Zj6PhtJJt5QefXmia5hZTAIckVaQ2cqtr5XKvE/cSP9FUAulrjTWnACu8ki4P
	 JxlFPyHZ8r9TA==
Date: Fri, 13 Mar 2026 17:21:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Bjorn Andersson <andersson@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: dsi-controller-main:
 Add Eliza SoC
Message-ID: <177344050369.3547140.13640398793199962366.robh@kernel.org>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-3-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-3-ea0579f62358@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,vger.kernel.org,suse.de,lists.freedesktop.org,gmail.com,somainline.org,kernel.org,quicinc.com,marek.ca,linux.dev,linaro.org,ffwll.ch,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-97642-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 085D228A5B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 13:58:45 +0100, Krzysztof Kozlowski wrote:
> Add DSI controller Qualcomm Eliza SoC using exactly the same block as
> SM8750.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


