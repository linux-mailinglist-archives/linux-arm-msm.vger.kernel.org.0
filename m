Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 039F9138E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 11:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgAMKLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 05:11:10 -0500
Received: from foss.arm.com ([217.140.110.172]:36914 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgAMKLJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 05:11:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E3FD13D5;
        Mon, 13 Jan 2020 02:11:09 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFE793F534;
        Mon, 13 Jan 2020 02:11:07 -0800 (PST)
Date:   Mon, 13 Jan 2020 10:11:05 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        tsoni@codeaurora.org, Sudeep Holla <sudeep.holla@arm.com>,
        psodagud@codeaurora.org, linux-arm-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] ARM PSCI: Add support for vendor-specific SYSTEM_RESET2
Message-ID: <20200113101105.GD52694@bogus>
References: <1578684552-15953-1-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578684552-15953-1-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 10, 2020 at 11:29:11AM -0800, Elliot Berman wrote:
> This patch adds support for vendor-specific SYSTEM_RESET2 to support
> Qualcomm target use cases of rebooting into a RAM dump download mode. I'm
> working on the client driver to use the proposed psci_system_reset2()
> function but wanted to get this RFC going for PSCI driver changes.
>

Please post along with the client driver to understand the context better.
It saves time trying to understand when reviewing and also avoid asking
lots of questions which the client driver might answer :)

--
Regards,
Sudeep
