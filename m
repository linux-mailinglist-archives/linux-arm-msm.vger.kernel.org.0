Return-Path: <linux-arm-msm+bounces-26579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5C935049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 17:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57882281ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 15:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51583145332;
	Thu, 18 Jul 2024 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvRVKrVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B21145320
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721318268; cv=none; b=Ru+rZVjc4GIP2FN0stEor4saQlx++C4meZOCxi1fnYrSjF9GvnbbLeMnuChaQL1v/1ucJaofxsWlvwuWeiORIm/PkRLAY//riKOZLX1duqPErjIANGCFXdbQy4nkFmqzew0W5Ov5SEr4PiPhukvBdRZ5nI3/sgCMNpLFY8+6Xpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721318268; c=relaxed/simple;
	bh=16fmhBnx+VjuzqSJhVynh6fThoOJBLLG3JzTtLr+Wzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArU7yTgTtA4Nrr7ovp7cdOwqcHnpq6lJwKd+i/xG+48In4zdBLx1S4ff7ZnydNXB12j9jUDdz18HPly7Tn/cg6/IMp+cglhf0+lBz7tbS3v76d7v+u5OMFsAMz/Pmu6FUsU/YCVNPdK96Afw8xbD3Dy0riyrNU+dO2b5oem7L3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvRVKrVW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70b04cb28acso2689b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721318265; x=1721923065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aUOazNtZgahbZNIe1ko3EtaFbZsZJypf6FKKEyap+CA=;
        b=PvRVKrVWef7qb/oKCUuQtfMRj5EYg9TCJpp8axfvLMEkS7MZjMtYql5kSAxjU8wmZE
         Jm03uJJItS2p5WZ8W7Rio9l8U5yQLtllumfuG9xG/65NpEuKfvD2y0PRhahONm2wgId6
         FeL6NvxwRNAmg8kaUwO+/LAK3jU/Mk+oOzYmyy/yZ9PJIrhWEMBBWcjBSRAtm/1J3nvc
         h2O0UMm7uoU6YQ3jY3z8VmyxS1nFXkVH3QzNDYcMwtSDPFZvH1P5yD1BrNAnjgOOKprb
         gT3F0mkJ1V+uuRW7YfXASKXTrsGh5YpynzZDQ9TvoAGU2HR3wVYh9r1ktF6RyuL1MG/1
         5pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721318265; x=1721923065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUOazNtZgahbZNIe1ko3EtaFbZsZJypf6FKKEyap+CA=;
        b=V6Vo9RWHzBm9QXYzNP4+FU6MVA8hIxM0JfNh8DBn7S6pyVE6uD+Nb/CPXrRiJsFLzc
         4WP1pKJT48VGQzx/Z02MbX+fYmJNCRUoeROrIMlTg9SiX8XcvL8WPMmiTRY29XPLJw1F
         yzpvBevSBEF3qbeCsEFqD9OxRI3Ay60SrpzDtLn2dDFFQ+tJuolm5n5HMuNR32jmQ4zI
         8sbQ78ZvkQNtHbubu9SbbpDrDT/0A8YQpflL+p7Z7qbgBaTECrsfMxE+dfcvMKxXw5j9
         ScI91t/6LbUJ9lU+S9QKArElk8bDw479azBnP4eKXHgyBCYR31Bj0LnS0TvlqoS139cb
         /fkA==
X-Forwarded-Encrypted: i=1; AJvYcCVQLVCYEKQes8aBrzOqXSKLVXLE6cKw1cLw1lsaIVcJbSrLlS982G9jcxnuZea9QXFoRsTbcAoINNFYqacaeTMgbaBQoIS0qxC9dZitmA==
X-Gm-Message-State: AOJu0YyP+k4PNK1d8TnumdBN2xl/n/fetyFOwIz/NyC2XH/AWNGcZt0b
	xjX/gXVAAdHEPc8m6VXVpHakyr4rsoaZk/BZfqze90p84CfNbGUaaKn5H2w88PQbtvbiinoCASf
	JDIvSutw3ZXv7MLGEt1n4FzI10V2KLK+qOXIWyw==
X-Google-Smtp-Source: AGHT+IG8BxlqkGWqEeb+721jjFcIFxtCMvBNkuRDQHPWXpgXL4Mo9erFwADNMWLFeNyYDIxwkO/2RlwZIh37VMSzv5I=
X-Received: by 2002:a05:6a00:cd0:b0:70b:5368:a212 with SMTP id
 d2e1a72fcca58-70ceebb6d6dmr4399389b3a.15.1721318264694; Thu, 18 Jul 2024
 08:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
In-Reply-To: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 18 Jul 2024 16:57:33 +0100
Message-ID: <CAJ9a7VhG4qNLnT87J7OiXpygbtMRZ8uAvNhZhcRCBxovMEPDEg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] coresight: Add preferred trace id support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I have detailed comments in the following patches but in summary we should:
1) consistently use the term "static trace id" for these devices where
the hardware sets a non-programmable trace ID
2) Simplify the patch set by introducing a new API function
int coresight_trace_id_get_system_static_id(int trace_id)
This would avoid having to change drivers which use the existing
function where no static ID is required.

Regards

Mike


On Wed, 26 Jun 2024 at 07:07, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> Some HW has static trace id which cannot be changed via
> software programming. For this case, configure the trace id
> in device tree with "arm,trace-id = <xxx>", and
> call coresight_trace_id_get_system_id with the trace id value
> in device probe function. The id will be reserved for the HW
> all the time if the device is probed.
>
> Changes since V2:
> 1. Change "trace-id" to "arm,trace-id".
> 2. Add trace id flag for getting preferred id or ODD id.
>
> Changes since V1:
> 1. Add argument to coresight_trace_id_get_system_id for preferred id
> instead of adding new function coresight_trace_id_reserve_system_id.
> 2. Add constraint to trace-id in dt-binding file.
>
> Mao Jinlong (3):
>   dt-bindings: arm: Add arm,trace-id for coresight dummy source
>   coresight: Add support to get preferred id for system trace sources
>   coresight: dummy: Add reserve atid support for dummy source
>
>  .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
>  .../arm/arm,coresight-dummy-source.yaml       |  6 ++
>  drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
>  .../hwtracing/coresight/coresight-platform.c  | 25 ++++++++
>  drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
>  drivers/hwtracing/coresight/coresight-tpda.c  |  2 +-
>  .../hwtracing/coresight/coresight-trace-id.c  | 35 +++++++----
>  .../hwtracing/coresight/coresight-trace-id.h  | 11 +++-
>  include/linux/coresight.h                     |  1 +
>  9 files changed, 137 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
>
> --
> 2.41.0
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

