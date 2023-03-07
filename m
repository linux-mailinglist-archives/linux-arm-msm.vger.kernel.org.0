Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4D96AD60F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 05:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjCGERK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 23:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjCGERI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 23:17:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D223157D35
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 20:17:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44FFB61204
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 04:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47EFC433A0;
        Tue,  7 Mar 2023 04:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678162627;
        bh=5iegAyj160JxIkK1J/DNDipsnaWCOEy80XHHQg/Hcgc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tYOqrZz6dVRqML+zxjquVAXL7NOiXqzGyR8E5bdqlnIqFTz9E+oKp2N7cVDtxY5Kw
         Q8yZRNNqbHWAEOBHgyEIAbfp/KsWPAz8DGXFXtNoK8kgCWxH/FwwWrjhMGOFBZ0gZp
         XWnasNBqFluqwRiWTdKgzDhF6t1IJ7+pCwPiqkPMRsABF0GWg5Cy8stoC5pW76GeMO
         EqNPY81SwI6ni0J5fRLAmxmBovnfWMKGj+JQb/hRWIvLRuqOhBem0kI2+cW3KWP0I1
         csWH4eU0CSIbjEx6o5SY0BOEZ2M+GeZMYyf0tajFLZ73pGDTk9T6ETH2wSlQ6Bd/US
         VfdQnIIpJ86Cg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
Subject: Re: (subset) [PATCH v3 0/4] SM6375 remoteprocs
Date:   Mon,  6 Mar 2023 20:20:30 -0800
Message-Id: <167816282863.1458033.14377707951254005036.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230109135647.339224-1-konrad.dybcio@linaro.org>
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
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

On Mon, 9 Jan 2023 14:56:43 +0100, Konrad Dybcio wrote:
> This revision merges two [1] [2] previously separate series,
> adding SM6375's ADSP, CDSP, MPSS and related bindings.
> 
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230107120623.1903056-1-konrad.dybcio@linaro.org/T/#m89d629bd788593dfd27e4dbf0cf0bf94ffd0a7ce
> [2] https://lore.kernel.org/linux-arm-msm/622afd8b-a469-4c95-d2b8-030e47b0cac2@linaro.org/T/#m17aee8f3a51cfbd3f92fe2b4dd48b3722a6a0a7e
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sm6375: Add missing power-domain-named to CDSP
      commit: 11d5e41f5e129e39bddedc7244a0946a802d2e8e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
