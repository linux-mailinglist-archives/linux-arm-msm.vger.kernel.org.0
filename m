Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0406033451
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 17:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbfFCP4S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 11:56:18 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54350 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728659AbfFCP4S (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 11:56:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B5F15AB;
        Mon,  3 Jun 2019 08:56:17 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4A0C3F246;
        Mon,  3 Jun 2019 08:56:15 -0700 (PDT)
Date:   Mon, 3 Jun 2019 16:56:13 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC/PATCH 4/5] arm64: Add support for arch_memremap_ro()
Message-ID: <20190603155612.GC63283@arrakis.emea.arm.com>
References: <20190517164746.110786-1-swboyd@chromium.org>
 <20190517164746.110786-5-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517164746.110786-5-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 17, 2019 at 09:47:45AM -0700, Stephen Boyd wrote:
> Pass in PAGE_KERNEL_RO to the underlying IO mapping mechanism to get a
> read-only mapping for the MEMREMAP_RO type of memory mappings that
> memremap() supports.
> 
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Not sure what the plans are with this series but if you need an ack for
arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
