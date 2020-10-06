Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE8B2853BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 23:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgJFVQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 17:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgJFVQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 17:16:20 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E84C061755;
        Tue,  6 Oct 2020 14:16:20 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l24so15126201edj.8;
        Tue, 06 Oct 2020 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUkZ8Np/B9A5Tr2kvzOhcQInYr++ig9zgQwFFSAu5tQ=;
        b=B174AjMWaVkO+6KTLUNvwpCBr7+lgVZQ8qWbkXUHz0/+M+xToZFzJBph0HD4WkF6w8
         6ozCOwRRcFGwIQE15f74mYCFidd++dbwpD6x/FTKS1JMocfWzn8yIeDA2FkmeWjsMSW9
         B3Zaq/pTLKbq/qzcgD+7oQsDUsrKhrO4oRG+qZNtXO7m0qs+kaa+9EGFm/Umq3Q8KDBk
         JGYRz2UrXKgEmxZ7Peie1qDurKMUH6zc8KI82o/vAH3yjU62EJXQGTxvTGo+WdjArslf
         gFN47emE+HQprl9Wtjmubxxg2SXrvAnhLssEVOP/ebY1zpNw+QyGMzplimP2g3jBgcGM
         C3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUkZ8Np/B9A5Tr2kvzOhcQInYr++ig9zgQwFFSAu5tQ=;
        b=R+NbmFrnneazgk/ACZ7cfSSzde9Wq2fgMHoWX304X8DoyzF5ymC354ee2Sbe7WGvci
         o5CBd8nYyjcG79Id/WfNgp05yAY5AbU9BzwF8/Avf+TMD4wemMKfyDIZhPtwdCBQpvEg
         U2Y8oAmJ9IlTQOKD2k1O3OmDxzmltCnnBxu1A2BSwtSTP7kCfFWDAAgSJY3h0q6HbMyY
         w5tlv/MGyrk9TXMYiUUuqy4CtT7srsuJI0azOZP1lp7Bk52oBUIIV9HbGG5YEk9vEsYw
         7mdhYnncqmOHP+Nm5pOBZ7NR8xZnR2iePoncUl2JgVq+3IpJJUg8y98UWoPp18Tnf5ub
         2AXQ==
X-Gm-Message-State: AOAM5332n5/0VNDZQdL+5OGmg3IdmanaNtgsatWM9pCPcSgBjz9X+1CB
        aikZ/qiQ/ov15yqD0FMRts6A75P49f7oqr8lIoY=
X-Google-Smtp-Source: ABdhPJw/6Zfp8xcXnJLtHO8aGQ2XkYGNMbuzpVQDOmwKNeknUVV9pO1fIsyCNinlHc/7TjB3cs54SvDo9UNfvzkm2NE=
X-Received: by 2002:a50:9e87:: with SMTP id a7mr18518edf.297.1602018978939;
 Tue, 06 Oct 2020 14:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201005150313.149754-7-konradybcio@gmail.com> <202010062217.7j4tkUkR-lkp@intel.com>
In-Reply-To: <202010062217.7j4tkUkR-lkp@intel.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 6 Oct 2020 23:15:43 +0200
Message-ID: <CAMS8qEWM8oMnPx7=c3=toQ0quUbbFRWXHf=eTMNXtRdORLSMJA@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: qcom: msm8994: Add SDHCI2 node
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please note that the bot is correct (this patch does not build if
applied on its own), but I mentioned its dependence on a clk patch in
the cover letter.

Konrad
