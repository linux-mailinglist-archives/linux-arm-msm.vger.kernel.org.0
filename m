Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57BD51CB51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 23:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386047AbiEEVkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 17:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386014AbiEEVj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 17:39:58 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38A25EDC5
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 14:36:08 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g184so2099828pgc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wRB5bL8icZm+YVyooxijkF4zchYu/RyBrWDypUzci9Q=;
        b=QKrTY3PcA5F3VU1HRw/IqYBX6gJ7uwyWaQo5ieX5o0BlPOg5hTFyHZx2euDOdzLisX
         oIcEiQjP0CipSqVmfRCUhL5Ar/mmhl5u5/YlbkTVCucInFodjXUbtu5cIbevhvoxsoMB
         DcSh+zao0zwEE704FZ+nWj8jZVJ9wcimvTiQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wRB5bL8icZm+YVyooxijkF4zchYu/RyBrWDypUzci9Q=;
        b=nn99o4VJZ3Iz7UkoJUzO3hi48oZw6wF4S/146ADWQNJ1dsyjmrSHFXcYmLQCShsnzI
         QFQ/QAiBpC9PhVn4ZBtUrXxzoVHpOJCqnPpAsPf6waV9ut5nvhE5eVQW7+tZLBchhNB7
         0Ck/UdU5KQZxeO/nageHVek70t18FX3mxo6BWovmOi2xo5O0Kti+wYUDPdocCp7sLIO+
         V6fuNRa9w1eeDetSc8lpbp36sLuW5hvJz863jMDICshHJB49E8V/WjRk824agjgSAqCE
         6hQCdIBDsyNdSNmwBXZWK1bwa/Yzrw8bZU9Rbj59/Y3QhZRx/Qvhlt3Q+y8xCtn+OMYV
         MLaw==
X-Gm-Message-State: AOAM5314ZxJHfc4MX/we5+jKnoUs/byd5fjWEN2kNXMUfXLtOZlmb+AL
        5CcU/g3uRNovkef+F7CUwO+w835SYDyejQ==
X-Google-Smtp-Source: ABdhPJy5CzOiaGgutckbvVaywfwyJH3/07K4eo92vqjJZpBart4yVcdETqLq2VC+AeIwBxZ15NvgQA==
X-Received: by 2002:a05:6a00:10cc:b0:4fe:3f1c:2d1 with SMTP id d12-20020a056a0010cc00b004fe3f1c02d1mr399118pfu.0.1651786568296;
        Thu, 05 May 2022 14:36:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:827b:7f14:bb7e:2898])
        by smtp.gmail.com with UTF8SMTPSA id s66-20020a637745000000b003c25a7581d9sm1781656pgc.52.2022.05.05.14.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 14:36:07 -0700 (PDT)
Date:   Thu, 5 May 2022 14:36:06 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, g@google.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v14 3/4] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
Message-ID: <YnRDRu6uCAi392oO@google.com>
References: <1651763004-32533-1-git-send-email-quic_srivasam@quicinc.com>
 <1651763004-32533-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651763004-32533-4-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 05, 2022 at 08:33:23PM +0530, Srinivasa Rao Mandadapu wrote:
> Add LPASS LPI pinctrl node required for Audio functionality on sc7280
> based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
