Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A3C267643
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 01:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgIKXAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 19:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgIKW75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 18:59:57 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334E7C061573;
        Fri, 11 Sep 2020 15:59:56 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id lo4so15724020ejb.8;
        Fri, 11 Sep 2020 15:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYXjwmgsZJNH0N2fwXXMkd2ZEdxHOe9ywk+vGisOB9s=;
        b=hUobuFFFGvhIklyFOLkiSlFHgjB7dhGms0oRc44/DszgvWXMHd0xO+mrQG2EigfhIR
         Ob4C6KGzkKkbOBHj5Hi9DsnaQWp0JEiy+NS99PAvfooAi4V+XkFv8NaGfHd7lPUWhYzV
         YSP1k4huhzBJQz1C2YxOeokow+f+Oi8F19j1Fp7/jLeHGeysnqApAoHl2/JcxwZPblkH
         w3q69S+/IAyO9NFGfMqmVozaVs+3FqDkm/4tl1TUn60LO8fyjGUNmB7IxwYSXuoiVnNZ
         NF+nrhrmthE2IQY+5rE/ZEf36ClUzXC1REhbkPS4dpIXvDbTxb32xWFonIU4tRTUOa7h
         VQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYXjwmgsZJNH0N2fwXXMkd2ZEdxHOe9ywk+vGisOB9s=;
        b=DywD/Jd+tTxZpqo4jnglwvlIoDeWQNPeVW6mUIWt93DPSHGGGHMve/LpmyLU0jc69j
         KTRRZAulfWkbVGQgoNsaFwJbJRLBazpxiyB2ifH9R8ZyRo7F0+ic1y85IlnNI5N5mavO
         ADrwa2ENGRBCz227aoq7l9FMA9sAAOeK6jluq7RAckx6um64EA3mJifQlM9V9kLyXlTq
         NeHxC8qJL+U55dYODaJrsY8Qtbo5fO8gWo0CXXNNPD/93TeK8Ba5+vxgkWHbFYIhIFy4
         /7Hm0fnOiWxYKTSoJCI3tUSfVSa4OuuaF5cKE3b4Iik0+XufZFOLHoE1G8QrhdWfrwcy
         MWWg==
X-Gm-Message-State: AOAM531AA63iVcKC83mXgMD+aGwseDXO1PsOXxNgv+46OVmU7qq0QzVy
        H4xuSR3k5+UCy8GjpE0QtLM9Q3j4S4APe6MnasY=
X-Google-Smtp-Source: ABdhPJzyA233nHHRz03fUU+qECEoajGEC+EfCdIE2RXY7BMiLxXaGYHExBNZLwCUY9+2aKbmS1+zSP+5TVUMbFVYgZg=
X-Received: by 2002:a17:906:8695:: with SMTP id g21mr3989984ejx.504.1599865194678;
 Fri, 11 Sep 2020 15:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <1599840940-18144-1-git-send-email-amit.pundir@linaro.org>
In-Reply-To: <1599840940-18144-1-git-send-email-amit.pundir@linaro.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Sat, 12 Sep 2020 00:59:19 +0200
Message-ID: <CAMS8qEVmRQCuUci=pkTRixHfUm=eOwmdwhpF3ox0Z6LNE8SX5A@mail.gmail.com>
Subject: Re: [RESEND][PATCH v6] arm64: dts: qcom: Add support for Xiaomi Poco
 F1 (Beryllium)
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'm not a maintainer, but I reviewed this earlier, so I guess it's
only appropriate:

Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>


Looking forward to future patches for this device! :D

Konrad
