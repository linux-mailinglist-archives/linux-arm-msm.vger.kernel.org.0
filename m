Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77BA266887E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 01:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjAMAey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 19:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjAMAex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 19:34:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D7F61327;
        Thu, 12 Jan 2023 16:34:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E3AE3621E2;
        Fri, 13 Jan 2023 00:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2CFC433EF;
        Fri, 13 Jan 2023 00:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673570091;
        bh=RkezJJ7XeWM9rjzppQrxoVaL6w0U3bPx2CUchTMakkU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OhsSVi6A8C3NEb2oBPnshesPc+EqUT14vY515HCue4qFYjVklbSpow4qFp27aSZZp
         X3E14DwNCiY6sbzHCDWM3T/kgthb0wJ8Wah7CHavCubG7+ht+0jUzyZ3JUVkoWfwJL
         mf55fuKBIehA6eaV2dQCVFgXYVB0DMfXQXTfyBgYNOsRrAzLibTezhrTJNNn1y2dsY
         qPeBg2lZ5azplvmATvfAszbEq1M89w2ggunjdf5ISeRX0GmuwvxggaI9Yj8VQnmquv
         EGi6UThgsb+eCO8nq2d+m/yg3puNa9pQDeenyNumRO+kLv0bn5tSoQRDoSDSQQ0GnD
         iH4ZcS5ole8Bg==
Message-ID: <44325335a56fe56769dd8cb6b52e4f0a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221228185237.3111988-9-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org> <20221228185237.3111988-9-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 08/16] clk: qcom: dispcc-qcm2290: get rid of test clock
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
Date:   Thu, 12 Jan 2023 16:34:49 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-28 10:52:29)
> The test clock apparently it's not used by anyone upstream. Remove it.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
