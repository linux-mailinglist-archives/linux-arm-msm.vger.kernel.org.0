Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA051E82B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 18:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgE2P7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 11:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbgE2P7y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 11:59:54 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DEEC08C5C8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 08:59:54 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bh7so1307256plb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kurCmkIiK6G16S1AS8MjE3nGZ5QMFbDaJnDr19QRtow=;
        b=P4jV66QAnPYba6PsFDUDr1f6sy7Ye12Q/5dWhR5ZwIKceETcyEqNKs1s6UYIKj140U
         DKCSzND8cGlwh197eDms/epq3q4w1x6YqaqhjBLumAbsr1EMuO42IE/3ZgKLrHD0azZb
         WLuikp4YBl2qTTbDlCepkKiRA02G8QEjZLHiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kurCmkIiK6G16S1AS8MjE3nGZ5QMFbDaJnDr19QRtow=;
        b=qFihUaJYAJctDpar2L6hdBcXKVw7KNdQzmIRHog8sZdkmsOXItY2a7Zv8F5HtaBi/L
         BWX7lo3NWLzOkdUxljS9B5o5iFP/QiKPDz/RHKSTeafQxEsotorN7+Itc/8wmSD9tExu
         qQwVpEMNkgi8o/aUonD0B/P4JdaahXfacDtIl45LAmxyZZ26dETUn0zUSeEwsbC231IE
         q45fgCa5WJGG1f7bvnQ+09ets+3dgZ23Q3ltKuTHK7DdsCplwBydew1OwmBlpYWGQYZ2
         j2ZQNU41wdwu2q0qBZ1pwC9IaWiKbcIeFhddnOhIrcdYXCP4SzHGcR7/Sv6LJz6VtfQI
         SmmQ==
X-Gm-Message-State: AOAM533J3Wa7g/R693m2Zq4rwQOTFu3fi4g7xV/yIXFhK9KhhKlcNM4W
        hRxnfGVSAVyHMrlww2C7lssABg==
X-Google-Smtp-Source: ABdhPJwtQNV2OvNaIRbkCIkqCwxriayrw68HJNbfr/VBL6ehccOxrthYFVFhrqhSbdeBanDCFD9b0A==
X-Received: by 2002:a17:90a:1a17:: with SMTP id 23mr10401588pjk.198.1590767993701;
        Fri, 29 May 2020 08:59:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id gt10sm8447666pjb.30.2020.05.29.08.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 08:59:53 -0700 (PDT)
Date:   Fri, 29 May 2020 08:59:52 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Improve controller ID info log
 level
Message-ID: <20200529155952.GN4525@google.com>
References: <1590763573-8302-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590763573-8302-1-git-send-email-zijuhu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 29, 2020 at 10:46:13PM +0800, Zijun Hu wrote:
> Controller ID info got by VSC EDL_PATCH_GETVER is very
> important, so improve its log level from DEBUG to INFO.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>

As requested earlier, please add the tags from previous
versions (in this case my 'Reviewed-by' tag from v2/v3),
unless the new patch has substantial changes.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
