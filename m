Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780DE6CCD77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjC1Wib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjC1WiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:23 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302E230D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o20so11257938ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhz6CmqWnomqbGREKgcW3MDgJ3S9r1BJwI9wzCLxIww=;
        b=GhkC8RyxaD7gAVRkE/mUr17glvcMiNhfCk5PwEc9ZiEUKAUL4etNlDPXc+ygWQRIK4
         UOmex8fBErR67SI8j8edBFwcLwqtp/KJps5KhfuWx1SBbnHa2XECP4PvbZEQ/LgzCwMd
         zYIPwqSfJFLSkfFdVcjQMPI5PhRyiqitpATE6H3ZCF6sABVsQRj56ChWleXJa79yjqyP
         L0tuQ8ysJg8sl5cixAWCG9ymzZgsjlC8BQP/8lHJsghQUiZrP6x7aTZfQx+Q3pKoOJt1
         0Jrjy5O1prLtHiRpTH0vR6k0MgMi0WwA0y26pdCyexXKVPVNHPC4R6rq9BuPPVnptcOm
         D3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhz6CmqWnomqbGREKgcW3MDgJ3S9r1BJwI9wzCLxIww=;
        b=dpYuvTO8Ynn/DZ6akpbwerqfHK2gGFDdRxYn5rm5nwOffbODGkL7CvfFlgmDcG+s73
         X3K3FRcbLb8VLUHhs4Km6cZK0ze04Pf6JLKluOyK//R4rqFJI/zCp5BPK0KejMDXc24z
         Ib8k9uOggZGhBPYWZDWJ9tA/wzpsIKI0zCENx+a2Wfdxo9TF99sTVnS00llJbJ1nhJbA
         +yzpNkh8eBSTLehsoIeqP4tEB1Y2jHBbpr7HXfU3miScTIpQcdbzBRglLBDQK24Lv8tk
         GX6diEVwBthz3nyNC0ooFM2XC8skcg7Eb/c6upF5T+bg7TnKcuB2D8FTxRDqUAJjK6hS
         Q58Q==
X-Gm-Message-State: AAQBX9dAcbMXk9I6Ig686PoPjugVpAmyXvSty4yGUhd792wkEfPu4e3o
        dhV6csmDzDxj9X2kPS4yU8Hm5w==
X-Google-Smtp-Source: AKy350aXisM/hjSHdt9x5liSV084a5gxN2IJLBSsLRBtalk89B5eAjSKjM+kjTpP6J5Md14PmlJ4SA==
X-Received: by 2002:a2e:a3d0:0:b0:2a1:d8e:a2b4 with SMTP id w16-20020a2ea3d0000000b002a10d8ea2b4mr5276225lje.17.1680043092480;
        Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Subject: Re: [PATCH v4 0/4] Move TE setup to prepare_for_kickoff()
Date:   Wed, 29 Mar 2023 01:37:58 +0300
Message-Id: <168004255469.1060915.7643490068999732459.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
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


On Tue, 21 Feb 2023 10:42:52 -0800, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>   clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dd7904e0f824
[2/4] drm/msm: Check for NULL before calling prepare_commit()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63c3df12d13a
[3/4] drm/msm/dpu: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4d83f101233
[4/4] drm/msm/mdp4: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/191604898585

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
