Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3D98618D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 14:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732210AbfHHMXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 08:23:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:40884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbfHHMXw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 08:23:52 -0400
Received: from localhost (unknown [122.178.245.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C6ED2171F;
        Thu,  8 Aug 2019 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565267031;
        bh=pYsFBGP3kI4gJG4u1PJaSdrgvkRbRuJZQ/c/jwcwI2U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RsxOLcsIRag7X9lY56IOqRlZ2V0Q6//0+WaDnwb3m3jeBSAOe3St/5HIHi2dRwaS5
         y4Nd5WpZZE48ICQUYPDHqfaBHWUchP8OdyFBSoBHTiMCWa34ue6zE7Ni4imZ6qDJeh
         P8TsU1q2UPpRS6qdup4haXscQXlhUkK4IWSc3Gdo=
Date:   Thu, 8 Aug 2019 17:52:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Sinan Kaya <okaya@kernel.org>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/24] dmaengine: qcom_hidma: Remove call to memset
 after dmam_alloc_coherent
Message-ID: <20190808122240.GQ12733@vkoul-mobl.Dlink>
References: <20190715031723.6375-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190715031723.6375-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-07-19, 11:17, Fuqian Huang wrote:
> In commit 518a2f1925c3
> ("dma-mapping: zero memory returned from dma_alloc_*"),
> dma_alloc_coherent has already zeroed the memory.
> So memset is not needed.

Applied, thanks

-- 
~Vinod
