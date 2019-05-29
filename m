Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52792DDBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 15:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfE2NI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 09:08:27 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41063 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfE2NI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 09:08:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id 136so2005903lfa.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2019 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/CpNHaur0JCUznHHnGtOPfrzDeuaNPXaSbiFGzeqYeo=;
        b=fiyYUhziklgcsU+tFUNEJYtehLkQLk60ClGKolnp8dHjqZza7Aay/Xi65RUu/nfuH1
         AzFkAM6/uUsN1bwEQl1oO1gz0JoYIZAFJZqSA+nKyUWBYiprdkuMVTx7c2e+Ogx4+TFR
         lGH4AvVI2HpBl3MVu7tZlEyc/5VSIRrwT0MWJG4ejvlWW8mklrYTJ7tivwXPOWYlcM5E
         rUXN7oJhvklu/0UH1Fg+c1cHNMJSeGNO+SPHM1yZdsEEYcyj2/rq9DipmF7S8Y/I5RvY
         jD7tK96MaYKx3Vd6wxzoydzb90hWQlLxghVTVtPVtBgn4+59fhLM9iFRYPs+tBdDziG9
         +oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/CpNHaur0JCUznHHnGtOPfrzDeuaNPXaSbiFGzeqYeo=;
        b=fxCMk5TRQYgEtlf4+hIeRqpyuZ0HCHUIES7gFJdH80PBJmVzTu/8aJYJji7X5reSQS
         39CnptuLutKaOGVqS+P99g8odDTlikefVDm3pFfYOMDJPk8sXRpdr8glDuWkVqRsjuwq
         K57aojp1+cJyZ+O1MIEEAIfKynsxzFWDjg7UXYWWzUEUuV1Y0Mn+PtSx8mPFeNCzGAJd
         5ux4QE6yVZGvNwclbh3/Enxp0gV/sipaOgkOahWRzBY4AQNpsXwfcqaswabC+6L9Nv62
         rIo3i1hA7LA5hkY6BtNqGMOQBKyGfS6a1LoF5FNTqRajc9N0KnPzJ0b3XNP/knmy0iAx
         j3Ng==
X-Gm-Message-State: APjAAAX+d1fKSByYxY5X/l9yTHOCc5CB2AA8s6jmQIVIZ70hAvx/JGJ1
        f47KwDPp3OLJrbFtvLJQ+5NltJcav04=
X-Google-Smtp-Source: APXvYqwvl2EHpoMtj25pladUH3GfBC88lN+uk0l+0ZSmJ5F03BcGdq9r7IrimydFom9RHbicWEsPaA==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr11156310lfq.136.1559135304341;
        Wed, 29 May 2019 06:08:24 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id z24sm3471962lfh.63.2019.05.29.06.08.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:08:23 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-6-robdclark@gmail.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <73ae9093-1348-b092-80f2-09c0d3d90975@linaro.org>
Date:   Wed, 29 May 2019 16:08:16 +0300
MIME-Version: 1.0
In-Reply-To: <20190508204219.31687-6-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/8/19 23:42, Rob Clark wrote:
> From: Georgi Djakov <georgi.djakov@linaro.org>
> 

Let's put some text in the commit message:

The interconnect API provides an interface for consumer drivers to express
their bandwidth needs in the SoC. This data is aggregated and the on-chip
interconnect hardware is configured to the most appropriate power/performance
profile.

Use the API to configure the interconnects and request bandwidth between DDR and
the display hardware (MDP port(s) and rotator downscaler).


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

It would be better change just the names to "mdp0-mem', "mdp1-mem",
"rotator-mem" for consistency and denote that the path target is the DDR memory.

> +
> +	if (IS_ERR(path0))
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
> 

Thanks,
Georgi
