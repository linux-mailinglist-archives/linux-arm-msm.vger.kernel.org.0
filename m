Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788C1AE33C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 07:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390679AbfIJF3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 01:29:02 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:47031 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbfIJF3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 01:29:02 -0400
Received: by mail-io1-f48.google.com with SMTP id d17so12775025ios.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 22:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YOZhOjnKxQtEYV190BOI4H6u6Nny5MW7+mBpbmlsC2E=;
        b=Zw5KLIJwBbIy0+mASDh+cq5twLSaMf3PvMF0elBkc0jj5GcpBbsjVqVovuu7mNf94a
         l9dcMDaAXiGQ+eEQQXmCYZpJ8Vy647ukmWvRVO+0KnZQvIcUigqac+O8bqioNs53tEXg
         LQxhnoKh68Su1nf24BkzMVwNZleTZPy5e3/tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOZhOjnKxQtEYV190BOI4H6u6Nny5MW7+mBpbmlsC2E=;
        b=JS5g06afdP2gXF5Va29/s6QmKsgdat26Momx9Eo5NmULodGO0ReFDwzUzGCQ7V/pOw
         sh3Osahb90HpzFJhPdLqYK316IXGEmsKgok+6kkynHiVLRVx/yMrsI1MNs2KIxkf0c1e
         5A+11qxmgqVyxNx7rFn+9NIs1yJx+p4jnygAZP6BcEeHQN8AmKSsnMrEhkixy4j1o8SQ
         kzqPuU3rkRsDBPr/U5zQXgIbYxqIEMCZepQZattoGrYMIMP8AgSzW5qgOdtG5B0Z0/JQ
         MoNxS63LefdD+vw26YIJg2SZkPV0FrRPYPK7F1AkigrXCWewDbX0IMTSUTGFDNZWucN1
         wloQ==
X-Gm-Message-State: APjAAAVpga8rqOLZMP1M12RiJoGyi26XRAXb5j0q/D3LyuR2BBexUZwt
        vW7InaFpCP6MiUL5ROynQmzs3YY1wSTYz6jgKpskYtYE
X-Google-Smtp-Source: APXvYqz92sm2hEqtLwz/5qO5DolWApDzXDOZyZ83uCrU5LRds0yHosiQLAdyIEDuwJ3ey5Za2Kqqp4JjvggxEqUVK38=
X-Received: by 2002:a5d:8f9a:: with SMTP id l26mr5421860iol.26.1568093341509;
 Mon, 09 Sep 2019 22:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjwcmNn+8t3pSSUf+SLayiH8AWcu8iZYFTrx=FVdPQB+Nw@mail.gmail.com>
 <20190910050305.GC5157@tuxbook-pro>
In-Reply-To: <20190910050305.GC5157@tuxbook-pro>
From:   Rob Clark <robdclark@chromium.org>
Date:   Mon, 9 Sep 2019 22:28:50 -0700
Message-ID: <CAJs_Fx5PFLD+BaUMxqj9apBxg1mDWGbDUiBsgYfG7wpX6UGyKA@mail.gmail.com>
Subject: Re: qcom: add firmware files for Adreno a630
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 9, 2019 at 10:03 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 09 Sep 12:52 PDT 2019, Nicolas Dechesne wrote:
>
> > hi
> >
> > this pull request adds firmware for Adreno A630 GPU found on devices
> > based on Qualcomm Snapdragon 845. The original firmware files are
> > distributed by Thundercomm, the vendor of the SDM845 based Dragonboard
> > 845c, using license terms defined by Qualcomm for previous
> > generations. The original firmware files can be found here:
> > https://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/
> >
> > The following changes since commit 6c6918ad8ae0dfb2cb591484eba525409980c16f:
> >
> >   linux-firmware: Update firmware file for Intel Bluetooth AX201
> > (2019-09-09 04:22:42 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/ndechesne/linux-firmware.git gpu-845
> >
> > for you to fetch changes up to 88ea23e7eed04e78111013df9b81dd851037e4da:
> >
> >   qcom: add firmware files for Adreno a630 (2019-09-09 18:13:55 +0200)
> >
> > ----------------------------------------------------------------
> > Nicolas Dechesne (1):
> >       qcom: add firmware files for Adreno a630
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Not sure if t-b is applicable for linux-firmare, but if it is:

Tested-by: Rob Clark <robdclark@gmail.com>
