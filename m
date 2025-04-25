Return-Path: <linux-arm-msm+bounces-55747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED8A9D228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1539D1C00BE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D581220F090;
	Fri, 25 Apr 2025 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zaNIB0em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59DE1A5B92
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610490; cv=none; b=Vjp1qY2fHZ1rtOrC+7nzzkA9zbFfHD/BNuLPWF4Ji8twKpwdGAOhz0eF2iiFbh+sT5goKGrgfrrFtgFD9y/xApxzBdEbPknkFyGbqoUBiUCuhtaCEAdx2qliB1jHJ00sDNOz2PQCk2cdbp9pBftPfF1m4aAWUd7BVEF8magMVCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610490; c=relaxed/simple;
	bh=kaVIw/22O1GCmj11mvIUi7tcAyAUdCPPBa6yErxA9LE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=KvJlSVoaKiA9IoyUvxIREU9dHhbJ3gXU4Jimn3uC2TilGtWQg062zYZfdR0UePn59Qu0242sD3VLKTAoBISar6XztAs1M4nqjTECdZpAbnkJQPEKfot5nzidaWKiGrx+MaCoiH5jGDXyaw8iPvwtHtBQViqtQ2oQ4xcK7rT9P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zaNIB0em; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1714918f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745610487; x=1746215287; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=zaNIB0emmBAYTHZYlCUPNyR/HctjwWcAWNDcqoZipMMNwfBSvSOGhr8U/oJ0u08o09
         3qX7zeGM4xJXIViu1Vq/5SCvAMq9taIimuX3DvT7O9wi/gsPjkCZhYm/M5DS8+3BVwZg
         aoZQWyXBRzZfSrthEElwS6edWu1CIZNcJrZZVVj8FAzy2OTo7NW9o9DRXkkhxaV/9NCX
         FICO7HWBxUvl65Sx2OSGhIiHEpxmX5JgiTy0VYdn4z+NJ+fr9TtIB9dYK7w8dPAB5AHa
         e2yx74oWq/XXSgVzp9ISibSHBp+8ix7ch2Rui684zGgf7J5BErSsMG5F7c/QvVn3exXH
         0beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610487; x=1746215287;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=czzTmV/L+QIUQ0hEc1GOTPAq/jD5o3g20wiU1Qqf0T1tqqNPJyEVxfyquJJ+2ovLK/
         HK+47Em2uzD18225TlSgXA5cZMmMzdoTvMSgU+WSmc+UWt5v2r4wHBLBm3c4fIw2fZ/m
         E5qnwQPkdDGMAG0wNlKSgPNlw5gUr29H75YFegSK+Zra+GuPzO3xxliyEkovPZVa/byc
         /Fp3UQXYfF3ZjvudwZBLjpTlMHVL/qm9XNG3zxi+xYlGibsFEUeGPb+744o+Piy/lNnF
         IhVlNhGATo0KHYN9+5Qy6GsuFRWAEt2qMpOfeijIU3h6tKgTnQtcf4/zQS7DgjW52vW3
         XJ5w==
X-Gm-Message-State: AOJu0YwDQ13dZvN7ihR9la/yO508WDr37n3af3PhXkYOMLO8r3xC3ALa
	kuxe38llC9brB82uHq5maoV6S/kNvoACGtBdYkJK/AKYv4rDTxX0f1CBR7nCL3U=
X-Gm-Gg: ASbGncto3Enl0KJljG335OUvT+4z8tk/TlM3jtc4jWLzSc196YNSLaVuzEHKwpalL8i
	rRQvN5+q3l+4CqCK9a5GHkozjcZWyKYUCVSq1ZAXAhE0dhwxiBPwZtXJWP5FZqrFCcqEh25SW7f
	PwIg1OHYogw+91qaLPU5DXVvQX9XRB/iXA12eF5OJkbT2u4sk2kshnGzEkVYqp36lctJpNncf/T
	wy/LXUcsmfsaVaQ2GyTA1XKPs1+yS5sGowtzWANkPMCO+Tx/vkKD/LRA96w7tfCDQFLs8okfxRA
	+D6xaRy551zvmZh29hp/zPtMe7UiueI7D1lF/ZAA5RFkBc53RCdm/X6XbiLMqZgyqg5fqv9w9Ii
	r79kebPAY7h4eZ9GDWMKOaisPUvgomG1RyVfHUsuDxykNrF8ihrS8z8IhjN4NMHQ=
X-Google-Smtp-Source: AGHT+IHfsn5wCKhwTa0J8zfuwB8lcJPWgRUEQdZlhyrj1mUqnBM8NKHg90Ct03YfbCjHwLs/15BqRw==
X-Received: by 2002:adf:e5c3:0:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-3a07aa7545emr335807f8f.24.1745610486979;
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8154sm66076505e9.30.2025.04.25.12.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 21:48:04 +0200
Message-Id: <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
 <quic_rampraka@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>

Hi Ziqi,

On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequenci=
es
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.

I believe this series is causing issues on SM6350:

[    0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_to_gear_speed: Unsu=
pported clock freq : 200000000
[    0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk freq 200 MHz not suppo=
rted
[    0.903791] devfreq 1d84000.ufshc: dvfs failed with (-22) error

That's with this patch, I actually haven't tried without on v6.15-rc3
https://lore.kernel.org/all/20250314-sm6350-ufs-things-v1-2-3600362cc52c@fa=
irphone.com/

I believe the issue appears because core clk and unipro clk rates don't
match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not a
valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
specified to 150 MHz in the opp table.

Regards
Luca

>
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0

