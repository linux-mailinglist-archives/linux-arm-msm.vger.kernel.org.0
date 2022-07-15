Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C4D5767A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 21:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiGOTpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 15:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiGOTpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 15:45:03 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C3F61103
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 12:45:01 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10c0430e27dso8348978fac.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j7iV5fZyqzBzONfFQXTxDBvEEIXYMTwYFhpV/bb8XwM=;
        b=xoKRsOEjKyeuf+T3RWfA08s4IkprbGLQoDcQWPvQJKwl2hsiVr5HDdIOvVbfNinDRd
         LRnYVyJVcJxeH8WJHznR3H7vb7WuyHs4F/p0bAlGnNRWhqNbh+5h8EwYP2IrKsBpY9VA
         TLQjcl2xc/cSU92U3CSSG74vuksh3l47MDKFqr3AWMAlv3dXaY2vmj81YcJbQUgOVJph
         9MXzMcTw9BRUcm2IYBt3qLYA51wIDC7DyMKWB6qhazfW5u0xv4cUfdRrbsQNiPXIfk73
         qCAS1fN3hHGBeVfMldztpkngbpox996y/PopP3EcjHq6/3NV5iameRw1kXM4gI5MWdBT
         TWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j7iV5fZyqzBzONfFQXTxDBvEEIXYMTwYFhpV/bb8XwM=;
        b=Md5/C8P9+EJdHfQbyDkXthZhSxvnSQtPt+hBGHTUjy6HTj7M0wzmVbAJlsHkyaomvi
         WgHhQB69Ri1fz+3+2xUotHuE/8R58WD5em7r7Tq7CkS5TrOwHR1VZVSRDp+F6qPvCxK/
         c5GRqgca0jqfRNOYQopYj2aPVwPvopZjLbwdeFzz37Ddd5zKjGj5RL0f6ZRCK1RbaUpt
         YUFqCTNKrWwGP1EmS1T3u2Kx7GlpngLDAOhuI2MuS7PQTq3zVA8lyXI+k0B/zpveNZ16
         PbybfXMPun0l0A9f8JseeOtm/T4j7GnoH2rC7c6+UbTx3DRRW+Lc633pcGTrmMVhMwkX
         h9RA==
X-Gm-Message-State: AJIora/7M6I0vf2ja9+GD/UEwICZnjfEMKJAJIaW6HSnC1VGHmimhpB7
        VBkN6y+VpT1IJFIHEYWIjUuMRQ==
X-Google-Smtp-Source: AGRyM1sskKQ0hJm78u735uQuGOkhmNrWDPCf9RI2vIXZ2XPg/ePj60Ym3aKl6BYA95MoLNx2ET8bHQ==
X-Received: by 2002:a05:6870:96a7:b0:10c:712:58c4 with SMTP id o39-20020a05687096a700b0010c071258c4mr8551462oaq.198.1657914300183;
        Fri, 15 Jul 2022 12:45:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r8-20020a056870e98800b00101bd4914f9sm2779380oao.43.2022.07.15.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 12:44:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [V5 0/2] Add support for proxy interconnect bandwidth votes
Date:   Fri, 15 Jul 2022 14:44:58 -0500
Message-Id: <165791429375.1604685.12160759168768291168.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1657020721-24939-1-git-send-email-quic_sibis@quicinc.com>
References: <1657020721-24939-1-git-send-email-quic_sibis@quicinc.com>
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

On Tue, 5 Jul 2022 17:01:59 +0530, Sibi Sankar wrote:
> Add proxy interconnect bandwidth votes during modem bootup on SC7280 SoCs.
> 
> V5:
>  * Improve phandle-array schemas [Stephen/Rob/Krzysztof]
>  * Add more details to the firmware-name/memory region string array [Stephen/Rob]
>  * Drop 'items' from label [Rob]
>  * Drop the patch 1 since Bjorn picked it up
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom: Convert SC7280 MSS bindings to YAML
      commit: 3abe6d654288553de0bf41da1491cfeee83777b7
[2/2] dt-bindings: remoteproc: qcom: Convert SC7180 MSS bindings to YAML
      commit: 5eb1c7def66349a5c3a80b7d450d0ed1f56141eb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
