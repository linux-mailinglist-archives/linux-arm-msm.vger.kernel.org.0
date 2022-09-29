Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BA65EF445
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 13:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234751AbiI2L0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 07:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbiI2L0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 07:26:41 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0D614D4AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:26:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a2so1766279lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=UBoM6eFYHcslu8YxYh8RvKSXX13nROuAtmi4LZbiE1Q=;
        b=Lu2Fw470+2WgGb7ZTEkacwDPuCiQrHnKcLk/4e2Hdg8bx2IV5ZRJhcjYnYoNIJUbNi
         zEJ9+V9c8VZpFBnP7h78WS1s/2uSQLImxpIO61kZ4XEGMGYri7lwA9DDz64VHAwZ0L57
         i84dRqKLoKiTS5TbNAQ0rDrvNu2/KSlH3mxsZBHLWArgau0uID7LBldtqoG1COxOGp3E
         bksxz6Iy5TLNtUhwJ7yT9QPH8wfQYSIQJ+PGt76zP0N/hZt2jmx5aUv8MrhECzBaUPVJ
         AxJ/EpeyQWeWXVBl710nJktlA+ltvm9FWRqUw3XZde4NRXwPmxxy419a+u7+zkV/mWyf
         zkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=UBoM6eFYHcslu8YxYh8RvKSXX13nROuAtmi4LZbiE1Q=;
        b=Cxq4rTEt7C1d/YcSVu7ETIPHxdTJPznk78kZeezRedkEgfsjwsy2n4szPtKr6sccLF
         KY0YieISy7LbQpfvbeq64j7ZY0lq050PpU0ROagcTAbGirTyIyzRZa/r+k/8yzj3vV55
         tzk2XCWSjL4GwedhghhU9Zo4iQAG0sFBnqhk4PuP0NOe4LLy2LF0MC9rvkZrSUbiY+W4
         u9DNdPjwucf5HKopT7skY4C4S16EY2dVp4VDBAbAe+f/L8j+tqdaViCPwXq/Dr+2113L
         uI09yGOJumtaCvStsGqS1JBrOL53Re8JUyV4S8d23foRJh3FlwOOWGwOVPl7dsitPNb4
         gldg==
X-Gm-Message-State: ACrzQf2mwsPdlUTt/9tfNvv25YJqyIyrg6f2V+NRpZB13N5fLVSqMy8i
        pAY5vnJb+Cji3gFS+0klNK7o5Q==
X-Google-Smtp-Source: AMsMyM69smAlLPqsotJW+fMsrTQEJmWY40QqusdkIObADMryk1d9Gppci5X7v7Ogl16gY3CAM3SFhQ==
X-Received: by 2002:ac2:57c9:0:b0:49c:3e64:de95 with SMTP id k9-20020ac257c9000000b0049c3e64de95mr1182043lfo.452.1664450798778;
        Thu, 29 Sep 2022 04:26:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512068c00b004a01ec20a4bsm757130lfe.117.2022.09.29.04.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 04:26:38 -0700 (PDT)
Message-ID: <75bb4a68-f47d-1de1-a900-789e365be41e@linaro.org>
Date:   Thu, 29 Sep 2022 14:26:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-GB
To:     Robert Marko <robimarko@gmail.com>,
        Baruch Siach <baruch@tkos.co.il>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        Johan Hovold <johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: ipq8074 USB PHY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robert, Baruch,

We have been looking onto the QMP PHY programming in the upstream 
kernels. I noticed that the ipq8074_usb3phy_cfg uses usb3phy_regs_layout 
for the regs layout, however the Qualcomm's kernel ([1]) defines offsets 
which correspond to qmp_v3_usb3phy_regs_layout. As you seem to be 
working with this platform, could you please doublecheck which of 
layouts is correct? Thank you.

[1] 
https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/tree/arch/arm64/boot/dts/qcom/qcom-ipq807x-soc.dtsi?h=NHSS.QSDK.9.0.2&id=894e56082ca89638c68b7cee039ac1b2a6cb4863#n1237

-- 
With best wishes
Dmitry
