Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D36C15BE78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 16:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfGAOkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 10:40:08 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33953 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfGAOkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 10:40:08 -0400
Received: by mail-io1-f68.google.com with SMTP id k8so29422089iot.1;
        Mon, 01 Jul 2019 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BboFdGHXMhlaYC4iuvduLO/5CvlIjMoquBv/OOaryQs=;
        b=NqMMVu3llexL60UENojjstBHElmazSQGlT5mfzIWlDDCPUA891e7qURrQirX8HzJ72
         6IjdEllgsTzSdOpKVUw1yuV3JysTIK+Io/GEZOSQ/+EzM8Y2r69YwpVVmeQggIitbdpX
         jnvFMNkJq6cVZuN2Mz6BMp9jkcVNJcbDi9s86wfGkHnfNBiKFYtcQq5MGWxCwE+HxzKX
         SJ3UuKKkLaJP7csE54n4l3DWcvnu0LIvYVif/hJ971lGkvj2j4a2dLi6+FNyVSDsCXdI
         1PQhz0oGOkeJlYKuo+nKxysj/NK9vfjU8/KgvHr7yts3Wsmt5roWjw0C/s5oTAkrMQ/5
         SedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BboFdGHXMhlaYC4iuvduLO/5CvlIjMoquBv/OOaryQs=;
        b=KZOo5Zr6vKArSQA2G38vhYrsHioPGLUSRMXgErPGRjs4piWjN5vNiffYXx2Tl0NJBl
         HDJmkJDfCKRpzZQIXf3ChHzWxiMqdBTmFRJyxZPzM1Ngz2zD1TsZWjnGTDHi90itSSx9
         NStaXnSXXAXU62Y98W2kFlVuRb6Hv4TcuFZND1Xmpvifx3bSBce83ZBmQV3iXKj/ihxo
         gKIbDRK5C1TuVUrmX/ATYDYq4YJjHELLUCTqvhK+Cj9fJjxnIq4+yCbNh9wYKzo9VHDU
         B1JuQkR3v3BDyQLs/ePWzb1YQcgAlhbiMdAT6Xv67SfJ0Z+z/CrvYt8FDZIVtXFxFirX
         tiLg==
X-Gm-Message-State: APjAAAUF69E3VkTtU0q1L86MaYzi6KkrS0prhwn9JU/ckwsHyMCrCYYz
        W2/EpGyYqV1bhy/CGZYsUnTN+IYu21n69o5tEPGhdQ==
X-Google-Smtp-Source: APXvYqzgLHeNZMqJcEb5ubxuwQsPJ48nre6r9+dQmTZ2NcyMxnBcWv8rhxfhmshBBNwlBZrEP9qPrg36GcRKjS8idWc=
X-Received: by 2002:a6b:1494:: with SMTP id 142mr6658360iou.72.1561992007874;
 Mon, 01 Jul 2019 07:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190622012146.19719-1-bjorn.andersson@linaro.org> <20190622012146.19719-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190622012146.19719-3-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 1 Jul 2019 08:39:57 -0600
Message-ID: <CAOCk7NqwYz9OdYfKHJKet4AQFN7a68ussJi6Z3Aq4B_-za1K6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5-mss: Support loading non-split images
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
