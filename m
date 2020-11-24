Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224CE2C2B28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389653AbgKXPWi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:22:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:37220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389084AbgKXPWi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:22:38 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A29F520738;
        Tue, 24 Nov 2020 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606231357;
        bh=oI38rf5nzSzEV452YmmtssqBI4vWxBxpv6yHrmL9T9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xvf8EJ7uWi/zQQLIMd7vAjMweSgbnpjZdua2a+K+sxu5XF6O+EHM5pelSYOXHBiKQ
         HECT9Rw9dkXZ8m667yYp4xRN9zqWvjVGbIb+1gI3xvUZotRu+PW/ZiEngq+h1qesXS
         sVBWATfXPwGhPMfSiAcDPotjtW/w8cPYid+mgQIQ=
Date:   Tue, 24 Nov 2020 20:52:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8150: Add wifi node
Message-ID: <20201124152231.GM8403@vkoul-mobl>
References: <20201121055808.582401-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121055808.582401-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-11-20, 21:58, Bjorn Andersson wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add a node for the WCN3990 WiFi module.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
