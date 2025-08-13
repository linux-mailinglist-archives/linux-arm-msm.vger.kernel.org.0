Return-Path: <linux-arm-msm+bounces-68906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6FB2432C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 09:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F2F5653E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775512E36FA;
	Wed, 13 Aug 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLyuCYqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9032DEA60
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071382; cv=none; b=HHHKgTYoGjM1f2rtvX9VIYT9aoQ3KJGDZeYcr25wivaU2qcVJf+1E3nutHKoLZmPF92pa+FBeViuWACh5hRKcmRMrUm9ghXlV6AhcOwmjJafol/F+R7jkeanx5qVWlhVEDKAy0hig+ptYUYKnUcgb2PgmBLAcEH1DY9r5hzvMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071382; c=relaxed/simple;
	bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B//oHzYqSM5srjwjZpujAjKunhpnjip3eZct6xHg+MMvhHhYsiNxe/fZ98IrJ77yT9McAqHB6nCWgXQPJzIuDO18/ALo8QZ8Jula42XsBGvfREHeV+EQjm9cknuzJ4gDmzW734FT1wFMe+eXvoo/hJK2P0gcjK26+DSqZj6hzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLyuCYqE; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-619a603b7cdso1885476eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755071379; x=1755676179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
        b=XLyuCYqEnk9yF8JdXGunyN+ujw1Fymw1txYThuFHVO2alhysN1K4UCef6XGGbyw5it
         2w0IztDtFaXf65o16a9X5/C6QcWHc/D94mgHCUwA34dngIcBBdYYDnV54lk3yrY6Si7x
         gIewLX3Vp/4GbAGHr/ZjpbHAauw2rtEsgLo7/PNdYPphtnLTjL1YCQiJFlIzHn6ofNsW
         nD76UpLQUHYCKuBeJiR8PSOAuOchc/t5lZ7/SIK75NQw5Fir5TTIkgblpdxglIh/dcZm
         i19+M2atTq0+VCm9ibcrVebj29D6Bute5K5CHRYwwqLlty+2MyY5WNCJ0vWDrPpSnkAv
         mkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071379; x=1755676179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
        b=Nc1+ZdVn7GS1tCBDBgytHbSNAz7QoyxXZbrpdSPy8Hjoo1oOtCLzawqri2JF8rIciC
         pCza67rdHyncElRZfzabiSdmcboC8MyU5GP2q8fx2uQ12exNu6PDv43bAqJa88ydVfdn
         n8yfI2FAGsTqlsTRUR/YFuVG+SV2UnbhNnWgPkThjWPA9f1e2WUMtoRlIzoqLj34tHJJ
         h1uUkJfM2xpB4qXhiV5vsr2h4qH+vBpACk8a9Mcs632a7x6VvSLBQSocLXOUynx0AEuh
         lVj6E7zwfnDysrDjCNTxt6nscJNuATwPFwx5AAwFM5Q+NdQO8R8HKIKb8sl+0/ubNq5I
         F51A==
X-Forwarded-Encrypted: i=1; AJvYcCWhwBWsGGBUG4JUZ0ZiTQP/5/53oUjhxbLvRvGs+MTcpS+rSUYV8Wf9uFtXn+CJSbnJuHq6URFJrAWLlE7C@vger.kernel.org
X-Gm-Message-State: AOJu0YwYG68Lj95oCNERuUOmust4CZFOFKXG+2v/KXBjFoTD0WcpgKt7
	1AswTECtPBP8vSqajtC/nvEUTgy8kTTmrYCN8KGphbU61QZWeclzA/gxDqmDT5blptTDoMs8TbI
	Qok+K1Aa3m8vvf7ekF0jX1Kf12Jr4Tly7zWi+SfEAOw==
X-Gm-Gg: ASbGncv0fqWezodcPAQWbvD5uUR35KgOOV5BeENiVnA9Fv0PcgoVEIA9f+TZgik3Xsc
	jU55DVUWSeAS90KrrvfWoS+zQxrLo9LSCqDpYU1uIFVlaGgf9BUsJYo2WDVI7AQ6MoZkTfG9GlK
	EeM/hY8Fd51vrNTzmf00mDGfT0E21AH2Z+WQIoDPuUvYZaJyjWGRAWCRe8LZVzZu3WCvle/cv5a
	ZLV6eb6z7B1Q14Y3XM=
X-Google-Smtp-Source: AGHT+IFAfPPXVnV/fIsv8KnI8b8Bl+IOsf+U5t0pmvRJM0gZ8xG3AukFt3DXdXVb9aF/gWZVqDSUuTyRuSP2uDtgU3s=
X-Received: by 2002:a05:6820:1ac1:b0:619:a6c0:b4b with SMTP id
 006d021491bc7-61bc758538amr1013523eaf.5.1755071379266; Wed, 13 Aug 2025
 00:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 Aug 2025 09:49:27 +0200
X-Gm-Features: Ac12FXyfvHrDtrackOzZC99WcBb71C_WC3_DT2d5Ppi_3YWKQtwtthH808vWulI
Message-ID: <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Wed, Aug 13, 2025 at 2:37=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
>

There are some build errors/warnings for arm and x86_64, see
https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/jens/plans/31DmCOn1pF=
2JGVDk3otBOXOL6kV

Thanks,
Jens

