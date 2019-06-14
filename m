Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9DD465DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 19:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbfFNRjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 13:39:53 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39782 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfFNRjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 13:39:53 -0400
Received: by mail-io1-f68.google.com with SMTP id r185so1583185iod.6;
        Fri, 14 Jun 2019 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pyNZh3/ZiJGCHGyK6bSxYhhEMHeQph+kYYlr649t5fI=;
        b=fnFmAH1S+PAJamnF3NqeGjNJKLKabKSrwIeQ4EWJOLeaxDi+l9iEip4OJmJBE4s4L5
         t9EWMjkoX75msS90FvzStnVp/1AD3CIo70/WhRleVWjKXaqS3APRMAJECm+XcYadU/ix
         NoYetrWGQsDpipp5CJSmFksF4KKmbPS+G5fi+ZUtKbo2GXH7BN59YlDslJywgc2SS+gy
         7nSTV2khtyZxk64W+L6RLIHRhrh19JY6SbxYGhrM4ZCTDfu5g2mtLUyNnQtuaUcGndFD
         fG4rYx3xyR8Rc02ZTzSUJSrO3nLpuK/4ZfzmIZPbx6Ud+dlFALl7B/IX0ZD07hvzgrFQ
         PnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pyNZh3/ZiJGCHGyK6bSxYhhEMHeQph+kYYlr649t5fI=;
        b=SttPqDvXao+Cd1GUZVy+vSg5gDTLY2Q9Otpe/yV70Fb+zOHaHaJx3Wh8xQF1TjMOIF
         5QHdQmJ/Ha0Zn8uBhhA14w/FEYM26cvLKlK+9z9TlaiBhXlYV8qavsw5BwSAwqxLHuUX
         uF8InqHc50SU1oitdoURr2ZdrPt3oev36tv/GQ1XldHxVoN43NTdUOnAFW+9xOL2OKMc
         mA3dpY0EcS8yOPWysqrGMR07haTDus5lFQDx9BZZPpXPiQRtcodliTmvcXx/UvCZ5N4w
         tpy/8punK88JAJUxt96r+vaXj+N53i6BimIiEAVv9zNqCwuwZSyb/qxM9FXbfOGuttfw
         Z84g==
X-Gm-Message-State: APjAAAVnnlWrQz+T6WTQ8JU3+RnJG+M/ZDFP2EC9ft37csziXFskjuLy
        7pMt2JHyF4X+jBmA5mj3T4d8fdAb9lR/VLGfA80=
X-Google-Smtp-Source: APXvYqwNZ0eXs3p92pVUhwtqOL0humBUMj2IEaTDc3AAW0U+hb04I4VnHxh86HS27ouhORHP6iTBY8v4nEVPMWiA21c=
X-Received: by 2002:a02:9567:: with SMTP id y94mr69763782jah.28.1560533991898;
 Fri, 14 Jun 2019 10:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190613162703.986-1-tiny.windzz@gmail.com> <20190614071245.GA2950@infradead.org>
In-Reply-To: <20190614071245.GA2950@infradead.org>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Sat, 15 Jun 2019 01:39:40 +0800
Message-ID: <CAEExFWupzjErW1E0z3tcR2xyGgpWXwgLZOTqvru4=hk98EfGhQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] iommu/exynos: convert to SPDX license tags
To:     tglx@linutronix.de
Cc:     joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
        krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
        agross@kernel.org, David Brown <david.brown@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        jonathanh@nvidia.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Need me to make them a patch?

MBR,
Yangtao
