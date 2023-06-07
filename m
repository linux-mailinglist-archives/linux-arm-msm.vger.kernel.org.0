Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384257272D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 01:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjFGXUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 19:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjFGXUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 19:20:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9EC210B
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 16:20:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f6454a21a9so46171e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 16:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686180004; x=1688772004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7qK40ksF26jrV7Z6e+XMOd35fU16ptWb+JBbcbyUhM=;
        b=YdSoiItRF0GCtEBmKf02tJrUf9D48fvrZ6hP9JLHExNBmIoNSdfasALc08vC9DV6Mo
         mvN04oYx4WyLFLm9muKpNRh6FwuGs9rjlU+I2buxhJW9NJrDOm2rxehYdwAAAABjk5Od
         WUGZstNZbn9JMRc9ybD+mOrh0lukshUj45G1ASgitQwSXNjPBKyZgxgB3/j3/V+94Qm6
         LIG68p9ZJPCpU2hKlU5XnLTk3KZWr5XP4PQXwnUHTbUt8Fs2iK7dvnfPCaQM5Qh+xsHL
         eCC43DX5v6ioko89FJW/zmyFJpDrrhCmnh6qGBA7U2bAaqpButAlSwlHyY1bV9ThEsgZ
         XNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180004; x=1688772004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7qK40ksF26jrV7Z6e+XMOd35fU16ptWb+JBbcbyUhM=;
        b=YMWTufJfWkoYcJYXqFkMBwHnEB6nyR1lhxGFyjpdEQcQrgQLGAgftBYJfYe3hgtgBR
         AwRfO9gGynoTKE/M97n1nKjFAcqpx3u1qo+S+xP9aVm8etLzVJU3XzUY1DaosqmuuhBd
         oZbWeQMK5D33cX0LFHsxPbQ7E7kzGS3rf4YPWBHjGkUpNvu97HBEovJNAeQ2VF4qbyHV
         A7PyxmogKjW7ssB1tBlbAL7JwI88M30FNRyVoHOMAQfDPT+i0CRLRvndYYwhk9hw/CgW
         3BbP6m9IiIS7GeSbn4hENwJiiSqIzb63YnHnuU0b+2EghQHfmgUCGjt+cd9tfbc3hoNm
         +jCQ==
X-Gm-Message-State: AC+VfDzPYBK3++Hl9dAN2JnueCfvIhRGgKWA64fVFK2H9da4BmqQfxoQ
        sWnMpaqFW+e8GOOmN4NX6PEnRQ==
X-Google-Smtp-Source: ACHHUZ6AI3p9yIPWZtohBoquJGhKoRP9m/ln2nsOUaVQVX7zSB478XuCMQ0ma5PxjKFK7vohgYxTwg==
X-Received: by 2002:ac2:5b46:0:b0:4f6:4996:727f with SMTP id i6-20020ac25b46000000b004f64996727fmr580499lfp.35.1686180003925;
        Wed, 07 Jun 2023 16:20:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h18-20020a197012000000b004f00189e1dcsm1908952lfc.117.2023.06.07.16.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 16:20:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
Date:   Thu,  8 Jun 2023 02:20:01 +0300
Message-Id: <168617996602.1879421.14988330967519965516.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 04 Jun 2023 06:13:07 +0300, Dmitry Baryshkov wrote:
> Currently the driver passes the PINGPONG index to
> dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> flag to tell whether INTF should be bound or unbound. Simplify this by
> passing PINGPONG_NONE in case of unbinding and drop the flag completely.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a03b7c4698d7
[2/2] drm/msm/dpu: use PINGPONG_NONE to unbind WB from PP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0f86d9c980a3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
