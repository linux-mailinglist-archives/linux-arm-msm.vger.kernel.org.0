Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C867945E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjIFWE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244982AbjIFWE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:04:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76861172E
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:04:22 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-500cd6261fdso399162e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037861; x=1694642661; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOxKwJOqWAb69rm6x/gQT98m4juYI2Q0oOscr22POkg=;
        b=OqlR9MJYPizahgj79r91OxXfzFmUuAVYlzr7Op04CxkzdPQjB0UOQ3uy8KToU3rlXd
         UztzsrwhJLjNLMLGJ/dxK/1ZGdJ5JqMyEBWZRRSTM3V4vQr5XMp5aK18B5AVYnOnEJw9
         JrlbEY1A+XlKoEOElXBJ733EvYgBG1YI/m4JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037861; x=1694642661;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOxKwJOqWAb69rm6x/gQT98m4juYI2Q0oOscr22POkg=;
        b=fyBznU9rRiYzYaMPeUg4YUqUkGZkm1Tr3bUuB04oMnHPQy8g7kgOI26fjd5310tC4K
         CIq/ZV8xmVRse+qfN7HtYQtKeYHpIkeX21v/oob7An0HEWT8ed2WE3qpCNdtHERX5QNM
         OTB13FGQ+qPBIi86u/IUG9oQCkxb8w9LBrZwNdTU+G2MzX2vj6HzrdAXM8n57goZBe/2
         EnOYe7A8KhescU/CxfXBc8OoVR13Hrb5xOahSwoE6nNfiStSTjo9yV/32heewhBEHF6Y
         VS5YBKqkTxCtKOYG4XLXCRyZWzoLNiweOTHB35qeh1C7nfbCl/T+IP4SXl3KMjNFjlJA
         2wUQ==
X-Gm-Message-State: AOJu0YwRPKZLQ/eK7IhrOgkBuM96/wjj7ApuvnCCsKyO3OuEQVTFxxr+
        QIf0aSZq6rXgmBWeOURRWSCMi1TpA87O0+PT63rmbA==
X-Google-Smtp-Source: AGHT+IFsds0W1nef7yYZh8sAvGm/Eh1+DoJ/z/zG1cykY5DoSMrR/hVmw5xZPpms3LSzxp1q4GyB0lRiQ3W3GTk7DvU=
X-Received: by 2002:ac2:5f52:0:b0:4fe:5133:1213 with SMTP id
 18-20020ac25f52000000b004fe51331213mr3072268lfz.12.1694037860795; Wed, 06 Sep
 2023 15:04:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:20 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:04:20 -0500
Message-ID: <CAE-0n538jr7DV2XHzjqBdQt1LcTeFXcGcALP0T7xSc4=-bzpWw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 19:04:54)
> As the INTF is fixed at the encoder creation time, we can move the
> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
> This function can return an error if INTF doesn't have required feature.
> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
> useful, as this function returns void.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
