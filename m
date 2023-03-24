Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E33D6C84FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 19:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCXSb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 14:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjCXSb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 14:31:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF5B7DB2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 11:31:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08CB862C3B
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 18:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C89C433EF;
        Fri, 24 Mar 2023 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679682685;
        bh=TFjg+DNQO5c38HcRlQ4aWqEqXHm2Gz7iRsKx+zLvq/8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FPgljeIBOE1D9y5w3k9XTpWTG2Ez2M/brI3kv64TRCsnT++SNw5KKxLk4l4v9ypsP
         Pdut6YzGPYTh4425rkGkzdeV0tK+tcPkXrxQugXhCy09+SfwngOZu+dRww3EjjdPn7
         Bl6ByWcdW1kXFZR7+fZc9UReIjrvestlzNFwHVfReWbq9oq7aRZEy0+o/NF2lZxcwh
         eRdQnb01dEJTlcd5jI4bB7CSBHwQbfDBltgyQg4onG2hHrMZlpXIXLkcPx5HKzMpzQ
         7Pg59eaTARkctD+tdn37mhVa3tEnC8ZY1Te+EDDWI4jFSyRaEf+WhqS5o6cjdfbypS
         cSQI3V1ukR9jg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
Date:   Fri, 24 Mar 2023 11:34:25 -0700
Message-Id: <167968287204.2233401.17311720114144315970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324021651.1799969-1-dmitry.baryshkov@linaro.org>
References: <20230324021651.1799969-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 05:16:50 +0300, Dmitry Baryshkov wrote:
> Correct PCIe PHY enablement to refer the QMP device nodes rather than
> PHY device nodes. QMP nodes have 'status = "disabled"' property in the
> ipq8074.dtsi, while PHY nodes do not correspond to the actual device and
> do not have the status property.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
      commit: 72630ba422b70ea0874fc90d526353cf71c72488
[2/2] arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node
      commit: 1dc40551f206d20b7e46ea7dd538dcdd928451c6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
