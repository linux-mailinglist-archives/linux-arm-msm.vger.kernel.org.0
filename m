Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B343534E292
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhC3HxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhC3HxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:53:14 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183A6C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:53:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id q5so11581822pfh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IoQxL5SNt15tfSmANbIGywwOC//PGu/AdqTu8zsQmZI=;
        b=BPvvgXpa4E1f6072r4PS8uBp7TxaOtihUqR1PbColsWBDV3p0DJYTF4TMOL2URgasY
         gX9HC3te4OntjVMMx3/dPQQW5vJbmjB+xyoXHyA8+POrApnNNgdQgvIXQ89Bl6j0boQr
         SJ5EIcL4YMny4lVnyPcZ6jhIBhRT+snJrfR556H7pF0NaaGrr+tNZ721vrflK2aPSasn
         o5Jz1rwEWZunPfBa1J7V0rvTWIy+eZTUp/6ZqSfPQPLEM0Vowmdat6/a9z+l/FBfGzvr
         Q6aZM3UsQzcvgSNrbDk04SPEASrPKZLn7Fs82CPx46pdfwKeraOjJtVAWo+64I2u7Cd9
         T4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IoQxL5SNt15tfSmANbIGywwOC//PGu/AdqTu8zsQmZI=;
        b=AAMluOpAMKKW1efjGDjzPkXmDzZBLd+E30ssImvsxBlpV+ptQ8N3NCAMqo14klW+tt
         vqCD7uogChnaAreF/6dNQ1xl+5TrdNiGI6nSHjXBQTXu1Kyh6/b9GIbNAXMjvFomJrSx
         3wwvjUzSca5rWnetIKa3R0q9ihrkfzGrtxkxmxdBLUGIVqHrif/w13H2Fxw6JQI7ePu5
         O4gTSq9GO+ABOv5gxTkRzbfmeax/wi+vURunfmsJ95yKj2HdrSUEacxDXn5bXLdNw5Ws
         3kxMiKeXMz76ECXcAz6IS3OHaRM2sO1Bk+qh9V3Nkwlnjvnk7WmUkTYfn+fAJg2vj8IK
         sRIg==
X-Gm-Message-State: AOAM531APM0z33/w9oVQUrmanxE7gTZxDOqUYdpn1Tt8fYZDenZYh52j
        1NQzpUJgXDL/bEJ1bAJ0vKul8WBCBRVmot2jCdXs4Q==
X-Google-Smtp-Source: ABdhPJxAlg0Ep3+QS+d9wnuUjE40HL50+UAfhzmnWiEpxoMoBqq/eqhwmcHU85ImtV4/J/p/xvF1M+Xop6uVKYDaAdI=
X-Received: by 2002:a63:2262:: with SMTP id t34mr27862921pgm.303.1617090793577;
 Tue, 30 Mar 2021 00:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-3-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-3-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:01:22 +0200
Message-ID: <CAMZdPi9MQzAKZj2hRMhD6d1vP-EXkfxUdmQuqKCSZQwmexSQ-Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] bus: mhi: core: Wait for ready after an EDL
 firmware download
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        abickett@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Mar 2021 at 03:28, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Currently, the firmware load handler returns after the EDL image
> is downloaded. Wait for an MHI READY transition instead as the
> specification expects so as to proceed with further bootup such
> as device entering Flash Programmer execution environment.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
