Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8186561E8F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 04:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiKGDMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Nov 2022 22:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiKGDMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Nov 2022 22:12:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E85DF8A;
        Sun,  6 Nov 2022 19:12:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 616E660E86;
        Mon,  7 Nov 2022 03:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9864DC433D6;
        Mon,  7 Nov 2022 03:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790763;
        bh=inbeGAdUMlatY4K2rehMvi7/AMYu6cFLYWl+HrPlfNE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fWgFPhwE4ERMFMtNSzTZQAb2owUo6VEOOos9Jifeb7wjZxAcIOCmBUtL/Mr+UuLM7
         uaKEVkwk2ameYKnRIfONgMQrMmfVnOotd8S9Pp/KKyVXK8NImKBNpu8HWLHa0LPXQc
         jP4g/oS5akn8KVkRDwueY03x2qxIfkmhPUkhqpsOo0Vb5RGb4tCih5f9PdUPp+5k/C
         tqmx45kFSvutEgh5JmIbhQTz0fhgrXeOjCtrvt5y5JXaYYADj5Ptvxbc6LYOgPVDeY
         s2X41uLhv5/GqmUEOehfT0CSXIUxyswsuOJrM+D2N2tSnVbPvVDPmklsSIFbeH8a2d
         peJyrsgzFX2og==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        sean@poorly.run, Rob Herring <robh+dt@kernel.org>,
        konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
        robdclark@gmail.com, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, airlied@gmail.com, swboyd@chromium.org,
        loic.poulain@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, daniel@ffwll.ch,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: qcom: add another exception to the device naming rule
Date:   Sun,  6 Nov 2022 21:12:01 -0600
Message-Id: <166779074271.500303.10226016628561837070.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
References: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Nov 2022 16:23:16 +0300, Dmitry Baryshkov wrote:
> The 'qcom,dsi-ctrl-6g-qcm2290' compatibility string was added in the
> commit ee1f09678f14 ("drm/msm/dsi: Add support for qcm2290 dsi
> controller") in February 2022, but was not properly documented in the
> bindings. Adding this compatibility string to
> display/msm/dsi-controller-main.yaml caused a warning from
> qcom-soc.yaml. Fix the warning by adding an exception to the mentioned
> file.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: qcom: add another exception to the device naming rule
      commit: 965a6d823a0476f9500216f1855bb8fcc6b73551

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
