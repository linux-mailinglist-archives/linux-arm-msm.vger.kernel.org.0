Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D156D720D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236423AbjDEBf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbjDEBf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:35:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C13D2113
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:35:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so44645787lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680658554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T9R5i94+/2OP7HuMgTF5yTKZUTemdPeFjSlLzm2Dnc=;
        b=OMVgcTpZuLq/PQ6/k+aK7OTpnn2/ZCCIPjXPYW4jUDBS6Kd7Q4o3Wt3vJyeLtVHf1N
         fmUQktdmtlNXzvBK1w18RVF7qfGaxnXP7uqbVbTUdl0xVQQtPz78KxOk3omTHHuB/Re0
         gLO/62Du6Ygoe1ATL3SISWtR1HnbMXndXXdr7DyhzqaPgBu6NCJGPMZ0tN/TWQ/IxCAJ
         VqSiXMj3B/hwEf0KPBiYKmavvkl630yaT+IeF5h+aw6Pukhcsj+gq0xXG0kD4+HjINs9
         7/MvAIAKQUO5MIsg8xNxuCp1RGkKchbSfpiXnnfHO7MJkc9lH3+O00SotGDJ6f0A7iYx
         li/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680658554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T9R5i94+/2OP7HuMgTF5yTKZUTemdPeFjSlLzm2Dnc=;
        b=rLXyC/6ZdXgpklQ7pROlPkPOPixnonSUzGE4vFf4FUmXW5V4l1GRPPBezYb7NfYZvj
         dQ5Fbz3Sp7uoEQN1iQt4ovSVdU4fidP/gtzb7+NdaST+oOBvL5De+uy7XQGXlNU0gXVJ
         ejcaWCqNRqunpPxP7DBD+WjuRwpMD2FoVy/EMtmGP/4aGerKA/6sp0642U1LSwOqw9EX
         ipKfSPrm7j2rAEPRugiVZhgqsQhHh1zfUJR7eHcD0n0qEwkmJeV6s/r5C/bWKy7iCzKo
         C/aF+GxhTQu+OG9y99VrBwruFBpV8b5o+Ah72XrCYWZUcLGazQ1ZRE3AZMJNB5rfU5Wk
         djLw==
X-Gm-Message-State: AAQBX9dNr7gHDMGMAJUrdQM9yEXb+zw+ALzFk1/sYZuzMfa4ePYol8r0
        WH93EwhOeljGSzcpDZXBjVZqsp6Jmpg/8qcqTdoJzg==
X-Google-Smtp-Source: AKy350Y8UL4Py4l6LUj2E+z7XnI2ced98i5LZcteJw4LmJjqnvp3RMX0MgrzzzrsqG9YpIl6luPNVw==
X-Received: by 2002:ac2:4108:0:b0:4b9:a91c:b0c9 with SMTP id b8-20020ac24108000000b004b9a91cb0c9mr1099637lfi.7.1680658553930;
        Tue, 04 Apr 2023 18:35:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 18:35:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, vladimir.lypak@gmail.com,
        Tom Rix <trix@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: set varaiable msm8x76_config storage-class-specifier to static
Date:   Wed,  5 Apr 2023 04:35:50 +0300
Message-Id: <168065850331.1260361.13413836522831140170.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404185329.1925964-1-trix@redhat.com>
References: <20230404185329.1925964-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 04 Apr 2023 14:53:29 -0400, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:658:26: warning: symbol
>   'msm8x76_config' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/mdp5: set varaiable msm8x76_config storage-class-specifier to static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d2f762745162

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
