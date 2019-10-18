Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B37DC3D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 13:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442568AbfJRLSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 07:18:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54546 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442552AbfJRLSV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 07:18:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 265DD60E3C; Fri, 18 Oct 2019 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397500;
        bh=EFw8EXTz6ymh3NJFeYn3QvSwuxYwhNL5iiyNYPEYCPg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Cwivh4VRNoJdnwMT5nXNFGj9rV6omj1CGH9gKI7/PQ8JvuBr7grtaHdpTV7bRy8PV
         HkHalV9z1KX0sFcwOW4Rr26h6RoYpM5rpvA7zk/e45cOfkbdT0WaL6u8vEmuYjNjuj
         vHBVhrJZIdZReOYATZ4/k6eqWLHX8sDMX2Luyznc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 91E7D61273;
        Fri, 18 Oct 2019 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397495;
        bh=EFw8EXTz6ymh3NJFeYn3QvSwuxYwhNL5iiyNYPEYCPg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BmeeVMr2DaECfdd65NcThvb9F68QC5owq611hJuFzkNhHnmbix0IVYydXPNeQro/7
         EbDsqcfrd5zzn8/zwjNgZIy4u9aWeqtQwldhjQ19dR8+X85FSATIykXSHz2EL5t21k
         BKSrXZRGHVoulKhqx10yXFP4j4+Y0vjfFZY5ePc4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 16:48:15 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH 1/4] Bluetooth: hci_qca: Update regulator_set_load() usage
In-Reply-To: <20191018052405.3693555-2-bjorn.andersson@linaro.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
 <20191018052405.3693555-2-bjorn.andersson@linaro.org>
Message-ID: <57129e239e5e7717c00aa73e28094b4a@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-18 10:54, Bjorn Andersson wrote:
> Since the introduction of '5451781dadf8 ("regulator: core: Only count
> load for enabled consumers")' in v5.0, the requested load of a 
> regulator
> consumer is only accounted for when said consumer is voted enabled.
> 
> So there's no need to vote for load ever time the regulator is
> enabled or disabled.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/bluetooth/hci_qca.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e3164c200eac..c07c529b0d81 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1393,13 +1393,6 @@ static int qca_enable_regulator(struct qca_vreg 
> vregs,
>  	if (ret)
>  		return ret;
> 
> -	if (vregs.load_uA)
> -		ret = regulator_set_load(regulator,
> -					 vregs.load_uA);
> -
> -	if (ret)
> -		return ret;
> -
>  	return regulator_enable(regulator);
> 
>  }
> @@ -1409,8 +1402,6 @@ static void qca_disable_regulator(struct qca_vreg 
> vregs,
>  {
>  	regulator_disable(regulator);
>  	regulator_set_voltage(regulator, 0, vregs.max_uV);
> -	if (vregs.load_uA)
> -		regulator_set_load(regulator, 0);
> 
>  }
> 
> @@ -1462,18 +1453,30 @@ static int qca_power_setup(struct hci_uart *hu, 
> bool on)
>  static int qca_init_regulators(struct qca_power *qca,
>  				const struct qca_vreg *vregs, size_t num_vregs)
>  {
> +	struct regulator_bulk_data *bulk;
> +	int ret;
>  	int i;
> 
> -	qca->vreg_bulk = devm_kcalloc(qca->dev, num_vregs,
> -				      sizeof(struct regulator_bulk_data),
> -				      GFP_KERNEL);
> -	if (!qca->vreg_bulk)
> +	bulk = devm_kcalloc(qca->dev, num_vregs, sizeof(*bulk), GFP_KERNEL);
> +	if (!bulk)
>  		return -ENOMEM;
> 
>  	for (i = 0; i < num_vregs; i++)
> -		qca->vreg_bulk[i].supply = vregs[i].name;
> +		bulk[i].supply = vregs[i].name;
> +
> +	ret = devm_regulator_bulk_get(qca->dev, num_vregs, bulk);
> +	if (ret < 0)
> +		return ret;
> 
> -	return devm_regulator_bulk_get(qca->dev, num_vregs, qca->vreg_bulk);
> +	for (i = 0; i < num_vregs; i++) {
> +		ret = regulator_set_load(bulk[i].consumer, vregs[i].load_uA);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	qca->vreg_bulk = bulk;
> +
> +	return 0;
>  }
> 
>  static int qca_serdev_probe(struct serdev_device *serdev)
