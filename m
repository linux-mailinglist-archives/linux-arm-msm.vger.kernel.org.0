Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 802D3ED27D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2019 09:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfKCINT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Nov 2019 03:13:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:44980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbfKCINT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Nov 2019 03:13:19 -0500
Received: from localhost (unknown [106.206.31.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BB6D2084D;
        Sun,  3 Nov 2019 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572768798;
        bh=O6Sl/WudcHVmvZ80SOwx1ethvyuH+iLA+GM2fSi1sgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lF3rTgqQIDJOKT6EJtQc5fSgYoCY9pcDJe4Yvnr+FYdtchoUmabp904LiWUE7zHPN
         wZP6mmlwNsnSLUf6xUCyjs8iNqFk62PLkieN84qmkYYs6x6oo3cJBEGFr3WpvUSQ/T
         apkjijqjwn05w9gKPLjKYiGhXC7iqE91WYVxNAm0=
Date:   Sun, 3 Nov 2019 13:43:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: dts: qcom: msm8996: Introduce IFC6640
Message-ID: <20191103081311.GM2695@vkoul-mobl.Dlink>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-10-19, 22:13, Bjorn Andersson wrote:
> Refactor msm8996 and db820c in order to make it follow the structure of newer
> platforms, move db820c specific things to db820c.dtsi and then introduce the
> Informace 6640 Single Board Computer.

This has patch 9/11 missing. But rest look good to me.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
