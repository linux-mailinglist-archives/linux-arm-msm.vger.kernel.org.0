Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF594166F95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 07:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgBUGRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 01:17:49 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37394 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgBUGRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 01:17:48 -0500
Received: by mail-wm1-f65.google.com with SMTP id a6so440242wme.2;
        Thu, 20 Feb 2020 22:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5j+bzH0+h9YWG8Jfgzmv4ZeH4M5d6PNPvU+Mt+Cnzrg=;
        b=WVbfm6paNb7p5BRxAlNjksc84ayHrwtj2iC46Y1uE2ieaAhjsSu4bFDQjPCT9U0UMq
         JDwdkzBQPQPJLguWTPEKEoCrWQpz9O/IJ/oLcGZxdUSvxkJ116s8GhGqqZjMPVXW/be8
         UyLyFDWUVqjlexkPChr6utTdLt9OSeqllrBFhf3Hy36Hh0A2Gt6NslZ4rjBgIJM8kABF
         uSaMClgRsPr2hbDg4QUwRZvMReyUVbeTAUGZwNaSd6vWOlkXuOScjYpqhL1d6KN7yaYq
         wnkikBkkmSBCTjYtauJDdJMbNqfeZo5s4+weOSVMRbP8te743AExN6VNoCWRbBFw7d01
         tkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5j+bzH0+h9YWG8Jfgzmv4ZeH4M5d6PNPvU+Mt+Cnzrg=;
        b=OfajzI0TuLHXDU7kf2206moXlupJxealnAy7xU5PN6DBSqym7PVXtLLtGl/Jjqpxqc
         8GnNBDcJaq136pIFJda1wq/PunnGEks8CQTfPzNiuJkNJwttp+70uKmXecyRKJFSE6K2
         K3hmfSYuoMnoHjwSBWyFU0nV6r+lzRyQZAbQDrnVx/+HRh9QHnxYV4xtQLKol1q6Sv/i
         3g+Ka+ooSGBYBUxFuAAsUuWww6CKCvzHZarWm2XbTlWs/LBbSreiR+qv1RN2NQdMIkvW
         g832Bz2K+7GbOdFsQdmp6iulDhOb6adIuamZit3Z+yXLQaxZEbCqZBrVZBERLUbKS5hR
         BfIA==
X-Gm-Message-State: APjAAAUP8Q+zAPJ/M18oyxifwOQdtBIGtgVNXeqKWD4QE6/hmJurnKyc
        5jw71FgM573cX5fM7m2xeNcJg7jxigsaE/w0HSpvi0hj4eA=
X-Google-Smtp-Source: APXvYqyQ0NXTIPXCxPpYK7Wn2NCgCQ7Ep8D2hc+Z0d808bvULgBOa/sgGp/z7cGTum88cT/m4WoG4RIfgvGuK5UiSnY=
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr1534298wmb.19.1582265866710;
 Thu, 20 Feb 2020 22:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20200106081142.3192204-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200106081142.3192204-1-bjorn.andersson@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 20 Feb 2020 22:17:35 -0800
Message-ID: <CANcMJZA6uYyo_UyuusXn18iFpVESc5QeBH_LmxPXTi68jXd7Vw@mail.gmail.com>
Subject: Re: [PATCH v4] phy: qcom: qmp: Use power_on/off ops for PCIe
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 6, 2020 at 12:12 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The PCIe PHY initialization requires the attached device to be present,
> which is primarily achieved by the PCI controller driver.  So move the
> logic from init/exit to power_on/power_off.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

For what its worth:
Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
