Return-Path: <linux-arm-msm+bounces-34048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B2999DD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5B402877F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21331209686;
	Fri, 11 Oct 2024 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb5kqHJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CAE209F37;
	Fri, 11 Oct 2024 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631467; cv=none; b=lQnpyJd9lx0w+qsmhCs3ca998xRXFu+zRHh3I6M2Clr54z0obJVI+vmPG5QNZe2weVwbAK+AxqoPKS63GsH8NXuToahOuC92nJp4aLFcNzsQVs3XwSNw4JkAFrQ0YiZAH6ao8Nb7ePSwxlI9v4h+iXEE5tdZ+VsT0W7VInrDICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631467; c=relaxed/simple;
	bh=Z7KbgGb2SEirlGgTeQ4Iv+yWIHuJb37+AkiI8yShLAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDFlKev330RHYtcK0tH1R5VFVZc/0KKD9ASA5a6XOrTLWBNt8aQ+u122d3oa6BqZCJuDZYgR1KzqseGE37VLkqi8KePIv9ni6IbPiAOwmhVWFiJGQnScMlKom3/F53kR3eXtPWBUcRneXPbM3sLS0qDlVlanEnoA/gS0dQ9aTcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb5kqHJK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728631466; x=1760167466;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Z7KbgGb2SEirlGgTeQ4Iv+yWIHuJb37+AkiI8yShLAk=;
  b=Zb5kqHJKcueg6XR7gOtglMQICYSFjKEZqRHkrXYHP3GEyk8JwgQY1Ipo
   dq6SKzH9GJ4mjwbRRNZxP8tEHAJbmwY0koZPpPliyoKgn92Asjnzgh7ap
   dg4WEpunPXcsxTcVFb6uxiJrttyLfY7vfkelCWNBNvsMHtJYDseCx41Io
   DBvKv5OFmqxidlWCafkHmZRubeVvJT+mddIINcgrCsJWCkaorm9mSt7Yo
   xSlr1NL2Cc758r7LrBOJC2T+iy+HdNnkerK9/dO0E2+/14zjJMY7dEs+h
   vI1rUgq+OF9qOy1n6Qr8qg3fneL9ZboBQbVBzJGFwr/aYsANXEMYq62kW
   A==;
X-CSE-ConnectionGUID: UcIO1v9ST2WfTZvpfHtoWw==
X-CSE-MsgGUID: uNw1PkBNSBmqxH/bDcO8VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27490400"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27490400"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:24:25 -0700
X-CSE-ConnectionGUID: ksJIIJowTsevGlWnmBiRHQ==
X-CSE-MsgGUID: hV88kXkyT8mT1BUb4DqhsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81655409"
Received: from jwbates1-mobl.amr.corp.intel.com (HELO [10.245.100.202]) ([10.245.100.202])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:24:21 -0700
Message-ID: <49b12989-6c9a-4c2f-bc60-8fe2581ded34@linux.intel.com>
Date: Fri, 11 Oct 2024 09:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add AIC080 support
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, corbet@lwn.net, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Troy Hanson <quic_thanson@quicinc.com>
References: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 10/4/2024 9:52 PM, Jeffrey Hugo wrote:
> Add basic support for the new AIC080 product. The PCIe Device ID is
> 0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
> From the qaic perspective, it is the same as AIC100.
> 
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/qaic/aic080.rst | 14 ++++++++++++++
>  Documentation/accel/qaic/index.rst  |  1 +
>  drivers/accel/qaic/qaic_drv.c       |  4 +++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/accel/qaic/aic080.rst
> 
> diff --git a/Documentation/accel/qaic/aic080.rst b/Documentation/accel/qaic/aic080.rst
> new file mode 100644
> index 000000000000..d563771ea6ce
> --- /dev/null
> +++ b/Documentation/accel/qaic/aic080.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +===============================
> + Qualcomm Cloud AI 80 (AIC080)
> +===============================
> +
> +Overview
> +========
> +
> +The Qualcomm Cloud AI 80/AIC080 family of products are a derivative of AIC100.
> +The number of NSPs and clock rates are reduced to fit within resource
> +constrained solutions. The PCIe Product ID is 0xa080.
> +
> +As a derivative product, all AIC100 documentation applies.
> diff --git a/Documentation/accel/qaic/index.rst b/Documentation/accel/qaic/index.rst
> index ad19b88d1a66..967b9dd8bace 100644
> --- a/Documentation/accel/qaic/index.rst
> +++ b/Documentation/accel/qaic/index.rst
> @@ -10,4 +10,5 @@ accelerator cards.
>  .. toctree::
>  
>     qaic
> +   aic080
>     aic100
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index bf10156c334e..f139c564eadf 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -34,6 +34,7 @@
>  
>  MODULE_IMPORT_NS(DMA_BUF);
>  
> +#define PCI_DEV_AIC080			0xa080
>  #define PCI_DEV_AIC100			0xa100
>  #define QAIC_NAME			"qaic"
>  #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
> @@ -365,7 +366,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>  		return NULL;
>  
>  	qdev->dev_state = QAIC_OFFLINE;
> -	if (id->device == PCI_DEV_AIC100) {
> +	if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
>  		qdev->num_dbc = 16;
>  		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
>  		if (!qdev->dbc)
> @@ -607,6 +608,7 @@ static struct mhi_driver qaic_mhi_driver = {
>  };
>  
>  static const struct pci_device_id qaic_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC080), },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
>  	{ }
>  };


