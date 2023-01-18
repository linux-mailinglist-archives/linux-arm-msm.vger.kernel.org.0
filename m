Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3052E6710AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjARCGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjARCGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:40 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B4745F75
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:38 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id hw16so67975770ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iu2lmDtgcoBeAYM6gGh53UxWG0qeailU/FlKFijEGOk=;
        b=h086/2nQ2W1KOvaY3mNIjiu+FbWUv3/dHgY/xQVayIj8uGyXDQwM9f8/cj8gIuCFjV
         3k6NCXHSoGzkTl70xUh0BA4VL8imLpXY6XL/VNwi/+pBvlCePLc4noWn2zUWGaTFPKuC
         Kd99DvlqFLxdObExHD15E/G9XJPbfZIR1Fm2hV+UKPUcBN0AlOzUfloP6Or/S4BXaCTI
         dBftvA/S8sFBWqMhqSRRxaZAbV0zX6DEE5aNBxRpe/MesLwXVzaCD9iwMF1i9GvWGmMu
         tA3mIXYSF98eUwSCxzuMGO+7lVRTLKIpI/suz2pb24rxXGs4s5uAA1oRagnHkv9Ot4hQ
         CvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu2lmDtgcoBeAYM6gGh53UxWG0qeailU/FlKFijEGOk=;
        b=Dxci0AC3MBN1x580XdgEahCAAXAyzgK7F845SNRo4p61fe8KVnRsKSyttQVr1CneRk
         ZOjvQRf42vXzMJVPguD9/2u8gd9CQNxI5xlBO6FqGkHW9IDrhKSLNi22gaQnliAH7+to
         m6r3MROy/xMPNv8TJ3q03R/RAVZfV7/J+dN/CjZNl6YrIK0iVBOdQOJ+1RNWXAyzzUVW
         orc5/IZ1xY3x0HKTaSeZHjOe8i6PwmbXLB1k8BL4jmXZ9hB144Ny5jVNr2FeCDlQSkb/
         oDA7sqdOhv/jxIP5QEPuO0ZWlPqpCjRuKUkPVrFc9HQ3bDti8NFGDjAgVbDqEw816+AQ
         oB2g==
X-Gm-Message-State: AFqh2krg4FVQqiL6v3SRaB5dP+RHsIfF/eFvHXmD9hc8uPwDvJiFU/mi
        KG7OqrlhC0u7wT6BheFxHjfGMVDgwxu4e7sN
X-Google-Smtp-Source: AMrXdXsGRlD3SDRIHHy/5S7y2T3T+y6gbGLje+Dh/2Uwev7/umKTAb80X+U78jbo97FaiZdhuIZPHQ==
X-Received: by 2002:a17:907:2135:b0:86f:fe8a:be with SMTP id qo21-20020a170907213500b0086ffe8a00bemr5128958ejb.4.1674007598052;
        Tue, 17 Jan 2023 18:06:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
Date:   Wed, 18 Jan 2023 04:06:18 +0200
Message-Id: <167400670532.1683873.2224335545021677491.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
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


On Mon, 16 Jan 2023 12:51:32 +0100, Konrad Dybcio wrote:
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> 

Applied, thanks!

[1/1] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4ff00ebb193a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
