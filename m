Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E6F6B3DBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 12:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjCJL3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 06:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjCJL2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 06:28:49 -0500
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44837149A2;
        Fri, 10 Mar 2023 03:28:47 -0800 (PST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1paavL-002Xzn-96; Fri, 10 Mar 2023 19:28:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Mar 2023 19:28:35 +0800
Date:   Fri, 10 Mar 2023 19:28:35 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v11 00/10] crypto: qcom-qce: Add YAML bindings and
 support for newer SoCs
Message-ID: <ZAsUY8m+TvlXciXb@gondor.apana.org.au>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 22, 2023 at 07:22:30PM +0200, Vladimir Zapolskiy wrote:
> The series contains Qualcomm Crypto Engine DT bindings documentation and
> driver changes, which modify a set of accepted compatible property values,
> which is needed to provide a unified and fine-grained support of the driver
> on old and new platforms. In addition due to QCE IP changes on new Qualcomm
> platforms, it is reflected in updates to valid device tree properties,
> namely added iommu, interconnects and optional clocks.
> 
> Qualcomm crypto engine (QCE) is available on several Snapdragon SoCs.
> The QCE block supports hardware accelerated algorithms for encryption
> and authentication. It also provides support for aes, des, 3des
> encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
> authentication algorithms.
> 
> Changes since v10:
> =================
> - v10 can be found here: https://lore.kernel.org/all/20230216131430.3107308-1-vladimir.zapolskiy@linaro.org/
> - Fixed 05/10 commit message per request from Krzysztof and added his
>   reviewed-by tag.
> - Rebased the series on top of the linux-next.
> 
> Changes since v9:
> =================
> - v9 can be found here: https://lore.kernel.org/linux-crypto/20230208183755.2907771-1-vladimir.zapolskiy@linaro.org/
> - Added a new generic 'qcom,qce' compatible name, since IP is runtime
>   discoverable, however two new SoC name based compatibles are left
>   due to necessity to differentiate various lists of required properties.
> - Updated documentation according to review comments by Krzysztof.
> - Removed platform specific changes in dtsi files, only one bisectable
>   change in sm8550.dtsi is left in the series.
> - Added some commit tags, however a few given tags by Krzysztof are not
>   added, since the previous tagged changes were noticeably reworked.
> 
> Changes since v8:
> =================
> - v8 can be found here: https://lore.kernel.org/all/20230202135036.2635376-1-vladimir.zapolskiy@linaro.org/
> - Rebased the series on top of linux-next, sm8550 qce support is already
>   found in the tree.
> - Reduced the list of QCE IP compatibles in the driver, added one more
>   compatible for backward DTB ABI compatibility.
> - Replaced a documentation change from Neil Armstrong by a more advanced
>   version of it per review comments from Krzysztof Kozlowski about clock
>   and clock-names properties.
> - Added changes to all relevant Qualcomm platform dtsi files according to
>   the changes in the scheme file.
> - Added QCE support on SM8250 platform.
> 
> Changes since v7:
> =================
> - v7 can be found here: https://lore.kernel.org/linux-arm-msm/20220920114051.1116441-1-bhupesh.sharma@linaro.org
> - Added a change by Neil Armstrong to document clocks and clock-names
>   properties as optional,
>   - At the moment do not add Bhupesh as a new QCE driver maintainer,
>   - Minor updates to device tree binding documentation and qce driver,
>     in particular added more compatibles and fixed lesser issues.
> 
> Changes since v6:
> =================
> - v6 can be seen here: https://lore.kernel.org/linux-arm-msm/30756e6f-952f-ccf2-b493-e515ba4f0a64@linaro.org/
> - As per Krzysztof's suggestion on v6, clubbed the crypto driver and
>   dt-bindings changes together. Now the overall v5 patchset into 3
>   separate patchsets, one each for the following areas to allow easier
>   review and handling from the maintainer: arm-msm, crypto and dma
> 
> Changes since v5:
> =================
> - v5 can be seen here: https://lore.kernel.org/lkml/20211110105922.217895-1-bhupesh.sharma@linaro.org/
> - As per Bjorn's suggestion on irc, broke down the patchset into 4
>   separate patchsets, one each for the following areas to allow easier
>   review and handling from the maintainer: arm-msm, crypto, dma and devicetree
> - Addressed Rob's, Vladimir's and Bjorn's review comments received on v5.
> - Added Tested-by from Jordan received on the v5.
> 
> Changes since v4:
> =================
> - v4 for sm8250 can be seen here: https://lore.kernel.org/linux-arm-msm/20211013105541.68045-1-bhupesh.sharma@linaro.org/
> - v1 for sm8150 qce enablement can be seen here: https://lore.kernel.org/linux-arm-msm/20211013165823.88123-1-bhupesh.sharma@linaro.org/
> - Merged the sm8150 and sm8250 enablement patches in the same patchset,
>   as per suggestions from Bjorn.
> - Dropped a couple of patches from v4, as these have been picked by
>   Bjorn already via his tree.
> - Addressed review comments from Vladimir, Thara and Rob.
> - Collect Reviewed-by from Rob and Thara on some of the patches from the
>   v4 patchset.
> 
> Changes since v3:
> =================
> - v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20210519143700.27392-1-bhupesh.sharma@linaro.org/
> - Dropped a couple of patches from v3, on basis of the review comments:
>   ~ [PATCH 13/17] crypto: qce: core: Make clocks optional
>     ~ [PATCH 15/17] crypto: qce: Convert the device found dev_dbg() to dev_info()
> - Addressed review comments from Thara, Rob and Stephan Gerhold.
> - Collect Reviewed-by from Rob and Thara on some of the patches from the
>   v3 patchset.
> 
> Changes since v2:
> =================
> - v2 can be seen here: https://lore.kernel.org/dmaengine/20210505213731.538612-1-bhupesh.sharma@linaro.org/
> - Drop a couple of patches from v1, which tried to address the defered
>   probing of qce driver in case bam dma driver is not yet probed.
>   Replace it instead with a single (simpler) patch [PATCH 16/17].
> - Convert bam dma and qce crypto dt-bindings to YAML.
> - Addressed review comments from Thara, Bjorn, Vinod and Rob.
> 
> Changes since v1:
> =================
> - v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210310052503.3618486-1-bhupesh.sharma@linaro.org/
> - v1 did not work well as reported earlier by Dmitry, so v2 contains the following
>   changes/fixes:
>   ~ Enable the interconnect path b/w BAM DMA and main memory first
>     before trying to access the BAM DMA registers.
>   ~ Enable the interconnect path b/w qce crytpo and main memory first
>     before trying to access the qce crypto registers.
>   ~ Make sure to document the required and optional properties for both
>     BAM DMA and qce crypto drivers.
>   ~ Add a few debug related print messages in case the qce crypto driver
>     passes or fails to probe.
>   ~ Convert the qce crypto driver probe to a defered one in case the BAM DMA
>     or the interconnect driver(s) (needed on specific Qualcomm parts) are not
>     yet probed.
> 
> Bhupesh Sharma (4):
>   dt-bindings: qcom-qce: Convert bindings to yaml
>   MAINTAINERS: Add qcom-qce dt-binding file to QUALCOMM CRYPTO DRIVERS section
>   dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
>   dt-bindings: qcom-qce: Add 'iommus' to optional properties
> 
> Thara Gopinath (2):
>   crypto: qce: core: Add support to initialize interconnect path
>   crypto: qce: core: Make clocks optional
> 
> Vladimir Zapolskiy (4):
>   dt-bindings: qcom-qce: Add new SoC compatible strings for Qualcomm QCE IP
>   dt-bindings: qcom-qce: document optional clocks and clock-names properties
>   arm64: dts: qcom: sm8550: add QCE IP family compatible values
>   crypto: qce: core: Add a QCE IP family compatible 'qcom,qce'
> 
>  .../devicetree/bindings/crypto/qcom-qce.txt   |  25 ----
>  .../devicetree/bindings/crypto/qcom-qce.yaml  | 123 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/qcom/sm8550.dtsi          |   2 +-
>  drivers/crypto/qce/core.c                     |  23 +++-
>  drivers/crypto/qce/core.h                     |   1 +
>  6 files changed, 145 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> 
> -- 
> 2.33.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
