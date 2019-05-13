Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0902E1B90D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 16:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730930AbfEMOt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 10:49:28 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37641 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730141AbfEMOt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 10:49:28 -0400
Received: by mail-qt1-f196.google.com with SMTP id o7so15039099qtp.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f57f9CrkLHcFePwjN3FU4Rm5r4Irtea70kxXmHOLUco=;
        b=eNRYCOI4Cpe7VbMGN3Mij1vUAro3bwftdHrWDAXGJjKa4FxsC20E1IR4yp7rfJaHgU
         NFr4NGb/l8gYtiWC5t8U/QmKwQkIJoFMioynbUv5GiZA2XPvw4SPpiFgyXeCpt8+F+lc
         HQb53Xpc7qcpSry382HT166WeDmlRPNZLhytbJcbIs6NClgbtS3OZrV7lu3f76a30aVC
         OuSheK4Wo5RMbkTM3Xcpizy9fWOQzk34+h9Olt6u+E1S1PgFoAsAyFjTn7laW+wDx3YT
         H+KU9HdNYmUU6r0NjsuV4y2SFvsKbLPSKNIV1VFTFzILwwtNfqsaKnQTy4Qm80iidvhk
         7Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f57f9CrkLHcFePwjN3FU4Rm5r4Irtea70kxXmHOLUco=;
        b=CObAMzoot4mlKBg7SuZt4Dj/Eq3frw0JirjY8mQodTInk4OlIFGNFihLO60WvBs8dQ
         3d7ccCVN5WAKTWAh31PgSczOSyX22Axht+UXMfjjQyI8jp+lXqSCR4/yZ0lUwoesSeDa
         eszILfhkhsCsYW8abh/MBEO0wpVjssptw2p7b9rZJDd/9en7mqXivBs6cuVVj067cL4a
         qG5M5jPiGz3Peu74Js0f8/DdRWrWVvfVaHeXCFMuLPEr4z98CWBBTidMI8GEvwZDaMN5
         rE7LcR2K+9rHT4D3xawF1QLveeozyjISywfeDcLShgaYhzuphOH9Dm/brPwnMD4vRcPU
         UUUQ==
X-Gm-Message-State: APjAAAXPNsfWTCwJjWOcajcqAN0fnbP2Zu7rSaOG82Vui67MYRb/Nw30
        d31vobSXgrhCD1kmw1n3+NtORw==
X-Google-Smtp-Source: APXvYqzkJCxySOotyEccUkLJnh8/L72NsFkDS7twtnhdQDc/s7sFH4Ei7ug85zyIi2vDurk31ZYd4Q==
X-Received: by 2002:ac8:33bc:: with SMTP id c57mr23963559qtb.252.1557758967170;
        Mon, 13 May 2019 07:49:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id g206sm6871504qkb.75.2019.05.13.07.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 07:49:26 -0700 (PDT)
Date:   Mon, 13 May 2019 10:49:26 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
Message-ID: <20190513144926.GQ17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-6-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 01:42:15PM -0700, Rob Clark wrote:
> From: Georgi Djakov <georgi.djakov@linaro.org>
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 97179bec8902..54d2b4c2b09f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -16,6 +16,7 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/interconnect.h>
>  #include <linux/of_irq.h>
>  
>  #include "msm_drv.h"
> @@ -1050,6 +1051,19 @@ static const struct component_ops mdp5_ops = {
>  
>  static int mdp5_dev_probe(struct platform_device *pdev)
>  {
> +	struct icc_path *path0 = of_icc_get(&pdev->dev, "port0");
> +	struct icc_path *path1 = of_icc_get(&pdev->dev, "port1");
> +	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator");
> +
> +	if (IS_ERR(path0))

Same comments here re: NULL value

> +		return PTR_ERR(path0);
> +	icc_set_bw(path0, 0, MBps_to_icc(6400));
> +
> +	if (!IS_ERR(path1))
> +		icc_set_bw(path1, 0, MBps_to_icc(6400));
> +	if (!IS_ERR(path_rot))
> +		icc_set_bw(path_rot, 0, MBps_to_icc(6400));
> +
>  	DBG("");
>  	return component_add(&pdev->dev, &mdp5_ops);
>  }
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
