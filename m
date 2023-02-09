Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8693768FECE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjBIEaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjBIEaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:30:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A413BD87;
        Wed,  8 Feb 2023 20:29:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B584B82004;
        Thu,  9 Feb 2023 04:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBE9C433A1;
        Thu,  9 Feb 2023 04:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916496;
        bh=NbPGHw+v0RjNMAjbMThQruADAmMbvfwxxZlCuITUOXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oFSYI/HK94pnpP+nj5tKXj+uYET/sbJSYI+js2+FvjUSeXyTOKYIIGemgtncrVEQZ
         e/bTnaj0KIFaKB7sfGUYBb+Zv4GhQKp0ORsmze0uPF+riMT3K4DaqnNxKoVE2TMnZH
         bpvIJJP4TuGyMVCN8ClUEWZE0++YEU4IXPIELpYoS+yJCxjlT99uLZVgpHxekwAGi3
         zEpsC14DkbXXICuQ8ZJrB7OI+OzuzSRgpD39+ff0teV8+xQlYZRVtxPO/g6+5z9yDo
         cbJE55F+f7HHOidY8H2ryBAwSEMWHFarGeTuE6NVpLRmjNiI2kNzW6aAX8z1b+gnxp
         a3MOtj3B1pE/g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: qcom: apq8064: add second DSI host and PHY
Date:   Wed,  8 Feb 2023 20:22:52 -0800
Message-Id: <167591660369.1230100.4925848753575760377.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121091237.2734272-1-dmitry.baryshkov@linaro.org>
References: <20230121091237.2734272-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 Jan 2023 11:12:37 +0200, Dmitry Baryshkov wrote:
> Add second DSI host and PHY available on the APQ8064 platform.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: apq8064: add second DSI host and PHY
      commit: 240fb292d3aeb20015d1ab3805fb561be8a9c6f5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
