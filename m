Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E664A562D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbiBAFUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiBAFUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:12 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A95CC06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:12 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id l12-20020a0568302b0c00b005a4856ff4ceso7026910otv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9zRd1V2ISXwphTRlIcVBuHuJWr0vd9KojjKRN36MEAI=;
        b=Eleh1fLCdYSRw4x0uDLRVg2ZmQ3jSO8KSPU7SAelvmamrvJVOry2xUd7y3ko8mjcdZ
         +oREGEaNWHqKKFR8eeWgJJLK6/VlorbNgPZIuUAyxiqOnbJ9IR2kAsnd4KGT9MwLm4zo
         JTjIW0h1eMxu3uq9AdhCB7B8mlvLpmY6SUBa1BtrIC66EonLHzeb1/lo7Bq8OgdfIfc5
         JUtFLaoB5mHWmPN/8caP8SKTl+EQF8WuOnkCL7lj7/dx738XqzxW50PdyrKZwjCOl3pc
         XT5lo9v8AX/E/JhZEv5nJatkfp7xNFcAyWaw1A0QR2giCWJkDr/vGf2hkYL/wmcNMxPV
         /S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zRd1V2ISXwphTRlIcVBuHuJWr0vd9KojjKRN36MEAI=;
        b=CRnQhfQQE/nf38tFRPlCUenNeJXiJNvQob5Vt4S7YlrIGnWqrOH7SFDmydbM/0Tf3I
         b67WFO4tVQ7sU7ZIyqmQBhtcn195WCTI9yMIkudyTOE2M22E4b5ukB+3MZ7OcUxXyL2P
         lB++nrNkiQmyTUnR6D9JHopM5wijpQrwIPZRmMY7yy2j5NAJ6mv+P1tNTVOdhCiYky1V
         Mk/Qa8NBsnrMfX+cHDllzb/3CJ5+PdxAY5353tkcn1+E5dMTfth5UCY3Y6g1XUO/yfU8
         GXAqmxVcEJ/E10Rj/d6824Qb3PktgXonflv0y5kFavRoX5eVcxF2JDTwsM7JbYfik4cE
         NE8g==
X-Gm-Message-State: AOAM533UmLp/G3MzLgeGzYbWUj0axhPbmYxZE1Pjj4bpDyn0l+b58N6/
        EQOIchFGTR5r1D/ayEzr0Qj1ow==
X-Google-Smtp-Source: ABdhPJxXrkcDeP6zBtLfkOhZMTeiCTFxKhGi54ttguawdZi0hau2mMK9Pprgj9v/jB4lHvJC0neGsQ==
X-Received: by 2002:a05:6830:555:: with SMTP id l21mr13357720otb.54.1643692811788;
        Mon, 31 Jan 2022 21:20:11 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:11 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ben Wolsieffer <benwolsieffer@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        trivial@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: qcom-apq8060-dragonboard: fix typo in eMMC
Date:   Mon, 31 Jan 2022 23:19:21 -0600
Message-Id: <164369277345.3095904.16020829127932162038.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127025358.2202977-1-benwolsieffer@gmail.com>
References: <20220127025358.2202977-1-benwolsieffer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Jan 2022 21:53:58 -0500, Ben Wolsieffer wrote:
> eMMC was misspelled as eMMMC.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom-apq8060-dragonboard: fix typo in eMMC
      commit: 206006cf20b3ccec65b11d2a83876cc6006b6a16

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
