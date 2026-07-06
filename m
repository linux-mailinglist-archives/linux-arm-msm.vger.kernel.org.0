Return-Path: <linux-arm-msm+bounces-116864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RqEUM2K1S2raYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:02:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF2711A8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GrTpJEva;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116864-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116864-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37FA9302B3AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C0A373C1E;
	Mon,  6 Jul 2026 13:45:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937C2F546D;
	Mon,  6 Jul 2026 13:45:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345535; cv=none; b=g0RAcUs4l7Z16pFn31t0sEYiteTrTgSr7P5ubfCKBw7cf/rswqpa9010ddTGYeAm4n0Fk1OXEkhWjV8jgLp7BCruRDJ6ysaOYyBOijea9WWTCWRR49Fylb/lVEL2z9eSmS4wrJXtSSfaYQdCdfKj+PQK7WfeC2sDvPaFy1X62zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345535; c=relaxed/simple;
	bh=6fh+vMAtDVjRgJ2FxiVg6QTutPjAcZadEr1thLSYBiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdzBqV6/vd7rB5LAyVcBRQXdX7Xzeg6FlTrb2p99HeYeptIJItMfJE/p+rWYiGKbyN4xtmnF6m+1cW0YouR62Y3QpfB7CR/y5zMdl0WwU/+2/0AmIs6X5cic4lASQbDXAMSNPVXM0aeovZKdT9dvTERzgMX25mFYqtb0aPwT5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrTpJEva; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C1E1F00A3A;
	Mon,  6 Jul 2026 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783345530;
	bh=pzG+yDwyVvTpLoX9iiBmZeWKa43E/pfuOWEFjEK/2Is=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GrTpJEvaiYVDy8eUi74KmEmFKSNFCOswdrbFWN1EZ20uK440WwESMENVwTbkF3KDo
	 wC93WAaV8i51ksAqlaW+/omdtb7g8jtaUCYYigswnC9JLj75upULncVF5jZBitRVna
	 dqRKAqZlFFJdzrq6fiCGHOdqmmrCAnPqBqEr6Q9d58Qmy9ZtzvokfBGyLzAwMr0Qu8
	 ubhGQM1GG3xSBDB0j1VBJHWxYifgfWGog/Kr4fQjVVP1YqYFoDqLviMwyOYAp6GIgM
	 XnOk0aOjb7R5DHioYvuJzj866H58CxIZFDYnsfWxxjEbBMw8ogw8bHyu8zwdbzTtxJ
	 iTRppy5o8ZEWw==
Message-ID: <477e95d5-ee3f-4a75-acef-a01f317f16c9@kernel.org>
Date: Mon, 6 Jul 2026 14:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] regulator: qcom_usb_vbus: add register abstraction
 and PM8150B support
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
 kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <iaoZE4hpivDN9Ni1ZEuOqYXFz-q7GLrDobrLO4sHWFWIIUT5ieju5KEScJtVNW7u8ue4HojywjRY7BTQ2wNADw==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116864-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,qualcomm.com:email,config.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62BF2711A8C

On 06/07/2026 13:31, Rakesh Kota wrote:
> Introduce per-compatible regulator descriptor data via struct
> qcom_usb_vbus_reg_data to abstract register layout differences between
> PMICs. This allows the probe function to dynamically populate the
> regulator_desc fields rather than relying on compile-time constants.
> 
> Refactor the existing PM8150B support to use this abstraction, wiring in
> its CMD_OTG, OTG_CFG, and current-limit registers through pm8150b_data.
> No functional change is intended for PM8150B.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>   drivers/regulator/qcom_usb_vbus-regulator.c | 71 +++++++++++++++++++++++------
>   1 file changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..0201a3983981eec1f475d4b8cdccc9148b5e3b2e 100644
> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -20,6 +20,21 @@
>   #define OTG_CFG				0x53
>   #define OTG_EN_SRC_CFG			BIT(1)
> 
> +struct qcom_usb_vbus_reg_data {
> +	u16 cmd_otg;
> +	u16 otg_cfg;
> +	u8  otg_en_src_cfg;
> +	u16 csel_reg;
> +	u8 csel_mask;
> +	const unsigned int *curr_table;
> +	unsigned int n_current_limits;
> +	u16 vsel_reg;
> +	u8 vsel_mask;
> +	const unsigned int *volt_table;
> +	unsigned int n_voltages;
> +	const struct regulator_ops *ops;
> +};
> +
>   static const unsigned int curr_table[] = {
>   	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
>   };
> @@ -32,19 +47,23 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
>   	.set_current_limit = regulator_set_current_limit_regmap,
>   };
> 
> -static struct regulator_desc qcom_usb_vbus_rdesc = {
> -	.name = "usb_vbus",
> -	.ops = &qcom_usb_vbus_reg_ops,
> -	.owner = THIS_MODULE,
> -	.type = REGULATOR_VOLTAGE,
> +static const struct qcom_usb_vbus_reg_data pm8150b_data = {
> +	.cmd_otg = CMD_OTG,
> +	.otg_cfg = OTG_CFG,
> +	.otg_en_src_cfg = OTG_EN_SRC_CFG,
> +	.csel_reg = OTG_CURRENT_LIMIT_CFG,
> +	.csel_mask = OTG_CURRENT_LIMIT_MASK,
>   	.curr_table = curr_table,
>   	.n_current_limits = ARRAY_SIZE(curr_table),
> +	.ops = &qcom_usb_vbus_reg_ops,
>   };
> 
>   static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	const struct qcom_usb_vbus_reg_data *data;
>   	struct regulator_dev *rdev;
> +	struct regulator_desc *rdesc;
>   	struct regmap *regmap;
>   	struct regulator_config config = { };
>   	struct regulator_init_data *init_data;
> @@ -57,27 +76,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   		return ret;
>   	}
> 
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
>   	regmap = dev_get_regmap(dev->parent, NULL);
>   	if (!regmap) {
>   		dev_err(dev, "Failed to get regmap\n");
>   		return -ENOENT;
>   	}
> 
> -	init_data = of_get_regulator_init_data(dev, dev->of_node,
> -					       &qcom_usb_vbus_rdesc);
> +	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
> +	if (!rdesc)
> +		return -ENOMEM;
> +
> +	rdesc->name = "usb_vbus";
> +	rdesc->ops = data->ops;
> +	rdesc->owner = THIS_MODULE;
> +	rdesc->type = REGULATOR_VOLTAGE;
> +	rdesc->enable_reg = base + data->cmd_otg;
> +	rdesc->enable_mask = OTG_EN;
> +
> +	if (data->curr_table) {
> +		rdesc->curr_table = data->curr_table;
> +		rdesc->n_current_limits = data->n_current_limits;
> +		rdesc->csel_reg = base + data->csel_reg;
> +		rdesc->csel_mask = data->csel_mask;
> +	}
> +
> +	if (data->volt_table) {
> +		rdesc->volt_table = data->volt_table;
> +		rdesc->n_voltages = data->n_voltages;
> +		rdesc->vsel_reg = base + data->vsel_reg;
> +		rdesc->vsel_mask = data->vsel_mask;
> +	}
> +
> +	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
>   	if (!init_data)
>   		return -ENOMEM;
> 
> -	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
> -	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
> -	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
> -	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
>   	config.dev = dev;
>   	config.init_data = init_data;
>   	config.of_node = dev->of_node;
>   	config.regmap = regmap;
> 
> -	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
> +	rdev = devm_regulator_register(dev, rdesc, &config);
>   	if (IS_ERR(rdev)) {
>   		ret = PTR_ERR(rdev);
>   		dev_err(dev, "not able to register vbus reg %d\n", ret);
> @@ -85,13 +128,13 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   	}
> 
>   	/* Disable HW logic for VBUS enable */
> -	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
> +	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
> 
>   	return 0;
>   }
> 
>   static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
> -	{ .compatible = "qcom,pm8150b-vbus-reg" },
> +	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);
> 
> --
> 2.34.1
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

