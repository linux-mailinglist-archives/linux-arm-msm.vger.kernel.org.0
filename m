Return-Path: <linux-arm-msm+bounces-97641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBNIIpaNtGnBpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:20:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9428A56A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F7173021413
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 22:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4584037DE8E;
	Fri, 13 Mar 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyilRsVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D128852E;
	Fri, 13 Mar 2026 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773440402; cv=none; b=cqejIaWlEc+U/pZ57+DzQ53HSulFq7RrBdqtvwM0oCwRiiSiEWgBMSy/dUBEW9eNSnVHLkH+svJI+KFXojjbFaifhnEHTeK/oazeIoHlILA3k8cyNfjTeDTUAvvz+KiK4r5kjDCUI+9XGjt6hys3D6rUF2rnJu153TsmWNOK0yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773440402; c=relaxed/simple;
	bh=cxsE61Udr6fKEoCues0p7VRlQg8F2SPg+fKrpN64xZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSQHw01gCJct8pJ6m5OKOEzkweY3P0Cmv9Upu3GPi1RQRye9WgLkk59EkFO5v4/NpNGfWk1+3K2ftxsIzHEptoIEE2yJPKPGksCgqIK1WzPHMQcHWDO7u2USpp+NkgnhgeqI/vPeON+XEMhOH5Hqly3lgDbBjXhXX/nAGh5rXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyilRsVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80456C19421;
	Fri, 13 Mar 2026 22:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773440401;
	bh=cxsE61Udr6fKEoCues0p7VRlQg8F2SPg+fKrpN64xZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyilRsVw/NQRiLwyRR9gBY+zG+kNOXTOi+NdksNXHQ4FLLW6mlxQz0Soh881IR2Ea
	 ZFwy4zPEurK0j7OXBJk3CmRrf7ly95QYbN9O50YCg+eiKtJVBUdHwxckbB7mcrd7le
	 dzF1vDZhIU7eHtqbP2gTdYeR9Tai7ZsUO1f39vgIdtdV5t6FwBs6Qh5kYlN4qVX1jD
	 OaaCCW9rQDBOHsIt1A5VUNWlYZczLV7F6fFBaw4x0NcsXm2NuPqItl3+gKgUZZ7oit
	 kXyqJcctWJnDam6t3sTgDplL6cpQv52Wa6yzM+/rsFgcrdufkb15tNtijS8vrN1AHy
	 Na+ahywOfLY+g==
Date: Fri, 13 Mar 2026 17:20:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza
 SoC
Message-ID: <177344040017.3529549.10944169278090896454.robh@kernel.org>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-2-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-2-ea0579f62358@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.freedesktop.org,linaro.org,quicinc.com,linux.dev,poorly.run,oss.qualcomm.com,kernel.org,ffwll.ch,marek.ca,gmail.com,somainline.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97641-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3AF9428A56A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 13:58:44 +0100, Krzysztof Kozlowski wrote:
> Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
> SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
> compatible with SM8750.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


