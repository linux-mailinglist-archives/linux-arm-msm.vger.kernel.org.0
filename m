Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 911B714327E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 20:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgATThl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 14:37:41 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55147 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgATThk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 14:37:40 -0500
Received: by mail-pj1-f65.google.com with SMTP id kx11so194983pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 11:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eEohe15LrYCemHk+RTJdhMHALPxFtw8qsg/+LkzYqzo=;
        b=ktWPqZ98QRucKEmwK0py+sGi1qRZtgcc02ToW0l9YdIMF8US9Ygj9Xh96GM6saLrKW
         FokcgFfAyYfBI7NRVptnTxdLy6CDMR20bFbl/g0ub91yx77xU/lVFpYfwmGdD4yFy9MH
         9yT4fTjLZ5CZTxVcXlGqT7y3EmipBj2m4bog4baU7RBue1Bj4ZuvbBXV7UsSQOAettdm
         Q7x7k6w8kZoIt01aGa3YsYBDjbPLgnw92CNqTk7Fcu/WVOdtTM1l+QqJbnwQwqvs1v1Q
         5dxaedThf6A4DX5Sud8AlIkF1nT5H7d4fbvUM7UfHi5XG9mQ7AfRNhmWrePIX/635OlA
         or/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eEohe15LrYCemHk+RTJdhMHALPxFtw8qsg/+LkzYqzo=;
        b=fJYrdgtfGK6PTxLHz/+34vctSqSfBbsNtccZ8yp2q2sj+69+olWgV77PEKUEipeuM4
         5oZseZb913E1ivcgYqdwKe2ncVR6dj1isv+Is/rrgUee7bRHpgxcHDIliGEpkhS/yvyX
         0kli/UZPrU6nkbjuTbsvYtdeM99CaQRjMSsG+M7lala9mGyV+W7zn3ccM+RzKv/LdONS
         TWlnhnaYArpFkfKk96St1UDKxGLlblAdYcTpSV5LxNMA2Ul6vfgzUoYAGtZ53rFeg9Bz
         xy4ggnejuB27brM2/l+/tpkwJQTO1yY/iwzJy9AeLnDnFOfPKd9Mq5dIEhxJsxVR6M0m
         wzrg==
X-Gm-Message-State: APjAAAWb9jhNh/MWjtCqWfDWO4/3TR/IVXMyMRy/+whJfWCGJS7/nvUI
        AMnm848ykpoFoS7RoHn9hJUXyA==
X-Google-Smtp-Source: APXvYqxedxQL9ym9xRK3GITpV5H+oSrAfOtvrFG2ndhnAYK4Y1TwFWDl58H9DgBGw+BXErltfVbXHA==
X-Received: by 2002:a17:902:8a8d:: with SMTP id p13mr1300208plo.159.1579549060286;
        Mon, 20 Jan 2020 11:37:40 -0800 (PST)
Received: from yoga (wsip-184-181-24-67.sd.sd.cox.net. [184.181.24.67])
        by smtp.gmail.com with ESMTPSA id u12sm38658550pfm.165.2020.01.20.11.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 11:37:39 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:37:37 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     evgreen@chromium.org, p.zabel@pengutronix.de, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH 0/4] Improve general readability of MSS on SC7180
Message-ID: <20200120193737.GL1511@yoga>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Jan 05:51 PST 2020, Sibi Sankar wrote:

> This series aims to improve the general readability of the mss reset
> sequence on SC7180 SoCs. No functional change intended.
> 

Thanks Sibi, I picked up patch 2 and 3 for now.

Regards,
Bjorn

> Sibi Sankar (4):
>   remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
>   remoteproc: qcom: q6v5-mss: Improve readability across clk handling
>   remoteproc: qcom: q6v5-mss: Rename boot status timeout
>   remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 69 +++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 29 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
