Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5507F7D65CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbjJYIva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbjJYIv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:51:28 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB11181
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:51:26 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-579de633419so53647347b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223886; x=1698828686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tTFfq4D9p5xN0IQqJ2OvWJXv3Kfq9VWLuEHrieoLABs=;
        b=jjegFjEbrKowb9lpBmWFugprJkKVtP0R5e1BuFibXqhdbIk6kBfmB3/Af7+KJYMiGn
         IiOJAb7nbBFlN81mydQadJZjpaY+8mOQJ8JSJ8YWk8Hhzz8zdTQuolZy62PupVvhxPND
         M6AnvsWm3guF257y+DLL4UqWyRZjJjsHQmkb83TSc/fN/H6qKH/tXNpVcIImJuR7nj9W
         faV+IdUwbzkg/lNwN+a0O8a2tY5tkJf3HwoH1jVwwpGo0x+KutSJS0PA73/ihflfkinz
         C+ZmP9jARSPmhpwj1o7Hbku58WQRZxv7+2UoJGR0Q6m3b8pimo0ifYLY9FYiH3SSM+4M
         9Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223886; x=1698828686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTFfq4D9p5xN0IQqJ2OvWJXv3Kfq9VWLuEHrieoLABs=;
        b=OwN37jhnZzF9PT4HWN/VvNF8PZn7I+gSZzPDPTQai+aCYLuhHPvTrSd4dRHStrXfAW
         w5AGFFUkgRwvlcc7MBIaB19R56FfpVnTHMgF+6kuA/eP8cZ8XqMsYhYIlM8tzBZV68Tn
         sesx9XpoPftNrqYDIZCjGntEUgGOqUIw5OS07ahq7C9f+vyG2fVQVDojuCx4850YBJXP
         gPewVp9DqPMo2Gy4GOkkWEZjfrATwJz3uBW0Cpr1uRhOptlaGQ/q1jwh3FvAHL5IRUMQ
         CkOJYaaQiQuUct0mL81LpLh1V3CWIVGsG9YG9/fHlCxVJRX0TUNpJvq2XRLqG/xsLhmk
         9J+A==
X-Gm-Message-State: AOJu0Ywi+huqAkZ6BYBDEcuB6eYlL7dtP97FWsZ25I03Di2RpI7+Vns3
        Re4x9rYSkrQVBypA7YIXssup4/Cix1vd8kVdgU89DA==
X-Google-Smtp-Source: AGHT+IHhYmxcr42okUrf55P1D8yD7J3sM3R0RNmqCuwGbURggZDxK1dFQSu9KyEiIPEnyMPodJcNcgXhfKnr6kfMiKM=
X-Received: by 2002:a5b:94d:0:b0:d78:6f1:41b4 with SMTP id x13-20020a5b094d000000b00d7806f141b4mr13771717ybq.30.1698223885881;
 Wed, 25 Oct 2023 01:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org>
 <20231025-topic-sm8650-upstream-remoteproc-v1-3-a8d20e4ce18c@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-remoteproc-v1-3-a8d20e4ce18c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 11:51:14 +0300
Message-ID: <CAA8EJprOkvBjx=QunK6r8WLhCzaLFY5-OXP0C1D4hwH8hy4wvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM8650 remoteproc support
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 10:43, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DSP Peripheral Authentication Service support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
