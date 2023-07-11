Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C223F74E6D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjGKGIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjGKGIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:08:07 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22444E6B
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:08:03 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbf7fbe722so60636125e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055681; x=1691647681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ylMkhP5iApXqUlg2Qp54MKEXiwYX+p46Gaz2A+cIsD0=;
        b=FsgY1ZT2rRl+7zR2oyCxnQKtF8FkyOuc3KiCGv+HxNmd9b8YJvv2nR3YdABt+GQXDm
         D6fkbZrTxLjPduhuM8/J10pt74OBHR29awp2zygJtnpWbjRWKq9NbsEunWfEKTxqO/vl
         0CH1DVov289fSxjVCsqS2fCo9srbIGc08/f3lmE9uEmew89VBl0SRqspVYa3/Uj69l9S
         yUC7TX/sb2K11xvQMgXWutueqg1OAtvgZGhifykhwgaqoDfnH+AHMPxDsKNXn8Tl60K9
         L5ZGe7+P2n/sHO9J749RASjwdD5FVzlEfWb6cPbAjv/zxg8bmUn5nvoZXYVO0DFJl4PZ
         sEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055681; x=1691647681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylMkhP5iApXqUlg2Qp54MKEXiwYX+p46Gaz2A+cIsD0=;
        b=GnFUuEsw7rXegwCeCzLv9lgEVgqufRSsGTQoDKEQEr13ij34RSBGIRLKzZmwVNwnGi
         KnmncCIeh2hzfv//KwfGIG+zMZJjhKtlBbyhG48Pgoa0UccC+zNOqBerWpF6L7mmiEJk
         1Ghpxmt5JcOV4zWJU7VGgdWgU3IpWAj+rgMORUeYJjTzvSn+AjhybBD5yU5+625vhMXs
         8yZSKRFgy2oVtLWRd9ABMuCsji5AeYdlW/vV4j6nH7EVnwQugVU9+jyV1KXqIYVfdatz
         R0X1ChW1JiyycqLPON/hXFq9DhJTGrwUlY9B0/XFT3iS6iBpyW/HPzLqyzTVx/3La3vD
         4cyg==
X-Gm-Message-State: ABy/qLaHJ8qWYTfYe9WmzvYrAoHpzlUweTBqfLpnO471x4WU3lAE+IQr
        51vWwV3PnHMWhGBmC85lBpebrQ==
X-Google-Smtp-Source: APBJJlEu3vGunYmloCnFe4G0ic4Cf6SKC/3Yc++PBYxfbIesl5w5Avpv1N3JTMG4cUKE8qkhSw6F+g==
X-Received: by 2002:a1c:6a04:0:b0:3fb:b9b7:fb0c with SMTP id f4-20020a1c6a04000000b003fbb9b7fb0cmr18270975wmc.31.1689055681338;
        Mon, 10 Jul 2023 23:08:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u9-20020a7bc049000000b003fbc681c8d1sm12043925wmc.36.2023.07.10.23.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:07:58 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:07:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <627f10fc-6f09-44ab-9c2e-f5615a86f080@kadam.mountain>
References: <ZKzxP8iX8Op0lYvh@moroto>
 <ZKzxXhtwqYvoat8B@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzxXhtwqYvoat8B@moroto>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Oops.  Left the v2 out of the subject.

Let me start this whole thread over...

regards,
dan carpenter

