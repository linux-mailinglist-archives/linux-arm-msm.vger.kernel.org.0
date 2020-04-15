Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB0A1A9359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393567AbgDOGgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:36:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:33899 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393565AbgDOGg0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:36:26 -0400
IronPort-SDR: AxuWUswikhaQHgE9NbIcR4k/XrGOsrf6O51f7y6KnLBDatEdq7L/s6mXCiIN7CYhFGXmkAv9JF
 Q8gfGjalKhfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 23:36:26 -0700
IronPort-SDR: e6xHGQuPW0GE2LEJRgwBaaQuNwmEtvc/TZ2WPBNJCcxxDlhT3Yrpnh18pXIf/KDAcMJ1v7zZbH
 nGNmd7m4gNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="363591408"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.208]) ([10.254.210.208])
  by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2020 23:36:20 -0700
Cc:     baolu.lu@linux.intel.com, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 07/33] iommu: Add probe_device() and remove_device()
 call-backs
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-8-joro@8bytes.org>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0ad37581-b464-30ac-c503-4c0daaf43867@linux.intel.com>
Date:   Wed, 15 Apr 2020 14:36:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414131542.25608-8-joro@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020/4/14 21:15, Joerg Roedel wrote:
> From: Joerg Roedel<jroedel@suse.de>
> 
> Add call-backs to 'struct iommu_ops' as an alternative to the
> add_device() and remove_device() call-backs, which will be removed when
> all drivers are converted.
> 
> The new call-backs will not setupt IOMMU groups and domains anymore,
> so also add a probe_finalize() call-back where the IOMMU driver can do
> per-device setup work which require the device to be set up with a
> group and a domain.

The subject is inaccurate. probe_device() and release_device() are
added to replace the add and remove pair.

Best regards,
baolu
