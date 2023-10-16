Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40DC7CADC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 17:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbjJPPkK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 11:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbjJPPkJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 11:40:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DF9D9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 08:40:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEBAC433C9;
        Mon, 16 Oct 2023 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697470808;
        bh=x6oRhyvnMXidDUSwxZNupzsLuIKRsX2HDyNAn1+O64I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kXBxWqD4scC//5xFA/IbPLVe2hmBXfo/NuwPIiTN4Opt2RlGCYkMMH2UzKrvWrASn
         EUagcH0hn8LcKPU5yzPgYcRjYlqahu+21++XIRYHjDU/UWV0cs1dhBfPjWlbuJB+Xg
         EhtnShMNLxxQpT01801ABqnmKZ7izPuM1/ZoShWhR7KqDF4JeuKsbe0nTbF8Gs49y3
         guav1fURR8Bzn2SJv+yUH/3X4FDUu7gH6IAiJgjkphGD76kv8OKOzVyrHaV6GxG1R0
         Sjq5ncTm2umWjuG10RDeNLfC3fDEbia1yFGfIrMknth4yD7AKNBwmEpssbW5GR2c0j
         5OsP0roHy64EQ==
Date:   Mon, 16 Oct 2023 08:43:55 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845-mtp: switch to mbn
 firmware
Message-ID: <af4fx3u6c3znawelenzwtm2cter7cpdis34q64ug3cqzina774@jhqj6o3ectv3>
References: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
 <20230826221915.846937-4-dmitry.baryshkov@linaro.org>
 <a12eee9b-e159-4e1b-b812-60cdf93c1b41@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a12eee9b-e159-4e1b-b812-60cdf93c1b41@app.fastmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 16, 2023 at 03:39:01PM +0200, Arnd Bergmann wrote:
> On Sun, Aug 27, 2023, at 00:19, Dmitry Baryshkov wrote:
> > We have switched most of devices to use mbn (squashed) firmware files
> > instead of spit mdt+bNN. Even this DT uses modem.mbn and a630_zap.mbn.
> > Let's switch adsp and cdsp firmware files to use .mbn format too.
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I saw this pop up in the dts pull request today, and this needs
> some more clarification I think: Why does the dts have to know
> about which format the files are in? I would expect that to be
> handled by the driver internally.
> 
> From what I can tell, either the two files are compatible,
> and the driver can just try both names by manipulating that
> string, or the two are incompatible and changing the firmware
> name would also mean that the dts node and driver would
> have to be aware of the difference.
> 

The implementation does not care about the file name, it will detect
which of the two formats is being provided and load the content
accordingly.

So what this patch does is to align the firmware file name to match what
we have in linux-firmware, and what the few of us booting this device
have hacked around in /lib/firmware for (quite) a while now.

Regards,
Bjorn
