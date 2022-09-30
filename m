Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4DC5F01FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 02:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiI3A4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 20:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiI3A4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 20:56:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C3A17F55A;
        Thu, 29 Sep 2022 17:56:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D5B92B80D8B;
        Fri, 30 Sep 2022 00:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DEEC433C1;
        Fri, 30 Sep 2022 00:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664499378;
        bh=PKK1u2FfRr8hR+W6BZ0qRf/GqoUQgzL98wLIHPDPtwE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KdfC2/hJPnZZYFs9tytypdEpir4KJ3aS1HUYnJL2o9fktatmUh2z/KX9mxt1SO1tn
         +IbrCVG9RDd1k5qW94NQIbShT8AdCv/LFSR8waw7tejSZXzpwU5uM9AOGt6qUi+dui
         SmfdjNQ3xKJxFscLwA6W9j7pJ5qu2yZbvHgudiRJ+fodeiQzPLcwUvq1NmWqDNVohN
         1c22+mWOOu9ESVex2q3KG4Oq79qy9gxo7XxYj6mXp1q851uV4C7+CQ4R31BviTtRMb
         YZcdbusru+7zltZD4q6jbpK+UMNJUjLfyxAxwLdS5/mflqxW9YgLkKOt/4wC3AIiNN
         MUqZqIurgLNsw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220916061740.87167-3-dmitry.baryshkov@linaro.org>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org> <20220916061740.87167-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 2/3] clk: fixed-rate: add devm_clk_hw_register_fixed_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 29 Sep 2022 17:56:16 -0700
User-Agent: alot/0.10
Message-Id: <20220930005618.83DEEC433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-09-15 23:17:39)
> Add devm_clk_hw_register_fixed_rate(), devres-managed helper to register
> fixed-rate clock.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
