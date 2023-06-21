Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68817737C41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 09:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjFUHVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 03:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjFUHVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 03:21:21 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4281186
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:21:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31129591288so3815689f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332078; x=1689924078;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8Qxh2dT/vwmYCb8MwuNXPbVaEQPUFjJDHObAtD1Tv0=;
        b=ZfXGWQRSl4/XvBX3iv+Rh/4qYvqpdCuRzYsg8C2NverEOCaCnpi3ecSOWQ0UoImMUl
         Gu1kywphP0el0ZT7nUq6CEIBna70laq8q3Ry+fnYkaDngMs7rJstJCWwUdMvbjpDvXH5
         e9MnKB0KebdorG5JwPVJXu40zDYi8xtBhdhLNDpCSpG97++FXB5zq9XQ6/RCcRTos4LM
         ANiy3a0CE1hvSFqDBCvcga0xjEya9vc6XXdSvGKaIz+aZzlX50BhKtZoAbJvMpcYl/2T
         Ht/Fk2fWo6jIbHV4TFToiz7RE7tKYKkenPYnY+qERubDNhdObSJNsm5gRcIwOC2DsAdR
         Z80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332078; x=1689924078;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8Qxh2dT/vwmYCb8MwuNXPbVaEQPUFjJDHObAtD1Tv0=;
        b=KhUmt/b54i5bUkynlUrOHVSlXpgGrIgkl7VjTbXgEh/RwG85O30QiWTg2i7kc0KDBJ
         lzHUfCrRhT52LsWgk8fNu/OBOGK0Rd2k6XVkAAP5W6LToWITjywsj6RWFtPLgWm0mu6M
         EhL63TEY+9N9/hgP9puWSeu7wsBgfooiEsmGwOb+M6P0Po1q4uvsT0BcoPLzQ94ikzIZ
         xBfn/17oqkXcB/YtvaZ2bcPEBULk2wP9COuc3m4AiPyzGFMng3dBRuF+FhjlO51nABBE
         wtcc71Zjxx46ey3tXHgzz1hagehDdj5Xfanu1RA18C1MGzria7Dy+B69SbYKRndlzl6p
         54jg==
X-Gm-Message-State: AC+VfDwJ9SqsTk1dNI6rsE3CxRCgEuLE9b5sgPrVqc9dBV4r4mV9Gf9N
        mqiwnEflXStHavhX/dh1yixpMFq0koUEdgJTeqU=
X-Google-Smtp-Source: ACHHUZ6XpM6zbQ+qRrWux2KVECElKBl33INbEX4v/GZyD4Exilk6QiXFk7yV4s2Fau3BgEusHee8EA==
X-Received: by 2002:a5d:5960:0:b0:30f:c56c:b5b0 with SMTP id e32-20020a5d5960000000b0030fc56cb5b0mr10339083wri.4.1687332078132;
        Wed, 21 Jun 2023 00:21:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d2-20020adff842000000b00312793cc763sm3735043wrq.15.2023.06.21.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:21:16 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:21:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 0/5] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(I think this is the first cover letter I have ever written).

These patches are based on review and not from testing.

I found it quite complicated to track the buffer sizes.  What happens
is the qaic_manage() gets a buffer user_msg->data[] which has
user_msg->len bytes.  The qaic_manage() calls qaic_manage_msg_xfer()
which encodes the user's message.

Then we get a response and we decode the response back into
user_msg->data[], but we don't check that it is overflowed.  We instead
copy seem to check against msg_hdr_len (which would prevent a read
overflow).  At the end user_msg->len gets set to the number of bytes
that we copied to the buffer.

I'm coming to this code brand new, it's the first time I have seen it.
So I don't really understand.  There is an element of trust in
msg_hdr_len but then at other times we check it for integer overflows
which indicates deep distrust.

What I'm saying is that there may be more issues in this code.  But also
that I don't really understand it so please review carefully.

The patch that I'm least sure of is 4/5:

[PATCH 4/5] accel/qaic: move and expand integer overflow checks for
 map_user_pages()

regards,
dan carpenter
