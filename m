Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C4051DB77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 17:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442626AbiEFPHO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 11:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442623AbiEFPHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 11:07:10 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396E16B0A4
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 08:03:22 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id e189so7735538oia.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XKJtgH586QUGkr3z2wYu8z+b6ngnpTDcdk5KmOpCqGI=;
        b=X8J+s7AS7hSEDfFe6mjBS00+2UQhkvmP3CHWz/iV35z/Os31BUtlG7YZnnhOj+hbyF
         PNiBSicEMiG1/DlaxIWO2uQbw93RgTB8tunTF3+GtFOyFp2X1hi7g9JzMQ2rhzrdn+wS
         bYL8/HPHqbptcot0tKR05gFv4yS406NP6I9iExd3k4sjRn1Ecg/t5yTpbDOBB+mYhHQd
         W8iUGCldbEpnCF65z6tPAv+jy1WeH+NX0jzhwIBGJoUJAKptzNIclH/YBQ0Lzja/zGRz
         Z/ffi5/Fa81bVh1bCi0RdX+WTHZw6e05Ef2eoEJ0XRjodK8cLHbvYNYZZ6MxCpQk49Ej
         ntGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XKJtgH586QUGkr3z2wYu8z+b6ngnpTDcdk5KmOpCqGI=;
        b=HOHZWPmUZRQy1mWuwXPXGpjzwigqY0tZGqj7NI4pIRnGPLo7KaKjlg/jNiK4BVPlR5
         lski7Y1sNU5zpTQGXzM/UgOK/I2xZIy4UJTwrOPBpn2RjCdb8Il2v7J/qCTJ6CWxlygK
         P9F9r93aQenCCg5kaWP8w6wXh+zYdtiSd60e/3VykgcjVpBM6IhqKjuu1Ah3z1f0O4Dc
         oQ4apG3GYyY3U8fD0w3pM1hG8T80rr7WQ4oI7E2TvxpTYcZWiRzeq1iEAZAN8ZUDIV/T
         PQ1YoXlsfJf2EQ07e/tPDyvjUHbg68CoVTVtEdaeM9QvBNu0iRMg7OLKXNeq6QkTmCr5
         cHng==
X-Gm-Message-State: AOAM533EGNi513ODVwsta7zNsw42EzM7f96xCQu4dNbvleQp2YerwN+P
        WOkJ462oqHUXSnatdO948Dqc49g0Z4zlmQ==
X-Google-Smtp-Source: ABdhPJxts0M9wMhsTCwDQ2Nd3oUFgIX/tWeXtiyIW/SL6FvHXO6BpJN8mcMfa5TFircRWEX31gvECg==
X-Received: by 2002:aca:61c1:0:b0:2ec:d091:ff53 with SMTP id v184-20020aca61c1000000b002ecd091ff53mr5006039oib.235.1651849401460;
        Fri, 06 May 2022 08:03:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e21-20020a056808111500b00325cda1ffb9sm1665311oih.56.2022.05.06.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:03:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, Tom Rix <trix@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: pdr: use static for servreg_* variables
Date:   Fri,  6 May 2022 10:03:09 -0500
Message-Id: <165184936433.73465.7411487617454793164.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422173806.21982-1-trix@redhat.com>
References: <20220422173806.21982-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Apr 2022 13:38:06 -0400, Tom Rix wrote:
> Sparse reports this repesentative issue
> pdr_internal.h:31:22: warning: symbol 'servreg_location_entry_ei' was not declared. Should it be static?
> Similar for other servreg_*
> 
> Global variables should not be defined in header files.
> This only works because pdr_internal.h is only included
> by pdr_interface.c.  Single file use variables should be
> static so add static to their storage-class specifiers.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pdr: use static for servreg_* variables
      commit: 28e3dc8f8cd37eedc14e97e80a7a2e33359491df

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
