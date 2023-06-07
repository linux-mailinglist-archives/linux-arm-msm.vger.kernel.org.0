Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07DE7254FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 09:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238579AbjFGHDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 03:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235337AbjFGHDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 03:03:21 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAE4138
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 00:03:19 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-33e5054ba6fso665195ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121399; x=1688713399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0a8avfFzH0/TInQubHB2hVwaExHDjSLG4xvPtND4CU=;
        b=LHsq68mf95DWCWd++ppuWTiawK11Jry7kEtCzsm76CLPe/e8BlvJvkRpnhDXwE4uVC
         DQgCPuwAOUeV6NiHCnI8qngt1W25tIhzVTY8WFNsN+QtFnOS83rKn9TS5laMuVP8cviD
         xQ+hCeVIKtAX3T9aG/Vq89aeihi0jMlY4V3Hsr/N/ZZwq4e8IBdbRKAOUnX3D6W7S70a
         1+B3FYjE3b6PPHepe/rE2Tz5PKSEIAa2oI+8/Z1X8Z5qHLIVlPmLK9cKSmTCi2+3FVpK
         fHs/48u7P1vZJ/prfi2TL3vF9WUgqhKDPQlv1nZ33gZpGIoha5JWobnHrFgNua6daTY/
         K7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121399; x=1688713399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0a8avfFzH0/TInQubHB2hVwaExHDjSLG4xvPtND4CU=;
        b=Of4NFOXvM9eSfNqpM1p//WTh10O/g6OW7wcyqxcAl0+JGOxrxg0txyWqE6QdJsHyC4
         68XcnZcHM2pDKfEl9wQxgNA1m9QHdzYKUiBnvynh9IwtWDbHknFtSbi6aa3ELjoA3qTt
         OdpB19sAAQUWhNJ6jp5MwxltuPWDXfuN9/s8FKkujE7TWjalrMj1Ev1mMl3n3K3tQlFC
         Gvh2P2sEIN1zs+8Af/4Nj0cRIWZERidtovoixej2dfQMSoDefdEzMxpgKWHDJuYg5kBR
         612znOoRViprF/VUsBBsL0vnUSMZnk3s98WXByy/dNGN+5ryt8DnXgfRbiB7vUa0flwc
         ey8A==
X-Gm-Message-State: AC+VfDza9LPt8A8104KlCo9KG+vhsLA1IBein7kuszufRdzTKrsRH/co
        RhA6aAx0MjgYvaHP+u1kcKlO
X-Google-Smtp-Source: ACHHUZ5Z9Ml/BXS0Jtc/0C8R9yTDCmZw3x8Y9UsQXo+MWMTYwhb7ZQ2anCJkU2RoEcoOph3aH3fOpA==
X-Received: by 2002:a92:dcc8:0:b0:329:bba2:781a with SMTP id b8-20020a92dcc8000000b00329bba2781amr6804865ilr.0.1686121398761;
        Wed, 07 Jun 2023 00:03:18 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id f16-20020a63f750000000b00528da88275bsm8423502pgk.47.2023.06.07.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:03:18 -0700 (PDT)
Date:   Wed, 7 Jun 2023 12:33:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <20230607070313.GC5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <20230606142227.4f8fcfee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606142227.4f8fcfee@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 06, 2023 at 02:22:27PM -0700, Jakub Kicinski wrote:
> On Tue,  6 Jun 2023 18:01:16 +0530 Manivannan Sadhasivam wrote:
> > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > devices to establish IP communication with the host machines (x86, ARM64) over
> > MHI bus.
> > 
> > On the host side, the existing mhi_net driver provides the network connectivity
> > to the host.
> 
> So the host can talk to the firmware over IP?

That's the typical usecase of these PCIe based modems. On the host, mhi_net
driver creates the network interface that communicates with the endpoint over
MHI host stack. On the endpoint, mhi_ep_net driver creates the network interface
that communicates with the host over MHI endpoint stack.

These drivers work on top of MHI channels like IP_SW0, IP_HW0 etc... IP_SW0
channel represents the IP communication between host and modem CPUs while IP_HW0
represents IP communication between host and modem DSP.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
