Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6147A5BE6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 16:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbfGAOid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 10:38:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34315 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfGAOid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 10:38:33 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so29409458iot.1;
        Mon, 01 Jul 2019 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BboFdGHXMhlaYC4iuvduLO/5CvlIjMoquBv/OOaryQs=;
        b=Xs2mvCXij/B0cjG+9x2jqnjo7G5b7NncqEbx407htiIM2JVVMDL5bqrXZR4jbsEfS+
         fHPrjbKU8y29xAEbVaDx9lUMLzTJuH2SCRdwoGuPxYNboUykOuWgtErbrYD7Xa4sS19I
         DqTnwuZnXKxuCJLkTLP8GTFnRP+IJKS6DbuhJMSYLkj3Zsrn8uif4GllWI1eQnbv8FSP
         cOUih2tOs1z4ttqqLFsaUatDcjdcVMl9UutEEG6ZoEi0WJlP7AA0NyWtEdUdnmRodiLb
         aBrqgwEMLfvHj35rt6GLMAFELNwWp3Ba62T34J5NxGvp+TIlgcdl+cpiF49H/tydFRDE
         viAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BboFdGHXMhlaYC4iuvduLO/5CvlIjMoquBv/OOaryQs=;
        b=EAf8ySaJhQgAKKyuacRUed2O3GtsSIQPRDXqfrhzau+IlWRL2gNi2c56zZRRVNOhym
         JStWMsu9ihSf7dWwyBgdSqajjT1q++bWP3R5vds8K9db7PXvSFtML2GJrV1ZqSGdclSH
         /FSwOol9OG6mYBEpx1kIG3d7QgrMELQGpbLMXavBaZ7W3Hy1frjwVRTFtTQgaGJKAePm
         8QhcowItahF0p+kp9gWOE/2UmjwFWoTDjIdyfYHbTbJzrihh9/cFA4vFOiDY8GuLdtcR
         4pmRPfWRZpHLI8MagXcj8JS0DCUApI61fLKuVBmv9xxRNnF0lzHfXmQaqJlzOLmREFvQ
         Ox/A==
X-Gm-Message-State: APjAAAUh336CuPD8c8wc6mV9mUz8WWrUPku1+06toID5xMZe5KO/xxsg
        Arh4z5ml3LN3sfD0EVrzfUuDTeBl0S6IziyW3oM=
X-Google-Smtp-Source: APXvYqwmhxVZxfrlhxAT4/GgUIry7NOKNUNk1Hwt4xtv2zqtRmNRksI3W6jLfHQj0rLenk7CsSoVouOaVn8CUINJp+Q=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr28042785jah.140.1561991912468;
 Mon, 01 Jul 2019 07:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190622012146.19719-1-bjorn.andersson@linaro.org> <20190622012146.19719-2-bjorn.andersson@linaro.org>
In-Reply-To: <20190622012146.19719-2-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 1 Jul 2019 08:38:22 -0600
Message-ID: <CAOCk7No9bZ4AoGwZCoJtz9TOnBHryNnpMpzYoQ2GjC-BvDGcJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: mdt_loader: Support loading non-split images
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 21, 2019 at 7:22 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In some software releases the firmware images are not split up with each
> loadable segment in it's own file. Check the size of the loaded firmware
> to see if it still contains each segment to be loaded, before falling
> back to the split-out segments.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
