Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B25A9E29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 11:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732392AbfIEJVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 05:21:13 -0400
Received: from foss.arm.com ([217.140.110.172]:40142 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731012AbfIEJVN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 05:21:13 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B590B1576;
        Thu,  5 Sep 2019 02:21:12 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DD4B3F67D;
        Thu,  5 Sep 2019 02:21:11 -0700 (PDT)
Date:   Thu, 5 Sep 2019 10:21:05 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190905092105.GA28839@bogus>
References: <20190904121606.17474-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904121606.17474-1-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 04, 2019 at 01:16:06PM +0100, Lee Jones wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
>
> Supported by this patch is: keyboard, battery monitoring, UFS storage,
> USB host and Bluetooth.
>

FWIW :),

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
