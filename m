Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EB0BF875
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 19:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbfIZR5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 13:57:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45166 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbfIZR5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 13:57:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id u12so1349241pls.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=ra0dRLmfBUCQGsQcf5szx3nA8oNPLH7wPDml/wV7DqY=;
        b=ITWCWJ6tqqC/ZM6OD9WMIZrbkglthcrix2GG/LvDieJySeSgiWaMpmSOK0xrK0xm06
         ec/m3uHU3SiUEhT7eLUdfGbI+DN0LGfNi7tQZLu57ErbujONFpP5E7CgaHBIpk9LHwI2
         kE3YEzpDK7fVmwCp2OioRnV1nH8yPX5cDgrl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=ra0dRLmfBUCQGsQcf5szx3nA8oNPLH7wPDml/wV7DqY=;
        b=nAzlgErcMpW/tLgiFkO+h65DwcsLZKBvDHo2EaU9ncEkTU+EV8/jT8sewmdjKYRAr0
         449k3IEH9qVAsUIMKa0URmPlfhDt+cLqCgvYKSWec8DhU6TgkP5P4pv06U8LfHA3U2cJ
         htCDQ0WAgjMdQU118yii5zl1NjSrP65elBgD7UxZ0lwSm/zc5teZtq2QFv3JeQmQgA1A
         08zTHXZOMlXp3Lf8SiHDPkeGEVOp5PAD/qSupqwzqar35swtUEQP2Nz1aRZPwCcPzEWt
         Qv9/pQQNrgjZn205ysUahTWNvktNBHUq8AOMIIt2xyazPckyAUoZhZgBC9OkKNRq0c6l
         XgbQ==
X-Gm-Message-State: APjAAAW0LjWPLWc95Qp/Lplxm+QFFB+z/2U3f9h6GtFhCdUoRbaXoV8G
        3axO2S5L16jP9aIc0SB7iW/LHg==
X-Google-Smtp-Source: APXvYqyTHTzIf5yWzfKy0xKUYeZGydmLqbbwvrZWLYFx88GbwFOpdeI3cVq+oqoSkggF2QPJ0+vifA==
X-Received: by 2002:a17:902:7605:: with SMTP id k5mr5346435pll.304.1569520659918;
        Thu, 26 Sep 2019 10:57:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n66sm5128141pfn.90.2019.09.26.10.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:57:39 -0700 (PDT)
Message-ID: <5d8cfc13.1c69fb81.73236.ab28@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOCk7NoNX7+fxCYNOCMVCv1_-X3ZbaHwFjzWjMp6VKL6ZoroLA@mail.gmail.com>
References: <20190912091019.5334-1-srinivas.kandagatla@linaro.org> <5d7fe5d1.1c69fb81.eca3b.1121@mx.google.com> <CAOCk7NoNX7+fxCYNOCMVCv1_-X3ZbaHwFjzWjMp6VKL6ZoroLA@mail.gmail.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] soc: qcom: socinfo: add missing soc_id sysfs entry
User-Agent: alot/0.8.1
Date:   Thu, 26 Sep 2019 10:57:38 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-09-24 20:54:41)
> On Mon, Sep 16, 2019 at 3:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Srinivas Kandagatla (2019-09-12 02:10:19)
> > > looks like SoC ID is not exported to sysfs for some reason.
> > > This patch adds it!
> > >
> > > This is mostly used by userspace libraries like SNPE.
> >
> > What is SNPE?
>=20
> Snapdragon Neural Processing Engine.  Pronounced "snap-e".  Its
> basically the framework someone goes through to run a neural network
> on a Qualcomm mobile SoC.  SNPE can utilize various hardware resources
> such as the applications CPU, GPU, and dedicated compute resources
> such as a NSP, if available.  Its been around for over a year, and
> much more information can be found by just doing a simple search since
> SNPE is pretty much a unique search term currently.

I wouldn't mind if it was still spelled out instead of just as an
acronym. Who knows, a few years from now it may not be a unique acronym
and then taking the extra few seconds to write it out once would have
saved future effort.

