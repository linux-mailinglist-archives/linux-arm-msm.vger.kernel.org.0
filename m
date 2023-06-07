Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FF572637C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 16:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241243AbjFGO5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 10:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241244AbjFGO45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 10:56:57 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4421FEB
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 07:56:43 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b04706c85fso69281455ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149803; x=1688741803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8N0gSaOfJ2+iPgCykIKtJEIBruFOuP2BSekoV+jGac=;
        b=XPoPdqNAA+maAKafsTiOfSoXt9pZvdj8FOvrnFoztfJuU2HX4+F6LJO8TFgm+5rePd
         1IXyh0M5zvR71jJUBXxsXeeqrPuGjPDajCHZMFjbJZr17bFPrkxNGTRrx+UYgk7ulG+D
         8TN63BR5vE9yhwTXiHoth+AIOD2G8v5pX84Wz/B/c7VOEET22YzTwCVWbav4gyGQ0qEU
         EwnZ6p1qNa+5Ms7vtTUge4c1/UYnRn9brjQJDeri5DZ+SbT2ZEpWPov5EwudTzJEfGiW
         Fpb4k0KBzZ0yMJxqjvBXdQTxmTkCyedR7GJ0sG5NKprINyRH0cMzEk7MSE17IIPLYnpX
         6BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149803; x=1688741803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8N0gSaOfJ2+iPgCykIKtJEIBruFOuP2BSekoV+jGac=;
        b=K57nkzGCX3AkP9RL86jFDM/ew9/2qLjwaBcJWJh8nG/Cw8hErGYXsBd+g7hE/6ssqX
         oIusM+nYBsFatHcpxCVzkzmLphqM9fgPaMDubUWTp+O/w4FVhXJVeyjirB9duqhhpt3Y
         pjFNXkKkuhRqrkyZ0Muvr+33jds8B2Rz75BZk9LM37qfUCd/NIBNBs7GKkNp3iRQT8ac
         JOJunU8eKbPwQFqNLfCc6toJj8AIVFG5rAmRiotODFYP5K2SwlJt5BCLBoZ/DkdeYGVq
         735zLfK+hoAZbk+OO9M6udFOHZmiB+RJILSUFLnbQV8HUVYC6ZiHptLcd4SbUHyoWRch
         8XQw==
X-Gm-Message-State: AC+VfDx1BjVNmX7ifKAGrf1pVSPNiXr5ZdeS8IAQHc1LHVlmJbl1nfzK
        wfWwn9HCb4QT7wEKQU9Lq5XFDKYj78F280HQYw==
X-Google-Smtp-Source: ACHHUZ5V+hBDwNNGVzLSvr6qyetGCLP1NSULs5tOPW6A/VkRv4ZISCL9y8DAAbyQrdYbu/FxS10I9g==
X-Received: by 2002:a17:902:ced0:b0:1b0:7739:657c with SMTP id d16-20020a170902ced000b001b07739657cmr6692548plg.55.1686149802732;
        Wed, 07 Jun 2023 07:56:42 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001ab1d23bf5dsm10543852plf.258.2023.06.07.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:56:42 -0700 (PDT)
Date:   Wed, 7 Jun 2023 20:26:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 3/3] net: mhi: Increase the default MTU from 16K to 32K
Message-ID: <20230607145637.GA103098@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <20230606123119.57499-4-manivannan.sadhasivam@linaro.org>
 <b8a25a70-8781-8b82-96d8-bc1ecf2d5468@quicinc.com>
 <20230607065809.GB5025@thinkpad>
 <f96d4956-6b69-4809-9461-9157e32b3865@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f96d4956-6b69-4809-9461-9157e32b3865@lunn.ch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 07, 2023 at 02:25:50PM +0200, Andrew Lunn wrote:
> On Wed, Jun 07, 2023 at 12:28:09PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jun 06, 2023 at 07:50:23AM -0600, Jeffrey Hugo wrote:
> > > On 6/6/2023 6:31 AM, Manivannan Sadhasivam wrote:
> > > > Most of the Qualcomm endpoint devices are supporting 32K MTU for the
> > > > UL (Uplink) and DL (Downlink) channels. So let's use the same value
> > > > in the MHI NET driver also. This gives almost 2x increase in the throughput
> > > > for the UL channel.
> 
> You say here 'Most'. What happens on those which do not support 32K?
> Do the packets get dropped and it turns into a black hole?
> 

Yeah, and the host has to retransmit. But I checked again with Qcom on the MTU
size and got a different answer that forced me to change "most" to "few". So
this patch is not needed for now. I'll drop it.

- Mani

>    Andrew
> 

-- 
மணிவண்ணன் சதாசிவம்
