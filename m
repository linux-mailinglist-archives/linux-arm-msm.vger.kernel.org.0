Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0622350BDBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 18:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350002AbiDVRBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 13:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235512AbiDVRBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 13:01:01 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C78560ABC
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:58:07 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id k4so576505plk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nsFsSZ9xU/v0PMYpVq83wyniIq3VfJOQeOaPDdSEOLU=;
        b=gmu6AGMNw0UpOEQCmqAYanxSJtRw0aGzPIAgdVQsj6Hzg6iRJ6IIHr9suloBpbhg/H
         eI8fvM3Xm2W8Fva8iE5Z1M8en9AuTJdEIwmfCTlqInVJpfLkmwcko0sQMT0cyiRjtkUv
         Cx5Zc4UKsgxi/7D1AktfN/Ykm33o7Qt/Y9eG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nsFsSZ9xU/v0PMYpVq83wyniIq3VfJOQeOaPDdSEOLU=;
        b=hpugrPOq1JkqgKK9Z8sjR4QCe10raNqpSQ+iHgNuclvQqtJ2jKkmeUH+YjNU7bjgby
         ZWfHy5Q67C+gZsqxSVFdT54dJQCYQ7sER51hyTSv7Jc7lT/nZ/ucLRQoTvfIzb3vA8AA
         ZhuqIxNKnjlUEW+tiJV9V+nRQq4QmYToKtC+tH3hEWXZPUCdKPBYbGTwZo9HvsMTDrvr
         WyGVLmZRQwWmGB9JfN7636PcKWQTaSMQzjsq79se4IXjVcuDS2gq3MtqhmApiihyKiPP
         RKorT9CABuncwVsoM4WlW6lOBtwGGBpwZAu6Ne8FRA3IGUrtt32zbu9NvMcyXIfUV7lk
         Lmjg==
X-Gm-Message-State: AOAM531aZXVflMiLKbHkxqovu58KnVps5eb820iqjT6AjdPpFCJ9F3fk
        wbd242k5jGNAC+Sq5U3l1Oz9Bw==
X-Google-Smtp-Source: ABdhPJx8Ai6tZ7rW1kUYJ3DGMJkmpGNHbBnH3oDMcjTtP7yTqj8ZF4SQmjQ9j8/CvfFqmenW9pt5ow==
X-Received: by 2002:a17:90a:193:b0:1d5:a5dd:852 with SMTP id 19-20020a17090a019300b001d5a5dd0852mr6368897pjc.176.1650646686813;
        Fri, 22 Apr 2022 09:58:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:404c:8721:29:87a4])
        by smtp.gmail.com with UTF8SMTPSA id c18-20020a056a000ad200b004cdccd3da08sm3338421pfl.44.2022.04.22.09.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:58:06 -0700 (PDT)
Date:   Fri, 22 Apr 2022 09:58:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v10 07/12] arm64: dts: qcom: sc7280: herobrine: Add
 max98360a codec node
Message-ID: <YmLenJYD2dSlvmd+@google.com>
References: <1650636521-18442-1-git-send-email-quic_srivasam@quicinc.com>
 <1650636521-18442-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650636521-18442-8-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 07:38:36PM +0530, Srinivasa Rao Mandadapu wrote:
> Add max98360a codec node for audio use case on all herobrine boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
