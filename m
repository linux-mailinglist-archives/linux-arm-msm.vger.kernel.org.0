Return-Path: <linux-arm-msm+bounces-42624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53C9F6269
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7081516C960
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214B4198E75;
	Wed, 18 Dec 2024 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXf5y6MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A798198A11
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516746; cv=none; b=ezHebJrhGyVdTosvMcdm7afhdKTvkXNvvpWBqdMKEobMzHCoyDT01HVaGFaLZP1zt5cENqyJB+Qb8ZFmFkq5VCqdfXSie7ACzOZ2F2P0Bd+VBU2jbqBoBmEse+LcPHsjiRPkjqFq4qAhdqQgjIr2UW6cfcQBl2HyzQgQFKmAsLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516746; c=relaxed/simple;
	bh=mO0MW2A6xJIDCxQrZqqzgqCAyY+doYkSObDredfEHH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO1E3f1MYQjas0bAfCZL2/pei/YeZr2bS7b2fUV8X+OquzXeSd5pinPz/ZlLAEsOX8bk7Rl5/6dbYPPA4i3vefuju6Xd9xsh/bdZsOQAYMemn1KKunCaRY/IA4SJoNmjKBoKcVne6JF1dCsBJX53rUr21X1HWEdnePBH75kYnvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXf5y6MM; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso4276680a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734516743; x=1735121543; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVHcm9pauC3GhK5+Y9PUhjKsCgNwGsAmTgrtAcTlGQE=;
        b=oXf5y6MMMFxrXoAIrGw81rP3ynFldm5vfzoH/3xFbv2OWW1KbWlwrqcp74yDbUWmOs
         +Fk24/99hJ7hHdfxu28AnUWO2jowdTJW664+il8kh3ElybYQwDLLAGvvsNgCa4uEMBGn
         bvCF3htkEdIjpA9wMYd6Z+2O07SoBYUiuJ3Nd8urk/J2wxhMYC4DrZluN+J9uLAoIUhi
         UiEMQfxgsU20crnhbR3GWcuv40co7WhKIuv4egItz+NI2KckSr/PiNvW3wz1jQuYjhms
         vphUlHWHqoLikb/YaAEbqNJ0LepOntEKxjYCGFOvOOq6KuC2rsrJSFyLwF3czpLfd6cx
         dujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516743; x=1735121543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVHcm9pauC3GhK5+Y9PUhjKsCgNwGsAmTgrtAcTlGQE=;
        b=n7YCrvY56DWvY7R4mZQUXFmZ5s3bg7FmOK4sBk/eJanRxDqmDtMykOqkRMebWo6Kft
         TPfru9+kq4TSkBeyIwh5ueY85ZOKk9Q2xJWekjyOqJlzZIRoJfjjXJoz0b+hVF9m5L02
         0+qS5bLPcKr7NdukJy518skeg/tWPSiF0IFEBUmDPai/h3N7eWyBQxUio2xYT2McIJ3V
         VfuY1j5MnMJb3j304R/ovmihrqHD+LCGtRwzWMFyt+MtfZbKO25ptHQH4TPy5IVIPaoP
         afh5z5SMyDAEdpWwzEfdoJgR0kAks46tEFF40TIxd54oZ/mIL4zcxwxEOyDLwOQMbs/7
         2Bcg==
X-Forwarded-Encrypted: i=1; AJvYcCUSpmGq08ku91/dmNjEMtRmMAc42skNmfvo05pLtJw/yjc8ki2WT/9VBDvyn1CG1euuW1KHLbTQWdWCGsxb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQtdxfML2ztcN8zF/icFIGCF7nNAqzNFuhCZzVpZ+5qfDYrxb
	LkkTooJa3OfKbZ4eu6NMFAvg9cXY1J7nf2Y7F37A5IjNc0wLM36AjMJMWH3FunKdS8vUvBQg2Cv
	CH+ybantHcUIzyc2f0gwjghmNnQ5UkGANRVqTvg==
X-Gm-Gg: ASbGncsvZ9gEZMxUBdRwJcR4H92pHDOwZC65/DTP2bYa5DoGLnOh3E/MDMhksFD0HrB
	Hl5Vaye+D2hEcLuyJMGzr6CFgDbLFW+Qt5aBO2UU=
X-Google-Smtp-Source: AGHT+IGCS/12iXVQImv5VzwIKtHSK1STA1CqvbkzaVeJurm2ZhL/a0FzlOc63mIq8E3wtYzMzC2DjfMhljG616CLMWI=
X-Received: by 2002:a17:90b:4c0e:b0:2ee:49c4:4a7c with SMTP id
 98e67ed59e1d1-2f2e91feea3mr3241058a91.18.1734516743666; Wed, 18 Dec 2024
 02:12:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-3-quic_jinlmao@quicinc.com> <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
 <f1c6da16-fbfd-40aa-a158-36ab713ce541@quicinc.com>
In-Reply-To: <f1c6da16-fbfd-40aa-a158-36ab713ce541@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 18 Dec 2024 10:12:12 +0000
Message-ID: <CAJ9a7Vh6EZij9ZTMOj4601QbUZ3S6mqh7USod=uXMrJsXawkkQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 18 Dec 2024 at 09:57, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 2024/12/18 17:38, Suzuki K Poulose wrote:
> > On 17/12/2024 06:33, Mao Jinlong wrote:
> >> For some coresight components like CTI and TPDM, there could be
> >> numerous of them. From the node name, we can only get the type and
> >> register address of the component. We can't identify the HW or the
> >> system the component belongs to. Add label sysfs node support for
> >> showing the intuitive name of the device.
> >>
> >> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> >> ---
> >>   .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
> >>   .../sysfs-bus-coresight-devices-funnel        |  6 ++++
> >>   .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
> >>   drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
> >>   4 files changed, 50 insertions(+)
> >
> > Do you think we need to name the devices using the label ? Or is this
> > enough ?
> >
> > Suzuki
> Hi Suzuki,
>
> In my opinion, we should use label as the device name.
>
> It will be easier to identify the component with the folder name in
> /sys/bus/coresight/devices/
>
>

Please see the my comments from v4 of this patchset that explains why
this should not be done- re uniqueness and allowing scripting to
work:-

https://lists.linaro.org/archives/list/coresight@lists.linaro.org/message/Y65RKVUJUQGNARMWCOLSD636K7LROLYA/

Mike


> Thanks
> Jinlong Mao
>
> >
> >
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> index bf2869c413e7..909670e0451a 100644
> >> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> @@ -239,3 +239,9 @@ Date:        March 2020
> >>   KernelVersion    5.7
> >>   Contact:    Mike Leach or Mathieu Poirier
> >>   Description:    (Write) Clear all channel / trigger programming.
> >> +
> >> +What:           /sys/bus/coresight/devices/<cti-name>/label
> >> +Date:           Dec 2024
> >> +KernelVersion   6.14
> >> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +Description:    (Read) Show hardware context information of device.
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-
> >> funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> >> index d75acda5e1b3..944aad879aeb 100644
> >> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> >> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> >> @@ -10,3 +10,9 @@ Date:        November 2014
> >>   KernelVersion:    3.19
> >>   Contact:    Mathieu Poirier <mathieu.poirier@linaro.org>
> >>   Description:    (RW) Defines input port priority order.
> >> +
> >> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
> >> +Date:           Dec 2024
> >> +KernelVersion   6.14
> >> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +Description:    (Read) Show hardware context information of device.
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-
> >> tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> >> index bf710ea6e0ef..309802246398 100644
> >> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> >> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> >> @@ -257,3 +257,9 @@ Contact:    Jinlong Mao (QUIC)
> >> <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
> >>   Description:
> >>           (RW) Set/Get the MSR(mux select register) for the CMB subunit
> >>           TPDM.
> >> +
> >> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
> >> +Date:           Dec 2024
> >> +KernelVersion   6.14
> >> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +Description:    (Read) Show hardware context information of device.
> >> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/
> >> hwtracing/coresight/coresight-sysfs.c
> >> index a01c9e54e2ed..4af40cd7d75a 100644
> >> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> >> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> >> @@ -7,6 +7,7 @@
> >>   #include <linux/device.h>
> >>   #include <linux/idr.h>
> >>   #include <linux/kernel.h>
> >> +#include <linux/property.h>
> >>   #include "coresight-priv.h"
> >>   #include "coresight-trace-id.h"
> >> @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device
> >> *dev,
> >>   }
> >>   static DEVICE_ATTR_RW(enable_source);
> >> +static ssize_t label_show(struct device *dev,
> >> +        struct device_attribute *attr, char *buf)
> >> +{
> >> +
> >> +    const char *str;
> >> +    int ret = 0;
> >> +
> >> +    ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> >> +    if (ret == 0)
> >> +        return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> >> +    else
> >> +        return ret;
> >> +}
> >> +static DEVICE_ATTR_RO(label);
> >> +
> >>   static struct attribute *coresight_sink_attrs[] = {
> >>       &dev_attr_enable_sink.attr,
> >> +    &dev_attr_label.attr,
> >>       NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(coresight_sink);
> >>   static struct attribute *coresight_source_attrs[] = {
> >>       &dev_attr_enable_source.attr,
> >> +    &dev_attr_label.attr,
> >>       NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(coresight_source);
> >> +static struct attribute *coresight_link_attrs[] = {
> >> +    &dev_attr_label.attr,
> >> +    NULL,
> >> +};
> >> +ATTRIBUTE_GROUPS(coresight_link);
> >> +
> >> +static struct attribute *coresight_helper_attrs[] = {
> >> +    &dev_attr_label.attr,
> >> +    NULL,
> >> +};
> >> +ATTRIBUTE_GROUPS(coresight_helper);
> >> +
> >>   const struct device_type coresight_dev_type[] = {
> >>       [CORESIGHT_DEV_TYPE_SINK] = {
> >>           .name = "sink",
> >> @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
> >>       },
> >>       [CORESIGHT_DEV_TYPE_LINK] = {
> >>           .name = "link",
> >> +        .groups = coresight_link_groups,
> >>       },
> >>       [CORESIGHT_DEV_TYPE_LINKSINK] = {
> >>           .name = "linksink",
> >> @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
> >>       },
> >>       [CORESIGHT_DEV_TYPE_HELPER] = {
> >>           .name = "helper",
> >> +        .groups = coresight_helper_groups,
> >>       }
> >>   };
> >>   /* Ensure the enum matches the names and groups */
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

