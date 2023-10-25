Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45A97D6C3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 14:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjJYMpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 08:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbjJYMpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 08:45:38 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C129C
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 05:45:35 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so83145091fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698237934; x=1698842734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hwbHxNJHKIYfg2V9fOMg3eCs72qgcfQnjq8FaDx1jw=;
        b=K7esk2lQBlWmBMhBDLYiBSS2MczKLeLq+HDpYsabyFfEwFcgzRSXzstS1nbH3dq+ZQ
         vZimVR7IWlHmKCxwLaRIYJhzoQgzqLTJndJ9Gbhm2h+DuhGANXueQhwEVS46m0rmDfvz
         Mkf43m3q8HQHi2vIunxat5DJcQGPLvZ7K0AFBy6brTdL6nPr8mjxi8ZnOcmMV1FzcHQp
         dMewcZ+vLDdmRADNhNxvG5kpD4L5PnEnZlGyL10ckoZjzZQIUtGyPMtYncHjZRRYULPt
         XzHnj9gILBbCRprmhZiypYAQJETL+gj1Y8l99xnOlnl8ke2ibxJ5E1uBDk95Y7tSIj/P
         CN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698237934; x=1698842734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hwbHxNJHKIYfg2V9fOMg3eCs72qgcfQnjq8FaDx1jw=;
        b=LsQFYp5JdX1TFtsshs8K3vJHvPreqdQhQdl7RbvFSKLNRV47qQfwIG8B3CMJkfFcgf
         P7soAX2LNrwGkrNqw8OgcQ/bRoThvQkspat2JGJoQjLozBt+9aVuvFb5Je0oUI9opeVR
         qW9mqAD2WlYNMW1/Pt9oamQ8gmQ7LCwuqNgQ5a/5w5xHYfHZeK5+kgz9QGH4s6N1+nac
         FuFnB7ZopnvN58wR6DMkQ9Gni19ENt3ZGn+sLEeAdBbLea0GdlNdZXhU52Trv15M1ZGx
         8WVpcyVh15Otu+Z0327foyjNUZHWLUGe8diqoOmuVPy/Wbdr7W8xRdDJa7cOJk/7ZmAV
         UdRw==
X-Gm-Message-State: AOJu0YxEtKX4tZEbnDWkBQqY9L+0oPNGO1hUvi2osgqv7XdbAC52CWsb
        VbZEL1FPKgcnCOcCZryn9CRiotiL9XYKfSlSkZs=
X-Google-Smtp-Source: AGHT+IGm4J06QL06svQANFyfaj+/EUWPdef+xMSV/kjvuIObpEBzlgVccGrT3eMK/MQ05YabvI6mnA==
X-Received: by 2002:a2e:9c44:0:b0:2c5:12c4:5ff with SMTP id t4-20020a2e9c44000000b002c512c405ffmr10140098ljj.17.1698237934113;
        Wed, 25 Oct 2023 05:45:34 -0700 (PDT)
Received: from [192.168.53.189] ([188.162.65.61])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e8e6d000000b002c4faf47378sm2419884ljk.28.2023.10.25.05.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 05:45:33 -0700 (PDT)
Message-ID: <65f841ba-5b70-4cbe-98e0-3d53e5b7944c@linaro.org>
Date:   Wed, 25 Oct 2023 15:45:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink: fix connector type to be
 DisplayPort
Content-Language: en-GB
To:     Simon Ser <contact@emersion.fr>, Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
 <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
 <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2023 15:29, Simon Ser wrote:
> On Wednesday, October 25th, 2023 at 14:22, Johan Hovold <johan@kernel.org> wrote:
> 
>> I was just going to post a patch fixing this after finally investigating
>> why the DisplayPort outputs on the X13s were annoyingly identified as
>> "Unknown20-1" and "Unknown20-2" instead of the expected "DP-1" and
>> "DP-2".
> 
> Note, ideally userspace should use drmModeGetConnectorTypeName() from
> libdrm to figure out the proper name for a connector type. That way we
> only need to update a single spot when adding a new connector type,
> instead of patching a whole bunch of programs.

X11 does its own thing. It further "renames" DP MST connectors. So on my 
laptop I end up with DP-1-1 in xrandr, but DP-3 in kernel.

-- 
With best wishes
Dmitry

