Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8646F54ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 11:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjECJkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 05:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjECJkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 05:40:02 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F454227
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 02:40:00 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3062d764455so2338030f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683106799; x=1685698799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBB9qpJkTYYA50YXDxfy8uIUZ0jceCXCGKDGT94/U+Q=;
        b=KHG/5BA2dCS08XF2BbibbxTkzVdJYPJQuS+rtOh5FXboVLlWx4sR1NBFceoE91NtVn
         4Uon1kA3Gnqs1XmVi5X1ud1zKhUqrX90z6/dulef2suJj1eT4Fp5Nwl1X2jd+KyBiI5x
         P/hE+N/mqs/hvNAnIITtDklTdEx8gl1S3ig0HL0734e2Xvjw6+y6RZIt+iUSNQySTsJI
         SLEq4UT5S3K6VpPPGt+gVMjK18cyiTfLG/yjcKtBjbJe27PPRlRPx+OJYSxcRmxg5vZw
         rmLGnwic9fbXFiJHWr4gAOwNESlpsG5LEAkWA6LcNusZmqqm8bQ531xvKTJrjXq0U77r
         r+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683106799; x=1685698799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBB9qpJkTYYA50YXDxfy8uIUZ0jceCXCGKDGT94/U+Q=;
        b=fPiuYEAOlFYs6o/FhtS2UJE7EyX58srEMvpZUSX6gXPCF71Df33ydJvxyqXYESiaFd
         mZJ4LporV280LwAD3mhHKP1tbh7sb/fpIvieCzxnhQRVxGnzV13KI58UxHO1SHz+e9ah
         R3nT/3hvZjNaGgNedkqP+w9YJ6TiNpKQhcri75/SnL0TA5NMkr7l3kJRtJqtxmEK1IQF
         9ipc3oJKmfdpBIacMLC8jxzwd4oT43qjCW+KlhbSju43JIOpNo6v3xFYeZv3VOL6ztmL
         zvTICvFSQF2qsF4FL5iy/Mb/ojnInnzixf7OW34the2JOKyYfWCwE54xDZ/AtNykAwYy
         QXFg==
X-Gm-Message-State: AC+VfDzbhhD0f5ivNd5uQzCm7HY48jCAgFY2pTQobnj9fD0q/SDzh0Lw
        QbnilVFB8ORDq17m32iVM8Pmnw==
X-Google-Smtp-Source: ACHHUZ5q2V2/d6gZ/eg9vR4Ebv5hh+UqaafIAXihyIs6HSzA/KAu8W0Vs2yb94nR7tXoGdrpnkZIAg==
X-Received: by 2002:adf:df06:0:b0:306:2f8e:d259 with SMTP id y6-20020adfdf06000000b003062f8ed259mr6585314wrl.57.1683106799062;
        Wed, 03 May 2023 02:39:59 -0700 (PDT)
Received: from [197.55.55.58] ([93.107.151.186])
        by smtp.gmail.com with ESMTPSA id p6-20020adfcc86000000b0030644bdefd8sm845361wrj.52.2023.05.03.02.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:39:58 -0700 (PDT)
Message-ID: <49006a56-cdd2-84f9-55f6-bd02f423b582@linaro.org>
Date:   Wed, 3 May 2023 10:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: camss: camss-video: Don't zero subdev format again
 after initialization
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230503075340.45755-1-y.oudjana@protonmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230503075340.45755-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 08:53, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> In an earlier commit, setting the which field of the subdev format struct
> in video_get_subdev_format was moved to a designated initializer that also
> zeroes all other fields. However, the memset call that was zeroing the
> fields earlier was left in place, causing the which field to be cleared
> after being set in the initializer.
> 
> Remove the memset call from video_get_subdev_format to avoid clearing the
> initialized which field.
> 
> Fixes: ecefa105cc44 ("media: Zero-initialize all structures passed to subdev pad operations")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 898f32177b12..8640db306026 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -353,7 +353,6 @@ static int video_get_subdev_format(struct camss_video *video,
>   	if (subdev == NULL)
>   		return -EPIPE;
>   
> -	memset(&fmt, 0, sizeof(fmt));
>   	fmt.pad = pad;
>   
>   	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
