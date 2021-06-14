Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F1D3A6B1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 17:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhFNQA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 12:00:58 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:36699 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbhFNQA6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 12:00:58 -0400
Received: by mail-oi1-f171.google.com with SMTP id r16so14443852oiw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=94iIJWdnufdLWAXQdWLP9tyvdsiAcGYzNeNNwgwJVDg=;
        b=IqTXgIT+Cl8Wo9ps3519Xaw5nP9M00zvUCAESiMwX2JltCyvmClzopQPyd/gV29uYU
         AJgedo2DeLfn5nx9CzA4y/kbAtunlZgY1BjhfVljwo74gbDn4JxvRLFLMLgZ3hdatGLG
         QZmBMuqmSDIvKsmaDy9i4xx4pSHccwXsHrWZPbol306BOxH2iV6qgRLIEoMHSalJ7KM2
         J6mB8jxB9tWItV6w9t7QsTnWQy9is97/eaCy2kbWhE6esMZx/PmnnHamYfcDh0aOzUjk
         d/PRWj0+VPRespIVqfRDKmIQxAyEgdwEL+Qil9EoLlOy/gQuazuROa7qaJO/kFebP+LD
         qpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=94iIJWdnufdLWAXQdWLP9tyvdsiAcGYzNeNNwgwJVDg=;
        b=jX2AfxHIvi6f6zBLJgCzbJgj0g/l4LN9GrjpzcMa+Nhnul/P/hzII5rPPzTTH2ruSj
         A/l6lHVVCisoXNenFzUgQ1m/SVYCVnUFkM0dRIuRt4ekbbcqGTSGqLvWDJk3Tm9cneFC
         fd9Rw70k14jFBNhJm8u14FnxUcXH340+WjGx9Y6EsQMP5Nk0O/g8XaAzPbe2RYwwD+Nx
         DKc/Cxsa7mBGaIOYy6zGJvkOd/bIP1dP3+JUXNCiTqBns6MZz3HaBSc8WNcSjAOGdI/p
         vXY4zDUpsjk0oUO4NsoLSXQf3qeP9H6bA+j3g8nnB51VDX40Mz9fzavmvK8t5VNQrLJi
         ATpQ==
X-Gm-Message-State: AOAM530cD8XI1xgUm4dMFJDydgSeq6msC7hplKXihlE9Hm5JQ7LkvNl0
        KtrSybUp8M3D0iUO36HZbVleQw==
X-Google-Smtp-Source: ABdhPJxl00X8N39+K/fL/lQtc3Y9cNUIlK/sTxo5x7SmvJMEDgs+x/NARXztwoamyE8n6s/bhqicGA==
X-Received: by 2002:aca:b609:: with SMTP id g9mr22032540oif.141.1623686267640;
        Mon, 14 Jun 2021 08:57:47 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c205sm3137575oob.38.2021.06.14.08.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:57:47 -0700 (PDT)
Date:   Mon, 14 Jun 2021 10:57:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mani@kernel.org, davem@davemloft.net,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+1917d778024161609247@syzkaller.appspotmail.com
Subject: Re: [PATCH] net: qrtr: fix OOB Read in qrtr_endpoint_post
Message-ID: <YMd8eb/yu1Ds4oVV@yoga>
References: <20210614120650.2731-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614120650.2731-1-paskripkin@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 07:06 CDT 2021, Pavel Skripkin wrote:

> Syzbot reported slab-out-of-bounds Read in
> qrtr_endpoint_post. The problem was in wrong
> _size_ type:
> 
> 	if (len != ALIGN(size, 4) + hdrlen)
> 		goto err;
> 
> If size from qrtr_hdr is 4294967293 (0xfffffffd), the result of
> ALIGN(size, 4) will be 0. In case of len == hdrlen and size == 4294967293
> in header this check won't fail and
> 
> 	skb_put_data(skb, data + hdrlen, size);
> 
> will read out of bound from data, which is hdrlen allocated block.
> 
> Fixes: 194ccc88297a ("net: qrtr: Support decoding incoming v2 packets")
> Reported-and-tested-by: syzbot+1917d778024161609247@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  net/qrtr/qrtr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
> index c0477bec09bd..f2efaa4225f9 100644
> --- a/net/qrtr/qrtr.c
> +++ b/net/qrtr/qrtr.c
> @@ -436,7 +436,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  	struct qrtr_sock *ipc;
>  	struct sk_buff *skb;
>  	struct qrtr_cb *cb;
> -	unsigned int size;
> +	size_t size;
>  	unsigned int ver;
>  	size_t hdrlen;
>  
> -- 
> 2.32.0
> 
