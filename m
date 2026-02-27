Return-Path: <linux-arm-msm+bounces-94478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BsyHEi7oWlhwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:42:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B821BA0E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F1D30A7A7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BDE43900B;
	Fri, 27 Feb 2026 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KguO3zMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657343D4E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206833; cv=none; b=Rd5iDyggRBTTlWqLCMFO0YuUnDo7+a6VWJHlaTa4YOsuaTf7jAuzk5iHfkNbSf7cr/xla98Q7vBgElqmegzCE2Y+h4N+WG5QEUnLZxoZrMMQe12kNyn2Izuqr6i/QCnhc/Bt0DQZcdMKNwzjjq4Uuqk/J8ley9P1QABP34q+Ljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206833; c=relaxed/simple;
	bh=B9cYTz3/Azcv65f/loLdlB5667RSkLaa+xjI8VMfNhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmIPsIgmmbFXBKPymMTKo1L250hzP1SttENkkUo6n6c69j1QIbw6ttv7kF1N2WPKYwipaGj+9Gk/VCc8vKI8hNIawDIQICZDt6jODngNwwe6zwz4pL/f2kk7GLUWIkENaIHfq2Z2bjD42lIYK0cUak7Br+ghOcqQI0BQL+wbsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KguO3zMB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483bcff7a3dso2710855e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206830; x=1772811630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=;
        b=KguO3zMB8kkd4uOFjbr3v04KGhhDp36BOHTIclrK1xkhSYlEtiEvT13Eaozu0j4ptQ
         GwnNdbhSYldmEWMMevRS60ipTM0BSSTpivU1MescDGX4+hGsF3Y6EyMDNInH+77Gavuq
         XZTmxLOywwrycT8bVMXKy0txewx7V+nsz9Hl5oLlZWVonKKT/8ubw1Ha2CR2lqbeVmGS
         3FLd54sX9l+GnA+DEKf3dJtcgBLH0nXJ3Obl1dTwQ6h1HQfCJLnbk54C7XEZOVyGGusc
         A7fgKgDuk9fL/TQm+MtVO4sA9FxN4H+mwma/GvaUXd3oOFwjmGYiRd+v9P1GqtwHG07y
         iTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206830; x=1772811630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=;
        b=m1F2Q3+qHtPaGF3/jO2E0fvTP3ybscgEmZJQ6jt3m3jQN8ls8rptyuF9qHc75gNldF
         pu7wVIMAsW67GG8xRva7DXZEzh4ta6Dm4idQzgge7HaG3QtgAhHsWqAnFRaHG2WSEbGO
         EPFGoHiHBg/r6ILcTuOPhZnl55C5w0TlKJHwUOVnp/aGQ3DzsrhXSRxGZVHFiJ+7r6M5
         7MpmA4kbLxxDtKq9iM/3M29kHQQBeHaRe837rpCZ9cVJStfHG/1W3IzrVZiJGnzaG/fp
         RM6gbxYdKLNfmXIU7xUylnomHzKeAs/gYSfLw+IuUmkcoS1Fd7Zuyjr5hduiytGlSoc5
         rFVw==
X-Forwarded-Encrypted: i=1; AJvYcCUIP926lWeOhFe/1AyMb3BpSWqdLytTO7ERqxBsFBHPOMfxJ3CUW8klcsAGnQfjTdKezn8VSZXZeDWHPXp5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lkS9i79ZWec/5te4DHbCrXYrfdHSRDq8vthaoGBtuyIKDzqu
	AnQCWL689YsyFPyGdg6EHOHS1m9s8TbyCUUhxf6lTCMzQQ5yr0DhFsT4
X-Gm-Gg: ATEYQzx0vsW3QbKrkzsdwSmdYqhv8QVrZD8yhJjQxyz00nhOZVHoBDFVV5043QGKg5d
	gMCKvkpfYkJGquvcraDXMnrePV29zKfOQXZauydYS3OjYVkP+rkRZFo6iv2pPraw0U5b+RDk6GG
	qDFrzwn2yjm8JBytKZyAikymwZG5H5K0BPguP6N36xWP0YFmM0LU7GDx3ci8bCJueDVu+mWlVik
	JOsDNeV0ZG1XxXieBhdv1NWn9Xd2S6NQcQpzKiexNSgGux3NZltSiAbwJXhrHQ2RAW2+9G4n1k+
	rWFldczzb7Lusne9bDxQ6q4FgcJAH5783Qbb7CyACkXR6y0KpdGlliwac31zGaKY4Ivs6PxtqER
	QdK1D/Qh/PFw9TxHp+KR6RthOGhCJwBoF9hYysLt0GDiDT4KY14xO8NzsnKdvlvHI9G5Ci6ju74
	0e2tE8fCzSLcd0sw==
X-Received: by 2002:a05:600c:350e:b0:483:79af:ca1e with SMTP id 5b1f17b1804b1-483c9be0523mr30417725e9.5.1772206830140;
        Fri, 27 Feb 2026 07:40:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf016sm101582255e9.5.2026.02.27.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:40:29 -0800 (PST)
Date: Fri, 27 Feb 2026 17:40:26 +0200
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
Subject: Re: [PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth: use PHY
 interface mode for SerDes settings
Message-ID: <20260227154026.dx364j5scae4epqw@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94478-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,armlinux.org.uk:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 14B821BA0E1
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:42PM +0000, Russell King (Oracle) wrote:
> As established in the previous commit, using SPEED_1000 and SPEED_2500
> does not make sense for a SerDes due to the PCS encoding that is used
> over the SerDes link, which inflates the data rate at the SerDes. Thus,
> the use of these constants in a SerDes driver is incorrect.
> 
> Since qcom-sgmii-eth no longer implements phy_set_speed(), but instead
> uses the PHY interface mode passed via the .set_mode() method, convert
> the driver to use the PHY interface mode internally to decide whether
> to configure the SerDes for 1.25Gbps or 3.125Gbps mode.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

