Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785F567BEEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbjAYVp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbjAYVp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:45:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984093B3C1;
        Wed, 25 Jan 2023 13:45:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54F40B81BF8;
        Wed, 25 Jan 2023 21:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18F4C433D2;
        Wed, 25 Jan 2023 21:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683154;
        bh=32HkDRu3ppF/UgKP1U/euNuRGp3MzGnTk4kFyCKGUV8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JxKmmFAa0DmQi1nWve0Td/YIby27981M0UZp4Xcv8BHaY2FIMnp03SrtDnNg+LVEP
         uVGUUWsINk9s2MP97VPNRYKrVdicOCMMOkriwWvRtL9xHSKHbUG8NtZ0nwW26sSV0P
         4LVM1h2T9fTR+mOvZblPa2ok7t2OiX+y/jqkbgi1vOOEYTaN9pBsjmbhulYRBw++vk
         +L7IgG1Vf17cv9GTLRLGLl6i+z0OZWOqKPo9oOwrlAZxyi3we35OO5Np/hvbQQYkbg
         OoJ7p3l9FK0bmRm492fRKmtAhbLgD7I6GEL8kubaGX7nGQDPKsZVTdZEc/gewQQBgT
         +zRUar3jdlH6g==
Message-ID: <146e73da46ec1e295e1cfe14c6de0c15.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-5-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 04/12] clk: qcom: gcc-apq8084: use ARRAY_SIZE instead of specifying num_parents
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
Date:   Wed, 25 Jan 2023 13:45:51 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:54)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
