Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF54AE331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 07:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfIJFDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 01:03:09 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:46414 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbfIJFDJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 01:03:09 -0400
Received: by mail-pf1-f178.google.com with SMTP id q5so10782539pfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 22:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n8Vrl5mJmjnsLEgBYsQ6MsC9BB9unUrTHWpumQhnshk=;
        b=sBKlFmzOoRXtl3SPETNOdAACqmDHW8vhBaCbMB2ytAZJXqHLVnUUMFoYhg/T12Zto2
         G0pa7t8H5oEpudch3L/4ghueLja+we/8bEc6HSw9tP0G7wP1My39EzffPXdc5rHpUW8L
         Wq5vs+P+vx+le9jSIZoxwD/KATIz/qdahX+rJrJ9cGa08ceMROcDDenfC4YR1Zy+6lN7
         jlCCsZ15nVns4ht2N8ZCAg/GcjYze3Wp/LXN3y32itqMfWurkFp6085JZMb2Q1K3R8Aa
         v1eSPchvMNNJ/4SwYF4LUYJAL3ApoNUjk/shSxhvWbjxXd4QHLM0try1C4WesIi/zWTP
         ZdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8Vrl5mJmjnsLEgBYsQ6MsC9BB9unUrTHWpumQhnshk=;
        b=RmdxKeighpB18CLwAvyibR1EHoMEEmBDMEMFLpO5qnoDd0AdDE50O55F/8aNTZRsS6
         VT41p/Z794Szdud3rJ4AUT/44Tmvf1L27aQaJDd/R3LfEnDRSMtZhpRNdaHGM72LVJJ+
         bW51yNrPbQseCa2c1oXgHW6+Eql/6BlP+KRqIy7w3luCs5QGc8ny0TZGVsq0MrxMb2pK
         sXyErA5gH4h38F0nlxQxl1ONxvoGwSufwUSTMrZDPdCHVID+YNexvdhudwm7Cj485iVZ
         J+hvwWjVHK+gHlB9zUVZhsBTgRKF586KYvf3n/Myp1GZjf75hpstFCRopCg75rvDQ8/Y
         RSAQ==
X-Gm-Message-State: APjAAAWt46YoeMeawv2jgYSrPZnO23ZK4fxmQWVcvwBACJyW2fPU4MPU
        6IapfTHYEhXK1fVUCjNwn7NCHA==
X-Google-Smtp-Source: APXvYqx+5CWTf8Y5Ut0BNLeIkn5749uzUMyiU+WnoRq0UeLRKrlUOLAbCO3nGo0hyqKIouBGFVtCNQ==
X-Received: by 2002:a63:2264:: with SMTP id t36mr24570875pgm.87.1568091788541;
        Mon, 09 Sep 2019 22:03:08 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b16sm9096072pfb.54.2019.09.09.22.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 22:03:07 -0700 (PDT)
Date:   Mon, 9 Sep 2019 22:03:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: qcom: add firmware files for Adreno a630
Message-ID: <20190910050305.GC5157@tuxbook-pro>
References: <CAP71WjwcmNn+8t3pSSUf+SLayiH8AWcu8iZYFTrx=FVdPQB+Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP71WjwcmNn+8t3pSSUf+SLayiH8AWcu8iZYFTrx=FVdPQB+Nw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Sep 12:52 PDT 2019, Nicolas Dechesne wrote:

> hi
> 
> this pull request adds firmware for Adreno A630 GPU found on devices
> based on Qualcomm Snapdragon 845. The original firmware files are
> distributed by Thundercomm, the vendor of the SDM845 based Dragonboard
> 845c, using license terms defined by Qualcomm for previous
> generations. The original firmware files can be found here:
> https://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/
> 
> The following changes since commit 6c6918ad8ae0dfb2cb591484eba525409980c16f:
> 
>   linux-firmware: Update firmware file for Intel Bluetooth AX201
> (2019-09-09 04:22:42 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/ndechesne/linux-firmware.git gpu-845
> 
> for you to fetch changes up to 88ea23e7eed04e78111013df9b81dd851037e4da:
> 
>   qcom: add firmware files for Adreno a630 (2019-09-09 18:13:55 +0200)
> 
> ----------------------------------------------------------------
> Nicolas Dechesne (1):
>       qcom: add firmware files for Adreno a630

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> 
>  WHENCE            |   2 ++
>  qcom/a630_gmu.bin | Bin 0 -> 32768 bytes
>  qcom/a630_sqe.fw  | Bin 0 -> 31316 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 qcom/a630_gmu.bin
>  create mode 100644 qcom/a630_sqe.fw
