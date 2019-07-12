Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2606668D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 07:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfGLFnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 01:43:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57374 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfGLFnO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 01:43:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5889161A39; Fri, 12 Jul 2019 05:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562910193;
        bh=57FRoDnPgF2Gptdw1eq5YXeVzkmqVGTPoPzhvSkzZ24=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=cTzWK45HcEnK+Y6j/4vcYISsa2gDo/wFMJYcB1Wmnan9SGeyjh26Xbesh3tweo9W0
         +6FtVJmDf4BI6UuyCdA0esuC6LCGdCwzhL4yFiAAvPHcb+eyWxfVtgtAbqsDhekgQC
         bN2jZWG5KISGasKnhsJEb4y0XA2jxWkFRqJzKmoU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id D4354611D1;
        Fri, 12 Jul 2019 05:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562910192;
        bh=57FRoDnPgF2Gptdw1eq5YXeVzkmqVGTPoPzhvSkzZ24=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=oI1sDIYEuHUtpf2+47xOh2KHE2cnmMj2k1N7azN3mS/ynGVrJk02TMAg7s77X0qXO
         MySzmkN+ZH5MxXHpmyoFyp0CeOOIP223cZX5m3FX/9/UiBQJbCBSUYU+IMvG1I29ee
         KWuCmmSDH/1Syv886VgTw2L1Jy/H810zYKgMmqsQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 12 Jul 2019 11:13:12 +0530
From:   gokulsri@codeaurora.org
To:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org,
        sjaganat@codeaurora.org, nprakash@codeaurora.org
Subject: Re: [PATCH 00/12] remoteproc: qcom: q6v5-wcss: Add support for secure
 pil
In-Reply-To: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
Message-ID: <ca9223caff73548cccadd64ff8bffb2e@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2019-07-11 21:10, Gokul Sriram Palanisamy wrote:
> IPQ8074 needs support for secure pil as well.
> Also, currently only unified firmware is supported.
> IPQ8074 supports split firmware for q6 and m3, so
> adding support for that.
> 
> Gokul Sriram Palanisamy (12):
>   remoteproc: qcom: Add PRNG proxy clock
>   remoteproc: qcom: Add secure PIL support
>   remoteproc: qcom: Add support for split q6 + m3 wlan firmware
>   remoteproc: qcom: Add ssr subdevice identifier
>   remoteproc: qcom: Update regmap offsets for halt register
>   dt-bindings: clock: qcom: Add reset for WCSSAON
>   clk: qcom: Add WCSSAON reset
>   dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
>   mailbox: qcom: Add support for IPQ8074 APCS
>   dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
>   arm64: dts: Add support for scm on IPQ8074 SoCs
>   arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
> 

  Also, this series is based on Govind’s,
  “[v4] Add non PAS wcss Q6 support for QCS404”
  https://www.spinics.net/lists/linux-remoteproc/msg03612.html

Regards,
  Gokul


>  .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   1 +
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 131 
> +++++++++++++++++
>  drivers/clk/qcom/gcc-ipq8074.c                     |   1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss.c                | 158 
> +++++++++++++++++----
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
>  7 files changed, 264 insertions(+), 30 deletions(-)
