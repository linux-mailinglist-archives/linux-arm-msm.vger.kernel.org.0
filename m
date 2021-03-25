Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07F0348A0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 08:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCYHXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 03:23:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhCYHW4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 03:22:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D2FE61A1A;
        Thu, 25 Mar 2021 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616656975;
        bh=nK8MnAmL5EIPeEqp4C8KpZ4a4cMEn3TYA9VUz9Xei64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZsQoWg1WHzr5qSK/PSwwC8eqs3qSIDvZwAqShqcm7ZEtpZh6P+iQ31onAk/FQ2QRi
         Sb0SFEw/lH4KunxoMFo/bC2z75oAUGcKZO2bRTFk2yT2XAiQ95BAbnvahSF6Zz7mQA
         CzO/6SjioExJ9799Gdfi4LH/PqsQWx24OAuhZC7NCuST/JAbXsBeCaepE83fh9lNo1
         ki7cCnMRZ49Q3a4pAjQbHZ5TZFWTOh5eUOzoNKC49GOpHIb2X4Hnb/4hpFL+FrQW5V
         hvFkdWaxyHeA9MwkXLzD+foOzsdXNTcHA9byd1ICeqrhUfEBPhcv/gxwP8GoE3dODW
         dLJWZLh4TAR8Q==
Date:   Thu, 25 Mar 2021 12:52:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for SC7280
Message-ID: <YFw6TK+o0r3XdNcj@vkoul-mobl.Dlink>
References: <1615978901-4202-1-git-send-email-sanm@codeaurora.org>
 <1615978901-4202-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615978901-4202-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-03-21, 16:31, Sandeep Maheswaram wrote:
> Add the compatible string for sc7280 SoC from Qualcomm

Applied, thanks

-- 
~Vinod
