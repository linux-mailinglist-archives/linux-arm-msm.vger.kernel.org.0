Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6A06C44A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 09:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjCVILL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 04:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjCVILK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 04:11:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B2D50983;
        Wed, 22 Mar 2023 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679472669; x=1711008669;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=spovA4JXKaZ5IUF6+66tTlvo4jyXkdm34KKyQgnokfU=;
  b=FDyCKMye4A8S/B7ZBsXBGnfEXvAw2yKviJe7++ocKdl0wOJWEl+1oQjm
   qk1kUJv0OGnOPkzhYlMDkbzquHy8CAqgPjWynxaOllADH0NwyI+o/eDTZ
   5LwOw8Xt/GKAnliybXU38n7nb/aeB5PnxvAquzA5H0s40nfM5kMt4/jtf
   sl/Z8/NzVuuJqf/JtFBHxYTrBUF4WuOi3wL0MxEhNe8vZCLLZ2ddq/SxO
   aXOAeWcPMKdyUwScQK4VmilsGX+p+GoYbXndT24fNC2uGRQi/ETT40iWq
   ysbiiYWoRl4bgIF+xmQ+jJNSAoX5DL+DlUibDB9R5IKiZVYipjezxfXpr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339193955"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="339193955"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792444122"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="792444122"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.146.128]) ([10.249.146.128])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:11:06 -0700
Message-ID: <d79799c4-6ed3-c7ec-8061-3e5a6bf42d43@linux.intel.com>
Date:   Wed, 22 Mar 2023 09:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 6/8] accel/qaic: Add mhi_qaic_cntl
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        stanislaw.gruszka@linux.intel.com
Cc:     dafna@fastmail.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
 <8571460d-17eb-bc76-6d07-58bd036ff0d0@quicinc.com>
From:   Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8571460d-17eb-bc76-6d07-58bd036ff0d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Hi,

On 20.03.2023 20:06, Jeffrey Hugo wrote:
> On 3/20/2023 9:11 AM, Jeffrey Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> Some of the MHI channels for an AIC100 device need to be routed to
>> userspace so that userspace can communicate directly with QSM. The MHI
>> bus does not support this, and while the WWAN subsystem does (for the same
>> reasons), AIC100 is not a WWAN device. Also, MHI is not something that
>> other accelerators are expected to share, thus an accel subsystem function
>> that meets this usecase is unlikely.
>>
>> Create a QAIC specific MHI userspace shim that exposes these channels.
>>
>> Start with QAIC_SAHARA which is required to boot AIC100 and is consumed by
>> the kickstart application as documented in aic100.rst
>>
>> Each AIC100 instance (currently, up to 16) in a system will create a
>> chardev for QAIC_SAHARA. This chardev will be found as
>> /dev/<mhi instance>_QAIC_SAHARA
>> For example - /dev/mhi0_QAIC_SAHARA
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> ---
>>   drivers/accel/qaic/mhi_qaic_ctrl.c | 571 +++++++++++++++++++++++++++++++++++++
>>   drivers/accel/qaic/mhi_qaic_ctrl.h |  12 +
>>   2 files changed, 583 insertions(+)
>>   create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
>>   create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
>>
>> diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qaic_ctrl.c
>> new file mode 100644
>> index 0000000..a46ba1d
>> --- /dev/null
>> +++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
>> @@ -0,0 +1,571 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/poll.h>
>> +#include <linux/version.h>
> 
> Will remove this.
> 
> Jacek, I think I've got all of your comments addressed.  Do you see anything more?  I'm hopeful that we are just looking at one more spin.

Yeah, I don't have any additional comments.
The whole patchset looks OK to me :)

Regards,
Jacek


