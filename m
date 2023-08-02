Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 738BE76CE7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 15:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjHBNZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 09:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbjHBNZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 09:25:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D38DA
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 06:25:13 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3176a439606so6062416f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690982711; x=1691587511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddgIUD0rDs0iQp6Xqanj+k7iPT02ffInnJBk7Lua6Ck=;
        b=EULXtpMFcsKlQZhJVPGbXyLiKEPKcF3NQJxf+AQuGqBTwi0Dj5zyDx0cRiWLkcXE4M
         TqRPG/Qkk++0GBlN2s3W0mP2ynh9xKFcJ0fzbleo1n5hCjfpTuyPiqFpwNCvIM50aBoD
         /UluL3LkRuKkWngHIOvmn/MPEGzhoyPOQhZSaDVyA6hQG0pCRFjCiATYu2y7rajcxb3K
         tVFu4BkmtDg4Hb7pow/fLkosgzuqF14o+SWg2UacItLd6hpOX08AIBhkua7Z4BTIl22F
         e3JtJk5xuWAJGToaCz3GlU6+SSutUnoXW8vVtRTV9TB7EapHvKW41+kvgLXnImV6SNPi
         aC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982711; x=1691587511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddgIUD0rDs0iQp6Xqanj+k7iPT02ffInnJBk7Lua6Ck=;
        b=Ew13nst2xTf/rMWmABlsBxS4Z+UdqzBqD0a13bb/E32KYJBZs0w7v8WGVqmV/esI7v
         /0Z3FMrdCK54hoQIIWsk6V3kKrrWwu7QweSSzzDqfUo8dBHRn78FswiO0d8neMkxo/sY
         2IHvSXKuH0R4zEQQVbs2FExX7Y521OHRBI1d/HWfYHrmTwvZwRsWziWvZZi3cZ++EC2a
         AXScg87xoRvCAiUgRGs+KqL2WD9C6B2nm8zI3QxPlKewJ3PWgnlUdsSmDyDWMB9jtzKY
         b8MsdhkcFWRzHYBgriSYpv4yAS2+2bqEwzUnBk4CuHCPyjhAypqcyeEYrcBq7eckbGYJ
         b9GQ==
X-Gm-Message-State: ABy/qLYNEH2EcuxC3ntR2vPwQUdNNZCQ2N8ZR92KDmAQjG9wQ5q17dQ0
        2zsQ9ngbN1jIQqWwpsxTQtzVGw==
X-Google-Smtp-Source: APBJJlF+DX23Ld8SO0bcV6Ql0zWAZwCu2ab8PON1aICgTIDjoN/xCUztegRBNySWist4lv3d3qDacQ==
X-Received: by 2002:a5d:608c:0:b0:315:9021:6dc3 with SMTP id w12-20020a5d608c000000b0031590216dc3mr4435521wrt.27.1690982711521;
        Wed, 02 Aug 2023 06:25:11 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id s11-20020adfeb0b000000b003176a4394d7sm19071719wrn.24.2023.08.02.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:25:10 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com,
        stable <stable@kernel.org>
In-Reply-To: <1690952258-31364-1-git-send-email-quic_ekangupt@quicinc.com>
References: <1690952258-31364-1-git-send-email-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v3] misc: fastrpc: Fix remote heap allocation request
Message-Id: <169098271060.74094.14059863905248122475.b4-ty@linaro.org>
Date:   Wed, 02 Aug 2023 14:25:10 +0100
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


On Wed, 02 Aug 2023 10:27:38 +0530, Ekansh Gupta wrote:
> Remote heap is used by DSP audioPD on need basis. This memory is
> allocated from reserved CMA memory region and is then shared with
> audioPD to use it for it's functionality.
> 
> Current implementation of remote heap is not allocating the memory
> from CMA region, instead it is allocating the memory from SMMU
> context bank. The arguments passed to scm call for the reassignment
> of ownership is also not correct. Added changes to allocate CMA
> memory and have a proper ownership reassignment.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Fix remote heap allocation request
      commit: 098316374fead0383431cf678709f5609485ee21

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

