Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34AED74E6BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjGKGGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjGKGGA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:06:00 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C06E2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:05:59 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3141c3a7547so5455996f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055558; x=1691647558;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aesAxzayxM+SEzglJ/Ypflh+S53bG0sURfwQo/p3I3U=;
        b=t2Yr+QWSR/YsSFFbia2YGAW7i8T8cWbZ/PRnB7BOcF91pQBS1Pv4nH0lk1C4uN5zNP
         q8pxUAMP/bKvbPykAlCZ+oyTKVG8/fXcT1fgemVTvp2NSJSS1nUxSNNdIZjuEiTqTrZq
         +9448VhPoeUmKcQ/lyxrNpUZH80KVThUiOPLs5gXk+/sILsgj+CFfQayWEzCs76AQ+ST
         b4gIzo9zbw6BuQurVJzvqcltiICv2ZDNDpFafKXClPQ3QDeLWbtatdys0U5XKTFC9Lnp
         8sQUWAhNd1XS6nxFpIlRIX/ENya9QRZD6LoIWrihNstyeRBO/TkhJWy2awk4qy3g8Ku3
         3tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055558; x=1691647558;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aesAxzayxM+SEzglJ/Ypflh+S53bG0sURfwQo/p3I3U=;
        b=f9tEGhAV9mtUVlBDPF7HCLztmAewRiXQFJQkTe76+C0jZqRhiIse9z0CaA/RGd5L6k
         cMalSjgiwpQHzKo3o9e9yaXdx2JJxHJlRjfnfQuOP9w3qJj8RHNBvQuEd0QRzLF1K7a1
         q5ZXJxJ1koOiowdogXKb3i6VF9pd4Ad2Tq3zJvFM4H6a6ud5q3wnXb40dQVMvW6KPont
         GhOUMu58rPa7WiM358Vv924dMmAW8WfaxAZDluTF4eIiWRuxRHX/E5qmYvNVBZZpkbYX
         Wr+pLfH8SfMQnMm+LOBriyzVrJSiPgG8hMIl5V25Av7V+ZoIb82ybD7Lbu/oZtNrGmVh
         tMAg==
X-Gm-Message-State: ABy/qLbJQALi6ZZeb+DD8Gcor3ymkYt99IzSn7OzIhnG6VpZBEsfpnGh
        ZaId81yKGK5zOJ91uVriZCzOSoeUh/DMbw16NmE=
X-Google-Smtp-Source: APBJJlFfvQKMGo1BcUF/1jUzDWo/C/kzCrN7OGJnmLUAWv27PZ4FeGr3LtF0Y+Pi9vx5yglpnCDqMQ==
X-Received: by 2002:a5d:56cd:0:b0:314:1a2e:1af5 with SMTP id m13-20020a5d56cd000000b003141a2e1af5mr13831401wrw.25.1689055558077;
        Mon, 10 Jul 2023 23:05:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d5510000000b0031417b0d338sm1247851wrv.87.2023.07.10.23.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:05:56 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:05:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 0/5 v2] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <ZKzxP8iX8Op0lYvh@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
