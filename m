Return-Path: <linux-arm-msm+bounces-92396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJZFGgyfimniMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:59:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58F116947
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37D2A3006D53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8381227A904;
	Tue, 10 Feb 2026 02:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW2oBkJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA473A1C9;
	Tue, 10 Feb 2026 02:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692359; cv=none; b=dzRo5281p/T08/3s2PKHqgBvA999lE6krCz/koAyW5DfmCZ0VwKrJK0b8rP3AjignPfkTJHX0YMIJG269F7PPv8ltPsNaQ6E7lDIY+3nu6+RjqoZuVFGXjIiHKpRBAeVEPORQIlH1NlOIZdGHhO+yAudpUi79auBgR5AZef3a8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692359; c=relaxed/simple;
	bh=sswvim6uo0hgfdQyfqItuvNUGxUG69xSNcPrZzHtTvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjnflJTo60hdwKV1e+prSV+RXmpwiHkw6wt+CWSa8FBXrm0AucdB6wiMjV9cfjTsBGgACy1uxVAS4mq8HOr8y2itVIGRl1sOzLNtrFoNlm+oxfv9N8EqrcXjfu+uZb8ijoOIcENFiQ9RuuX7qx9OEiXOm0gTm5FytL7MXQILWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW2oBkJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B92C116C6;
	Tue, 10 Feb 2026 02:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770692358;
	bh=sswvim6uo0hgfdQyfqItuvNUGxUG69xSNcPrZzHtTvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CW2oBkJ87Q5j6c3n3zIazQIBEGASBkmOy/Z6Zy1q0ZMhstulJXmPfBr/oUUzJmE1e
	 03n66/UrHuvRwnqeZHvNbT7Xi3NkBDZ7wdClTAGmtqybLnoBl+GeD8cz28GS9hh1/Y
	 b6W7mMm26Nf0KZxJoHDk2O9MncWyuk4wHzUO/Pb9e1SONNj16wYbVPGeNrM7cutH+r
	 xc/KQZ90lzmBMzUMe6c5XXBHa2yE1GVjFmdAcRVzM6NbQpdypL4LAio1tx/boPbtSZ
	 GqKBr1NNEAmhoK0sU92ddneIr6fQfRLToiGXA/SDoMok0H5QFiuA4cIq1850oZ/Yi/
	 5i5DtFtjvtdgw==
Date: Mon, 9 Feb 2026 20:59:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	dri-devel@lists.freedesktop.org,
	Christopher Obbard <christopher.obbard@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Bjorn Andersson <andersson@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>,
	devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: lt9611: Support single Port
 B input
Message-ID: <177069235725.2401457.4430450777112402794.robh@kernel.org>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
 <20260207-rubikpi-next-20260116-v3-1-23b9aa189a3a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-rubikpi-next-20260116-v3-1-23b9aa189a3a@thundersoft.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92396-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,lists.freedesktop.org,linaro.org,suse.de,gmail.com,kernel.org,ideasonboard.com,ffwll.ch,vger.kernel.org,kwiboo.se,linux.intel.com,debian.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 8C58F116947
X-Rspamd-Action: no action


On Sat, 07 Feb 2026 15:32:54 +0800, Hongyang Zhao wrote:
> The LT9611 has two DSI input ports (Port A and Port B). Update the
> binding to clearly document the port mapping and allow using Port B
> alone when DSI is physically connected to Port B only.
> 
> Changes:
> - Clarify port@0 corresponds to DSI Port A input
> - Clarify port@1 corresponds to DSI Port B input
> - Change port requirement from mandatory port@0 to anyOf port@0/port@1,
>   allowing either port to be used independently
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../bindings/display/bridge/lontium,lt9611.yaml           | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


