Return-Path: <linux-arm-msm+bounces-6411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA96823A81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 03:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFF85B21C29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 02:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33441878;
	Thu,  4 Jan 2024 02:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eSKyqzqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2120184F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jan 2024 02:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704334183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=MclevP00/a49Tz6ecs2iDiu7gt4OPIMJiub0BqcUnDM=;
	b=eSKyqzqqe+ghBTLPX5H2cN9bZlus5dcHzgjE88+zY62fMnMCk81/zl064rOSW4qvmC12GJ
	1pel1DTmTk/XZSIwr1SRgYcJQWIVrl0WcxqDKcPnxpTa6mcWdgqQS7WaDf+R7QneeOdAx0
	00l99zc7Kz3YVjjU1u4nMzka/fg2FLc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-CMAUZx2mNVWmdFLOcor9wQ-1; Wed, 03 Jan 2024 21:09:41 -0500
X-MC-Unique: CMAUZx2mNVWmdFLOcor9wQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67fb96f8d9cso589006d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 18:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704334180; x=1704938980;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MclevP00/a49Tz6ecs2iDiu7gt4OPIMJiub0BqcUnDM=;
        b=TA2wtq1/3Q4S+YoZJLQ/HqVJ91XRUDVuf7QsIm2A9W38bS446rrbRtM7Fp+nrSnCG3
         dw35tzg1u/LEYdTriNa2nR8EtRn9xwOjvXeYbPdlZ0pu2zqszQCCFJ9mmIOnmVjs0KJ/
         AzLy60+xjSrH4kAyQEPwGD7O8mWwiI2i73ookhX1fS/lKYwNOXGKRbysxToE1rFfMuMa
         i0w04wbRVv7NQ0HjZSJt7kaA3ClGAEKgObxJCerP5IYXSgQjYOXNZG9YkBEfPd22Er6P
         gN6JBwSLkJ15hMXnS3EodqWM+A0z3Vq0vCXHHWcCoEsZ6r/veRH4FefW6dnDlRqNKb5b
         XqBw==
X-Gm-Message-State: AOJu0YxwSTG7KRrMuUDqmSGrMR6ec3lt8AjbMODe+3zjTn4P0O8kyhr5
	6n5e5y+Pr6lrAz6lE68m05y0H19VRH4Gbw8dspzZ7X4LXaa6ogFris4jQn03w8DnBhsvhpMPlrY
	6tglqkCWKxSiF4Q6h3z2FY30JHi0tAjby3roLKclBBIpx5MTXGbOpU2tNdZet607ABzswgnxdrw
	rrC1wC0uXj/6ImDr6J
X-Received: by 2002:a05:6214:2684:b0:67a:a721:cb16 with SMTP id gm4-20020a056214268400b0067aa721cb16mr24553401qvb.119.1704334180400;
        Wed, 03 Jan 2024 18:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDX8v3aZFq3R1Bc7VbX+yHpg5Xj6CHEXxbQAIVpy9NDF/Rp1uysTIZqWf3d1+yX6Wkgjakrg==
X-Received: by 2002:a05:6214:2684:b0:67a:a721:cb16 with SMTP id gm4-20020a056214268400b0067aa721cb16mr24553389qvb.119.1704334179970;
        Wed, 03 Jan 2024 18:09:39 -0800 (PST)
Received: from x1 (c-24-2-114-156.hsd1.pa.comcast.net. [24.2.114.156])
        by smtp.gmail.com with ESMTPSA id l2-20020a0ce842000000b0067f8152861dsm11101978qvo.62.2024.01.03.18.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 18:09:39 -0800 (PST)
Date: Wed, 3 Jan 2024 21:09:38 -0500
From: Brian Masney <bmasney@redhat.com>
To: linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Eric Chanudet <echanude@redhat.com>,
	Shazad Hussain <shazhuss@qti.qualcomm.com>,
	Prasad Sodagudi <psodagud@quicinc.com>
Subject: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at 'off'
Message-ID: <ZZYTYsaNUuWQg3tR@x1>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (2023-03-25)

Right now when we boot the RideSX4 (sa8775p) board on linux-next with
a quiet kernel log (specifically loglevel=4 - warning) about 50% of
the boots fail since UFS cannot be mounted. Changing the loglevel to
5 (notice) or higher to show more logging makes the race condition
and error go away. I tracked the error down to the following:

  - The ice driver fails to probe due to the error
    "gcc_ufs_phy_ice_core_clk status stuck at 'off'" and returns
    -EBUSY and is not retried. platform_set_drvdata() is never
    called as expected.

  - The qcom UFS host driver calls of_qcom_ice_get(), however this
    will always return -EPROBE_DEFER since the ice probe failed,
    and platform_get_drvdata() is always null.

Here's the relevant log messages that I was able to get from a failed
boot once I configured dracut to time out:

    gcc_ufs_phy_ice_core_clk status stuck at 'off' 
    qcom-ice: probe of 1d88000.crypto failed with error -16
    ufshcd-qcom 1d84000.ufs: Cannot get ice instance from 1d88000.crypto
    ufshcd-qcom 1d84000.ufs: Cannot get ice instance from 1d88000.crypto
    platform 1d84000.ufs: deferred probe pending: ufshcd-qcom: ufshcd_pltfrm_init() failed

I assume that there's some kind of vote (icc, clk, regulator, etc)
that's missing from the ice driver, and another driver is performing
the necessary votes. However, I don't have access to the hardware docs
to tell if that's the case. Can someone that has access take a look? I
can post patch(es) if someone can point me to what needs configured.

Brian


