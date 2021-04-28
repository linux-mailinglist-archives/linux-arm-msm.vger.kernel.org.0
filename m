Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13CC36DF68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 21:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243784AbhD1TPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 15:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhD1TPT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 15:15:19 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980E1C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 12:14:34 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id l1so7695813qtr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JrycBHB1um8MDSuQEK5PPEbJK2y8FfNFe4+Ui3dTQdk=;
        b=Qs5hvFuub+5HA95N0AoElYf6H1hgynMyACunurXvIAgxfd9T1/+CbZaL0Yl9WiVxPf
         bP2flksL1hjxEBHYIIN4ex4DxRAIWSn+wmrmkd7L2NBwIiUyNEaDjrdtcSvE1i4Tmqvf
         VgUpUfgEBbr49dqVvGx4bv1fY14WqjeflUxVUCSdcyEEBQqSccuDAUMbE59NrqtDYJxu
         FJ90RLicrjZaqSz0siWWGHeEnqaO1yWplsKDOkFTfDoYT87czsd7cN4vbyv8vT6v3PGA
         deir16bSGRrYkbcOLamfwKcZXrjRLkyVr/U0iUJ15PrJYvIF9XRM0bMOpaElMQwD0EUE
         H8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JrycBHB1um8MDSuQEK5PPEbJK2y8FfNFe4+Ui3dTQdk=;
        b=S+P3rig0jN1C1fl6Qr3qq1XQHdcUfz13R0kQJFw2ln9oiOIspnUYvAwS+wqDrtRPAu
         QTbCUQ9cG/QUb2GiJmIr1snmYg3PqWF8jsPUReAqZuKy05nEXh2E3zpyswOTpfFmGf4G
         L+xUNkdnpyS1vJZo4jUuObWGhAhznMWLPU+B+BeI/txtfpJsS46i4o0hN1eWmOxo+ENQ
         QSsviuzNmUtXXsGSmXibngEH1vwpEI165uN2JqfeCCGPF2Hx6GKxZKC67N7okOgkgzlF
         W/IzsJZA30CVlgYSCmSlYSFqSMtR0AP4l8KLXi1gOedgsQEltGtf+ayoaNIiDKOM290u
         8gbQ==
X-Gm-Message-State: AOAM533QWajfuPERCBPcZ6SIkFn59UcgRSOFERs83mOqsGpHcYhaAnlf
        bZjfC3uSSCpeRQwPM22we3Xn4w==
X-Google-Smtp-Source: ABdhPJyh6Kgbm8KDj06o8m/ctOUNAha2Wad7rbB8jFuRyMRS2DZu72SbQfmhu89rszpYUUUuyTZr9Q==
X-Received: by 2002:ac8:7604:: with SMTP id t4mr28844082qtq.20.1619637273784;
        Wed, 28 Apr 2021 12:14:33 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id n11sm506112qkn.33.2021.04.28.12.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 12:14:33 -0700 (PDT)
Subject: Re: [thermal-next PATCH 2/2] thermal: qcom: tsens: simplify debugfs
 init function
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210419012930.7727-1-ansuelsmth@gmail.com>
 <20210419012930.7727-2-ansuelsmth@gmail.com>
 <8e679407-07e7-244a-48fa-0d4d451d744d@linaro.org>
 <YImuFixa0iWtsU3k@Ansuel-xps.localdomain>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <fe7dff6b-0079-7fba-4982-a3422add83b5@linaro.org>
Date:   Wed, 28 Apr 2021 15:14:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YImuFixa0iWtsU3k@Ansuel-xps.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/28/21 2:48 PM, Ansuel Smith wrote:
> On Wed, Apr 28, 2021 at 12:47:30PM -0400, Thara Gopinath wrote:
>> Hi,
>>
>> Please include a cover letter next time describing the patch series.
>>
> 
> Yes sorry, I tought that for a small series (2 patch) it wasn't needed.
> 
>> On 4/18/21 9:29 PM, Ansuel Smith wrote:
>>> Simplify debugfs init function.
>>> - Drop useless variables
>>> - Add check for existing dev directory.
>>> - Fix wrong version in dbg_version_show (with version 0.0.0, 0.1.0 was
>>>     incorrectly reported)
>>>
>>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>>> ---
>>>    drivers/thermal/qcom/tsens.c | 16 +++++++---------
>>>    1 file changed, 7 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
>>> index f9d50a67e..b086d1496 100644
>>> --- a/drivers/thermal/qcom/tsens.c
>>> +++ b/drivers/thermal/qcom/tsens.c
>>> @@ -692,7 +692,7 @@ static int dbg_version_show(struct seq_file *s, void *data)
>>>    			return ret;
>>>    		seq_printf(s, "%d.%d.%d\n", maj_ver, min_ver, step_ver);
>>>    	} else {
>>> -		seq_puts(s, "0.1.0\n");
>>> +		seq_printf(s, "0.%d.0\n", priv->feat->ver_major);
>>>    	}
>>>    	return 0;
>>> @@ -704,21 +704,19 @@ DEFINE_SHOW_ATTRIBUTE(dbg_sensors);
>>>    static void tsens_debug_init(struct platform_device *pdev)
>>>    {
>>>    	struct tsens_priv *priv = platform_get_drvdata(pdev);
>>> -	struct dentry *root, *file;
>>> -	root = debugfs_lookup("tsens", NULL);
>>> -	if (!root)
>>> +	priv->debug_root = debugfs_lookup("tsens", NULL);
>>> +	if (!priv->debug_root)
>>>    		priv->debug_root = debugfs_create_dir("tsens", NULL);
>>> -	else
>>> -		priv->debug_root = root;
>>> -	file = debugfs_lookup("version", priv->debug_root);
>>> -	if (!file)
>>> +	if (!debugfs_lookup("version", priv->debug_root))
>>>    		debugfs_create_file("version", 0444, priv->debug_root,
>>>    				    pdev, &dbg_version_fops);
>>>    	/* A directory for each instance of the TSENS IP */
>>> -	priv->debug = debugfs_create_dir(dev_name(&pdev->dev), priv->debug_root);
>>
>> Unconditionally creating priv->debug here is correct. The below if
>> (!priv->debug) will never be true because as per your patch 1, we call
>> tsens_debug_init once per instance of tsens.
>>
> 
> You are right, will send a v2 if everything else is good. What do you
> think?

I have not tested this yet. The clean up itself looks okay to me.
My question is have you tried this with 8960 tsens ? That is the only 
version of tsens that does not use init_common and hence looks to me 
that a debug interface is not created. I don't think this should be a 
problem though. So if you can fix the above, it is a go ahead from me.



-- 
Warm Regards
Thara
