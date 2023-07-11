Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA6874E6D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjGKGIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjGKGIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:08:46 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F531BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:08:44 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3142ee41fd2so5351141f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055723; x=1691647723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8werb2SBWZr7v/sXzjx6gnxExhvkujqij807vJmKy30=;
        b=pwQgrr3VfqsIgF/yJ9EbzF2OfgeC6Kk4wADko02rM0LorUIA27+Ha3kMJunYExsAHp
         /4lsB08oS/IAr8GtrR+eZcR6LuS7x6a7s8KSxXB+1JKNhPeT068p58oK/dY6rqN3zHJ3
         CReWuhFXLVqk8UBZODqoGHRgLsAu51i+i12gHkSJI0pAKmHX9nyd2KRNrH17ter1e5Mp
         qpKrfP+jE43bNmqtEJKVNZ/xCqTIHlz86unr9juLo6T/ECDGE/YsbM3YiTs5KQDxY/Ir
         qguM3gjnEzREAeoYzQ5AUmN2ShnmdcTEaOUPhBmoKh7WL6A5EYZzCPV7Bx8pPjm5S7wA
         NHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055723; x=1691647723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8werb2SBWZr7v/sXzjx6gnxExhvkujqij807vJmKy30=;
        b=W1nouh5XPW357qAC81/k+BkqJfn8sBhOzUwlfSGQfkGhDbuPOQlRvFKlNzfJFeduBY
         TCWvzsVXiUjPbEGMuvrI9VpsLGkyIo9nFSYJOk4Natr3ErAnNnlqiAyAEZQxfGGjYk3H
         92xM9o5OKDaInz2M1ky9uyr5kC5NEPCmOj+hcZCLcTHRFeWObNPfWMyrxJWDzSrk1/H+
         jv8lnq070HJEp9oWw2HmGfeay72FfnYwTdC1cOb52MQChcFBzu0Y/TihHxIOXq4X58Yr
         XbRvpxuBWdfNdtAKpgPWy8qNmBkKEquwiDdyq4+T8nMZ3g0+inXMGkWPyv1DFZ1VJja0
         z7ZQ==
X-Gm-Message-State: ABy/qLaaeADkID+Q1w757dPgloXorbTM+Nm15V0cbZAkcfiJbgKQi1v3
        /CO5QnLzwPyRQPWJOnBP+l2hGQ==
X-Google-Smtp-Source: APBJJlFnfJolRPMMeoYKAGfu5dCjeSnPio4DalzndKJ3lrBfZ4HJWeBfTMi4c1ww8WbLyIRRzLI9iw==
X-Received: by 2002:a5d:4b87:0:b0:313:e3a8:b47c with SMTP id b7-20020a5d4b87000000b00313e3a8b47cmr12330315wrt.8.1689055723407;
        Mon, 10 Jul 2023 23:08:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d4b82000000b0031432c2fb95sm1251399wrt.88.2023.07.10.23.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:08:41 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:08:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 0/5 v3] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <ZKzx5nA6Z/0yhBJj@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed in v3: Redo messed up threading

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
