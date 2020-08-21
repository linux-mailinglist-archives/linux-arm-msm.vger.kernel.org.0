Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1594324C910
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 02:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgHUASv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 20:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgHUASs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 20:18:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B611C061386
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 17:18:48 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e4so56207pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 17:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=s+gefwGGLS4RZ9aAtxwt9F/Q7T9fxHVOG5Dd2Edw1yI=;
        b=a925dQD7UAnI2WEHBuEp1k6vs46a15EXpwoO8/XlJ2KVU7wPk+MkHan4VwcKlaJ7UT
         j5OgC4nnfa03FnISqr4Pz0w98qcVngy8HTRZ5tGwyTFBFsLslNIIE4JkLP0ozADvhQGx
         NcGR0SsMTlfRtOjLWJyfTfIaXNw9PBCWPqYxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=s+gefwGGLS4RZ9aAtxwt9F/Q7T9fxHVOG5Dd2Edw1yI=;
        b=WHG7JGY8WTXCij5wbBlVs+ry/gJpIL7B0wnVGQoQFWrjfPCu12YrI5lyK4aDsFXqa/
         /Uc7jBJCJX9qGuAOvQoKAlJl+6H1EwwZfapQ1u0VclHEo2sxIzuJ5EC+DaJRk9jHhpJC
         9FdqCG/DlsHG3OcTpmTzkNV8NtXhYNqPFtvu7XggrpXIr05soBNbr+S0Pqt4t2fGw/7d
         MyfR/VE8g2v1VLIqBMzbLn/pM2iHSmCij2EdPQ0ZW6kWZmEC2eLimOkVB0oV3ErSmMPH
         aFSY/LC/MA5+XEXAuQVjZdg1LiZLTYCiqXm1nc0UXUG8jGReZtE5hVWtoX8XUErt5aM6
         /Ezw==
X-Gm-Message-State: AOAM531UIbDlXGVAj7CQ9oFjPue2rpqpD2vzIq+/iqhgA5MWKZFTgPB9
        YQhYCgL5bhQRoTMMOM7mpw1ihw==
X-Google-Smtp-Source: ABdhPJycAJIRRlSrBG3gbwhGKoE6fAYeLdDcGy0d95wxs2vWn2H649ZQ/s3tg7y+5yjnbfnHBOKx8w==
X-Received: by 2002:a17:90a:1749:: with SMTP id 9mr249662pjm.127.1597969127726;
        Thu, 20 Aug 2020 17:18:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w14sm221421pfi.211.2020.08.20.17.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 17:18:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200820103522.26242-2-rojay@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org> <20200820103522.26242-2-rojay@codeaurora.org>
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in geni_i2c_dev struct
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date:   Thu, 20 Aug 2020 17:18:45 -0700
Message-ID: <159796912574.334488.10846610259602895929@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-08-20 03:35:21)
> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
> data scope. For example during shutdown callback to unmap DMA mapping,
> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
> and geni_se_rx_dma_unprep functions.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Can this be squashed with the next patch? I don't see how this stands on
its own.
