Return-Path: <linux-arm-msm+bounces-90051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFSINUUVcWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:04:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE95AFEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4D95270CE7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AFE3E9F82;
	Wed, 21 Jan 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdOIkDlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488633BBD1;
	Wed, 21 Jan 2026 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012594; cv=none; b=KHIjtYTqLyXChemhpX8NiW98PpsB7NbbjG+2CrMrZDH0xtUBm+AwMAQoRVkipHPls09xt4ERL0SuFme1x8zWDoeJ6dbeC//pJjJ0etxoaRIE/97bogotvXucjGjPXBV4ied+fNwxBsHvnKJBYH5uh++JurrJxGhjRsfMxUGBvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012594; c=relaxed/simple;
	bh=C1zRnR4f/4ELo3Ee9QMbthpA+I4TkhRIPNNFP8kChbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx/HQY1u5BGFiHarOPZ9p8gATlWFFA6NtrEjCkCTOIjyXdsVmEo1DktyFy4CE46E85F4FbjgvhbA7v+q1XHWx2k4554oBBKjPibISn2oA/0L2l40wXYD3GBu48TM4uKgmXmrnSaL2jj1PVfzthkbJbUqaJBgwiZqmC7LBopYyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdOIkDlu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31057C4CEF1;
	Wed, 21 Jan 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012593;
	bh=C1zRnR4f/4ELo3Ee9QMbthpA+I4TkhRIPNNFP8kChbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdOIkDluosG/WVQECA6YjymaU+ptEIKqOKt9//sH3+r+Iyb0juaaepfh/j2XFpVq2
	 u5cv3qjZcxi5g3TOp0E0qSopSkcVDMg0qT64IDHZARQ49n/kRlIDnZXS8KKUYNzA1g
	 TbOBiPFaZ29xo4gY+uYuQg91THPTXambdO4R0CXeQBSec+dNA4phOSjO67asydG1tc
	 b3THq7cMXXtOAEwkszvdxIgRAnyLNJNuj8A/jOWMylLiE3hR/dsdkp3GT90wxv2Hro
	 qL43iEbgl6llwsEa2rn9Mue0eyuLm0wvFZ5+h8cNcxYw+i02xSHFl8tzdKfIXzKIBC
	 DEyMliklyv2fw==
Date: Wed, 21 Jan 2026 10:23:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
Message-ID: <176901259157.3406253.14023079021907994492.robh@kernel.org>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
 <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90051-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,ffwll.ch,suse.de,kernel.org,ideasonboard.com,gmail.com,lists.freedesktop.org,vger.kernel.org,analogixsemi.com,linaro.org,linux.intel.com,kwiboo.se,intel.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.0.0.1:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 7FBE95AFEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 21 Jan 2026 12:15:45 +0200, Dmitry Baryshkov wrote:
> ANX7625 can be used to mux converted video stream with the USB signals
> on a Type-C connector. Describe the optional connector subnode, make it
> exclusive with the AUX bus and port@1 as it is impossible to have both
> eDP panel and USB-C connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


