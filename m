Return-Path: <linux-arm-msm+bounces-3295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C380362E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1315F1F2116A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E708286B7;
	Mon,  4 Dec 2023 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozr8o/Mk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E3BA0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 06:16:37 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ca0288ebc5so12728551fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 06:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701699396; x=1702304196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
        b=ozr8o/Mk7ftEK1xYc/WYENZVKqtnPQxU6slAQnt2QoTKsWMj8KqDQaSCA/YkmTUL8v
         XBytNQ6H0MdJpqsG/rMxW2kNNJ4NrAOhkhks6Uo5R22xMypCnNBP0JiWAzO20fwdXJiE
         5I+bCsMtG4U4iA1bOkrf1TtMDDUzOofKfV/D1HD0zgOuzpZ9bLLTMaaS3OuvLzWacUVh
         tDrilnnTA8OyowSwj1yZFgQsWG4OerO4fcc4E91rB7mE+G0J4UA+QiDghc0jzxfBrqbH
         CM8skPpG4KDgjVUklIDAahCPzlE7xgYnnZuXxC2vBngBOJYsmvv4cJKsI93eifce7sgu
         dN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699396; x=1702304196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
        b=Bunut1Fe4Q7qUdA9TCfmRXTrKhtGBJTNzaijQiNXb6JNTF5LCUAFkS+g11+SKUryic
         mpYo92vaRTHxlKNIjjJ7THCKUoFpUD/L5KRGFCjTJGUaMBizFIqqXUii8OCWol8mGAf3
         Z3Hc2DDHAMFIc4QakQSArx1PtTwQAogA3ysjADI0wWa4VUkDn3BLApTOtMGw5J9Wy7Vz
         dwbua6yx7lTwQHDCVBpBECDJ5Sf4Tf4cPEg3Y3pP4fqfGq1quGEDrDR6046YBKlRqNwk
         nCo16VAl8xJyZly23P1Nzj7GEjllwSQKxLSTj7Jn++lK33auUCOVBvcrPzyoWTpFd3LD
         rbyg==
X-Gm-Message-State: AOJu0YwoDH9FlJj9NEmQDrXnZcs3sDFcLIf+eMEv9ujuXzbjAzsuqQAG
	S0yRuvAYKslBa6YAGm96AFHwgw==
X-Google-Smtp-Source: AGHT+IHddUgNiM5+JeDrcniHCScJhE7jly22t2q9+rXWr3RDXN6X9hcnxXrPXIv6LuNWyNWoqwMFJg==
X-Received: by 2002:a2e:8041:0:b0:2c9:d863:2c1c with SMTP id p1-20020a2e8041000000b002c9d8632c1cmr3034669ljg.69.1701699396066;
        Mon, 04 Dec 2023 06:16:36 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:16:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>,
	Simon Ser <contact@emersion.fr>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM bridges
Date: Mon,  4 Dec 2023 16:16:30 +0200
Message-ID: <170169936705.76859.13553998311101543980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 03 Dec 2023 14:43:27 +0300, Dmitry Baryshkov wrote:
> Greg, could you please ack the last patch to be merged through the
> drm-misc tree? You have acked patch 3, but since that time I've added
> patches 4-6.
> 
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> in a different way resulted either in series of hacks or in device tree
> not reflecting the actual hardware design. This results in drivers
> having similar boilerplate code for such bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/bridge: add transparent bridge helper
      commit: 2a04739139b2b2761571e18937e2400e71eff664
[2/6] phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      commit: 35921910bbd0b6ab595cead16d0c8faadbf2fd94
[3/6] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      commit: c5d296bad640b190c52ef7508114d70e971a4bba
[4/6] drm/bridge: implement generic DP HPD bridge
      commit: e560518a6c2e60f1566473c146fddcff3281f617
[5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      commit: 2bcca96abfbf89d26fc10fc92e40532bb2ae8891
[6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      commit: 7d9f1b72b29698e3030c2b163522cf4aa91b47e9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

