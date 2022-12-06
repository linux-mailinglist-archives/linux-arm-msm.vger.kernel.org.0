Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF95644B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 19:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiLFSUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 13:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiLFSTt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 13:19:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC4BD138;
        Tue,  6 Dec 2022 10:19:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0EFE6181B;
        Tue,  6 Dec 2022 18:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98263C43148;
        Tue,  6 Dec 2022 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350788;
        bh=7gp3xZIRoVOf5J/6vqBKGSzZDnyxg9VrMldgf/7Lv6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FmJ7PaYlRHbvZKXQOFQAKL8D9AeWoZQhUdyVIHmLaWEjcth+xrNkJqMKl4omDCDxd
         snMj8mCamrKENgS3fa0y3bBjRmcGxCcbgahJaHJJwTFIfDm0/JyzV8gZdsPeLpmIZt
         fYOLHm5C24OB7tocnxRFA0sj5XV7J6SZKPONon8GcbcPHZO09ta6LptGI7hsEQgq8O
         Z+cNjqPkqOjtjQG5rIG3+KPqIS2J494hGzb/upTJaAtnvsr1zdyLcKGlWCxrU0EcFQ
         lrrtzBONxeJlXXjP14cZO5RgDBCLCaeLAudTynhJa8Z8ey4cmdncuggNi7oc9r64Pu
         YG5sgiofuBCFQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robh+dt@kernel.org, konrad.dybcio@somainline.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: arm: qcom: split MSM8974 Pro and MSM8974
Date:   Tue,  6 Dec 2022 12:18:52 -0600
Message-Id: <167035076345.3155086.1325281828442198384.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
References: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
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

On Mon, 28 Nov 2022 15:15:49 +0200, Dmitry Baryshkov wrote:
> The MSM8974 Pro (AC) and bare MSM8974 are slightly different platforms.
> Split the compat strings accordingly to clearly specify the platform
> used by the device.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: split MSM8974 Pro and MSM8974
      commit: 2e62303fb8807d70208e54475fa9181ae4b17285
[2/2] arm: dts: qcom: use qcom,msm8974pro for pro devices
      commit: 1477cca86492a58177a2afe2837494301e97f6ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
