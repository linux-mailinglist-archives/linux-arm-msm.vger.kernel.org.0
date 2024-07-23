Return-Path: <linux-arm-msm+bounces-26878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400D939EC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F1C1C213EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D36E14D2BD;
	Tue, 23 Jul 2024 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rahkah76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4913E034
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721730617; cv=none; b=tUKFvBtWWgq5YjUBgM1F61iAUJrR/BKlA7EfxjRJycH7BKF7FzNhiMc/u0AGngkFEfeOt23GXHVaNlHSCpSZar3cBKhEgRGKUQQ2buROn5Q/+xdaWhQV6EZRPXyfTUzeMy+S5pknT5iOW+Vk2yW8TuxG/8s/SWVWHaMawybHpu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721730617; c=relaxed/simple;
	bh=viSaI6fEVATrMSGeFtbPAgtoOHJZc55+L2MZwi/r/Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhA9dXouxbpilUzypCyipXqATcQd0z/VirP39DtkJSU8ftreF/Pd75KKSzGqgSprJgsI+F/JCq8TTDtmZsCVE6aVgh037O126r1rYBhZxCxguku1jCZfaYcyGPqfvxIcQDGVsyjlQ3UP1hPUoBl3cJlxEH/aRvtGl9OkEx2jZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rahkah76; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d1d818c42so1332960b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721730614; x=1722335414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODsBXA5Nt3sS6NE+lBcP5EzLOp3xRZJQbPleYsmaM/s=;
        b=Rahkah76n336CuY2oxO0M6HosPOw4r3pfR+HmrVLLOsFUCDK/+NNztAQTXBRVIetfA
         hiBrxnq+IJm0LoB9VOhY8y/VkAZnybXOh3gmwvKQvUUcdn8mBhK96OYmQrQz2DlHw95C
         H0TVlx8u+w/VJxtTEAT9O/8HuoPgTMfdPSv+E94iwYrmtHuoJ6tXd+CfjNgFBqs+AvGR
         AZzYEbGJHKEVv1JkIJddKReAqStDzfPlvNgvdj7nhuGs6TSD55DBR6DE7/wkzOnaRfaq
         Xfs5fi+jkrNVUATUCvS8BWbGCopS0JdKlWNPPCtpXfDykUl620jNDQZzoL8FDJ7EtsGp
         detg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721730614; x=1722335414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODsBXA5Nt3sS6NE+lBcP5EzLOp3xRZJQbPleYsmaM/s=;
        b=IfI//V9Osb9A2d55IbCaddZBS5bDPIZrutNi548L0SmDYSkJ4j4n2THx/DB3tmytUP
         n+vXVRObuI+976zjL7lZUgQitkiJeUy4oIcawG2bYWBzBwNnRIio8rtCT12iFM3KWAmn
         pB36rIHpwmtNm4OCjC/taOoA5kAJ/oxBQN0qe8SbRvuvx8Lj2TXmdUZ4f44AZzQ37bmy
         OUvH73+LMMAHa1medOrEetWA0Jxw2I43ygevxyAbHcO+iFZkfGtVeXhYphUrOJqDFEA0
         ZMCfejA8cWTA2Q1+JhnZFTub9G57uTqCAOHBjKqG8fYkgd4Cy/Lk7JmYrw0zg95NU7/F
         TFgw==
X-Forwarded-Encrypted: i=1; AJvYcCW6wRsZnJuNOjmk6+elzWLhpN/nBERCzZv4MPlVdZz/r4SoajAdQeEldAeMyYPgdN2WyqMNO6k8j2c7Gr7NDB2UXtIN8Hbos5jycLM5TQ==
X-Gm-Message-State: AOJu0Yw5YnZR3/R4W6y+U0/1AjoAAE+vZ0TivrKXgUZrtuKfHipIaUTj
	zn/wM43T5VNMybVIzwHoSyU0L68EKDHXhvb9UhM9x0x6/iTykfMWLc5A0uQw4qa200btifDBf3J
	I2b+TfqrlRe+asx37ZxMHpMnUZE5xZ3pYG22lsA==
X-Google-Smtp-Source: AGHT+IH21j5EQ5CQn1IrBHPkslzCa9keQ0JJS3oNGRwZKaK4x61tSxnfyzZ75RL/KrNN9DgTxHCxfi8/sRP+LNQWciM=
X-Received: by 2002:a05:6a00:391e:b0:70d:3174:262b with SMTP id
 d2e1a72fcca58-70d3fb94a8cmr3020963b3a.29.1721730613644; Tue, 23 Jul 2024
 03:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com> <20240705090049.1656986-2-quic_jiegan@quicinc.com>
In-Reply-To: <20240705090049.1656986-2-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 23 Jul 2024 11:30:02 +0100
Message-ID: <CAJ9a7VgpKiRFOJc3ns=6zRHyv-UpXciZFMJgmSQPOm56U6BBgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Coresight: Add trace_id function to collect trace ID
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, James Clark <james.clark@arm.com>, 
	Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch has a number of issues:-

1) The new dynamic trace ID patchset to use per sink ID maps makes
this set unusable. perf supplies a trace ID map for each sink used.
 - see https://lists.linaro.org/archives/list/coresight@lists.linaro.org/thread/JEK7M7HRS57XK4B7CVTVFSHFAFBX4SFG/

2) See etm4_enable_perf() - in the perf context a locked version of
the read trace ID cannot be used - therefore any path that calls
etm4_read_alloc_trace_id() (or equivalent for other sources) in perf
mode may result in lockdep issues.

3) on enable: given a cpu  number, the trace ID can be read from the
id maps rather than needing a new function in ops

4) on disable: trace id can be read directly from the source driver
data - again removing need for a new trace_id function in ops.

Regards

Mike


On Fri, 5 Jul 2024 at 10:01, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> Add 'trace_id' function pointer in ops. It's responsible for collect the
> trace ID of the device.
>
> Add 'struct cs_sink_data' to store the data used by coresight_enable_path/
> coresight_disable_path. The structure will be transmitted to the helper and
> sink device.
>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 53 +++++++++++++++----
>  drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>  .../hwtracing/coresight/coresight-etm-perf.c  | 34 ++++++++++--
>  .../coresight/coresight-etm3x-core.c          | 14 +++++
>  .../coresight/coresight-etm4x-core.c          | 13 +++++
>  drivers/hwtracing/coresight/coresight-priv.h  | 12 ++++-
>  drivers/hwtracing/coresight/coresight-stm.c   | 13 +++++
>  drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++--
>  .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>  .../hwtracing/coresight/coresight-tmc-etr.c   |  6 ++-
>  drivers/hwtracing/coresight/coresight-tpda.c  | 13 +++++
>  drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>  drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>  include/linux/coresight.h                     |  4 ++
>  14 files changed, 174 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 9fc6f6b863e0..f414e66f4cda 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -297,12 +297,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
>         return helper_ops(csdev)->enable(csdev, mode, data);
>  }
>
> -static void coresight_disable_helper(struct coresight_device *csdev)
> +static void coresight_disable_helper(struct coresight_device *csdev, void *data)
>  {
> -       helper_ops(csdev)->disable(csdev, NULL);
> +       helper_ops(csdev)->disable(csdev, data);
>  }
>
> -static void coresight_disable_helpers(struct coresight_device *csdev)
> +static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
>  {
>         int i;
>         struct coresight_device *helper;
> @@ -310,7 +310,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>         for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>                 helper = csdev->pdata->out_conns[i]->dest_dev;
>                 if (helper && coresight_is_helper(helper))
> -                       coresight_disable_helper(helper);
> +                       coresight_disable_helper(helper, data);
>         }
>  }
>
> @@ -327,7 +327,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>  void coresight_disable_source(struct coresight_device *csdev, void *data)
>  {
>         source_ops(csdev)->disable(csdev, data);
> -       coresight_disable_helpers(csdev);
> +       coresight_disable_helpers(csdev, NULL);
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_source);
>
> @@ -337,7 +337,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>   * disabled.
>   */
>  static void coresight_disable_path_from(struct list_head *path,
> -                                       struct coresight_node *nd)
> +                                       struct coresight_node *nd,
> +                                       void *sink_data)
>  {
>         u32 type;
>         struct coresight_device *csdev, *parent, *child;
> @@ -382,13 +383,13 @@ static void coresight_disable_path_from(struct list_head *path,
>                 }
>
>                 /* Disable all helpers adjacent along the path last */
> -               coresight_disable_helpers(csdev);
> +               coresight_disable_helpers(csdev, sink_data);
>         }
>  }
>
> -void coresight_disable_path(struct list_head *path)
> +void coresight_disable_path(struct list_head *path, void *sink_data)
>  {
> -       coresight_disable_path_from(path, NULL);
> +       coresight_disable_path_from(path, NULL, sink_data);
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_path);
>
> @@ -468,10 +469,42 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>  out:
>         return ret;
>  err:
> -       coresight_disable_path_from(path, nd);
> +       coresight_disable_path_from(path, nd, sink_data);
>         goto out;
>  }
>
> +int coresight_read_traceid(struct list_head *path)
> +{
> +       int trace_id, type;
> +       struct coresight_device *csdev;
> +       struct coresight_node *nd;
> +
> +       list_for_each_entry(nd, path, link) {
> +               csdev = nd->csdev;
> +               type = csdev->type;
> +
> +               switch(type) {
> +                       case CORESIGHT_DEV_TYPE_SOURCE:
> +                               if (source_ops(csdev)->trace_id != NULL) {
> +                                       trace_id = source_ops(csdev)->trace_id(csdev);
> +                                       if (trace_id > 0)
> +                                               return trace_id;
> +                               }
> +                               break;
> +                       case CORESIGHT_DEV_TYPE_LINK:
> +                               if (link_ops(csdev)->trace_id != NULL) {
> +                                       trace_id = link_ops(csdev)->trace_id(csdev);
> +                                       if (trace_id > 0)
> +                                               return trace_id;
> +                               }
> +                               break;
> +                       default:
> +                               break;
> +               }
> +       }
> +       return -EINVAL;
> +}
> +
>  struct coresight_device *coresight_get_sink(struct list_head *path)
>  {
>         struct coresight_device *csdev;
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 7edd3f1d0d46..05e620529c14 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -173,7 +173,8 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
>         pid_t pid;
>         unsigned long flags;
>         struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -       struct perf_output_handle *handle = data;
> +       struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +       struct perf_output_handle *handle = sink_data->handle;
>         struct cs_buffers *buf = etm_perf_sink_config(handle);
>
>         spin_lock_irqsave(&drvdata->spinlock, flags);
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index c0c60e6a1703..8b155765b959 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -452,6 +452,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>         struct perf_output_handle *handle = &ctxt->handle;
>         struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>         struct list_head *path;
> +       struct cs_sink_data *sink_data = NULL;
>         u64 hw_id;
>
>         if (!csdev)
> @@ -490,9 +491,18 @@ static void etm_event_start(struct perf_event *event, int flags)
>         if (WARN_ON_ONCE(!sink))
>                 goto fail_end_stop;
>
> +       sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +       if (!sink_data)
> +               goto fail_end_stop;
> +
> +       sink_data->sink = sink;
> +       sink_data->traceid = coresight_read_traceid(path);
> +       sink_data->handle = handle;
>         /* Nothing will happen without a path */
> -       if (coresight_enable_path(path, CS_MODE_PERF, handle))
> +       if (coresight_enable_path(path, CS_MODE_PERF, sink_data)) {
> +               kfree(sink_data);
>                 goto fail_end_stop;
> +       }
>
>         /* Finally enable the tracer */
>         if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF))
> @@ -511,6 +521,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>                 perf_report_aux_output_id(event, hw_id);
>         }
>
> +       kfree(sink_data);
>  out:
>         /* Tell the perf core the event is alive */
>         event->hw.state = 0;
> @@ -519,7 +530,8 @@ static void etm_event_start(struct perf_event *event, int flags)
>         return;
>
>  fail_disable_path:
> -       coresight_disable_path(path);
> +       coresight_disable_path(path, sink_data);
> +       kfree(sink_data);
>  fail_end_stop:
>         /*
>          * Check if the handle is still associated with the event,
> @@ -544,6 +556,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>         struct perf_output_handle *handle = &ctxt->handle;
>         struct etm_event_data *event_data;
>         struct list_head *path;
> +       struct cs_sink_data *sink_data = NULL;
>
>         /*
>          * If we still have access to the event_data via handle,
> @@ -588,6 +601,10 @@ static void etm_event_stop(struct perf_event *event, int mode)
>         if (!sink)
>                 return;
>
> +       sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +       if (!sink_data)
> +               return;
> +
>         /* stop tracer */
>         coresight_disable_source(csdev, event);
>
> @@ -601,12 +618,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
>          * have to do anything here.
>          */
>         if (handle->event && (mode & PERF_EF_UPDATE)) {
> -               if (WARN_ON_ONCE(handle->event != event))
> +               if (WARN_ON_ONCE(handle->event != event)) {
> +                       kfree(sink_data);
>                         return;
> +               }
>
>                 /* update trace information */
> -               if (!sink_ops(sink)->update_buffer)
> +               if (!sink_ops(sink)->update_buffer) {
> +                       kfree(sink_data);
>                         return;
> +               }
>
>                 size = sink_ops(sink)->update_buffer(sink, handle,
>                                               event_data->snk_config);
> @@ -627,8 +648,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>                         WARN_ON(size);
>         }
>
> +       sink_data->sink = sink;
> +       sink_data->traceid = coresight_read_traceid(path);
>         /* Disabling the path make its elements available to other sessions */
> -       coresight_disable_path(path);
> +       coresight_disable_path(path, sink_data);
> +       kfree(sink_data);
>  }
>
>  static int etm_event_add(struct perf_event *event, int mode)
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 8b362605d242..27e973749050 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -696,10 +696,24 @@ static void etm_disable(struct coresight_device *csdev,
>                 coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
> +static int etm_trace_id(struct coresight_device *csdev)
> +{
> +       struct etm_drvdata *drvdata;
> +
> +       if (csdev == NULL)
> +               return -EINVAL;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return etm_read_alloc_trace_id(drvdata);
> +}
> +
> +
>  static const struct coresight_ops_source etm_source_ops = {
>         .cpu_id         = etm_cpu_id,
>         .enable         = etm_enable,
>         .disable        = etm_disable,
> +       .trace_id       = etm_trace_id,
>  };
>
>  static const struct coresight_ops etm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index bf01f01964cf..8c3e9bfb9a9c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1024,10 +1024,23 @@ static void etm4_disable(struct coresight_device *csdev,
>                 coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
> +static int etm4_trace_id(struct coresight_device *csdev)
> +{
> +       struct etmv4_drvdata *drvdata;
> +
> +       if (csdev == NULL)
> +               return -EINVAL;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return etm4_read_alloc_trace_id(drvdata);
> +}
> +
>  static const struct coresight_ops_source etm4_source_ops = {
>         .cpu_id         = etm4_cpu_id,
>         .enable         = etm4_enable,
>         .disable        = etm4_disable,
> +       .trace_id       = etm4_trace_id,
>  };
>
>  static const struct coresight_ops etm4_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 61a46d3bdcc8..e2576531f796 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -105,6 +105,15 @@ struct cs_buffers {
>         void                    **data_pages;
>  };
>
> +/**
> + * struct cs_sink_data - data used by coresight_enable_path/coresight_disable_path
> + */
> +struct cs_sink_data {
> +       struct perf_output_handle       *handle;
> +       struct coresight_device         *sink;
> +       u32                             traceid;
> +};
> +
>  static inline void coresight_insert_barrier_packet(void *buf)
>  {
>         if (buf)
> @@ -129,9 +138,10 @@ static inline void CS_UNLOCK(void __iomem *addr)
>         } while (0);
>  }
>
> -void coresight_disable_path(struct list_head *path);
> +void coresight_disable_path(struct list_head *path, void *sink_data);
>  int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>                           void *sink_data);
> +int coresight_read_traceid(struct list_head *path);
>  struct coresight_device *coresight_get_sink(struct list_head *path);
>  struct coresight_device *coresight_get_sink_by_id(u32 id);
>  struct coresight_device *
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 117dbb484543..3817743fc0c6 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -280,9 +280,22 @@ static void stm_disable(struct coresight_device *csdev,
>         }
>  }
>
> +static int stm_trace_id(struct coresight_device *csdev)
> +{
> +       struct stm_drvdata *drvdata;
> +
> +       if (csdev == NULL)
> +               return -EINVAL;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->traceid;
> +}
> +
>  static const struct coresight_ops_source stm_source_ops = {
>         .enable         = stm_enable,
>         .disable        = stm_disable,
> +       .trace_id       = stm_trace_id,
>  };
>
>  static const struct coresight_ops stm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index 1e67cc7758d7..a95afc890587 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -167,6 +167,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>         int cpu, ret = 0;
>         struct coresight_device *sink;
>         struct list_head *path;
> +       struct cs_sink_data *sink_data;
>         enum coresight_dev_subtype_source subtype;
>         u32 hash;
>
> @@ -208,7 +209,14 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>                 goto out;
>         }
>
> -       ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
> +       sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +       if (!sink_data) {
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +       sink_data->traceid = coresight_read_traceid(path);
> +       sink_data->sink = sink;
> +       ret = coresight_enable_path(path, CS_MODE_SYSFS, sink_data);
>         if (ret)
>                 goto err_path;
>
> @@ -245,15 +253,17 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>                 break;
>         }
>
> +       kfree(sink_data);
>  out:
>         mutex_unlock(&coresight_mutex);
>         return ret;
>
>  err_source:
> -       coresight_disable_path(path);
> +       coresight_disable_path(path, sink_data);
>
>  err_path:
>         coresight_release_path(path);
> +       kfree(sink_data);
>         goto out;
>  }
>  EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
> @@ -262,6 +272,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
>  {
>         int cpu, ret;
>         struct list_head *path = NULL;
> +       struct cs_sink_data *sink_data = NULL;
>         u32 hash;
>
>         mutex_lock(&coresight_mutex);
> @@ -273,6 +284,10 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
>         if (!coresight_disable_source_sysfs(csdev, NULL))
>                 goto out;
>
> +       sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +       if (!sink_data)
> +               goto out;
> +
>         switch (csdev->subtype.source_subtype) {
>         case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
>                 cpu = source_ops(csdev)->cpu_id(csdev);
> @@ -296,8 +311,11 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
>                 break;
>         }
>
> -       coresight_disable_path(path);
> +       sink_data->sink = coresight_find_activated_sysfs_sink(csdev);
> +       sink_data->traceid = coresight_read_traceid(path);
> +       coresight_disable_path(path, sink_data);
>         coresight_release_path(path);
> +       kfree(sink_data);
>
>  out:
>         mutex_unlock(&coresight_mutex);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d4f641cd9de6..7dc536eba3e2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -250,7 +250,8 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
>         pid_t pid;
>         unsigned long flags;
>         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -       struct perf_output_handle *handle = data;
> +       struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +       struct perf_output_handle *handle = sink_data->handle;
>         struct cs_buffers *buf = etm_perf_sink_config(handle);
>
>         spin_lock_irqsave(&drvdata->spinlock, flags);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index e75428fa1592..0c24520645e2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1253,7 +1253,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data)
>  {
> -       struct perf_output_handle *handle = data;
> +       struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +       struct perf_output_handle *handle = sink_data->handle;
>         struct etr_perf_buffer *etr_perf;
>
>         switch (mode) {
> @@ -1647,7 +1648,8 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>         pid_t pid;
>         unsigned long flags;
>         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -       struct perf_output_handle *handle = data;
> +       struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +       struct perf_output_handle *handle = sink_data->handle;
>         struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>
>         spin_lock_irqsave(&drvdata->spinlock, flags);
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..20f0ab73159c 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -232,9 +232,22 @@ static void tpda_disable(struct coresight_device *csdev,
>         dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>  }
>
> +static int tpda_trace_id(struct coresight_device *csdev)
> +{
> +       struct tpda_drvdata *drvdata;
> +
> +       if (csdev == NULL)
> +               return -EINVAL;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->atid;
> +}
> +
>  static const struct coresight_ops_link tpda_link_ops = {
>         .enable         = tpda_enable,
>         .disable        = tpda_disable,
> +       .trace_id       = tpda_trace_id,
>  };
>
>  static const struct coresight_ops tpda_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 96a32b213669..7f4560b067a8 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -21,6 +21,7 @@
>
>  #include "coresight-self-hosted-trace.h"
>  #include "coresight-trbe.h"
> +#include "coresight-priv.h"
>
>  #define PERF_IDX2OFF(idx, buf) ((idx) % ((buf)->nr_pages << PAGE_SHIFT))
>
> @@ -1012,7 +1013,8 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>  {
>         struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>         struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> -       struct perf_output_handle *handle = data;
> +       struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +       struct perf_output_handle *handle = sink_data->handle;
>         struct trbe_buf *buf = etm_perf_sink_config(handle);
>
>         WARN_ON(cpudata->cpu != smp_processor_id());
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index f9ebf20c91e6..92d8a9fb844e 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -217,7 +217,8 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
>  static int smb_enable_perf(struct coresight_device *csdev, void *data)
>  {
>         struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
> -       struct perf_output_handle *handle = data;
> +       struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +       struct perf_output_handle *handle = sink_data->handle;
>         struct cs_buffers *buf = etm_perf_sink_config(handle);
>         pid_t pid;
>
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index f09ace92176e..fb1c225076a5 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -344,6 +344,7 @@ struct coresight_ops_sink {
>   * Operations available for links.
>   * @enable:    enables flow between iport and oport.
>   * @disable:   disables flow between iport and oport.
> + * @trace_id:  Collect the traceid.
>   */
>  struct coresight_ops_link {
>         int (*enable)(struct coresight_device *csdev,
> @@ -352,6 +353,7 @@ struct coresight_ops_link {
>         void (*disable)(struct coresight_device *csdev,
>                         struct coresight_connection *in,
>                         struct coresight_connection *out);
> +       int (*trace_id)(struct coresight_device *csdev);
>  };
>
>  /**
> @@ -361,6 +363,7 @@ struct coresight_ops_link {
>   *             is associated to.
>   * @enable:    enables tracing for a source.
>   * @disable:   disables tracing for a source.
> + * @trace_id:  collect the traceid.
>   */
>  struct coresight_ops_source {
>         int (*cpu_id)(struct coresight_device *csdev);
> @@ -368,6 +371,7 @@ struct coresight_ops_source {
>                       enum cs_mode mode);
>         void (*disable)(struct coresight_device *csdev,
>                         struct perf_event *event);
> +       int (*trace_id)(struct coresight_device *csdev);
>  };
>
>  /**
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

