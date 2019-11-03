Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AED6ED27F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2019 09:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfKCIOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Nov 2019 03:14:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:45344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbfKCIOk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Nov 2019 03:14:40 -0500
Received: from localhost (unknown [106.206.31.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A01462084D;
        Sun,  3 Nov 2019 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572768879;
        bh=WrEkas478AEsFfd0KnxML8A5xD0UqXNqQLN5Vnc5KU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbzuH9wvkLuKPbkNjmQVDX+bCQHXPkKnzDNvJLUefqmFXcDSVG4+gt/a4+SWLOoRR
         2Jq5++7/744mtTsA8VB3eDt++oKxNLgio/vO9W4jrstDWEOiD/ErlzM36JRaCm2anz
         gBriK4MRTdfgQgxYYqwZ7+dKv1HwTB5tsBBPs0po=
Date:   Sun, 3 Nov 2019 13:44:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: db845c: Enable LVS 1 and 2
Message-ID: <20191103081434.GN2695@vkoul-mobl.Dlink>
References: <20191002041654.3620-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002041654.3620-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-10-19, 21:16, Bjorn Andersson wrote:
> vreg_lvs1a_1p8 and vreg_lvs2a_1p8 are both feeding pins in the low speed
> connectors and should as such alway be on, so enable them.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
