Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 062737838E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 06:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbjHVEuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 00:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbjHVEuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 00:50:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0DA189;
        Mon, 21 Aug 2023 21:50:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EC746332D;
        Tue, 22 Aug 2023 04:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25093C433C8;
        Tue, 22 Aug 2023 04:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692679813;
        bh=368LtFOTDEZpW8msG0Fr/4HntmGt3x/Cdh+ey/KmNfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KTr6MQcKL/n723EvCmkU31o79mzoDHAkHM6rVdM8j3GMj7zRH9IkEEudDwqFhuBaS
         dXNAE0gtxoLV3pGbjFcBy1ydDwxYXzfnm2sqdJ90RM7cHzp8ebnc3WHc8oqV5i21w6
         tEEvF9tYEJ2QNmhxpXrmPBlVWss3US6cNFTYoCP+g8MGZrxSUOhsD0c+/c6TeNO4E8
         qcRyU5FFSe8HQeRx2zmfCaL2rHOIKdLVwyM5REPQpn8UuIfx+h9i+bjNWAtA0TtGj2
         H8QaPb2WW867kyEsjP37j0Fa3lkAggRg+btun4ywSBZNFn28jvtGG35bIkyDHK/Y8J
         gB+Hr/FpgjaJA==
Date:   Mon, 21 Aug 2023 21:50:11 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Om Prakash Singh <quic_omprsing@quicinc.com>
Cc:     andersson@kernel.org, linux-mmc@vger.kernel.org,
        satyaprateek2357@gmail.com, ulf.hansson@linaro.org,
        agross@kernel.org, adrian.hunter@intel.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mmc: core: crypto: Add MMC_CAP2_CRYPTO_RETAIN_KEY
Message-ID: <20230822045011.GA1661@sol.localdomain>
References: <20230821065037.1146977-1-quic_omprsing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821065037.1146977-1-quic_omprsing@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 21, 2023 at 12:20:37PM +0530, Om Prakash Singh wrote:
> Add new capability MMC_CAP2_CRYPTO_RETAIN_KEY for mmc host that
> support inline crypto key retention and doesn't need reinitialization
> of all keys after mmc host has reinitialized.

MMC_CAP2_RETAINS_CRYPTO_KEYS would be a better name.

> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 1c935b5bafe1..cfc2328f90ed 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1828,6 +1828,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  
>  	msm_host->ice = ice;
>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> +	mmc->caps2 |= MMC_CAP2_CRYPTO_RETAIN_KEY;
>  
>  	return 0;
>  }

Are you sure that *all* versions of Qualcomm's eMMC inline encryption hardware
have this behavior?

> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 461d1543893b..74c69415746d 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -417,8 +417,10 @@ struct mmc_host {
>  #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
>  #ifdef CONFIG_MMC_CRYPTO
>  #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
> +#define MMC_CAP2_CRYPTO_RETAIN_KEY (1 << 28)	/* Host doesn't need inline encryption key reinitialization */

How about:

/* Host retains inline encryption keys on reset */

>  #else
>  #define MMC_CAP2_CRYPTO		0
> +#define MMC_CAP2_CRYPTO_RETAIN_KEY 0
>  #endif
>  #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */

'1 << 28' is already used.

Also, the new flag doesn't need to be in the #ifdef section.

- Eric
