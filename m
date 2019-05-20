Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2B3123E3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 19:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392799AbfETRRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 13:17:45 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45126 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390196AbfETRRp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 13:17:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id s11so7524279pfm.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2FjhOwFKrVIJAl2LxDN32kEB+6yjli62tiwHSqu8m3Y=;
        b=W6H3wrKJKcaUjX12VWVVjTzD+FZk9cPmlEyg+n4tTPMRomuqZN8oGiT8ftSwORrLWu
         SrU1sNgEtcmMHUQTG5Q+SGNl1x4eWyTP86Wa72FlIcB6b23JStrVyE4xHjlS7usHaDNb
         At223MiDbKz8gzE6A3qG9pLtUnhxudhyFQeBmLqGQLc2gwhMkrIzVaaBPyi3S0ZQ4JNk
         +i6gOtm8/AxGiZ8TnZJT5tuZOrKikNFZz96dr/BoRQFccYpQnuMedMXUdbXaJ7sVkU5+
         jaQ+yGo4yqEBt6urvlbJm6Xe4n9DzeSTKBnvXSp/Y0cnamgtP3DqTCSRheQVi9muWH6D
         dTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2FjhOwFKrVIJAl2LxDN32kEB+6yjli62tiwHSqu8m3Y=;
        b=LQUSRMYeJLCXoHeLfZdp8psKNP4kZzxnUfLA5LyN4bL4Mera4YEH0TjqWcgCd+wnOM
         jWJ1RYvSFXftMfyHvfUTOeJkdcdfTh5e+FnqShU0oOnpeOqDe/Uve5sen5Mxjf724BFq
         7Dnfizj/5YSkQ0eMTNX1Me20OpMNc7W7pZXs6nA7QUWj1DWyo7eYqT/W5hCLZXD9bvti
         IvjuV/YPDynDz5fwQ+afeM5ivtNgirQeivWS77fLknyAdckyVQtN8WFnfGF7Jdl7JN8/
         pwPInJz8D9VZM3mUlfQ0a9bEvEaK8NmpyXYyuQbbt0GP60oPrCnzMd0kkChLl0qicth0
         UM2Q==
X-Gm-Message-State: APjAAAVYeNjD2V/6DXMb8Y1JxQ5jqH+70UIxokUcVZoTjCbJ1zOoXqXm
        uqis33DFdvGIf4ZBCxj1+1/fqw==
X-Google-Smtp-Source: APXvYqxGJODZVZZkYCQrDnuhEME1l3MVyx+Qrn7x3ga7XFxkr9lg/WGqNAAC5bsYmf2gHA+/s9ScVw==
X-Received: by 2002:a65:42ca:: with SMTP id l10mr23345678pgp.181.1558372664547;
        Mon, 20 May 2019 10:17:44 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h11sm20833183pfn.170.2019.05.20.10.17.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 10:17:44 -0700 (PDT)
Date:   Mon, 20 May 2019 10:18:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net,
        ilias.apalodimas@linaro.org, cpratapa@codeaurora.org,
        syadagir@codeaurora.org, evgreen@chromium.org, benchan@google.com,
        ejcaruso@google.com, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] net: introduce "include/linux/if_rmnet.h"
Message-ID: <20190520171811.GW2085@tuxbook-pro>
References: <20190520135354.18628-1-elder@linaro.org>
 <20190520135354.18628-9-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520135354.18628-9-elder@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 06:53 PDT 2019, Alex Elder wrote:

> The IPA driver requires some (but not all) symbols defined in
> "drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h".  Create a new
> public header file "include/linux/if_rmnet.h" and move the needed
> definitions there.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  .../ethernet/qualcomm/rmnet/rmnet_handlers.c  |  1 +
>  .../net/ethernet/qualcomm/rmnet/rmnet_map.h   | 31 -------------
>  .../qualcomm/rmnet/rmnet_map_command.c        |  1 +
>  .../ethernet/qualcomm/rmnet/rmnet_map_data.c  |  1 +
>  .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   |  1 +
>  include/linux/if_rmnet.h                      | 45 +++++++++++++++++++
>  6 files changed, 49 insertions(+), 31 deletions(-)
>  create mode 100644 include/linux/if_rmnet.h
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
> index 5fff6c78ecd5..8e00e14f4ac9 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
> @@ -18,6 +18,7 @@
>  #include <linux/netdev_features.h>
>  #include <linux/if_arp.h>
>  #include <net/sock.h>
> +#include <linux/if_rmnet.h>
>  #include "rmnet_private.h"
>  #include "rmnet_config.h"
>  #include "rmnet_vnd.h"
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> index 775b98d34e94..d101cabb04c3 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
> @@ -39,37 +39,6 @@ enum rmnet_map_commands {
>  	RMNET_MAP_COMMAND_ENUM_LENGTH
>  };
>  
> -struct rmnet_map_header {
> -	u8  cmd_pad_len;	/* RMNET_MAP_* */
> -	u8  mux_id;
> -	__be16 pkt_len;
> -}  __aligned(1);
> -
> -#define RMNET_MAP_CMD_FMASK		GENMASK(0, 0)   /* 0: data; 1: cmd */
> -#define RMNET_MAP_RESERVED_FMASK	GENMASK(1, 1)
> -#define RMNET_MAP_PAD_LEN_FMASK		GENMASK(7, 2)
> -
> -struct rmnet_map_dl_csum_trailer {
> -	u8  reserved1;
> -	u8  flags;		/* RMNET_MAP_DL_* */
> -	__be16 csum_start_offset;
> -	__be16 csum_length;
> -	__be16 csum_value;
> -} __aligned(1);
> -
> -#define RMNET_MAP_DL_CSUM_VALID_FMASK	GENMASK(0, 0)
> -#define RMNET_MAP_DL_RESERVED_FMASK	GENMASK(7, 1)
> -
> -struct rmnet_map_ul_csum_header {
> -	__be16 csum_start_offset;
> -	__be16 csum_info;	/* RMNET_MAP_UL_* */
> -} __aligned(1);
> -
> -/* NOTE:  These field masks are defined in CPU byte order */
> -#define RMNET_MAP_UL_CSUM_INSERT_FMASK	GENMASK(13, 0)
> -#define RMNET_MAP_UL_CSUM_UDP_FMASK	GENMASK(14, 14)   /* 0: IP; 1: UDP */
> -#define RMNET_MAP_UL_CSUM_ENABLED_FMASK	GENMASK(15, 15)
> -
>  #define RMNET_MAP_COMMAND_REQUEST     0
>  #define RMNET_MAP_COMMAND_ACK         1
>  #define RMNET_MAP_COMMAND_UNSUPPORTED 2
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> index f675f47c3495..6832c5939cae 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <linux/netdevice.h>
> +#include <linux/if_rmnet.h>
>  #include "rmnet_config.h"
>  #include "rmnet_map.h"
>  #include "rmnet_private.h"
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> index 61b7dbab2056..370aee7402e0 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> @@ -18,6 +18,7 @@
>  #include <linux/ip.h>
>  #include <linux/ipv6.h>
>  #include <net/ip6_checksum.h>
> +#include <linux/if_rmnet.h>
>  #include "rmnet_config.h"
>  #include "rmnet_map.h"
>  #include "rmnet_private.h"
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> index d11c16aeb19a..6b39d4d8e523 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> @@ -17,6 +17,7 @@
>  #include <linux/etherdevice.h>
>  #include <linux/if_arp.h>
>  #include <net/pkt_sched.h>
> +#include <linux/if_rmnet.h>
>  #include "rmnet_config.h"
>  #include "rmnet_handlers.h"
>  #include "rmnet_private.h"
> diff --git a/include/linux/if_rmnet.h b/include/linux/if_rmnet.h
> new file mode 100644
> index 000000000000..ae60472ecc79
> --- /dev/null
> +++ b/include/linux/if_rmnet.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/* Copyright (c) 2013-2018, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2019 Linaro Ltd.
> + */
> +#ifndef _LINUX_IF_RMNET_H_
> +#define _LINUX_IF_RMNET_H_
> +
> +#include <linux/types.h>
> +
> +/* Header structure that precedes packets in ETH_P_MAP protocol */
> +struct rmnet_map_header {
> +	u8  cmd_pad_len;	/* RMNET_MAP_* */
> +	u8  mux_id;
> +	__be16 pkt_len;
> +}  __aligned(1);
> +
> +#define RMNET_MAP_CMD_FMASK		GENMASK(0, 0)   /* 0: data; 1: cmd */
> +#define RMNET_MAP_RESERVED_FMASK	GENMASK(1, 1)
> +#define RMNET_MAP_PAD_LEN_FMASK		GENMASK(7, 2)
> +
> +/* Checksum offload metadata header for outbound packets*/
> +struct rmnet_map_ul_csum_header {
> +	__be16 csum_start_offset;
> +	__be16 csum_info;	/* RMNET_MAP_UL_* */
> +} __aligned(1);
> +
> +/* NOTE:  These field masks are defined in CPU byte order */
> +#define RMNET_MAP_UL_CSUM_INSERT_FMASK	GENMASK(13, 0)
> +#define RMNET_MAP_UL_CSUM_UDP_FMASK	GENMASK(14, 14)   /* 0: IP; 1: UDP */
> +#define RMNET_MAP_UL_CSUM_ENABLED_FMASK	GENMASK(15, 15)
> +
> +/* Checksum offload metadata trailer for inbound packets */
> +struct rmnet_map_dl_csum_trailer {
> +	u8  reserved1;
> +	u8  flags;		/* RMNET_MAP_DL_* */
> +	__be16 csum_start_offset;
> +	__be16 csum_length;
> +	__be16 csum_value;
> +} __aligned(1);
> +
> +#define RMNET_MAP_DL_CSUM_VALID_FMASK	GENMASK(0, 0)
> +#define RMNET_MAP_DL_RESERVED_FMASK	GENMASK(7, 1)
> +
> +#endif /* _LINUX_IF_RMNET_H_ */
> -- 
> 2.20.1
> 
