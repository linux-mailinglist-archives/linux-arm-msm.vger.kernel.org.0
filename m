Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B354421FA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 09:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhJEHu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 03:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232591AbhJEHuz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 03:50:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5649610FC;
        Tue,  5 Oct 2021 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633420145;
        bh=tFJL+0DpCWgSGCfmXxt3TK8h/kbuntvLMc+Ww+vUnNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fkZAJVb2fFMTw22pJ/zm+L7TVhjP82c41AW7Cu4/vdoeQpdJn4iDqfnTqlhvq32w9
         ojmUDms7Nsr9cptLXcUHfXaHQmGwJ9OgyY5MDGTez7iDriBBFi5nmVsRK31AJNJt7L
         6SUplVJnmtE59eyfILADp9YYFIEJimasV/Ce38tcldygucQRZV++gL5W3ucPPSlu7K
         bYJgeKIPE4HvLxzomKNkMYrA+xD8E4d7/q6I4AWZVfqjOy1drsBp3c3ciIEHRjxzV8
         BurrTUrFlzU3dRwQ0iGIBVptr5JaUYR4MaIuyQNYVQpVpCIernid8hbbx92ZN6X8Zu
         Jv56sCqo+Hjzg==
Date:   Tue, 5 Oct 2021 13:19:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add missing vdd-supply for
 QUSB2 PHY
Message-ID: <YVwDbUC5WUHmcRJh@matsya>
References: <20210928022002.26286-1-shawn.guo@linaro.org>
 <20210928022002.26286-4-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928022002.26286-4-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-09-21, 10:20, Shawn Guo wrote:
> QUSB2 PHY requires vdd-supply for digital circuit operation.  Add it for
> platforms that miss it.


Acked-By: Vinod Koul <vkoul@kernel.org>

Bjorn, I have picked 1,2 feel free to pick this

-- 
~Vinod
