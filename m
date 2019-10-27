Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4625FE6073
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 06:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfJ0FJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 01:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfJ0FJO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 01:09:14 -0400
Received: from localhost (mobile-166-176-122-39.mycingular.net [166.176.122.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 346462070B;
        Sun, 27 Oct 2019 05:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572152953;
        bh=YR2Sm+hvHq7MESkHGm20xfXadb/2Kg+0rffw5uIclpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yVYxJNe7tRljYEhUkyyWBRCA8dGEXOhXN9HodgetLzqQ9FQA/UbZvdjI9NOKsL00/
         J/qXsYnimaauYCzU5tHN7K48PCDpOItlayKYoMH4OVNERJiQa4t0mS4ccaXQSPAydP
         f23J7M8u+YYiF1S5+/ws2ZIuVfaQd9gjBJYcgtV8=
Date:   Sun, 27 Oct 2019 00:09:11 -0500
From:   Andy Gross <agross@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 11/15] arm64: dts: qcs404: thermal: Add interrupt
 support
Message-ID: <20191027050911.GC5514@hector.lan>
Mail-Followup-To: Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        devicetree@vger.kernel.org
References: <cover.1571652874.git.amit.kucheria@linaro.org>
 <63d6b0b8bba0d217c2f7bb4240c587ead933b6be.1571652874.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63d6b0b8bba0d217c2f7bb4240c587ead933b6be.1571652874.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 04:05:30PM +0530, Amit Kucheria wrote:
> Register upper-lower interrupt for the tsens controller.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Applied for 5.5.

Andy
