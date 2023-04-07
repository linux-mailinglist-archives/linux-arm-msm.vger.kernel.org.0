Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9746DB1D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 19:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjDGRjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 13:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjDGRi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 13:38:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B3ABB9B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 10:38:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56CB8652B1
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C1FC4339B;
        Fri,  7 Apr 2023 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680889117;
        bh=KPIevUfhOCnsYWGl++KgpaVzp3iMelMgZUHcaQzbHrE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NhzB+Ima+sIrbFEAGM90EVhtvmotJR+DjUqi6rvvECD6iojuImvFKYeqNca9XhBXr
         lSCgD5jqsgM2S+FDIXuxInq2hwEZooNzT6ZMLvK+aorFe27YQZuyhyQIbb3xcq0vJ0
         OiQnQ3kZNRtGDBUZwSSuobnqk/fEe8hIOok/Kjy/T7UTcGnLqDB8lCxjYy3bS51k7X
         MpH4JrsHptqhTL/+eaFYR9kMLcRMkuivCRQl+TBGx+ax1xfBiqoesHqks0BhHSWsVK
         51H1RO5cn/VdBaQE5Ydf7baah/ChiyfAUJe5ty5avOdAezjYNpOmnZM1DnqjPrpZkL
         bnXsmTin8r/iA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Cc:     dianders@chromium.org, quic_khsieh@quicinc.com,
        seanpaul@chromium.org, robdclark@gmail.com, swboyd@chromium.org,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        freedreno@lists.freedesktop.org, konrad.dybcio@linaro.org,
        quic_bjorande@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards
Date:   Fri,  7 Apr 2023 10:41:15 -0700
Message-Id: <168088927579.2561591.16300478555888489452.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
References: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Mar 2023 16:34:16 -0700, Abhinav Kumar wrote:
> There are some interop issues seen across a few DP monitors with
> HBR3 and herobrine boards where the DP display stays blank with hbr3.
> This is still under investigation but in preparation for supporting
> higher resolutions, its better to disable HBR3 till the issues are
> root-caused as there is really no guarantee which monitors will show
> the issue and which would not.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards
      commit: 75eab749e7aec0b7b515d7c50ed429ef4e1c5f3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
