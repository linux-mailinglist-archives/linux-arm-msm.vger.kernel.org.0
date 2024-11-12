Return-Path: <linux-arm-msm+bounces-37652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F379C5C99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 16:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37EB82823A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAF4205E21;
	Tue, 12 Nov 2024 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cnlc05KE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA6205ADD
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731427034; cv=none; b=Tt5M2UgpYW8RgH/gYa9aJnKgVOecH/IJnI5Wt8STlUZ+cUUCo6zktuz/a0rJdmDsxtQEip/vF2BF0Wp/9ysJjtxXS2zkkB/AuNiA3nyaSKLmsR8bNyHn5kjWrKzY4JQ2XM4w8RXc4OpZEJvPpjux7EUcQCBOpwbqfXYWYmw+vMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731427034; c=relaxed/simple;
	bh=1jjU2f1tjrQe5+VqBCl3RvHzuSsE0kITI7vbRrSnONc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdzTobhWKj8fL/P9GbNYPIO40hZCCRlRbGnBrBER6ZwPZcUefZ17wl9iiUvTVzOmBh1+Hf48U+ucif9e7RZ7ixpxzpnkf9/5roNwFg4BDHlXo7pHJ9qKeLS9HQOX0Jl/bcQGiyP1tN0CL/grU5U0ruxB7LkLEwM+seeD6Gsh09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cnlc05KE; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so5379703276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 07:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731427032; x=1732031832; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TUxAz/Z2gbXGo+S6Wkm3HXVMQ/72U6UPILm/sEMm+BM=;
        b=Cnlc05KEeO0fHQVvfFGc1hVDKVn4IPxTmHNYs6vXf//JRS02xDzU0//9TzcYvthLKF
         6rNKopAlTHGee3Hg0hwLaGharxA46/XreYD/tmgl36f+Nvk+sdnqEKX1r0S5Dgm+n0Ay
         8KBuRK8oM0uO2cJdZ2+Cenk7pxj3n6z0vG/tlH45N0/82wD6FXE8GQpDRjgwLJ7tzCH4
         zLVkTif0/yjLpxAXMxv0a3i1fOT8aJah8DeEuEwvIWRxq+24pR+yv7l9h68XCoMBrCXB
         tO/l+osPhoxNyfGEnumfrVXXNIBe3EaRy/DLzy0dxuQqUHFVGGNCkfCyhzkJuH+4nncd
         NhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731427032; x=1732031832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUxAz/Z2gbXGo+S6Wkm3HXVMQ/72U6UPILm/sEMm+BM=;
        b=O8/fG25C6rNCWwmi5f7NWXz92Jzf4U+TXRZnDMEjfRZIwBqIiG45yHPGsX6qAQAruY
         k29H5EjJAJ/Zz+lqXrCdfUFaUuXIjcONYaMafeDoLW1ueEfzCxwtDtKL6Vx6LA3B0z1u
         WWWu7xrq45F5UaQoymgyY7UGzehdimcnCZTLnzwPu9FWbAOneP6ocghLlXQzJT7Lv6+c
         cr/4JGm+seN9LySUV+a87SiyJ0lgkSbIYo3YmO8W0K1xJvHyrpRX47Sxg5gDiRQ3GUV+
         kDSKyMFl3r2vWuOFVB4+TIV5W3Yr5s5t3WIFqJT0AITDj7LoOdgz3cb5c/lfPdY8+WdJ
         K0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWd+7haS9kqGGpHd4nGRrDzzlw7wL71hkizSSZk9MMft/ou5YzCJM2kI9o/F1jfFZXHJ7LXduW/VtHjzFS3@vger.kernel.org
X-Gm-Message-State: AOJu0YwISeAU4UJ9XHCovZaFOL7APmayfwgw381VKwiYRDcfCMn2Kjxc
	X+3z0nHh1o9aDvWgizx4Tl4raAWSgMspSLkGZOZRHWQInRvv4vD1YGW/dtG5yZlOVE38fSYXQOa
	08BzRqaqQFpThnwnEh5rzRQh3/VE1nL50Z+/jyg==
X-Google-Smtp-Source: AGHT+IGxKvDCTnSu9K5GtsvLrHqik42J0uKIcJLRzwwShC9Gb+pV36cVlENq/Q4s/ju5EfTbb7FM2A5VXJd6NdZBAy8=
X-Received: by 2002:a05:690c:710a:b0:6ea:7e37:8cec with SMTP id
 00721157ae682-6eaddd74f16mr163974757b3.2.1731427031788; Tue, 12 Nov 2024
 07:57:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112002444.2802092-1-quic_molvera@quicinc.com>
In-Reply-To: <20241112002444.2802092-1-quic_molvera@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 16:56:36 +0100
Message-ID: <CAPDyKFptAh9fm8CBqKisQKg7Hb3sL_8XJC-GPdVXNJz5t2U4VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pmdomain: qcom: Introduce power domains for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Tingguo Cheng <quic_tingguoc@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Luca Weiss <luca@lucaweiss.eu>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Jishnu Prakash <quic_jprakash@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 01:25, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add power domains needed for the SM8750 SoC.
>
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf
>
> Changes in V2:
> - squashed bindings into one patch
>
> Jishnu Prakash (1):
>   pmdomain: qcom: rpmhpd: Add rpmhpd support for SM8750
>
> Taniya Das (1):
>   dt-bindings: power: qcom,rpmpd: document the SM8750 RPMh Power Domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 26 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  2 ++
>  3 files changed, 29 insertions(+)

Applied for next, thanks!

Kind regards
Uffe

