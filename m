Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5276203DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbiKGXih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbiKGXig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:38:36 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEF3140C9
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:38:35 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso16350906pjc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJoui0QTjH7+JY5QxKtsNZXHrYepTm8gLqppY/5uVl0=;
        b=cOQPoEYo5sBoGz+A5Ih1+I6ERPnCL25YURQrwXXiQclLDQ9QXO0Ht8OZLO/5crg2rA
         1h3pRCQkE0syK1ko0t2JEloZh7pTs+Wj/XVO6N+YaEVl3vteQHC7/kBBLOASjsQ+w29m
         WpsZN3QzbGw/Uyvwmyh7kpGj6JZcE9mUsGk8HrP8ok1/tBovb9WJFAMIo5lv6BcPIlAk
         wCEB+WFO9zmdAoZRjblCJ0xICdHxsZhYpZyNs+HUUzbnQs02jqtQuH8iIob+VbHLz/3O
         +oECZboUg9we/CWUebF25notuwyY/Uurh76FHDomlTJxkpDr0r9F+VEtZOa/iV7G+r1o
         /a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJoui0QTjH7+JY5QxKtsNZXHrYepTm8gLqppY/5uVl0=;
        b=ZClt3G418hO6fYlLJ69JsVugoK1H0GJO69yn1brjYcFT/bWyaF4yDSTKBY1w7WB4Gh
         spoDLP8DhhnOX2uvFTQNFjGNTyKR6GYNHD6MmopkrdCkrQyHUjTK6esLjUcgF3SUGTCe
         8ENNbTj5qk1Ed9S0IDupnLV1wBbhmzQwohaqCkWu592o9y1WOQ4YSb4UJrG2LZ04xwmh
         vihUusz3bLSEDStX5PZvfLCzjIxmng0X7On2KH2YktTFkmf+wiSTLuBRKiKyaCf2SYtC
         ql+8nt0gy9CKlcI0b6ooEOQi3OyxFhbfXdz6okETi+PfZsCelvxJsCZwSE+4fIp3OS9u
         yADQ==
X-Gm-Message-State: ACrzQf3sIoUjB6wyoMrQ5Wex7QOCDQMhqQKNL2upm1zJbaZBviKYHYsK
        My+/HDrwbc2HobfmsY44lQl0G/lEPs+39TmO3DM=
X-Google-Smtp-Source: AMsMyM4y43dY/NFouUjTBykfyDw6rEsWjWjUzB+SR3YWoHqcel0gNj6ED9q8GniIeg4UOzt2BpcYQaInbhS3sqwBGTU=
X-Received: by 2002:a17:902:7d8b:b0:187:3030:ab02 with SMTP id
 a11-20020a1709027d8b00b001873030ab02mr39797597plm.80.1667864314602; Mon, 07
 Nov 2022 15:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Tue, 8 Nov 2022 00:38:22 +0100
Message-ID: <CAB1t1CwFwuL+dPqNH-9Zivye7onddXGrj=hcsx+7eFFT1bS-JA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Minor DT comment cleanups
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        patches@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
for whole patchset.

Kind regards,
Petr
