Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71F1694D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 17:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjBMQpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 11:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjBMQpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 11:45:22 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418311CF53
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:45:12 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id t7so3754111ilq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXR00+9WIgIWNEILmxEA0hz6puB2orHxFJ91vvt0z6I=;
        b=OKYHfdhb2T6Y15HX8HCxE5l336rW/CFf/LWAozMLetpw1/sf6Ad/WBxM0YNhPoCU42
         c4jzVi6dfdEfFZq/aOfF80O7JRr/axcB5TRPRic7/jFsuA2EJtIIkNzQWMSXyl+Janpw
         gzgjjPPRcQ0czaA5t1cBLryzQ/+rt5iGRNi4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXR00+9WIgIWNEILmxEA0hz6puB2orHxFJ91vvt0z6I=;
        b=3/m7lNQjvgvuBhJUl4rxjWCy+f89rvEkw/3+7mrBC1vNHV+xVCd+FBcididwb6A1SY
         rvBRXYylyOPHx7VbfWZH5c9nuugAhoFWqEkJInD+PJw0hbbaU7PI3DCqTacGJuTOF4Vc
         BNU6w2RQdZz4nhI7ZdtFzR5qUaYYdRLVZvX6+m2yF7bMwoaP+4f2aTZKsA/KlyfylTc+
         YH7whS2BkUehIUsFfWzY30sSJRkSlkT+BTv0Y59WdY8G9LSXbi+tGlFC5Miw1I5dBWFs
         ORMtSoeCy/XG2ZhflGXD/1vntqmxzbhqhza9fGQDCM1SbfdBVoWeniWoC3JZlaK/9xJz
         wSWw==
X-Gm-Message-State: AO0yUKWS6eabkM8ExctQE66Cacvfc0pCwV3dmLhEHEYK4V7J5Xs+c55a
        GpyatV81uJHkQVoaJOVmfiIaQA==
X-Google-Smtp-Source: AK7set+Rk/McEFlkOTrKKTP5/N/bbWQ0xRWxKUosXcKy8NAb9fKsPsXXrS304p/GLc3T5x0Qk2Ez5A==
X-Received: by 2002:a05:6e02:1a6a:b0:315:56ca:74d5 with SMTP id w10-20020a056e021a6a00b0031556ca74d5mr626468ilv.10.1676306711641;
        Mon, 13 Feb 2023 08:45:11 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id p4-20020a056e0206c400b0030f3441de17sm1755545ils.59.2023.02.13.08.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 08:45:11 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
X-Google-Original-From: Matthias Kaehlcke <mka@google.com>
Date:   Mon, 13 Feb 2023 16:45:10 +0000
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abner Yen <abner.yen@ecs.com.tw>, Harvey <hunge@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Bob Moragues <moragues@google.com>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Adjust zombie PWM frequency
Message-ID: <Y+ppFm40+gmVK6NU@google.com>
References: <20230213105803.v2.1.I610cef0ead2d5df1f7bd18bc0e0ae040b03725d0@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213105803.v2.1.I610cef0ead2d5df1f7bd18bc0e0ae040b03725d0@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 13, 2023 at 10:59:05AM +0800, Owen Yang wrote:
> Tune the PWM to solve screen flashing issue and high frequency noise.
> While at it, the comment for the PWM settings incorrectly said we were using a 5kHz duty cycle. It should have said "period", not "duty cycle".

Please split this into two lines

> Correct this while updating the values.
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
