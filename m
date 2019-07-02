Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065AA5C6EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 04:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfGBCFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 22:05:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46043 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfGBCFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 22:05:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so2381762pgp.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2019 19:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GkukRNl2S7AKUKXitorWgt7om1NyQvPM7opONDpmqPY=;
        b=rJeeRdylJOz5NeR9L9X3bJI26hQEjwb18eXhnGmp8pjy5+jWI9pgWlkOLZ0o2m/OcB
         jN7o/ya9MPvlixbTkl2XRXqWDEDWjl5Ds42PG/Wckv8t///EJpk3/tf+C/gjvbRyYh0Z
         P3GNpljXNtfh2WBb5+OAZb0iiSI3WkYz4nAiW/q1yTyZVg1J0eTC+wBe5Ew+ISOQJBHO
         BYn0s5IE9xb/QHxpgtYaPQ5h5M91ZJ2u9Czv+xkPupREJjpcIKlLrnLtmGsmgHo9qa4Q
         M338Ns28ORRgsjB9Lgvjaf3Jgxk+gdg58jTJijW3h8JSgi74heA7U/shs+EVocAri/mH
         d6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GkukRNl2S7AKUKXitorWgt7om1NyQvPM7opONDpmqPY=;
        b=eolMiPryVfXvCqyHJDzEEXTI99wQQ7XmxArc6sPEJVnILkd/iKCH3n8qVQxmustSTR
         yTlE+LKfxbw0h7tv+9hqkU1fIyFmaV2r7Qjs6G9myvoynpm0Bum/BFEJtEoagQ53vHcD
         wnJ4tHf07Tpm7bYnkpt66X0DADSr8EY87p+t3GbKntS+F8m5/TmCFnrfAeBssQ9CUf8W
         T9d6RBqszNmuyvlGHj625DTWdeuxTYn1P0tkYr9DZ8sz0NHJIOE7fA9hUohZPzXCfja9
         fT7KjHAczjn9cd4vyHA1oTco8G5ycliG7MRQfsQKYNEnxAfh47o2z5RStbk2SAHjG2HT
         Xj8g==
X-Gm-Message-State: APjAAAUcng/XVDlzcBOYeg0BOAnS49aFb1dbX9o04FazdUdMjr7V8MCt
        Mz4AjpRlfXBQte+8mveiO7JJsg==
X-Google-Smtp-Source: APXvYqyPgKu+jIUNPCSoiBBTNt4IHiwOHu/QQGgwn9U3xBo9NbJ70oCRf13HF+icPFpm5l4tunLnhg==
X-Received: by 2002:a65:6541:: with SMTP id a1mr27540440pgw.409.1562033102876;
        Mon, 01 Jul 2019 19:05:02 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u23sm12678065pfn.140.2019.07.01.19.05.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 19:05:02 -0700 (PDT)
Date:   Mon, 1 Jul 2019 19:04:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: mdt_loader: Support loading non-split
 firmware
Message-ID: <20190702020459.GF1263@builder>
References: <20190622012146.19719-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190622012146.19719-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 Jun 18:21 PDT 2019, Bjorn Andersson wrote:

> Typically the firmware files for the various remoteprocs is split in a number
> of files. But in some releases these files are available in their unsplit form.
> 
> Extend the mdt loader to detect the unsplit firmware and load it transparently.
> 
> Also expose the function that compose the metadata header for validation and
> use this from the modem remoteproc driver, so that it can support unsplit files
> as well.
> 

Applied the two patches. Thanks Andy & Jeff.

Regards,
Bjorn

> Bjorn Andersson (2):
>   soc: qcom: mdt_loader: Support loading non-split images
>   remoteproc: qcom: q6v5-mss: Support loading non-split images
> 
>  drivers/remoteproc/qcom_q6v5_mss.c  | 33 ++++++++---
>  drivers/soc/qcom/mdt_loader.c       | 88 ++++++++++++++++++++++++++++-
>  include/linux/soc/qcom/mdt_loader.h |  2 +
>  3 files changed, 112 insertions(+), 11 deletions(-)
> 
> -- 
> 2.18.0
> 
