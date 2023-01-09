Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 914F3662A53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 16:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjAIPnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 10:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbjAIPmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 10:42:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1067D1133;
        Mon,  9 Jan 2023 07:40:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 888CEB80973;
        Mon,  9 Jan 2023 15:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6995CC433D2;
        Mon,  9 Jan 2023 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673278828;
        bh=UyVRc9O5snMPuEkCgMMTiFPdwN/OH5l6ezUaVMBo+4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YBzbdM6oPnSqfP7fzmv+kiSlG3wtXDv0rgcd5DT8BvUUzUHQJpkreX3zqLTZIZ/S5
         yycUdcQciGbmIx8YV9G8oKB4b9EUdqHAEujNu5E1gzl8dgdw33weNOm3JXeTiVx4XS
         hOaSo6YMl4lmuglD90MfZv3vDrbbw4KC93GJdNGbXw71ecOJ82VKjtSvXciZNGZ9Yc
         fpJ+iaDw42GH+OwJkLBwvw8Yv8wSqHxcuSKoVg5NelQU4iFEzzxZ16vSeLAPIB8jEv
         6Kmet+fUxHCbrY2wKL+NAB6+wFWgZ87M1mK9iqyk9jeDD36lI4qU8PXkMVQr6VsiBY
         DG6Cbh81YJqiQ==
Date:   Mon, 9 Jan 2023 09:40:25 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alex Elder <elder@ieee.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>, vkoul@kernel.org
Subject: Re: [PATCH V1 1/1] soc: qcom: dcc: Add QAD, Ctitrigger and
 Bootconfig support for DCC
Message-ID: <20230109154025.sy5nxgrrzjoon5nc@builder.lan>
References: <cover.1673270769.git.quic_schowdhu@quicinc.com>
 <90a5a60b6f4cc84321370acaa0f2876dcaae7580.1673270769.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90a5a60b6f4cc84321370acaa0f2876dcaae7580.1673270769.git.quic_schowdhu@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 09, 2023 at 07:32:26PM +0530, Souradeep Chowdhury wrote:
> Add the QAD, ctitrigger and bootconfig support for dcc driver.
> The QAD is used for access control of the DCC configurations
> and can be set or unset by writing to DCC_QAD_OUTPUT register.
> The Cti-trigger is used for the cross trigger interface, on
> enabling it the software trigger can be initiated for dcc by
> setting the cti-trigout.
> Bootconfig support for DCC is for configuring register values
> to dcc at boot time, this is needed for debugging crashes that
> happen at boot time.
> Add the debugfs files QAD and CTI-trigger for each list folder.
> Also add hwtrigger debugfs file which needs to be disabled on
> enabling the cti-trigger.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  Documentation/ABI/testing/debugfs-driver-dcc |  24 +++
>  drivers/soc/qcom/dcc.c                       | 284 ++++++++++++++++++++++++++-
>  2 files changed, 304 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/debugfs-driver-dcc b/Documentation/ABI/testing/debugfs-driver-dcc
> index 27ed591..f817a9f 100644
> --- a/Documentation/ABI/testing/debugfs-driver-dcc
> +++ b/Documentation/ABI/testing/debugfs-driver-dcc
> @@ -125,3 +125,27 @@ Description:
>  		on manual or crash induced triggers. Lists must
>  		be configured and enabled sequentially, e.g. list
>  		2 can only be enabled when list 1 have so.
> +
> +What:		/sys/kernel/debug/dcc/.../[list-number]/ctitrigger
> +Date:		January 2023
> +Contact:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> +Description:
> +		This debugfs interface is used for enabling the
> +		ctitrigger. Ctitrigger can be enabled by writing
> +		a '1' to the file.
> +
> +What:		/sys/kernel/debug/dcc/.../[list-number]/QAD
> +Date:           January 2023
> +Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> +Description:
> +		This debugfs interface is used for enabling the
> +		ctitrigger. Ctitrigger can be enabled by writing
> +		a '1' to the file.
> +
> +What:           /sys/kernel/debug/dcc/.../[list-number]/hwtrigger
> +Date:	        January 2023
> +Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> +Description:
> +	        This debugfs interface is used for enabling the
> +	        hwtrigger support. Hwtrigger can be enabled by
> +	        writing a '1' to the file.
> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> index 5b50d63..ea44dbf 100644
> --- a/drivers/soc/qcom/dcc.c
> +++ b/drivers/soc/qcom/dcc.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/bootconfig.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
> @@ -36,6 +37,8 @@
>  #define DCC_LL_INT_STATUS		0x1c
>  #define DCC_LL_SW_TRIGGER		0x2c
>  #define DCC_LL_BUS_ACCESS_STATUS	0x30
> +#define DCC_CTI_TRIG                    0x34
> +#define DCC_QAD_OUTPUT                  0x38
>  
>  /* Default value used if a bit 6 in the HW_INFO register is set. */
>  #define DCC_FIX_LOOP_OFFSET		16
> @@ -114,6 +117,9 @@ struct dcc_config_entry {
>   * @nr_link_list:	Total number of linkedlists supported by the DCC configuration
>   * @loop_shift:	Loop offset bits range for the addresses
>   * @enable_bitmap:	Bitmap to capture the enabled status of each linked list of addresses
> + * @cti_bitmap:		Bitmap to capture the cti-trigger status of each linked list of addresses
> + * @qad_bitmap:		Bitmap to capture the qad status of each linked list of addresses
> + * @hwtrig_bitmap:	Bitmap to capture the hwtrig status of each linked list of addresses
>   */
>  struct dcc_drvdata {
>  	void __iomem		*base;
> @@ -131,6 +137,9 @@ struct dcc_drvdata {
>  	size_t			nr_link_list;
>  	u8			loop_shift;
>  	unsigned long		*enable_bitmap;
> +	unsigned long		*cti_bitmap;
> +	unsigned long           *qad_bitmap;
> +	unsigned long           *hwtrig_bitmap;
>  };
>  
>  struct dcc_cfg_attr {
> @@ -148,6 +157,18 @@ struct dcc_cfg_loop_attr {
>  	bool	loop_start;
>  };
>  
> +static char *replace_char(char *str, char find, char replace)
> +{
> +	char *current_pos = strchr(str, find);
> +
> +	while (current_pos) {
> +		*current_pos = replace;
> +		current_pos = strchr(current_pos, find);
> +	}
> +
> +	return str;
> +}
> +
>  static inline u32 dcc_list_offset(int version)
>  {
>  	return version == 1 ? 0x1c : version == 2 ? 0x2c : 0x34;
> @@ -201,6 +222,10 @@ static int dcc_sw_trigger(struct dcc_drvdata *drvdata)
>  			continue;
>  		ll_cfg = dcc_list_readl(drvdata, i, DCC_LL_CFG);
>  		tmp_ll_cfg = ll_cfg & ~DCC_TRIGGER_MASK;
> +		if (drvdata->mem_map_ver != 3)
> +			tmp_ll_cfg = ll_cfg & ~DCC_TRIGGER_MASK;
> +		else
> +			tmp_ll_cfg = ll_cfg & ~BIT(8);
>  		dcc_list_writel(drvdata, tmp_ll_cfg, i, DCC_LL_CFG);
>  		dcc_list_writel(drvdata, 1, i, DCC_LL_SW_TRIGGER);
>  		dcc_list_writel(drvdata, ll_cfg, i, DCC_LL_CFG);
> @@ -577,6 +602,25 @@ static int dcc_enable(struct dcc_drvdata *drvdata, unsigned int curr_list)
>  	/* 5. Configure trigger */
>  	dcc_list_writel(drvdata, DCC_TRIGGER_MASK,
>  			curr_list, DCC_LL_CFG);
> +	if (drvdata->mem_map_ver == 3) {
> +		dcc_list_writel(drvdata, test_bit(curr_list, drvdata->qad_bitmap), curr_list,
> +				DCC_QAD_OUTPUT);
> +		dcc_list_writel(drvdata, test_bit(curr_list, drvdata->cti_bitmap), curr_list,
> +				DCC_CTI_TRIG);
> +		if (test_bit(curr_list, drvdata->hwtrig_bitmap))
> +			dcc_list_writel(drvdata, BIT(8), curr_list, DCC_LL_CFG);
> +		else
> +			dcc_list_writel(drvdata, (unsigned int)~BIT(8), curr_list, DCC_LL_CFG);
> +	} else {
> +		if (test_bit(curr_list, drvdata->hwtrig_bitmap))
> +			dcc_list_writel(drvdata, DCC_TRIGGER_MASK |
> +					test_bit(curr_list, drvdata->cti_bitmap) << 8,
> +					curr_list, DCC_LL_CFG);
> +		else
> +			dcc_list_writel(drvdata, ~DCC_TRIGGER_MASK &
> +					test_bit(curr_list, drvdata->cti_bitmap) << 8,
> +					curr_list, DCC_LL_CFG);
> +	}
>  
>  out_unlock:
>  	mutex_unlock(&drvdata->mutex);
> @@ -1103,6 +1147,168 @@ static const struct file_operations config_fops = {
>  	.release = single_release,
>  };
>  
> +static ssize_t ctitrigger_read(struct file *filp, char __user *userbuf,
> +			       size_t count, loff_t *ppos)
> +{
> +	char *buf;
> +	int curr_list;
> +	struct dcc_drvdata *drvdata = filp->private_data;
> +
> +	curr_list = dcc_filp_curr_list(filp);
> +
> +	mutex_lock(&drvdata->mutex);
> +
> +	if (test_bit(curr_list, drvdata->cti_bitmap))
> +		buf = "Y\n";
> +	else
> +		buf = "N\n";
> +
> +	mutex_unlock(&drvdata->mutex);
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> +}
> +
> +static ssize_t ctitrigger_write(struct file *filp, const char __user *userbuf,
> +				size_t count, loff_t *ppos)
> +{
> +	int ret = 0, curr_list;
> +	bool val;
> +	struct dcc_drvdata *drvdata = filp->private_data;
> +
> +	curr_list = dcc_filp_curr_list(filp);
> +
> +	if (test_bit(curr_list, drvdata->enable_bitmap))
> +		return -EBUSY;
> +
> +	ret = kstrtobool_from_user(userbuf, count, &val);
> +	if (ret < 0)
> +		return 0;
> +
> +	if (val)
> +		set_bit(curr_list, drvdata->cti_bitmap);
> +	else
> +		clear_bit(curr_list, drvdata->cti_bitmap);
> +
> +	return count;
> +}
> +
> +static const struct file_operations ctitrigger_fops = {
> +	.read = ctitrigger_read,
> +	.write = ctitrigger_write,
> +	.open = simple_open,
> +	.llseek = generic_file_llseek,
> +};
> +
> +static ssize_t qad_read(struct file *filp, char __user *userbuf,
> +			size_t count, loff_t *ppos)
> +{
> +	char *buf;
> +	int curr_list;
> +
> +	struct dcc_drvdata *drvdata = filp->private_data;
> +
> +	curr_list = dcc_filp_curr_list(filp);
> +
> +	mutex_lock(&drvdata->mutex);
> +
> +	if (test_bit(curr_list, drvdata->qad_bitmap))
> +		buf = "Y\n";
> +	else
> +		buf = "N\n";
> +
> +	mutex_unlock(&drvdata->mutex);
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> +}
> +
> +static ssize_t qad_write(struct file *filp, const char __user *userbuf,
> +			 size_t count, loff_t *ppos)
> +{
> +	int ret = 0, curr_list;

First use of ret is an assignment, no need to assign it here.

> +	bool val;
> +	struct dcc_drvdata *drvdata = filp->private_data;
> +
> +	curr_list = dcc_filp_curr_list(filp);
> +
> +	if (drvdata->mem_map_ver != 3) {
> +		dev_err(drvdata->dev, "QAD is not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (test_bit(curr_list, drvdata->enable_bitmap))
> +		return -EBUSY;
> +
> +	ret = kstrtobool_from_user(userbuf, count, &val);
> +	if (ret < 0)
> +		return 0;

0 isn't a good return value here.

> +
> +	if (val)
> +		set_bit(curr_list, drvdata->qad_bitmap);
> +	else
> +		clear_bit(curr_list, drvdata->qad_bitmap);
> +
> +	return count;
> +}
> +
> +static const struct file_operations qad_fops = {
> +	.read = qad_read,
> +	.write = qad_write,
> +	.open = simple_open,
> +	.llseek = generic_file_llseek,
> +};
> +
> +static ssize_t hwtrigger_read(struct file *filp, char __user *userbuf,
> +			      size_t count, loff_t *ppos)
> +{
> +	char *buf;
> +	int curr_list;
> +	struct dcc_drvdata *drvdata = filp->private_data;
> +
> +	curr_list = dcc_filp_curr_list(filp);
> +
> +	mutex_lock(&drvdata->mutex);
> +
> +	if (test_bit(curr_list, drvdata->hwtrig_bitmap))
> +		buf = "Y\n";
> +	else
> +		buf = "N\n";
> +
> +	mutex_unlock(&drvdata->mutex);
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> +}
> +
> +static ssize_t hwtrigger_write(struct file *filp, const char __user *userbuf,
> +			       size_t count, loff_t *ppos)
> +{
> +	int ret = 0, curr_list;
> +	bool val;
> +	struct dcc_drvdata *drvdata = filp->private_data;
> +
> +	curr_list = dcc_filp_curr_list(filp);
> +
> +	if (test_bit(curr_list, drvdata->enable_bitmap))
> +		return -EBUSY;
> +
> +	ret = kstrtobool_from_user(userbuf, count, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val)
> +		set_bit(curr_list, drvdata->hwtrig_bitmap);
> +	else
> +		clear_bit(curr_list, drvdata->hwtrig_bitmap);
> +
> +	return count;
> +}
> +
> +static const struct file_operations hwtrigger_fops = {
> +	.read = hwtrigger_read,
> +	.write = hwtrigger_write,
> +	.open = simple_open,
> +	.llseek = generic_file_llseek,
> +};
> +
>  static void dcc_delete_debug_dir(struct dcc_drvdata *drvdata)
>  {
>  	 debugfs_remove_recursive(drvdata->dbg_dir);
> @@ -1126,6 +1332,9 @@ static void dcc_create_debug_dir(struct dcc_drvdata *drvdata)
>  		list = debugfs_create_dir(list_num, drvdata->dbg_dir);
>  		debugfs_create_file("enable", 0600, list, drvdata, &enable_fops);
>  		debugfs_create_file("config", 0600, list, drvdata, &config_fops);
> +		debugfs_create_file("ctitrigger", 0600, list, drvdata, &ctitrigger_fops);
> +		debugfs_create_file("QAD", 0600, list, drvdata, &qad_fops);
> +		debugfs_create_file("hwtrigger", 0600, list, drvdata, &hwtrigger_fops);
>  	}
>  
>  	debugfs_create_file("trigger", 0200, drvdata->dbg_dir, drvdata, &trigger_fops);
> @@ -1185,13 +1394,60 @@ static void dcc_sram_dev_exit(struct dcc_drvdata *drvdata)
>  	misc_deregister(&drvdata->sram_dev);
>  }
>  
> -static int dcc_probe(struct platform_device *pdev)
> +static int __init dcc_bootconfig_parse(struct dcc_drvdata *drvdata, struct  xbc_node  *dcc_node)
> +{
> +	struct xbc_node *linked_list, *node;
> +	int curr_list, ret;
> +	const char *p;
> +	char *input, *token;
> +	char val[30];
> +
> +	xbc_node_for_each_subkey(dcc_node, linked_list) {
> +		p = xbc_node_find_value(linked_list, "qcom-curr-link-list", &node);
> +		if (p) {

So if I specify 

dcc-config {
	list1 {
		qcom-curr-link-list = 1
	}
	list2 {

	}
}

Then list2 should have &curr_list of 1 as well?

Or did you miss the error handling here?


PS. I think you can skip the "qcom-" prefix. Frankly, you know that
you're in a subnode of dcc_config; use "id" and "items" ("list"?).

> +			ret = kstrtoint(p, 0, &curr_list);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		p = xbc_node_find_value(linked_list, "qcom-link-list", &node);
> +		if (!p)
> +			continue;
> +
> +		xbc_array_for_each_value(node, p) {
> +			snprintf(val, sizeof(val), "%s", p);

strscpy() would be less costly.

> +			input = replace_char(val, '_', ' ');
> +			token = strsep(&input, " ");
> +
> +			if (!strcmp("R", token)) {
> +				ret = dcc_config_add_read(drvdata, input, curr_list);
> +			} else if (!strcmp("W", token)) {
> +				ret = dcc_config_add_write(drvdata, input, curr_list);
> +			} else if (!strcmp("RW", token)) {
> +				ret = dcc_config_add_read_write(drvdata, input, curr_list);
> +			} else if (!strcmp("L", token)) {
> +				ret = dcc_config_add_loop(drvdata, input, curr_list);
> +			} else {
> +				dev_err(drvdata->dev, "%s is not a correct input\n", token);
> +				return -EINVAL;
> +			}
> +			if (ret)
> +				return ret;
> +		}
> +		dcc_enable(drvdata, curr_list);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init dcc_probe(struct platform_device *pdev)
>  {
>  	u32 val;
>  	int ret = 0, i;
>  	struct device *dev = &pdev->dev;
>  	struct dcc_drvdata *drvdata;
>  	struct resource *res;
> +	struct xbc_node *dcc_node;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (!drvdata)
> @@ -1247,13 +1503,30 @@ static int dcc_probe(struct platform_device *pdev)
>  	if (!drvdata->enable_bitmap)
>  		return -ENOMEM;
>  
> +	drvdata->cti_bitmap = devm_kcalloc(dev, BITS_TO_LONGS(drvdata->nr_link_list),
> +					   sizeof(*drvdata->cti_bitmap), GFP_KERNEL);

How about devm_bitmap_alloc()?

> +	if (!drvdata->cti_bitmap)
> +		return -ENOMEM;
> +
> +	drvdata->qad_bitmap = devm_kcalloc(dev, BITS_TO_LONGS(drvdata->nr_link_list),
> +					   sizeof(*drvdata->qad_bitmap), GFP_KERNEL);
> +	if (!drvdata->qad_bitmap)
> +		return -ENOMEM;
> +
> +	drvdata->hwtrig_bitmap = devm_kcalloc(dev, BITS_TO_LONGS(drvdata->nr_link_list),
> +					      sizeof(*drvdata->hwtrig_bitmap), GFP_KERNEL);
> +	if (!drvdata->hwtrig_bitmap)
> +		return -ENOMEM;
> +
>  	drvdata->cfg_head = devm_kcalloc(dev, drvdata->nr_link_list,
>  					 sizeof(*drvdata->cfg_head), GFP_KERNEL);
>  	if (!drvdata->cfg_head)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < drvdata->nr_link_list; i++)
> +	for (i = 0; i < drvdata->nr_link_list; i++) {
>  		INIT_LIST_HEAD(&drvdata->cfg_head[i]);
> +		set_bit(i, drvdata->hwtrig_bitmap);
> +	}
>  
>  	ret = dcc_sram_dev_init(drvdata);
>  	if (ret) {
> @@ -1263,6 +1536,10 @@ static int dcc_probe(struct platform_device *pdev)
>  
>  	dcc_create_debug_dir(drvdata);
>  
> +	dcc_node = xbc_find_node("dcc_config");
> +	if (dcc_node)
> +		return dcc_bootconfig_parse(drvdata, dcc_node);

Wouldn't it make sense to still probe dcc, even if the configuration is
rejected?

> +
>  	return 0;
>  }
>  
> @@ -1287,14 +1564,13 @@ static const struct of_device_id dcc_match_table[] = {
>  MODULE_DEVICE_TABLE(of, dcc_match_table);
>  
>  static struct platform_driver dcc_driver = {
> -	.probe = dcc_probe,
>  	.remove	= dcc_remove,
>  	.driver	= {
>  		.name = "qcom-dcc",
>  		.of_match_table	= dcc_match_table,
>  	},
>  };
> -module_platform_driver(dcc_driver);
> +module_platform_driver_probe(dcc_driver, dcc_probe);

This change is unrelated to the others, and I don't see it mentioned
in your commit message.

Regards,
Bjorn

>  
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Qualcomm Technologies Inc. DCC driver");
> -- 
> 2.7.4
> 
