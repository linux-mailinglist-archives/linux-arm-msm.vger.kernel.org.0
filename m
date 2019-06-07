Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4973987A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 00:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbfFGWU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 18:20:26 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39680 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731147AbfFGWUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 18:20:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so3021327ljh.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQG5fZ3EhYRq8CYdObUVFyj6seF2R8nq3JkVzFb/lxA=;
        b=J8oCCPGNMQU5rDGmeyVTZPHkWL9+Vc3T20HBnIQsBN/psbfksQVafp9kuniapFnd9p
         ACZqYf29QTVDX3vNf/GeJ+C6SzG9RRzuaNdi7Odo6sI+fOHmjBlRCd8oN2ZfmoLK+yVW
         Z4ijFNknrQ679mE38Nn9tFfqwmhPjVcPgN3CEI1ODVHLd67dZWr89t/5PRBA/eaDKeNz
         imVCpLxet79CIeJKx/Lh38ZyzAatFK0W0vjcsPjXkCGoUOYqKW4hNg+KHhIE7ODa2w80
         vFgRB3icM0W8MLppUf36C40m++FpW5cdTrEZKh9qGz3T7b6fCuVUnjuxS/9bejthZ/14
         6Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQG5fZ3EhYRq8CYdObUVFyj6seF2R8nq3JkVzFb/lxA=;
        b=XiDTjRzYsTSBy2dZs/7VSeY0Z2fzAfcvAamx4fN13UMRfd5s4cq1kgDfTCH6x2CbXv
         FtxCvYm7FaG71RcFY2ZHyT8tQ6fIcd5+yWwC96kJN/xpaf7+RJsBfv3czqk7sMPzOao9
         ogr4onIcEtdga1STAtNbd3Rrh1g3tCM6Pn3ZTOkxiz3TmdaM0ka6TEUqM1JRi0lflpTn
         SHdAceQmT2SztWAwSRael+sXL7IS4vq6p0DsXTYHiBszSRuqIKDGp8jWGGZpJs5wbYzt
         VLEG570EYbQUePtuZRI5tI2MSTnZ/PwnltGN82ZYItCXV5NCUEmNjXbdr3o00QJo155K
         QKyg==
X-Gm-Message-State: APjAAAXQ6XDF+dGZazihJ7Sj1VMxFLQ+NMpVNZ+6NiBKDTl/tl3zmU26
        PVq1wTzti0zuSRXNOOxd7JEh6HigLYQO3xIRdUyjQg==
X-Google-Smtp-Source: APXvYqwtFn9ujhL1bNosuQYXIjXabGQeb/hX4swI0JpPVUh1sm9eQAptKaHUcU43LzWRCdPzHPmmw6b84I+/1LdT4jQ=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr5402543ljj.113.1559946020389;
 Fri, 07 Jun 2019 15:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190604072001.9288-1-bjorn.andersson@linaro.org> <20190604072001.9288-4-bjorn.andersson@linaro.org>
In-Reply-To: <20190604072001.9288-4-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:20:12 +0200
Message-ID: <CACRpkdZETzjw2hOz7y15sUFa+s2Ki3UaMh-Qcor4cEopZrf03Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-mtp: Specify UFS
 device-reset GPIO
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 4, 2019 at 9:20 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Specify the UFS device-reset gpio, so that the controller will issue a
> reset of the UFS device.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
