Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167D2551318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 10:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239987AbiFTIon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 04:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239463AbiFTIom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 04:44:42 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7E8E9A
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:44:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ay16so287430ejb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YVi3D194sdyxvkGLsBfImbrrFHaWe6koIaOfRs7xpZY=;
        b=GPJVd9wkS9872Pj6ecAxEq4OgSG9RQlHL7uaN25HxLizxECezEa516LpRk84sqWK3Y
         fWhr02IZzun6+I5QhG6UV4h7kEJ615sHnaYtV1mA8qPMVQc/vd4UZHDX8HAGh76E12aL
         RB2eyQHZcDVnN/wLQ+E9FtzLksHOdVnc4UMA6bNJm6V2QtPXeM3Wd22lQbPTxGKZuiBT
         DN8OVWndEk+6BM8JCt/OAdkxe/MLv/cxfDxfY8tOPuhMIfyDPKDQDROTERcYrBnHAlRe
         DuceiGj5V9LPzVZP+npWxX+NDPlSg9SJywqHCgbnpQfwPla/iECYH/RktYNt90kJlRDP
         PZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YVi3D194sdyxvkGLsBfImbrrFHaWe6koIaOfRs7xpZY=;
        b=guhrn4b177jq5X5HhwLHEpKsG9mgMQooOw+jcl6x9xQO7OR3QpWnz8Piceq5XgQi76
         jpfySM/Sk5ipu9AfPLG1vTFH/QgoCkyXWob6dArhMNZ2lU8NUPx8Q5PdjTnEkia3vf5M
         48IS4VLuaNeku1xb86j1OMfyK8cJaShB3OHhKPq9QUuvvM2Nk4t5MGGWFqx7ZK06eHcv
         rbZ2J41W7WFs4J37Ec18Pjt2wIMs4L+zh13e5puYJ45acu9v9b0EY0Yk2dhXXZVdh9Dh
         zKb5OhU//UxkAx3xGkQPErxWA2HFUDAtwL0FOitz9a0mGgobOwbyS4yvXclk8VX3yHVD
         IRCA==
X-Gm-Message-State: AJIora+yy6ql51vQahC0G1s0qeen2Kx3wNHUQGJmdiXpjM2i4fcNdrbO
        1rzaSiKJDMLa1sA4jENH8xPF/Q==
X-Google-Smtp-Source: AGRyM1vBG8xyJ+oIiy6ksUK6rwiJB4h9TTzdrWLDcYP9XK5oslrB5xcWli9w3hX/TofWDYdMRlCMVA==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id nb7-20020a1709071c8700b006f029eacc01mr19990953ejc.671.1655714680330;
        Mon, 20 Jun 2022 01:44:40 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o2-20020a170906768200b0070fd7da3e47sm5525104ejm.127.2022.06.20.01.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:44:39 -0700 (PDT)
Message-ID: <93da288d-d6c3-56c8-676c-c5ed22de7bd0@linaro.org>
Date:   Mon, 20 Jun 2022 10:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 03:03, Dmitry Baryshkov wrote:
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock. While we are at it, also add the XO clock to
> the device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
