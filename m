Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E80776D0C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 17:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234707AbjHBPAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 11:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbjHBPAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 11:00:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C2730EB
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 08:00:33 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe2fb9b4d7so9984025e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690988431; x=1691593231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0B9n4BoQGKJhtTSxI1M2Z+FXSAxvxddim356lxqalw=;
        b=XJS29n863up9xj2aMoG3YHyatpMO/MPalREmBPW8nmjgU8KAoGPc6zDLYxXQMvFfZV
         0/Sa0BHc/4HI0Lr3csi3ksCJH2vcb81iO1GdGog4Qh37S2sXCWEaar9yXXayOCzmSK80
         Dtk/dR/z8/FesRPFXHZC/i69aA2RzbUPFjsbH7UNP6+pfWVwHZSakGyEk8zd75mI2Blz
         JRKR/MXIixEv8OVccVm0WQ2AjOzyVbeRBpNdTiEGlQ4nGpZi/FZedc4jKZxV14gmybfv
         Tzfm9heuJfx3sm0eP4J93tnup6IaCDRkkZsjF9qLYqe/qmZlDjiPEUWDvAUXFbSEEcG3
         drMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988431; x=1691593231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0B9n4BoQGKJhtTSxI1M2Z+FXSAxvxddim356lxqalw=;
        b=ko0E77qQHxHgwpUiDDy2tE7GTAdpUqLvFg79LA4hcgLLdypw5A83UrFq+AYwizuPrb
         +DSmaJHdLhsFmho1mm80VjTxnDdVeyOc9lO0vietrGivxR8EG8iQUkEzjpkCavm1+Rsh
         zoMv75FqehN7GQ2fv9Mr4nBMnV9zxeD232gUfZSx7YBn1vWbcV63xOauWcsj9HCePfPx
         um20w1y9khddPlwLYyGbBHyBmv/qMlYzWC62zdZTcv21I1irntgQSB8ueG+btQ4CdCdW
         lco8elAxPrWpT06IJEGhvDYI9GicyYEQjn6fKdS+Mss3UCbH9ErpKHAsp5ZzlMjsaWoo
         mpxg==
X-Gm-Message-State: ABy/qLbRpo0Z+8Cx41aLmqrn36zvmIcpIUKF5EoGqlzwgDJmgbpXdo86
        5YmjIwwiEn6l/NKte7HtaQJ1VfWr7F3kopIujS0=
X-Google-Smtp-Source: APBJJlH+CrrttCjxWTJuERu7b3+cTt1JRnzLk3CvbktL36TDbm3vLFfWOZaYR/yUbuuW2gtcsRc6aQ==
X-Received: by 2002:a05:600c:3644:b0:3fb:b1af:a455 with SMTP id y4-20020a05600c364400b003fbb1afa455mr4829810wmq.5.1690988431507;
        Wed, 02 Aug 2023 08:00:31 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id w10-20020a1cf60a000000b003fe1afb99a9sm1918418wmc.11.2023.08.02.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:30 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bkumar@qti.qualcomm.com,
        fastrpc.upstream@qti.qualcomm.com, stable <stable@kernel.org>
In-Reply-To: <1685972918-30371-1-git-send-email-quic_ekangupt@quicinc.com>
References: <1685972918-30371-1-git-send-email-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1] misc: fastrpc: Pass proper scm arguments for static
 process init
Message-Id: <169098843059.77085.12739943578767946779.b4-ty@linaro.org>
Date:   Wed, 02 Aug 2023 16:00:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 05 Jun 2023 19:18:38 +0530, Ekansh Gupta wrote:
> Memory is allocated for dynamic loading when audio daemon is trying
> to attach to audioPD on DSP side. This memory is allocated from
> reserved CMA memory region and needs ownership assignment to
> new VMID in order to use it from audioPD.
> 
> In the current implementation, arguments are not correctly passed
> to the scm call which might result in failure of dynamic loading
> on audioPD. Added changes to pass correct arguments during daemon
> attach request.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Pass proper scm arguments for static process init
      commit: 64227235abd9a3ebfb5927dff2202771ffc92b8b

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

