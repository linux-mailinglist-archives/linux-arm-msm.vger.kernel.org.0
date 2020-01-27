Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6755C14AA8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 20:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgA0TeE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 14:34:04 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46469 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0TeD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 14:34:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id 13so7783374oij.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 11:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vi3znK4M/L38LjlEaKaHj2yaEFa3g1d9LhMbXW3eU04=;
        b=Q+ALqENAORH6FKmlwrvBXtKFn1lyKPj73FS7X5tQY9DQw//UMU2wZiC+udqXCXe1De
         19Kypdq+hd8o+Zpx2PkyKw+IUjM7G1Nr3fJq7fuID+lhlXknSduex+GsvYQCS9kyAMxq
         9gUesq7TDXXr2KAg2psuUIlAFooVnLNt29Y8ZlahIMbin+cIpKABUO/1tPDpeXKKYLrM
         wnKdlqZvKNbG6EbNUyySF5HEuCVj4biDxTZFlp/toxSShPfcs0ZZqa3f/RvdDgGgS8S/
         UnWf1VkUCDxWWZo+vpUGKF01oXt1xdMkmREHJloetd2V+7r792Dz+oSTMcUeQphw4T6i
         ucvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vi3znK4M/L38LjlEaKaHj2yaEFa3g1d9LhMbXW3eU04=;
        b=q4Ozcjtuxn1k7ShGrI0ee6QuP55EeJ0PwxojaaQxTYzu2fq+H77Z/MMxESaTXNJbhY
         1g05GFnSqeup1VBxjOgsqnNiPXznb9vKl2dm28hYUiObKHIIHW+ZqW2L5mYIoYPLW02E
         miUzvfoBkqA9bP2Ot3astGEjmLdQ8hcW9j2L1hzAUkoofXuOLQFDB0JFK3pLFyhHU12c
         /LrwobiwNk6e36WF45CrhSBgKkobcFIkPGZ+oBjiLcEGpA7R99SPrHqoyojbCitp3Fut
         Z/4Pk81Ai4LqcAWEMdG/JtNhnxHIZBy8IJLCqU5s8CGIijxKeyLjmADpvnwc2R7aSloG
         3jGQ==
X-Gm-Message-State: APjAAAVJpYaO5dRbfduBtJxlrxgsvjld9h1sn9u5eifFU6UrrpcD4PFC
        +bEQUBRRfnXndWKnrsuZfj7aWDuzx9tCc9fZpUkKR1IVSMY=
X-Google-Smtp-Source: APXvYqzpfueLXjE7Jm+XdTZZtc2Xor31Svv/xlpuCRvdcTCjbtaZGJl+v5b1dUGWdiURPpr0be3NTLeOcBjincf2jV8=
X-Received: by 2002:aca:5083:: with SMTP id e125mr475991oib.96.1580153643282;
 Mon, 27 Jan 2020 11:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20200106153711.1282414-1-robert.marko@sartura.hr> <85e05bdd-6f33-2f05-6c32-9892203da9e6@phrozen.org>
In-Reply-To: <85e05bdd-6f33-2f05-6c32-9892203da9e6@phrozen.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 27 Jan 2020 20:33:52 +0100
Message-ID: <CA+HBbNHBsxwTLTmk8Yk1tBPiQBxpNDrU3=+sXJw8HLjkS4QnzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     John Crispin <john@phrozen.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 27, 2020 at 10:43 AM John Crispin <john@phrozen.org> wrote:
>
> On 06/01/2020 16:37, Robert Marko wrote:
> > +#define PHY_CTRL0_ADDR       0x000
> > +#define PHY_CTRL1_ADDR       0x004
> > +#define PHY_CTRL2_ADDR       0x008
> > +#define PHY_CTRL3_ADDR       0x00C
> > +#define PHY_CTRL4_ADDR       0x010
> > +#define PHY_MISC_ADDR        0x024
> > +#define PHY_IPG_ADDR 0x030
> > +
> > +#define PHY_CTRL0_VAL        0xA4600015
> > +#define PHY_CTRL1_VAL        0x09500000
> > +#define PHY_CTRL2_VAL        0x00058180
> > +#define PHY_CTRL3_VAL        0x6DB6DCD6
> > +#define PHY_CTRL4_VAL        0x836DB6DB
> > +#define PHY_MISC_VAL 0x3803FB0C
> > +#define PHY_IPG_VAL  0x47323232
>
> looks like this was some cruft from silicon bringup days, current mass
> production silicon has these values as power-on defaults. please resend
> with the register writes and defines simply removed.
>         John
Done
