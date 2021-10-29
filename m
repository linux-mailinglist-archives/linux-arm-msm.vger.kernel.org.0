Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642644402C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhJ2TFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhJ2TFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:05:13 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EA8C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:02:43 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 71-20020a9d034d000000b00553e24ce2b8so10216625otv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=GpCIhA9+wByobLj7T+jx3wSH4gGS8i8uDhYC2c+0spk=;
        b=H40YBjSl24IpyRNc3tR66GsznVBBR73W06kOgCkhC7aRGCLDor1RpsqCxk8Mi5zLxU
         +ajnUrDPlbQHfzTz/5YT3x2kjitBtAxwmSEHw8CyAgPSRH5VjCKNATtDO0zGlfVfzNzH
         Zq+kUFRrMGBsFJM8P2xhzdu6PvKRPpCejAV4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=GpCIhA9+wByobLj7T+jx3wSH4gGS8i8uDhYC2c+0spk=;
        b=vy/RPlCtVv9CG1cyau9B4k2enjxYjgnpZq5ll7/7j/p7rHj90HSRhU17Agtwtk3fDU
         znKDJC0o5WkN9HBwZ7ZAX4GKsaAl/YwFzY3ekOIQ22cyNFDNF65zRMbXfDZsjI1D7r5j
         q3cShsBoObb/PLtQLBBBYZ90B9twnCRZ49oh2GgtISledo4ielBiYjvyFi+EtNHs/nWt
         yzeK9h/G76v1qOs4zGhaqdToQNKA4H5syrlSanFr17+VaMx8j/PP1ALWsX89ImiGJcOW
         gpNMSbrFWECZtjuAzeHItzWzj+palJQtQYUTWoK7k56G73NsEoaORLKLhaOfyB26rfm2
         UL0Q==
X-Gm-Message-State: AOAM530RAKPxOLZ6PWf+hnHY7iXvYTFQtWetZIbDe6hQK3Bos1G0HLjU
        W3UtinUXlT4g7ISh4Pm2LA1poOQoQt7CWupx9bWSwQ==
X-Google-Smtp-Source: ABdhPJwD5Ms7XyyP5ZQv+IuN7Q47sYd9whm72ehzsLFfBOZr7vCMUfWm6H/7b9AIUtvxagjeaRAhHVPH2FHST3pAUUk=
X-Received: by 2002:a05:6830:1290:: with SMTP id z16mr2795567otp.159.1635534163270;
 Fri, 29 Oct 2021 12:02:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:02:42 -0500
MIME-Version: 1.0
In-Reply-To: <1635507893-25490-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com> <1635507893-25490-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:02:42 -0500
Message-ID: <CAE-0n53u5mJSApfEn5t7PxRMDfwHBu3iLdDC0V1Brt-5K=YHyA@mail.gmail.com>
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     mka@chromium.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-10-29 04:44:53)
> Enable pm8350c pmic pwm support for backlight on sc7280-idp2.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
