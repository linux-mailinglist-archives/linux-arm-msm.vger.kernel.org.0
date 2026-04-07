Return-Path: <linux-arm-msm+bounces-102222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGqmH/dV1Wnz4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F43B33AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8A163021B22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D1C33CE80;
	Tue,  7 Apr 2026 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lux9qAf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFD22083;
	Tue,  7 Apr 2026 19:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588831; cv=none; b=kg4fGUF8lRWfOlon3PUgPSXWE7RpoG9l46Fe0tp9360mYU6C/FqE2OMDBhYYA78kVnWCXnasiyp3WG5AhPifyYHvFU/Vf1G4fo3HJm+OPtzCB5H+qNTgV/6rkd/VQ2CpMF5mfH3HUjr77tYGuFrtbtTvUH4ieYlfCuJFyx0lcfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588831; c=relaxed/simple;
	bh=G6An/J/iBgbRqFjJ9i8aQHvrnf5qvpyoY+B082y2Iu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iU24CsAHoSi+GtY3bpWY1faPjTeaY3EXLQupIK8pC6bms2UArRknSkaJd1++AEGwRwNwiYmj4kN37+VY8PfHMd3TgkoOgIomCsqvmt09ye8lj9UpIb4F+v7YGZG8dETkP1Mpyz7JXYRCddpm+gYQ1fxuvo0crsHNiLl7IFv3CHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lux9qAf4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3199C116C6;
	Tue,  7 Apr 2026 19:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588830;
	bh=G6An/J/iBgbRqFjJ9i8aQHvrnf5qvpyoY+B082y2Iu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lux9qAf4H+3WFaQZ01EoN5GG+mbRCLw3mih5kqISHaUXRzBE2hV69y6P3A1J3Ro22
	 SWvxjMLkC/1xKKCjPHQwW6biHgys0curqZ2zcZX4SghRp/RWrLxQrCdJ9Yj6aG8PQb
	 i9dBz1AQVDvtIucQ6vs31mq9io4k0V+D2ySkJKBHj381tFVdOMuNnspw9AIjrQm41H
	 3VOcRtDDIcJB1NkTdHhMFZjjpg4f/E/XKbBro9CMzt16Vkh4ZhBq+eBNogsT6qIcjJ
	 o5hjaEJGksnGG22kFsyaNZ7111K7X4CvcJ04DjvV9WZYDn+XJ/V53H1g0mbPNNEFw7
	 NECFKlqvd9ZAw==
Date: Tue, 7 Apr 2026 14:07:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Alexander Koskovich <akoskovich@pm.me>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, phone-devel@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	freedreno@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: display: msm: document the Milos DPU
Message-ID: <177558882669.3409524.8504183460631288519.robh@kernel.org>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-3-bc586683f5ca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-milos-mdss-v2-3-bc586683f5ca@fairphone.com>
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
	FREEMAIL_CC(0.00)[suse.de,poorly.run,somainline.org,pm.me,linux.intel.com,gmail.com,vger.kernel.org,kernel.org,quicinc.com,lists.sr.ht,oss.qualcomm.com,linaro.org,linux.dev,marek.ca,lists.freedesktop.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102222-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D87F43B33AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 17:12:22 +0100, Luca Weiss wrote:
> Document the DPU Display Controller on the Milos Platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


