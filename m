Return-Path: <linux-arm-msm+bounces-79728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C2C21605
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5481884281
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29606366FB8;
	Thu, 30 Oct 2025 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlqNuv8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0E266B67;
	Thu, 30 Oct 2025 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761844084; cv=none; b=l4EDKLnqCNJXwIbpQgW2VZ2kkSwVHelajWoZtVPZMNcHtUIs3YyTNvblxWfEGGq0d8A5i6wcBB5YJZI7P9YFfoisMZD4gX3B+JAwj2otgHX8rFJPU0Hcv3TaY4yXv8wPuL5wjEtxcoHLmKmo8mRDVMc8b1iyXniIE3P4pi1Rap0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761844084; c=relaxed/simple;
	bh=3fYCuPOJy/e4HaUIK5N6jQaajI1eBr3dVzIkK+oqgUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlBzALbjlXcUA9rdNxlkST0YYuwpBqMui5MPrlQ57EnJLbX+/Z0e5JDKvXVMIEkQyQS1FJzVd/5DpGlLm4t6/4+opIpPvm8XiXOFJMSk7FPDgB6aS/jC4Fblk3Q1gY/zn7E9M/OcoxOS5Q/YnfjWMGsWBDPETawsdzRnXPaDP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlqNuv8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB2EC4CEF1;
	Thu, 30 Oct 2025 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761844083;
	bh=3fYCuPOJy/e4HaUIK5N6jQaajI1eBr3dVzIkK+oqgUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlqNuv8E1K/Ic972uYzJEVRD0VH3drUAhliHGy244XRv8ZKuV9VULhcnDESTkuejU
	 gb2ByCD5R83jlXfhVve2L1gH4ud6KXMHOhKbSs7mJg4v25I93p95YBLOsiW2+hdURr
	 SGJJOw3VTtHN4ZqsV9SATuwWDx3zaRCxw43wcVD8dqZ6quM2AX5+oRr6g1XJ4oQW6O
	 ANagqz8hLpkm0IBwdJBL+Jz3lUTeIQizYolQlcQPEO3LDb2n+MEHfApEY/5fMWIyaU
	 gzPb0B1Pv+DMw2rDYOjorNYW8jnuP+Zi8lyLzg/RNiZdGUNRiUYKtYKhcA0LSfn7bg
	 G7v0Sm3nJR/yw==
Date: Thu, 30 Oct 2025 12:11:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add support to extract more than
 32 image versions
Message-ID: <wyfv5abzo2ow37gbnktormshgasd64cjyf4rjyl3onvq2tgr7y@6hh4nxmk3rpg>
References: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
 <20251030-image-crm-part2-v1-2-676305a652c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-image-crm-part2-v1-2-676305a652c6@oss.qualcomm.com>

On Thu, Oct 30, 2025 at 03:07:49PM +0530, Kathiravan Thirumoorthy wrote:
> SMEM_IMAGE_VERSION_TABLE contains the version of the first 32 images.
> Add images beyond that and read these from SMEM_IMAGE_VERSION_TABLE_2.
> 
> Not all platforms define the SMEM item number 667, in that case
> qcom_smem_get() will throw the invalid item warning. To avoid that,
> validate the SMEM item before fetching the version details.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 46 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 4fd09e2bfd021424b9489cd29eec29dc7c7a16d3..f832ae36942b10f68f0c3304f98d946796e8d1bd 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -67,7 +67,17 @@
>  #define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
>  #define SMEM_IMAGE_TABLE_UEFI_INDEX	30
>  #define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
> +#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX	32
> +#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX	33
> +#define SMEM_IMAGE_TABLE_DCP_INDEX	34
> +#define SMEM_IMAGE_TABLE_OOBS_INDEX	35
> +#define SMEM_IMAGE_TABLE_OOBNS_INDEX	36
> +#define SMEM_IMAGE_TABLE_DEVCFG_INDEX	37
> +#define SMEM_IMAGE_TABLE_BTPD_INDEX	38
> +#define SMEM_IMAGE_TABLE_QECP_INDEX	39
> +
>  #define SMEM_IMAGE_VERSION_TABLE       469
> +#define SMEM_IMAGE_VERSION_TABLE_2	667
>  
>  /*
>   * SMEM Image table names
> @@ -79,13 +89,18 @@ static const char *const socinfo_image_names[] = {
>  	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
>  	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
>  	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
> +	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX] = "audiopd_adsp1",
> +	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX] = "audiopd_adsp2",
>  	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
> +	[SMEM_IMAGE_TABLE_BTPD_INDEX] = "btpd",
>  	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
>  	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
>  	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
>  	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
>  	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
>  	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
> +	[SMEM_IMAGE_TABLE_DCP_INDEX] = "dcp",
> +	[SMEM_IMAGE_TABLE_DEVCFG_INDEX] = "devcfg",
>  	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
>  	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
>  	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
> @@ -95,6 +110,9 @@ static const char *const socinfo_image_names[] = {
>  	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
>  	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
>  	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
> +	[SMEM_IMAGE_TABLE_OOBNS_INDEX] = "oobns",
> +	[SMEM_IMAGE_TABLE_OOBS_INDEX] = "oobs",
> +	[SMEM_IMAGE_TABLE_QECP_INDEX] = "qecp",
>  	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
>  	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
>  	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
> @@ -644,7 +662,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  	struct smem_image_version *versions;
>  	struct dentry *dentry;
>  	size_t size;
> -	int i;
> +	int i, j;
>  	unsigned int num_pmics;
>  	unsigned int pmic_array_offset;
>  
> @@ -788,20 +806,32 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  		break;
>  	}
>  
> -	versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
> -				 &size);
> -
> -	for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
> +	for (i = 0, j = 0; i < ARRAY_SIZE(socinfo_image_names); i++, j++) {
>  		if (!socinfo_image_names[i])
>  			continue;
>  
> +		if (i == 0) {
> +			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +						 SMEM_IMAGE_VERSION_TABLE,
> +						 &size);
> +		}
> +		if (i == 32) {

Probably nicer to do } else if (...) { here...

> +			if (!qcom_smem_validate_item(SMEM_IMAGE_VERSION_TABLE_2))

Let's see if we can clean up patch 1 and get rid of this.
Other than that, this patch looks good.

Regards,
Bjorn

> +				break;
> +
> +			j = 0;
> +			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +						 SMEM_IMAGE_VERSION_TABLE_2,
> +						 &size);
> +		}
> +
>  		dentry = debugfs_create_dir(socinfo_image_names[i],
>  					    qcom_socinfo->dbg_root);
> -		debugfs_create_file("name", 0444, dentry, &versions[i],
> +		debugfs_create_file("name", 0444, dentry, &versions[j],
>  				    &qcom_image_name_ops);
> -		debugfs_create_file("variant", 0444, dentry, &versions[i],
> +		debugfs_create_file("variant", 0444, dentry, &versions[j],
>  				    &qcom_image_variant_ops);
> -		debugfs_create_file("oem", 0444, dentry, &versions[i],
> +		debugfs_create_file("oem", 0444, dentry, &versions[j],
>  				    &qcom_image_oem_ops);
>  	}
>  }
> 
> -- 
> 2.34.1
> 

