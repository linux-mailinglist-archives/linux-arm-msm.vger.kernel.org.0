Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1EA23C73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 17:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392353AbfETPnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 11:43:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41829 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388808AbfETPnK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 11:43:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id f12so6894858plt.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dSszR7FrS692VH1z85mprElPR4g7J+3WPMn0YI2hzUI=;
        b=HSS0bspW251VHBhx+bFWcDCC75vF9KJwGQzVTl9d4San6LcNcwdYICYfpp794IKztA
         FnI+z4SX2Q+CznDpIdXTgBbDMmt05+kCyS6BqDHY+2XEaBwnNzZ8HOM5tdcbZh9zZ7t1
         PqJPxNW/EmMHcCzpoXDTeT8y9wyQpaFs3Bn15wIzeuASXGu1ZSC+h45ZKKphgYIormmx
         IvlwPSQAkPUniEuwUi58BWkT7XL7e0QPFg+aHKbUl1T2n+bLyW0+RHMsN9QaBrrjueOm
         2stUFYKEvT0rkuAMuiP2bYQA9JkA4D2HmkEf+17aP/iDhT/oFW6LZz/zyVFeahHcwkGS
         nqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dSszR7FrS692VH1z85mprElPR4g7J+3WPMn0YI2hzUI=;
        b=G9Tsfd52lluZEK3jjmFQaiA//zuLQU5GdL6/F2p6H4yZMnwC0IJBPInIPbzIt3I5oG
         /WF7cE0xh8OmSCGrmxD7zSl0AsuISAsYbXETO0KFvnb7c2+/SldkXbWB106+UO4uSC1x
         iterKoIo0XwRAEU8divgroclRwxFuppmUx2moJXX89sKvY653e9bfHRs9FNEira1lTPG
         5wsp3JxrDg7k0C54EllwmaPeS3QrjC7T7h1Er1Lp+0LYENYF3QMBkfb0pKHaFiTfXBI3
         JstMbjqIK7pkQnSOyYCZPZAQXm3yU9Lh2iAvxrw4eBIKvA0IIRtVmZe3J++UejuO7Qde
         t7rQ==
X-Gm-Message-State: APjAAAXmAh/yEjpac0ol+zqA94UH2QN3yx9dXZnaTWASRfyZu8HROu9f
        kaHOGzbTFUfMqt1Sw9/kvOqinQ==
X-Google-Smtp-Source: APXvYqycTna/AM0jQoiDLo0k1zmLzle59j2ZRtnmZwWIASAjkruy8oLXgvEcXBUk0hCRZBVN+OFylw==
X-Received: by 2002:a17:902:7002:: with SMTP id y2mr76588597plk.75.1558366989673;
        Mon, 20 May 2019 08:43:09 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e14sm21365631pff.60.2019.05.20.08.43.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 08:43:09 -0700 (PDT)
Date:   Mon, 20 May 2019 08:43:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net,
        ilias.apalodimas@linaro.org, cpratapa@codeaurora.org,
        syadagir@codeaurora.org, evgreen@chromium.org, benchan@google.com,
        ejcaruso@google.com, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] net: qualcomm: rmnet: use field masks instead of C
 bit-fields
Message-ID: <20190520154336.GR2085@tuxbook-pro>
References: <20190520135354.18628-1-elder@linaro.org>
 <20190520135354.18628-4-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520135354.18628-4-elder@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 06:53 PDT 2019, Alex Elder wrote:

> Using C bitfields (e.g. int foo : 3) is not portable.  So stop
> using them for the command/data flag and the pad length fields in
> the rmnet_map structure.  Instead, use the functions defined in
> <linux/bitfield.h> along with field mask constants to extract or
> assign values within an integral structure member of a known size.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c | 5 +++--
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h      | 8 +++++---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 5 ++++-
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
> index 4c1b62b72504..5fff6c78ecd5 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
> @@ -13,6 +13,7 @@
>   *
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/netdevice.h>
>  #include <linux/netdev_features.h>
>  #include <linux/if_arp.h>
> @@ -70,7 +71,7 @@ __rmnet_map_ingress_handler(struct sk_buff *skb,
>  	u16 len, pad;
>  	u8 mux_id;
>  
> -	if (map_header->cd_bit) {
> +	if (u8_get_bits(map_header->cmd_pad_len, RMNET_MAP_CMD_FMASK)) {
>  		if (port->data_format & RMNET_FLAGS_INGRESS_MAP_COMMANDS)
>  			return rmnet_map_command(skb, port);
>  
> @@ -78,7 +79,7 @@ __rmnet_map_ingress_handler(struct sk_buff *skb,
>  	}
>  
>  	mux_id = map_header->mux_id;
> -	pad = map_header->pad_len;
> +	pad = u8_get_bits(map_header->cmd_pad_len, RMNET_MAP_PAD_LEN_FMASK);
>  	len = ntohs(map_header->pkt_len) - pad;
>  
>  	if (mux_id >= RMNET_MAX_LOGICAL_EP)
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> index a30a7b405a11..a56209645c81 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> @@ -40,13 +40,15 @@ enum rmnet_map_commands {
>  };
>  
>  struct rmnet_map_header {
> -	u8  cd_bit:1;
> -	u8  reserved_bit:1;
> -	u8  pad_len:6;
> +	u8  cmd_pad_len;	/* RMNET_MAP_* */
>  	u8  mux_id;
>  	__be16 pkt_len;
>  }  __aligned(1);
>  
> +#define RMNET_MAP_CMD_FMASK		GENMASK(0, 0)   /* 0: data; 1: cmd */
> +#define RMNET_MAP_RESERVED_FMASK	GENMASK(1, 1)
> +#define RMNET_MAP_PAD_LEN_FMASK		GENMASK(7, 2)
> +
>  struct rmnet_map_dl_csum_trailer {
>  	u8  reserved1;
>  	u8  valid:1;
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> index 498f20ba1826..10d2d582a9ce 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> @@ -13,6 +13,7 @@
>   *
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/netdevice.h>
>  #include <linux/ip.h>
>  #include <linux/ipv6.h>
> @@ -301,7 +302,9 @@ struct rmnet_map_header *rmnet_map_add_map_header(struct sk_buff *skb,
>  
>  done:
>  	map_header->pkt_len = htons(map_datalen + padding);
> -	map_header->pad_len = padding & 0x3F;
> +	/* This is a data packet, so cmd field is 0 */
> +	map_header->cmd_pad_len =
> +			u8_encode_bits(padding, RMNET_MAP_PAD_LEN_FMASK);
>  
>  	return map_header;
>  }
> -- 
> 2.20.1
> 
