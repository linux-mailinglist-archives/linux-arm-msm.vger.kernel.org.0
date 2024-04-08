Return-Path: <linux-arm-msm+bounces-16806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3889C2A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 15:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2401C21E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 13:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ADC8061F;
	Mon,  8 Apr 2024 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxHfJGpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E780603
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712582939; cv=none; b=t+ygY3N8t7UpJ4bpFd7s9a6UZaOfqq/5Dbsw1vg4hzoL2Qf1cWJniflZVQ961RSVOJAK/N2OUY6aPO0iEP2TBN/5Oah9B8Fvxzxl9z8WGcWXd+dWnqCPSN9Ei7c5tHIVF9I6ogbE5/4j801nSzMNSKBEgAAw0P5ScVj86UFk1to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712582939; c=relaxed/simple;
	bh=c3bcYPH8cKOfU8LeqAkSpeapOprkIO8IdRdgOkvDSJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh2WHITM6RPEx6co7XnQf24F17oDygcpYcaOXKAEuFrNyq1Zh/0RbohkoIh3tXuaH9Q7Njt2eqKAg5ivgODonzwUdBKMj+3XW1lvYi77GEN9DU/eW23FikjlurKoGUhaO5INtunhiPd1WHV8EVkOXv+csv5ZBVZFT2Ks24TnZ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxHfJGpf; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso3191346a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712582936; x=1713187736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=arKMjWP9roAHegrN3zs4cRJ6a4jU7sjNs1NHFOpDfSk=;
        b=cxHfJGpfpDpHuVdDBQjmH7S2h092/BmeOE5r1lb2Hi/qAf4cbzorgbYWjn/+UMHZLk
         W1Ci15AncDrIKQQFIz2tMCe8giNqTkU/wlqgNUsT7cuK2buQnc5iVvOi9EcF3bdqQLTi
         iwjrtnKUPOtFI+PoKvipw1bBAIhej5Byt1O5dv3ki57KRdIIUKYvBHgs91/0wmtVTTQW
         ADi3GduKtO6fUA1U9xvNeJlRGb9jIrTTPMKsSpJ3ZbOzLec8vYXRXNCRtHEm8EqmQJLJ
         WPot8WmgfBfNcK4elphGFI2aK8j9BZUmjzQkLS5s007gh/kVGA2khkYxyj6TmDTiWPZL
         7zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582936; x=1713187736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arKMjWP9roAHegrN3zs4cRJ6a4jU7sjNs1NHFOpDfSk=;
        b=cmfWO0BHgTX4/0geozWv/2D8NKUpS3F1X94VJKqgQg+4zHBZUpBx/HcsAQ9g5+tTju
         yx5Lcs/97wwCEHa3tUsxBxBsLYItHYayRle1MXqSG02qzOre/7W+2xnedBK2EzAm5qH1
         2j8LEQZH55XKMZgejoiyFmOUjNwk6SNGmyKZzxCt14PMmW0hAZwVCnIrJN0QXj+CvUog
         fkDye+goGBiokSWak303P1sL9Pb/h8YiG37o4O66MzU9CQM0hCCImcXFEiSiMiZKB1aX
         hRed758XfNYPcRwvofFIAZtJHYgrjTTPiV179dewFDBcjYwYXSYClunfg+1UBrukgbxI
         eWuw==
X-Forwarded-Encrypted: i=1; AJvYcCULJCrRLzSEUmL/eDDhLpOXrr/8oVxbmtl/cqN8kjZ15y4zwieQXUSbuf5NQHn5ewFWGEYRHC5T2RD+oJcjdr7t4Xyju4mle9aOscag1Q==
X-Gm-Message-State: AOJu0Yxj8lWG92fsRXDt+Hv5c6Js+siw+dd40aCwkl9eV/C7Wg9X0Jkg
	2vsjmxYNu9F0x7nU+QVLoBmVXubJdZihtqG346U6PsYvCqYMcYQJslS6FNuv7cNO8iXw1IN25FP
	ZcLEo5vdTkw2ILj1Skn70HPlDLm0Bgc32jgHi4g==
X-Google-Smtp-Source: AGHT+IFaPBzK+DllLD8jOm2vrPrnjJqDhee94sQFIFxUjDg6mWcqHAeDY1Cn+x/SkqZx1tLbuP0TbiH837JpPzCDLEI=
X-Received: by 2002:a17:90b:4004:b0:2a2:9f46:439 with SMTP id
 ie4-20020a17090b400400b002a29f460439mr6962873pjb.9.1712582936227; Mon, 08 Apr
 2024 06:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1711009927-17873-1-git-send-email-quic_taozha@quicinc.com>
 <1711009927-17873-3-git-send-email-quic_taozha@quicinc.com>
 <8d381e6e-9328-46ff-83fe-efbe5bb4363e@arm.com> <ffce4577-b0f9-4af3-a379-0385a02ddae8@quicinc.com>
In-Reply-To: <ffce4577-b0f9-4af3-a379-0385a02ddae8@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 8 Apr 2024 14:28:45 +0100
Message-ID: <CAJ9a7VieUqm_Qakqqsm9F=znqunu8EMaccKxzRWMz244NiHpqQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] coresight: Add support for multiple output ports on
 the funnel
To: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konradybcio@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	Leo Yan <leo.yan@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Song Chai <quic_songchai@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tao,

Using a DT label in this way is not how connections should be
described in device tree, The association needs to be between the
input and output ports of the component not and extra link back to the
source.

If your "funnel"  has multiple input and output ports, then it is no
longer a funnel.  As you describe it - the input ports are statically
associated with an output port, so the device is effectively a set of
individual funnels.
Given that the association between the inputs and outputs is known at
time of compilation - then these can be inferred from the components
compatible string and handled internally during driver probe.

This component should therefore really have its own driver, and not be
described as a standard  funnel. In this way you can handle the input
and output associations within the driver and create a path in the
normal way, avoiding the need for large changes to the coresight API.
Having a specific driver will allow creation of sets of associated
input and output connections.

Regards

Mike







On Fri, 29 Mar 2024 at 09:27, Tao Zhang <quic_taozha@quicinc.com> wrote:
>
>
> On 3/22/2024 12:41 AM, Suzuki K Poulose wrote:
> > On 21/03/2024 08:32, Tao Zhang wrote:
> >> Funnel devices are now capable of supporting multiple-inputs and
> >> multiple-outputs configuration with in built hardware filtering
> >> for TPDM devices. Add software support to this function. Output
> >> port is selected according to the source in the trace path.
> >>
> >> The source of the input port on funnels will be marked in the
> >> device tree.
> >> e.g.
> >> tpdm@xxxxxxx {
> >>      ... ... ... ...
> >> };
> >>
> >> funnel_XXX: funnel@xxxxxxx {
> >>      ... ... ... ...
> >>      out-ports {
> >>          ... ... ... ...
> >>          port@x {
> >>              ... ... ... ...
> >>              label = "xxxxxxx.tpdm"; <-- To label the source
> >>          };                           corresponding to the output
> >>      ... ... ... ...                  connection "port@x". And this
> >>      };                               is a hardware static connections.
> >>      ... ... ... ...                  Here needs to refer to hardware
> >> };                                   design.
> >>
> >> Then driver will parse the source label marked in the device tree, and
> >> save it to the coresight path. When the function needs to know the
> >> source label, it could obtain it from coresight path parameter. Finally,
> >> the output port knows which source it corresponds to, and it also knows
> >> which input port it corresponds to.
> >
> > Why do we need labels ? We have connection information for all devices
> > (both in and out), so, why do we need this label to find a device ?
>
> Because our funnel's design has multi-output ports, the data stream will not
>
> know which output port should pass in building the data trace path. This
> source
>
> label can make the data stream find the right output port to go.
>
> >
> > And also, I thought TPDM is a source device, why does a funnel output
> > port link to a source ?
>
> No, this label doesn't mean this funnel output port link to a source, it
> just let
>
> the output port know its data source.
>
> >
> > Are these funnels programmable ? Or, are they static ? If they are
> > static, do these need to be described in the DT ? If they are simply
> > acting as a "LINK" (or HWFIFO ?)
>
> These funnels are static, and we will add the "label" to the DT to
> describe the
>
> multi-output ports for these funnels.
>
> "If they are simply acting as a "LINK" (or HWFIFO ?) " I'm not sure
> what's the meaning
>
> of this. Could you describe it in detail?
>
>
> Best,
>
> Tao
>
> >
> > Suzuki
> >
> >>
> >> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> >> ---
> >>   drivers/hwtracing/coresight/coresight-core.c  | 81 ++++++++++++++++---
> >>   .../hwtracing/coresight/coresight-platform.c  |  5 ++
> >>   include/linux/coresight.h                     |  2 +
> >>   3 files changed, 75 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-core.c
> >> b/drivers/hwtracing/coresight/coresight-core.c
> >> index 5dde597403b3..b1b5e6d9ec7a 100644
> >> --- a/drivers/hwtracing/coresight/coresight-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-core.c
> >> @@ -113,15 +113,63 @@ struct coresight_device
> >> *coresight_get_percpu_sink(int cpu)
> >>   }
> >>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
> >>   +static struct coresight_device *coresight_get_source(struct
> >> list_head *path)
> >> +{
> >> +    struct coresight_device *csdev;
> >> +
> >> +    if (!path)
> >> +        return NULL;
> >> +
> >> +    csdev = list_first_entry(path, struct coresight_node, link)->csdev;
> >> +    if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE)
> >> +        return NULL;
> >> +
> >> +    return csdev;
> >> +}
> >> +
> >> +/**
> >> + * coresight_source_filter - checks whether the connection matches
> >> the source
> >> + * of path if connection is binded to specific source.
> >> + * @path:    The list of devices
> >> + * @conn:    The connection of one outport
> >> + *
> >> + * Return zero if the connection doesn't have a source binded or
> >> source of the
> >> + * path matches the source binds to connection.
> >> + */
> >> +static int coresight_source_filter(struct list_head *path,
> >> +            struct coresight_connection *conn)
> >> +{
> >> +    int ret = 0;
> >> +    struct coresight_device *source = NULL;
> >> +
> >> +    if (conn->source_label == NULL)
> >> +        return ret;
> >> +
> >> +    source = coresight_get_source(path);
> >> +    if (source == NULL)
> >> +        return ret;
> >> +
> >> +    if (strstr(kobject_get_path(&source->dev.kobj, GFP_KERNEL),
> >> +            conn->source_label))
> >> +        ret = 0;
> >> +    else
> >> +        ret = -1;
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   static struct coresight_connection *
> >>   coresight_find_out_connection(struct coresight_device *src_dev,
> >> -                  struct coresight_device *dest_dev)
> >> +                  struct coresight_device *dest_dev,
> >> +                  struct list_head *path)
> >>   {
> >>       int i;
> >>       struct coresight_connection *conn;
> >>         for (i = 0; i < src_dev->pdata->nr_outconns; i++) {
> >>           conn = src_dev->pdata->out_conns[i];
> >> +        if (coresight_source_filter(path, conn))
> >> +            continue;
> >>           if (conn->dest_dev == dest_dev)
> >>               return conn;
> >>       }
> >> @@ -312,7 +360,8 @@ static void coresight_disable_sink(struct
> >> coresight_device *csdev)
> >>     static int coresight_enable_link(struct coresight_device *csdev,
> >>                    struct coresight_device *parent,
> >> -                 struct coresight_device *child)
> >> +                 struct coresight_device *child,
> >> +                 struct list_head *path)
> >>   {
> >>       int ret = 0;
> >>       int link_subtype;
> >> @@ -321,8 +370,8 @@ static int coresight_enable_link(struct
> >> coresight_device *csdev,
> >>       if (!parent || !child)
> >>           return -EINVAL;
> >>   -    inconn = coresight_find_out_connection(parent, csdev);
> >> -    outconn = coresight_find_out_connection(csdev, child);
> >> +    inconn = coresight_find_out_connection(parent, csdev, path);
> >> +    outconn = coresight_find_out_connection(csdev, child, path);
> >>       link_subtype = csdev->subtype.link_subtype;
> >>         if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG &&
> >> IS_ERR(inconn))
> >> @@ -341,7 +390,8 @@ static int coresight_enable_link(struct
> >> coresight_device *csdev,
> >>     static void coresight_disable_link(struct coresight_device *csdev,
> >>                      struct coresight_device *parent,
> >> -                   struct coresight_device *child)
> >> +                   struct coresight_device *child,
> >> +                   struct list_head *path)
> >>   {
> >>       int i;
> >>       int link_subtype;
> >> @@ -350,8 +400,8 @@ static void coresight_disable_link(struct
> >> coresight_device *csdev,
> >>       if (!parent || !child)
> >>           return;
> >>   -    inconn = coresight_find_out_connection(parent, csdev);
> >> -    outconn = coresight_find_out_connection(csdev, child);
> >> +    inconn = coresight_find_out_connection(parent, csdev, path);
> >> +    outconn = coresight_find_out_connection(csdev, child, path);
> >>       link_subtype = csdev->subtype.link_subtype;
> >>         if (link_ops(csdev)->disable) {
> >> @@ -507,7 +557,7 @@ static void coresight_disable_path_from(struct
> >> list_head *path,
> >>           case CORESIGHT_DEV_TYPE_LINK:
> >>               parent = list_prev_entry(nd, link)->csdev;
> >>               child = list_next_entry(nd, link)->csdev;
> >> -            coresight_disable_link(csdev, parent, child);
> >> +            coresight_disable_link(csdev, parent, child, path);
> >>               break;
> >>           default:
> >>               break;
> >> @@ -588,7 +638,7 @@ int coresight_enable_path(struct list_head *path,
> >> enum cs_mode mode,
> >>           case CORESIGHT_DEV_TYPE_LINK:
> >>               parent = list_prev_entry(nd, link)->csdev;
> >>               child = list_next_entry(nd, link)->csdev;
> >> -            ret = coresight_enable_link(csdev, parent, child);
> >> +            ret = coresight_enable_link(csdev, parent, child, path);
> >>               if (ret)
> >>                   goto err;
> >>               break;
> >> @@ -802,7 +852,8 @@ static void coresight_drop_device(struct
> >> coresight_device *csdev)
> >>    */
> >>   static int _coresight_build_path(struct coresight_device *csdev,
> >>                    struct coresight_device *sink,
> >> -                 struct list_head *path)
> >> +                 struct list_head *path,
> >> +                 struct coresight_device *source)
> >>   {
> >>       int i, ret;
> >>       bool found = false;
> >> @@ -814,7 +865,7 @@ static int _coresight_build_path(struct
> >> coresight_device *csdev,
> >>         if (coresight_is_percpu_source(csdev) &&
> >> coresight_is_percpu_sink(sink) &&
> >>           sink == per_cpu(csdev_sink,
> >> source_ops(csdev)->cpu_id(csdev))) {
> >> -        if (_coresight_build_path(sink, sink, path) == 0) {
> >> +        if (_coresight_build_path(sink, sink, path, source) == 0) {
> >>               found = true;
> >>               goto out;
> >>           }
> >> @@ -825,8 +876,12 @@ static int _coresight_build_path(struct
> >> coresight_device *csdev,
> >>           struct coresight_device *child_dev;
> >>             child_dev = csdev->pdata->out_conns[i]->dest_dev;
> >> +        if (csdev->pdata->out_conns[i]->source_label &&
> >> +            !strstr(kobject_get_path(&source->dev.kobj, GFP_KERNEL),
> >> + csdev->pdata->out_conns[i]->source_label))
> >> +            continue;
> >>           if (child_dev &&
> >> -            _coresight_build_path(child_dev, sink, path) == 0) {
> >> +            _coresight_build_path(child_dev, sink, path, source) ==
> >> 0) {
> >>               found = true;
> >>               break;
> >>           }
> >> @@ -871,7 +926,7 @@ struct list_head *coresight_build_path(struct
> >> coresight_device *source,
> >>         INIT_LIST_HEAD(path);
> >>   -    rc = _coresight_build_path(source, sink, path);
> >> +    rc = _coresight_build_path(source, sink, path, source);
> >>       if (rc) {
> >>           kfree(path);
> >>           return ERR_PTR(rc);
> >> diff --git a/drivers/hwtracing/coresight/coresight-platform.c
> >> b/drivers/hwtracing/coresight/coresight-platform.c
> >> index 9d550f5697fa..f553fb20966d 100644
> >> --- a/drivers/hwtracing/coresight/coresight-platform.c
> >> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> >> @@ -205,6 +205,7 @@ static int of_coresight_parse_endpoint(struct
> >> device *dev,
> >>       struct fwnode_handle *rdev_fwnode;
> >>       struct coresight_connection conn = {};
> >>       struct coresight_connection *new_conn;
> >> +    const char *label;
> >>         do {
> >>           /* Parse the local port details */
> >> @@ -243,6 +244,10 @@ static int of_coresight_parse_endpoint(struct
> >> device *dev,
> >>           conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
> >>           conn.dest_port = rendpoint.port;
> >>   +        conn.source_label = NULL;
> >> +        if (!of_property_read_string(ep, "label", &label))
> >> +            conn.source_label = label;
> >> +
> >>           new_conn = coresight_add_out_conn(dev, pdata, &conn);
> >>           if (IS_ERR_VALUE(new_conn)) {
> >>               fwnode_handle_put(conn.dest_fwnode);
> >> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> >> index e8b6e388218c..a9c06ef9bbb2 100644
> >> --- a/include/linux/coresight.h
> >> +++ b/include/linux/coresight.h
> >> @@ -167,6 +167,7 @@ struct coresight_desc {
> >>    * struct coresight_connection - representation of a single connection
> >>    * @src_port:    a connection's output port number.
> >>    * @dest_port:    destination's input port number @src_port is
> >> connected to.
> >> + * @source_label: source component's label.
> >>    * @dest_fwnode: destination component's fwnode handle.
> >>    * @dest_dev:    a @coresight_device representation of the component
> >>           connected to @src_port. NULL until the device is created
> >> @@ -195,6 +196,7 @@ struct coresight_desc {
> >>   struct coresight_connection {
> >>       int src_port;
> >>       int dest_port;
> >> +    const char *source_label;
> >>       struct fwnode_handle *dest_fwnode;
> >>       struct coresight_device *dest_dev;
> >>       struct coresight_sysfs_link *link;
> >



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

