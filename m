Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B07E158DD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 12:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgBKL7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 06:59:10 -0500
Received: from foss.arm.com ([217.140.110.172]:44626 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727669AbgBKL7K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 06:59:10 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF5131FB;
        Tue, 11 Feb 2020 03:59:09 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC8A93F6CF;
        Tue, 11 Feb 2020 03:59:07 -0800 (PST)
Date:   Tue, 11 Feb 2020 11:59:03 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v9 11/15] dt-bindings: arm: Juno platform - add CTI
 entries to device tree.
Message-ID: <20200211115852.GA52147@bogus>
References: <20200210213924.20037-1-mike.leach@linaro.org>
 <20200210213924.20037-12-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210213924.20037-12-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 10, 2020 at 09:39:20PM +0000, Mike Leach wrote:
> Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
>

I can take this patch alone unless you have plans to take all in go.

--
Regards,
Sudeep
