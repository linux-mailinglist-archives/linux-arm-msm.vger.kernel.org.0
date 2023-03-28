Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD606CCD1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjC1WVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjC1WVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:21:14 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14D13C1D
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:20:49 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a11so14137689lji.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680042048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9tY6j8LdTDD9EujQwH1lLAD0AMzUqBAGXv0/3l5pFM=;
        b=oTEXQ+Nk4Cg7Zp+Ri48bvrOZJCRrBSenxmOYsvARw8lieBuF8vRrCCRhh04GqzqzL/
         f2wQv4Ug9h40i+LVnbNdRM0dKH34DS5pT+pxUz2ra+/ZyH0wuGL/DmtkdzViXRC3zv4+
         xsZ7rDV2JFQKtC7jd96ytS9MHjB9J6gtnDauSqmXrBQ2eocCuiQbia2xZz8RtyYeiMAF
         uSDDHnA8H0ikj67exFmYivmqmQOrgpXj49i/W+/PTv1tCQ0+oOnR7774qUxS63QSV41o
         pZf9QDdsJkHTVQo+Lp9ThgjZfCPyrgWpNTYng19UbvsEPJYZpHOPI8AizfitqYFIdPkP
         o4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680042048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9tY6j8LdTDD9EujQwH1lLAD0AMzUqBAGXv0/3l5pFM=;
        b=mZDS75aBVaFjyo1x2Rrd+YtHxdkFSsxlaB9Fqy07Bti6bIH47nh5irdBDH0vjxqeLn
         XNmyl7+8cflQUimj1PSwKx/enCv9mpphQhJvkj9XKGJzlVT4+CzcYQ3DG2dj/AyU53tL
         2J0WMS+z2w3sCAAYAessO58ntm0E3vP1c/v8lfOHSkUzPgit7r1wmvK69ntjSMvMNq1k
         Jnlb5KFFHuzUJQmB13nZ+nsDucRx4MqQsCV21hDltCG4/u5hjqmcisEIbRRdlqx4N9KT
         LvM0dOBf9zMWA3fZHgxY1UTmEzMSWt5aWQfZbZNCyoO8TXTCLkN3nYfpHrizeb3XJulO
         hmQg==
X-Gm-Message-State: AAQBX9dFXNNGQLYelyfthArrods3h0mUnKsFDqUq7smb841u+OLnm9aq
        M/UXRk0Sl24CtNCMS2jB91qfsBiReY0/drM1BBc=
X-Google-Smtp-Source: AKy350ZdQRq+DFQ++iqagCsd1l68i2CWQb651nKlPidHo6NdIgEj6KLu5EY1xkhUF4/EQAy2fjmFeg==
X-Received: by 2002:a2e:b601:0:b0:295:a809:e014 with SMTP id r1-20020a2eb601000000b00295a809e014mr5041126ljn.6.1680042047945;
        Tue, 28 Mar 2023 15:20:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t7-20020a2e9c47000000b00295d62f0a0fsm5216922ljj.122.2023.03.28.15.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 15:20:47 -0700 (PDT)
Message-ID: <d3077a68-cdf4-6304-111e-1c262695a065@linaro.org>
Date:   Wed, 29 Mar 2023 01:20:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] venus: Enable sufficient sequence change support for
 sc7180 and fix for Decoder STOP command issue.
Content-Language: en-GB
To:     Viswanath Boma <quic_vboma@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com
Cc:     stanimir.k.varbanov@gmail.com,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <20230323130153.8229-1-quic_vboma@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230323130153.8229-1-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 15:01, Viswanath Boma wrote:
> For VP9 bitstreams, there could be a change in resolution at interframe,
> for driver to get notified of such resolution change,
> enable the property in video firmware.
> Also, EOS handling is now made same in video firmware across all V6 SOCs,
> hence above a certain firmware version, the driver handling is
> made generic for all V6s
> 
> Signed-off-by: Vikash Garodia <vgarodia@qti.qualcomm.com>
> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> Tested-by: Nathan Hebert <nhebert@chromium.org>
> ---
> Since v3 : Addressed comments to rectify email address.

This is not true. Your to and cc lists are still incorrect.

-- 
With best wishes
Dmitry

