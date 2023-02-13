Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31117694D3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 17:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBMQtR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 11:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjBMQtQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 11:49:16 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538F665BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:49:15 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id bs10so6561599vkb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tvhGy8ETPL11zqdmZC/xExmWZp35rJjo2Y2WgSoKKbY=;
        b=Weloq8u9lXxJ8tOY5uJNK934GqHg+5Bp+ylQGnTS9Ir5oR8JwoU1fM+/KT7nphG+5z
         6nXDJ3bTR5xkogGeNIV1QQSMnLOxUpsxooMOeL2wmWPfVS9Uabbv3SpWXv8tVMUHnVbD
         aHrPh2nvYk3lxoEPomJXsN40APlgbZfrPDSV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvhGy8ETPL11zqdmZC/xExmWZp35rJjo2Y2WgSoKKbY=;
        b=vDk8VbLyXkdI920I+EeWtCWrTiZbV9vk2EK/B4W6tHGHi2geotdtB/RQWBN1SlxTZv
         lUOh0/fg8XGkrXia40jGyIB//7Z5tROknqrbtqPwQi5z2mY9QJiW7DFVFvwCHaJtrRCd
         Vh3k/we+nKn4JYxH4i/Jkhmtw/S51aL35b/edwOd7hRtBjnyGXjL6O5VhsovJG1Ry4dG
         y7h8C5r6TrpONKCu7RGrxD3VG6VDgJBxKIamOjabhSgrkh6r5eEc8ePrQxsw7rH/zD/x
         KoPGaMBt70VD/fevaWqM2m+F0WuQPmHCxskIIRQjl9Cjfp9RKDcGZqa7KRPLZv4Hqe2d
         7E6A==
X-Gm-Message-State: AO0yUKXBl9Kjk8g8ydSxdeTDZvznzm3f0pVV1W2BWPFZXlD12I1BUsJE
        MaCXurrLScmQ1ZTcikD8uN0OOkzhraOKPABb
X-Google-Smtp-Source: AK7set9GpaI6HabD5AGsMuJ2g2KTPaHc/2+pNj51KG5pYg8d4m0xW1O3saFolMCEYa/QX8iUsqmTng==
X-Received: by 2002:a05:6122:905:b0:401:7f2f:e3a2 with SMTP id j5-20020a056122090500b004017f2fe3a2mr2476028vka.3.1676306954052;
        Mon, 13 Feb 2023 08:49:14 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id c196-20020a1f1ccd000000b003ddf5ac385dsm965819vkc.11.2023.02.13.08.49.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 08:49:12 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id z15so3063580vsj.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:49:12 -0800 (PST)
X-Received: by 2002:a05:6102:1590:b0:411:c7ae:5b47 with SMTP id
 g16-20020a056102159000b00411c7ae5b47mr2628026vsv.68.1676306952068; Mon, 13
 Feb 2023 08:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20230213105803.v2.1.I610cef0ead2d5df1f7bd18bc0e0ae040b03725d0@changeid>
 <Y+ppFm40+gmVK6NU@google.com>
In-Reply-To: <Y+ppFm40+gmVK6NU@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Feb 2023 08:49:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X3Tj8V7cSzY+JQwdNRRqiqQC80cPHQci8f_HPp8y_q2g@mail.gmail.com>
Message-ID: <CAD=FV=X3Tj8V7cSzY+JQwdNRRqiqQC80cPHQci8f_HPp8y_q2g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Adjust zombie PWM frequency
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Owen Yang <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abner Yen <abner.yen@ecs.com.tw>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@google.com>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 13, 2023 at 8:45 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Mon, Feb 13, 2023 at 10:59:05AM +0800, Owen Yang wrote:
> > Tune the PWM to solve screen flashing issue and high frequency noise.
> > While at it, the comment for the PWM settings incorrectly said we were using a 5kHz duty cycle. It should have said "period", not "duty cycle".
>
> Please split this into two lines
>
> > Correct this while updating the values.
> >
> > Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
