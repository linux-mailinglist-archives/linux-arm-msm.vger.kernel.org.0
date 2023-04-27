Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8096F08D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 17:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243991AbjD0P4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244005AbjD0P4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 11:56:40 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C40A3A8D
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 08:56:38 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so1302223966b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682610996; x=1685202996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JggDLFBdIl/jSBDaH5DGvn2IeczOwVOprHaUhA+GdDk=;
        b=Jk3yvWCveAWhfNWMrAWwMn2KuWl/3qOYaI5epU7anJ79rrobA77wVhOiAXloDugYhc
         vXrro+lbFXyjZPW++3+wTYpjCf3AT5QBX/hDCmRGqoMmODoth+o3RZTTXk6NlFNn2fU3
         vn49NJnrWNIbgMp0I4KgqHh5HYYU3ZEipB+bBFAPa7Z7DMTksLlzOwLesPnOC77gqIob
         1BJbc4g12Tvk7suRUDGS8skj5B2kreAttIJ8OCz6WCIK/VPnUdZh3ITrSgT0BLex/0Vh
         Ie7KoD11Kj4X6SD5iHPXTulRnR4uQaUvNnaPXVLsrGunq+TGuM0RBMA02cXS1p2IYRXT
         MIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682610996; x=1685202996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JggDLFBdIl/jSBDaH5DGvn2IeczOwVOprHaUhA+GdDk=;
        b=SPciczgkSHOq7YMYxp2bHeGK7SY2SYOuezNCFjcOwjmReTUu3G7TjDPTdDHI+g/DIF
         mTqVuWvi8XZpZNLYiCTMUBz8u3pbz3Em6wl+ZipF8oDITA+FUxzLYR02HZCtCWs3vBdj
         FnD/7A4sv48kDB2iJ5DF6N+LpQT8Bj3STYc1+3QYPiawLkOfJqc6u58xiqQxCHbhCNnk
         bBHdVEMvrMnd8om7OQydyzdPyg4C3X9oI+eRVRasFB6EN6GnApoExP08z4JrHP2Y/Qgf
         G8S3AGIvK7L+TrTNMQMWrQTghHz73v38ROS4ePNDkAIGZ7rOgiGmNfEreO3nU6WCwhJi
         yjWg==
X-Gm-Message-State: AC+VfDzCHOt3Yqx1iRcTu36YHv7nyyGkfzU8KSDOr2WWZFBDNUIkrSaL
        ydq8/IV8n1hrEyn1/cXpnvEi8g==
X-Google-Smtp-Source: ACHHUZ4zMr62XOd0+V2I4HhOTLEq7wM6Up0uaIzneJyRKQ0+6VT+qdeHI8kthuaft10zFLjq3+dcUA==
X-Received: by 2002:a17:906:dc93:b0:94f:1ac0:850b with SMTP id cs19-20020a170906dc9300b0094f1ac0850bmr2523049ejc.71.1682610996504;
        Thu, 27 Apr 2023 08:56:36 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709062c0600b0094ef2003581sm9828030ejh.153.2023.04.27.08.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 08:56:36 -0700 (PDT)
Message-ID: <3e0b8680-4722-7e5a-a75b-acba1940aa1a@linaro.org>
Date:   Thu, 27 Apr 2023 18:56:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] drm/msm/dpu: remove DPU_DSPP_IGC handling in dspp
 flush
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-2-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230426192246.5517-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2023 22:22, Abhinav Kumar wrote:
> Inverse gamma correction blocks (IGC) are not used today so lets
> remove the usage of DPU_DSPP_IGC in the dspp flush to make it easier
> to remove IGC from the catalog.
> 
> We can add this back when IGC is properly supported in DPU with
> one of the standard DRM properties.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

