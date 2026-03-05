Return-Path: <linux-arm-msm+bounces-95634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGyUKel/qWlB9QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:06:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325F212624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC781309AA6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7D22D8DA8;
	Thu,  5 Mar 2026 13:01:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33039659F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715713; cv=none; b=DxHAxFIFM78Moutiuv8iQQg92OAIpnhLYPCP3MXw4U4IrUsu/QQHzWG9FEGKKmMBAMh31WdUkVHeXIFMOtd3lIc/0/ApRefij730DIMxutzM7q1aMJlEqj6iRlBlVILK4UdnTIsNyooKEUWo0ifIMJcCMt20pH5+LkFw0Z3IK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715713; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdXfxmNg5b3UesVlPAvwn18zFUYQ5l1HPFeEbB/eCEkZYWA92Hu7BemczR8n1KQ/AUGevbJuVRyeqLHoPG/Pxa8VPEy9J3JqIgNj7SI41QpXWn4eWryIGhp7MBxsdycUQv5jwI8gFBJv5yQahqShyxs1WCoyUC/+D3VENxCV8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aaf43014d0so59794045ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715712; x=1773320512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=eeD39UCr65+eQYGYFqNL4JjalLV8EIN06qCPG3S5zfm0DyHWK8OFr304umzQI4FIti
         w+UosqFd4FbMoUswdzA8r/Pss1d3waPng8ptuveskgjDqv4q6sEMJRlB7IltKoxMyroP
         LonHKYZ3j0EuiXXDvupXgKISCkg1Jq0QFoWytOkCzTfkAG+fhXcvqh9duZNkc0qb0DUa
         PwANbfsTHWrxJXMPF2KAtBBGOY888jxHq+IXlZ5sVrjFgybjHkdBs1Y0ZwOmMJELPsbR
         6YTekeChl50zCfS9SUUP8N629UXAo/nOaVkwUXDyvN224d/IdpMD46aZzGyT8EYjR8gj
         WRBw==
X-Forwarded-Encrypted: i=1; AJvYcCVcgGyhhhRAkqz4XdUlrjsDHzOgrtwmmodZPEuBVB1ACEYuu4hAgkFIZ2icLNYTDcJofNEzplssecNPs/9/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXq2iK0oBMtgsRjrI+Sh3YpTc1h9EnZAcbN5vG+Sxjg4hfs8nd
	cZwDEt3q+kMTDScEIq/lyhBGsIPfkJTYP7WKzoky3orwE9m/R4NmUVyv
X-Gm-Gg: ATEYQzw6AMXVkMq1lAk9JfYBuphMkfCI4fOEJ2Pvm7tHHkkvXspwsPwQlS6Cbe+3itA
	0LapZZBViu+NG90OB/mLrlUc4GM4IAQM1Y6Lvhlj7MPpCIHBdUfKLTQTZEoNwFVl7uck0nDbUmq
	fUsDRnFAfH3EadomSwPsgkb1hMhxY+qrXhB9Qc2GjXMcnBQ5w8INhfGaan8RTBvdbAqvSxOw7tg
	rpDfKQyKw8eQE7BRBtKAx7W5sqLYbjt6iMJi+TteDrsgG2CQ9EibSuk/AH1uQATnZhW357Tqr87
	m1WPj+3AS8b7lRTpZ0thqYBgkQa3BmZFWYlgPpKkFENd6fw8h4XbYWj+nA1UR+HOzaj55vpKEp2
	wae9HDwGKD/tM6pPxtCgW4R5pxUbLjGqaWAc21gAIPKQsvh4wFcgRp7BKdwU4/k2nbWJ3/LAHRw
	u1rx4URmjcdIvEsyraQu/HzPmB0qIy596KRpNKmhEf71na+5KO7/8mWaWotPVt3nJ/i9FK/wk4m
	5rprnfn9MtlhdQRv1rKfTsrtPsMyO6tD0y6y/e8S+/lLLf3V/t3Cjifhq2heQ==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
X-Rspamd-Queue-Id: 5325F212624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95634-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof

