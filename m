Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E90668895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 01:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbjAMAgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 19:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbjAMAgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 19:36:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062AC61338;
        Thu, 12 Jan 2023 16:35:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60FE7621DC;
        Fri, 13 Jan 2023 00:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF990C433F0;
        Fri, 13 Jan 2023 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673570158;
        bh=yQWRMMUNGFtjiEIaS8EKT5gV/Yn01FKt2Q/WoJVLgQ0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oYmw8Vv1IjuyBTBOJhvZ5NOAc+xRtwdcMWXHaGchcPZnR1lQx/sMy84uMIykGeex+
         /+JxusM/6mS2+fyeYkdEuxOcuxrEf/TDBF6+qvYjZeIkkX3a13PEE6P1FUNGYHdUGD
         /kAwSjINyXIO7VoHQxuN/Sil0VZo/bR/ImLZj6PfhMetHXmO/ftta8cDgqawEPq6zw
         imWFCQj3kerfGiQo0kfAl2YkqBGHGvXUkL7l1ztbRgmrR1TW6ueb0lbKFiCVjtBmXi
         ao6sJiQFX4wJf6t21WAQ71PqK1ZFyJrswrYwyu+/L7CNnXv8bETAus1/TX5myQXL0G
         TuYIbb2DQcv+g==
Message-ID: <46ce692e441f6837c30a959fbcaa4e7a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221228185237.3111988-15-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org> <20221228185237.3111988-15-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 14/16] clk: qcom: gcc-sm8350: get rid of test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Thu, 12 Jan 2023 16:35:56 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-28 10:52:35)
> The test clock apparently it's not used by anyone upstream. Remove it.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
