Return-Path: <linux-arm-msm+bounces-92041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFLOJ57vhWkPIgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:41:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AEFE51E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75265305B0B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B91E3A0B2F;
	Fri,  6 Feb 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xf9/ywN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6F367F56
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385116; cv=none; b=oHAGQFxutcuWmWCYE0AyKrEJaMh3ciqafBt9Alv+yn2S7Z6bPugQpoOJ3wZUf1N+/on4WErN7nBA1kFyrniokMUhwdN9k44Ps29Jh/JSp1qvScZrqtjNsr+cQD0rCq7BwZPWt6yXDu1xbUEpfj6VU9Y7WCtAeH7R5aTLFrOyDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385116; c=relaxed/simple;
	bh=CsRZyI/0CJXBnCrb8NeeHp8Pz5Znjh8bovcxhtKVDLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RRFbo6STEycdHDoeUSe1ei2jmG+k5fXimdwsT2BMbQAG4gn80+wxiJceyt4NeRfKqX0oGJzCyIHSVRmcUwwB2vhcXw6Y5GlzDZZvOn36qDpnWLYoQTB2+3RypEmrJzXl7h5M7w7wMSnOhJrt9yiM+fKUe1+fCfF32m3EPKFLHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xf9/ywN4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bc32725so5738445e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385114; x=1770989914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGaf7RjpOPMSJQSv1pfAOB/0Xi5hMSSLw6Z4u1Ofeis=;
        b=Xf9/ywN4JZwLuP3yClISFRfliTv77pLrEeraD7uYfNeyVQwo7cdqc2fa5R8aBeX0+m
         kmv8wuuJm7yU0qSrJ0Oh8XfUijuoxT8jrctzuVn41pFajuT/P0XCxenxYDIqsQFEgODd
         kPjNhh9iSA3AWdZG9Muz35kD31ls08Nn3FMhSc0LR8kC3/i8tBEhG4YHgPs0Q5Hfkqgn
         816nlVHgr1tYw0EjZvcTWBAxUyF+JsCRcyrn0mMiK51gTC6oBivYk9/4t4mG5BZcE0yv
         DfOmLk3kL0KgSTXW6cgXOMnyLNklG8ArKdySRqmsl/o0JlVuIVspVouGXfAZaYiCgdh/
         wIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385114; x=1770989914;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGaf7RjpOPMSJQSv1pfAOB/0Xi5hMSSLw6Z4u1Ofeis=;
        b=OYI2WQYUqKi8YA4kLUzlg2bfktjrZaxMpCuC+8LHpq3mxaivGj8j8XbWdfTw18RAhM
         t8RkjAD/XqI5pmqduEKld48EdcIeIY9UD53zcOnlUvHOJbGS27m2o/a6Ad0zygZ0/+qs
         BqC0kn7JKaTGykuHj4XtpMjfPpe0sj6DcSv1SnPwMLXFJ/fB+0ZJfMgRfnG7T7dyBxNk
         0aqCJ+8bypKzphpF/i4LtFYTGsu1eYpuvXciPcdolg20UT5pdVlsBUxNtScLei3l9UCj
         C/oU+xy3SJL2f3hYJol2C1xTWdN+0vYNonCJMyCKoF9JsP+cBeaA88RsQfMpgSyJKY9d
         26vA==
X-Forwarded-Encrypted: i=1; AJvYcCUxGaUv/31ffXtr5eqjmYcSRxaXgj5Vvos9FB+XbY8M7Q0znL/fViqt6tmg/Iu8mMG30jltNgy8fgHH7YKH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5pcD+g1WcFbj1TE0D75/peKLf8d+t9fNA8VFO1rPiTc3fdnS
	77q44Nfo0+DvTCAQqh9SShDipGj1EV1/fhrLiGeFFbYrYx4EgFzfLawVNZNUlGEBHcc=
X-Gm-Gg: AZuq6aLedS8kbdEAA0QnPBUjfRO3Omj9sYPQCsj2Tggpg0tGLSKDzYQmmMzEWx59hVW
	ZhbmSp/r2jJ5Nz09ZjLFjHaJR5wHjUIfGQabjZOh1PFTB+X0N89Wuja8WTFY6tTUqDv1lc1YIHt
	0RBw9asx3zvpneMD5yrESvZ8phdJ/rvG7FdGf+L+eIwYOJuWAmBvA+fsEAiQarPOAOXCyBadczv
	AIWxRyRPQqKavELzCE6CzOkv2kBPXB/sFLvtg9dXR6ZVZybvOPP0a9dB/SBLDisfye8KtBrvA2J
	ZP8DRDeaxCZqbQeyJ+CbP+XGfYioVFoQnjLSuhUaVGxEzCUT/vxuIUy3IEUEUc/3Hzcb6aEXti0
	pTQz8rAewaOlKWGpecmSaP7xJNdfVW2+kpekRuoEl1ooXMSgo/XQw4NyLJhP26a0TyaUFviGfof
	FcN0k1fRau6JCeqYYM
X-Received: by 2002:a05:600c:8b88:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483201d9fa8mr40917305e9.6.1770385113871;
        Fri, 06 Feb 2026 05:38:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2bab2sm231973995e9.3.2026.02.06.05.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:38:33 -0800 (PST)
Date: Fri, 6 Feb 2026 16:38:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] net: wwan: Add Qualcomm BAM-DMUX WWAN network driver
Message-ID: <aYXu1uXRG1KHrKej@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC9AEFE51E
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Stephan Gerhold,

Commit 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network
driver") from Nov 27, 2021 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/wwan/qcom_bam_dmux.c:505 bam_dmux_cmd_data()
	error: buffer overflow 'dmux->netdevs' 8 <= 255 user_rl='0-255' uncapped

drivers/net/wwan/qcom_bam_dmux.c
    500 static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
    501 {
    502         struct bam_dmux *dmux = skb_dma->dmux;
    503         struct sk_buff *skb = skb_dma->skb;
    504         struct bam_dmux_hdr *hdr = (struct bam_dmux_hdr *)skb->data;
--> 505         struct net_device *netdev = dmux->netdevs[hdr->ch];
                                                          ^^^^^^^
Smatch thinks skb->data is untrusted.  This is the rx path.

    506 
    507         if (!netdev || !netif_running(netdev)) {
    508                 dev_warn(dmux->dev, "Data for inactive channel %u\n", hdr->ch);
    509                 return;
    510         }
    511 

regards,
dan carpenter

