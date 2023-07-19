Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018397599EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 17:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjGSPhw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 11:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjGSPht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 11:37:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B984BE;
        Wed, 19 Jul 2023 08:37:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1251761740;
        Wed, 19 Jul 2023 15:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E060C433C8;
        Wed, 19 Jul 2023 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689781065;
        bh=8vE1ot6XzFQ4H6sBrVB9YMCDiYUQPwwfTpKgGcHZcng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vQ6SfMBZY0QHME2fvrVuvDrOXOy58YBPTNc7A5lnuITNetabLNPEaeOM2paMu+SpH
         5fMLvaTesCUu8r4E9urcNhjlR7E4aivQOfNQzRn1o1jn817gmOMeIa1MvStD1DfCzt
         fBFry24AMlETBkSftX5RdTBdnz8W/t8XEOKOYCPXLw0CeV8oZa6Ui1Tt9nV996Qvya
         kzyPIyx4lWfbOSz2EEqnGaTgNKe3K74mHGHwnrZubbMdJulY533/o/Zbzbz3kWDje2
         cGmv3z9PZMUxUmLBOk+COJeg3K9jHOolKstg/tJLUNv/I7e0ofES8Q8fbd2oUDIzwL
         zYMgGTrtzPBBw==
Date:   Wed, 19 Jul 2023 21:07:27 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
Message-ID: <20230719153727.GD9312@thinkpad>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609054141.18938-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 09, 2023 at 11:11:39AM +0530, Parikshit Pareek wrote:
> Some qcom SoCs have SMMUs, which need the interconnect bandwidth to be
> This series introduce the due support for associated interconnect, and
> setting of the due interconnect-bandwidth. Setting due interconnect
> bandwidth is needed to avoid the issues like [1], caused by not having
> due clock votes(indirectly dependent upon interconnect bandwidth).
> 

As discussed offline, once you enable the PCIe RC driver which votes for this
interconnect path (pcie-mem) like other platforms [1], then you do not need this
series. This interconnect path belongs to the PCIe RC controller. So it is the
responsibility of the PCIe RC driver to vote for this path and that's what the
driver is already doing.

- Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sc8280xp.dtsi#n1767

> Parikshit Pareek (3):
>   dt-bindings: arm-smmu: Add interconnect for qcom SMMUs
>   arm64: dts: qcom: sa8775p: Add interconnect to PCIe SMMU
>   iommu/arm-smmu-qcom: Add support for the interconnect
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 22 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  4 ++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 16 ++++++++++++++
>  3 files changed, 42 insertions(+)
> 
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்
