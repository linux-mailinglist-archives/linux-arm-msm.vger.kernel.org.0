Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE976CCD7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjC1Wib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjC1WiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:25 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8174A2721
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y35so11666044ljq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALXG480xc5Vr4OawogWrdD2rMqv6eGKjSBs+zM3zYaM=;
        b=ZnE7Q8sUOjiqKZEboynjLw/+ePjw37a8mPY7dc9ZWIocCk5H6ZEdBmGgD949C1HmO2
         osgYB5U3gaRjuZu3vALD7fvCrLe2CChixj3Smn2DJ9goJ2li26clkYLVYgfG4fbNGUaT
         o7+iwdt3KRAh7nS3OtWvbI1bkdBjvYIz4axSVPbX9xSxkR7aOCDvFbjzPrwDluUz3E0U
         8z8KPEeP4ctRqHdA382W+kq1N1FqTvpz4jRBENcP+AUdfmzCxx9CzSI/RSfItZ+Axzfs
         uxBSpA6SOGlj+d1cZ7rBPeQMdw15xDaThvq8l0Mni18Td1Oppg2FBXxqkkH9It2wzVIh
         Qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALXG480xc5Vr4OawogWrdD2rMqv6eGKjSBs+zM3zYaM=;
        b=QvE1bB3rspSLkp+5mKSckmq/lVYMTIrGlVWeIve9A5T04V4VoW3eWiO/tkTiEkCQmj
         ECvmqKy0Avm1P43RzzX2zfgslcED4zzjY1fKC+4qT2eYEJplYL2lvjojs9Dk+49h9Bby
         U60rfQBIMQ9KpLGna865Cj5eSSDnAy0nO0ahMvgHzjD/EevqpoWOzE+mfWUFWoTdN6Cd
         l+oUBjleV51OrG8mICTcYhLbax1CfgsdWfQ592pUyriZdPPVZ1kr8psSMwfl1SSQVMzX
         knP0xNlWRLEK+ts/DgekbTrPWy8TaPSUxxFI9Hu59n7DLnBAW60VGVlunuuHIIo8uBg0
         Dpxg==
X-Gm-Message-State: AAQBX9fsjFKJNFa3RfIpsDjFQE43DzfPfkh8UvEmyL5hZ8JJiRKq7xFl
        Dr0/gm2h1Y8Kqg7K0O/WOgbDYw==
X-Google-Smtp-Source: AKy350aFicRWvswRoDZ1yiFEWcuTzTmpHjlmzTrMbuXCU8Hhw3+v9Dh3klrbsvbczbJGUmIMYntQ1w==
X-Received: by 2002:a2e:9883:0:b0:293:5164:4f2b with SMTP id b3-20020a2e9883000000b0029351644f2bmr5174878ljj.8.1680043093924;
        Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com,
        marijn.suijten@somainline.org
Subject: Re: [v12] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
Date:   Wed, 29 Mar 2023 01:38:00 +0300
Message-Id: <168004255467.1060915.667380054091133744.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
References: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 27 Jan 2023 02:14:47 -0800, Kalyan Thota wrote:
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
> 
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> 
> This change adds necessary support for the above design.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4d5e5f04e596

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
