Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBB26D7B3F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 13:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237836AbjDEL0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 07:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237749AbjDEL0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 07:26:50 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4994310CC;
        Wed,  5 Apr 2023 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680694009; x=1712230009;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rAdNmgT9ufOa3vrGGqYmkDwonVnOX8G6qLgSbIl7/3s=;
  b=Wzn6Hspw4f5h1pNz5OIGvw8xR3DQp+h8vV6XNlvaWi2wGV6h+vznffet
   20RDL3hCpZjpu407WhcJ6FrOKz5fyiZY8WIN/nyatRl9uty7cSYlX+aYO
   FxSw3jaVyQNH8ZPFCiEVClT9JB0IMs+sj6yakxcz5PFtGtSC76cI02F62
   XhG5KmGqMrie2KMwgFsdRxj8liHXUACg8JvN074s1Xl1HV2WYUCz0ndLv
   CnNTW2lG8ecMM+8j21wFBtJkjnpQQrUrunBOUWb4eU5TjzxE5k29HxahU
   cOprSVPSzuJDBe+EkfMxOv1yVMrqmJ7cNjWUjoYmPod/QoSNrv/O0/RMg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341152240"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="341152240"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="830330605"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="830330605"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.153.132]) ([10.249.153.132])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:26:45 -0700
Message-ID: <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
Date:   Wed, 5 Apr 2023 13:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 0/8] QAIC accel driver
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mani@kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
        bagasdotme@gmail.com
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
From:   Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 03.04.2023 19:22, Jeffrey Hugo wrote:
> On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
>> This series introduces a driver under the accel subsystem (QAIC -
>> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
>> a PCIe adapter card that hosts a dedicated machine learning inference
>> accelerator.
>>
>> The previous version (v4) can be found at:
>> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/
> 
> Looks like things have been silent on this revision and we have a number of review tags already.  Seems like this series is ready for merge.
> 
> I'd like to see this queued for 6.4 if possible.  Given that we are at 6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
> 
> Jacek, since you have commit permissions in drm-misc and are an active Accel maintainer, I wonder if it would be appropriate for you to merge this series to drm-misc.  Thoughts?

I'm would be happy to merge it but I think it needs to be acked by Oded first.

Regards,
Jacek
