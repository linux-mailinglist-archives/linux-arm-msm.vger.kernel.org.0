Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF75645417A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhKQG71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbhKQG7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:59:25 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AAEC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:56:27 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id a11-20020a4ad1cb000000b002c2657270a0so715495oos.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=5hi0dTQ0bgJng2njz1mkZU8B/uJ8AXVykozTffCQIl0=;
        b=DoPQGzC3AwQ3lZGT0z8n7xkQIZ/96SpIBYiAAoS8/08iSCgP/MTeyiNjdXhsD4Abc3
         V/7lOvSQM6gUAQaCWlor2YpdmiyMBSYoEM+xw+jYIM0OX2zwi3XjQPM9iyLHO2JYDUCH
         wInLzssZNqpcKYrIyf3jCVHIP7hkLHUPppMzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=5hi0dTQ0bgJng2njz1mkZU8B/uJ8AXVykozTffCQIl0=;
        b=Aw1Z7VcEdp0QI1AxiwtdmkIfe10Urf/UG1qa8JEsUK84YkIftmFIjPSn315nyQkD59
         qwaw8Yxc+fiLioeNQPrG/d9pF7VP/plDCFpMQuwGXlbOSGJo2aJYxqnGW9jK2fhF3yuB
         jsUMiRYjVRhjNHmtKLLJoinzaVSxIwH5EG6NsVSatElL/V6P6LgbUDqzFg+U8Y5WHa3e
         wdp8rESpM1Elh+VI9H2HGQgUwXVy+liKJGCPnyC3mB3+P9INA0/eOU0829GjlCwpDSJa
         sOc1Z22kjAGBelba9dJQSPBqhf0D0yijKSGe3qD0H/i/QKF7fTGvxfLOT8krvcpOrpIo
         Rj8g==
X-Gm-Message-State: AOAM532KGwV5CZmi6RdN5/eDdXsyw9LPv23EuJs+ZXo6H/kzWUfd2tPw
        8MZ7ukO9i+pnMS6cBiIvAcm1Mz/BcDuo0EUzF0npYA==
X-Google-Smtp-Source: ABdhPJxzyge8aVq3hI6xK651KJ3Q1dzB7runhpnnjZrY9z9YA8THzH/yCh0x36cT4HihmUGUR9uaFSNfvjLXcJrSIEM=
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr2689044oos.25.1637132187071;
 Tue, 16 Nov 2021 22:56:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:56:26 -0800
MIME-Version: 1.0
In-Reply-To: <20211114012940.112864-1-konrad.dybcio@somainline.org>
References: <20211114012940.112864-1-konrad.dybcio@somainline.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:56:26 -0800
Message-ID: <CAE-0n52MkOx8KC4jSmEHMhmk8sDDf0YNMWhvH-g=Y=OJvA-+1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: llcc-qcom: Add SM8350
 compatible and defines
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-11-13 17:29:38)
> Document the compatible string for SM8350 and add required defines to the
> binding.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>  include/linux/soc/qcom/llcc-qcom.h                       | 4 ++++

Why is this include file part of this patch. Shouldn't it be in the next
patch?

>  2 files changed, 5 insertions(+)
>
