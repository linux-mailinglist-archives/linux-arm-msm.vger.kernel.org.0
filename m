Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF26B1A353D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 15:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgDIN6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 09:58:04 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60608 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIN6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 09:58:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200409135802euoutp01c9c043c3f712a29093a4b152382b8139~EK2VWCu1B1341513415euoutp01x
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2020 13:58:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200409135802euoutp01c9c043c3f712a29093a4b152382b8139~EK2VWCu1B1341513415euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586440683;
        bh=HoDULKZEPFgHf9tLjrd/wtlsxmYJbEnHig6v37JyBM0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=N1XLeXa17pBIBMsscEvKxlU7Qxdn+vKflM253MZJ2N9Jz6wGJFmzUdOCZ5RELO2ll
         te4eCyaVf+aL8PHaYfeo3SDUX+t51wN20hoTp/G2+uIT6TzdAqjzkVY5KENtfwRl/c
         vY1Ps5K60Nbf4+SQgWpuhUWVMH4o0T4pW4SdOMwk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200409135802eucas1p268bcd5fe08a6f43b0649e9f8f2d3bb04~EK2U47IiK2457124571eucas1p2S;
        Thu,  9 Apr 2020 13:58:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DB.8A.60679.AE92F8E5; Thu,  9
        Apr 2020 14:58:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200409135801eucas1p2fd7106f33e1e2dc2dc9335e50a74f5b2~EK2UW_WXF0713307133eucas1p2-;
        Thu,  9 Apr 2020 13:58:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200409135801eusmtrp115487dff4dcda68530454fed04cdff10~EK2UVVBiQ1539615396eusmtrp1H;
        Thu,  9 Apr 2020 13:58:01 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-a1-5e8f29ea0978
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C9.D4.07950.9E92F8E5; Thu,  9
        Apr 2020 14:58:01 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200409135800eusmtip29e53826e1c4eae1630e8b8654b779ec0~EK2S9rSPp3234132341eusmtip28;
        Thu,  9 Apr 2020 13:58:00 +0000 (GMT)
Subject: Re: [PATCH] iommu/exynos: Get rid of 'struct exynos_iommu_owner'
 exynos_iommu_owner
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <40af831b-d00c-0cf9-0a06-e60c048a9ab8@samsung.com>
Date:   Thu, 9 Apr 2020 15:58:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409114620.GA16298@8bytes.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0hTaxju2zk7O0qTr1X4XmtFI6KiH/N2i68fjIyCQ0E/uCUkuFx1MEkt
        tmZaRLKtSDHMJLRjLbUumlrWVlpSyRZs2fBoGeUt86oZ3sqlOaMsy9yOlf89z/O+D8/zwstS
        qutMFJuUeoA3phqSNUw4XeMZEhe+nZer114unUrEV19p4sy7yRBf/Xua5F3Op8jt3v8ZMtL1
        Tk6K61eSzMpmObEJpTTJKrqmIPkPz8tI7qt3FGlqGqV59Y0K0lJ3jiEt1keIDHSMUORUiZUi
        hU33ZCRrUGCIxbaE9JR8poirv1tOhursNClrtDPE1rZ0dRTX7bLLuCp7FeJcXW6Guy28VHDO
        8vmcoyKL4dqe3mE4e8MWznnpKJffWoa4k9b3DFf71E5xTt9hLuCYsTkiLnzVbj45KY03LtYl
        hO850R+x35OU7rFUMJmo7+9sFMYC/gvaPQPybBTOqnA5gk+uQYVEBhE867iLJBJAcMX/Ff20
        +C6NjA3KEHjEzjFLH4JvpdXy4NZkrIdy94sQnoI18CxwLBRC4WoFfLrjYIIDBkdDtj87hJVY
        Bw0X7KEIGs+GN75aWRBPxfEgdrXKpZ1J0HC2mw7iMKyFkW+BkE7hmVDrP0dJOBKed1+QBcMA
        97Iw1G8f670WampslIQnw1vvDYWEp4MvP4eWDFYEneIVhURyELRYCsfcK6FN/DJalR2NmAfV
        dYslOQa8YokiKAOOgFb/JKlEBJyuKaAkWQknjquk7TkgeK/+inU1P6ZOIY0w7jRh3DnCuHOE
        37nFiK5AkbzZlJLIm/5M5Q8uMhlSTObUxEW79qU40Ogj+757B2+huuGdboRZpJmo1E7I1avk
        hjRTRoobAUtppig3WE7qVcrdhoxDvHHfDqM5mTe50TSW1kQql5S+iVfhRMMBfi/P7+eNP6cy
        NiwqE7Gibuf23jP6f8+r1XvN6Z1Pbv4Rk36/fe76rf7mIpBVfu6r7XhQvzzOvGlWZWzC8V2H
        h3syCqdprepAjigr0E3gVsQ2bVDjZQkXvds2Dg/8l6j/EEOp0z62T9SG5XJHdHGOsijc84/l
        YUGR7cU6cXM8vUWIbny9cY1x7oq2BwucGtq0xxA9nzKaDD8ATrGZy8QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3cu26rJaWq+SFSMiDI67qLtXZkW9eFECEYfivI29KCSc7Kz
        VVaUOYucxBxG2LLjJUOzC+lMU0Nx6mStspDs4ooy6WazaEHZzTZX4Lffw/P/PQ8PPCJM2k9E
        i/IKjKyhQJsvI+fjnj9DL9a+X21Nl7e8UqL7r3/iyGG7SSJP7xSObJcrMdT58R2JZsYnCVTb
        uwEVX3lAoFJ7PY7Kzt8Qoso7FwTI+noSQ8PDgdLWe0+IRrqqSTRifgjQl5czGKqoM2OoarhH
        gMq+2klUUqpCb+u+Y6jv8wSBprt4HDXe40lU6o3fFM1M9PEC5ip/FTB9406S6bQ/FzKOphim
        tbmMZLyjt0mGd+9gHA3HmMonjYA5bZ4imY5RHmMcnsOMv3VpStgeOsGgNxnZ5bl6zrhRtleB
        lLRCg2hlnIZWqNRp65XxstjEhGw2P28/a4hNzKRzT30OK3TlHXSVNJPF4NNOCxCLIBUHPQ0z
        wALmi6TUJQCtl8uFocYS6D5bTIQ4HP4atZChkA/A3gH3bCOcSodNzrFZjqBk8LH/BBEMYVSL
        EE5Plv8b6xTAzmsX8WCKpBTQ4guOEoskVCJ01/AgyDi1Ar73dAiCHEmlQau5G4Qyi6D73MSs
        K6bkcOa3f3YbRq2DvOMVFuJlsMNX/Y+j4LOJGkEFkNrn6PY5in2OYp+j1AK8GUSwJk6Xo+OU
        NKfVcaaCHDpLr2sFgQdqd0233QKWqZ1OQImAbKFEPs+aLiW0+7kinRNAESaLkGwvOZ0ulWRr
        iw6xBn2GwZTPck4QHzjOhkVHZukD71hgzFDEK9RIo1Cr1Kp1SBYlOUX1pUqpHK2R3ceyhazh
        vycQiaOLAb2qPrkHSfiEqjcfHP3Pttli2k3ilqyDGbss3XfXHBUmfesv2ZzShtNP5CfppFy+
        K9PluuQ/bvIObXiqW35k/dOttnPYgvFY32NH/SAfNSrWEOpHjsKq3V58m6qTEW/9sSWzKueA
        3Lfy/vUE9uwZYvGgP7VirOj38+QBZVdPoQzncrWKGMzAaf8Ci7U6n1YDAAA=
X-CMS-MailID: 20200409135801eucas1p2fd7106f33e1e2dc2dc9335e50a74f5b2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
References: <20200407183742.4344-1-joro@8bytes.org>
        <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
        <20200407183742.4344-32-joro@8bytes.org>
        <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
        <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
        <20200409114620.GA16298@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joerg,

On 09.04.2020 13:46, Joerg Roedel wrote:
> Hi Marek,
>
> I had some more thoughts and discussions with Robin about how to make
> this work with the Exynos driver. The result is the patch below, can you
> please test it and report back? Even better if you can fix up any
> breakage it might cause :)

I've checked and it works fine on top of 
ff68eb23308e6538ec7864c83d39540f423bbe90. However I'm not a fan of 
removing this 'owner' structure. It gave a nice abstraction for the all 
SYSMMU controllers for the given device (although most devices in the 
system have only one SYSMMU). Why this structure is a problem for your 
rework?

I've also spent some time trying to fix exynos-iommu on top of your 
iommu-probe-device branch. I really wonder if it works on any ARM 32bit 
or 64bit systems for other IOMMUs.

I got something working on ARM32bit, but I have to move all the 
initialization from exynos_iommu_probe_device/exynos_iommu_of_xlate to 
exynos_sysmmu_probe(). I don't like such approach, because I had to use 
bus_find_device() and manually find the owner for the every SYSMMU 
controller in the system. This approach also lack a proper symmetry and 
release path.

The main problem after your conversion is the fact that ->probe_device() 
is called very early, before any other platform device (thus IOMMU 
controller) is is probed. It doesn't handle EPROBE_DEFER too.

The other issue I've noticed is that iommu_device_set_ops() is not 
enough to assign ops properly. I had to add iommu_fwspec_init(dev, 
&dev->of_node->fwnode, &exynos_iommu_ops) to ensure that the 'dev' gets 
proper iommu ops.

I will send my patch in a few minutes to show you the changes.

> >From 60a288509baa34df6a0bf437c977925a0a617c72 Mon Sep 17 00:00:00 2001
> From: Joerg Roedel <jroedel@suse.de>
> Date: Thu, 9 Apr 2020 13:38:18 +0200
> Subject: [PATCH] iommu/exynos: Get rid of 'struct exynos_iommu_owner'
>
> Remove 'struct exynos_iommu_owner' and replace it with a single-linked
> list of 'struct sysmmu_drvdata'. The first item in the list acts as a
> replacement for the previous exynos_iommu_owner structure. The
> iommu_device member of the first list item is reported to the IOMMU
> core code for the master device.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/exynos-iommu.c | 155 ++++++++++++++++++++---------------
>   1 file changed, 88 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 186ff5cc975c..e70eb360093f 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -225,18 +225,6 @@ static const struct sysmmu_fault_info sysmmu_v5_faults[] = {
>   	{ 20, REG_V5_FAULT_AW_VA, "AW SECURITY PROTECTION", IOMMU_FAULT_WRITE },
>   };
>   
> -/*
> - * This structure is attached to dev.archdata.iommu of the master device
> - * on device add, contains a list of SYSMMU controllers defined by device tree,
> - * which are bound to given master device. It is usually referenced by 'owner'
> - * pointer.
> -*/
> -struct exynos_iommu_owner {
> -	struct list_head controllers;	/* list of sysmmu_drvdata.owner_node */
> -	struct iommu_domain *domain;	/* domain this device is attached */
> -	struct mutex rpm_lock;		/* for runtime pm of all sysmmus */
> -};
> -
>   /*
>    * This structure exynos specific generalization of struct iommu_domain.
>    * It contains list of SYSMMU controllers from all master devices, which has
> @@ -271,13 +259,23 @@ struct sysmmu_drvdata {
>   	bool active;			/* current status */
>   	struct exynos_iommu_domain *domain; /* domain we belong to */
>   	struct list_head domain_node;	/* node for domain clients list */
> -	struct list_head owner_node;	/* node for owner controllers list */
> +	struct sysmmu_drvdata *next;	/* Single-linked list to group SMMUs for
> +					   one master. NULL means not in any
> +					   list, ERR_PTR(-ENODEV) means end of
> +					   list */
> +	struct mutex rpm_lock;		/* for runtime pm of all sysmmus */
>   	phys_addr_t pgtable;		/* assigned page table structure */
>   	unsigned int version;		/* our version */
>   
>   	struct iommu_device iommu;	/* IOMMU core handle */
>   };
>   
> +/* Helper to iterate over all SYSMMUs for a given platform device */
> +#define for_each_sysmmu(dev, drvdata)			\
> +	for (drvdata = (dev)->archdata.iommu;		\
> +	     drvdata != ERR_PTR(-ENODEV);		\
> +	     drvdata = drvdata->next)
> +
>   static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
>   {
>   	return container_of(dom, struct exynos_iommu_domain, domain);
> @@ -624,6 +622,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>   
>   	data->sysmmu = dev;
>   	spin_lock_init(&data->lock);
> +	data->next = NULL;
> +	mutex_init(&data->rpm_lock);
>   
>   	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
>   				     dev_name(data->sysmmu));
> @@ -668,17 +668,20 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
>   {
>   	struct sysmmu_drvdata *data = dev_get_drvdata(dev);
>   	struct device *master = data->master;
> +	struct sysmmu_drvdata *master_data;
>   
> -	if (master) {
> -		struct exynos_iommu_owner *owner = master->archdata.iommu;
> +	if (!master)
> +		return 0;
>   
> -		mutex_lock(&owner->rpm_lock);
> -		if (data->domain) {
> -			dev_dbg(data->sysmmu, "saving state\n");
> -			__sysmmu_disable(data);
> -		}
> -		mutex_unlock(&owner->rpm_lock);
> +	master_data = master->archdata.iommu;
> +
> +	mutex_lock(&master_data->rpm_lock);
> +	if (data->domain) {
> +		dev_dbg(data->sysmmu, "saving state\n");
> +		__sysmmu_disable(data);
>   	}
> +	mutex_unlock(&master_data->rpm_lock);
> +
>   	return 0;
>   }
>   
> @@ -686,17 +689,20 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
>   {
>   	struct sysmmu_drvdata *data = dev_get_drvdata(dev);
>   	struct device *master = data->master;
> +	struct sysmmu_drvdata *master_data;
>   
> -	if (master) {
> -		struct exynos_iommu_owner *owner = master->archdata.iommu;
> +	if (!master)
> +		return 0;
>   
> -		mutex_lock(&owner->rpm_lock);
> -		if (data->domain) {
> -			dev_dbg(data->sysmmu, "restoring state\n");
> -			__sysmmu_enable(data);
> -		}
> -		mutex_unlock(&owner->rpm_lock);
> +	master_data = master->archdata.iommu;
> +
> +	mutex_lock(&master_data->rpm_lock);
> +	if (data->domain) {
> +		dev_dbg(data->sysmmu, "restoring state\n");
> +		__sysmmu_enable(data);
>   	}
> +	mutex_unlock(&master_data->rpm_lock);
> +
>   	return 0;
>   }
>   
> @@ -834,21 +840,21 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
>   	kfree(domain);
>   }
>   
> -static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
> -				    struct device *dev)
> +static void __exynos_iommu_detach_device(struct exynos_iommu_domain *domain,
> +					 struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
> -	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
>   	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
> -	struct sysmmu_drvdata *data, *next;
> +	struct sysmmu_drvdata *dev_data, *data, *next;
>   	unsigned long flags;
>   
> -	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
> +	dev_data = dev->archdata.iommu;
> +
> +	if (!has_sysmmu(dev) || dev_data->domain != domain)
>   		return;
>   
> -	mutex_lock(&owner->rpm_lock);
> +	mutex_lock(&dev_data->rpm_lock);
>   
> -	list_for_each_entry(data, &owner->controllers, owner_node) {
> +	for_each_sysmmu(dev, data) {
>   		pm_runtime_get_noresume(data->sysmmu);
>   		if (pm_runtime_active(data->sysmmu))
>   			__sysmmu_disable(data);
> @@ -863,51 +869,59 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
>   		list_del_init(&data->domain_node);
>   		spin_unlock(&data->lock);
>   	}
> -	owner->domain = NULL;
>   	spin_unlock_irqrestore(&domain->lock, flags);
>   
> -	mutex_unlock(&owner->rpm_lock);
> +	mutex_unlock(&dev_data->rpm_lock);
>   
>   	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
>   		&pagetable);
>   }
>   
> +static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
> +				       struct device *dev)
> +{
> +	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
> +
> +	__exynos_iommu_detach_device(domain, dev);
> +}
> +
>   static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
>   				   struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
> -	struct sysmmu_drvdata *data;
> +	struct sysmmu_drvdata *dev_data, *data;
>   	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
>   	unsigned long flags;
>   
>   	if (!has_sysmmu(dev))
>   		return -ENODEV;
>   
> -	if (owner->domain)
> -		exynos_iommu_detach_device(owner->domain, dev);
> +	dev_data = dev->archdata.iommu;
>   
> -	mutex_lock(&owner->rpm_lock);
> +	if (dev_data->domain)
> +		__exynos_iommu_detach_device(dev_data->domain, dev);
> +
> +	mutex_lock(&dev_data->rpm_lock);
>   
>   	spin_lock_irqsave(&domain->lock, flags);
> -	list_for_each_entry(data, &owner->controllers, owner_node) {
> +	for_each_sysmmu(dev, data) {
>   		spin_lock(&data->lock);
>   		data->pgtable = pagetable;
>   		data->domain = domain;
>   		list_add_tail(&data->domain_node, &domain->clients);
>   		spin_unlock(&data->lock);
>   	}
> -	owner->domain = iommu_domain;
>   	spin_unlock_irqrestore(&domain->lock, flags);
>   
> -	list_for_each_entry(data, &owner->controllers, owner_node) {
> +
> +	for_each_sysmmu(dev, data) {
>   		pm_runtime_get_noresume(data->sysmmu);
>   		if (pm_runtime_active(data->sysmmu))
>   			__sysmmu_enable(data);
>   		pm_runtime_put(data->sysmmu);
>   	}
>   
> -	mutex_unlock(&owner->rpm_lock);
> +	mutex_unlock(&dev_data->rpm_lock);
>   
>   	dev_dbg(dev, "%s: Attached IOMMU with pgtable %pa\n", __func__,
>   		&pagetable);
> @@ -1237,7 +1251,6 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
>   
>   static int exynos_iommu_add_device(struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct sysmmu_drvdata *data;
>   	struct iommu_group *group;
>   
> @@ -1249,7 +1262,7 @@ static int exynos_iommu_add_device(struct device *dev)
>   	if (IS_ERR(group))
>   		return PTR_ERR(group);
>   
> -	list_for_each_entry(data, &owner->controllers, owner_node) {
> +	for_each_sysmmu(dev, data) {
>   		/*
>   		 * SYSMMU will be runtime activated via device link
>   		 * (dependency) to its master device, so there are no
> @@ -1261,37 +1274,39 @@ static int exynos_iommu_add_device(struct device *dev)
>   	}
>   	iommu_group_put(group);
>   
> +	data = dev->archdata.iommu;
> +	iommu_device_link(&data->iommu, dev);
> +
>   	return 0;
>   }
>   
>   static void exynos_iommu_remove_device(struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
> -	struct sysmmu_drvdata *data;
> +	struct sysmmu_drvdata *data = dev->archdata.iommu;
>   
>   	if (!has_sysmmu(dev))
>   		return;
>   
> -	if (owner->domain) {
> +	if (data->domain) {
>   		struct iommu_group *group = iommu_group_get(dev);
>   
>   		if (group) {
> -			WARN_ON(owner->domain !=
> +			WARN_ON(&data->domain->domain !=
>   				iommu_group_default_domain(group));
> -			exynos_iommu_detach_device(owner->domain, dev);
> +			__exynos_iommu_detach_device(data->domain, dev);
>   			iommu_group_put(group);
>   		}
>   	}
> +	iommu_device_unlink(&data->iommu, dev);
>   	iommu_group_remove_device(dev);
>   
> -	list_for_each_entry(data, &owner->controllers, owner_node)
> +	for_each_sysmmu(dev, data)
>   		device_link_del(data->link);
>   }
>   
>   static int exynos_iommu_of_xlate(struct device *dev,
>   				 struct of_phandle_args *spec)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
>   	struct sysmmu_drvdata *data, *entry;
>   
> @@ -1302,22 +1317,28 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   	if (!data)
>   		return -ENODEV;
>   
> -	if (!owner) {
> -		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
> -		if (!owner)
> -			return -ENOMEM;
> +	data->master = dev;
>   
> -		INIT_LIST_HEAD(&owner->controllers);
> -		mutex_init(&owner->rpm_lock);
> -		dev->archdata.iommu = owner;
> +	if (!dev->archdata.iommu) {
> +		WARN_ON(data->next != NULL);
> +
> +		/* SYSMMU list is empty - add drvdata and return */
> +		data->next = ERR_PTR(-ENODEV);
> +		dev->archdata.iommu = data;
> +
> +		return 0;
>   	}
>   
> -	list_for_each_entry(entry, &owner->controllers, owner_node)
> +	/* Check if SYSMMU is already in the list */
> +	for_each_sysmmu(dev, entry)
>   		if (entry == data)
>   			return 0;
>   
> -	list_add_tail(&data->owner_node, &owner->controllers);
> -	data->master = dev;
> +	/* Not in the list yet */
> +	WARN_ON(data->next != NULL);
> +	entry = dev->archdata.iommu;
> +	data->next  = entry->next;
> +	entry->next = data;
>   
>   	return 0;
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

