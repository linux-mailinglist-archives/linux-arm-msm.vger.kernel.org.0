Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BC555EF20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbiF1USv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiF1USU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:18:20 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D20B3ED13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:14:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y32so24225184lfa.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=I2/+5dhRyxuL3Gg1aHlNPvG7vh2LZmL80DGuAx1dO9M=;
        b=v3/T1HH6xPCsUlhJlqTNwOl2XQgII4I7NrSNEm49EGWF7H8o48QfRduFpQHTuyrvYB
         L+eYialYzpCRveZPv0LJjUlUsxFY+7/aiuTfmBCaU2a4Q873qI+HQ+va/lF/9f30KV8l
         mmr3lb0W0+vlo9X5zk7RGZuDTb7Moy+8oPaOhVI7PIvbB1oo9ajzQQIBnxKcbD9BVwYi
         OMU3PZEmtEtWQMMWYTLjJYgsfhd879dmueMMW2+6JYH/GL/WShJO5AQmVAcvKZquP4i3
         drc8JzRa1TDSf/+8sWC3nbT072L6DGSsDWrHiO9Fc8W6FOYZbxhkF3rYDTArdJ5oeNn4
         9sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=I2/+5dhRyxuL3Gg1aHlNPvG7vh2LZmL80DGuAx1dO9M=;
        b=XZ4ahQZ3wrKq2qGcLp+y53FwXJwps28pBWKB6YKK49YXoxQeksIOXyyd+0EZcCYV0Z
         Ti5OFOIvSXwxqnNFA08rAvUg//golcs+pl/UsMSf6BTcTYQn6E6lBrh9+uxgjiEjyYve
         58kTWws8VNW6kTerWJAgD0TYQ5e4C5xmG9zqqGtX/BRyV3r7NSvmRO1m2v//+/lvjbRJ
         CNLGH9YYTIIM4NmYDGmuqODk9e6pS81izCjIuhaQO6DCM0+NXyguU5DrodA8X2QzGkbX
         AugOBELLfEABWgfYdsLwjzqdhCnolxMpvE710AchH5ZfHgIFb+dUAzCf4nEsILWwASbN
         Z2eQ==
X-Gm-Message-State: AJIora+MifeLrt6NQlAWKV+cUlDA83yJplahu7+fSbohok115s4tK4xQ
        y+07lzE4qBG5Md/iGhltI2bM3rsVHRhQtg==
X-Google-Smtp-Source: AGRyM1uCBKBW3awWOv+JynlB8eHhjWlAkHdDt0Ja1lpBzywpjcpIvfZ1hMjxuqk+Ua0Nz1wdceJyqA==
X-Received: by 2002:a05:6512:3f84:b0:47f:673c:31b7 with SMTP id x4-20020a0565123f8400b0047f673c31b7mr13979453lfa.473.1656447242387;
        Tue, 28 Jun 2022 13:14:02 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.167])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512200f00b004811bf4999csm901113lfb.290.2022.06.28.13.14.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:14:01 -0700 (PDT)
Date:   Tue, 28 Jun 2022 23:13:56 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
CC:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_khsieh@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_drm/msm/dp=3A_make_eDP_pa?= =?US-ASCII?Q?nel_as_the_first_connected_connector?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28 June 2022 18:20:06 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=2Eco=
m> wrote:
>Some userspace presumes that the first connected connector is the main
>display, where it's supposed to display e=2Eg=2E the login screen=2E For
>laptops, this should be the main panel=2E
>
>This patch call drm_helper_move_panel_connectors_to_head() after
>drm_bridge_connector_init() to make sure eDP stay at head of
>connected connector list=2E This fixes unexpected corruption happen
>at eDP panel if eDP is not placed at head of connected connector
>list=2E

The change itself is a good fix anyway=2E (And I'd ack it=2E) However I wo=
uld like to understand why does it fix the corruption issue=2E What is we h=
ave eDP and DSI, with DSI ending up before the eDP? Would we see the issue?
Also could you please describe the mind of corruption you are observing?


>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> drivers/gpu/drm/msm/dp/dp_drm=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_drm=2Ec b/drivers/gpu/drm/msm/dp/d=
p_drm=2Ec
>index ce0ec3a=2E=2E2d18884 100644
>--- a/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>@@ -136,5 +136,7 @@ struct drm_connector *dp_drm_connector_init(struct ms=
m_dp *dp_display)
>=20
> 	drm_connector_attach_encoder(connector, dp_display->encoder);
>=20
>+	drm_helper_move_panel_connectors_to_head(dp_display->drm_dev);
>+
> 	return connector;
> }
