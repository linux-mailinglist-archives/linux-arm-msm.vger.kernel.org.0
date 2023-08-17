Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50F077F3E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 11:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348996AbjHQJzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 05:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349957AbjHQJzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 05:55:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB969E40;
        Thu, 17 Aug 2023 02:55:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 881EF63944;
        Thu, 17 Aug 2023 09:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C3CC433C8;
        Thu, 17 Aug 2023 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692266128;
        bh=Jt1IVMEO12SiYr/MXa/1Iyn6WVoKlE732yrn6kSKBfQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=X8qLudAXEGb8mmebPPfhm88szkQuogS10zDeybtFUflcm2q+qxgrEfZbcEnLeRwb4
         1S9Hco5Vdx6HMl2fUzHleP0FWwwH7Hu1Kh+1AyFLuuAcBVrtIDkc2DQeEri25Xb63R
         dghmFIZlhezcDX4ftaJ9NS9MFX3DiXk+LVTq0iGQ7KvUD8F8w75DHD9hw7E9WMMUfT
         V0C9BOdq4Ex25ieGwh4jEMyraDoBb6DOU1Le1k+y6dwZwXnayf7B+DPN87jHS3Qyrz
         AKgAqoWEOsOo/QGYfRTFsxT6o1E2Mtnw5Yk5t5XTW8USRhAmZls9YZKgJ7XbjllwFS
         V2b1dcEzLadyg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2 00/13] phy: qcom-qmp-pcie: convert to newer
 style of bindings
Message-Id: <169226612462.81413.17837739728017368201.b4-ty@kernel.org>
Date:   Thu, 17 Aug 2023 15:25:24 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 31 Jul 2023 13:57:46 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made it clear that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml
        commit: 1c42a5f4e84b217aa44747079aae9ba26c29e328
[02/13] phy: qcom-qmp-pcie: simplify clock handling
        commit: c4b46cdfc9ef4cd003ee52bb0a2b3c43ed26cd60
[03/13] phy: qcom-qmp-pcie: populate offsets configuration
        commit: 64adc0bf06ad5855da5a02b9653fb7cfda289c50

Best regards,
-- 
~Vinod


