Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13501A4546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 12:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgDJKjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 06:39:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40682 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgDJKjn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 06:39:43 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200410103942euoutp028ddc112a36d46c5290acc9df967a6796~Ebyb-6E0F1227012270euoutp02_
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 10:39:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200410103942euoutp028ddc112a36d46c5290acc9df967a6796~Ebyb-6E0F1227012270euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586515182;
        bh=thvDiT/eQi5V7MIlmJv3g6iQX+aqMmt4n/u9ZPubS4c=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kSCLQRnHWPBQrv24Sn/+HMp/SYedN033MzBFLllbmXUDVpcypOwoOhDnPoMblx7dB
         X/I3Hnj+8MLNrk9g9mBrXLBocZns2qp8JMTPJa8UfK6DyFHkPYEZ7nsBZ0ZNjiYTq0
         LxyQdgBYfhbkc00NFompivbyGmb3VxiHUmN06h1Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200410103940eucas1p1d1dab09988aaf6dca4cb656f4f51a88e~EbybAcSSv1417814178eucas1p1J;
        Fri, 10 Apr 2020 10:39:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 57.5D.60698.CEC409E5; Fri, 10
        Apr 2020 11:39:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200410103940eucas1p19192e0681adebd0f5fa447146af93c09~EbyafAxHX3201932019eucas1p10;
        Fri, 10 Apr 2020 10:39:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200410103940eusmtrp2e107babbe90369aaa7156b0ba01f2c38~EbyaeDJzm1000210002eusmtrp2I;
        Fri, 10 Apr 2020 10:39:40 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-ea-5e904cec0dfd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 34.23.08375.CEC409E5; Fri, 10
        Apr 2020 11:39:40 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200410103939eusmtip1661ef8561a6aa99d569da66438857c18~EbyZRbR__2130221302eusmtip1D;
        Fri, 10 Apr 2020 10:39:39 +0000 (GMT)
Subject: Re: [RFC PATCH 33/34] iommu: Remove add_device()/remove_device()
 code-paths
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1a88547f-ac90-825e-e529-a56c2c4e0391@samsung.com>
Date:   Fri, 10 Apr 2020 12:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407183742.4344-34-joro@8bytes.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt9/d3XU0u83KD4uKRUFFpizhBwupKLpQfxj0hqyVN4t81Ka9
        obFZqKXOZKm3Wlsvyx6aq0wJbVqJSmoaskQz08pyaj6i1MqcV8v/zjnfOXzng4/Bylzaj9kf
        FcProrQRKlpOPX45ULXEvd4cGpCTH0SqWoco4kh9RJPK4i6KpN5Ow6TA3U6T4Q8dUmIr1hDD
        nRopiROuUiThYq6MpFVclpCU1g5MqqtHaGrxKxmpK7xEkzrTa0R63w9jYrabMMmoLpKQhH6B
        JsY4Nfls/4mJ81ublAwUWimS9cpKk7jGoBV+XJvTKuHuWu8izvmhhOYKhCYZ57i1iMvLTqC5
        xvqnNGct38A5rp/i0lxZiEsyddFcfr0Vc47KE1xf3uwQ7+3y5WF8xP7DvG5p8C75vm8Nvfig
        TXP0t+s0MqBC/0TkxQC7DOyWIWkikjNK9haChB6jRCT9CIrSW8YmfQgaPw+h8UjF2wtIHGQh
        MGdnjkW6EViEGtrj8mE3g7nVNeqaxv6gwPbiEfYQzLokcLM7T+Zx0WwgJHYmjiYUbDBkNn8c
        MTEMxc6HJNMKD5zO7oD0+o2iYyqUZ7ZRHtmLDYKO95RHxuwcyO+8hEXsCw1tV0b7AOtmwNlj
        lIqtV8P1P6WUiH3ga9lDmYhnwXDBeMCEoKXqnkwk5xDUGTPGbtZAY9Ug7dmM2YWQU7hUlFfC
        +Rb7aCFgvcHVOVUs4Q3nH6djUVZA/Bml6F4AQtn9f2udNbXYjFTChMuECecIE84R/u+1ISob
        +fKx+shwXq+O4o/467WR+tiocP890ZF5aOSPK/+UfX+Cin7tLkEsg1STFfGSlFClVHtYfyyy
        BAGDVdMU64xJoUpFmPbYcV4XvVMXG8HrS9BMhlL5KtRXv+xQsuHaGP4Azx/kdeNTCePlZ0Db
        ZvgsLvWqtiQfHd71ybaGP9M8sLF9uazUZfnY9E713DnXp72nIuak2iTETDlr3vR666QAi3xV
        WPxWe3nYpJTaT5NvP7M942y+xr0GQ78mMEjHyN7UHXogj84ouhHgSO8dDJmnHlzgnrK4b21z
        /IN26Ra7u1aq7DpwWbO2pyX59zUVpd+nDVyEdXrtX2r/zjjDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3bOjkdrcZqaH2YXBv2R1Ow45z7LTCLoRBGaUJDpnHpQyW2y
        s3UlWqmRE3OysFq1lilesrKN8kqyQRddZprJiqTljAq1e9DoYtMV7L/n5Xl+78sLD4kJHfxo
        skilZTUqRbGICMNdfx6MrZnabsxe21weiR57f+LIXnObQK7eDziqaTZhqHPqHYFmxif5yNq7
        HumvPeGjMnMdjioutIUgU/8lHqr2TmJocNA/1vQOhKCnXRcJ9LR0CKAvnhkMGa+UYujc4F0e
        qvhmJtCJMgl6e+UHhhyfJvjI12XBUeOAhUBlL6Wp0cyEw8JjWi2tgHGMOwmm0zwWwtibYhlb
        SwXBvBztIRhLXzpjrz/GmNyNgKkq/UAw7aMWjLG7jjBfbcvSFu4RJ2vUOi27olDNaTeIMmkU
        L6aTkDg+IUlMS2RZ6+KloriU5Hy2uGg/q4lLyREXfnrxBSuxrj/4210O9KBLbAChJKQSYP/z
        WmAAYaSQagDwwkcbL2DEwL5aPT+gw+GvUQMRCE0DaHg0gc8a4dQuaPS65+gI6icO693dxKyB
        UW4evNe4OEDYALz6vGKOICgaGqYNcyEBlQLPv3qDGQBJ4tRKWFWaOisjqSxYNrQqkFgE+87P
        3iLJUEoKJz14YHsitNhfYwG9HLZPX/yno+CLics8IxCag2hzEGIOQsxBiBXgLSCC1XHKAiVH
        izmFktOpCsR5aqUN+Otz577P3gGGb2U4AUUC0QLB2nnV2UK+Yj93SOkEkMREEYJtJ6qyhYJ8
        xaHDrEYt1+iKWc4JpP7ParDoyDy1v4wqrZyW0jKURMskMkkiEkUJTlGOvUKqQKFl97FsCav5
        z/HI0Gg9qE5THGh7OONTmeWflw5KC1VncjZddzfdLMm2vz9Zb/MlblQuyR1uO+n53uE4Wq9f
        kL56pHaTq7KoPyO8Af2qs9uKz/Yk9t3Y1i1/sFtobNv4FjelTFU+03u2do+fzk/bMpJbNSTf
        kdkTY5gnSUgu2tmw2bpqRHPcd8A53zuW5eJEOFeooGMxDaf4C7eSUfRUAwAA
X-CMS-MailID: 20200410103940eucas1p19192e0681adebd0f5fa447146af93c09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407183806eucas1p2cf45fbce5a43a6b4fe3a623b28da0606
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407183806eucas1p2cf45fbce5a43a6b4fe3a623b28da0606
References: <20200407183742.4344-1-joro@8bytes.org>
        <CGME20200407183806eucas1p2cf45fbce5a43a6b4fe3a623b28da0606@eucas1p2.samsung.com>
        <20200407183742.4344-34-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joerg

On 07.04.2020 20:37, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
>
> All drivers are converted to use the probe/release_device()
> call-backs, so the add_device/remove_device() pointers are unused and
> the code using them can be removed.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/iommu.c | 145 ++++++++----------------------------------
>   include/linux/iommu.h |   4 --
>   2 files changed, 27 insertions(+), 122 deletions(-)
>
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index cf25c1e48830..d9032f9d597c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -220,7 +220,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
>   	return ret;
>   }
>   
> -static int __iommu_probe_device_helper(struct device *dev)
> +int iommu_probe_device(struct device *dev)
>   {
>   	const struct iommu_ops *ops = dev->bus->iommu_ops;
>   	struct iommu_group *group;
> @@ -264,70 +264,17 @@ static int __iommu_probe_device_helper(struct device *dev)
>   
>   }
>   
> -int iommu_probe_device(struct device *dev)
> +void iommu_release_device(struct device *dev)
>   {
>   	const struct iommu_ops *ops = dev->bus->iommu_ops;
> -	struct iommu_group *group;
> -	int ret;
> -
> -	WARN_ON(dev->iommu_group);
> -
> -	if (!ops)
> -		return -EINVAL;
> -
> -	if (!dev_iommu_get(dev))
> -		return -ENOMEM;
> -
> -	if (!try_module_get(ops->owner)) {
> -		ret = -EINVAL;
> -		goto err_free_dev_param;
> -	}
> -
> -	if (ops->probe_device)
> -		return __iommu_probe_device_helper(dev);
> -
> -	ret = ops->add_device(dev);
> -	if (ret)
> -		goto err_module_put;
>   
> -	group = iommu_group_get(dev);
> -	iommu_create_device_direct_mappings(group, dev);
> -	iommu_group_put(group);
> -
> -	if (ops->probe_finalize)
> -		ops->probe_finalize(dev);
> -
> -	return 0;
> -
> -err_module_put:
> -	module_put(ops->owner);
> -err_free_dev_param:
> -	dev_iommu_free(dev);
> -	return ret;
> -}
> -
> -static void __iommu_release_device(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	if (!dev->iommu)
> +		return;
>   
>   	iommu_device_unlink(dev->iommu->iommu_dev, dev);
> -
>   	iommu_group_remove_device(dev);
>   
>   	ops->release_device(dev);
> -}
> -
> -void iommu_release_device(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> -
> -	if (!dev->iommu)
> -		return;
> -
> -	if (ops->release_device)
> -		__iommu_release_device(dev);
> -	else if (dev->iommu_group)
> -		ops->remove_device(dev);
>   
>   	module_put(ops->owner);
>   	dev_iommu_free(dev);
> @@ -1560,23 +1507,6 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
>   	if (ret)
>   		goto out_put_group;
>   
> -	/*
> -	 * Try to allocate a default domain - needs support from the
> -	 * IOMMU driver. There are still some drivers which don't support
> -	 * default domains, so the return value is not yet checked. Only
> -	 * allocate the domain here when the driver still has the
> -	 * add_device/remove_device call-backs implemented.
> -	 */
> -	if (!ops->probe_device) {
> -		iommu_alloc_default_domain(dev);
> -
> -		if (group->default_domain)
> -			ret = __iommu_attach_device(group->default_domain, dev);
> -
> -		if (ret)
> -			goto out_put_group;
> -	}
> -
>   	return group;
>   
>   out_put_group:
> @@ -1591,21 +1521,6 @@ struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
>   	return group->default_domain;
>   }
>   
> -static int add_iommu_group(struct device *dev, void *data)
> -{
> -	int ret = iommu_probe_device(dev);
> -
> -	/*
> -	 * We ignore -ENODEV errors for now, as they just mean that the
> -	 * device is not translated by an IOMMU. We still care about
> -	 * other errors and fail to initialize when they happen.
> -	 */
> -	if (ret == -ENODEV)
> -		ret = 0;
> -
> -	return ret;
> -}
> -
>   static int probe_iommu_group(struct device *dev, void *data)
>   {
>   	const struct iommu_ops *ops = dev->bus->iommu_ops;
> @@ -1789,45 +1704,39 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group)
>   
>   int bus_iommu_probe(struct bus_type *bus)
>   {
> -	const struct iommu_ops *ops = bus->iommu_ops;
> +	struct iommu_group *group, *next;
> +	LIST_HEAD(group_list);
>   	int ret;
>   
> -	if (ops->probe_device) {
> -		struct iommu_group *group, *next;
> -		LIST_HEAD(group_list);
> -
> -		/*
> -		 * This code-path does not allocate the default domain when
> -		 * creating the iommu group, so do it after the groups are
> -		 * created.
> -		 */
> -		ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
> -		if (ret)
> -			return ret;
> +	/*
> +	 * This code-path does not allocate the default domain when
> +	 * creating the iommu group, so do it after the groups are
> +	 * created.
> +	 */
> +	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
> +	if (ret)
> +		return ret;
>   
> -		list_for_each_entry_safe(group, next, &group_list, entry) {
> -			/* Remove item from the list */
> -			list_del_init(&group->entry);
> +	list_for_each_entry_safe(group, next, &group_list, entry) {
> +		/* Remove item from the list */
> +		list_del_init(&group->entry);
>   
> -			mutex_lock(&group->mutex);
> +		mutex_lock(&group->mutex);
>   
> -			/* Try to allocate default domain */
> -			probe_alloc_default_domain(bus, group);
> +		/* Try to allocate default domain */
> +		probe_alloc_default_domain(bus, group);
>   
> -			if (!group->default_domain)
> -				continue;
> +		if (!group->default_domain)
> +			continue;

It doesn't look straight from the above diff, but this continue leaks 
group->lock taken.

>   
> -			iommu_group_create_direct_mappings(group);
> +		iommu_group_create_direct_mappings(group);
>   
> -			ret = __iommu_group_dma_attach(group);
> +		ret = __iommu_group_dma_attach(group);
>   
> -			mutex_unlock(&group->mutex);
> +		mutex_unlock(&group->mutex);
>   
> -			if (ret)
> -				break;
> -		}
> -	} else {
> -		ret = bus_for_each_dev(bus, NULL, NULL, add_iommu_group);
> +		if (ret)
> +			break;
>   	}
>   
>   	return ret;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index fea1622408ad..dd076366383f 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -223,8 +223,6 @@ struct iommu_iotlb_gather {
>    * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
>    *            queue
>    * @iova_to_phys: translate iova to physical address
> - * @add_device: add device to iommu grouping
> - * @remove_device: remove device from iommu grouping
>    * @probe_device: Add device to iommu driver handling
>    * @release_device: Remove device from iommu driver handling
>    * @probe_finalize: Do final setup work after the device is added to an IOMMU
> @@ -277,8 +275,6 @@ struct iommu_ops {
>   	void (*iotlb_sync)(struct iommu_domain *domain,
>   			   struct iommu_iotlb_gather *iotlb_gather);
>   	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
> -	int (*add_device)(struct device *dev);
> -	void (*remove_device)(struct device *dev);
>   	struct iommu_device *(*probe_device)(struct device *dev);
>   	void (*release_device)(struct device *dev);
>   	void (*probe_finalize)(struct device *dev);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

