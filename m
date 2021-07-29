Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7793DA8E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 18:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhG2QYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 12:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhG2QYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 12:24:44 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39608C0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:24:41 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id b20so6537427qkj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lrbYP93L2tMwFoTHuD2bfzhhJvQFO01pQtZG8WiVqAk=;
        b=Sohrb55AH82uy9S0BXeyNZ+trj8sQwFMFTGrix422Z6JvroYXcGAMVMQf7fIlpvDAs
         eZruADDr/U7SRQI+eFcQ/AqKzwY8WC1A7fGTSbCrnns45gvM6Zp7rbHVWbq2N4Li0+mk
         r879Og8Y8m072gVYEPBs0guffl9ggBZ5X88x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lrbYP93L2tMwFoTHuD2bfzhhJvQFO01pQtZG8WiVqAk=;
        b=NiI5SAbeC8PLAHYzm/11FD38lPVtlTRT5GgU4iz+IIRo1oAGYiZG0jGAt0FZcL6STx
         1frNffYwqJ9Ui/mXR/RBdGX5C8s5qAy+0RVl8rOSnkVRhzOMPQyordYz7jzQOzYOU5Lm
         KQ5zVZDteUe094CZ9Bln0AGOYitpc+6t7lFyK0+joSvVUi3V9sRwdmz0/msGo/02RPeY
         2PCTJ80tSVP+KP6SORKve424+sFMTcMy80Sml34zlz6/zjOXIEkD+mPALhUGCbdBi6YU
         UymMR4wJgDGjTcRDBwltPqTEePh0nhB1E4IqA4Y0p93Ays7WfMOSdLoEFFYCmjKrHiua
         +ngw==
X-Gm-Message-State: AOAM533fM90Dq5QtPqV40zqVVa/vV1wc4lI5CsIPJdznmQa3+JocTmuf
        2JHj+2fC8O4phlckKX8S56THXjLQgZvvvA==
X-Google-Smtp-Source: ABdhPJzGYvN6WXFTztO7sfpFDmod0wpLKVZFfJZJit8BicCLuqAbhLAp2kqdOfzkE01sIGhYhCENKQ==
X-Received: by 2002:a05:620a:12b7:: with SMTP id x23mr6079248qki.384.1627575879959;
        Thu, 29 Jul 2021 09:24:39 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id v25sm1968083qkf.108.2021.07.29.09.24.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 09:24:39 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j77so9171609ybj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:24:39 -0700 (PDT)
X-Received: by 2002:a25:2904:: with SMTP id p4mr7625518ybp.276.1627575878937;
 Thu, 29 Jul 2021 09:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org> <1627560036-1626-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1627560036-1626-4-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Jul 2021 09:24:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYsKNgZZUmAM22Mwxz7fJFN_3p0YRx6W3dnZHvd13_Zg@mail.gmail.com>
Message-ID: <CAD=FV=UYsKNgZZUmAM22Mwxz7fJFN_3p0YRx6W3dnZHvd13_Zg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add qfprom node
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 5:01 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add the qfprom node and its properties for the sc7280 SoC.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Peachy! I guess a future patch will add things like USB2 trim and GPU
speed bin definitions?

Reviewed-by: Douglas Anderson <dianders@chromium.org>
