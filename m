Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF65643634
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 21:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiLEU7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 15:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiLEU7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 15:59:43 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB7825C5A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 12:59:42 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b3so20521555lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 12:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bgy+f2L2rbGOuAQ7U6WSb8YGwu0T4H70GoPKtOQnTKw=;
        b=CFlqt7da3YJEIvnrTwB241/AGjRWUuGLzB5DGhs7yvvo1pGgYEQSybv2RkJO4fIUBS
         30MMfLZiIqc5laEZZf5HbB0bZQLl+RU8HRYivJe2uqPNUd7MoR8Z+MS8aLd8UlIxK4JN
         b5fhEi+vqzJRA9iVRkXh+jxWYeK3D4Bo38GKGy5OfSV7WYhJFvl7EN+MX36abDSqdlY3
         E0u6Dwl8brybOa4Qiw29S/PMYZBX+vuNvxm01AeBF0ehFWpUl/f1gaFmMh+gHAJDjFtG
         SIMo+rfuK/eJ0Y62NqGMF0TnKd/RCwtGRgNP/8OOw80iZlsP8za7r3G9/EYc6ZaV8RbS
         jV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bgy+f2L2rbGOuAQ7U6WSb8YGwu0T4H70GoPKtOQnTKw=;
        b=FSZ4MkdXoLt47uxc2IXoYcqNlVitSt/Td42HNcPiI3baa1/1XnibtOjxtGwwNXzUhG
         QyeAbYN+M/87Wux1VF5ssXTai7mbbMj+8h1BAZoVMHHNsnf4SLTkAxtNwY8QGfUesaH+
         PxZbz+UieaS8W3l3PQKvT6ZjuWLjrXOX3o5wWL9cPaeUHkK2EmfdV5jg4WWZHtRnFT6a
         qv7WTJx0fyWd7Gh3JHSpAno1CeDGMfzzyVAqJ3gn8pwCrW9Jq/+W/mcP5fL/EQ7Zpfl9
         wWxXcqiuGVnzIExG+SUVNX3ej3ieK9MfQAxQ1B7LL4dUo7dQINCIfdOH0hUvGYj5Wm5d
         S3OA==
X-Gm-Message-State: ANoB5pnvPY53PqQedkeXtCOfHEk+4tX7JOLXYypa4jNy3ITrgswWAPzX
        fanCm7GRGj/qYhN3NItkNS8WEg==
X-Google-Smtp-Source: AA0mqf68QUVq95pZFc5bKU3wSaoKsO3Awljf51PvcoFMkTesiOnzMn7rQACunOavaTjQqgAEnhQ31A==
X-Received: by 2002:ac2:4bd2:0:b0:4a2:61b0:8d28 with SMTP id o18-20020ac24bd2000000b004a261b08d28mr21493095lfq.600.1670273980652;
        Mon, 05 Dec 2022 12:59:40 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id k20-20020ac24574000000b004b55da14ba8sm1128333lfm.291.2022.12.05.12.59.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 12:59:40 -0800 (PST)
Date:   Mon, 05 Dec 2022 23:59:36 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/13] drm/msm: Introduce SC8280XP MDSS
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-4-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com> <20221205174433.16847-4-quic_bjorande@quicinc.com>
Message-ID: <A185142D-8021-4879-B75E-2C255A7A5A21@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5 December 2022 20:44:23 GMT+03:00, Bjorn Andersson <quic_bjorande@quic=
inc=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>Add compatible for the SC8280XP Mobile Display Subsystem and
>initialization for version 8=2E0=2E0=2E
>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---

--=20
With best wishes
Dmitry
