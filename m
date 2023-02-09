Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB7C6913E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 00:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjBIXAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 18:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjBIXAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 18:00:16 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA44F59EB
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 15:00:14 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d34so1241788lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 15:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WiBOVyBS3jxeOLS5jdRWtNyu3Pp242/H876fIFzKAmk=;
        b=G363oTKWPd7OTAHTVIlAF1tmSPBZQHap1zu0Q/66JuLHllBgp162JDmob+GrbeJWvw
         ATZsHySDeaefJ24LX9yL8F2nwjMTK2RoCVMhMuDtbFBbGbhF0q6y/MujRxfDJIVDh4Xv
         Z6dFnWw8K1MjPATYPV7WAQz9dbhfP1IwX76JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiBOVyBS3jxeOLS5jdRWtNyu3Pp242/H876fIFzKAmk=;
        b=DGXtdS+PcQ/7Ku1A/+b87hHnGIeZ02oJZmVMwT89ZdXKoG5210pGukaB44SmtGxcAw
         mH8TeX9DcJUur1O5f+kphaR43OGlHJ19f4GQqJOhHsvxKpY2qxQBwK9SNZZxJGZJXbVO
         /+ue4hiidIRbnW9u2E9sNioCL2vZUcJZkXVHKF4ip6SXQJB25fPux25shfLFcvdpnQX1
         FJULCHHaRc3QMp9JgfXOWFmpxiO9WDSg2vTWsn6CYFdFxosVTvk2kbQp6XMZ667MhzG2
         UR28A4e23mlkYhyN8qnlxhVTJegaBVTTfSnBgRRiMAvtfVRWWJAeZoNw6Qlco/9l3R0l
         WnXw==
X-Gm-Message-State: AO0yUKUocDEu9VrYNbEuZPLEcWJzoV/13givstJEbjtPkNBjgJvjR6aT
        3rl4IezYglOzXq1dbJcmGHYlGbENoUczp+EU9PJWJA==
X-Google-Smtp-Source: AK7set8dexKAwHHiOYh04Zt8+CurymxnjylH7GZAEI7nXBU47Y+sRGF7NTh0elgledqS7DrUFTzuJJ3IfScVOz2V7Wc=
X-Received: by 2002:ac2:4c8f:0:b0:4d9:8773:7d73 with SMTP id
 d15-20020ac24c8f000000b004d987737d73mr2492274lfl.52.1675983613047; Thu, 09
 Feb 2023 15:00:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Feb 2023 18:00:12 -0500
MIME-Version: 1.0
In-Reply-To: <1675700201-12890-8-git-send-email-quic_srivasam@quicinc.com>
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com> <1675700201-12890-8-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 9 Feb 2023 18:00:12 -0500
Message-ID: <CAE-0n51nr9MAVptYuNd3KJYVfbKnE1PiG29e8xS7S0gpuhTjXA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: qcom: sc7280: Modify lpasscc node name
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        andersson@kernel.org, broonie@kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, konrad.dybcio@somainline.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_mohs@quicinc.com, quic_rjendra@quicinc.com,
        quic_rohkumar@quicinc.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-02-06 08:16:40)
> Modify lpasscc clock controller node name to generic name,
> that is from lpasscc to clock-controller.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
