Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D3B643626
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 21:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiLEUzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 15:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiLEUzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 15:55:49 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9353B1FD
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 12:55:47 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id b9so14970381ljr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 12:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ocYjA6QpQH0iEq1Vf2TrXA6nHz4QLZhRSsfXvZluncA=;
        b=g/7miiH2oAGR3+nRqVDPOrJ626yTRpMTySivkSz4t9d92gxefz4CEU17Ks3qH5aYkR
         SUPi/up/Us/RVer291Mhmjw4+cDqyHjWqHI9GbAckZ8muOgt2bZi077qlvkAy9ymekDy
         5e/faUiTtZPbH21jjkzS6QQbDZLMUk6+1VB03pCQZy8fgifBxXn7lXObb5dJHfQr1d2L
         n6bJk00zEm5HIm76SOklgpPkFeq5n+goPiaHlReg+G12xfWdgK0/yiDohxS3aTwaEfUD
         xTW0J9/LHnU76RyzsJR2/jHKyIhihy9i4obcf2kzfGznMADhYR3tcmF+S2P65F/socgr
         Phbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocYjA6QpQH0iEq1Vf2TrXA6nHz4QLZhRSsfXvZluncA=;
        b=d36TxzCwPOftVfz6zSMhwJcNfo9pU7Dhi3dUDEq6DoGX+ioflHabg39kUcT8t5onR1
         NaVgQNpFrGXKwUijEDoZdVBGfz88svLFYy1qk/ytTdk4aS9jkoIMxUUjKNGvvWEcp7vt
         Y6083K3N0/MakLGwnubuukFIT2GSmDRGnateu5S1ejWP8FOklnZ8wi7P7JJHfODiHwwp
         Rv7o9lfJ+rYStamR2GaYIh4O3txAXwETsWp7KoDNAtEq12MD20B/KcVzsNeEhbpDpEbt
         IDec2DUTNehapFc5Tp7T1eVh3jHnxtP3ABxQ9l7+U27BjlIf3Dy/bvaUpk1suzavAxH0
         G3Fw==
X-Gm-Message-State: ANoB5pkXGEQ7Mz8+r36LCkO4aaoF0NEdkBRzMuJpHQJFBU0hCghT5JYk
        gdaXa/DktDryQaE1ueWors35tA==
X-Google-Smtp-Source: AA0mqf4pFzfwQM8n0RiCiZ81HlSwQY5Nbe4erlyvLoTagwgP7cgxx2eJCbeqwZzIhNpW99kPxN8c8A==
X-Received: by 2002:a2e:9589:0:b0:277:7c00:e12b with SMTP id w9-20020a2e9589000000b002777c00e12bmr23190338ljh.431.1670273746067;
        Mon, 05 Dec 2022 12:55:46 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id a10-20020a056512200a00b004ad5f5c2b28sm2222957lfb.119.2022.12.05.12.55.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 12:55:45 -0800 (PST)
Date:   Mon, 05 Dec 2022 23:55:32 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        airlied@gmail.com
CC:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/5] drm/msm/dp: add support of max dp link rate
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-6-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com> <1670267670-15832-6-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <F989A827-65A8-4CBC-BAC8-B7032CDA5394@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5 December 2022 22:14:30 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
>By default, HBR2 (5=2E4G) is the max link link be supported=2E This patch=
 add
>the capability to support max link rate at HBR3 (8=2E1G)=2E

This patch uses the actual limit specified by DT and removes the artificia=
l limitation to 5=2E4 Gbps=2E Supporting HBR3 is a consequence of that=2E


>
>Changes in v2:
>-- add max link rate from dtsi
>
>Changes in v3:
>-- parser max_data_lanes and max_dp_link_rate from dp_out endpoint
>
>Changes in v4:
>-- delete unnecessary pr_err
>
>Changes in v5:
>-- split parser function into different patch
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>---
> drivers/gpu/drm/msm/dp/dp_display=2Ec | 4 ++++
> drivers/gpu/drm/msm/dp/dp_panel=2Ec   | 7 ++++---
> drivers/gpu/drm/msm/dp/dp_panel=2Eh   | 1 +
> 3 files changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/msm/=
dp/dp_display=2Ec
>index bfd0aef=2E=2Eedee550 100644
>--- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>@@ -390,6 +390,10 @@ static int dp_display_process_hpd_high(struct dp_dis=
play_private *dp)
> 	struct edid *edid;
>=20
> 	dp->panel->max_dp_lanes =3D dp->parser->max_dp_lanes;
>+	dp->panel->max_dp_link_rate =3D dp->parser->max_dp_link_rate;
>+
>+	drm_dbg_dp(dp->drm_dev, "max_lanes=3D%d max_link_rate=3D%d\n",
>+		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
>=20
> 	rc =3D dp_panel_read_sink_caps(dp->panel, dp->dp_display=2Econnector);
> 	if (rc)
>diff --git a/drivers/gpu/drm/msm/dp/dp_panel=2Ec b/drivers/gpu/drm/msm/dp=
/dp_panel=2Ec
>index 5149ceb=2E=2E933fa9c 100644
>--- a/drivers/gpu/drm/msm/dp/dp_panel=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_panel=2Ec
>@@ -75,12 +75,13 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_pan=
el)
> 	link_info->rate =3D drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE])=
;
> 	link_info->num_lanes =3D dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MA=
SK;
>=20
>+	/* Limit data lanes from data-lanes of endpoint properity of dtsi */
> 	if (link_info->num_lanes > dp_panel->max_dp_lanes)
> 		link_info->num_lanes =3D dp_panel->max_dp_lanes;
>=20
>-	/* Limit support upto HBR2 until HBR3 support is added */
>-	if (link_info->rate >=3D (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
>-		link_info->rate =3D drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
>+	/* Limit link rate from link-frequencies of endpoint properity of dtsi =
*/
>+	if (link_info->rate > dp_panel->max_dp_link_rate)
>+		link_info->rate =3D dp_panel->max_dp_link_rate;
>=20
> 	drm_dbg_dp(panel->drm_dev, "version: %d=2E%d\n", major, minor);
> 	drm_dbg_dp(panel->drm_dev, "link_rate=3D%d\n", link_info->rate);
>diff --git a/drivers/gpu/drm/msm/dp/dp_panel=2Eh b/drivers/gpu/drm/msm/dp=
/dp_panel=2Eh
>index d861197a=2E=2Ef04d021 100644
>--- a/drivers/gpu/drm/msm/dp/dp_panel=2Eh
>+++ b/drivers/gpu/drm/msm/dp/dp_panel=2Eh
>@@ -50,6 +50,7 @@ struct dp_panel {
>=20
> 	u32 vic;
> 	u32 max_dp_lanes;
>+	u32 max_dp_link_rate;
>=20
> 	u32 max_bw_code;
> };

--=20
With best wishes
Dmitry
