Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37D2260983
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 06:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgIHE0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 00:26:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgIHE0d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 00:26:33 -0400
Received: from localhost (unknown [122.182.239.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D537D21532;
        Tue,  8 Sep 2020 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599539192;
        bh=CJ6HscSjdMRTk0mmdMvvzqY/BsVYK5YNZEfkv85bDtg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rweWXphm0+FYsHubtLDXVBOwTvFith3tciW0aemjbSoEhxXmeEtQq+7QHAobV2/SP
         7TXHX/59R+a08eC9pmvrDugcbM99Ovhqk/vk/6FrjbyBLvpOrk5EclsJS9kG41QFgP
         M9expCjqFci79jPxMDeNX806hwlYts401UaZ+57w=
Date:   Tue, 8 Sep 2020 09:56:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Bharat Gooty <bharat.gooty@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/6] phy: phy-bcm-ns-usb3: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200908042624.GA77521@vkoul-mobl>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-08-20, 10:03, Chunfeng Yun wrote:
> Use readl_poll_timeout_atomic() to simplify code

Applied all, thanks

-- 
~Vinod
