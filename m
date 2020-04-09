Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610311A3073
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 09:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgDIHvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 03:51:37 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:24820 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725881AbgDIHvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 03:51:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586418697; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xrWTTOY2ADY2AUD5EsjPbs7aUNyeVE/cj6sqUAzf9Pg=;
 b=oYMJtsSZC9XI4CNCDSgenVGTCXYQqGG4rypOQ17zhBdBLKf7mppYLD/HXw1AxwkQlrSZ/w2a
 PPc5qTwXPVtZ7pveiV6ssqE85UBa9gdCZAohE3/ydlPiAJ9ghcsSs4FI5dqskyf/lbGldIa5
 LB2tYlGDeUFVp7gLAb9aqgNGLsk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ed3f8.7f3eae4d8378-smtp-out-n04;
 Thu, 09 Apr 2020 07:51:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A84CBC433F2; Thu,  9 Apr 2020 07:51:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 960FDC433D2;
        Thu,  9 Apr 2020 07:51:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Apr 2020 13:21:18 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
In-Reply-To: <20200408224347.GA388414@ewhatever.cambridge.arm.com>
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
 <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
 <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
 <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
 <bd05b31c2391edfff5044f22f2f83edf@codeaurora.org>
 <e9c299c4-caeb-9eb8-f019-b311bfce756a@arm.com>
 <a7074f44ebbde720b5e0189801eab7c9@codeaurora.org>
 <20200408224347.GA388414@ewhatever.cambridge.arm.com>
Message-ID: <9ad167836b0a22694d58d24f39db89a6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-04-09 04:13, Suzuki K Poulose wrote:
> On Tue, Apr 07, 2020 at 08:48:54PM +0530, Sai Prakash Ranjan wrote:
> 
> Please find the untested patch below.
> 
> ---8>---
> 
> [untested] coresight: Fix support for sparse port numbers
> 
> On some systems the firmware may not describe all the ports
> connected to a component (e.g, for security reasons). This
> could be especially problematic for "funnels" where we could
> end up in modifying memory beyond the allocated space for
> refcounts.
> 
> e.g, for a funnel with input ports listed 0, 3, 5, nr_inport = 3.
> However the we could access refcnts[5] while checking for
> references.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../hwtracing/coresight/coresight-platform.c  | 74 ++++++++++++-------
>  drivers/hwtracing/coresight/coresight.c       |  8 +-
>  2 files changed, 56 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c
> b/drivers/hwtracing/coresight/coresight-platform.c
> index 3c5bee429105..1c610d6e944b 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -67,6 +67,7 @@ static void of_coresight_get_ports_legacy(const
> struct device_node *node,
>  					  int *nr_inport, int *nr_outport)
>  {
>  	struct device_node *ep = NULL;
> +	struct of_endpoint endpoint;
>  	int in = 0, out = 0;
> 
>  	do {
> @@ -74,10 +75,16 @@ static void of_coresight_get_ports_legacy(const
> struct device_node *node,
>  		if (!ep)
>  			break;
> 
> -		if (of_coresight_legacy_ep_is_input(ep))
> -			in++;
> -		else
> -			out++;
> +		if (of_graph_parse_endpoint(ep, &endpoint))
> +			continue;
> +
> +		if (of_coresight_legacy_ep_is_input(ep)) {
> +			in = (endpoint.port + 1 > in) ?
> +				endpoint.port + 1 : in;
> +		} else {
> +			out = (endpoint.port + 1) > out ?
> +				endpoint.port + 1 : out;
> +		}
> 
>  	} while (ep);
> 
> @@ -117,9 +124,16 @@ of_coresight_count_ports(struct device_node 
> *port_parent)
>  {
>  	int i = 0;
>  	struct device_node *ep = NULL;
> +	struct of_endpoint endpoint;
> +
> +	while ((ep = of_graph_get_next_endpoint(port_parent, ep))) {
> +		/* Defer error handling to parsing */
> +		if (of_graph_parse_endpoint(ep, &endpoint))
> +			continue;
> +		if (endpoint.port + 1 > i)
> +			i = endpoint.port + 1;
> +	}
> 
> -	while ((ep = of_graph_get_next_endpoint(port_parent, ep)))
> -		i++;
>  	return i;
>  }
> 
> @@ -171,14 +185,12 @@ static int of_coresight_get_cpu(struct device 
> *dev)
>   * Parses the local port, remote device name and the remote port.
>   *
>   * Returns :
> - *	 1	- If the parsing is successful and a connection record
> - *		  was created for an output connection.
>   *	 0	- If the parsing completed without any fatal errors.
>   *	-Errno	- Fatal error, abort the scanning.
>   */
>  static int of_coresight_parse_endpoint(struct device *dev,
>  				       struct device_node *ep,
> -				       struct coresight_connection *conn)
> +				       struct coresight_platform_data *pdata)
>  {
>  	int ret = 0;
>  	struct of_endpoint endpoint, rendpoint;
> @@ -186,6 +198,7 @@ static int of_coresight_parse_endpoint(struct 
> device *dev,
>  	struct device_node *rep = NULL;
>  	struct device *rdev = NULL;
>  	struct fwnode_handle *rdev_fwnode;
> +	struct coresight_connection *conn;
> 
>  	do {
>  		/* Parse the local port details */
> @@ -212,6 +225,12 @@ static int of_coresight_parse_endpoint(struct 
> device *dev,
>  			break;
>  		}
> 
> +		conn = &pdata->conns[endpoint.port];
> +		if (conn->child_fwnode) {
> +			dev_warn(dev, "Duplicate output port %d\n", endpoint.port);
> +			ret = -EINVAL;
> +			break;
> +		}
>  		conn->outport = endpoint.port;
>  		/*
>  		 * Hold the refcount to the target device. This could be
> @@ -224,7 +243,6 @@ static int of_coresight_parse_endpoint(struct 
> device *dev,
>  		conn->child_fwnode = fwnode_handle_get(rdev_fwnode);
>  		conn->child_port = rendpoint.port;
>  		/* Connection record updated */
> -		ret = 1;
>  	} while (0);
> 
>  	of_node_put(rparent);
> @@ -238,7 +256,6 @@ static int of_get_coresight_platform_data(struct
> device *dev,
>  					  struct coresight_platform_data *pdata)
>  {
>  	int ret = 0;
> -	struct coresight_connection *conn;
>  	struct device_node *ep = NULL;
>  	const struct device_node *parent = NULL;
>  	bool legacy_binding = false;
> @@ -267,8 +284,6 @@ static int of_get_coresight_platform_data(struct
> device *dev,
>  		dev_warn_once(dev, "Uses obsolete Coresight DT bindings\n");
>  	}
> 
> -	conn = pdata->conns;
> -
>  	/* Iterate through each output port to discover topology */
>  	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
>  		/*
> @@ -280,15 +295,9 @@ static int of_get_coresight_platform_data(struct
> device *dev,
>  		if (legacy_binding && of_coresight_legacy_ep_is_input(ep))
>  			continue;
> 
> -		ret = of_coresight_parse_endpoint(dev, ep, conn);
> -		switch (ret) {
> -		case 1:
> -			conn++;		/* Fall through */
> -		case 0:
> -			break;
> -		default:
> +		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> +		if (ret)
>  			return ret;
> -		}
>  	}
> 
>  	return 0;
> @@ -627,6 +636,11 @@ static int acpi_coresight_parse_link(struct
> acpi_device *adev,
>  		 *    coresight_remove_match().
>  		 */
>  		conn->child_fwnode = fwnode_handle_get(&r_adev->fwnode);
> +	} else if (dir == ACPI_CORESIGHT_LINK_SLAVE) {
> +		conn->child_port = fields[0].integer.value;
> +	} else {
> +		/* Invalid direction */
> +		return -EINVAL;
>  	}
> 
>  	return dir;
> @@ -672,10 +686,14 @@ static int acpi_coresight_parse_graph(struct
> acpi_device *adev,
>  			return dir;
> 
>  		if (dir == ACPI_CORESIGHT_LINK_MASTER) {
> -			pdata->nr_outport++;
> +			if (ptr->outport > pdata->nr_outport)
> +				pdata->nr_outport = ptr->outport;
>  			ptr++;
>  		} else {
> -			pdata->nr_inport++;
> +			WARN_ON(pdata->nr_inport == ptr->child_port);
> +			/* Do not move the ptr for input connections */
> +			if (ptr->child_port > pdata->nr_inport)
> +				pdata->nr_inport = ptr->child_port;
>  		}
>  	}
> 
> @@ -684,8 +702,13 @@ static int acpi_coresight_parse_graph(struct
> acpi_device *adev,
>  		return rc;
> 
>  	/* Copy the connection information to the final location */
> -	for (i = 0; i < pdata->nr_outport; i++)
> -		pdata->conns[i] = conns[i];
> +	for (i = 0; conns + i < ptr; i++) {
> +		int port = conns[i].outport;
> +
> +		/* Duplicate output port */
> +		WARN_ON(pdata->conns[port].child_fwnode);
> +		pdata->conns[port] = conns[i];
> +	}
> 
>  	devm_kfree(&adev->dev, conns);
>  	return 0;
> @@ -787,6 +810,7 @@ coresight_get_platform_data(struct device *dev)
>  		goto error;
> 
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	pdata->nr_outport = pdata->nr_inport = -1;
>  	if (!pdata) {
>  		ret = -ENOMEM;
>  		goto error;
> diff --git a/drivers/hwtracing/coresight/coresight.c
> b/drivers/hwtracing/coresight/coresight.c
> index ef20f74c85fa..f07bc0a7ab88 100644
> --- a/drivers/hwtracing/coresight/coresight.c
> +++ b/drivers/hwtracing/coresight/coresight.c
> @@ -990,6 +990,9 @@ static int coresight_orphan_match(struct device
> *dev, void *data)
>  	for (i = 0; i < i_csdev->pdata->nr_outport; i++) {
>  		conn = &i_csdev->pdata->conns[i];
> 
> +		/* Skip the port if FW doesn't describe it */
> +		if (!conn->child_fwnode)
> +			continue;
>  		/* We have found at least one orphan connection */
>  		if (conn->child_dev == NULL) {
>  			/* Does it match this newly added device? */
> @@ -1029,6 +1032,9 @@ static void coresight_fixup_device_conns(struct
> coresight_device *csdev)
>  		struct coresight_connection *conn = &csdev->pdata->conns[i];
>  		struct device *dev = NULL;
> 
> +		if (!conn->child_fwnode)
> +			continue;
> +
>  		dev = bus_find_device_by_fwnode(&coresight_bustype, 
> conn->child_fwnode);
>  		if (dev) {
>  			conn->child_dev = to_coresight_device(dev);
> @@ -1061,7 +1067,7 @@ static int coresight_remove_match(struct device
> *dev, void *data)
>  	for (i = 0; i < iterator->pdata->nr_outport; i++) {
>  		conn = &iterator->pdata->conns[i];
> 
> -		if (conn->child_dev == NULL)
> +		if (conn->child_dev == NULL || conn->child_fwnode == NULL)
>  			continue;
> 
>  		if (csdev->dev.fwnode == conn->child_fwnode) {


Thanks Suzuki, I don't see the KASAN warning anymore with this patch.
But somehow tmc_etr probe fails with error -12(ENOMEM).

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
