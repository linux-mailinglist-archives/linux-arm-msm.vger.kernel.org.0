Return-Path: <linux-arm-msm+bounces-101852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG4QBXdY0mkqWwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 14:41:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BE39E449
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 14:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7FA730078D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 12:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D44341ACA;
	Sun,  5 Apr 2026 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mm.st header.i=@mm.st header.b="UBvJ/dYd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h/zlEoIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74A2749ED
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775392841; cv=none; b=elNnlytQHVXvyM51I7kV5v/aiVz1ddRpUVJLiZbAsh2t3Q2OT/Xl/vKmoZ/li6rlQDA7lfGqroHOM9U6/1z7Se4Wo7P7AM7B5rHbhIZJR+bLjXypYls5aZF+S8ApwijKCn2KYTCogbz9pU3PCHo2vpwl1REop8ZMbNs3xD1eoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775392841; c=relaxed/simple;
	bh=HQFp8ooP96QTzvjwCJo3hOHyKu9pYT2dLvWCl4J1f1Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=NoWLHH0bShx6lr8z0HtMA/Yhj76FDJ8gv0wd6dpoxR+d9dwUKZEbFcI99H/i12lEuipfXkjxc9OteUVyl8xn/E8okVWuGr/FuX+VrxVcraSSqJ3KMNbjNQUhN2P3d5omgKjcVwBpSqNSx1M6vZXmARfs7R1KYCpP/Qd2mBzv1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mm.st; spf=pass smtp.mailfrom=mm.st; dkim=pass (2048-bit key) header.d=mm.st header.i=@mm.st header.b=UBvJ/dYd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h/zlEoIa; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mm.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mm.st
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 005347A0170;
	Sun,  5 Apr 2026 08:40:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 05 Apr 2026 08:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mm.st; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1775392837; x=1775479237; bh=qvhNMzF2Rd
	qRowlPz7NRArEVYUhW5TkuePlxZ54jMR8=; b=UBvJ/dYdn/DiAEEyqyJk6PUrXh
	1WQX6lvPPPchFBEDN2I2h5oE1qLRgAynX54rtt8B9F1xyM6WDvQnLdTvwtX3QtfZ
	E7I71Yjx4kYB5lrIS0hN9ktMCQYFesNLOqfbzRxht1C6OE8qqksIsHe3i7ywzip7
	wv6whLdy2qphZsKUPvUdayzCW9BAag/WVUI5P2jOVuuMC5pah4dirylDM2NMYaGo
	r2L73tAXIMVQDjFAcIHOmeVYx5cK0VbfznrfEnQlHTczM1QzUTHEpaKB/UgOCMfF
	ZtiSgG/bv5XSbo35oBBg+lLDxjtW+1y3R3mNSc4SS6qhjj21C9udTzUWUf8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775392837; x=1775479237; bh=qvhNMzF2RdqRowlPz7NRArEVYUhW
	5TkuePlxZ54jMR8=; b=h/zlEoIaBvVn2LVYtqBN7rxxGZMB7Y7Uo8gM0plDzUsS
	5bjcGtjXRBzA52nuPELMjoY2JyicKxFqT89ZKE5adbe2hGwLH+81ldDh8eWbEDcF
	dSGYLdBRyTXe+DeHcv/1fJYQRwYsLsYCjcLRXNm6ac+mW2dJgxEPZwLnOTeihe2s
	FOe9hvA5GbW2LUIxQWRgF0GaGqrGwQHZCQ9lQZQXyqmbT1kkpU7wBLGZR5zy8uXZ
	bAcCW6G05Nwosp9dIPgCDOsXULgvaFVutxLTOIcGetN8wemLul2MIil0Ot+eM1sC
	AQOuxcu2kJPV2qRiMMLhxKYHtjAdvzk78MZWlOSeqA==
X-ME-Sender: <xms:RVjSaZ2EXxoYmzRRhjkPw7H7qg8sZld4i-9NNFyR-oAYWvfKYLVOkA>
    <xme:RVjSaeDNZppQrQvtQLuzMn7AUgiadmEP5uZNRQTwl4PSl3ieg5avZgIJrRkABrhyz
    PnHB9YRJzhEKwphoeF_Qjsahp5HpQJQawtkW8sHCG_n6BwrG1Yotg>
X-ME-Received: <xmr:RVjSaRdmAw82gJA_SRlw2YMqeGkU9uJt_YhkptGEONLopCmRpWzFdNC4mswsB175jPCP9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkfffgggfvfevhffutgfgsehtkeertddtvd
    ejnecuhfhrohhmpehnihhnohcuoehnihhnohesmhhmrdhstheqnecuggftrfgrthhtvghr
    nhepheekveeflefftddvueeujeeivdffgeeggfegheduleeuhfffvdeguddvgfevkeelne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhinhho
    sehmmhdrshhtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdroh
    hrgh
X-ME-Proxy: <xmx:RVjSaTgN9x5x5hHjeVNyvQfIUTBhzFek-IElJsWckTqTF8xOf33dZQ>
    <xmx:RVjSaZqjRcAFaARkfrALqKFv7hm7yYodZpnTUv2peoF2JTGpgm4Frg>
    <xmx:RVjSaTH8bH4oKo3gOyXH4-GB4B8Pr9FqVs2k9RSwlk62Tj3wCXc8mw>
    <xmx:RVjSaTlvpe4hUa2r9qwLi5F5ZRfKVx_azYX3gv6RWtfJOco7HKbusw>
    <xmx:RVjSaeKR04BAH_4Q2VDH90PYLxBDZEGrIN-cNhG4TGH1ZA0PKT-qI4G_>
Feedback-ID: i7990409e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Apr 2026 08:40:37 -0400 (EDT)
Message-ID: <3f4d2926-6d00-48bc-ad9b-ba48602be95c@mm.st>
Date: Sun, 5 Apr 2026 14:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
From: nino <nino@mm.st>
Subject: [BUG] msm-dp-display: DP PHY voltage swing state not reset on s2idle
 resume, link training fails (Snapdragon X1E78100)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mm.st,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mm.st:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[mm.st:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-101852-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[mm.st];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nino@mm.st,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A1BE39E449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Lenovo ThinkPad T14s Gen 6 (Snapdragon X1E78100, kernel 
7.0.0-29-qcom-x1e), the external DisplayPort output via USB-C Alt Mode 
fails to recover after a prolonged s2idle suspend. After waking, the 
msm-dp-display driver attempts link training but immediately hits max 
voltage swing level and fails:

   [drm:msm_dp_ctrl_link_train_1] *ERROR* max v_level reached
   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 
failed. ret=-11
   [drm:msm_dp_ctrl_link_train] *ERROR* link training on sink failed. 
ret=-11
   [drm:msm_dp_display_process_hpd_high] *ERROR* failed to complete DP 
link training

The failure also produces an EDID read failure during the suspend/resume 
transition itself:

   [drm:msm_dp_panel_read_sink_caps] *ERROR* panel edid read failed

The issue is reproducible after longer suspends (multi-hour/overnight) 
but not always after short ones, suggesting the PHY voltage swing and 
pre-emphasis state is not being reset before link training is 
re-attempted on resume.

Affected controllers: ae90000.displayport-controller, 
ae98000.displayport-controller (USB-C DP Alt Mode). ae9a000 and aea0000 
(internal eDP) are unaffected.

Hardware: Lenovo ThinkPad T14s Gen 6, Snapdragon X1E78100
Kernel: 7.0.0-29-qcom-x1e (ubuntu upstream for these AMR64 cpu laptops)
Dock: Dell D6000 via USB-C
OS: Ubuntu 26.04 beta

Happy to provide further logs or test patches.

Nino


