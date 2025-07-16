Return-Path: <linux-arm-msm+bounces-65204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E68B07340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E885583302
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF72F2F4A05;
	Wed, 16 Jul 2025 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kocVL4lD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A82F49FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661233; cv=none; b=JmYfsvfRV0zZDfdaaP9111F9VGC9/2tb9QUClS5D+KS5nPEu0D9tbVm1NWFDuejyBGF4apWxlIpHoyc0XuRNnwH/dcbgMJSyaDMZMhuoiKClRZY18JSY6AtwJNjVvptwgenaSoyer+Rhl13+ZgsGuB+04t29YlEr2VPaIKeriuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661233; c=relaxed/simple;
	bh=6o5+SL+Zq5F1zkR7Vc2JwC60QUKnyWgSt56nFJJhGIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfRr5dsdIt4/IEbWQBtWLFqZbzOUKxbJR7HH/FcSBazAP5hk7kKKklSF9tW5l8DZFZxZ5Y0SKM6XBrZTsqMx3bFJvVGySs/IFgIc1RKPpVorlwZWE4GFUSIsIhRfNmIxpqIutaYsPgryLcVjIE6VN5YLy17JfcPPz7Wc/EohtRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kocVL4lD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748feca4a61so3680792b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752661231; x=1753266031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yE7s53Z2C1xLVTq+sUbquydW2QufgfeXOwWrYj8BYEY=;
        b=kocVL4lDhYOw8HRJ3uovJ5lwwdJqsRdsOji+K8BUBxHFbVKBvalGdJFpnoGPyoFs/3
         eq1QzbtC5482+jZZzKPkWKiza60/lDEeKI9FuHdIYzkrIVZ9mfCfF2myzD0x3CyNfOW2
         88T4uLUAVZyvW1fgqWfGGMiEbn+dL3/3RjewpG7ux8c+xcGjSbUP845cln+SsOstKdr1
         BPYD8S0gmDF33j806FoTqcaWriuy816c+jJgxzCIVuEZ41oHNkaR9LKYHvH95Ywh/Yhu
         yKWpArxoa/yuK2EiPXP/EBpUbFDfY7D8K9KWOdZi+14lKsXqviFMjqxvA1731gffNoFW
         cqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661231; x=1753266031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE7s53Z2C1xLVTq+sUbquydW2QufgfeXOwWrYj8BYEY=;
        b=KH+EJjiNnfm4JWmHU/tb/VlAYx7AFv3/9My5twHsKPnSAGtm2uEpbJFAaH2pdg1ONm
         cHCZ3WvYqHqfls6Qoy6+BhgTB4n3IR2/9pOvLcGcqAAb5kxiW3bzHdn0P/mYjVW1DEnC
         MLaSh4qT50WizCSGjgOiCRbyD6EAXgaIdB81sx5v3Cv52aC9DBiWvCnTl5PpB3f4/vEe
         812EiFTDQFJr3YOnJmzR46tKjZfIOnCkqmRsbm7j3fkdwXK3BlMVvjmuuxsx3MfSeuS1
         DVA1HQVH5WkeBUKANjVGOOmKEo16cPRCl1eex4HDbz0nB6USIwDbhXLMZlxex3WL/RKf
         JJgg==
X-Forwarded-Encrypted: i=1; AJvYcCW2QvQTlL6ZRG771nq85Wk+n34b+nzedFXiRsnN/spxYZniuksmbSm6hOFa30PYD4ox/03Kf71kj4YZmZon@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+3pYRGgZrEPFYahQL3sT8/EyusHQpe9wemztgIYoC7Q2dYPVc
	ZN2AJUHrc1KD6q+GEMUTvkI+Ix/lCgngnmC+9yxjlPrdrFGlx2l5B2tVY3XxvOXRWpi9uhcSK0g
	uW9kfQwPnJuKbHVPg7gbnZn7iE+hvfadcMOiAoGUGcA==
X-Gm-Gg: ASbGncu+hCIgDfOtEnYMOkVGtsG9NQvk4QxoTme+zxcnB2rwaUo4ucHPttDTmEEXcQO
	Lh1lK2b9RBT0bbnn346LJ8gBv83HRVmhcAq6BMpuV6lbvB6umg0G4Fhu8nYuEimOe/lAKkquP8A
	dk7UoRPARDcP7ttVh+nJieLafliwv5OCnNUX9Xtb2OxlHFhoGh4TEZbSrJGN4rQEvCaYyvoxctJ
	AouIkiw1ELPAD5vk4Y0HjO9hqKT0eO6/9Q53dM=
X-Google-Smtp-Source: AGHT+IEJfkGlROyu9Urq3ipL4Dbt8kv9P0xUk3Y2bWsJERuyYfUiMSGv/EVjUwE4Kw1m9p08wVXMdS7ntVU1yq9lKEg=
X-Received: by 2002:a05:6a00:99f:b0:74e:b9fd:4a3f with SMTP id
 d2e1a72fcca58-75722869e6dmr2716478b3a.10.1752661231203; Wed, 16 Jul 2025
 03:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-2-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-2-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 16 Jul 2025 11:20:18 +0100
X-Gm-Features: Ac12FXz-xYQrg0Cua4muCLaPsoupDwBUZISKjIA1TU9xkJsYijMrosZo4H6_Ghk
Message-ID: <CAJ9a7VjyWtopbnTirRnd4-486PrdQH00cvUR0kcPde2hxCUH-A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 01/10] coresight: core: Refactoring
 ctcu_get_active_port and make it generic
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Remove ctcu_get_active_port from CTCU module and add it to the core
> framework.
>
> The port number is crucial for the CTCU device to identify which ETR
> it serves. With the port number we can correctly get required parameters
> of the CTCU device in TMC module.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
>  drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
>  3 files changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 1accd7cbd54b..5297a5ff7921 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_sink);
>
> +/**
> + * coresight_get_port_helper: get the in-port number of the helper device
> + * that is connected to the csdev.
> + *

As written this looks at all connections, not just those that are
helpers. That is fine, so perhaps rename as such.

e.g. coresight_get_in_port_dest

and name the input parameters src , dest respectively.

> + * @csdev: csdev of the device that is connected to helper.
> + * @helper: csdev of the helper device.
> + *
> + * Return: port number upson success or -EINVAL for fail.

sp: upon/upson

> + */
> +int coresight_get_port_helper(struct coresight_device *csdev,
> +                             struct coresight_device *helper)
> +{
> +       struct coresight_platform_data *pdata = helper->pdata;
> +       int i;
> +
> +       for (i = 0; i < pdata->nr_inconns; ++i) {
> +               if (pdata->in_conns[i]->src_dev == csdev)
> +                       return pdata->in_conns[i]->dest_port;
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_port_helper);
> +
>  u32 coresight_get_sink_id(struct coresight_device *csdev)
>  {
>         if (!csdev->ea)
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c6bafc96db96..28ea4a216345 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
>         return 0;
>  }
>
> -/*
> - * Searching the sink device from helper's view in case there are multiple helper devices
> - * connected to the sink device.
> - */
> -static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> -{
> -       struct coresight_platform_data *pdata = helper->pdata;
> -       int i;
> -
> -       for (i = 0; i < pdata->nr_inconns; ++i) {
> -               if (pdata->in_conns[i]->src_dev == sink)
> -                       return pdata->in_conns[i]->dest_port;
> -       }
> -
> -       return -EINVAL;
> -}
> -
>  static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
>                                 bool enable)
>  {
> @@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>                 return -EINVAL;
>         }
>
> -       port_num = ctcu_get_active_port(sink, csdev);
> +       port_num = coresight_get_port_helper(sink, csdev);
>         if (port_num < 0)
>                 return -EINVAL;
>
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043..07a5f03de81d 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
>  u32 coresight_get_sink_id(struct coresight_device *csdev);
>  void coresight_path_assign_trace_id(struct coresight_path *path,
>                                    enum cs_mode mode);
> +int coresight_get_port_helper(struct coresight_device *csdev,
> +                             struct coresight_device *helper);
>
rename here too

>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  int etm_readl_cp14(u32 off, unsigned int *val);
> --
> 2.34.1
>

regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

