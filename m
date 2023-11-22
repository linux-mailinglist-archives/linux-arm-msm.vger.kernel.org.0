Return-Path: <linux-arm-msm+bounces-1486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A647F43B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11DC71C20932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B24154BC9;
	Wed, 22 Nov 2023 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6Sz6Ql6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3954678;
	Wed, 22 Nov 2023 10:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6440FC433CB;
	Wed, 22 Nov 2023 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700648633;
	bh=5JFmWxBStUIwtcpE4a7iMXC7TQRXmaVsmPRCDYfT7Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6Sz6Ql6Y6J1hurU5+4b3dfhwhormMAILKpthC/KYgI0IRhlo4GJ/avi8kiUR0gkS
	 vDSQNAqNg12AbSZyvpadGUuDu3DjOv/8fFJ76G9JvRJO5Zv1qgaox4HvGO38xo3mxp
	 exhlZgduMJdFgKgInta0zZPOD6zewO8gjYQKclNo1Iqiq+wq6OP8Ie4gdLfQCMrE3n
	 3/YZgrVngwtyiBdeea45F7w81pyVoRnkP+Km5jdVeE1iZ5R4ohrUJQZcwlgRmmqNpX
	 sj2f5gD5LSan8ocQWwdN71X6bjVBsEmCuggaEC0r/fEx/Ox1RnSEd//aYxrS0682Wx
	 wmZCPMriHyMuw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5kOt-0008L3-0g;
	Wed, 22 Nov 2023 11:24:07 +0100
Date: Wed, 22 Nov 2023 11:24:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH 03/12] usb: dwc3: qcom: Merge resources from urs_usb
 device
Message-ID: <ZV3WxwxmqH8wRo0A@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-3-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-3-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:11PM -0700, Bjorn Andersson wrote:
> With some ACPI DSDT tables, such as the one found in SC8180X devices,
> the USB resources are split between the URSn and it's child USBn device
> nodes, in particular the interrupts are placed in the child nodes.
> 
> The solution that was chosen for handling this is to allocate a
> platform_device from the child node and selectively pick interrupts
> from the main platform_device, or from this created child device, when
> creating the platform_device for the DWC3 core.
> 
> This does however not work with the upcoming change where the DWC3 core
> is instantiated from the same platform_device as the glue, as the DRD
> and host code will attempt to resolve their interrupts from the shared
> device, and not the child device.
> 
> Work around this by merging the resources of the child device into the
> glue device node, to present a single platform_device with all the
> resources necessary.

Nice approach.

An alternative would be to drop ACPI support completely as Konrad
suggested. Should simplify both this series and the multiport one.

Is anyone really using the ACPI support here anymore?

> -static struct platform_device *
> -dwc3_qcom_create_urs_usb_platdev(struct device *dev)
> +static int dwc3_qcom_acpi_merge_urs_resources(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
> +	struct list_head resource_list;
> +	struct resource_entry *rentry;
> +	struct resource *resources;
>  	struct fwnode_handle *fwh;
>  	struct acpi_device *adev;
>  	char name[8];
> +	int count;
>  	int ret;
>  	int id;
> +	int i;
>  
>  	/* Figure out device id */
>  	ret = sscanf(fwnode_get_name(dev->fwnode), "URS%d", &id);
>  	if (!ret)
> -		return NULL;
> +		return -EINVAL;
>  
>  	/* Find the child using name */
>  	snprintf(name, sizeof(name), "USB%d", id);
>  	fwh = fwnode_get_named_child_node(dev->fwnode, name);
>  	if (!fwh)
> -		return NULL;
> +		return 0;
>  
>  	adev = to_acpi_device_node(fwh);
>  	if (!adev)
> -		return NULL;
> +		return -EINVAL;

This is currently leaking a reference to the fwnode, I fixed that up
here:

	https://lore.kernel.org/linux-usb/20231117173650.21161-4-johan+linaro@kernel.org/

> +	INIT_LIST_HEAD(&resource_list);
> +
> +	count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
> +	if (count <= 0)
> +		return count;
> +
> +	count += pdev->num_resources;
> +
> +	resources = kcalloc(count, sizeof(*resources), GFP_KERNEL);
> +	if (!resources) {
> +		acpi_dev_free_resource_list(&resource_list);
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(resources, pdev->resource, sizeof(struct resource) * pdev->num_resources);
> +	count = pdev->num_resources;
> +	list_for_each_entry(rentry, &resource_list, node) {
> +		/* Avoid inserting duplicate entries, in case this is called more than once */

Either shorten this one or make it a multiline comment to stay within 80
chars.

> +		for (i = 0; i < count; i++) {

Should this not be pdev->num_resources?

> +			if (resource_type(&resources[i]) == resource_type(rentry->res) &&
> +			    resources[i].start == rentry->res->start &&
> +			    resources[i].end == rentry->res->end)
> +				break;
> +		}
> +
> +		if (i == count)

Same here.

> +			resources[count++] = *rentry->res;
> +	}
>  
> -	return acpi_create_platform_device(adev, NULL);
> +	ret = platform_device_add_resources(pdev, resources, count);
> +	if (ret)
> +		dev_err(&pdev->dev, "failed to add resources\n");
> +
> +	acpi_dev_free_resource_list(&resource_list);
> +	kfree(resources);
> +
> +	return ret;
>  }
>  
>  static int dwc3_qcom_probe(struct platform_device *pdev)
> @@ -817,6 +853,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "no supporting ACPI device data\n");
>  			return -EINVAL;
>  		}
> +
> +		if (qcom->acpi_pdata->is_urs) {
> +			ret = dwc3_qcom_acpi_merge_urs_resources(pdev);
> +			if (ret < 0)
> +				goto clk_disable;

The clocks have not been enabled here, just return ret.

> +		}
>  	}
>  
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
> @@ -857,18 +899,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->acpi_pdata->qscratch_base_offset;
>  		parent_res->end = parent_res->start +
>  			qcom->acpi_pdata->qscratch_base_size;
> -
> -		if (qcom->acpi_pdata->is_urs) {
> -			qcom->urs_usb = dwc3_qcom_create_urs_usb_platdev(dev);
> -			if (IS_ERR_OR_NULL(qcom->urs_usb)) {
> -				dev_err(dev, "failed to create URS USB platdev\n");
> -				if (!qcom->urs_usb)
> -					ret = -ENODEV;
> -				else
> -					ret = PTR_ERR(qcom->urs_usb);
> -				goto clk_disable;
> -			}
> -		}
>  	}
>  
>  	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);

Johan

