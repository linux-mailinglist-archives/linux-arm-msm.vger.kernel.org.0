Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E42668892
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 01:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbjAMAf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 19:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbjAMAfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 19:35:52 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B494A61337;
        Thu, 12 Jan 2023 16:35:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70765B811FF;
        Fri, 13 Jan 2023 00:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232B7C433D2;
        Fri, 13 Jan 2023 00:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673570149;
        bh=50WyYPy6sYBI3NSOzF6Yrd1TniHqUoDA+6dxPVNXhlM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MscmlW+fIXzgsCK/1a81qa8kz01P0SvPBiiY++RVd8OxXP6/ytMfFCNoW8Pj/Jsbn
         4NcFEbs1nuePGDXEPqUGc1y7+oubHVAy0uqAlf/nvgpRhDmQ9dr/0oEESqeP6grkCC
         SbNNi59LfZuSYPh9D2FIMc9MfaCeozLyWH1Hh5OnTbeJoI+7/4q7Oj38YRosxjOqE+
         RvPE0ZxwgHgTG7upRl5TgQMpn6ooq0/73rE64+qagK28tfXfQTfsX5l6ytV9DkEtzB
         DI8Ewa0c42pYU/jAY9SiDK9KhZVTXDzCxcaSb8sSBIRV4KpUAKAGp3JwL4Yp2+yfFb
         pcaiTAMRAg5QQ==
Message-ID: <aa0569c5150961ecdae25fc980f8c6c2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221228185237.3111988-14-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org> <20221228185237.3111988-14-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 13/16] clk: qcom: gcc-sm8150: get rid of test clock
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
Date:   Thu, 12 Jan 2023 16:35:47 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-28 10:52:34)
> The test clock apparently it's not used by anyone upstream. Remove it.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
