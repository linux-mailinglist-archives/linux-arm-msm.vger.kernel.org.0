Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC5A7BD304
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 08:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345157AbjJIGE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 02:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345162AbjJIGEZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 02:04:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA77C6
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 23:04:23 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so37726785e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696831462; x=1697436262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D1j0XtgOvX30/gRp4DtEdqnCV/Zs7HHjT6PoWoSaoE=;
        b=IZx9twKQtlC37eBirIc9TTcS262kze3QC+mcQnsVLBw5U838/hPO5EzyDbQd774pMn
         wKfFxkcVPBdBymIp/DWnxQcxJNfAnrICUGiV36UBvZVNOuBpNsajWEKTUnb8aUminLqi
         1hi6QRI9W8i6V9HU5e1TBsJupB7rO3iOvY4g9ltnnaps4HxaLnWx/dy/CJphfHALNhRt
         yeH5gHo1w2hk7Oiv6K4WR4+dSNRFluLjH38i6Ugqt7CtfML34iyUamMaD0dEFtZQ4IRq
         K9yK/DwlMJBiGQYBUey/MqBFy+YRVL0OYjTxz2+I8/dgx0vM5AoBcWZv4y2TpWBVAKRW
         yQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831462; x=1697436262;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3D1j0XtgOvX30/gRp4DtEdqnCV/Zs7HHjT6PoWoSaoE=;
        b=WdLcR622rgYkZDexJVo2QwJZ8/ncn5hphPywTOrA6hNRiCxTXXSqJgHJiSMtBaxb10
         Zkg9co4EWGwR2sIz/kybxYdnDJXr6265aYD3baaUEft8D2YlpPSDd31a1rjlN1gEhftk
         kuR9nm+ebBAhy8mI+7MxcSCpT2Y2k6xz2yMLqgm3YdkByj2Tyx4avcOgtzctMQBL5kX7
         ZtBEohDpDYuPDRo5B5Cb5jm54moKzhjvSVpeozCRZepwl+U6iCZ3Wc+UkfQIR80vclwd
         LoaHxTXIPROYdeovAaKy0Mt2hwnj5SfBgzNWct+3plC5mmrhVsSL4GVj8vt5Ch2XpLNK
         jP9g==
X-Gm-Message-State: AOJu0YxVmO1SJGp/NyUGakTAf3+FrKGDtdVC0HdsVH0bh95YWx8gTuwN
        LkLQUvdZzEDz2aVcgkDHIZFB/w==
X-Google-Smtp-Source: AGHT+IGc8hYTsUAn6ulIBTm07wFW1aZr0ZIs5AL4Jljrdrj8xadtrAEDNqL34RipbyyssQg/l3ofJw==
X-Received: by 2002:a05:600c:2299:b0:3fe:1232:93fa with SMTP id 25-20020a05600c229900b003fe123293famr12404659wmf.22.1696831462066;
        Sun, 08 Oct 2023 23:04:22 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d66c7000000b0031fd849e797sm8495088wrw.105.2023.10.08.23.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 23:04:21 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
In-Reply-To: <1695973360-14369-1-git-send-email-quic_ekangupt@quicinc.com>
References: <1695973360-14369-1-git-send-email-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1 0/3] Add fixes for FastRPC driver
Message-Id: <169683145891.96669.12483948623386373916.b4-ty@linaro.org>
Date:   Mon, 09 Oct 2023 07:04:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 29 Sep 2023 13:12:37 +0530, Ekansh Gupta wrote:
> This patchset carries the following fixes.
> - Reset metadata buffer to avoid incorrect fd getting freed
> - Free DMA handles for remote calls with no arguments
> - Clean buffers on remote call failures
> 
> Ekansh Gupta (3):
>   misc: fastrpc: Reset metadata buffer to avoid incorrect free
>   misc: fastrpc: Free DMA handles for RPC calls with no arguments
>   misc: fastrpc: Clean buffers on remote invocation failures
> 
> [...]

Applied, thanks!

[1/3] misc: fastrpc: Reset metadata buffer to avoid incorrect free
      commit: c44e396924d307ba11974b5f131e956b789a6844
[2/3] misc: fastrpc: Free DMA handles for RPC calls with no arguments
      commit: 3f01aaeb9fd387108c04c4803b949b8cd84d43ff
[3/3] misc: fastrpc: Clean buffers on remote invocation failures
      commit: 9fffb8240581927a71ed0ae46a5e269dbc0f3e3f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

