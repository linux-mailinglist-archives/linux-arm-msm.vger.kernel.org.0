Return-Path: <linux-arm-msm+bounces-92042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBMjIkbvhWlvIQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:40:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97760FE48F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 194B83011F56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E913D903F;
	Fri,  6 Feb 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTIOfwJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACD73D667F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385161; cv=none; b=DGxugfmSYrfsPtkM4BCmyJqTd9lFP1I+8Vq85VPfo7L85iJtjMV43o4Ii9vEeXdQei/01Adp0VG9AoM3DyNDp0GMNns0FsVaUZIO/22OEdljmawkKpcOemQzmKAAJGnE5DiiTV/fOyh+AcjIACEyyY30N44Xuwryhkbote5am+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385161; c=relaxed/simple;
	bh=0Qw6hB+Nw2XGW1mInvxA4FANXWw4l14cjCxZ4XJhV14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hc6HwCx85igvUwOYA1wjqbsGoxnVYcbSoXvbh6GbBvbBvyWTj8owxvrAzqeyMoOJSaGG/Z0mMx9oVh2JujUJ8Vo7VP0zDoxFRLOI8vx0heRn5TImQxdqzk6WTEE+lPKIE16XTP7SBD9+D3pCJplGoUeb/gTwxXEwKwqLQ0OFgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTIOfwJT; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48068127f00so20265095e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385160; x=1770989960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkmg6MECDuPF+xcEwX762rYgEkjZEg/GKrH4QFrx1WE=;
        b=oTIOfwJT8MKS6nWzQAlVvh0VEvgRxl4lVwVVgVPlG67hVvU+cyEvcW1TCnS0O/lGk2
         Q2lTq0RchRcDNjJi3J4y47AGfKxYU2xebPea2UoBhCy9WECc0R4m0We2d+H9XzD357M0
         78N6wgEnPq8sPGGD2LM4Bh5BEoWDXy3gGFbXbkwQ3GdNua/T/HYQdfioLhpA9hjHQ9tz
         3S2OFzDyIo2SEj4AX+mE8/HOpj+0mQ/R2xDdl2WEQhOR5hVdX9Lvl81tx7VfOfWUcxfC
         px2ilBG3QA9U4o3folBwL4OUseh/H+KP2mDcpfJVzBD3AeYwt0nAz6u5y67djWoXFqAJ
         Fxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385160; x=1770989960;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkmg6MECDuPF+xcEwX762rYgEkjZEg/GKrH4QFrx1WE=;
        b=vodhy24EAT1vDz/Dkd/PkBfESWjsMhJBO7B5m6lbF+jAnWnBAb0zWLjxLMJXUNrjU+
         mCMVVAwkD3pi9SgknmXJHkRrFTSWcZyGX5igUEjsGgY9VpKiCSmN1Zm1wsAYCFuvTlHz
         WXfQOaunIOhokV/QFp4jMNdqvyN+UiW9AIwjtOHTvefoEWOqgj1Z3YWlt8bfBOKyucSF
         5YRTDEdVd7S0vHp3IwndyVjx3N2Smx2Rc0XnFoEqN1BpImLaxm/NB1osjCstOVagDQWy
         z/oFqXxITnE9g82ZYWGnyGzB3C29XvehJF0bTPT+NcMAbNpuF3xutSN2CHclltPud8uv
         U9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWP6ShtVJe1sEKy/0wX+htb8BywDttstkj+SVGpXCGApE6XltkSM4PbB3fTifcULV8GYqbgzyAnYSp6sdSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59K1U9u6z12L6EblVikLP5mJO3bnFVdllq1jfzXi4ZAiyG3CI
	C3pG/yXI9a/C8A/R0IYPcnd0SDLCfARZXR/d9PyZvxl3J4lcEZNcWPmR2TZtI2Nl8bw=
X-Gm-Gg: AZuq6aI7hQXq1esnWWCc4o8BJJjr7QKCcLVfdAvTlcpmHgKpDpgh074m3cmczbrxlpl
	4MGr2bjXyNBVPrjBs4zG6ue5aUIt7Psf9sfXuk/JprW4VrN7XSCMLSmjLCtlEaigCCjUQWfUQ4c
	4XdCcMsjJkskV4/f6qTdjmtQfUXf6VdPUGtPloeQMW5hksmsw3/W9Vb31nq38PlAnjnOfhTRFq+
	VfVV8mYe0cAzTlOnx05ocAyBBc+rWsMHTIIhPdzRxJGzL0CNQX2JXCemlLivpnV2EA6P+mSC7tc
	mOEYLokgJ+E3jGVAkESIwUrIqkvLVYr0kfSMNIVz5Wauggdb1n3SVbbmsqxnkPhv6DWrsoJFtEE
	2sL3YWFnY1E90Opk3d4IxgXNeXKcHfiso9sEkILrggsVrJr9pKbR30yuKn11MPc4qqqMWBfn6zV
	TAzGoiGvHkn6ae5jvB
X-Received: by 2002:a05:600c:64c6:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-483201fffeamr38774665e9.3.1770385159943;
        Fri, 06 Feb 2026 05:39:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm196904435e9.1.2026.02.06.05.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:39:19 -0800 (PST)
Date: Fri, 6 Feb 2026 16:39:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and
 DP mode support
Message-ID: <aYXvBGVdwXTrJNio@stanley.mountain>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92042-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 97760FE48F
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Xiangxu Yin,

Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
config and DP mode support") from Dec 15, 2025 (linux-next), leads to
the following Smatch static checker warning:

	drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:803 qmp_v2_configure_dp_swing()
	index hardmax out of bounds '(*cfg->swing_tbl)[v_level]' size=4 max='4' rl='0-4'

drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
    777 static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
    778 {
    779         const struct qmp_phy_cfg *cfg = qmp->cfg;
    780         const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
    781         void __iomem *tx = qmp->dp_tx;
    782         void __iomem *tx2 = qmp->dp_tx2;
    783         unsigned int v_level = 0, p_level = 0;
    784         u8 voltage_swing_cfg, pre_emphasis_cfg;
    785         int i;
    786 
    787         if (dp_opts->lanes > 4) {
    788                 dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
    789                 return -EINVAL;
    790         }
    791 
    792         for (i = 0; i < dp_opts->lanes; i++) {
    793                 v_level = max(v_level, dp_opts->voltage[i]);
    794                 p_level = max(p_level, dp_opts->pre[i]);
    795         }
    796 
    797         if (v_level > 4 || p_level > 4) {

These should be >= 4 instead of >.

    798                 dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
    799                         v_level, p_level);
    800                 return -EINVAL;
    801         }
    802 
--> 803         voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is a 4x4 array.

    804         pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
    805 
    806         voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
    807         pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
    808 
    809         if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
    810                 return -EINVAL;
    811 
    812         writel(voltage_swing_cfg, tx + QSERDES_V2_TX_TX_DRV_LVL);
    813         writel(pre_emphasis_cfg, tx + QSERDES_V2_TX_TX_EMP_POST1_LVL);
    814         writel(voltage_swing_cfg, tx2 + QSERDES_V2_TX_TX_DRV_LVL);
    815         writel(pre_emphasis_cfg, tx2 + QSERDES_V2_TX_TX_EMP_POST1_LVL);
    816 
    817         return 0;
    818 }

regards,
dan carpenter

