Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6061B582C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 11:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgDWJ3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 05:29:00 -0400
Received: from foss.arm.com ([217.140.110.172]:35766 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgDWJ3A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 05:29:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 011BA31B;
        Thu, 23 Apr 2020 02:29:00 -0700 (PDT)
Received: from [10.57.33.170] (unknown [10.57.33.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E633F73D;
        Thu, 23 Apr 2020 02:28:58 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        LKML <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
 <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
 <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
 <890456524e2df548ba5d44752513a62c@codeaurora.org>
 <20200331074400.GB25612@willie-the-truck>
 <1bf04938249bcd5b2111c1921facfd25@codeaurora.org>
 <CAD=FV=VBM6cS1UmWTUJ2vrt0a2zn7xV3C53tpthBx58M2=1JPg@mail.gmail.com>
 <6c82e688f335b9c07b0f52987244664b@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <006edb3b-8834-41fe-d9d1-fe873edfca99@arm.com>
Date:   Thu, 23 Apr 2020 10:28:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6c82e688f335b9c07b0f52987244664b@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-23 9:17 am, Sai Prakash Ranjan wrote:
[...]
>> Any update on the status here?  If I'm reading the conversation above,
>> Robin said: "we'll *always* see the warning because there's no way to
>> tear down the default DMA domains, and even if all devices *have* been
>> nicely quiesced there's no way to tell".  Did I understand that
>> properly?  If so, it seems like it's fully expected to see this
>> message on every reboot and it doesn't necessarily signify anything
>> bad.
>>
> 
> Understanding is the same, waiting for Will and Robin to check if its OK
> to make the message more friendly.

The way I see it, we essentially just want *something* visible that will 
correlate with any misbehaviour that *might* result from turning off a 
possibly-live context. How about simply "disabling translation", at 
dev_warn or dev_info level?

Robin.
