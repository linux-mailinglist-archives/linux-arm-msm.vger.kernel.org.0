Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99E350BDB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 18:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbiDVQ64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 12:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241155AbiDVQ6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 12:58:48 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E42C6004A
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:55:44 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id q12so7748834pgj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fdBEfHB5/SAY2gV0b/DndGNNOJio+D0/hlLPFq1pHlY=;
        b=hnkIO9mjPtRY/knCR3VVp2mDHwfBUbOGkY97pSrFD6sZn0bEdu7V3tbKnqolSUlwHs
         S70vnwX4PjABPSe4JUphAHx8y+HIGGq/5FgOCw+NSSK9+V/RmdIghkzfpSAPIn2tZfFm
         Wqup2NHsTGDnmlDDPrFfBk0eR3HptYRtJaFLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fdBEfHB5/SAY2gV0b/DndGNNOJio+D0/hlLPFq1pHlY=;
        b=Mkh+BJyfAKrim6f6ZKPXv9QEaX63rRmAhhbfMcSQH4c3Jhhr+Z1Y+iT02FxhwVwkzD
         ixdO5548Z7RrZucUa09tCJtY81iYh35m/OMyc6sbWSipgUVKbOaz0pHL4TJF+hYZR5MV
         4a1gIgTXc28DDVYkqXwerYd4WiSc7pwTK440UqlmpPYklvMvRZpYiCgUoJPfjlXpVkpy
         +gq+OE+W7miuBZA+J8VDy+yNutO6KFkoiGU9xpQbkP6IkWt4a7A8QcqC3HAndrzxCxhb
         n3GR1JtM6xEYdby0X3n8gT7wO6nWUy5gQZNWVvfI5/eYssRvL9gTHXt6A2/ye3sLhQht
         MQ3Q==
X-Gm-Message-State: AOAM53228qZ0sQ5IR0tTaIv/MJV1KNJbsWjxRfHW3DUtr60an1NdAY3r
        22U7D1y9kGAWmq2/jgL9lwCXRg==
X-Google-Smtp-Source: ABdhPJzvWdl2yL/Bh749BKK4k8Cvlq9TEvFsmtnsxFtcfnENep3r/VRJYv7JO/tw6YdUmB+jOcFMHg==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id d16-20020a056a0010d000b004f75af447b6mr5768884pfu.6.1650646543765;
        Fri, 22 Apr 2022 09:55:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:404c:8721:29:87a4])
        by smtp.gmail.com with UTF8SMTPSA id b7-20020a056a00114700b004f7be3231d6sm3221368pfm.7.2022.04.22.09.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:55:42 -0700 (PDT)
Date:   Fri, 22 Apr 2022 09:55:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v10 05/12] arm64: dts: qcom: sc7280: Add wcd9385 codec
 node for CRD 3.0/3.1
Message-ID: <YmLeDdqLJVKkcTOi@google.com>
References: <1650636521-18442-1-git-send-email-quic_srivasam@quicinc.com>
 <1650636521-18442-6-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650636521-18442-6-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 07:38:34PM +0530, Srinivasa Rao Mandadapu wrote:
> Add wcd9385 codec node for audio use case on CRD rev5+ (aka CRD 3.0/3.1)
> boards. Add tlmm gpio property for switching CTIA/OMTP Headset.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
