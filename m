Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF8264E309
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 22:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiLOVZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 16:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiLOVZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 16:25:23 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3265623BF9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 13:25:20 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 047343F272;
        Thu, 15 Dec 2022 22:25:18 +0100 (CET)
Date:   Thu, 15 Dec 2022 22:25:17 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8150: Add GPU speedbin support
Message-ID: <20221215212517.m4p5smfp6z3kuiso@SoMainline.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-7-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213002423.259039-7-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-12-13 01:24:22, Konrad Dybcio wrote:
> SM8150 has (at least) two GPU speed bins. With the support added on the
> driver side, wire up bin detection in the DTS to restrict lower-quality
> SKUs from running at frequencies they were not validated at.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On Sony Xperia 5 (speed bin 0x3)
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
