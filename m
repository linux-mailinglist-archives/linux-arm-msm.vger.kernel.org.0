Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641AE671090
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjARCG2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjARCG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:27 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467313EFE1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:26 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id az20so60734778ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c58v4Ko4NI3Uuss/PDRkANW5YkUAQ7jYBjFl1RBOCWE=;
        b=zI3Kd8HSToOskAIYJ9AMYdGk6gK9HAUtX3cB3qe1xpw8qzqulMdjlmcOl836QQsfzK
         TDsz3LHpGt6jmgbELXDThvifG8xfdgkLYxVtcUjmObM0xAETlJ1iBw/kjBG3FZSotuew
         QFdVXf9gCetL3S/VHhgnWCDxyCJi0WuYquBrokne6kJApWwtM3FiVeD2wslf3XKAJnDs
         U1NK64J8TNee7r9NFXGfZuC9iIUheGnip3wWhTrQsTUPxz/dheaJXAPVE6AojJHv39a1
         yxyQp0ztyn2WjfsU/0Ge+UOLY5qacBIrERfRW7zRXlvGMkco3kjKxcwdZRkzOmQ5IwOo
         0MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c58v4Ko4NI3Uuss/PDRkANW5YkUAQ7jYBjFl1RBOCWE=;
        b=MczrUecH9CJU3Ro5jH79DrFRjO/lrXKTDIlW1nAAmIH+ClqQrQVDhlyDsp3qtBdNyU
         +PbLE4sPPv4GQZFFaY3B4/+brBJog45XAIdh4AlRDFM7ZCl7yBl1AFmL/TqsxUtnyw3D
         /MKbBHwndeNt4/EaYuo1CIuTlK3e9BbVJxVnMnaaDr2ZT4+2ENhCXJgpZQ5F7c7TSUu4
         /MKXPxIDQtfNEvy0CO7V/MIALDZYyxu7tAv3CMwjwDRCFDwkwBX+zAYkz7ipZQi+4Kz0
         bY96p8vzdZtwYwq/u+XECBKemk3HsbJ72eYW5VmXjIPEfGBVi/ensT1MtkLwMIdUfa1E
         ymDg==
X-Gm-Message-State: AFqh2kraVKOMfH3zYGQxAMc+NMKDXs5ZCNFjW9hsn59mCP3a/uVfudOs
        LgXsINmsmJWMo0TnEvWG8z6HQg==
X-Google-Smtp-Source: AMrXdXt1XoRpqpsessMQOJ9ZPWckw/DSv/pfowSn+SixvFGSTvatonHQdf4eFrMQmt8g9fnnGB5+Ow==
X-Received: by 2002:a17:906:6c8b:b0:867:f167:43be with SMTP id s11-20020a1709066c8b00b00867f16743bemr4551084ejr.77.1674007584823;
        Tue, 17 Jan 2023 18:06:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
Date:   Wed, 18 Jan 2023 04:06:07 +0200
Message-Id: <167400670543.1683873.6925891527169997140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 02 Jan 2023 17:47:47 +0200, Dmitry Baryshkov wrote:
> Struct dpu_encoder_virt_ops is used to provide several callbacks to the
> phys_enc backends. However these ops are static and are not supposed to
> change in the foreseeble future. Drop the indirection and call
> corresponding functions directly.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59f0182a291c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
