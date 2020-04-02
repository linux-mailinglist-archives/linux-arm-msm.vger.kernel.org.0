Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C1F19CAD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbgDBUPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:15:48 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:40002 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgDBUPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:15:47 -0400
Received: by mail-ua1-f67.google.com with SMTP id a10so1834430uad.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=msGUQVJku9LyJfG6SdcO2M9YOo532jnVn5mu5AdgG5w=;
        b=BjiJV3KtRqlmVSMawM+CqNHpoUrOgtBwK5VFs4XMeLmwOXb1GpsZNIfq69lrKDlvg+
         NbUxXEluca5cHHziGQIlaCpa2ZBtJT9Q5DOkwBbD6kNFvX+ortLEryXUdjOrMunBACvj
         F25sgO1iXEMdXmOo7CdjbevYpEvDlLYwJpfL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=msGUQVJku9LyJfG6SdcO2M9YOo532jnVn5mu5AdgG5w=;
        b=lgPfxZFex6R7xeWagDMxH5TrnMOYve7UX29xXJKePatz2g47775qY96GI9W73j2eme
         nLSdjVLe2bi4d+PTJMQXEGliWIJ5AxcSeK/SEr2BHt+EUsfATe6ikqnY6Gs5nK1i9/Wo
         sygV25MXR9SuhgkBqL/9WlogJ6qIt3cxUnJurpeODQRfWIeL2MmIvTIyzg5fW9bfm6nZ
         NBiBYaglnJ/Vxc1C2BHfM0GWrDRCXsbfc3rAOaKkPuf3rNOhFePbkvqnFjsVw7jrULaq
         ESQ9zVca5ATaMfvN/TyGbtVogV8hgeliFYg2XyCDbjKegElCBdB+4MnUJM0PDBsGMvnq
         Oq7w==
X-Gm-Message-State: AGi0PuatJKIWYB+QTtrlYkQL4WkXgBG6PJKNr4YzRYxxQqtwr5GqRkvD
        vj2JkVgumo2Y8BS+HGBbmsiFvMABlCI=
X-Google-Smtp-Source: APiQypKq6rxeKuWS485pNQMun482epsU+iEI1AHMVlc48O8QK0qGME1aPeN/Z5lneQsiNTmmGiEixA==
X-Received: by 2002:ab0:3ce:: with SMTP id 72mr3921839uau.126.1585858546489;
        Thu, 02 Apr 2020 13:15:46 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id c23sm1576748vsl.7.2020.04.02.13.15.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:15:45 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id x206so3429485vsx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:15:45 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr3977870vse.106.1585858544905;
 Thu, 02 Apr 2020 13:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid> <1fd57a5e-067c-5b2e-c9d5-5a1836e55273@codeaurora.org>
In-Reply-To: <1fd57a5e-067c-5b2e-c9d5-5a1836e55273@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:15:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfLsvFbhAb4iEnb4zj8U_LK7zzerAz-NH6R1TQNig_tw@mail.gmail.com>
Message-ID: <CAD=FV=XfLsvFbhAb4iEnb4zj8U_LK7zzerAz-NH6R1TQNig_tw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 02/10] drivers: qcom: rpmh-rsc: Document the
 register layout better
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 1, 2020 at 1:14 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > + * - The first TCS block is special in that it has registers to control
> > + *   interrupts (RSC_DRV_IRQ_XXX).  Space for these registers is reserved
> > + *   in all TCS blocks to make the math easier, but only the first one
> > + *   matters.
>
> First TCS block is not special, the RSC_DRV_IRQ_XXX registers are common
> for all

Ah.  I think I see it now.  It's much easier to talk about this with
my old struct definition.  Right now I have it documented as:

/* 0x2a0 = 672 bytes big (see RSC_DRV_TCS_OFFSET) */
struct tcs_hw {
  u32 irq_enable;
  u32 irq_status;
  u32 irq_clear;
  char opaque_00c[0x4];
  u32 cmd_wait_for_cmpl;
  u32 control;
  u32 status;
  u32 cmd_enable;
  char opaque_020[0x10];
  struct tcs_cmd_hw tcs_cmd_hw[MAX_CMDS_PER_TCS];
  char opaque_170[0x130];
};

...but you're saying that it's actually:

/* 0x2a0 = 672 bytes big (see RSC_DRV_TCS_OFFSET) */
struct tcs_hw {
  u32 cmd_wait_for_cmpl;
  u32 control;
  u32 status;
  u32 cmd_enable;
  char opaque_010[0x10];
  struct tcs_cmd_hw tcs_cmd_hw[MAX_CMDS_PER_TCS];
  char opaque_160[0x140];
};

So it's still 672 bytes big but the extra "opaque" at the end is where
those bytes go.  Then, before the first TCS, there's actually 0x10
bytes of IRQ stuff.  OK, I will adjust the diagrams.

-Doug
