Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC97E7D837B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 15:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbjJZN01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 09:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345051AbjJZN00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 09:26:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BD71AC
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 06:26:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5DFC433C7;
        Thu, 26 Oct 2023 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698326783;
        bh=iRn7vDIBkvqTVmnZQoeJoZ6KdPtszrHGt6CVY4MQMDc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=R31R0WO0LMF1N+jXnuaW7wPNJHkEYjQI51xow57y4Ms4dtrziSUH8mU/kUU7YRWbe
         BGPE8mcSwd1EfqPZITWQeq+2gSrI3TlKK6qEmJPHCqVe2+nkLWDS9AMLNbLj98Onha
         4djo4sNWqKU9QU/jM11WEst61l3ivN/ampO2jswTyQ/R75dqeZDycP3UF8Bhke6ql9
         JM4VX6l3qDGnS7J9U9pz5rmIRIy0NukMe0N2haIX5bcpYyEJI1x07mca7GAEdoXx3p
         eEKlU94CfYbzvD8W8xV93gwnef2QPLS6jy+4GyU++sskRmHFh2FxY62WJC+CLgMTAj
         h1xj3U3JhJywg==
From:   Maxime Ripard <mripard@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/ci: pick up -external-fixes from the merge
 target repo
Message-Id: <169832677721.958223.13412416633186382267.b4-ty@kernel.org>
Date:   Thu, 26 Oct 2023 15:26:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 08 Oct 2023 16:23:19 +0300, Dmitry Baryshkov wrote:
> In case of the merge requests it might be useful to push repo-specific
> fixes which have not yet propagated to the -external-fixes branch in the
> main UPSTREAM_REPO. For example, in case of drm/msm development, we are
> staging fixes locally for testing, before pushing them to the drm/drm
> repo. Thus, if the CI run was triggered by merge request, also pick up
> the -external fixes basing on the the CI_MERGE target repo / and branch.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

