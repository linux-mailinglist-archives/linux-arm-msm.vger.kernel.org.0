Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D20578DF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 01:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236348AbiGRW73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbiGRW7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:24 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC682E696
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c0d96953fso27886397fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SxxNZtcVY0b8c3g8HahpgL2HEMB3NUWSQPhANcfFpcw=;
        b=qScpjRmbKjILEK47SQVCEsWqBHMsmQf4XSp/wuZVwOsMjUVKZdEkrGbXnnuy1EERXk
         sMPMCbWDEOWxGcqU88TEWa+qxEDKsNPfuTMHcNXlBvjKQOiYPvG+qZqgnmaNB1Bgq9Bh
         KObNSdP235mb+8JgL9uU8PlOnMtbcppuB59vDaPWvCrcSdwo4xpuRPnE111wkKJD3spR
         krwTD3vVI3ZXvcbcyZIP/E3FMlmCs8eYUtW1ecKGOYoxDFM58AsADBbWLhqBjbRsI7DM
         HxEm79xV3zcUFoLqqP+YdgGjv4TUrki0UqB1FHeG58cVQ+/7b6TZX3W082eCJ24K5eo7
         19wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SxxNZtcVY0b8c3g8HahpgL2HEMB3NUWSQPhANcfFpcw=;
        b=VDZ5L1+vl+xiLBY7RLhNL2hjpPLm0wjx54/XbG74YwYRhCRCiWWBv6+tiybBMOartP
         yb5Bk9bkoDpxaBp9IRE981ubZB20AW4wG4O25ZYByNcODewzdRa6DwBaIDUdRtXYo6RP
         a3Uqu9TbLev1o63O5Jn6yOhV+yn5KB7kcS3xBIF3gZtVDGoGfud7H7JxMgMEdkhxmqgB
         ubCmyi0pLMsS8Fmf/O5IIXcHj88myIfFAc6+bsvQlf24sjecGVasNO3Tmp4gYYv9tdpY
         ikljRyFu30elVfkOuBYi8UjkcJoBv0Cs7t42FGhpE4E7qa4RYChqHlUIWEe8EXWBs6WC
         bJ+g==
X-Gm-Message-State: AJIora+tcFuZOaHjZhoyLp8QOpBgD7JBevaHabQT7p2hVg2CNdMk4iiU
        kwHy8oMSkO1Bv4b5NuDPDHqv+A==
X-Google-Smtp-Source: AGRyM1uUem0OHxS57H5plPJD3mJfyUDxFeH0fZJvpLkK8OAg1T7jiG4WLJcodw+wDF2EctA/YJq1Wg==
X-Received: by 2002:a05:6870:a110:b0:10c:2d87:9dad with SMTP id m16-20020a056870a11000b0010c2d879dadmr18379216oae.57.1658185162537;
        Mon, 18 Jul 2022 15:59:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sboyd@kernel.org
Subject: Re: [PATCH v2 1/3] rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
Date:   Mon, 18 Jul 2022 17:59:07 -0500
Message-Id: <165817634384.1905814.9434531838630907611.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
References: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 May 2022 09:33:28 +0200, Krzysztof Kozlowski wrote:
> The use of strncpy() is considered deprecated for NUL-terminated
> strings[1]. Replace strncpy() with strscpy_pad(), to keep existing
> pad-behavior of strncpy, similarly to commit 08de420a8014 ("rpmsg:
> glink: Replace strncpy() with strscpy_pad()").  This fixes W=1 warning:
> 
>   In function ‘qcom_glink_rx_close’,
>     inlined from ‘qcom_glink_work’ at ../drivers/rpmsg/qcom_glink_native.c:1638:4:
>   drivers/rpmsg/qcom_glink_native.c:1549:17: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>    1549 |                 strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
> 
> [...]

Applied, thanks!

[1/3] rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
      commit: 766279a8f85df32345dbda03b102ca1ee3d5ddea
[2/3] rpmsg: qcom: glink: remove unused name
      commit: 6c3ebc96ffefbc48297d7c2fd266e9cb78e6941e
[3/3] rpmsg: qcom: correct kerneldoc
      commit: 101042f4c0eb2daa331b4f7ce32c6d547114830a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
