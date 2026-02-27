Return-Path: <linux-arm-msm+bounces-94476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBi4Klm8oWmswAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:46:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 474981BA347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C7AF3097456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C842E43E4B3;
	Fri, 27 Feb 2026 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFm2y5wr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0F543DA51
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206667; cv=none; b=Armkkv9PYoUzRZla6dW/h4JEHAIaThzfx36LUq0o4vtJnEgAtY6hi5GwrRn5GSmenLWuNN6J8/vcR9dCK+2UYNcqn/I68Y9x+xBC5dqEmDA0oQXf5Z2DmCnfsp+bTzTHdt9CChZ2QygrQrc92aWhp063deG+ZRTgI3QhnHJ3jmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206667; c=relaxed/simple;
	bh=aSOAVo+8V6Dx0KAtx52ET4C4ikY5EHCVCZr6BHtDySk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAXKs8Y3gJ6bofs3hm8LLt54iIjmikAIh93OvJM8F+PqB/Ld3zNET31ruD4L/ipttgsTcpIG5ki/z/WYtaBGhasQ/8vvfWNUFohd9BdpQ42AiWzjjuaoC+aO1cB4C5J97ax9He3o1n4e7Y93fRs+a/sZ+GR0nu5kcQF9GevQusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFm2y5wr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso2705605e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206664; x=1772811464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=;
        b=DFm2y5wrBmJssKYqHl5LA9zF7PC4MhA+i5xvabmMUxcISI/F1vbbjmysNAiztEWNde
         ikXYFQkbvP2YAmrqD0oei3CV3xSA9OOhvffOyJDz4GinTBpE4R4Im8MMqKqqn1RRhS4q
         hBy59q84zGZ5g6u5Jt6BqPZx9pn+dflByfw68dLXLgs2Y98uCE/ghD7ZPHIj+pgjpEcY
         faHncy/b2K0xByv827aw6ru/MXCN059MDpyffyZjg8RFvzRPXfcz54c2hh8hiAv5xIVs
         HZO20OS/hOuPp26B01TezmpkfJu/rm9xAIqLVEa+AhJWs2OeQc4YbNMxUGic4iYIUxwq
         UqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206664; x=1772811464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=;
        b=PcNmatnlaPysS3ffT5ba0Eg9J0Zfv4wuCMiAvYNXt4kDR6pm2+4oePDYqln8/I+twe
         1a5KLxMkPNOeD+F7N778uu6ENetdKkOT2IX7eJi3JXAkuDpSyBFaFATcbfE7yBqDXVzo
         uhS+QclrHmWzeg6NRVMqUv7h0qevv+x+v4jJKOlcwNZMmE4Bk6mzBsfVOBKCfVR0Z7C0
         FN4Rnlj/obzR/NUltneC3IZz/bQa3NBsuAN2pZzmedxs49DWfJ9CisZ8sDPMMYVCGoo/
         XZpQZw2lIQD3MTAaYN63FdXbes7ht8N+Pkmoh03amJpByN6gttvgvtehL59+P5VCEYXW
         oWug==
X-Forwarded-Encrypted: i=1; AJvYcCVnjAZPis3vodN0x20UOd9EH/kACcvr6S1XEYCOj7wSCLnRg54rvFeHF50gyINQN9RXqrd63Ohq8R6AG4y9@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFCtviehX6YxzIBjdQlbWJ2c4/yBRr/bbLd3z/sdoC9zMpH4I
	EHHdrBeUt6gNnQchsdLYIE5c/o64/R2WXKdT5eJLxYpW2d2Rkax2yoVg
X-Gm-Gg: ATEYQzyRWjmDmpixIH7WLwGa0vA3oM0mJJ/6j1sYGDW7Zg2KqTqPpMKoNfUSDEi/mfF
	DQzW044hqnPrxv8s5eHiLlKSJToCrDhky+aZS0OLpowDzWU5p8EohTEXeUivTkHTZS2ctU3CbJ8
	FUEejf+gy7QLiLzbQxBIqRHehr5OXekPyYjzyFwTeleEry3QdFMNl85m/VyArSpCov+kZNBj9D+
	/p1dlRhXUSma8ri5kRju1rTc4djPO7GpDNq9RpdOhDJ74XISiZtqYd0iBOySDBkK0KuQiIjmhOa
	JVrEPaUnfki/h0n3ysC08Wi43C5J/LM++rRCTQPWwtIoqK6ZhusPs2LIK3P3Si13yw/y2SRbvdI
	4QTxDO95Irsj0NJ4Ye7xXOHL93RvF0VwE7B12e5APoPNHsrV7U1Ugosbdli5F6W6KHSPT00WhPA
	yfjNdpCjap+VE/dw==
X-Received: by 2002:a05:600c:444f:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-483c9c1bbdcmr28085255e9.3.1772206664464;
        Fri, 27 Feb 2026 07:37:44 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776a3sm84332245e9.7.2026.02.27.07.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:37:43 -0800 (PST)
Date: Fri, 27 Feb 2026 17:37:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth: relax order of
 .power_on() vs .set_mode*()
Message-ID: <20260227153741.e462gzmv7t62r5uo@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUS-0000000AuPh-3Il7@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUS-0000000AuPh-3Il7@rmk-PC.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94476-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,armlinux.org.uk:email,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 474981BA347
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:52PM +0000, Russell King (Oracle) wrote:
> Allow any order of the .power_on() and .set_mode*() methods as per the
> recent discussion. This means phy_power_on() with this SerDes will now
> restore the previous setup without requiring a subsequent
> phy_set_mode*() call.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

