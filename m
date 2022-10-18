Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138B760228F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbiJRDWf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiJRDVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:21:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B1D9DD9B;
        Mon, 17 Oct 2022 20:17:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D7D2B81C64;
        Tue, 18 Oct 2022 03:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A80DC43140;
        Tue, 18 Oct 2022 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062924;
        bh=P3b9q7g9+BAevqbNi3jyzC063oduvYgSFI4PQsKy3Fw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hkupTcdLxgMdCjPsle66yDfGfJQg3H2I6ErsjRZ5kFVEma03r1hco5we+4qXxZ2Nh
         K08Z+U1+/QpXv5W+iUxd1Q5EaR6J9yydD2z74NhFmq7vpRBY53jA/WzQhzpzrXwhj2
         u1dNWaKnYBVlHNxkY6YrdyMO92L2Zit8LeM5P8DWCNbsUon1jjRF5UPfG2OplG/pjz
         irMPXLLAaQvx3vdegR9SzItzC09o+q/8ngOV+yviV7Lgz8awU4whn13dRtBivYNDhg
         QiotAk7K+M9ZTGhLj6vXKGe5S6JKt2438IKCDpUipnTA46Xi8Mqh1WQL7X1aLHSgpl
         wgldWh4Gx2qGQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     stephan.gerhold@kernkonzept.com
Cc:     luca@z3ntu.xyz, linux-remoteproc@vger.kernel.org,
        stephan@gerhold.net, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org,
        sireeshkodali1@gmail.com, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH v4 0/7] remoteproc: qcom_q6v5_mss: Add MSM8909 and MSM8953
Date:   Mon, 17 Oct 2022 22:15:17 -0500
Message-Id: <166606235853.3553294.4500791569049554240.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Sep 2022 20:24:26 +0200, Stephan Gerhold wrote:
> Convert parts of the qcom,q6v5.txt binding documentation to a DT schema
> (together with some DT fixes) in preparation of adding new compatibles
> for MSM8909 and MSM8953. The schema can be easily shared between
> MSM8916, MSM8974, MSM8909 and MSM8953 because they have almost the same
> requirements. The other SoCs are quite different and are likely more
> clearly described in separate DT schema(s) to avoid a lot of complicated
> if statements.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: msm8916: Drop MSS fallback compatible
      commit: ff02ac621634e82c0c34d02a79d402ae700cdfd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
