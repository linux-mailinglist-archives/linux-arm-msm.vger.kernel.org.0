Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1B0612194
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 10:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJ2IsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 04:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiJ2IsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 04:48:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A282258B4C;
        Sat, 29 Oct 2022 01:48:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A420B80B19;
        Sat, 29 Oct 2022 08:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF89C433C1;
        Sat, 29 Oct 2022 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667033284;
        bh=qAB44AW9l7MBg3PipZA9gp8hcRBcbWZ2uPxGK7uAZ0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hj9EHjO9OTXV1nd8TMHapdEkPKuS1I1SAr0E/MPHdkLWnjuijP2cgi5Y+Acm4SJFF
         1TL9TQq/s9gK0F7VTDHiksxoom9bHUgBvHxY53QFEec6nwxKVamuNrs0eJ7spw6HU1
         luXDV39kM/dbJ9W7mM2VLTDnFomcfHRjkWqaT0OlB/TzrXZoLfYV06UVLkb2tVKlVl
         ATTVHRZ/dTomj7FtA5al8cvUvfBxBnZ6BKnqxR4HjJZhxQ6LUTtrGBD/0YSvih44Co
         PcW6+B/uUxtMkkd5YIhXnFbmS1KoDQl2JUeMHYZo8H5NnXiQx+Z8xDvttSyZF2n5N5
         jnpwTAVdloU0g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oohVP-00008o-Av; Sat, 29 Oct 2022 10:47:51 +0200
Date:   Sat, 29 Oct 2022 10:47:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] dt-bindings: phy: qcom,qmp-pcie: rename current
 bindings
Message-ID: <Y1zot8aJ1WXnbrwF@hovoldconsulting.com>
References: <20221028133603.18470-1-johan+linaro@kernel.org>
 <20221028133603.18470-11-johan+linaro@kernel.org>
 <33b13789-33d6-a22f-82c9-4c5691d0737d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33b13789-33d6-a22f-82c9-4c5691d0737d@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 28, 2022 at 05:57:01PM -0400, Krzysztof Kozlowski wrote:
> On 28/10/2022 09:35, Johan Hovold wrote:
> > The current QMP PCIe PHY bindings are based on the original MSM8996
> > binding which provided multiple PHYs per IP block and these in turn were
> > described by child nodes.
> > 
> > Later QMP PCIe PHY blocks only provide a single PHY and the remnant
> > child node does not really reflect the hardware.
> > 
> > The original MSM8996 binding also ended up describing the individual
> > register blocks as belonging to either the wrapper node or the PHY child
> > nodes.
> > 
> > This is an unnecessary level of detail which has lead to problems when
> > later IP blocks using different register layouts have been forced to fit
> > the original mould rather than updating the binding. The bindings are
> > arguable also incomplete as they only the describe register blocks used
> > by the current Linux drivers (e.g. does not include the per lane PCS
> > registers).
> > 
> > In preparation for adding new bindings for SC8280XP which further
> > bindings can be based on, rename the current schema file after IPQ8074,
> > which was the first SoC added to the bindings after MSM8996 (which has
> > already been split out), and add a reference to the SC8280XP bindings.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> 
> Also missing cc devicetree list.

Yes, I know, but as I mentioned in my reply to Rob on the QMP USB
series, I do not intend to repost this series unless someone insists as
there were no binding-related changes in v4 (or v3).

Johan
