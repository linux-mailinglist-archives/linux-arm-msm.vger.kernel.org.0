Return-Path: <linux-arm-msm+bounces-22536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448D906181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 04:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D25031C21025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 02:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7B91A286;
	Thu, 13 Jun 2024 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="18qDkGW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D6E17C72
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718244150; cv=none; b=LyXLBch4ZY8arVvM7jkabdhxsRrMarKqHZpagr+57C6pbaCPyF52M3+/5fUA9JJUaV382x77L94pLfAJgPg4SUU+NzpPdcUF33fg+WXHN1m85i7izDnJ1kPk4NcC8etsQr+lLvUx3cfFoy1RlDVYm7I5VimfYQD9syd/hrz4eYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718244150; c=relaxed/simple;
	bh=+xllZMdBX+qGYl66pUqWVWmS+KJJy0KUGLz/bxODEWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRbzrjB0lb3B13V4JTCLlwB4nhREtk/oz0gTbb8prtNDxhIXDRKBKvX8RDxsV3DhYTs2d0T4GCjFdVcDiKPrIQ4Ned89JD97++MzZFxxlokQEEbgZEaUfyPxXsm6m7yx1oshkT88eWT9maQi3PdohJWYX2X55J5s+5zEUIWsQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=18qDkGW2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421820fc26dso5188995e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 19:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718244146; x=1718848946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/z8i6Pl4rEpgnkeFbeRNLbhhFTG+NJSS60yF/T/YdQ=;
        b=18qDkGW25gB6PmgULHyIzI6XN/Pz7YK0/YInyWb8N8AiDzdEkU8XUfDXSo/dTJWOae
         fo4JfSQVjYkaIuFA8lE1ih60GijN/CiV3ySNh1Ixa4s2aYyfp9BGE7O8N+R8NNNx2YNM
         0Ey3YpExjg8+ZwH9mINIJpN4wM0JLSHLrZZn4gEOe9Fe2LAN0YFFOOOFYv+3FajU2VW+
         jP9OnHshIWFz8553uHIeWhVYWSyOsCk+yQCkSIaCq/vfnY0lnRVcNPEHc73ef+eMzmYh
         Bsfqse/AhIW60i1FgkJB842FkEqFfWfxbmeCUtqRfSts4sN/f1ZkDsleczr6q0zcq5+U
         2R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718244146; x=1718848946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/z8i6Pl4rEpgnkeFbeRNLbhhFTG+NJSS60yF/T/YdQ=;
        b=UTj3QBUYvjMqCI98l77kdvAp9oom1dY5suDoGCFTrCyEeBV9GEPDkG4Z4/yQZBzkK/
         bH3nn8kYVKcAOdNytJqKzg3Pu6EuX1ngHurph5DlK1REJ8V3eAfgd0qykLhQcdJ+nx4m
         xZLNlF7VyGDkRiSxI8O/vg51tKmFuyYi7E7vZC088Ux9B1obNQ+prVyx8v2K/PQhe3MV
         P4ztVQ+5AJuu09TjpvUeN9kUEM49+bhJJwPpYrnRsksHh2HuLeuhwYN2/ITi6FiE1/c4
         V1cwA8wPhecPoXDxj+lRr7OTuoBtrLSfejnZugiTPLQeIknHEIOuSrJfQOUYDLMxGGm6
         9fCw==
X-Forwarded-Encrypted: i=1; AJvYcCU0OGTzNo7qXX9gXbfT+761guKhuxAlvJ5yAGDJKQNvpT6w0HIwvBrUyswMzrOLxgHIs9gq5N550oSMFuXgyUt6snt33HBa8ZdhKAjBZg==
X-Gm-Message-State: AOJu0YzcyXP/N2YRsKbEl0DLAcRbgWPHOeayaOPv1BupolbJhXW1EnHS
	8oAqLEkI1Q1MqMM3R4NkaF+ywtiPhWXf9P3gvFQ3BYm8+EwNNXgCUjvvW/Tys5Y=
X-Google-Smtp-Source: AGHT+IH6TMZpM7WdFYZbCGBFJhgYHsC6JVCHyLOSB8U2qyBnIKYrH50ZszMxXRh1Ocr1UWGgsHDyFg==
X-Received: by 2002:a05:600c:1f89:b0:421:7476:6ba1 with SMTP id 5b1f17b1804b1-422866c63e4mr26634975e9.38.1718244146199;
        Wed, 12 Jun 2024 19:02:26 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:4005:4e7a:f4d9:7f14? ([2a01:e34:ec24:52e0:4005:4e7a:f4d9:7f14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641f522sm5550255e9.48.2024.06.12.19.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 19:02:25 -0700 (PDT)
Message-ID: <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
Date: Thu, 13 Jun 2024 04:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr> <Zmnejlkb869mN3eS@matsya>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <Zmnejlkb869mN3eS@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2024 19:44, Vinod Koul wrote:

> On 06-06-24, 18:07, Marc Gonzalez wrote:
>
>> HDMI TX block embedded in the APQ8098.
> 
> This one too

I assume this refers to:
"Why is the patch titled display/msm, this is phy patch and it should be
tagged as such."

I always copy what others have done before me:

$ git log --oneline Documentation/devicetree/bindings/display/msm/hdmi.yaml
27339d689d2f9 dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
6c04d89a6138a dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
e3c5ce88e8f93 dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
2f14bc38d88a4 dt-bindings: display/msm: hdmi: split and convert to yaml

Are you saying we should diverge from the previous nomenclature?

Regards.



