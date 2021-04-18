Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8AA363320
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 04:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhDRCDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 22:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237206AbhDRCDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 22:03:24 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25751C061761
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:02:56 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id b17so21819820pgh.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CbhdQHbWRym0+Jb4C6kLr5Ql2zPCvZUevjtnp0UACY0=;
        b=K8tyZdc0a05Lfkk4bMA1pVWGGcY8hrPmjgFi8BriITExVKwDv9S+Q4KAKVKtnvzrw3
         ku1Uwwz2RnhCRR5L0yxU1ZFVpon7X4ucFhHBuitM0kxQnpZxo8daw0abixBZljfmf4f/
         dxT0Fmeo3zv1oQniqLAyOCyR7bxd9/DgnvLu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CbhdQHbWRym0+Jb4C6kLr5Ql2zPCvZUevjtnp0UACY0=;
        b=BmOSU8jDRet4pmr7Y0ySZepewMj+tlaImCdCCxdgNhbyANyOW3BeBril2i79i++P+J
         aQ/82Vu1iOrdq8WpiOu9VmO7BAqY2y1Jc1DyP7XIpPZesxfYn2DGzMmRTIf40z/2Nal2
         gpVm4Aft5u0jU0vn2yXGUu7Ng/PzeNqeGExKzAMFz8D41ormqMX9yuMy19U2VTohc7LR
         kbBkXdlvtHgYJ9GOLW+BoSHA39HK1//Kgv21qqjO1oeCBhX6NFWQ7B/aXZgWRuCqnFzJ
         ndPzaCC4FUoxvXA1Hx8V6GOq0dn17DM0yfMjTzWlNLtsavKCp1EihHxYOsVmM6eZFdrI
         W6Yw==
X-Gm-Message-State: AOAM533vD8QsHZwbR69a/0pfDN5JyVorIVbMYbTrq6JMEqKXD1bPUNKU
        ucf0y0b7dw7eN9ctTpa8e3SMJw==
X-Google-Smtp-Source: ABdhPJz1rOGvxjAHNs27KEyLsrpD/xu/asHSTcZrwNm6yPIK3+68UOFDLh0+fCwrE0Q5gCQ++eVgKQ==
X-Received: by 2002:a63:130b:: with SMTP id i11mr5617657pgl.302.1618711375680;
        Sat, 17 Apr 2021 19:02:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id d17sm9195487pfo.117.2021.04.17.19.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-10-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-10-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 09/12] arm64: dts: qcom: sm8150: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:53 -0700
Message-ID: <161871137386.46595.1715637994185225115@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:55)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SM8150 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
