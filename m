Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C298B1807DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 20:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgCJTUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 15:20:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42832 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgCJTUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 15:20:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id h8so6742363pgs.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cC2057sPqmPcpMKTkeB3a8bTjc/o1vrfqpJvHiGtnZU=;
        b=Gp/3+tK3D+e1w351TKt3AZhjG7ssptPYwoN75sKp8UNBt+HYPDOF0OuAmp/1t3HyEA
         TA3d6tn36/U+iKROF0bxiFHF8/ZMxBC44qGb9zVh9byUtO0ME4tgbJHE1hBMaBJBBi0R
         iKNszHZ7hKuuvpRvrZ1jghA+/1QDoDgVCerX7dS7fJm1hXCEdfXWd4sCU3WU7Ow8YN7I
         Us/anH7lZ0Nt+sSP+sgA8JTLVbaoPDek1O01K4AKCrAD0qCFrNRIMNLff21NmMXUgfdk
         PimTnrj3zfOlwtgqyY9waZRr2/3dzy0kJbLM547JpbxcxX4kZ6S7xeeSynQ6VoyHcsEp
         E2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cC2057sPqmPcpMKTkeB3a8bTjc/o1vrfqpJvHiGtnZU=;
        b=rdJ32pyKRvhhCzFz0j9otKC54FpXoZtajzIGygJGBf/fYHMk25OH1ymk6gZWjdB/nf
         bfmzpVnZ/Vz0AQ4h8UGToMoaRyVAAudHqw0Ve0MJk4TE7kaXwJyD22dBxvKh6XBmD9l4
         K4+qr7Kyyf96NONpD/ieRorIYxm7TXlTC1B9ZetckS59v3ZtbOXO8BpV0zPyIZU0GyWY
         1hTuP3nh1rL5TOKOZ2R+pnGXmQMMBZrsCNpDbWwxBWQ/kqPOslNZMp8RLK0Iyc0vPI/3
         vDKJXNXdepuejm2RG6XSfXWhq0GCy9LL+Wu9XTcV4rwUVwg89qaBz9ljEZJiY6WhKR+Z
         nR/g==
X-Gm-Message-State: ANhLgQ06b/q99sUxHmHKN1jVLyC/AhYtQGXa1EZ8YxZKfd5lGM/m+EaB
        cG+LoeXIPuDokvXE4T8+eQzuOA==
X-Google-Smtp-Source: ADFU+vtWP5ERLP9aV0fp1zqUyf9v1Asbb4leZXOT+JfMa00W8DwkmyxfINhtLJv8waJz4e7fOejrYg==
X-Received: by 2002:a63:6dc5:: with SMTP id i188mr21478581pgc.82.1583868030640;
        Tue, 10 Mar 2020 12:20:30 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o66sm35067793pfb.93.2020.03.10.12.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:20:30 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:20:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: qcom: Update PIL relocation info on
 load
Message-ID: <20200310192027.GJ264362@yoga>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
 <20200310063338.3344582-4-bjorn.andersson@linaro.org>
 <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Mar 11:10 PDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-03-09 23:33:36)
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> > index e953886b2eb7..d5cdff942535 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -164,10 +166,18 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
> >  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
> >  {
> >         struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> > +       int ret;
> > +
> > +       ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> > +                                   adsp->mem_region, adsp->mem_phys,
> > +                                   adsp->mem_size, &adsp->mem_reloc);
> > +       if (ret)
> > +               return ret;
> >  
> > -       return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> > -                            adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> > -                            &adsp->mem_reloc);
> > +       /* Failures only affect post mortem debugging, so ignore return value */
> > +       qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
> 
> If the return value was void then the comment wouldn't be necessary and
> it would be self documenting as such. Can we do that?

I started off with this in v1, but agreed with Mathieu to ignore the
failures in the place where we actually don't care, rather than inside
qcom_pil_info_store()...

Regards,
Bjorn
