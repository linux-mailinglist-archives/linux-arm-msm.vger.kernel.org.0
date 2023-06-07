Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5837261A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 15:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240827AbjFGNsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 09:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240817AbjFGNsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 09:48:01 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770501BE3
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 06:47:57 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-774867fd6f7so244548639f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686145675; x=1688737675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Igbil4rQ+bksY47TEj8Cy1rhyNXKg8xa0jQJqvVvp7E=;
        b=eHS9dZgPSMn88aCtAZNwchhK4VxtP6ZilnYohBfTTvLdD6mLOp+lZFqoglDdtulnwD
         On7mPzxvlxu2rbcy1CthZ4Uj0c0MN/tDSZDoYdFIy/rrX4cidB2xkmYSU9CIBycjRhz8
         Lf00h091Tnt4AaJdQDOnuvurCWGgwLniOziPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686145675; x=1688737675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igbil4rQ+bksY47TEj8Cy1rhyNXKg8xa0jQJqvVvp7E=;
        b=b+LJbq1tLzFjUbT7qpgRiMLsR1LTf5xbawuNUBQ07ldIw2mTWi+5kIg1LfxNanUH+y
         J7VWXq8asjQk8Z9/LzJfRyKRgUdL61G7PP97k7aHyS84pIkvifiUzi7HYYqMUA3lWnza
         nXhqhT2uumQiMQ3c51do7Dw1iOlJt23V0dZKZskRzZFTszG7NcKhVH+4Awa4X7qO0Hvs
         u6rlLKPOpJ2noUVwQ/gq4HDxzGpJc2K8eLNO8ibBGuS+e6+fieJOlcYCshRxoCCzsj/y
         e+fGfs00v3lFHR2AqwAFltVRW8d+sZE8zy9E23B/DY1DpAxn9PcX/syu4N3klERrpmC6
         ro0A==
X-Gm-Message-State: AC+VfDwDN6nR8BdOTnst9dliBVmQkT6xHlSJYhysDe+LXv2BxI0KMV7e
        6MiYtCZDMWUmoIr4DNykmhvMKI7k8tETFbMMWIE=
X-Google-Smtp-Source: ACHHUZ6IiUS6W8bGQktymFsQB0MWnsTEfGRGoemqA945fBxB4Su98Hm4ou2EVIJdDgf6KduRx7h3Fw==
X-Received: by 2002:a5e:c10c:0:b0:76c:7dc7:fa4f with SMTP id v12-20020a5ec10c000000b0076c7dc7fa4fmr6556750iol.4.1686145675373;
        Wed, 07 Jun 2023 06:47:55 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id u26-20020a02cbda000000b0040fc9317650sm1647705jaq.62.2023.06.07.06.47.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 06:47:54 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so133955ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 06:47:53 -0700 (PDT)
X-Received: by 2002:a05:6e02:12c4:b0:33d:8c8a:cd0e with SMTP id
 i4-20020a056e0212c400b0033d8c8acd0emr223924ilm.20.1686145673358; Wed, 07 Jun
 2023 06:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
 <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk> <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
 <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com> <bb5c828a-b8c5-40a0-9b67-44e73abcbef0@sirena.org.uk>
In-Reply-To: <bb5c828a-b8c5-40a0-9b67-44e73abcbef0@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 7 Jun 2023 06:47:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXOse+yRUmZBUOkfpWXPRKBw2R-+BVzPGcuwwFV_VqQw@mail.gmail.com>
Message-ID: <CAD=FV=UXOse+yRUmZBUOkfpWXPRKBw2R-+BVzPGcuwwFV_VqQw@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Mark Brown <broonie@kernel.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 7, 2023 at 6:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Jun 06, 2023 at 04:29:29PM -0700, Doug Anderson wrote:
>
> > 2. Try adding some delays to some of the regulators with
> > "regulator-enable-ramp-delay" and/or "regulator-settling-time-us".
> > Without a scope, it'll be tricky to figure out exactly which
> > regulators might need delays, but you could at least confirm if the
> > "overkill" approach of having all the regulators have some delay
> > helps... I guess you could also try putting a big delay for "ldo26".
> > If that works, you could try moving it up (again using a bisect style
> > approach) to see where the delay matters?
>
> This is information which should be in the datasheets for the part.

I was thinking more of something board-specific, not part specific. In
theory with RPMH this is also all supposed to be abstracted out into
the firmware code that sets up RPMH which magically takes care of
things like this, but it certainly could be wrong.
