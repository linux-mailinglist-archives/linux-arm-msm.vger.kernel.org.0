Return-Path: <linux-arm-msm+bounces-94470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OshLki5oWkYwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:33:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0591B9DB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AE9830AC3AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE0242EECA;
	Fri, 27 Feb 2026 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sp9nsuE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06043C041
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206036; cv=none; b=kWBDO/0b+EnmMuymv7B42bbUBvV/Bgezc6UlbmZMoBvDv+A39fKoufnvnOAGoG+cxu/E1BCFAhsgGHHfVKksX5PL+LPQMAwYH2RkCJpsU9b24zaHb4/pbU2NfpUe8q7eOkkGooKfb7YNFxnaZHS9/SdNIjmb5nhHEwOs0pix7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206036; c=relaxed/simple;
	bh=GzC4h93H17YX/ggr8BPgOan0PgivoK/O0/Eh2BX8HNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8pcEc3UbkWfe9k7bH/7zTSSCDWbd1kDM8WgMTzJywJrupqrH/GpH1dvEcicV2rDc5F7s/J5LkCkHkX2MTdY32oN+iqx6R5FHZ52gR3xfZT75lNjrv45RYxaEOkgh9ov4o2NCKJvbrTD8gvwyY/STJ91CF8IcZ2CDeFl5jIkx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sp9nsuE1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso2691645e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206032; x=1772810832; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=;
        b=Sp9nsuE1hY/npzy+J+G1IYKGoJeRyazapxrXSxjM02lfbgfoYTqRr2XExOUmxSq9Ak
         Zs7Q634L1JJUpmf6/fQw5poQR7ISmtDxuD56bgqmpdb0bgzNil6eCf2HrxkJkChUQJPX
         R7nZ8sbsZv3WJS/hlN4ELeaaHXm9MNUtrgfqP8BvpmuvwvwvJvYRhGhioToIRn4zhOzR
         IE0imA5X9NL6N9VCb0z5M2Rw7/N2M6AHjaQPFRoZM0Ahmq8UCf/1eMgUvO13TneqIc14
         tfxKl09qELuNFyZfMCODDm78Ol5BS9jH8VduFLosOzcMK+b91wPpCr/4KHXKaxchJZDu
         VyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206032; x=1772810832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=;
        b=bBsYgBX+Mj9i+J6bCWcLhyDiREAsrRxtcGurn8NyfyDYoi3DBT46g5SScl0ZgAtVNG
         uDrukt99F2u/ECCL/MIiHiYhn8wRth081A2lXINR52DzkB6qVQ9VKCy/bAo1QLliT+IT
         EMM1+hQoVlQuSf7rkoV+Hk0e3RXwh+jCFhCD5vVqEqjWpcD9oYmZsn4hGS0Yt6HhhNO2
         xbAn1S+e/HsEenQqiEGeeTOHSpV+aSDW24FNXMhJCwesPO6Hi9SHDhuzLY5u6G+PWlAo
         PCwzT9qjtwZ3XGnPWykVWxY3zRQVsYoBQslA59X71uLT78dLG1LYH9R1EMxhNPWU8E2t
         TK1w==
X-Forwarded-Encrypted: i=1; AJvYcCUWoN+nsQPn2LbIsug/om05CsVqiEXhjJNvJBU/GyhTnAvPZbqGwEj12SGPGcXyKddMAOqVEZv6jF8VThoz@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJSqPuKmSfB2k5kH7qUkBVxzbrB/NV7X96FEWFUO0Yo/mGDNo
	Glbozjc9T6EfIYOf/mmVJ8/IQLqgFxRRPGC6nr3vrnHJmW8s5shVF+A3
X-Gm-Gg: ATEYQzwCKCqCqTNTXhMVkuSRg3j1XXVuLuYU8sRmJDv/Gjbmjvyo6FFNirSj6EevLhp
	pCz11qO5ZhwUblWJ8p8jUTN//cZXsnhbepGbNQP5erzssR3C1MLwhkEkdwstM8EDlL28aZOXHRV
	GHRJPyU/JwF2FNwZShBfg+o2Lc3yIbqq1WpeGS652Fhg8AZJXWAfPiIyVl0qqVCRhEljE42xVv1
	zSVx6HScbs65FsjM01gIhwvOylmtHeCVFHma2RcXqbSQpS5ruo/ech1+5z2qEB0jBvyATWTeMjs
	qZLeb2pgKcrRnI8RQrEZXwMGjmbAHH1A76uJ3B2eL3+wKODeBvHX/Y+AieE7s6rHtUgavdRUHTW
	p5cxT0sipj9JnohNh4i2TJOQ02skgt2jd/wkD8IvoWpmFWy14Z/v/bWMxP9eHyevj08CJKoemH/
	E/Jav288WwXPz7uq1zqgYk3Ydg
X-Received: by 2002:a05:600c:444f:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-483c9c1bbdcmr27647755e9.3.1772206031724;
        Fri, 27 Feb 2026 07:27:11 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm360231605e9.0.2026.02.27.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:27:10 -0800 (PST)
Date: Fri, 27 Feb 2026 17:27:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
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
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <20260227152707.k5lobznug3xxxc7h@skbuf>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
 <aaGgWUpM2A5y11Wh@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaGgWUpM2A5y11Wh@vaman>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94470-lists,linux-arm-msm=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A0591B9DB2
X-Rspamd-Action: no action

Hi Vinod,

On Fri, Feb 27, 2026 at 07:17:05PM +0530, Vinod Koul wrote:
> On 25-02-26, 09:02, Russell King (Oracle) wrote:
> > Note: only 8 patches in this series, not 9 as the subject line says,
> > as the set_clk_tx_rate() patch became part of the first series.
> > 
> > On Wed, Feb 25, 2026 at 09:00:41AM +0000, Russell King (Oracle) wrote:
> > > This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> > > 
> > > This part of the series focuses on the generic PHY driver, but these
> > > changes have dependencies on the ethernet driver, hence why
> > > it will need to go via net-next. Furthermore, subsequent changes
> > > depend on these patches.
> 
> This lgtm, can we get signed tag so that we can pull this into phy tree
> as well

I think this series is obsolete. It has been superseded in the netdev
patchwork by:

[PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further serdes reorganisation
├─>[PATCH RESEND2 net-next 1/8] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
├─>[PATCH RESEND2 net-next 2/8] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
├─>[PATCH RESEND2 net-next 3/8] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
├─>[PATCH RESEND2 net-next 4/8] phy: qcom-sgmii-eth: remove .set_speed() implementation
├─>[PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
├─>[PATCH RESEND2 net-next 6/8] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
├─>[PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
└─>[PATCH RESEND2 net-next 8/8] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()

(with which it is only partially overlapping)

I guess you should give your Acks there as well.

