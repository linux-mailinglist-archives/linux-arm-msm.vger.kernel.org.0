Return-Path: <linux-arm-msm+bounces-29301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D11795BCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 19:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87E3FB2367A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 17:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4801CCB4D;
	Thu, 22 Aug 2024 17:01:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0523B26AC1;
	Thu, 22 Aug 2024 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346080; cv=none; b=gN1ZrSQMqMw+7GDSmUeE2TjvV/BeulyzP+VsXVOpLQArXTFX1BkFQfAmRIdaU/hd4H1qPv6QBGzvbEnaAE1hbIgS4OF53oMLwJ1ed5GsLOMmIPdsrNKtnoagwaQO3I62McgpumyAAWpVtNbPwLZ9McqFBUm2yMyeMNr0lsigVM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346080; c=relaxed/simple;
	bh=CIphFNT5ZFa3ik6c8w2cjWRiGQpgW10nPRdBGhiETkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3eSAWPpnLyoKZsMDOvMbA1sx+4o8wmv3noajlmzCJpxakmhrocZnyiAZ1VVW5p2rNGCLNWX1BUMLmUg+ArDwQ6/92avPa4P6o8vLhxnTPOQP9qvsUhkIfqImIm5RcPpnU1Ad7PLA4Fs3QszG1KIL7ahKKnyJw8K6lvClxmy9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D8E8DA7;
	Thu, 22 Aug 2024 10:01:43 -0700 (PDT)
Received: from [10.57.72.240] (unknown [10.57.72.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB073F58B;
	Thu, 22 Aug 2024 10:01:15 -0700 (PDT)
Message-ID: <06e91336-4543-4598-92d7-d2fa52f780f0@arm.com>
Date: Thu, 22 Aug 2024 18:01:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] coresight: Add support for trace filtering by
 source
Content-Language: en-GB
To: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
 <20240821031348.6837-3-quic_taozha@quicinc.com>
 <5d34d9b6-7571-4db8-847b-6721251efc55@arm.com>
 <a76bf942-e36f-467d-a436-0a1d8e682c10@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a76bf942-e36f-467d-a436-0a1d8e682c10@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tao

On 22/08/2024 17:44, Tao Zhang wrote:
> 
> On 8/21/2024 11:23 PM, Suzuki K Poulose wrote:
>> Hi Tao
>>
>> On 21/08/2024 04:13, Tao Zhang wrote:
>>> Some replicators have hard coded filtering of "trace" data, based on the
>>> source device. This is different from the trace filtering based on
>>> TraceID, available in the standard programmable replicators. e.g.,
>>> Qualcomm replicators have filtering based on custom trace protocol
>>> format and is not programmable.
>>>
>>> The source device could be connected to the replicator via intermediate
>>> components (e.g., a funnel). Thus we need platform information from
>>> the firmware tables to decide the source device corresponding to a
>>> given output port from the replicator. Given this affects "trace
>>> path building" and traversing the path back from the sink to source,
>>> add the concept of "filtering by source" to the generic coresight
>>> connection.
>>>
>>
>> This looks good, except for some minor comments below.
> OK, I will remove the comments below in the next version.
>>
>>> The specified source will be marked like below in the Devicetree.
>>> test-replicator {
>>>      ... ... ... ...
>>>      out-ports {
>>>          ... ... ... ...
>>>          port@0 {
>>>              reg = <0>;
>>>              xxx: endpoint {
>>>                  remote-endpoint = <&xxx>;
>>>                  filter_src = <&xxx>; <-- To specify the source to
>>>              };                           be filtered out here.
>>>          };
>>>
>>>          port@1 {
>>>              reg = <1>;
>>>              yyy: endpoint {
>>>                  remote-endpoint = <&yyy>;
>>>                  filter_src = <&yyy>; <-- To specify the source to
>>>              };                           be filtered out here.
>>>          };
>>>      };
>>> };
>>>
>>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c  | 136 +++++++++++++++---
>>>   .../hwtracing/coresight/coresight-platform.c  |  18 +++
>>>   include/linux/coresight.h                     |   5 +
>>>   3 files changed, 136 insertions(+), 23 deletions(-)

...

>>> @@ -337,7 +374,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>    * disabled.
>>>    */
>>>   static void coresight_disable_path_from(struct list_head *path,
>>> -                    struct coresight_node *nd)
>>> +                    struct coresight_node *nd,
>>> +                    struct coresight_device *source)
>>
>> Apologies, I may not have been clear enough. But we concluded that the
>> path here is suitable for coresight_get_source(path) and as such we
>> don't need to explicitly pass the source.
> 
> Do you mean we don't need to explicitly pass the source on 
> "coresight_disable_path_from",
> 
> we can pass the "source" to "coresight_disable_link" by the following way?
> 
> coresight_disable_link(csdev, parent, child, coresight_get_source(path));

Correct.

> 
>>
>>>   {
>>>       u32 type;
>>>       struct coresight_device *csdev, *parent, *child;
>>> @@ -375,7 +413,7 @@ static void coresight_disable_path_from(struct 
>>> list_head *path,
>>>           case CORESIGHT_DEV_TYPE_LINK:
>>>               parent = list_prev_entry(nd, link)->csdev;
>>>               child = list_next_entry(nd, link)->csdev;
>>> -            coresight_disable_link(csdev, parent, child);
>>> +            coresight_disable_link(csdev, parent, child, source);
>>>               break;
>>>           default:
>>>               break;
>>> @@ -388,7 +426,10 @@ static void coresight_disable_path_from(struct 
>>> list_head *path,
>>>     void coresight_disable_path(struct list_head *path)
>>>   {
>>> -    coresight_disable_path_from(path, NULL);
>>> +    struct coresight_device *source;
>>> +
>>> +    source = coresight_get_source(path);
>>> +    coresight_disable_path_from(path, NULL, source);
>>>   }
>>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>>   @@ -418,7 +459,9 @@ int coresight_enable_path(struct list_head 
>>> *path, enum cs_mode mode,
>>>       u32 type;
>>>       struct coresight_node *nd;
>>>       struct coresight_device *csdev, *parent, *child;
>>> +    struct coresight_device *source;
>>>   +    source = coresight_get_source(path);
>>>       list_for_each_entry_reverse(nd, path, link) {
>>>           csdev = nd->csdev;
>>>           type = csdev->type;
>>> @@ -456,7 +499,7 @@ int coresight_enable_path(struct list_head *path, 
>>> enum cs_mode mode,
>>>           case CORESIGHT_DEV_TYPE_LINK:
>>>               parent = list_prev_entry(nd, link)->csdev;
>>>               child = list_next_entry(nd, link)->csdev;
>>> -            ret = coresight_enable_link(csdev, parent, child);
>>> +            ret = coresight_enable_link(csdev, parent, child, source);
>>>               if (ret)
>>>                   goto err;
>>>               break;
>>> @@ -468,7 +511,7 @@ int coresight_enable_path(struct list_head *path, 
>>> enum cs_mode mode,
>>>   out:
>>>       return ret;
>>>   err:
>>> -    coresight_disable_path_from(path, nd);
>>> +    coresight_disable_path_from(path, nd, source);
>>>       goto out;
>>>   }
>>>   @@ -619,6 +662,7 @@ static void coresight_drop_device(struct 
>>> coresight_device *csdev)
>>>    * @csdev:    The device to start from.
>>>    * @sink:    The final sink we want in this path.
>>>    * @path:    The list to add devices to.
>>> + * @source:    The trace source device of the path.
>>>    *
>>>    * The tree of Coresight device is traversed until @sink is found.
>>>    * From there the sink is added to the list along with all the 
>>> devices that led
>>> @@ -627,7 +671,8 @@ static void coresight_drop_device(struct 
>>> coresight_device *csdev)
>>>    */
>>>   static int _coresight_build_path(struct coresight_device *csdev,
>>>                    struct coresight_device *sink,
>>> -                 struct list_head *path)
>>> +                 struct list_head *path,
>>> +                 struct coresight_device *source)
>>
>> minor nit: Please could we reorder the parameter order :
>>
>> _coresight_build_path(csdev, source, sink, path) ?
>>
>> That makes it much better to read : build a path from "source" to 
>> "sink", from "csdev"
> All right, I will update in the next version.
>>
>>>   {
>>>       int i, ret;
>>>       bool found = false;
>>> @@ -639,7 +684,7 @@ static int _coresight_build_path(struct 
>>> coresight_device *csdev,
>>>         if (coresight_is_percpu_source(csdev) && 
>>> coresight_is_percpu_sink(sink) &&
>>>           sink == per_cpu(csdev_sink, 
>>> source_ops(csdev)->cpu_id(csdev))) {
>>> -        if (_coresight_build_path(sink, sink, path) == 0) {
>>> +        if (_coresight_build_path(sink, sink, path, source) == 0) {
>>>               found = true;
>>>               goto out;
>>>           }
>>> @@ -650,8 +695,13 @@ static int _coresight_build_path(struct 
>>> coresight_device *csdev,
>>>           struct coresight_device *child_dev;
>>>             child_dev = csdev->pdata->out_conns[i]->dest_dev;
>>> +
>>> +        if (csdev->pdata->out_conns[i]->filter_src_dev
>>> +            && (csdev->pdata->out_conns[i]->filter_src_dev != source))
>>> +            continue;
>>
>> Please reuse coresight_block_source(). i.e.,
>>
>> if (coresight_block_source(source, csdev->pdata->cout_conns[i]))
>>     continue;
> OK, I will update in the next version.
>>
>>> +
>>>           if (child_dev &&
>>> -            _coresight_build_path(child_dev, sink, path) == 0) {
>>> +            _coresight_build_path(child_dev, sink, path, source) == 
>>> 0) {
>>>               found = true;
>>>               break;
>>>           }
>>> @@ -696,7 +746,7 @@ struct list_head *coresight_build_path(struct 
>>> coresight_device *source,
>>>         INIT_LIST_HEAD(path);
>>>   -    rc = _coresight_build_path(source, sink, path);
>>> +    rc = _coresight_build_path(source, sink, path, source);
>>>       if (rc) {
>>>           kfree(path);
>>>           return ERR_PTR(rc);
>>> @@ -924,6 +974,16 @@ static int coresight_orphan_match(struct device 
>>> *dev, void *data)
>>>       for (i = 0; i < src_csdev->pdata->nr_outconns; i++) {
>>>           conn = src_csdev->pdata->out_conns[i];
>>>   +        /* Fix filter source device before skip the port */
>>> +        if ((conn->filter_src_fwnode) && dst_csdev
>>
>> minor nit: unnecessary () around conn->filter_src_fwnode
> OK, I will update in the next version.
>>
>>> +            && (conn->filter_src_fwnode == dst_csdev->dev.fwnode)) {
>>> +            if (dst_csdev->type == CORESIGHT_DEV_TYPE_SOURCE)
>>> +                conn->filter_src_dev = dst_csdev;
>>> +            else
>>> +                dev_warn(&conn->filter_src_dev->dev,
>>> +                  "Filter source is not a source device\n");
>>> +        }
>>
>> We could set the still_orphan here instead of down below.
>>
>>     /* Fixup filter source link */
>>     if (conn->filter_src_fwnode && !conn->filter_src_dev) {
>>         if (dst_csdev &&
>>             conn->filter_src_fwnode == dst_csdev->dev.fwnode &&
>>             !WARN_ON_ONCE(dst_csdev->type != CORESIGHT_DEV_TYPE_SOURCE) {
>>             conn->filter_src_dev = dst_csdev;
>>         else
>>             still_orphan = true;
>>     }
>>
>> minor nit: Also I think it is high time we add a helper to check if a
>> devices is SOURCE, something like we did for is_device_tpdm(). e.g.,
>>
>>
>> static inline bool coresight_is_device_source(struct coresight_device 
>> *csdev)
>> {
>>     return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE);
>> }
> Could you help review the following approach?
> 
> I will add the helper to coresight-priv.h
> 
> static inline bool coresight_is_device_source(struct coresight_device 
> *csdev)
> {
>      return (csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE));

minor nit:

	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE);

> }
> 
> Then, calling the help to check if a device is SOURCE in 
> coresight-platform.c and coresight-core.c

and evert where you compare for SOURCE.

> 
> coresight-platform.c
> 
> ... ... ... ...
> 
>          else {
>              conn.filter_src_dev =
>   coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
>              if (conn.filter_src_dev &&
>                  !coresight_is_device_source(conn.filter_src_dev))
>                  dev_warn(&conn.filter_src_dev->dev,
>                    "Filter source is not a source device\n");
>          }
> 
> coresight-core.c
> 
> ... ... ... ...
> 
>          if (conn->filter_src_fwnode && !conn->filter_src_dev) {
>              if (dst_csdev && (conn->filter_src_fwnode == 
> dst_csdev->dev.fwnode)
>                  && !WARN_ON_ONCE(!coresight_is_device_source(dst_csdev)))
>                  conn->filter_src_dev = dst_csdev;
>              else
>                  still_orphan = true;
>          }
> 

Correct.

Thanks for your patience. Please wait until we sort out the device tree
bindings

Suzuki


