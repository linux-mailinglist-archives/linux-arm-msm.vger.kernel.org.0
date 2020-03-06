Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5794917B666
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 06:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCFFdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 00:33:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:56366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgCFFdf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 00:33:35 -0500
Received: from localhost (unknown [122.178.250.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35F502072D;
        Fri,  6 Mar 2020 05:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583472815;
        bh=dYKokNmp/7q2bZFJoob20zCquqvHPAErBin5RxqrsCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LpRCdcLDjI1xnCxFEw7e8PbKsmhENGfJKVjx/E9Gggvri4Jy1K5+OQgUXm/fG3UL6
         D6knfSrbQO+vKcnDFrD8XaSa8rk8yZ16wEwWL+7TEiaDJ8mwLEF/DohCCD0RjCiqyZ
         AocqcftUSgMiZghn0CPGFfr9ro/UNjkH6b7wujXY=
Date:   Fri, 6 Mar 2020 11:03:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: msm8996: Use generic QMP driver for
 UFS
Message-ID: <20200306053329.GD4148@vkoul-mobl>
References: <20200125001234.435384-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125001234.435384-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-01-20, 16:12, Bjorn Andersson wrote:
> With support for the MSM8996 UFS PHY added to the common QMP driver,
> migrate the DTS to use the common QMP binding.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
