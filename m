Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D8866A1EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 19:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjAMSZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 13:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjAMSYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 13:24:46 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D925FE2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 10:18:50 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id f8so5061025ilj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 10:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdoZeQNplmRhThp2c6eonI7uoiBCPYO2onFJRhJu/3Q=;
        b=Nsf8v+2rEoiKtbGI99+zqm6bmU09wTu8gl8eYKZl+OU8LT/wgDIzWNEMFfNdtsN2q7
         2e4EAg2iobCGkInNBqko0nuGAZ2CxlPidsNVcVPX87pPywi6z2PIicmW6iuzDmIPGu+f
         I7FASFi5lbSofOAjJbwaLReNbKfzrh9S02ibE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdoZeQNplmRhThp2c6eonI7uoiBCPYO2onFJRhJu/3Q=;
        b=Cloc7tFNDPvlDEtc1Ub+j5QYuMOZ6TpuRilcyEEjuN1JBxk1+t8TwUd4W6yPwI4FEH
         7ffALz3DYCfjsybG8/PciulTM5QdJrW2jdiw9ZNma+3CNGSLUDXRdDJAL9KYX13rIuXj
         1FTO3KlyOB5ktf75Q7z356cOtC8g2u3CFFPy2pO4euYwTuFVsWjDUyw2uCeYSEJWKPj2
         rtjuybIVA0IAfsAHo0VMfyTXis19CKSZex6aF33j4gv2FaFZRGZyEALV1RBCwL0C8+RY
         TIxbuzzIIUlVtLt3TkWzaeB29IhdwG6qzKXY8wI74nn40+4tkNGVIlAesEmNfSdPAl/B
         nH2g==
X-Gm-Message-State: AFqh2kq4nyU/T7cXCq7JTCanaWoOh/irOOYuw/L1zV8YCH4Awvn9jnAt
        /GhFHcZTD+DO57Qq1h7Lf9u0UQ==
X-Google-Smtp-Source: AMrXdXtnegZsA/OzeztSEBOwZ7uawpvx3yql8nZI7sD6Wwfegt8ck6ntGiUT65918OdLTlSDkFfkRg==
X-Received: by 2002:a05:6e02:1307:b0:30e:eb27:2802 with SMTP id g7-20020a056e02130700b0030eeb272802mr174827ilr.7.1673633929894;
        Fri, 13 Jan 2023 10:18:49 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id x17-20020a029711000000b0039ea3e0a3easm2456796jai.35.2023.01.13.10.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 10:18:49 -0800 (PST)
Date:   Fri, 13 Jan 2023 18:18:47 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>
Cc:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7280: Add cpu and llcc BWMON
 (=> interconnect issue)
Message-ID: <Y8Ggh6RObbB1cxSS@google.com>
References: <20220902043511.17130-1-quic_rjendra@quicinc.com>
 <20220902043511.17130-5-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902043511.17130-5-quic_rjendra@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 02, 2022 at 10:05:11AM +0530, Rajendra Nayak wrote:
> Add cpu and llcc BWMON nodes and their corresponding
> OPP tables for sc7280 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I found that with a v6.1 kernel AOSS on sc7280 doesn't reach it's low
power state during system. This can be observed on herobrine based
boards on which the AP_SUSPEND signal should transition to 1 during
system suspend. If it doesn't the Embedded Controller (EC) notices
it and wakes the system up again.

Bisection points to this patch, the issue only occurs when
CONFIG_QCOM_ICC_BWMON is *not* set. One might think the patch shouldn't
have any impact at all when the driver is not enabled, but it does.

Debugging shows that the issue is interconnect related. A bare platform
device is created for each bwmon devices, which results in the average
and peak bandwidth of the interconnect link to be set 'initially' to
INT_MAX. The driver is supposed to call icc_sync_state() during probe,
which would set the initially bandwidths to 0 and determine the actually
needed bandwidth. But since the driver isn't probed the initial
bandwidths stay at INT_MAX.

This isn't actually an issue with this patch, but how the interconnect
framework deals with devices that are registered on the bus, but aren't
probed (yet). Not sure how this would be best fixed. Georgi, do you have
any ideas?

Thanks

Matthias
