Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C8F50BD55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 18:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449790AbiDVQqq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 12:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449796AbiDVQqp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 12:46:45 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F155F27F
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:43:51 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id s17so12027833plg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lrKucvMjSEAYeo7mkhMZ89mS7UtYq+5fiKLotEll0Iw=;
        b=KJqOFGiRM0NoHulPxQlBIdD5xIZKHn7rLOHYGLO9xNeOZISRGETPx4SM4vR6ydbqQA
         NI4y5TDJw/7+d23ChXN4YvavOzE+5oJzv4i9PzLVqP7sNX2bmqclW5x6lh8rqlu2KJL5
         8FNEYQrqe5lOTmuphrkrX6qyhv2KzOWkRgTLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lrKucvMjSEAYeo7mkhMZ89mS7UtYq+5fiKLotEll0Iw=;
        b=FG7oLrsUR9CvsakOqa3c4LBBZpnYqUXgY45KChRJuvGk3DDe+ELrhQL1Va4/iRJfRH
         4o1tsDI4aQ31jIWiQsUu2Cy+Lixjwr2rHeIHip9kgoa0xN1TAtvFiNcxjHxmVtg2PYNq
         mynqvnwswuwj8RUWMSCVT+t/Dx7T9MHPiUKPGrTE/Vgc1Fb3SD406bfgIgj1LT/ZVEnI
         hX7Bt+ZAtrkgm9sAZqbiupTfF23bGhInIQDMX7mjawVBf0AF6Tm6ctf3zoPRK7OObcJD
         7pxBfW5mYNQI65zhuM1n2AmTlU4ffP/LWTBSf9QU6NaRmdnxybdrE+6QJfjnaBseYi4L
         w3QQ==
X-Gm-Message-State: AOAM53386l9WCLLp9ZClRGvZaS8TJLVTgrVspWDiNVAiDOpVBeZTpfZW
        tFdyYSlRBVbTAal8NJJ13X85XMK66R//2w==
X-Google-Smtp-Source: ABdhPJzooajiMzsvQqp7dhjoexwLfBnInq7z+C+wddLwUGAnQiW+4w6W3wlFS/U/eCy66izJHmZqHQ==
X-Received: by 2002:a17:903:2342:b0:15b:f6ff:79f5 with SMTP id c2-20020a170903234200b0015bf6ff79f5mr4055976plh.128.1650645830359;
        Fri, 22 Apr 2022 09:43:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:404c:8721:29:87a4])
        by smtp.gmail.com with UTF8SMTPSA id j10-20020a17090a94ca00b001d792761e2esm3819628pjw.47.2022.04.22.09.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:43:49 -0700 (PDT)
Date:   Fri, 22 Apr 2022 09:43:47 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v10 02/12] arm64: dts: qcom: sc7280: Enable digital
 codecs and soundwire for CRD 1.0/2.0 and IDP boards
Message-ID: <YmLbQ6e12+t3ZRWQ@google.com>
References: <1650636521-18442-1-git-send-email-quic_srivasam@quicinc.com>
 <1650636521-18442-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650636521-18442-3-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 07:38:31PM +0530, Srinivasa Rao Mandadapu wrote:
> Enable rx, tx and va macro codecs and soundwire nodes on revision 3,
> 4 (aka CRD 1.0 and 2.0) and IDP boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
