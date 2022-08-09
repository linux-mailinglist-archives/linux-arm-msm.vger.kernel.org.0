Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C125458DC30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 18:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245146AbiHIQf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 12:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245151AbiHIQfO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 12:35:14 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ECA11C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 09:35:11 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id bb16so14437653oib.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=ZMc2/rbQ4xMkBKSMUQ5lQRSNwUqs/YewJHSa/AEK+WU=;
        b=nzH8WYSn1ntQKIxbWaHZbS3CuNTwi5ms2/6WL7WS/w71/gSYfJruipKNs4HmFAjmxR
         Jqm9hti9SjPAMq2AglnqfkbBAlteEPW6Hq3XJ56Pz5aTpa33Rv5v6/w5lxAZAtrN++ZJ
         Vqz2TT/guGXb9uoPkC+QXmxWGAEaMiAFefhZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=ZMc2/rbQ4xMkBKSMUQ5lQRSNwUqs/YewJHSa/AEK+WU=;
        b=7ke0CAourOLjyQepEZY9ds3p6Tvu1D+6qup+qzfwHLe6LXM9Z00J3C07yfm3UusBYe
         +cfbrh3IV8DVDealtUIdsD+Gt78YyhH4DGeq3xjEKM1/QWPJCCMVRP2Ax3HHbLDCZg9i
         p7L0LUw5kvd2Q2jdzMWDUddAP/lWtimTFh9LIXVdU1Ln5Da8R7AAbz2hkLNO4tDJ9kUr
         TlJwQq5WiWzqkYIRmlKSwFNbcDgJX/0159ZMF7ieRti2VGEjBp7jISdTbSAL9IdCUGxU
         MbBaWD8QbOuP0Pv1g7JK9WButYQO+jepXCkyAD6dApuvD7i5j934NPSqtvPXYIuhjzFt
         ooAw==
X-Gm-Message-State: ACgBeo3SRQRTWt7YB9wlDpogqVm0gnaYopDQ+c+rhVOEQxA/ryR4Ond1
        fMJd74Oler3fpapihYjrWxQXK9D6iLEpk9zsCu6f3A==
X-Google-Smtp-Source: AA6agR5NRdZDIrlr3Dy4JVSTO9fCWj2tztSQDMMqLLukD+0KUdG4kXh4VFtp7W4s44JVMZyd7AasMUnAVlEc12LWu88=
X-Received: by 2002:a05:6808:1588:b0:342:ce6d:bfcd with SMTP id
 t8-20020a056808158800b00342ce6dbfcdmr7072300oiw.44.1660062911169; Tue, 09 Aug
 2022 09:35:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Aug 2022 11:35:10 -0500
MIME-Version: 1.0
In-Reply-To: <1660026909-7365-4-git-send-email-quic_c_skakit@quicinc.com>
References: <1660026909-7365-1-git-send-email-quic_c_skakit@quicinc.com> <1660026909-7365-4-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 9 Aug 2022 11:35:10 -0500
Message-ID: <CAE-0n50TWAug7LFRXzAi+EuBy6TQ_U4OsTmVLHsEAPu2pkwE6Q@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] arm64: dts: qcom: sc7280: Update lpasscore node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-08-08 23:35:09)
> To maintain consistency with other lpass nodes(lpass_audiocc,
> lpass_aon and lpass_hm), update lpasscore to lpass_core.
>
> Fixes: 9499240d15f2 ("arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
