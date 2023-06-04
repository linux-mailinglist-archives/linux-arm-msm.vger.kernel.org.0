Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0844721435
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjFDDBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjFDDBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FC61A5
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4e71a09a7so4474297e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847700; x=1688439700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW8Li2n0rZD7NzpAXirqLsFNZMxHZzT9M5Uh4WLCquk=;
        b=oUuTNwpXCVwN7isRcBeO4rW750QoBBz0forLMpsixuYaTStFVRpB3hTRNR2dpPG6/K
         3jwkHqla4JIKwoS56k8vrxCd3aGjE4w6woxJ35bmU2V2kx6eLncAt/tLdooxUC5IJnMH
         GOx8loJ/JSsv/87umq1Rfm0Xtm+JiCCqZmhLMWvuUH4dDZH37jCzE4A6n90nqukZ8dca
         zzimW/4F7Hd0K2OlVBABitmLZ+FMXRHAEojG95alypaLThfwJfXgwqMFBTUT9Z0wb+Lw
         LZvs4gsd43NFawyP2UWgns+f1GRKRKyPxAfzpxb/K0NJlqBZjquRrbp1Zn4xlsImajF/
         k0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847700; x=1688439700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iW8Li2n0rZD7NzpAXirqLsFNZMxHZzT9M5Uh4WLCquk=;
        b=jg/oS+CA0cxTVX02oFWNAao67Yw5Zv2o6lStIr5WOoyjPBwSFz9TPeOufL0Oja1JEc
         Pp2EOgxBv6mbhCEoHe4ZIXvoCJBPcGjR+v3v9y3+2rF/I4uLEVMh/ISEYCsdDRYqdk3t
         fBJD4y2QIaE8Ix5yPbn79UFFix2QNm6YwbPqwLj6Qj4U2kVfNzzeTfr4ge525jfdBJvg
         iLsBMBfoWS9lg7788/z2ZfmW/T0heY8Ypeoo8NrqwPh5JRfWMXG7BuWyHIrjYxcW8ZN4
         MTYTM+QCSDQkSYf6eiuzxQzmHPeVzquY3c3STep5/wrmNxUNaBpUHv+y1RLOtXmmPVj+
         cx2A==
X-Gm-Message-State: AC+VfDxnTuW+KNjDG55jey8pIuBNNjPPofClK1ZRKVA9cLRBZcmhDJQ3
        Pm2EbgS0Xqg2YPxFDKqJngTHWQ==
X-Google-Smtp-Source: ACHHUZ4gNdjSeZJPzmWovGSc/x4MjDwnYJBgKddZijOqQwsfXwnD9Ek1REVt6tKvEYHFV0jVQdtnow==
X-Received: by 2002:ac2:4f8a:0:b0:4f6:ac9:2eba with SMTP id z10-20020ac24f8a000000b004f60ac92ebamr1771664lfs.11.1685847700079;
        Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Date:   Sun,  4 Jun 2023 06:01:27 +0300
Message-Id: <168584750429.890410.15848312463141330600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
References: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 26 May 2023 14:51:59 +0300, Dan Carpenter wrote:
> Static analysis tools complain about the -EINVAL error code being
> stored in an unsigned variable.  Let's change this to match
> the clk_get_rate() function which is type unsigned long and returns
> zero on error.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
      https://gitlab.freedesktop.org/lumag/msm/-/commit/025e3d97867c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
