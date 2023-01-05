Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29065EE78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 15:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbjAEOMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 09:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbjAEOMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 09:12:08 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB251A828
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 06:12:06 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso1409812wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Sw99W6AD4VBBtNM6/KnSxgPA1tuM9aVniZbjeLNUQ=;
        b=dndeRrTz+wqs8In2KApAdlet27T+y1cxMYoI4Bo+6D0fSn8oPeh9mZIfRF1sL9KmG4
         MaVCMwTg3T0rP8LeRIn1Z0lXHWB4m4LKZ5ev5OMBRgpVTVzJgjVTsmNHVLj+5/uFEfL/
         yTI+S3Nv0iAGMW3BYwDaTFY0l9tMsQXTZNvnd6ZoONumeV859H+sqF9NEcVLj5E8BlDH
         BBiaOhIlFgdsWzBIMyDNwvcd6WLvtEa6b3rdEbM8jOFIr1mNpyKAYCv3wCuueasG9k1k
         7adtp5bOfUKZKUkG2/PsPUFg0LAmVA1yRVqRNXwPdTrEPLEEB0fgFBtXt4pfWQ69dQ6y
         +JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1Sw99W6AD4VBBtNM6/KnSxgPA1tuM9aVniZbjeLNUQ=;
        b=vqklf/zxz/CWABCajkCPQRI9DhCdxU7VzPQFTl4PwVc71VQ58STJI8Qxk/ofDzwhrs
         +NXJcBQDt9LAfOJAQZiqtVqES9TUuFaUP/vrF2f714rsUBDP6jK4ME5yVw49YOv/rxSt
         Ib4KtlB4T5A46f0acrbkry+hY64SxuzJwi1usP5+N6Y2uxZqxrGMQbRB90HpRDYh6VV+
         QmmSKcvqrtgIH3XPs1iszJcci+CYoXfNtO5l5BQqknXH/cvodX96BhCRZ9fFgjehex9A
         BsS8Aipl7rdvM86ELTi4PsAKZPF0DRqQaf0BobVdycLGYIt7o0/UsHxWHmkWB5b/gbSt
         1Fng==
X-Gm-Message-State: AFqh2kqMwylotHzeoONAo6a7bnZoFSf23h1f4KZvy+GVKLOYPlGI8Uur
        1iLGafCNs3Jz5dsbKH6hoXzgcA==
X-Google-Smtp-Source: AMrXdXtk3+2kUAUc9npvsbsWnPLk3CUPQAucwULlpN9hXbjbabnKvCpzfBOXp5cMfL13XUcPcOA85g==
X-Received: by 2002:a05:600c:246:b0:3d3:3deb:d91f with SMTP id 6-20020a05600c024600b003d33debd91fmr38985696wmj.5.1672927925529;
        Thu, 05 Jan 2023 06:12:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d17-20020adffd91000000b002882600e8a0sm22250322wrr.12.2023.01.05.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 06:12:05 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement automatically
Message-Id: <167292792435.748499.5644887130722114887.b4-ty@linaro.org>
Date:   Thu, 05 Jan 2023 15:12:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 02 Nov 2022 21:06:58 +0300, Dmitry Baryshkov wrote:
> From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> DRM driver do a proper work of calling
> drm_bridge_connector_en/disable_hpd() in right places. Rather than
> teaching each and every driver how to properly handle
> drm_bridge_connector's HPD, make that automatic.
> 
> Add two additional drm_connector helper funcs: enable_hpd() and
> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> is the time where the drm_bridge_connector's functions are called by the
> drivers too).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/7] drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=78b991ccfa64a438e2d8c2997d22d55621ab277d
[2/7] drm/probe-helper: enable and disable HPD on connectors
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c8268795c9a9cc7be50f78d4502fad83a2a4f8df
[3/7] drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=92d755d8f13b6791c72d4e980c09f054d8175c94
[4/7] drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=60c376e4549b6844af94cf319960ef48080230a8
[5/7] drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9e954403bc9cc024cf052e9429c0e6db86ffe0f7
[6/7] drm/omap: stop using drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c4f5538fa65dd093b71859c4792afd4e13fae5f1
[7/7] drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4c00ac500d0edd1a6730c4e8293834a694c1b304

-- 
Neil
