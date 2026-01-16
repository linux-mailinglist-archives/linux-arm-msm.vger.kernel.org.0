Return-Path: <linux-arm-msm+bounces-89430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E50D33072
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C5E13003B03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE1E23EA85;
	Fri, 16 Jan 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lmSG+G2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F9338906
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575559; cv=none; b=E6ehu+m/p9mE3v6K4ELtoAf2aYtO1LqO2C8aiB0cmsM1kNtAUcJFrZ5ktPmwLAywvP48VwrkAgdHsUrCg5r1x03nwjq2FiOrtAHBUBkcc4H1YSbPHfXiZNp5TGlxc04Nq65exArgboevQwekTXNOSb3yoUtjFMAjZ6WpJbjOzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575559; c=relaxed/simple;
	bh=4N72wqklXl211HdyFX5yPueYwwgn+V4eAHK3KU3ubYU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=rVoMEOeuKctklJTgu78AnURFqLmg/uP7v08FxOGhdBoRjzCOwCDYIbLDpn8kImQVK7aJZT3V3O8bUSAN6TcT5YWY/Gm7WxPtYBw4Xh0cWYssWbQN4zfUF50wzc43rgPLUp2q98AD9t9zgedKhKN63DdXbcOBIwCrpMAEyhxIH7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lmSG+G2G; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso3008727a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575556; x=1769180356; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBROiXfb/ZczWtty10y7qSloj9J1SUn7rTe2FXbu+XM=;
        b=lmSG+G2GS2fc8w3mxrOLwvjoc3ADO8iHncoMtMpaNxZMBARNoDjwrxxvym6SmQUUH8
         pANj8RkHPgfKK9VJiW9JbmI6jOzfCMwbSOYwKazXIODv+Agljz9Iz4xk4/Warkka9dhq
         xEzZ6vszsTpAtbzzuh0vVLUqNtD+rtmkMEuaXQaoJyuqD49342okNjlyYUxqtkAWt+tn
         2LJZWUQW6zh7AZlY0st5aR5YtjwNvmWCg228CAHNBvxKkKh89NKw83jamE8ddG0gF1wn
         +tgr7TiEgJCDikYlH4QQ1j6FEfSy8mQLcxtulYF6WZHxP6k3UGpzUOyug4vxgkenUeNy
         Wr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575556; x=1769180356;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBROiXfb/ZczWtty10y7qSloj9J1SUn7rTe2FXbu+XM=;
        b=XVKLNsEx941cramUarXc6wbUKalLH8saidT79sQbzLJsnHFc+vofgujMagymG4B4Aq
         jXR/yObuqgxnr3YLjcsNxDRevmrabIJR1FqcdZpwbZ+HwQqKVgvbfLKluDNNa+mtBiL6
         BiCS6n9S8dwlylqmqGitLHa6WaHW0oaF8JSJqs5eIxAkAPqaGWmW5NsglOV9yUnPex2y
         qLKQxS2mcvQvlf6VSv7ZuzJwheQqNXtPKwlWW96H/iAVqPhiJAxZKzL+0QWB8Njpk+bN
         Y/D5fjfcd3l/NLfrTScNFG466wNiE1/p7eNeOVrdmDfbQo4bKhRa+8/LHgk2NWOL8KHD
         Y+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbDzZI50J67y6K9Eh3kn5WRyP6drTzppOM71KFw3fJt9r+yKpdXJJWcO8AstACx5PdQDFQFMDmpVHLHKLq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bwEd9hlF5nWNAdgN+6nLRRuh2pKghJ/OLHRR+AVZ178SeqwB
	v8nGhQ4Ry1JUsRnG41GUug4Q7dAQCs8k2wbK2nI54HGbe72lskB6hMDZzz84lJMHxkcg7/iuhvx
	CyKGg
X-Gm-Gg: AY/fxX4fJpoGao9z0UVv3iCUjNF/rlYBSjf41jiuRNjzswpchArhZEOlUTunNBp4jX8
	e1qLoABPqlIPocGVNccv5LYsQ6pJx8mwy6frwsTmqCA8eZa7s3FBpAYXLsapbNt0m/fI9xREeTi
	sp3x9yS60g7KZCwGYxSs7NeRIFAATotYLcAvi1opzsJUdsX3pMOxC3ezJGVrHDD7IHIHuZ1GRbB
	5tCbtHhzSNhCl9rK8NppDwgOwxrMqeBOS8etvMJdcOfm08buh07guUQ173GnNfMseawH59KNvKI
	SMbwyM4xcVtJncPSMV6Y94FkBwjetWKdXdan98J8Jgnn8zQip2C1DE75pq09Zp5aINGKp3GqcLo
	ZptwdY3AFv2y1pado6pUdsRX82X0HYCk/idNCi/NXWT0Tq0rQDLezgqBTrK+QPDJwKjRBJlOZhr
	/UeGQyTqMzVhso1Hb/CQloSe4wxoYFmmAaq8NFhib2Eni1nKWOCTLvuOGD
X-Received: by 2002:a05:6402:234a:b0:64b:7885:c971 with SMTP id 4fb4d7f45d1cf-65452aca69bmr2326288a12.20.1768575556174;
        Fri, 16 Jan 2026 06:59:16 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm2484199a12.24.2026.01.16.06.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 06:59:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 15:59:15 +0100
Message-Id: <DFQ3PLTPB9ED.1Z8Y7PAQ3I5XG@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <ath11k@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath11k WiFi bringup on Milos SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>
In-Reply-To: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>

On Fri Jul 18, 2025 at 3:23 PM CEST, Luca Weiss wrote:
> Hi,
>
> I'm trying to bring up WiFi on the Milos SoC (on my device: SM7635)
> which is paired with a WCN6755.
>
> There's also the WPSS remoteproc on this SoC, similar to SC7280/Kodiak.
>
> Using the qcom,wcn6750-wifi compatible in dt makes the wpss firmware
> crash soon after boot with the following errors:
>
> [ 1263.547381] ath11k 17110040.wifi: wcn6750 hw1.0
> [ 1263.577281] remoteproc remoteproc2: powering up wpss
> [ 1263.814337] remoteproc remoteproc2: Booting fw image qcom/milos/fairph=
one/fp6/wpss.mbn, size 8229144
> [ 1263.817861] PDM: no support for the platform, userspace daemon might b=
e required.
> [ 1264.523796] remoteproc remoteproc2: remote processor wpss is now up
> [ 1264.773557] ath11k 17110040.wifi: chip_id 0x1 chip_family 0xb board_id=
 0xff soc_id 0x40140120
> [ 1264.774484] ath11k 17110040.wifi: fw_version 0x3014ffff fw_build_times=
tamp 2025-04-09 08:57 fw_build_id WLAN.MSL.3.0.1-00328.3-QCAMSLSWPLZ-1.1059=
49.2
> [ 1272.362281] ath11k 17110040.wifi: htt event 48 not handled
> [ 1273.499832] qcom_q6v5_pas 8a00000.remoteproc: fatal error received: cm=
nos_assert.c:400:Asserted in whal_wmac_recipes.c:whal_wmac_transition_to_fw=
_control:1734
> [ 1273.500231] remoteproc remoteproc2: crash detected in wpss: type fatal=
 error
> [ 1273.501114] remoteproc remoteproc2: handling crash #1 in wpss
> [ 1273.501153] remoteproc remoteproc2: recovering wpss

To conclude this, this was missing a pinctrl for gpio5 of pmk8550 which
provides sleep clock to the LF_CLK_IN_GPIO pin of the WCN6755 PMU.

Downstream does define this but not in any way connected to anything
related to the WCN6755.

    &pmk8550_gpios {
    	pinctrl-0 =3D <&alt_sleep_clk_default>;
    	pinctrl-names =3D "default";

    	alt_sleep_clk {
    		alt_sleep_clk_default: alt_sleep_clk_default {
    			pins =3D "gpio5";
    			function =3D "func1";
    			input-disable;
    			output-enable;
    			bias-disable;
    			power-source =3D <0>;
    		};
    	};
    };

This is the upstream patch with the pinctrl defined:
https://lore.kernel.org/linux-arm-msm/20260116-milos-fp6-bt-wifi-v1-5-27b4f=
bb77e9c@fairphone.com/

With this added, the WPSS doesn't crash anymore and WiFi starts working.

Regards
Luca

>
> That "htt event 48" should be HTT_T2H_PPDU_ID_FMT_IND, I have briefly
> looked in the WiFi driver from the downstream 6.1 kernel and while I
> might definitely be wrong here, I'm guessing it's not related to the
> crash.
>
> Anyone have an idea how to debug this? Unfortunately my AMSS sources do
> not include any sources for WiFi, it's just prebuilts.
>
> Regards
> Luca


