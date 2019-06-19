Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6AE64B45B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 10:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731372AbfFSItG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 04:49:06 -0400
Received: from foss.arm.com ([217.140.110.172]:56290 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730418AbfFSItF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 04:49:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D821CFC;
        Wed, 19 Jun 2019 01:49:05 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EFD43F246;
        Wed, 19 Jun 2019 01:49:04 -0700 (PDT)
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     stephan@gerhold.net, agross@kernel.org, david.brown@linaro.org,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190618202623.GA53651@gerhold.net>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
Date:   Wed, 19 Jun 2019 09:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618202623.GA53651@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On 18/06/2019 21:26, Stephan Gerhold wrote:
> Hi,
> 
> I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> It works surprisingly well, but the coresight devices seem to cause the
> following crash shortly after userspace starts:
> 
>      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP

...


> 
> In this case I'm using a simple device tree similar to apq8016-sbc,
> but it also happens using something as simple as msm8916-mtp.dts
> on this particular device.
>    (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> 
> I can avoid the crash and boot without any further problems by disabling
> every coresight device defined in msm8916.dtsi, e.g.:
> 
> 	tpiu@820000 { status = "disabled"; };

...

> 
> I don't have any use for coresight at the moment,
> but it seems somewhat odd to put this in the device specific dts.
> 
> Any idea what could be causing this crash?

This is mostly due to the missing power domain support. The CoreSight
components are usually in a debug power domain. So unless that is turned on,
(either by specifying proper power domain ids for power management protocol
supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
keep the debug power domain turned on , this works on Juno -).

> I'm not sure if this is a device-specific issue or possibly some kind of
> configuration problem.
>    Or is this feature only working on development boards?

Cheers
Suzuki
