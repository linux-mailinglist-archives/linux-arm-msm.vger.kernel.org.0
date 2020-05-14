Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BC01D324A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgENOKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENOKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:10:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F426C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:10:54 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k12so30517867wmj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hoAYDgtRggFxMiZjO1bVW1903dGoWfRGsSFbkYw4jm4=;
        b=oGIR/NgZPhgsGNIQ8Zk5BnAdNRaUEMX0VgrvEYjok/yp4Q8NKg2exbRNOfezD+isVV
         V4tXhdggfj4apHIDb05+IdKTkWgRKBHBKcJLF44Ot6PWxQf/t0VPyOxku1zh/OwkQ1if
         W6wiDDyKwHfUZSxMHLpJHXm9iDYF5biGg5fKMDQCUciWgFamxGj7QLwsaj4YCF8V5sQ5
         GCxNOdSMn2B2wVPBPwGiJ6TqNyq/t9xdfpfyOSrEycW6XyhF2E8L98ytJI36ukMmUA9F
         YBDMnfx6qy7rIrkEdY6atGqEMbjLvks/WkcjWXq5k8Pg64slciI4bBkMMQNwiGciBqgc
         pmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hoAYDgtRggFxMiZjO1bVW1903dGoWfRGsSFbkYw4jm4=;
        b=EHVeHMCBum6d/tHPTSWMPJFXidtDFBdQOjH7+7wF5hl+xdGGe3td90ble5UTyR6YqR
         O5fFr3s+YHRwhhAUr8O9A9/LN9e+RNGmuJuyv0b5+YkeJ87RxoW9u+RQ1oMxhMyQODAA
         HqrIetkLR39ZToVaX029MUatmiT60vGuGbFk3nEgQxc3LtYWBoLqYX53kH5Pul0d4jM/
         KoM8X49V+UtCB/885YtXONN2EXYWjKyJgZliWHnjKLBmUrs3VDVIMy8kj2zWi+NG/kK6
         jtFEqbVmIIxr6zlpKgAr4EqJBd52DdHCqVIBAxNHXoiC+VqeVN5hwH1a5OwM6zclhNNA
         8CgQ==
X-Gm-Message-State: AGi0PuZoa2hBGgFST3Hl3sX/xWev2iRBsk9UxFosEX6f6ciiJicQDZG8
        OGjcGhDrAE37ppuPxSicefnSQQ==
X-Google-Smtp-Source: APiQypLK4m/UIQG/wE+O0YZKAmuvLLyiAggfiVqRnl6+26HL/7yIPecMv61BfyYTxYq4PpvRanuwAA==
X-Received: by 2002:a7b:caf2:: with SMTP id t18mr26185465wml.35.1589465452810;
        Thu, 14 May 2020 07:10:52 -0700 (PDT)
Received: from localhost.localdomain ([37.120.32.219])
        by smtp.gmail.com with ESMTPSA id n9sm4315672wru.90.2020.05.14.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:10:51 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     Anson.Huang@nxp.com, catalin.marinas@arm.com, dinguyen@kernel.org,
        leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marcin.juszkiewicz@linaro.org, maxime@cerno.tech, olof@lixom.net,
        shawnguo@kernel.org, will@kernel.org,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: arm64: defconfig: Enable Qualcomm SC7180 pinctrl and gcc
Date:   Thu, 14 May 2020 16:10:48 +0200
Message-Id: <20200514141048.1344235-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200116045457.2489704-1-bjorn.andersson@linaro.org>
References: <20200116045457.2489704-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Enable the Qualcomm SC7180 pinctrl and gcc driver, in order to allow the
> kernel to boot to console.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
