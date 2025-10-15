Return-Path: <linux-arm-msm+bounces-77312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93872BDCD4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 740984E00C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7E22FE577;
	Wed, 15 Oct 2025 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pIMAy7US";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="boCC31Uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113181C862D;
	Wed, 15 Oct 2025 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512220; cv=none; b=U1hvxH5Lp1D7F1sqP3L7y2P5dpA4hhiaAKMMrj8yfhzrHp/OC6VqJ7WOEcbQtGfEjc538WcMilwyw6Q3P/CmFDn04zncKsvB/K1mz5ynwy3wDMYcRNh8GT2hTdyAOdXtg+p4hs7Wv/f6hR85zWMySVTJHbC/58xvNkSBPEWFHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512220; c=relaxed/simple;
	bh=xjFb/R64+Mh+Q8MYe3VYKI8MbvFlUcAzZe/59ZCPYTQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=efQRk+1Ml90O81vjZmLDvUh/EIY9eFXCWeUss+HJk+XTXDWdXbk92QpxFuveXizeHSNvwjxFe5J/dH8Z+jEvtlwqG87Mxe5vv0Qq9yW2u8BRponwclC6XFUu0uHKKcSvhc+kN4WLMgSiyq74nwAUHbu2bcYsGauBWBqic8q0/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pIMAy7US; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=boCC31Uv; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id DA4AC1D00075;
	Wed, 15 Oct 2025 03:10:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 03:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760512217;
	 x=1760598617; bh=nFNokHi/WzeVa5PH2mR5LLVWP7WWc0ISJYIPyJ+q7z0=; b=
	pIMAy7US4Y+ijfMOhbsx399Avwmn7SnDDiT6aVV/r6mYjP8tzg3NdkJMwEGuY+so
	pd0x58jbpw9NmE9Dw2SC04EGtawy2EETosTalw6hsRrgYPD7bKJ2q9GFIo9lYW2/
	9Z9+p0Lb0Ke2FOmW57j08A3qri4U9qc/uPjGtDv7nt+e1eaAQdXL3SR4Bv23XJB4
	jMnGAcz5T2mGgYdBOkMguAEa3ZRDdOJIMYYOXiroiT8CFjMt7NNPCjTA0uXCrWq/
	q8w6rpiUivxdKDtRj213Xe85ZQgG5F/pGLA626R7ILDnBc0cG52FbrhGrMPM3udC
	INfye2qmvSC30TcBKm6wmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760512217; x=
	1760598617; bh=nFNokHi/WzeVa5PH2mR5LLVWP7WWc0ISJYIPyJ+q7z0=; b=b
	oCC31UvD4+hiXV6BCMdfucTMX+UexoljhaF1+oOh9Mpu6c2p9thql8kxH3hQq89B
	PUfT4s52vikdUNDrCZiMmLhDCYPHl/OM/2HEIOMda7KiEXDTqyVOfkj9sMFW5Vrn
	z3aHLUaXsq0dtyc/AI3+li9SY13BoO3uVx5pvQ/YqhoYfi8r4zLWrG5G3ptc6u/b
	tQNIPyqIamxrJbbg2+PS+xbCEptjfO19b/YkBRp2yfg52nvI6Z/3TSwqY/lbn8Qx
	tGQpZ5XbpzaAYCvaGrh7OIbPoJa+7488AglxNw2f+J7Up7oaQcoBgATt7/Cn77Mp
	hkU6tivPW2xEQLlI34PuQ==
X-ME-Sender: <xms:2UjvaKhVJ_wWhWmKlw7vn-2BM6-8tq5p8DJxqqXXVAozMBk2E7HOIA>
    <xme:2UjvaF08IzbVUvoH1PNuT6aRcVrZ4VbdJtLmnIU4fDrYh5qNBnJGmfaOMgJqXucs4
    _XXCG4yNaaD6Oqn0CXqIlCHLEODc-uinVaO3WjjTbMGf4BVpSUwBo3j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddvjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrh
    gvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurhhi
    qdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoh
    eprghiqhhunhdrhihusehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegv
    khgrnhhshhdrghhuphhtrgesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoh
    epjhhinhhghihirdifrghnghesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthht
    ohepkhhumhgrrhhirdhprghllhgrvhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprh
    gtphhtthhopegrmhgrhhgvshhhsehqthhirdhquhgrlhgtohhmmhdrtghomhdprhgtphht
    thhopehkphgrlhhlrghvihesqhhtihdrqhhurghltghomhhmrdgtohhm
X-ME-Proxy: <xmx:2UjvaGECYRhCQlIQVItARlKccnBiUi6GwJAWpxH_k2ULhbGmbKf3kw>
    <xmx:2UjvaAt1Q6qDPwze8_lD_Oehmr24J3Fvyr26_m4nGWXwUmKRKyC6-g>
    <xmx:2UjvaIr1A1rQAnLJeuOQs1pGXdP-OKCc-vXewRF8Zn_qjX-P3T-qNQ>
    <xmx:2UjvaPkFuiWsOB_kZj6S9voPxQ3NsEgo5KWi_PLe403EIN7oNsvP5A>
    <xmx:2UjvaJ0T39pEdaQwa50OSmwt_b5Wbyb0rpJzxbeOJheFm8bfKEYVORkV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 57A57700054; Wed, 15 Oct 2025 03:10:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFtoOdvkewRR
Date: Wed, 15 Oct 2025 09:09:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kumari Pallavi" <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, "Srinivas Kandagatla" <srini@kernel.org>,
 "Amol Maheshwari" <amahesh@qti.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Message-Id: <ac42d5cc-1db9-4e81-8613-ca1ac9cff9d2@app.fastmail.com>
In-Reply-To: <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] misc: fastrpc: Add support for new DSP IOVA formatting
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 15, 2025, at 06:57, Kumari Pallavi wrote:

> @@ -2291,6 +2319,22 @@ static int fastrpc_rpmsg_probe(struct 
> rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	struct device_node *root;
> +	const struct of_device_id *match;
> +	const struct fastrpc_soc_data *soc_data = NULL;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return -ENODEV;
> +
> +	match = of_match_node(qcom_soc_match_table, root);
> +	of_node_put(root);
> +	if (!match || !match->data) {
> +		 soc_data = &default_soc_data;
> +		 dev_dbg(rdev, "no compatible SoC found at root node\n");
> +	} else {
> +		 soc_data = match->data;
> +	}
> 

Matching on the type of the root node is not great, as this
is both a layering violation and does not scale if you need
to do the same thing for future chip generations.

Normally this should be matched on the device compatible
string itself, or possibly based on one of its properties.

If this fails because there are already dtb files in the
open that have to keep getting supported and there is no
identifier in the fastrpc device itself, you can use
soc_device_match() as a last resort to match on the the
soc.

    Arnd

