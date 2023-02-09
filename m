Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADA468FC2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 01:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjBIAvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 19:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBIAvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 19:51:49 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF4B2D5A
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 16:51:46 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id eq11so721261edb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 16:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTGFhfzcYplQId+sbmms2QWBS43jFXQKPthbZZe6X0c=;
        b=GZHyVqwEzJyz7qRrp9C7MjtoKVomAa2ytxow43iOevqKxMSl8Hg2xum/e+osw4/5yW
         8She46s6t7lDb4s+/snLBWSOgL3fONS/8m3EgUcNk8Nyq5RvxEVwNaR4wO0azpzpkJVN
         7lJqUDlBHYqNVTwpKnI1jzTByPsevN9IRk904NTtvw+cp9h8toOSfn0/8SfQsPWtoCgN
         n9zc19kOEzSo7vsuDHW0Wfn06lejdryasSFEGtUR7c/JfZGiH5kp8xz7bGu00EcZ/hrb
         cbHN5JtGZm2JDQHMe3iHOHgELxVWlD/3pMZXcKKnPO6nINDpZnohxJ637q6qfgp1wipW
         bHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTGFhfzcYplQId+sbmms2QWBS43jFXQKPthbZZe6X0c=;
        b=NV5//BP6VFw4kjKIMt0ybLjkPkztyjMP6qNe+XPDJ81W+V/be3qHMYTcqY6L5lBJE1
         a2AUavl++9lcVESJcxN/ZcKgnS43x0WT9IhAnJ0LWhAoPJy3R674BWN2qz9it2rOwghv
         LU/fZFaHtnrg0o+n6R9DcJlsD7itvdZ7paA9ZzhDl42Tf6fgHiOab/AZ753gijKkknHf
         PxS7QwsP1PTU/rfr/0vahMj7+U7MGvdXDHfITZGXlEKOmpwNWcJicYI6/K0xywYeNetp
         q/n1BIesTU4DJxVUJ6XXm1IEhf37+N1IkF3PbLWaBBgs128hCg9xDbixOakd8IrD22sh
         y9fA==
X-Gm-Message-State: AO0yUKWPETrBoWqup2ZadunPY8z4se1jPO9RvVzgWiiQl3ZJW6JpqXfJ
        6gCMduFRtwYQnVkdGbz+/24Lbg==
X-Google-Smtp-Source: AK7set/AYewPqrv/AyFCWJyWludZh6t6QwAEpA5XnSN0PwRkf2CpT4mAeU/u7cT/dZGW9OwYtHOxDw==
X-Received: by 2002:a05:6402:4148:b0:4aa:a516:8ea5 with SMTP id x8-20020a056402414800b004aaa5168ea5mr6070634eda.10.1675903905143;
        Wed, 08 Feb 2023 16:51:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u13-20020a50d50d000000b0049e08f781e3sm74396edi.3.2023.02.08.16.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 16:51:44 -0800 (PST)
Message-ID: <9c9d0985-cbd3-ea28-cc4b-a4afc8ae22b6@linaro.org>
Date:   Thu, 9 Feb 2023 02:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 22/27] drm/msm/dpu: rework
 dpu_plane_sspp_atomic_update()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
 <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 02:22, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
> 
> sspp-dependent?

No, this is really pipe-dependent. It takes dpu_sw_pipe and 
dpu_sw_pipe_cfg arguments.

> 
>> separate function dpu_plane_sspp_update_pipe(). This is one of
>> preparational steps to add r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

