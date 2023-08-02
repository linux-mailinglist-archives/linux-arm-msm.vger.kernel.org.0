Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C752B76D0C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 17:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjHBPAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 11:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234652AbjHBPAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 11:00:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E359E1BFD
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 08:00:08 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso7193565e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690988407; x=1691593207;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EH/qoegRHnu+b8cDz/dAxuYea2UnuHQevVxVsME5zDE=;
        b=cg/AqtTBjcSV1POS/R+K3T9D6D959LYVz9EDSHG0z8h31rpvPfkTxOlOfXME6wfPU0
         fFEbcFmYLGE4y3tPWmE1O01eKQZdzy2afIc+j2F55AJGxvYTQibjq9tHDd4O1KnLkkPJ
         /huz0fhvd007cO8R/jnxmV1w8VDkzGyiE3nxVeJx7M8zsq36aTFqqUqF5Xkl/BJdQ+G9
         a8ivIi/AAS+fuBqW3MGRWxBapI3zpXp+qy5uc1rpkt6rz3wqHqlN0kof+Bvj8qbUvJed
         u99T/YmlEp1XGtVczNAszJih7vjUNiEzFixV2YT1J68NVB8slxQl4eWrjE95SQDJBof1
         ds6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988407; x=1691593207;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EH/qoegRHnu+b8cDz/dAxuYea2UnuHQevVxVsME5zDE=;
        b=O009nW2ABAfPDPpwXHCdIGHIHH4oDmx6kv/ezE7kWZPHIqQVSOT3wDXP+5bmXYcCWY
         8ao+8lepCy16R9QueMHEC6k+3NBiVxOyL4CvCMfFe3JJEWI5ClRMP5Imr/CWdK1fWXn8
         CFyFqsnhjLT/VqlIfUQmUcjOLeVqlWKCywbGqCL9X5mRDrYvtOqzvyMaJ4BrNZqY4pqc
         sk7vglDGEKn9jfXl42KD6YZFxFPN8q09QuM8Y6sRImQsM3ENHPXRgVC4geCLYjGAv6+u
         2E9ALRVGvAkr2k9S+475xJRfq9i7t2fbKrGVpF9m7HVVUYUquyQKMKIvycDIV9lMnjLP
         plPA==
X-Gm-Message-State: ABy/qLZL2Ipe2fxtIvXuV+M2JiIjLHhhSHqzTlFXFlGecH2vQxKDVV9b
        f6HMHTRrSEhncq21iw5KlON+kA==
X-Google-Smtp-Source: APBJJlGnlpiErGS8FzQdyQBwLIDnGemOvU40eJ7NKOtGO9NFZ2M6zJQqZKx6d4fN3t/cngq1FDDBsQ==
X-Received: by 2002:a05:600c:1d06:b0:3fe:3389:122f with SMTP id l6-20020a05600c1d0600b003fe3389122fmr1667528wms.1.1690988407271;
        Wed, 02 Aug 2023 08:00:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id p16-20020a1c7410000000b003fe263dab33sm1904438wmc.9.2023.08.02.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:06 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com,
        stable <stable@kernel.org>
In-Reply-To: <1690984656-11761-1-git-send-email-quic_ekangupt@quicinc.com>
References: <1690984656-11761-1-git-send-email-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v4] misc: fastrpc: Fix incorrect DMA mapping unmap
 request
Message-Id: <169098840645.77008.10424849723734584416.b4-ty@linaro.org>
Date:   Wed, 02 Aug 2023 16:00:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 02 Aug 2023 19:27:36 +0530, Ekansh Gupta wrote:
> Scatterlist table is obtained during map create request and the same
> table is used for DMA mapping unmap. In case there is any failure
> while getting the sg_table, ERR_PTR is returned instead of sg_table.
> 
> When the map is getting freed, there is only a non-NULL check of
> sg_table which will also be true in case failure was returned instead
> of sg_table. This would result in improper unmap request. Add proper
> check before setting map table to avoid bad unmap request.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Fix incorrect DMA mapping unmap request
      commit: 3042d44f7e49c74f2928b4780c66564632449bab

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

