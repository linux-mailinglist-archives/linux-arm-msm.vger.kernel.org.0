Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D691DB9BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 00:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438358AbfJQW3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 18:29:52 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:38077 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732705AbfJQW3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 18:29:52 -0400
Received: by mail-il1-f195.google.com with SMTP id y5so3700292ilb.5;
        Thu, 17 Oct 2019 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sk6VG4sPkFCtSFdYjBFAWucSt/q9vykGO3HtJ+wXwcw=;
        b=m8+M1CyEMie47CcfjRHgp9I62GGOWlCixQQfYsWTGbhgVMsKlMxnc3iFcnrbPBrRdE
         Z43KJww3Q/StEeMmx5vFcgARfrmDvkdz/HA0nVGsLII4LqC7Qt4rBnABFfo8pxFftHHx
         Iz1F3kS8OT1l/HYG9XdJuc+UjlZtNsPjBF48Bs75BppxOkNA8Y03/TQTrT3fdTKO27I7
         7de7z+l79k86jZIp0KnmbOLc9GAX/SlXWeA80In0TFHRiiu69KyI6rU2KDGfh0Wb0E3t
         XerqW1V7wpu3chSOfbhRsySqBk67W5zq3XgbvsmNnIqQvOPYEOfa1dY2/hN8m/6+qoPI
         +GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sk6VG4sPkFCtSFdYjBFAWucSt/q9vykGO3HtJ+wXwcw=;
        b=JoANVqQfX1pYCOK5hGNtyb5zSrMgUWhcMa+r+PEI1gOEr0YUYvH4YSBufzvhHXBb1n
         BOG8GbHRp5CBzzb6dCbmPGIrwuwAm3Z1ZWQXPE/YwplBPwatEsU+87UWak8kGlpCad43
         FPoJjkNCtTxchruYcqYpGiiuhFuvoloX525XgtBNpFBNjrxlzpcCY4/B245nDjF96/r1
         pvjwlbVK+nmD7fmE7W+QK6K90tZgx4p5L1+Cc2GPMsyC/O+zoic+YKgQLSkdDtfcEjLk
         23iBwBdPqCQee6lgpOkgzjdxWdYZUeZzgLp/QMIOhfMgUZN5dBoy3BzsBjyshFmQj3Q7
         1FMw==
X-Gm-Message-State: APjAAAUE0jVWl7zV7rHRX0382fRHD5waWQRrbU1nTda2teX6z3OfD2N7
        L3YuOs4fRaZBLtdu4QxorzDH1lu1NYKELxHjxDvh4A==
X-Google-Smtp-Source: APXvYqzWxc++Ae1H65S7QcDaepxVthuKMoGg9hJoezwkz13XN/V+fatcHLfCMk0kWRmjcYq1AFRCh8Q11ca/n/FpI6U=
X-Received: by 2002:a05:6e02:783:: with SMTP id q3mr6246039ils.33.1571351391693;
 Thu, 17 Oct 2019 15:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190925070328.13554-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190925070328.13554-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 17 Oct 2019 16:29:40 -0600
Message-ID: <CAOCk7No8qtZCZAtcTwMBuQsjV_iox8kkCuHfEmECMfaM06MGfw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: c630: Enable adsp, cdsp and mpss
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 26, 2019 at 3:14 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Specify the firmware-name for the adsp, cdsp and mpss and enable the
> nodes.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
