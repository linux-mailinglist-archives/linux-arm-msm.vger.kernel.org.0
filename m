Return-Path: <linux-arm-msm+bounces-90674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JWICCF8eGkFqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:49:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B191445
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7304030078C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395072853F7;
	Tue, 27 Jan 2026 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="mlk+gWDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973178.qiye.163.com (mail-m1973178.qiye.163.com [220.197.31.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43D279903;
	Tue, 27 Jan 2026 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503762; cv=none; b=jqmd9hYTwTspgI91a+tiFfAMJVak8Bf0hH00upvJAtaDoPqXdMc+ax056Mq9dL66i6tvDwXqhh9u/hLpU7pnEFWoLRCyQccJ5SP/N+wFFSNVJov5fH5sQMuixXYf4jzQEBFWxdSHMxfL9sx7ceJhwZ5tYLRDsvfHNrV+0eJDkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503762; c=relaxed/simple;
	bh=VIzK0xG7aXFFlEfbs8uXle4LVOvvYl2JEUZDRMp6i7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRFOri7Wy3qRWi19RKWw8Ggkucar3utiwv3ebL5z7Q6kTbqJZrvj8k9noQul1d5SnzOkROSCMZtBEX4k62Yklmby6s93PqXo5l1motNw1oyCT6U4sfKqin9u/vlBC+4OeRwq9q/BrjoTFpeWqRgAAVjg17W3q0gRMPFrQ2OtpWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=mlk+gWDN; arc=none smtp.client-ip=220.197.31.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 321e5e450;
	Tue, 27 Jan 2026 16:49:06 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andersson@kernel.org,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	hongyang.zhao@thundersoft.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	rfoss@kernel.org,
	robh@kernel.org,
	rosh@debian.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	vkoul@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: lt9611: Add dsi-port-b property
Date: Tue, 27 Jan 2026 16:48:54 +0800
Message-ID: <20260127084854.1714905-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org>
References: <7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bfea4675109d5kunmba5438e79bdb8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRlMVkpCQ0NMGEtOHh1DSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=mlk+gWDNP+RqWapm0pGEHyn+VNIojWyCvX7Gej8QBEvR0UOoYJrKDabGcSKBLqY7RWJzGheg4L4DEAE7iMcn2Sq8TuXZ8sPDWLjuleu+66t6roxCp3BwwnvVSxy16FIb8Sk+pUecX58R/gJKyAZy7sLyDxQbE21vr5hkZ9met2A=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=ReKCnW0AuE/9mtifNT8wvXgnWudkFHiGhNf2b73WgFA=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,intel.com,vger.kernel.org,lists.freedesktop.org,thundersoft.com,kwiboo.se,linux.intel.com,debian.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90674-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid]
X-Rspamd-Queue-Id: A29B191445
X-Rspamd-Action: no action

> On 1/27/26 07:58, Hongyang Zhao wrote:
> > Document the lontium,dsi-port-b property for selecting DSI Port B as
> > the input source instead of the default Port A.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > ---
> >   .../devicetree/bindings/display/bridge/lontium,lt9611.yaml          | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > index 655db8cfdc25..9b7dba4e114c 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > @@ -37,6 +37,12 @@ properties:
> >     vcc-supply:
> >       description: Regulator for 3.3V IO power.
> >
> > +  lontium,dsi-port-b:
> > +    type: boolean
> > +    description:
> > +      Use DSI Port B as the input source instead of Port A or Port A + B.
> > +      Required when the DSI is physically connected to Port B.
>
> This is not how this should be solved, the ports links are here for this exact purpose.
>
> port@0 represents port A, port@1 represent port B, so you need to describe the HW correctly
> in the first place.
>
> Populate only port1 and in the driver check which ports are population and change the
> configuration.
>
> Neil
>
> > +
> >     ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >
> >

Hi Neil,

Thanks for the review. You're right - I'll use the ports to describe the
physical connection properly.

I'll update the patches to:
1. Make port@0 optional in the binding (require at least one of port@0 or port@1)
2. Update port descriptions to clarify port@0 = Port A, port@1 = Port B
3. Modify the driver to detect which port is populated and configure accordingly
4. Use port@1 in the RubikPi3 DTS since the DSI is physically connected to Port B

Will send v2 shortly.

Thanks,
Hongyang

