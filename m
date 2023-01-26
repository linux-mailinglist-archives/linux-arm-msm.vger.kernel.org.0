Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F3E67D4E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjAZTBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbjAZTB0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:26 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A31A4ABDE
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:23 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id kt14so7735213ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/MQtjH1mkm7AqWVUG8R8PxBUPeeTUYPrWIK/5+KgiA=;
        b=BUicY8w7Cg4CvvVRquFV+WJ0QeOwi6vsbrxmHOhMGwV25qxRXRkUT9iPFTPebUc/88
         g9f/A7OOf1p2fdc/6q8kVGk7cH7/HBZFHg+7sOuL/OmO0FVYpXHAd350rwqRm15A6KKy
         aOBpNvSsoTfUN45J+ewLql9fUXdHwPOarMsXRbuu61l3OQLz0HV7HaIVKHvKi2e1bXJd
         sUlqHs/0NZKIxqoaH3Ih3XlZIa4BIRysmWxdhg4gnOgfdoMPMW0MceWRR9VcPKBLjFfa
         pBOMZBlqowhKoCBDFLv6a0BUnSqNlWM5iQ/zNQoAr7/hj/2mwE1icrYn0ALppYxhmTJW
         tuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/MQtjH1mkm7AqWVUG8R8PxBUPeeTUYPrWIK/5+KgiA=;
        b=fKprTDvRbs3y2SdDlSTS+4KcMghEiKXpfy96hQg7zbWtrsfVEEcWAg5FA1idxcmbC5
         L2EHWJ8Sq+lzrSRX5DqFlhY6WCMNspPJ5U722v+zKp3si3CJBe5myanYZvte0dyH++cc
         cl4XMF/RmGTujer+bS+3YSGYzgmuoL8hXZLZczSurcHH9Gk4qmRmNO4lLos5G5gJT2+p
         AvQHMyLZD/9k3WsBy7/foO803zbq8lPC4k24XmH8aDAG2gNINgRlVlej2r4C5e7cRRCH
         cb7QwLqvditgZvHDWIf9ePmjIx2BWCY8YjVPvP5y9Xct7NCIAgQn9bUHR5muQvyO0siQ
         V/Dw==
X-Gm-Message-State: AFqh2kozD4i1eUP+btetOnPtUqVTPIVA1/2wCzzy1MpsdeDiJbAl/7iQ
        sNs7+oNhM0zrD3UosRu0crYwHA==
X-Google-Smtp-Source: AMrXdXsXfrQy45Ya6lKA6L50vJMUW7P5TrZp7aWrVmJXxSfb3EXhEPKbWX5+uG1SZBE6FL4mJZco+A==
X-Received: by 2002:a17:906:9e20:b0:7c1:10b4:4742 with SMTP id fp32-20020a1709069e2000b007c110b44742mr31676549ejc.55.1674759681746;
        Thu, 26 Jan 2023 11:01:21 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
        ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Add check for kzalloc
Date:   Thu, 26 Jan 2023 21:01:04 +0200
Message-Id: <167475959090.3954305.15850906427772630673.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
References: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 06 Dec 2022 15:48:19 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check the return value
> in order to avoid the NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Add check for kzalloc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13fcfcb2a9a4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
