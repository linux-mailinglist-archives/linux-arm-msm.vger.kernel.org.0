Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0A0CBD6DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2019 05:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404175AbfIYDyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Sep 2019 23:54:53 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33442 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404095AbfIYDyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Sep 2019 23:54:52 -0400
Received: by mail-io1-f68.google.com with SMTP id z19so10076825ior.0;
        Tue, 24 Sep 2019 20:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+acqBt5VJ99apROCi/NPB4kB1o37RjLA3YAAnHYyo4=;
        b=buATyQf+LCIhqKqdo7D+IJ20njSJeyMrVsmBHxp8Y13ne2ZnFoyIjp/ckaLFUU+W39
         qr+oB81+bg8DfteiGTJ59GCkFcUnn/T47eEe+yGJ6z/W1XfahvLgxqeEW05vwN4GAcGI
         OIEBMIG4pjsinzGWdq6gQUHbX0am7zBVNJ2qxRi9M9fIoziij29AAYtVS3wro0yMl8hM
         TxSlmVfHM6hTxbuJOBrQVeagEVS8gBp0sOFW4KDH4E/2qaPMJmjerxRlurEtHsgDE73I
         OYSjDgXWqNeeO7YsXQlhsFKHFwNNVlcEjtJEGXwkBcbBn+BklkVuul4MrvL9ol6nGVlg
         jsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+acqBt5VJ99apROCi/NPB4kB1o37RjLA3YAAnHYyo4=;
        b=kGhdDc4VMK71r6iRbuoNeUHpszGYLDVd+jobJoqv14F02V7G68T8Ps7t/nfhTmPANb
         iFWPyKmoNLaCTo1NlT2/ywCVGfSYzS4ulZt70BMh0GGNI7eDm4SJoUMKa+etk1pa8b92
         V4JSW5xrWtWyRUshxaRmG67wrjmof3hDLIBtUYfW7pgYLPdCu+rMWTcNkKVX+rXzjFKv
         PyHov06hg5gJQpWQ0Nr9JaO4WRg5Ic7ri4ESM5aAcWclYi1l9IOtgNazhw+geFLxHkHF
         Ec+b532caJ1GwWvH1YQf+2uJXO3/yLMEZikKevO3ziorWrMtqOL47+OFTUlCzq4Kkvkn
         PaHw==
X-Gm-Message-State: APjAAAXaqC+/IJ3iY9fB+63VvBH035ZWXfnEmuIKGlOqtOPenOG0fH5g
        cVr/jq5jMrnmYWOBA3QdwuJ0xgU8KiDMl6Ak6s8=
X-Google-Smtp-Source: APXvYqwOoVKktSMIAIiLEl03PizysUXeuZVzbrclwTXFGwOhkM8lHWPbcUN0RxN3XVJOK8eO1stk3H677Fi9e/tCYr8=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr8026975iod.263.1569383691941;
 Tue, 24 Sep 2019 20:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190912091019.5334-1-srinivas.kandagatla@linaro.org> <5d7fe5d1.1c69fb81.eca3b.1121@mx.google.com>
In-Reply-To: <5d7fe5d1.1c69fb81.eca3b.1121@mx.google.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 24 Sep 2019 21:54:41 -0600
Message-ID: <CAOCk7NoNX7+fxCYNOCMVCv1_-X3ZbaHwFjzWjMp6VKL6ZoroLA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: add missing soc_id sysfs entry
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 16, 2019 at 3:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Srinivas Kandagatla (2019-09-12 02:10:19)
> > looks like SoC ID is not exported to sysfs for some reason.
> > This patch adds it!
> >
> > This is mostly used by userspace libraries like SNPE.
>
> What is SNPE?

Snapdragon Neural Processing Engine.  Pronounced "snap-e".  Its
basically the framework someone goes through to run a neural network
on a Qualcomm mobile SoC.  SNPE can utilize various hardware resources
such as the applications CPU, GPU, and dedicated compute resources
such as a NSP, if available.  Its been around for over a year, and
much more information can be found by just doing a simple search since
SNPE is pretty much a unique search term currently.
