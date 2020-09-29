Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF4D27D6D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 21:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbgI2TZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 15:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI2TZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 15:25:47 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E860FC061755;
        Tue, 29 Sep 2020 12:25:46 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e22so7653944edq.6;
        Tue, 29 Sep 2020 12:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g6+kJ55sXzOmwmwx9ZTrexXhkDG+xOy1vdxvjesyS3E=;
        b=fekZ2UsJff5Fo/fquhVVcLd7DJo38TXfDDcfa9WNpccH/w5A7ZPdVpE4YPpTBKG0x4
         2jj90Fx/MBH3J+xgc5fMag3qqxTNPMNukujCZ0r++7KJnBzn5xRpvA2miMdugDt1Ak4I
         JAP2yHj/stbfo+tZFarr7EBpTMp1eeWtVnUNUh0d0CI1OzM72X1SdO8vTC/qxRkznUx3
         lLDYJ4PleobtMkocP5PCM7PBZC6bWGezzbpx4qxuGrtZ4hj8qtaZaWGRobOhAQSBf1HJ
         lZKaXcsuoClAc4mTRRxqIz7xnuv4J7aTMhphIW3BME7N+8YDWuwFLgnc8G5rtU2B6Mgy
         qe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6+kJ55sXzOmwmwx9ZTrexXhkDG+xOy1vdxvjesyS3E=;
        b=kS65DuBxu+GXUWf4uln3Oym4ZZBas6rp/dXr9TJuJEN4+OWn1T30U90wOvzsHWsRMq
         /jn6t66LdE6RxomUBfsfP0/d4K3YyO0ONoPJsUdrzEbJmvAJ0Eu0qzcI1uJP6YjbpgNg
         D8FK5ULRcuLSiTtlQ05l0HwDjJfOiQ+BNaA1vAz5/ae7xh7YWmXNm/nsrGcDiTJ1RQ4p
         679LLioRUHdluA/5z8WRSuYrzw534Xomxd4/OS1IquAESa+KaRMeFHR2SHvW/hciD6BW
         Rd6u6D0SUnoOuZ+ELBENc4H5on1hBwM2VLN4DQGyHHkfmwWVocqs+nllQbDCDfPM5Uxv
         s3iA==
X-Gm-Message-State: AOAM531Xlf4cx4b+0N2Rr6NEFvGwMxFMrdbSy+pCcxfS3RMRWoYWmlPQ
        o5luSe7j9WcziMuMEHtmu6fKrsHQawuXkD4vz0U=
X-Google-Smtp-Source: ABdhPJxVukE7f6YEqDOXDGw1ClqJ8AKKsQ4JtjfxA2abYjKa5h7grAnSKBIP/65FUN4gesERb5tF0eLd7mAbJQ32/zc=
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr4931708edt.233.1601407545661;
 Tue, 29 Sep 2020 12:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200926131157.14633-1-kholk11@gmail.com> <20200929191254.GA984478@bogus>
In-Reply-To: <20200929191254.GA984478@bogus>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 29 Sep 2020 21:25:09 +0200
Message-ID: <CAMS8qEX_eB1pMLfqVCh5sHVaRevCYnpr+846LyZf9dH1-DQvzQ@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Add support for SDM630/660
To:     Rob Herring <robh@kernel.org>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        marijns95@gmail.com, Martin Botka <martin.botka1@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>You should just pull this from the driver data.

I reused 8996's phy_cfg so as to change one line and not repeat dozens
for what's essentially the same thing, so I don't think it's the
better option..


Konrad
