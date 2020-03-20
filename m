Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60DEA18D64E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 18:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgCTR5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 13:57:54 -0400
Received: from mga01.intel.com ([192.55.52.88]:31292 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgCTR5y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 13:57:54 -0400
IronPort-SDR: r71geOQEIaSfWMZJ6TeJbS80s1s4UME7czaI12BpC1s26yRlO7uVuXBjy12s3QaWK7/0Uj2sMi
 625iUw2EwMPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 10:57:53 -0700
IronPort-SDR: OmDXVhyTKlU50WoWzpmVCqcLA7WUwVpCf1Ao7u1nBnBGKJ/i2veDk5SXC5PBRgALl8UdNfmn1Z
 JPTfAOqQ1bEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="392225793"
Received: from manallet-mobl.amr.corp.intel.com (HELO [10.255.34.12]) ([10.255.34.12])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2020 10:57:50 -0700
Subject: Re: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org,
        broonie@kernel.org, Andy Gross <agross@kernel.org>,
        jank@cadence.com,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard liao <yung-chuan.liao@linux.intel.com>,
        Rander Wang <rander.wang@linux.intel.com>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
 <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <40803069-e7dc-3dd6-ec7b-bec4308f381e@linux.intel.com>
Date:   Fri, 20 Mar 2020 12:57:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> Add new device as a child of the platform device, following the
>> following hierarchy:
>>
>> platform_device
>>      sdw_master_device
>>          sdw_slave0
> 
> Why can't we just remove the platform device layer here and add 
> sdw_master_device directly?
> 
> What is it stopping doing that?

The guidance from Greg was "no platform devices, unless you really are 
on a platform bus (i.e. Device tree.)". We never discussed changing the 
way the Device Tree parts are handled.

The main idea was to leave the parent (be it platform-device or PCI 
device) alone and not add new attributes or references to it.

The scheme here is similar to I2C/SPI, you have a platform device 
handled by the Device Tree baseline, and a driver create an 
i2c_adapter/spi_controller/sdw_master_device.

