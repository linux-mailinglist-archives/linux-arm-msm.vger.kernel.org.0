Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889DF508CAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 17:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355254AbiDTQCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 12:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355289AbiDTQCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 12:02:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C219443FF
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 08:59:37 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id v15so2855532edb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YGFlvUF+6fFWy1fX1MYp4Kv8VavogLHQZ1swJRkagR4=;
        b=VrGhL5UriOqITgYWid/yHAnlnzX/ygVds9FFW9oUPAy99QMw4Z8dDJZytWmZzwf2Ww
         OWB7+EYY6KulPcWe7U5xX0b47etDOjTYHT+jG9wyOAQF4hXjDukNLZuNdYLbadf7D6Oy
         sYrAmLi0Lwj4VofOM8/nN78y8+yJ2Hf5WPYJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YGFlvUF+6fFWy1fX1MYp4Kv8VavogLHQZ1swJRkagR4=;
        b=QYwPpGgPTlEzq75W32a/tdTQQAUNT06IYrA5Btu9fvuD3F42AexfsoTtQA4XZWRujl
         vqGoIu/2w1VrbzpRyVbpe66HC7PBZYN8nqjqzduzF+1tn3sTtIba/Cku0nNVo+l1VOt8
         zvfmXB4LxoHSyJ6ezr07Rz+aRrnaK6i5KiZce9UWILV7o6wMSkuf2n2dDI+hPLDItkyC
         HxpJhH0cYGGbEhZ0qZxYIBrULQMVVo3nQ7qmhDBMzcA8Qjl1THYQvRoatlttcgTDTNxw
         R0j65XIYgdwT5TVU7sR3BUawGRmdYhZeF/96US14vp9v3yVn9Zgo1GvlKGsM0qG5IKnN
         iJXw==
X-Gm-Message-State: AOAM530kqDK2qGGqLcFedEOtAqZFfOkyY6yN7ei8psZ0FklmYD4oawxz
        pq1yxd/sBNcMq8vlYPLIWfFIrL1OdN5HWQDV
X-Google-Smtp-Source: ABdhPJxJfXDCeprq1c1tGDYku1/xc6QCvsaxm+B1JZpB9H+FfDTSPy1TW4GhTnFQnf+HCEzbG7eOsg==
X-Received: by 2002:a50:ee89:0:b0:41d:70eb:eb36 with SMTP id f9-20020a50ee89000000b0041d70ebeb36mr18386837edr.24.1650470375663;
        Wed, 20 Apr 2022 08:59:35 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709067c0c00b006e86db76851sm6804026ejo.193.2022.04.20.08.59.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 08:59:33 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id x18so2928843wrc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 08:59:33 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:20a:a4b0:dbc8 with SMTP id
 i11-20020a0560001acb00b0020aa4b0dbc8mr7616987wry.513.1650470372923; Wed, 20
 Apr 2022 08:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <1650439639-28428-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1650439639-28428-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Apr 2022 08:59:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZjstRUd7tP=2ZhFMFDYtsKkzY3D5-L=UU2wD5KHXGmQ@mail.gmail.com>
Message-ID: <CAD=FV=XZjstRUd7tP=2ZhFMFDYtsKkzY3D5-L=UU2wD5KHXGmQ@mail.gmail.com>
Subject: Re: [V5 0/2] arm64: dts: qcom: Configure CTS pin to bias-bus-hold for bluetooth
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 20, 2022 at 12:27 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> Change pinctrl configuration to handle same.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Just as a note for future patches, you don't need tags on the cover
letter. If I respond to the cover letter and add tags it means that
they should be added to all the patches in the series but you don't
need to carry them forward on the cover letter itself.
