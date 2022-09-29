Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507795EEDF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 08:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbiI2GeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 02:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiI2GeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 02:34:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1A412ED9B;
        Wed, 28 Sep 2022 23:34:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 31A6662041;
        Thu, 29 Sep 2022 06:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED7DC433C1;
        Thu, 29 Sep 2022 06:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664433260;
        bh=mu7vRoO6SzmbL/soMLhDD9mCEk8ILRG8lG5/UO2mERQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TZgR9M3DjLv9V9AUyqwCiNlomiC3X/0+AckUtSuHAb3vIvcNd2dRh+oXmaHWYPOWV
         QrX1M+Lolm18rHrY+ejl4kiiEevgxjxQ8+8X8GswHxeThIH76nsqziuGYR42WJHjMS
         g2C0q07d8dWlCzM/9+T0ovUHIqGC+uyI/HY9DcIpIusKfyapEBMeRSPfsXj74Lyzhh
         hli24grWjMuKLNfJYyoRnIv2KSAS23FfHzMNStS4AhergAS00Qsf6nttPdj+KNRj4S
         +g7ygJjJzCwGkElbrVIyDLsn4xoQgC5z/GpB9UZ6q97HUELOE/YshFWFmGbwcmW6IK
         rQVzv29cxwvRg==
Date:   Thu, 29 Sep 2022 12:04:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,qusb2: document sdm670
 compatible
Message-ID: <YzU8aOvTIYmLAoZQ@matsya>
References: <20220922024656.178529-1-mailingradian@gmail.com>
 <20220922024656.178529-2-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922024656.178529-2-mailingradian@gmail.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-09-22, 22:46, Richard Acayan wrote:
> The Snapdragon 670 uses the QUSB driver for USB 2.0. Document the
> compatible used in the device tree.

Applied, thanks

-- 
~Vinod
