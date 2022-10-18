Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25CC6021B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbiJRDGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiJRDGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36788A1E7;
        Mon, 17 Oct 2022 20:06:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91ADCB81C61;
        Tue, 18 Oct 2022 03:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931E5C43141;
        Tue, 18 Oct 2022 03:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062390;
        bh=GM30AKOfgBsVJt+Xz++xg3ol19lpkzcYHVj0U+g1oPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GWkPZW4GLQFUt1qr6pVFYsYFqwsV/H645X8RMqvc3IBXlPOinxmw8VA6CXGZ6KS4Q
         5LYHZS/gXH3+thgm+1CZ2bHdtCpy25mXSwa6+GJ1pPo8XQ+tYV4FszzX8Z75S+XBsr
         1jEYInXOQ+QfHOKF4ZEtfn1zigY289frvE4IkSTHxSG2DTziXwUW9UnTcOsRVS4S3R
         xN9MxaTPTPhBkhnwtN+D7D3j6fezv/ky8rahe5df1EVbYipb0hbtDj4ZqPdd0bAtXp
         lYUQBG1qSf5y0FayQb2xQUC30CEexvT/f+HswlnILgcmQPmSWCDT6ejT++aOnuDNkx
         zvCPiTNl73/3A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robh+dt@kernel.org,
        agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: qcom: msm8996: add missing TCSR syscon compatible"
Date:   Mon, 17 Oct 2022 22:05:11 -0500
Message-Id: <166606235833.3553294.14010306999480993150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220921095258.2332568-1-dmitry.baryshkov@linaro.org>
References: <20220921095258.2332568-1-dmitry.baryshkov@linaro.org>
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

On Wed, 21 Sep 2022 12:52:58 +0300, Dmitry Baryshkov wrote:
> This reverts commit 8a99e0fc8bd3 ("arm64: dts: qcom: msm8996: add
> missing TCSR syscon compatible").
> 
> This commit marked the saw3 (syscon@9a10000) node as compatible with
> qcom,tcsr-msm8996. However the mentioned device is not not a TCSR
> (system registers, hardware mutex). It is a CPU power
> controller/regulator, which is currently being handled as a syscon.
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: msm8996: add missing TCSR syscon compatible"
      commit: 20772f506fa4aab4d03035807f30eecee856e274

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
