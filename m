Return-Path: <linux-arm-msm+bounces-15485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99388F4F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 02:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010DE2A24BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 01:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DB7219F0;
	Thu, 28 Mar 2024 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBg5y5MS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD408F6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711590905; cv=none; b=cPlzWlPeYo8l9erNSib+nL0SXOQxxwvgF9Bsjv0E58kfTYGTl+yeGEWUG/kduEu5dJQjCHF560umAqXLOWJNdsTVbb56YLKU06QpWbBVZloCryNynFNgQHWfVEcgvdOuFOmTsFwFWLTy59sdEP++RBn8gSQnBleM6INRE2KmKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711590905; c=relaxed/simple;
	bh=HZdnwNoXxWoGzLg2VQ6m1rbwvJy9TXrJcq306nSM7WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhSyHh3LsC+25ctRxKNbkxd87CsD6aBo1cZLW85110710G2NkR83Kw8QvKaNVed0TRlxsmGEJU+be4lKBkJrg7/Mj2uvKAz7cpAU88lrpwKFYBqm7Qt2zw+oF/zeZTSMTzUGZ6ExUbZPLbfGSj2YAASjK18bEWjTAkkskBwf9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBg5y5MS; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60a15449303so5686487b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711590902; x=1712195702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALb/aRygHviOk6gluVyyo7V4k4A2Pfn1TEU0psjmkus=;
        b=DBg5y5MStygXbyrwRN8W7e27eaQiA+Y/Tofz7xAZJk9ljVbqrxkCJxly0QyDALVUhE
         GpQoNLMeAHbbkCvnpo7op9xHmxqzeFCc3H4S3+GZ+fpyO1wrTVVBYWu/Cl4sbxXbFR3g
         ZNI/vV8T05pO+Q4+l2wuZ78bPW3KDaxLjD38zGvwM4+EeEa3qHoX1A+hW/YL1pt+9z+L
         XL0kKm/JoAZKaDD02PnvRIgJm7WjMsZJ/PJt1o6yn4ToYv+vrmmPde3yzDNXP7f7EtGT
         5TlAmsVIX+/W9kUgPyxtqmDuZ5R0QljUyv3aubB7slaVnDnOHz4ZskB6kjIq2uPTrd2/
         OJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711590902; x=1712195702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALb/aRygHviOk6gluVyyo7V4k4A2Pfn1TEU0psjmkus=;
        b=A5UE8E+IhsnycgGST3ZYYfr8PoZj1BCOCqwj3F4lZpCujUvVnLXH8nWXDzyl64QAN5
         cQaw2cOuhV71CYJou0kERt3Ix/SV20FhsGDK/cEAs3q4BnCLa4z+blyZqf61ReOj7wKu
         EGD12+0ewmdCwKVQnAwo3zJpLqHNJrbj+mWY3LNH+2IMFbxi3oNtEG5V71BDqbwIkMBB
         dPBwy+HW7TvYHNx1KxN0Xk7pJ7/naFCYFQ+SFNcXJDf9xdirD6j6Jn6ygrJIR+GpcsY8
         AVbmpazxYhRXWrHKILxMzTR+TYKu4J3CrZFe1kWoK0A6mXQ4N855x7Ccf+IWxzhS++qR
         sEEw==
X-Forwarded-Encrypted: i=1; AJvYcCXr+c1LnsATYoAr1zNq15fVws99V9L0A1gphe0mCDcqf1/Fzz214RVSyKQh1csXUXpwlKRB6bM0qun8BHHeEkHPhwXw7HY4yHGiea0NMg==
X-Gm-Message-State: AOJu0Yx80ZZYo9qz+SlrZsW5Bq9GV0UhdJDVOxZBi0ygR8+gq8n/uQJX
	0T3e1a/3TcqmYOxGY6OWCJyMzyGpm9v0HNZjBCF0IgDIVTAt7LX3ZOPEtFrAxt6TgfuQwmMwpD9
	uwJuP8ARO7yxhSQOy0a6pTgDYOyUcbybudIZmGA==
X-Google-Smtp-Source: AGHT+IFCbaTC3zvlel//KUFNLOeGVfLTLHjUeq3vH+xCrngLpNb7HC0ZeixUsAO/5BEehPEYBqCSaYH+eE2+mYXJSu0=
X-Received: by 2002:a25:ab8d:0:b0:dcb:f7a0:b031 with SMTP id
 v13-20020a25ab8d000000b00dcbf7a0b031mr1608022ybi.50.1711590902480; Wed, 27
 Mar 2024 18:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-rb3gen2-dp-connector-v2-0-a9f1bc32ecaf@quicinc.com> <20240326-rb3gen2-dp-connector-v2-3-a9f1bc32ecaf@quicinc.com>
In-Reply-To: <20240326-rb3gen2-dp-connector-v2-3-a9f1bc32ecaf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 03:54:51 +0200
Message-ID: <CAA8EJporooWutXaN4DYHK_G5=zY+tW3YLcieAwAX1Xno6KanDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs6490-rb3gen2: Enable adsp and cdsp
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 04:04, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Define firmware paths and enable the ADSP and CDSP remoteprocs.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

