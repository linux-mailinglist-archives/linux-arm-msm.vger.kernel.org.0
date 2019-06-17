Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31BBD486CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbfFQPRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:17:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33914 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbfFQPRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:17:32 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so22102463iot.1;
        Mon, 17 Jun 2019 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+wD3SVXZ3PrXa1HtjvCKKY1g2uXLotDdh/IZjbwZD4=;
        b=XW0NKdf8HYq8QBc4Mxuma9s8F0Gia3HEyU125mLUA7j/kI9hW+ksgPSsrEAbd0r2JU
         rAIP4ROAGs+4Mft6ygNPQmeunP+4KdhfWgNzmdSIiWlD99x6hcDUcitu2sVS229onCY3
         Vb04HaUnieL1TmikiqpAkjJRRNjvY3JzJ9tpNYF8l6CNZYsj9ikncEZihBy4ONe/RFnd
         Itu9TtwwXfkFNRIOnpgbeJl8qJ11JmreOrGU0kTkL6im2jAJUGaXLgD5rCMrjIfJa0h+
         K+u49csTAsCMIpv0GBJJU/z+ygok9Q5T62cq4TKiIPTu8bo+RgL6kvt9WJHiXsIXuUTH
         FbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+wD3SVXZ3PrXa1HtjvCKKY1g2uXLotDdh/IZjbwZD4=;
        b=aVLzkshRYxJisro94B2XXCGi1TqRuqq8gU++ketjNrkAQFtQUsdnfh1vuf9IWAZ2sm
         yt5SMoDyzDOpG9xsUFGyLC4+qeuA6mkyeVIZ/5E6wcGeNfzGHTu3k4jdCb+bf4c9WxZX
         CMSbI+RsFBSQ0HLup1HYBNNu/L3+GYV+dj+g29stZnavo+Has4UaBVz4Bd/ES4urahOu
         /q3oManMH8JqL3pza4mT00MdGtheYvNyXS+9JZhp/R3rd8hQWlrNEi/6l50oxh0vcIO0
         TY7PNng5DnCGqKyK6EFIV5GKryaFoQyYKk8yxb70vIwsincxgxepgUbKJhMtiRQLxVkK
         8B4Q==
X-Gm-Message-State: APjAAAU/KFkDeKrPY5IUKv8grkxY4779iFv5iqUCj6TYz+rSEuvK7xXf
        gN/bh39VO2bZvXc+ho0DfTPBj/7XH8bsIGYdnpXE6hWF
X-Google-Smtp-Source: APXvYqzHko/RHOucNVkRDhgeF7jxqsQrYHP/teYkSGuN2gCpAyHtQ4kD7zLzznSbAeTHSrrBWQClAN66pqYh6uIt6ZA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr228382ioi.42.1560784651888;
 Mon, 17 Jun 2019 08:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com> <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk>
In-Reply-To: <20190617150502.GU5316@sirena.org.uk>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 17 Jun 2019 09:17:21 -0600
Message-ID: <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 9:05 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jun 13, 2019 at 02:25:53PM -0700, Jeffrey Hugo wrote:
>
> > +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> > +                                           unsigned selector)
> > +{
> > +     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > +     u8 buf[2];
> > +     int mV;
> > +
> > +     mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
> > +
> > +     buf[0] = mV & 0xff;
> > +     buf[1] = mV >> 8;
> > +     return spmi_vreg_write(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> > +}
>
> This could just be a set_voltage_sel(), no need for it to be a
> set_voltage() operation....

This is a set_voltage_sel() in spmi_ftsmps426_ops.  Is the issue because this
function is "spmi_regulator_ftsmps426_set_voltage" and not
"spmi_regulator_ftsmps426_set_voltage_sel"?

>
> > +static int spmi_regulator_ftsmps426_get_voltage(struct regulator_dev *rdev)
> > +{
> > +     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > +     u8 buf[2];
> > +
> > +     spmi_vreg_read(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> > +
> > +     return (((unsigned int)buf[1] << 8) | (unsigned int)buf[0]) * 1000;
> > +}
>
> ...or if the conversion is this trivial why do the list_voltage() lookup
> above?

We already have code in the driver to convert a selector to the
voltage.  Why duplicate
that inline in spmi_regulator_ftsmps426_set_voltage?

>
> > +spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
> > +{
> > +     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > +     u8 mask = SPMI_FTSMPS426_MODE_MASK;
> > +     u8 val;
> > +
> > +     switch (mode) {
> > +     case REGULATOR_MODE_NORMAL:
> > +             val = SPMI_FTSMPS426_MODE_HPM_MASK;
> > +             break;
> > +     case REGULATOR_MODE_FAST:
> > +             val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> > +             break;
> > +     default:
> > +             val = SPMI_FTSMPS426_MODE_LPM_MASK;
> > +             break;
> > +     }
>
> This should validate, it shouldn't just translate invalid values into
> valid ones.

Validate what?  The other defines are REGULATOR_MODE_IDLE
and REGULATOR_MODE_STANDBY which correspond to the LPM
mode.  Or are you suggesting that regulator framework is going to pass
REGULATOR_MODE_INVALID to this operation?
