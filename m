Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED8723E35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 19:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403945AbfETRRT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 13:17:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38473 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403941AbfETRRN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 13:17:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id f97so7004976plb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ScUZ/xpgU2aTY1Nb5OViipRU9LRxmOkzl5eEkgamu+4=;
        b=u/hk7dvb2PAmI5IFI5yr57lW7tUAYqA5xkIZlFRA5Iv/dRJt+p39pMkD0Bbt5qf4xm
         Ytjuma54OmHG5jIU3bN5wO/eY8VWRtz0gJlwP6zFmUgNcYs+mH6Wj84zJgnnEt+xtn8Y
         VHxtGaYR2PRh6e/C0ppGWI+o87sfWKSQZr81kvBh5mmB9bbMed3sf/+93nClSlMc0Wq5
         PrH18U4Q6YvGpYLGx+O3rkDw77jUQ1FUjjDKpN3+cDiUp//siqAyubcvryZIFP4kSKnw
         +uKYUBZOwsvbFWWxAJ4ClKclBe4NPg6OZZS166JxwXbmTRur4MYX2NdkwpLfrOunPAjC
         5Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ScUZ/xpgU2aTY1Nb5OViipRU9LRxmOkzl5eEkgamu+4=;
        b=FPFZvkTbE4R2iQrnwxVcI3UoW/4btOr1XE+bdHCkKOHnkPK/NvS2mmfoJxYAhSH9so
         UPS756+bdmX/L0CJHhd7oO6zjIBh5Pb1VtVNoUZUJGMCVfOrV7ks9WoCe36Wi7LqV5i8
         5eXtt9D+fIghGGZsO4ICauUVpWDHFuhW9vdI7pcV/HrFRMMZBA+k1Ptyl8pSENglRjgA
         5Fu2rJCQ0NzRoh4ZB0oWu5PWgd4x0P7ChvHOOUsSzJIzLPN6w0bsaQQ3HnzskAAIxEUZ
         HjTl36lk8GaHujM6Ov+uh9wpTrPYvw93kmY1XEgA4RiG/qdhFJfJdKAZkTDbRGPZIUKQ
         9sfw==
X-Gm-Message-State: APjAAAXXN/uy5IxnKocz1YpQ5HXw331phx3hySvqxr/Ws9AR3/01ihNs
        JfJoz7UB7THGWoEIkApI00/fxA==
X-Google-Smtp-Source: APXvYqxJH9e/9PMebXHaD9faSRZhhWJCU9i4asOXuPPssxo8pt9GHh9pom+TaB6TkWIjSBUjbqJe9Q==
X-Received: by 2002:a17:902:24c7:: with SMTP id l7mr27347835plg.192.1558372632896;
        Mon, 20 May 2019 10:17:12 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m12sm15083945pgi.56.2019.05.20.10.17.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 10:17:12 -0700 (PDT)
Date:   Mon, 20 May 2019 10:17:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net,
        ilias.apalodimas@linaro.org, cpratapa@codeaurora.org,
        syadagir@codeaurora.org, evgreen@chromium.org, benchan@google.com,
        ejcaruso@google.com, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] net: qualcomm: rmnet: get rid of a variable in
 rmnet_map_ipv4_ul_csum_header()
Message-ID: <20190520171739.GU2085@tuxbook-pro>
References: <20190520135354.18628-1-elder@linaro.org>
 <20190520135354.18628-7-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520135354.18628-7-elder@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 06:53 PDT 2019, Alex Elder wrote:

> The value passed as an argument to rmnet_map_ipv4_ul_csum_header()
> is always an IPv4 header.  Just have the type of the argument
> reflect that rather than obscuring that with a void pointer.  Rename
> it to be consistent with rmnet_map_ipv6_ul_csum_header().
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> index a95111cdcd29..61b7dbab2056 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> @@ -203,26 +203,25 @@ static void rmnet_map_complement_ipv4_txporthdr_csum_field(void *iphdr)
>  }
>  
>  static void
> -rmnet_map_ipv4_ul_csum_header(void *iphdr,
> +rmnet_map_ipv4_ul_csum_header(struct iphdr *ip4hdr,
>  			      struct rmnet_map_ul_csum_header *ul_header,
>  			      struct sk_buff *skb)
>  {
> -	struct iphdr *ip4h = iphdr;
>  	u16 offset;
>  	u16 val;
>  
> -	offset = skb_transport_header(skb) - (unsigned char *)iphdr;
> +	offset = skb_transport_header(skb) - (unsigned char *)ip4hdr;
>  	ul_header->csum_start_offset = htons(offset);
>  
>  	val = u16_encode_bits(skb->csum_offset, RMNET_MAP_UL_CSUM_INSERT_FMASK);
>  	val |= RMNET_MAP_UL_CSUM_ENABLED_FMASK;
> -	if (ip4h->protocol == IPPROTO_UDP)
> +	if (ip4hdr->protocol == IPPROTO_UDP)
>  		val |= RMNET_MAP_UL_CSUM_UDP_FMASK;
>  	ul_header->csum_info = htons(val);
>  
>  	skb->ip_summed = CHECKSUM_NONE;
>  
> -	rmnet_map_complement_ipv4_txporthdr_csum_field(iphdr);
> +	rmnet_map_complement_ipv4_txporthdr_csum_field(ip4hdr);
>  }
>  
>  #if IS_ENABLED(CONFIG_IPV6)
> -- 
> 2.20.1
> 
