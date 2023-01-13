Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA674668881
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 01:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbjAMAfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 19:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbjAMAfE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 19:35:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3836131F;
        Thu, 12 Jan 2023 16:35:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26ACEB815FA;
        Fri, 13 Jan 2023 00:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0EBC433D2;
        Fri, 13 Jan 2023 00:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673570100;
        bh=uf9ruxi3HxRXOxxtl/Pz4/MUtqgREk4h4b4ZENEIF3M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d/mBjt4Xc6TCJcGl+7GGxkeseI2W0efMtEjrQNkDwQqi0uvJphetP7+0oh8Kv1Yqa
         JVGSXNpyHa76ggz5akLqwHBbCKveUhjf0kOSj2ykiKfvyLO4ShfIC46Hq8uMiv1R+9
         ccnFQHfnUq0yuTp9hlzsTLkDqeJU/iwHvKCSleVn4j06LcUgEkQGH0PdrGElI5xtj6
         83DGihX3LkSuZcZUipPWtvlp1TMJI3EXj4FcyKUxPj3FO+O+8HPvEVA9whgaAaNDp5
         NS7TZY3Iio6Gl8kjOAuIytLnETy26E9d7xlrHgbs4CvSQ0OoGd7DsdeJ1AFvIYy4hL
         N+DcsrehZuYCw==
Message-ID: <d07f783b1c11507f76ca45529a3cfb62.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221228185237.3111988-10-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org> <20221228185237.3111988-10-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 09/16] clk: qcom: gcc-msm8998: get rid of test clock
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
Date:   Thu, 12 Jan 2023 16:34:58 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-28 10:52:30)
> The test clock apparently it's not used by anyone upstream. Remove it.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
