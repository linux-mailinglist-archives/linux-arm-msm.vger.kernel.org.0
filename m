Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7A278442A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbjHVO3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 10:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236694AbjHVO3V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 10:29:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61DBCC6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:29:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 545D565931
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 14:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B4BC433CA;
        Tue, 22 Aug 2023 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692714556;
        bh=/oRO8tGRBpVCWe3MdpLqdfhWpLbtOHmnqujYSWseS7A=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=LA60ROlNtx5Z7R+ttVGZux7+k+mjl5EYzYLEJ5QheAjsjIoI3/YlNIimB34t6qUlI
         BNRk/2Z3M1aX4V8Slyr3zStPy52yuXXaIoHAla/x2wU+pFfhGReapKA03bMSZ2yS0J
         AUeyIG1Nz4xWO69OAb7E/51Ose89o0LlIRjELDSfc7Sr1Lb3KeCUrYfAsWYo+RaMI2
         1HC2PdtcZmhJpfh3R79Blac1GMSx9I0j2ZldaS+u4fvb3OBjCQJA+ofVNoeL04S75z
         mwWyrLNDbixrh2necaa4Z9uaOJDvdf5r0sS8qaZJ6Nrln+9Xmh6xnzyKkrrZo2wdL9
         XTE9H5K5oSPig==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20230820235813.562284-1-dmitry.baryshkov@linaro.org>
References: <20230820235813.562284-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] phy: qcom-qmp-combo: fix clock probing
Message-Id: <169271455366.280543.14057160725064934514.b4-ty@kernel.org>
Date:   Tue, 22 Aug 2023 19:59:13 +0530
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


On Mon, 21 Aug 2023 02:58:13 +0300, Dmitry Baryshkov wrote:
> During rebase of qcom-qmp-combo series a call to devm_clk_bulk_get_all()
> got moved by git from qmp_combo_parse_dt_legacy() to
> phy_dp_clks_register(). This doesn't have any serious effect, since the
> clocks will be set in both legacy and non-legacy paths. However let's
> move it back to place anyway, to prevent the driver from fetching clocks
> twice.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-combo: fix clock probing
      commit: b83eb8ba2ab9551217ed36320b8999db2f351e57

Best regards,
-- 
~Vinod


