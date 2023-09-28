Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32AE7B1456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 09:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjI1HOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 03:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjI1HNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 03:13:54 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E876A66
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 00:12:08 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c0ecb9a075so94108615ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695885128; x=1696489928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJoUNwdaki6Xdk56w8h4X10ZwavJLOep/NoqWzb5sro=;
        b=KmocmIaXIoK7M2uIcsBsACfhSzBDMmYL+BZ+pBVQuHEwgNJGsHu5+MpdSFDYLihb6H
         4G3edLHxEY40942iuQTvMrdRcH/RIormLiKPxL8Q49lj/xfFUVoNZvgNGGPmAXeulC8Q
         wEl9ISvB5sZG+yvfyzfg7v6QOL2c2HYOrKTnohCxEjD9IT2n3q5TPWwaPJFXc+S7gPDZ
         Sw7Lth4FIdCJD3EVcyqB+MmT3Szkn7PQt0Py4LYpC8zcjgfAEmaTGscnCJnNLpKrroq+
         xJZODxBR+0Vg1KnJmXFUVWes4+SVw6zZoUbUks9pSNeR0JrtwEi4W90bUSLs2SqnczmR
         5o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695885128; x=1696489928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJoUNwdaki6Xdk56w8h4X10ZwavJLOep/NoqWzb5sro=;
        b=sMFwX092KlgPAVLd0/YC4zYCBSM3eiH+1Y9bout7mwa/70F1Pl4kSREfi/59LzxN4h
         /OQqp64JmGQObrDBlKZnKC1OKyi2zyoK0PK9FW9XMkmgmYAjKJ3Tz44vvxoTx/n1hwCH
         LqCj2hGLQTYw/Ep0UwziUTLCtc88FoOTMxXZJjSzHiEvewx8bMwEAr0Fqe5SiIDAYgVb
         SuAa4PJDbE/HT4vs1nEnht5rWgxlr3YsOZsQAE8XKk8OUADYIeKmZGx3U4ZqOGZqByH0
         KyurjQ9U6VDZd4w7LtgriIxcyJSHP8bOY4r4iyDczaNjeCRLwKDyrqH7x3+WYWqc9uPE
         XIrQ==
X-Gm-Message-State: AOJu0YwekbEtQxu/SiJjufeMCz2OkbDatv6d8x4ybMzqP0XvppRmW6jJ
        wHB4BiAscj4c8a0HqeQVh3U3wA==
X-Google-Smtp-Source: AGHT+IFWFaxdMdy+VyMTM9v9ZTpIurQ/hIZWeJXFwgNjarLfJVDQ2awuAxoyaX+XpVwNuzMfubDQvA==
X-Received: by 2002:a17:903:2309:b0:1c3:6e38:3940 with SMTP id d9-20020a170903230900b001c36e383940mr431701plh.7.1695885128324;
        Thu, 28 Sep 2023 00:12:08 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902e88b00b001c44dbc92a2sm7563875plg.184.2023.09.28.00.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 00:12:07 -0700 (PDT)
Date:   Thu, 28 Sep 2023 12:42:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: cpufreq: cpufreq-qcom-hw: add SDM670
 compatible
Message-ID: <20230928071205.jffwl24y6tnkrfao@vireshk-i7>
References: <20230816230412.76862-6-mailingradian@gmail.com>
 <20230816230412.76862-8-mailingradian@gmail.com>
 <cc428a34-7c06-964c-2cec-123e99c92c4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc428a34-7c06-964c-2cec-123e99c92c4e@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-08-23, 11:40, Krzysztof Kozlowski wrote:
> On 17/08/2023 01:04, Richard Acayan wrote:
> > The bindings for Qualcomm CPU frequency have a compatible for each SoC.
> > Add the compatible for SDM670.
> > 
> > Fixes: 0c665213d126 ("arm64: dts: qcom: sdm670: add cpu frequency scaling")
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied. Thanks.

-- 
viresh
