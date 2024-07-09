Return-Path: <linux-arm-msm+bounces-25651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840992BBA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52BE21C221AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB2C15ECCD;
	Tue,  9 Jul 2024 13:43:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28015FA78;
	Tue,  9 Jul 2024 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532586; cv=none; b=luO8rqcul81sUQvxWXfHrS12wYQxETkLwollUF9i9uyIFWTDbqUtRiGBatRRrqtrooGLLhaZLFaFx94Tx+eUcrY1Hj2yIICLWXbAlNJPu0vP/25hyCWH8T+339WNBvwdq5w9Uv+Ji2Bz3upRNQbM+aYvRqkx47JQ2+ZYNUAPagk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532586; c=relaxed/simple;
	bh=K1QCnYS7irbKQpozMKsnBUXKg+f/3Bee2dMpwIP7tf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CF5YW438l6vKw9+2Rk1Y7N6Je3WV+6wpVID5IcPgG9GSIiIilIHq4ISAFo+MkBwuGho0cFPwUI48q/G+tEvMA1sni3K/isq82r9vCgAWCYXcX1tUic3hiWDJbngxzNIKWlqdojUUBVzDiuwwMkZEht9SnoN+zDOH3hIWFGy6Kck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B59DD153B;
	Tue,  9 Jul 2024 06:43:27 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135343F766;
	Tue,  9 Jul 2024 06:42:58 -0700 (PDT)
Message-ID: <8254b93b-0d18-4bd9-817b-b885de6a480d@arm.com>
Date: Tue, 9 Jul 2024 14:42:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: Add source filtering for multi-port
 output
Content-Language: en-GB
To: Tao Zhang <quic_taozha@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>, james.clark@linaro.org
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-3-quic_taozha@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240705085152.9063-3-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2024 09:51, Tao Zhang wrote:
> In order to enable the output ports of multi-port output devices,
> such as static replicator, to correspond to designated sources,
> a mechanism for filtering data sources is introduced for the
> output ports.
> 
> The specified source will be marked like below in the Devicetree.
> test-replicator {
>      ... ... ... ...
>      out-ports {
>          ... ... ... ...
>          port@0 {
>              reg = <0>;
>              xxx: endpoint {
>                  remote-endpoint = <&xxx>;
>                  filter_src = <&xxx>; <-- To specify the source to
>              };                           be filtered out here.
>          };
> 
>          port@1 {
>              reg = <1>;
>              yyy: endpoint {
>                  remote-endpoint = <&yyy>;
>                  filter_src = <&yyy>; <-- To specify the source to
>              };                           be filtered out here.
>          };
>      };
> };
> 
> Then driver will find the expected source marked in the Devicetree, and
> save it to the coresight path. When the function needs to filter the
> source, it could obtain it from coresight path parameter. Finally,
> the output port knows which source it corresponds to, and it also knows
> which input port it corresponds to.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 89 ++++++++++++++++---
>   .../hwtracing/coresight/coresight-platform.c  | 13 +++
>   include/linux/coresight.h                     |  5 ++
>   3 files changed, 94 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 5dde597403b3..1c58b64f0031 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -113,15 +113,62 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>   
> +static struct coresight_device *coresight_get_source(struct list_head *path)
> +{
> +	struct coresight_device *csdev;
> +
> +	if (!path)
> +		return NULL;
> +
> +	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
> +	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE)
> +		return NULL;
> +
> +	return csdev;
> +}
> +
> +/**
> + * coresight_source_filter - checks whether the connection matches the source
> + * of path if connection is binded to specific source.
> + * @path:	The list of devices
> + * @conn:	The connection of one outport
> + *
> + * Return zero if the connection doesn't have a source binded or source of the
> + * path matches the source binds to connection.
> + */
> +static int coresight_source_filter(struct list_head *path,

Instead of path, you may need to switch to "source" device. See below.

> +			struct coresight_connection *conn)
> +{
> +	int ret = 0;
> +	struct coresight_device *source = NULL;
> +
> +	if (!conn->filter_src_dev)
> +		return ret;
> +
> +	source = coresight_get_source(path);
> +	if (!source)
> +		return ret;
> +
> +	if (conn->filter_src_dev == source)
> +		ret = 0;
> +	else
> +		ret = -1;
> +
> +	return ret;
> +}
> +
>   static struct coresight_connection *
>   coresight_find_out_connection(struct coresight_device *src_dev,
> -			      struct coresight_device *dest_dev)
> +			      struct coresight_device *dest_dev,
> +			      struct list_head *path)
>   {
>   	int i;
>   	struct coresight_connection *conn;
>   
>   	for (i = 0; i < src_dev->pdata->nr_outconns; i++) {
>   		conn = src_dev->pdata->out_conns[i];
> +		if (coresight_source_filter(path, conn))
> +			continue;
>   		if (conn->dest_dev == dest_dev)
>   			return conn;
>   	}
> @@ -312,7 +359,8 @@ static void coresight_disable_sink(struct coresight_device *csdev)
>   
>   static int coresight_enable_link(struct coresight_device *csdev,
>   				 struct coresight_device *parent,
> -				 struct coresight_device *child)
> +				 struct coresight_device *child,
> +				 struct list_head *path)
>   {
>   	int ret = 0;
>   	int link_subtype;
> @@ -321,8 +369,8 @@ static int coresight_enable_link(struct coresight_device *csdev,
>   	if (!parent || !child)
>   		return -EINVAL;
>   
> -	inconn = coresight_find_out_connection(parent, csdev);
> -	outconn = coresight_find_out_connection(csdev, child);
> +	inconn = coresight_find_out_connection(parent, csdev, path);
> +	outconn = coresight_find_out_connection(csdev, child, path);
>   	link_subtype = csdev->subtype.link_subtype;
>   
>   	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && IS_ERR(inconn))
> @@ -341,7 +389,8 @@ static int coresight_enable_link(struct coresight_device *csdev,
>   
>   static void coresight_disable_link(struct coresight_device *csdev,
>   				   struct coresight_device *parent,
> -				   struct coresight_device *child)
> +				   struct coresight_device *child,
> +				   struct list_head *path)
>   {
>   	int i;
>   	int link_subtype;
> @@ -350,8 +399,8 @@ static void coresight_disable_link(struct coresight_device *csdev,
>   	if (!parent || !child)
>   		return;
>   
> -	inconn = coresight_find_out_connection(parent, csdev);
> -	outconn = coresight_find_out_connection(csdev, child);
> +	inconn = coresight_find_out_connection(parent, csdev, path);
> +	outconn = coresight_find_out_connection(csdev, child, path);
>   	link_subtype = csdev->subtype.link_subtype;
>   
>   	if (link_ops(csdev)->disable) {
> @@ -507,7 +556,7 @@ static void coresight_disable_path_from(struct list_head *path,
>   		case CORESIGHT_DEV_TYPE_LINK:
>   			parent = list_prev_entry(nd, link)->csdev;
>   			child = list_next_entry(nd, link)->csdev;
> -			coresight_disable_link(csdev, parent, child);
> +			coresight_disable_link(csdev, parent, child, path);
>   			break;

Disable path from could be called with a "partial path" with the
"source" stripped off. e.g, if the enabling of the components failed
mid-point in the path. So, source_from_path() above is WRONG csdev.
Instead you should make sure we pass the "source", which must be
available with the caller.


>   		default:
>   			break;
> @@ -588,7 +637,7 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>   		case CORESIGHT_DEV_TYPE_LINK:
>   			parent = list_prev_entry(nd, link)->csdev;
>   			child = list_next_entry(nd, link)->csdev;
> -			ret = coresight_enable_link(csdev, parent, child);
> +			ret = coresight_enable_link(csdev, parent, child, path);
>   			if (ret)
>   				goto err;
>   			break;
> @@ -802,7 +851,8 @@ static void coresight_drop_device(struct coresight_device *csdev)
>    */
>   static int _coresight_build_path(struct coresight_device *csdev,
>   				 struct coresight_device *sink,
> -				 struct list_head *path)
> +				 struct list_head *path,
> +				 struct coresight_device *trace_source)
>   {
>   	int i, ret;
>   	bool found = false;
> @@ -814,7 +864,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   
>   	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
>   	    sink == per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev))) {
> -		if (_coresight_build_path(sink, sink, path) == 0) {
> +		if (_coresight_build_path(sink, sink, path, trace_source) == 0) {
>   			found = true;
>   			goto out;
>   		}
> @@ -825,8 +875,13 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   		struct coresight_device *child_dev;
>   
>   		child_dev = csdev->pdata->out_conns[i]->dest_dev;
> +
> +		if (csdev->pdata->out_conns[i]->filter_src_dev
> +		    && (csdev->pdata->out_conns[i]->filter_src_dev != trace_source))
> +			continue;
> +
>   		if (child_dev &&
> -		    _coresight_build_path(child_dev, sink, path) == 0) {
> +		    _coresight_build_path(child_dev, sink, path, trace_source) == 0) {
>   			found = true;
>   			break;
>   		}
> @@ -871,7 +926,7 @@ struct list_head *coresight_build_path(struct coresight_device *source,
>   
>   	INIT_LIST_HEAD(path);
>   
> -	rc = _coresight_build_path(source, sink, path);
> +	rc = _coresight_build_path(source, sink, path, source);
>   	if (rc) {
>   		kfree(path);
>   		return ERR_PTR(rc);
> @@ -1395,6 +1450,9 @@ static int coresight_orphan_match(struct device *dev, void *data)
>   			/* This component still has an orphan */
>   			still_orphan = true;
>   		}
> +		if ((conn->filter_src_fwnode) && dst_csdev
> +		    && (conn->filter_src_fwnode == dst_csdev->dev.fwnode))
> +			conn->filter_src_dev = dst_csdev;
>   	}
>   
>   	src_csdev->orphan = still_orphan;
> @@ -1424,6 +1482,11 @@ static void coresight_remove_conns(struct coresight_device *csdev)
>   	 */
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>   		conn = csdev->pdata->out_conns[i];
> +		if (conn->filter_src_dev) {
> +			conn->filter_src_dev = NULL;
> +			conn->filter_src_fwnode = NULL;
> +		}
> +

Similarly we should reset the "filter_src_dev" if the "src" csdev is
being removed.  You may need a new function for that, which scans
through all devices and looks for a conn->filter_src_dev == csdev.
Something like:



>   		if (!conn->dest_dev)
>   			continue;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 9d550f5697fa..a9f5b0700310 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -243,6 +243,19 @@ static int of_coresight_parse_endpoint(struct device *dev,
>   		conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
>   		conn.dest_port = rendpoint.port;
>   
> +		/*
> +		 * Get the firmware node of the filter source through the
> +		 * reference. This could be used to filter the source in
> +		 * building path.
> +		 */
> +		conn.filter_src_fwnode =
> +			fwnode_find_reference(&ep->fwnode, "filter_src", 0);
> +		if (IS_ERR(conn.filter_src_fwnode))
> +			conn.filter_src_fwnode = NULL;
> +		else
> +			conn.filter_src_dev =
> +			 coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);

We should warn, if the filter_src_dev is of not the type DEV_TYPE_SOURCE.

> +
>   		new_conn = coresight_add_out_conn(dev, pdata, &conn);
>   		if (IS_ERR_VALUE(new_conn)) {
>   			fwnode_handle_put(conn.dest_fwnode);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index e8b6e388218c..0a7ec0978605 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -171,6 +171,9 @@ struct coresight_desc {
>    * @dest_dev:	a @coresight_device representation of the component
>   		connected to @src_port. NULL until the device is created
>    * @link: Representation of the connection as a sysfs link.
> + * @filter_src_fwnode: filter source component's fwnode handle.
> + * @filter_src_dev: a @coresight_device representation of the component that
> +		needs to be filtered.
>    *
>    * The full connection structure looks like this, where in_conns store
>    * references to same connection as the source device's out_conns.
> @@ -199,6 +202,8 @@ struct coresight_connection {
>   	struct coresight_device *dest_dev;
>   	struct coresight_sysfs_link *link;
>   	struct coresight_device *src_dev;
> +	struct fwnode_handle *filter_src_fwnode;
> +	struct coresight_device *filter_src_dev;
>   	atomic_t src_refcnt;
>   	atomic_t dest_refcnt;
>   };

Suzuki


