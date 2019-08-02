Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DB37EC7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 08:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732976AbfHBGNd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 02:13:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33842 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730060AbfHBGNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 02:13:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BFC296083C; Fri,  2 Aug 2019 06:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564726412;
        bh=glIM38y3+Njxa7zJSCHLYPzXsz9PiLzkjioQ1AjybJw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AIOHUpofaCW9WVIq9EhOhcWNcUniiiMBKXuSHR86Kj2XfOGZ20Ooch3LXAGmMGJVl
         0a9z2g5RvNzPjuT1/WfCcRpjpNLCAbW2UvPbYBAwzJPvYX2L6Sd+ui3Dpx+MCqrZVM
         +h9V6vCVVh556bpatTo0kQUz8P6jNr3LfGol4C+M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ECE75607B9;
        Fri,  2 Aug 2019 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564726412;
        bh=glIM38y3+Njxa7zJSCHLYPzXsz9PiLzkjioQ1AjybJw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AIOHUpofaCW9WVIq9EhOhcWNcUniiiMBKXuSHR86Kj2XfOGZ20Ooch3LXAGmMGJVl
         0a9z2g5RvNzPjuT1/WfCcRpjpNLCAbW2UvPbYBAwzJPvYX2L6Sd+ui3Dpx+MCqrZVM
         +h9V6vCVVh556bpatTo0kQUz8P6jNr3LfGol4C+M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ECE75607B9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f51.google.com with SMTP id w13so71361613eds.4;
        Thu, 01 Aug 2019 23:13:31 -0700 (PDT)
X-Gm-Message-State: APjAAAUM3ETOvffHwMGlYTYyLqTUc1Im5e/HUj0BGarW5tPJJNEB+QNh
        xZQehBsrcrlNlamE28bbGUYD00lvSAgiXHAff/I=
X-Google-Smtp-Source: APXvYqxJ5J+Kl4Ow20mbj1jqpkh4wO4uZDw1bBJ6e9VZGCKbz4hjX/5bF1KjrQmSZJSn0mG8VRG00kfvWhhfPHNpKsY=
X-Received: by 2002:aa7:d68e:: with SMTP id d14mr117447530edr.253.1564726410672;
 Thu, 01 Aug 2019 23:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
In-Reply-To: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Fri, 2 Aug 2019 11:43:19 +0530
X-Gmail-Original-Message-ID: <CAFp+6iE7224G4k8XE6Oz1S82iMgSza-n_zMN-ppOUWnuz+hFLQ@mail.gmail.com>
Message-ID: <CAFp+6iE7224G4k8XE6Oz1S82iMgSza-n_zMN-ppOUWnuz+hFLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] soc: qcom: llcc cleanups
To:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>, rishabhb@codeaurora.org,
        Evan Green <evgreen@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 18, 2019 at 6:33 PM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> To better support future versions of llcc, consolidating the
> driver to llcc-qcom driver file, and taking care of the dependencies.
> v1 series is availale at:
> https://lore.kernel.org/patchwork/patch/1099573/
>
> Changes since v1:
> Addressing Bjorn's comments -
>  * Not using llcc-plat as the platform driver rather using a single
>    driver file now - llcc-qcom.
>  * Removed SCT_ENTRY macro.
>  * Moved few structure definitions from include/linux path to llcc-qcom
>    driver as they are not exposed to other subsystems.

Hi Bjorn,

How does this cleanup look now? Let me know if there are any
improvements to make here.

Best Regards
Vivek
>
> Vivek Gautam (3):
>   soc: qcom: llcc cleanup to get rid of sdm845 specific driver file
>   soc: qcom: Rename llcc-slice to llcc-qcom
>   soc: qcom: Make llcc-qcom a generic driver
>
>  drivers/soc/qcom/Kconfig                       |  14 +--
>  drivers/soc/qcom/Makefile                      |   3 +-
>  drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} | 155 +++++++++++++++++++++++--
>  drivers/soc/qcom/llcc-sdm845.c                 | 100 ----------------
>  include/linux/soc/qcom/llcc-qcom.h             | 104 -----------------
>  5 files changed, 152 insertions(+), 224 deletions(-)
>  rename drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} (64%)
>  delete mode 100644 drivers/soc/qcom/llcc-sdm845.c
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
