Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6F25E6A52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiIVSFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiIVSEm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:04:42 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC561075B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:03:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i26so15933136lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IKFX2PMEfz2vf6aqIVh0l0NaL+tVIPErD6UiWDYhfQI=;
        b=YGNw3dPGi16qwvxznOjw0IrqWfsjy1NZEP6PQlj62gENwYwNmX6k8ty9hEBqhdoLZP
         DeM5FX4pWFO4k4PtxtZRl1yNbftunq5cZDsJOoIBQ0yIZbQXnKfSn6rgO6RhKWuwyUZP
         OMfF5seRAlXJM2x7Y4gHKxZjiRvM/ePZbnf6SrhCz5VxvdN2Pc2t33rDNkkfTljoEXUr
         NuS+bzGbp4xGpq/4aPJVObOhS5ToETtWpCtYJoBRlJVtvXDboWC9tdcQu+qchAQww4Rv
         97XLxLAPspzmyl+5Sv83vADWKLfC8GR+mE3b/j/rFLcmWosKHn+AlTqr3Nxvw5G5RXxN
         sWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IKFX2PMEfz2vf6aqIVh0l0NaL+tVIPErD6UiWDYhfQI=;
        b=VRu/mXPYiKhLW2icWJOkGu37wg7fMLqBD+YuzEvbUYdh1mkHVWStbnav6vObf4CI4p
         3thbrpqgWCZ20w6WnluZ7hiOCFiA95X0x77QG4XLIqt78o+yksrctUTKCeLbBW+ZPjwR
         yrk103BXEkXps/UkFk/WNvuBTwIQ+VtjOY2wLJpyLVCdzNHrWj5S9qMHf+svHoOR6/xv
         wiknzLvSn7f+SQ26uVecMHpknNnTg4EmRJ8hfWz2EVmM6pmeansZu5oS0FwS6gHDW52n
         fgkMpqDXKQHyc3GrH5fBDHFre9MA8PirfPkUve5MbX91IJ7MssEXCibaEmgewwflXE1y
         LmmA==
X-Gm-Message-State: ACrzQf38P87dooY5P3RQ/lzJ5fxlWhicCT5tyRPx+y9uIXMsZavppBfj
        CAvHW3zs7jYoULoNMwATdaiKKQ==
X-Google-Smtp-Source: AMsMyM60gG3YpynvPRcgnNPMdkMfZ4LHP4AyKrypAsz+iZT7vIWuTT7U4ikYf2gL78Gj2tdsaJb7TQ==
X-Received: by 2002:a05:6512:39d1:b0:49f:6084:4414 with SMTP id k17-20020a05651239d100b0049f60844414mr1858917lfu.195.1663869828101;
        Thu, 22 Sep 2022 11:03:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x13-20020a056512078d00b00496693860dcsm1036322lfr.232.2022.09.22.11.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:03:47 -0700 (PDT)
Message-ID: <bd519fd5-62ec-fe11-96a2-40c402d7f04a@linaro.org>
Date:   Thu, 22 Sep 2022 21:03:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/7] phy: qcom-qmp-pcie: Use dev_err_probe() to simplify
 code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-4-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-4-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 14:12, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

