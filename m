Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B9A5EE132
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 18:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbiI1QE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 12:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbiI1QEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 12:04:24 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CAEE1091
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 09:04:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id t4so8810858wmj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=jOsTRd2EGmvuWFFBgTAM5J+8IORBIqNu02CFYL1/QhU=;
        b=v0TvX6YVV2oxrMyqkgUbiWYvHKF0YPUGRkJ2bA542N393ROnUqUkeVXPXYcOXN9Q5d
         Ih2KClNyGxsOooOLpsoar0Hd/tAxCxh1emLvrBTQPy1OVpaxD4mCBRUjV0YwBL1H8qwj
         ER131Zs02oFhe5tvDScL7Bs9Cp4toZCmgccOEq0piqSotTr6/nhdUmD87E5cIoQI1h3T
         GB72yZh2hG0N2542jtepsDcJW0Myy/rfTjMQrImP0Kmk0+OlnPZarLk6sU5HJ3E2o+Zd
         9mXADR1H3D926VZm6mkN2MhvI2vdnmOigHjATsjTNqh0Kxr5M0EYIP8hbAp74SxvKKb6
         oPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=jOsTRd2EGmvuWFFBgTAM5J+8IORBIqNu02CFYL1/QhU=;
        b=wXrtcWaxm8IaeUIPwDjeA0bMwDBxcpkoEFdAvdHO6EfOIVVWjEOHmnVG6elYEdYPxD
         1TfS8mSgIGIFr7VkHhjvEecyZBWRse2OWq9jqKAHLbKwfmdIskoicxn9ePJykJYNSY1V
         YosRWEoFL2l5myaJOSIz6ie44xqxj7GOaJ7k0iEIjibcYnf67oQecfVXr9wRj1GqahfF
         NLYOg6XOrzOfP7fBWE6vmEbwBldrbxh6+6bmYfyidJb+3XdM3nM6rjbzpVOkoyAU/bEH
         puSTO5tTBD+rxbmVKtMYvsd583jLmDzlcvH1mCAosY9154pgCRj0YkaUc3Z+9PTqIOjB
         R05Q==
X-Gm-Message-State: ACrzQf2eGEO0Y55YYIM3cATJKBz/C1zkwre1uL6wmchH5eF+O2wZMDMk
        9GTTIsodFGgxzI3Mue/ER1YmOA==
X-Google-Smtp-Source: AMsMyM6XQU0NnnQU3dpJA72oWAbDU14QkBvfmbQ7fZQHWskZ5b1vNFSYwmdhtQKNW7UN/B9vZCq6hg==
X-Received: by 2002:a1c:f002:0:b0:3b4:dda4:b58f with SMTP id a2-20020a1cf002000000b003b4dda4b58fmr7245404wmb.184.1664381058249;
        Wed, 28 Sep 2022 09:04:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id n16-20020adffe10000000b0022b014fb0b7sm4443398wrr.110.2022.09.28.09.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:04:17 -0700 (PDT)
Message-ID: <05603546-79df-c27d-7c39-57d6e5789cd6@linaro.org>
Date:   Wed, 28 Sep 2022 18:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/13] phy: qcom-qmp-combo: drop unused UFS reset
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220928152822.30687-1-johan+linaro@kernel.org>
 <20220928152822.30687-3-johan+linaro@kernel.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220928152822.30687-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 17:28, Johan Hovold wrote:
> Drop the unused UFS reset code which isn't used since the QMP driver
> split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 

<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
