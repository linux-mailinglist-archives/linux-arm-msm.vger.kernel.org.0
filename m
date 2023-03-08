Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC496B0C20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 16:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjCHPG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 10:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjCHPGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 10:06:19 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A668B8F27
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 07:06:17 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so1356582wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 07:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678287976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jlq6HsXBOX8/TTgRxtIwvmQ7gwNs0+Rlm9IvH1W6h4g=;
        b=C+h6+J+TldxZYIgHVT56E88ivFauvQ9OmlMo+xSyqd7IUawl9ltT7QwrDRaJzajwdl
         OVtYxvAdFWzuEAclRlYdv28i3of+wtuXxCQ4pD0n07iiAFIlk1/GNkn0c3I1IN1bRU+Z
         yiBs+1FbCDUqtDTWwtkWXFaPk1Ink4YTVXIg2DyEUV5lQ6kjGR2htBycYPSpxpJp+srL
         zC8GUrs0Np9ZCOAI2oLKbazECgqfjb57Z5bqvkWltouiFwsVhhomb8xdqGb+fkvn6470
         DXO/b4C3xYGkVKIsLP8p0EYVshW9mVjSw3rSBWu/aMMFSSj6f6y9ztTj1mWNd37tSt59
         ztBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jlq6HsXBOX8/TTgRxtIwvmQ7gwNs0+Rlm9IvH1W6h4g=;
        b=n3X/tQjb7QrnyndposZuAFIg5FBe0wKeu//f7AiH5sOfXBGeIfymsi0nTCnUgF9zBh
         5GEps+2iaNh0stD5ccxqhzgEnURNst3f4DkN7+YVe3qeWEBx1QtNtP0j9Xx8G5QeFFVU
         rvqr/M5FThh7r9EgvaXp3hKIiMoVBDQZsFItAmfqssJ1MAoHziFSRVWlt8EQR7JjweM9
         KbSjEajVqPyzpNYdSvUE0yOxxEUUS0X3ncJOO3YFGGZRuqiyMyYKGuf6+jiyKEmYguA/
         U454Aw59ioFdCrkJBDMQH1tugdV28FXhzGz9wRIoJt1Ux8t4/KCfSPHnmiNJoTlUaszw
         0eyg==
X-Gm-Message-State: AO0yUKWR945ql9O77+lWUlNV7FIPUn9FsOkzU+IpfkkplXetHcvfVF9n
        Ce8a9w8Lrg5I7Z97WPdTZlh1iqqNiK/JySHoWg4=
X-Google-Smtp-Source: AK7set+iIivd7dT32ja+ph0vH+bmv75rrrZhi++cEMgzO8Ydqk36ufMLcdlqbh65RDKDVa7uRXE6gg==
X-Received: by 2002:a05:600c:548b:b0:3eb:39e7:3607 with SMTP id iv11-20020a05600c548b00b003eb39e73607mr17343211wmb.4.1678287976049;
        Wed, 08 Mar 2023 07:06:16 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id b5-20020a05600c150500b003e91b9a92c9sm15855461wmg.24.2023.03.08.07.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 07:06:15 -0800 (PST)
Message-ID: <7908960d-da82-37d3-03af-8cab0c062221@linaro.org>
Date:   Wed, 8 Mar 2023 15:06:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] firmware: qcom_scm: Clear download bit during
 reboot
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1677664555-30191-1-git-send-email-quic_mojha@quicinc.com>
 <1677664555-30191-2-git-send-email-quic_mojha@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1677664555-30191-2-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 01/03/2023 09:55, Mukesh Ojha wrote:
> During normal restart of a system download bit should
> be cleared irrespective of whether download mode is
> set or not.
Looks like this is a fix, Fixes tag would help here.


--srini
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>   - No change
> 
>   drivers/firmware/qcom_scm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index cdbfe54..51eb853 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1418,8 +1418,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>   static void qcom_scm_shutdown(struct platform_device *pdev)
>   {
>   	/* Clean shutdown, disable download mode to allow normal restart */
> -	if (download_mode)
> -		qcom_scm_set_download_mode(false);
> +	qcom_scm_set_download_mode(false);
>   }
>   
>   static const struct of_device_id qcom_scm_dt_match[] = {
