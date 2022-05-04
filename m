Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A530C51B116
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 23:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237826AbiEDVj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 17:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379036AbiEDVip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 17:38:45 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6BB5418E
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 14:34:35 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id c9so1924193plh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tj4W99hLVPdShLj3ivywhTM+79BMdoNrQwhHTBQPL60=;
        b=PVamEZrJJCDwaxtHGTAAYvOZIi8UQmCSyPPQlhRvy0qI2AcamsQO+9Uif9UK676ik9
         VuBt6UWvLd4ybzGl2kzwvvKaHsDPF/iWEP9fnbiBjcP+2WVOTVGX4IOQv/vVEKygcbRf
         YoFFYFN/cv+kb2lT0fh+N6/D0CtCD8oT9vqo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tj4W99hLVPdShLj3ivywhTM+79BMdoNrQwhHTBQPL60=;
        b=UC1D73zmHqkcNFVUsU3CKP0zaykJsIYXKllqLee76vIAFOe5b8P69VUNbkQUgkqt/f
         /arH9LHyrwXOfXuw6TOySsxB+MmvuYRipgQImjoPbFHInGT1RBOhrJF+yUYGtLuMteuf
         vFkR1irvgna8x0KRVwnoN0yk5FlerXVPRNX0LC9kDGX28Ksid2JJhprD6gQbIgjpwwm7
         OoLoZNnxRZ8WTB9kNUdYlRZa3oEIr5Zs020WUFhyKYWK2/bqN30G6A+jpFEUcdk/+B9L
         M1qh+bgvYTBd9B0lldkz1ZPQ3Gg2y8hUyqK9YC9hdX0vMa3GdJ2QdAC9YHpYX1rWmjjE
         UdlA==
X-Gm-Message-State: AOAM53200Q1HPQk4MWTO9jw360ogvXsMJv4Z/dQO416QsYkO75pJszXr
        anKRoDg7vxHhTa8HDRgNxndXyw==
X-Google-Smtp-Source: ABdhPJz+XfOgnd0Tn7aSzaVP1xEyiS4vAsaU5I1pl+k5tp1OEQTp0UcNdMFI42xg1QoQoQiOvZhntw==
X-Received: by 2002:a17:90b:3806:b0:1d2:6e95:f5cc with SMTP id mq6-20020a17090b380600b001d26e95f5ccmr1888211pjb.23.1651700072771;
        Wed, 04 May 2022 14:34:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:35b6:c77b:be04:3bd5])
        by smtp.gmail.com with UTF8SMTPSA id w1-20020a1709026f0100b0015e8d4eb22fsm8721322plk.121.2022.05.04.14.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 14:34:32 -0700 (PDT)
Date:   Wed, 4 May 2022 14:34:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v11 05/12] arm64: dts: qcom: sc7280: Add wcd9385 codec
 node for CRD 3.0/3.1
Message-ID: <YnLxZ1YoGv2UqNxV@google.com>
References: <1651664649-25290-1-git-send-email-quic_srivasam@quicinc.com>
 <1651664649-25290-6-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651664649-25290-6-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 04, 2022 at 05:14:02PM +0530, Srinivasa Rao Mandadapu wrote:
> Add wcd9385 codec node for audio use case on CRD rev5+ (aka CRD 3.0/3.1)
> boards. Add tlmm gpio property for switching CTIA/OMTP Headset.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Carrying over from v10:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
