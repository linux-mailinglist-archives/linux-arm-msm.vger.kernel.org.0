Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3553B671FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 15:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbjAROj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 09:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjAROjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 09:39:05 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBEBC158
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:29:08 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id k8so19631115wrc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09LIyEAsfHyV6itdPviPw1c0EfObZTYwVl/MwHc+r6E=;
        b=k77B8Dq/0i3dNdFxDgCz7T4Wvo6gSQE6HDNuur2soCGLRYCGcjW/trR85JsU7H+bnq
         XjIEPLgX8sf/xTvgxrjMgEcODCeDTXkf4vOBL4i+ew3FHL3e8683Aca+XDy1ppSaOf6v
         GtxJSyZWNrFnrAv4Y665fuTpPJylwE4cOHqKemAgity9QzyT9rHvjDiwAkOxgt57t1gE
         tNwV1paZV7IrSqqgUCzvXuLWxFbZ1EH1XDfD9NKENcMoTFD4jcfVCzu4XStRrIxfgSQ1
         msui37L9A+qZf/ZhRig/mReO2uWa/eGRanu9yv828s2ZbyAjl54z2oNqpmrjMgAyfQR0
         vc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09LIyEAsfHyV6itdPviPw1c0EfObZTYwVl/MwHc+r6E=;
        b=migDLGFp5Z0p4mPxP4F+9fhJjqgcR8/XbdmWsBuVi2UJ1wQrJAlGm2HV4oURxebgc/
         BHBFQ2r2vo5DhjgjedGTyoA30X510O37joitpjhkkXXDHVna18wSemNGeUVrRao4BwX3
         O5AsdphMpICuja0z1FszEANyGWtPRIy4D4vanUxvTG0K0Kp5GBt8Pb0sl/w2+gyGclub
         RUcBHWZl/s2Y8QLoBRDLEBSluFvsXtgO3m8hc6TqGgz1rDvSFJzfP/J/1XC7dTr9zT3e
         m1Kc6ouCx87gB2KhoP161MwDjTcqFnKMyIp31NicBa7Ppe5VdSe433VllZC9tc+U4hWz
         G/QQ==
X-Gm-Message-State: AFqh2kpWR1T0Uaf3Gce/Xp7qi9ceJy8GhIDJ+eToHe6hO4HYTF0IQZ4J
        wJ95efLgzVAb8SG0wh0+fy1jtg==
X-Google-Smtp-Source: AMrXdXvEBACT5l6DQOfaEAh6nlZUakGz1hY8jze4RSkucPdQC3k1HthSlfOVYt12wGzg8tcckD+jmA==
X-Received: by 2002:a5d:68c9:0:b0:24f:11eb:2988 with SMTP id p9-20020a5d68c9000000b0024f11eb2988mr6721226wrw.71.1674052147066;
        Wed, 18 Jan 2023 06:29:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k18-20020adfb352000000b00241fab5a296sm32113556wrd.40.2023.01.18.06.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:29:06 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/13] drm/bridge: lt9611: several fixes and improvements
Message-Id: <167405214621.3985372.6039919953364691654.b4-ty@linaro.org>
Date:   Wed, 18 Jan 2023 15:29:06 +0100
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

On Wed, 18 Jan 2023 10:16:45 +0200, Dmitry Baryshkov wrote:
> A series of patches to fix mode programming for the Lontium lt9611
> DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
> platform).
> 
> Changes since v2:
>  - Rewrote mode_valid callback to be more explicit.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[01/13] drm/bridge: lt9611: fix sleep mode setup
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ae2d329f104b75a0a78dcaded29fe6283289cdf9
[02/13] drm/bridge: lt9611: fix HPD reenablement
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a7790f6bd38f3642b60ae3504a2c749135b89451
[03/13] drm/bridge: lt9611: fix polarity programming
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0b157efa384ea417304b1da284ee2f603c607fc3
[04/13] drm/bridge: lt9611: fix programming of video modes
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ad188aa47edaa033a270e1a3efae43836ff47569
[05/13] drm/bridge: lt9611: fix clock calculation
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2576eb26494eb0509dd9ceb0cd27771a7a5e3674
[06/13] drm/bridge: lt9611: pass a pointer to the of node
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b0a7f8736789935f62d6df32d441cdf05a5c05d2
[07/13] drm/bridge: lt9611: rework the mode_set function
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fad97f2811933085adb3dc3b13b2e1cf985295b1
[08/13] drm/bridge: lt9611: attach to the next bridge
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c3997b0fec74a828ef258851e2fb260e3e7620c
[09/13] drm/bridge: lt9611: fix sync polarity for DVI output
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c7474694849b44cfdf4e22b41e8f3eb85d78709
[10/13] drm/bridge: lt9611: simplify video timings programming
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6b089d5e35d6daf3d348a3fbd8974d4ed896a231
[11/13] drm/bridge: lt9611: rework infoframes handling
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=84cf74d99f88bc476678254310baffddfba68bb6
[12/13] drm/bridge: lt9611: stop filtering modes via the table
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4914cbc4fbadf0a3bcad9b0b09b3d8005a3dcd9e
[13/13] drm/bridge: lt9611: properly program the dual host mode
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5e83f359d9805b3561f160afafddfa7572155d1c

-- 
Neil
