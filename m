Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26EB23C4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 17:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392223AbfETPiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 11:38:21 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42374 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392221AbfETPiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 11:38:21 -0400
Received: by mail-pg1-f193.google.com with SMTP id 145so6962687pgg.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 08:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uCWJzdwhd+1tcKYTw9hbwn1gSRk4OfXO/IfxBU/gQqU=;
        b=RitRrcORQKf+bf+V7kUhKt/VteE8EfoRgt6oDx2NkazjO092KWhyXfIY8cz5KRbghJ
         DcRA19lvMkL8cE+Tgz+8inpbO252vrn1vn6b2VC6u28Gb3mVoCTriA0eX6wvYkfem+SZ
         Ls/RvRHjLd28SZWWXGdgUP0zwz6+cvcXx+TMYCcpvMsx/ea99XtJ6rh89MVMTzrSz9s7
         r+R7cw5ZPYHyN0abG/lwThCl+sJ8q8dF9i0O1fM+4q9hxOdEaXry7Q71Uc+PbqX1e78U
         t8niY6F3SXz43iWmsZqeTGTxte2bKw5nYdNQCKBqLm0xBvCygJRBgg93g6c3lVMBJxWp
         jWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uCWJzdwhd+1tcKYTw9hbwn1gSRk4OfXO/IfxBU/gQqU=;
        b=QXpYJGUsPCo3/X9jc6v24obNpLPgnPRKRC6BF88EI0QVy4tHAQhDa86C6SEEKqbEOv
         KYObqJey7bC0AMAkxUImoLTJhlBOua3wAkzduq289lYm/VBi0kZg4hGMHPcyAvFenOti
         lgccsJoL2H2GDGt6bYi571W2TY+PVf/kjFDmt12ccr0hRxaSamsm4TiLZc/ezSkFYgM/
         6eahVZV20a1XcTalFozWmyws9a9Y3iWylHxGpPScbo5XhgtqtA+l6Z7/frjJeLPjfSQ5
         S3Y4WYMDbCm90bsLLhKdzsXX6uYjJ8+sodlwzZuotDRXBe4+T+PeSHHkj0iW5UU6tRXr
         Rv0w==
X-Gm-Message-State: APjAAAXwkimvERHn5Tlb4NSuJN+3WNp5ppg/KNiKNU8SsH+O5QthePyE
        VdeGFAFJrxkkbp5JARdErjPTWw==
X-Google-Smtp-Source: APXvYqz3pl2TAuMTOYMc3sgPvfPgTTg/TRNOne3MjnLr9w2cCjHNOmjNjfTZKgGDGgKwzoKkFxJEhg==
X-Received: by 2002:a65:60c7:: with SMTP id r7mr73970975pgv.22.1558366700866;
        Mon, 20 May 2019 08:38:20 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e10sm37179794pfm.137.2019.05.20.08.38.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 08:38:20 -0700 (PDT)
Date:   Mon, 20 May 2019 08:38:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net,
        ilias.apalodimas@linaro.org, cpratapa@codeaurora.org,
        syadagir@codeaurora.org, evgreen@chromium.org, benchan@google.com,
        ejcaruso@google.com, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] net: qualcomm: rmnet: fix struct rmnet_map_header
Message-ID: <20190520153847.GP2085@tuxbook-pro>
References: <20190520135354.18628-1-elder@linaro.org>
 <20190520135354.18628-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520135354.18628-2-elder@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 06:53 PDT 2019, Alex Elder wrote:

> The C bit-fields in the first byte of the rmnet_map_header structure
> are defined in the wrong order.  The first byte should be formatted
> this way:
>                  +------- reserved_bit
>                  | +----- cd_bit
>                  | |
>                  v v
>     +-----------+-+-+
>     |  pad_len  |R|C|
>     +-----------+-+-+
>      7 6 5 4 3 2 1 0  <-- bit position
> 
> But the C bit-fields that define the first byte are defined this way:
>     u8 pad_len:6;
>     u8 reserved_bit:1;
>     u8 cd_bit:1;
> 
> And although this isn't portable, I can state that when I build it
> the result puts the bit-fields in the wrong location (e.g., the
> cd_bit is in bit position 7, when it should be position 0).
> 
> Fix this by reordering the definitions of these struct members.
> Upcoming patches will reimplement these definitions portably.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> index 884f1f52dcc2..b1ae9499c0b2 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> @@ -40,9 +40,9 @@ enum rmnet_map_commands {
>  };
>  
>  struct rmnet_map_header {
> -	u8  pad_len:6;
> -	u8  reserved_bit:1;
>  	u8  cd_bit:1;
> +	u8  reserved_bit:1;
> +	u8  pad_len:6;
>  	u8  mux_id;
>  	__be16 pkt_len;
>  }  __aligned(1);
> -- 
> 2.20.1
> 
