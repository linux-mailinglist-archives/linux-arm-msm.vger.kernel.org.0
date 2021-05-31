Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D639F3956CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 10:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhEaIWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 04:22:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:45220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhEaIWi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 04:22:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8292610C9;
        Mon, 31 May 2021 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622449258;
        bh=vmUYIKjdjo41zxqujXvd+GFZFYx6lGao8+TVeZyaifM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Csd/qFZwR19rLihTqVQpvB8jY3zmR6QqcwHIcGFZmNFEV9FmgVD1NcdGx87JpdQZJ
         EAt/wJhqUwVk4QxAPeiTkedBfLZLEaIFWrhN2SvWGbFduVujW7TLNZqkw4OTdSYrj4
         bxEUfCElwoJ8qsEPUQWndpiXWKKLweQVkfWiuTWR4tezJAly9YiNZDG8Er6LcylwNk
         XPScmbtMWwg5GkHtsZIb+49y5pR/Ev1NM5Nb0OK6Qw6rcNioLsGTXbEZuzRLdYzYq8
         paI7dkV1S8Llm+b2F/JnnCH11+x+Z2Vy3s7MPceXXd0vZutiYZluCoA6XPm7580wzf
         Du2M8S2WSfc/g==
Date:   Mon, 31 May 2021 13:50:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] phy: qcom-qmp: remove redundant error of clock bulk
Message-ID: <YLScZ07aLTBMVwK8@vkoul-mobl.Dlink>
References: <1621229841-22984-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621229841-22984-1-git-send-email-chunfeng.yun@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-05-21, 13:37, Chunfeng Yun wrote:
> There is error log in clk_bulk_prepare/enable()
> 

Applied, thanks

-- 
~Vinod
