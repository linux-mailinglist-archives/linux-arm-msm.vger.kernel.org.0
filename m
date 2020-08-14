Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54989244C13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 17:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgHNP1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 11:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgHNP1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 11:27:20 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1E8C061384;
        Fri, 14 Aug 2020 08:27:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c16so10313837ejx.12;
        Fri, 14 Aug 2020 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=laB7aE4hgtTLxMhcqJK/gtN+/NQVEMfkjyrRHT25v7M=;
        b=dYgXg/G3LgCbNh9JMLbZBeu/qQ2oxY1Mj9rY3lBz+zDWkR9u63sRSMWkvq0p5z/w64
         ynepp3rWZI9KIEIFYLAp3bMpYSoRgAId8SBass12h20sKZIGvgVCmoLXQQcuUNJYwpA5
         j5ECwVo0jJ3WuZfcFfHMvrAf6lCDfDhu1v/t2jUErnKimQd7OSV2BKn0Ztak4xFUu79U
         f6V5LZELenBEzaKSsgdr5kCn5EVK7ynHtumvJ+0aOXh/JmSXGvz8k9WQrW4Vbz82L8H7
         EbU78O5ululCJ9bPfSbTK83sBRyTiVbTjdc92IhMYtvTa9Ncdms6xqKtzJctfA6sPRls
         hA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=laB7aE4hgtTLxMhcqJK/gtN+/NQVEMfkjyrRHT25v7M=;
        b=SnoXxHyzKzbGyQTSMY2+69vFvFbDd2az3Cdv6VMpd+D9NfSGxH1B36I+0+f1S38RU8
         yJ9FAxtYiTcPmMC4r02ezG7J7gD+wxUb2r7k5qqLi28W00f5LS539TX2c/2cQDJUtNyc
         CqsewRpIuT+wx2JitIEplXocaumAhPOsgN21hlRW1US4utHMNPPNPCwdXPiIxTZ8FETJ
         Vmr2eHkHW8C+GrYCirTnBblgLznNB54GcIrmgGqhCdvcMF5IrtORDp6VvMZdDATIiumy
         6wXms+rXgKWplPZQnaDkqW+AWWhi0285Xx1nIYaiDV2hMFoY53/qP7q2rYZKEPJs3tKM
         vdYg==
X-Gm-Message-State: AOAM533lQvjqggzA99Zeqxms2Iog7L2haH/0VqfugkXxNP8qsr6enGor
        qZVqdMsPSR3+KNZrzc0kJJZUMT46z9PlWkjqz9o=
X-Google-Smtp-Source: ABdhPJxzrpdNKl1n40Wq/XKY+9obkbHdMG7l1mh2ysAETZhznmJJNSayHb9WcWtvRklHAnzv0EkUY/cshH8+meBZ94E=
X-Received: by 2002:a17:906:3445:: with SMTP id d5mr2856635ejb.348.1597418838713;
 Fri, 14 Aug 2020 08:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200729120057.35079-1-konradybcio@gmail.com> <CAMS8qEWQZPAZy71jx2Wx9B=RDximmC_A9On1Tk-3ekL-LTgsYg@mail.gmail.com>
In-Reply-To: <CAMS8qEWQZPAZy71jx2Wx9B=RDximmC_A9On1Tk-3ekL-LTgsYg@mail.gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Fri, 14 Aug 2020 17:26:42 +0200
Message-ID: <CAMS8qEXj8pHqhtHj-rwMvB8NvuuDbmzP2wZDRcT0r8YA6dX2Bg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] msm8992/4 updates
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bumping again, merge window closes soon..

Konrad
