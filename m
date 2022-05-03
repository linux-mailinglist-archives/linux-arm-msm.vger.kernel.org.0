Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1899518751
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 16:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbiECO6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 10:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237489AbiECO6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 10:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 126DA39693
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651589658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=83wy3D5dt5Ummd3Bx/sB0t7+Cs+0z1iy7in3UM+60Qw=;
        b=eCChCy5axckHo1WN4R6I/Qdhse1W6TnD2UPD83ctYrF02xrV/c3uQAPC/dynNNlKVqLkes
        gGbday1QqSLC1ES2nn20wD0Jfn3ftx2fasA6wy6phjWpyX4JNUGcPSYoBIMplxfCk5mFW7
        obZL4SXNahLsq9QqBC5N9FmoTW+Zj8Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-t9i18t6MPjqLXCOx92aL_A-1; Tue, 03 May 2022 10:53:46 -0400
X-MC-Unique: t9i18t6MPjqLXCOx92aL_A-1
Received: by mail-ed1-f69.google.com with SMTP id cn27-20020a0564020cbb00b0041b5b91adb5so10080227edb.15
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 07:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=83wy3D5dt5Ummd3Bx/sB0t7+Cs+0z1iy7in3UM+60Qw=;
        b=x1urU5K70xiyaqSZiLuCFFgwrLfRRoYR1YrEkU4gYFF2JJcvt9A0k6KlW0ndWpU/Vr
         NyyG6oAhvgZmlt7eW/ngQjEHcYt4XjK/hwW+hxzszuuFrLMJgL9/QbispoCJt6fBtY5C
         ie/kbcM7lpIRD6/YkVPYz7FohgXfPYVinwu36zmKYLiwDHzZd9h4pglCHshVLEtSOIel
         DSJoFMcQNhX96jApDVKG2BrDxTvkflyr8mnWDoApK6en25gTk2ksEln/M3n2phzPL+TI
         PrHrht/L+W3vxD+Z3MIHJPLByBw56DLCRZR0PgjNY6X7LVQZgl6r0AywKJcgCHFALgS6
         Bkyg==
X-Gm-Message-State: AOAM532/QFSZRwuz0kIsL+E1yOwvo8mzLqMTSv0cPQqIRz8cKwZL8qqg
        /qHT7xjSb3rA8febjxrOH+6k/taXdZTqIaAkRROtJzgN6c+61E1lgd9mYvvK06fyXFfyJgpycy9
        CRKUxm1ucTK5wv1DYff0qPStxSA==
X-Received: by 2002:a17:907:1623:b0:6e8:8678:640d with SMTP id hb35-20020a170907162300b006e88678640dmr15141682ejc.189.1651578613928;
        Tue, 03 May 2022 04:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgDSCmimGS4eep27PTOqrwdW6NzkICeJYxvlFa/x2oEMAH8qT4xJYqw/QzH9kG9LMxlrJyzA==
X-Received: by 2002:a17:907:1623:b0:6e8:8678:640d with SMTP id hb35-20020a170907162300b006e88678640dmr15141658ejc.189.1651578613740;
        Tue, 03 May 2022 04:50:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b106:e300:32b0:6ebb:8ca4:d4d3])
        by smtp.gmail.com with ESMTPSA id m21-20020aa7c2d5000000b0042617ba6395sm7740445edp.31.2022.05.03.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 04:50:12 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] crypto: qcom-rng - fix infinite loop on requests not multiple of WORD_SZ
Date:   Tue,  3 May 2022 13:50:10 +0200
Message-Id: <20220503115010.1750296-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit referenced in the Fixes tag removed the 'break' from the else
branch in qcom_rng_read(), causing an infinite loop whenever 'max' is
not a multiple of WORD_SZ. This can be reproduced e.g. by running:

    kcapi-rng -b 67 >/dev/null

There are many ways to fix this without adding back the 'break', but
they all seem more awkward than simply adding it back, so do just that.

Tested on a machine with Qualcomm Amberwing processor.

Fixes: a680b1832ced ("crypto: qcom-rng - ensure buffer for generate is completely filled")
Cc: stable@vger.kernel.org
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 drivers/crypto/qcom-rng.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 11f30fd48c141..031b5f701a0a3 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -65,6 +65,7 @@ static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
 		} else {
 			/* copy only remaining bytes */
 			memcpy(data, &val, max - currsize);
+			break;
 		}
 	} while (currsize < max);
 
-- 
2.35.1

