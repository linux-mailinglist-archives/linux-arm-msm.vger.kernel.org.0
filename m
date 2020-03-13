Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F0B184CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 17:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCMQmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 12:42:10 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45807 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgCMQmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 12:42:10 -0400
Received: by mail-pf1-f193.google.com with SMTP id 2so5535211pfg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s6WkIo0+SONpzpcf5vdQfXHZIbN30Eo2H37KqgrmrxU=;
        b=DttVEW2nj1EWSDDOPAqrLLZt8g+bnvGlaARDGsCefbz0lJa0fkaU79++VphmD90RWh
         UnQj9RjqDaeZWKRCdE3Id3MY1vagTSWVlA+rTHZfPTI7Cej3kjCgak0gEmE5WQfcr12y
         51f602qcmq41xfOrMgNMi6K8S5NTF5EniRzlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6WkIo0+SONpzpcf5vdQfXHZIbN30Eo2H37KqgrmrxU=;
        b=nO+a3PEpsFJhXJ788hbptg6uBTXHbGS+HDErh5HUF1fDETDWWOiSs4uW5oEx4o3wZs
         iYvMsvLlXTSBGNvuQGNWPY04WzCZ1Lg/VVT4NDqhEKwT2AGDpT+ZRTgQl1tyu6Ck6vk/
         6t325Xg+I/iNm85MKw1g4uNbrB74otdrOdKmbaBwYUTsdStCCJsOFIN5JJz4q+OYGtT8
         G5kj7oGsd3OwghT5GGIFb8wBjq7oPgEI91ARbgtjv4QzBqnoDoc8+4YZBcmqXSslB751
         h7JUryUt8q6vhTfbOtmf8L7Uc3Nx+7rB2ovHZ6llNdXqHZkPedpBQUOVwsUrV76IxPbQ
         xPPw==
X-Gm-Message-State: ANhLgQ1K9+5C//7NOd1wlcyteCOJG9CSUaGuLbWOkg/KO3nQGhknDhoi
        tpw/yHXRwc/MPAcQfN6gewaNqg==
X-Google-Smtp-Source: ADFU+vuwQbkLvdp2XzbaSrPiVctBFMJhZahqG7wDTFBRWfwoOXucPUHkefVUt19G+294ACbzJPzTXw==
X-Received: by 2002:a62:ab07:: with SMTP id p7mr13046568pff.318.1584117729446;
        Fri, 13 Mar 2020 09:42:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q43sm11520128pjc.40.2020.03.13.09.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 09:42:08 -0700 (PDT)
Date:   Fri, 13 Mar 2020 09:42:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
Message-ID: <20200313164207.GH144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akash,

On Fri, Mar 13, 2020 at 06:42:08PM +0530, Akash Asthana wrote:
> Add necessary macros and structure variables to support ICC BW
> voting from individual SE drivers.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment dropped enums for ICC paths, given the three
>    paths individual members
> 
>  include/linux/qcom-geni-se.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..eaae16e 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -6,6 +6,8 @@
>  #ifndef _LINUX_QCOM_GENI_SE
>  #define _LINUX_QCOM_GENI_SE
>  
> +#include <linux/interconnect.h>
> +
>  /* Transfer mode supported by GENI Serial Engines */
>  enum geni_se_xfer_mode {
>  	GENI_SE_INVALID,
> @@ -33,6 +35,15 @@ struct clk;
>   * @clk:		Handle to the core serial engine clock
>   * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
> + * @icc_path_geni_to_core:	ICC path handle for geni to core
> + * @icc_path_cpu_to_geni:	ICC path handle for cpu to geni
> + * @icc_path_geni_to_ddr:	ICC path handle for geni to ddr
> + * @avg_bw_core:	Average bus bandwidth value for QUP core 2x clock
> + * @peak_bw_core:	Peak bus bandwidth value for QUP core 2x clock
> + * @avg_bw_cpu:		Average bus bandwidth value for CPU
> + * @peak_bw_cpu:	Peak bus bandwidth value for CPU
> + * @avg_bw_ddr:		Average bus bandwidth value for DDR
> + * @peak_bw_ddr:	Peak bus bandwidth value for DDR
>   */
>  struct geni_se {
>  	void __iomem *base;
> @@ -41,6 +52,15 @@ struct geni_se {
>  	struct clk *clk;
>  	unsigned int num_clk_levels;
>  	unsigned long *clk_perf_tbl;
> +	struct icc_path *icc_path_geni_to_core;
> +	struct icc_path *icc_path_cpu_to_geni;
> +	struct icc_path *icc_path_geni_to_ddr;
> +	unsigned int avg_bw_core;
> +	unsigned int peak_bw_core;
> +	unsigned int avg_bw_cpu;
> +	unsigned int peak_bw_cpu;
> +	unsigned int avg_bw_ddr;
> +	unsigned int peak_bw_ddr;

Those are a lot of new individual struct members. How about clustering
them, e.g.:

struct geni_icc_path {
	struct icc_path *path;
	unsigned int avg_bw;
	unsigned int peak_bw;
};

struct geni_iccs_paths {
	struct geni_icc_path to_core;
	struct geni_icc_path from_cpu;
	struct geni_icc_path to_ddr;
};

And 'struct geni_se' just gets this entry:

	struct geni_icc_paths icc;

or alternatively three 'struct geni_icc_path' entries.
