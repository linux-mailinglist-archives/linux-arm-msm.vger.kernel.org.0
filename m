Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4814511D73A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 20:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbfLLThb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 14:37:31 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38382 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730593AbfLLTha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 14:37:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so3596321ljh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 11:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dvGJ0797Qz8DUFLYM8Rit14ij9aZ1vENIS91EYjNpec=;
        b=MThukkqGbJH0JqQq7NvRMwiKjEvckHmmxf4wk/k+CyqysQALPXBquylwgn1+SkKOux
         hYds4XHtiXiqnLjBZTCZHVaMufoABT/oCOU20kwUAus7U+22gMzRkYcbyaBccoa7KyYv
         12+iTzwdpt/manm3sKQDH7pyNVNLBK7zrgfczpEB0qxEGoyOp2RO1/x10LHuQJ2M7UF8
         xwcczLh07pEx03HMT6hiKGSuIJDAsez0N1uPaJIkQaw89JkglxUV7L09rhWo2MmtWhMp
         GIqxgm0dT3TxGD4WfuTEc14eHGp2Q5ogVIoDDyp9Pxly8HOvzkn+Q7nAi1hlWOskTmam
         XFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dvGJ0797Qz8DUFLYM8Rit14ij9aZ1vENIS91EYjNpec=;
        b=LfI83n8VDKjf42WlqG2OcaW2MwKEnOTgkKJ4asT0Y05Csh7ruqJQRFJmftIlwm/zSN
         OgZS/nza0zHSPyvshALMfXHvSFcJHFd5SX3U6EAzEOtpYXO9hkRJgF++QNWE3s4m9uSV
         LvwmbNHa17SrWh0bbcLALCi3FWZzzqvAtzrREnLWVHV70TLyZVR9f3Q6JaZNdEe8F/rR
         gxgi6OE0YcXz+2EYBF1+0wxITRyhQL6BJGcgcVxUPFImoC7WxCyFhWN0Kd8XJJA+M0a/
         0guLvU9KXkOtEakv+W3QK2Frya/iYLY265Ahk6y0gaokze5rTrAZv8Xz0SSgEUrVdFoR
         tbNg==
X-Gm-Message-State: APjAAAVjf5QdHS3vcRd2H5TygTrwVvguvaEb9eHv3a53VP2Jkn/B0GER
        HKeNwDiY5hkvKXpn/yz2fEeNbbBd1CAmhPKAXHDsOg==
X-Google-Smtp-Source: APXvYqz4Z1nagdLRuefbsVS4snEWX7fyZkbq/3ND7xotrEE30d//QZNUnTbwcm2mnmu/6tLOV8m1Zcho9bqz56n4Swo=
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr7189882ljk.186.1576179448269;
 Thu, 12 Dec 2019 11:37:28 -0800 (PST)
MIME-Version: 1.0
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
 <1563568344-1274-3-git-send-email-daidavid1@codeaurora.org>
 <20190721191305.GI7234@tuxbook-pro> <0ecba781-ad08-0f09-f4a8-83473569a4c5@codeaurora.org>
In-Reply-To: <0ecba781-ad08-0f09-f4a8-83473569a4c5@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Thu, 12 Dec 2019 11:36:52 -0800
Message-ID: <CAE=gft57S_2yKQdP6x=R9nVUaHWvreS-ENKkKrKmOzhJYLpzEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sdm845: Redefine interconnect provider DT nodes
To:     David Dai <daidavid1@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 23, 2019 at 11:24 AM David Dai <daidavid1@codeaurora.org> wrote:
>
> Thanks for looking over this, Bjorn.
>
> On 7/21/2019 12:13 PM, Bjorn Andersson wrote:
> > On Fri 19 Jul 13:32 PDT 2019, David Dai wrote:
> >
> >> Add the DT nodes for each of the Network-On-Chip interconnect
> >> buses found on SDM845 based platform and redefine the rsc_hlos
> >> child node as a bcm-voter device to better represent the hardware.
> >>
> >> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 61 ++++++++++++++++++++++++++++++++++--
> >>   1 file changed, 58 insertions(+), 3 deletions(-)
> >>

What happened to this series? Is it abandoned?
-Evan
