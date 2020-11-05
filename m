Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EADC2A7C8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 12:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgKELEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 06:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKELEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 06:04:06 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DF9C0613CF;
        Thu,  5 Nov 2020 03:04:06 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id i19so1977678ejx.9;
        Thu, 05 Nov 2020 03:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynCqF4YiUezCSPQ7194PLMEnjm8PrstjeoJ0KVa9cJg=;
        b=ahA3Ejn0liKlmgInTOt+2w1C7kppiTmgLwvp1nYH8sKjn4XlTeLqwLUC6GMnV//nW4
         FAmjnIAKv9lL590hq/9DAgPq/QUwiIGIgrtoMJEy2jK4HOLM5dk+kPW2uVJaCSqbyCkQ
         HApAGMBo2cXvtgJS3/DXN1ThVWKzWnjo6+Ub3D7ElKXDxXxOegUKxBujBxw03mvspHd+
         kBPlV8MSzY1CXqltXzv7tvps1rBFSBudtzxb0N5b3oVCk3bS8iaQ/fPj230M/QQ4XjJ6
         QWXvLgUXWZ6N8/E8af5EyvXrp20GBqs3BOvXWqHS8t8RyaSPFLDL2w/PEtQsRWEcJ+1l
         106g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynCqF4YiUezCSPQ7194PLMEnjm8PrstjeoJ0KVa9cJg=;
        b=AYJTVraS5iBRkBn7qaAQJdT9prNfOuhscbo5O761iPr1iv+LU6jwPSPoV4Kd6WW/qC
         6g34Lej6LBHVR84gR+g1SQ5xJs5/s+KNxuwtFj79ecE4G7B/dQQ4LhT9HNlXH534GPB0
         K272JOehKymUzzT1k+lMg4dR5L6lsGC1iByG+rT4C37J9MrTLdLhqwcc+VEgz3j4UWG/
         X8TQ/RM89FBKxUDY8j9jPSXOi2mO8W7rx2v9DviH4a+YJN2ftJpNL2OZV9g7xZICrRy7
         5vv27cBNkZWSB6Bd1Wp5iIEhrMizTbu4no/25IYnlJ2UfqlEYBPE+SpRTDelCZxW8AvR
         8CBQ==
X-Gm-Message-State: AOAM531qpWzFGin9SIHUjTc/xoEn/r9Czde+rqeh6NCsaMOC165tl2bH
        re8sXBnoLeGxGkXC/INGxpaRIQV0ipVYhoizzz4=
X-Google-Smtp-Source: ABdhPJx9s+CDagKcABRO0g1oKumFBjgLd+X7U6xI+IVnIGQp8q8C86wBtBuuXTU5LTckB6HwfYYEWiQxmo72vgzn1zA=
X-Received: by 2002:a17:906:2ddb:: with SMTP id h27mr1680630eji.213.1604574245119;
 Thu, 05 Nov 2020 03:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20201005150313.149754-1-konradybcio@gmail.com>
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Thu, 5 Nov 2020 12:03:29 +0100
Message-ID: <CAMS8qEU3C3Jhde1XHK30-FuYo77w+wZNcjRzTqa3Y712r-NjFw@mail.gmail.com>
Subject: Re: [PATCH 00/11] pm8994 / msm8992/4 DT updates
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

bumping this series as it's been quite a while and the required clk
patch has since been merged.

Konrad Dybcio
