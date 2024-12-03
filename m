Return-Path: <linux-arm-msm+bounces-40028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FBD9E159D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8721EB2287D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FFC1D90A4;
	Tue,  3 Dec 2024 07:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAActp/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3241D7E21;
	Tue,  3 Dec 2024 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212685; cv=none; b=ILm9pFE3oEQ9KTs9qvSRJEmWZumhzdTk3VnhAnQBqzjw3UXU+76Sm2CuUEUvMQWc0F0+ZcUVtIdHBTMsEC2pfpiaqiBaMPmWgRI5PrikUiP/DV5fHw1bWguFTQJzHRmB7IYxs/GH7OTTqBq7JA3bQ8kHQ3t+AdAZ4uD0wY6Uuhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212685; c=relaxed/simple;
	bh=oeDwSYbDtumcWtXKju7ig4LuBaFcBdeCDLukpWkhVjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAuUImg3+N0URpwiJBQxknjUSqjIY/ut73EmOCwpZnwZYzoEAc6F1WOIPyjtZZ3AG5tlthfnrIOuQJKt2R7JfwNyhOINNz/ZNavY6dN0Udv78A0Mt+axkMCaVSl1GgRAAPfnJmcMJ1m7zPUrwtYLl/i/VXPPgVYXkrY8FAA4x4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAActp/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0BFC4CECF;
	Tue,  3 Dec 2024 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733212684;
	bh=oeDwSYbDtumcWtXKju7ig4LuBaFcBdeCDLukpWkhVjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XAActp/a3d/1FEPPdChndcExrPN5zf5hJJ2JE5jKPbV9k4bbkdWCwYaMzUe63RKT6
	 f85LqG6uXO4kgScKGdcXz23Y0kwgsH4MZwAchznbe0+rsX6pUPbU18hnzimKDNv6MY
	 YAbPgosIyC2xaxI2u1wsGZx7Oz6oufjckyXxTTUwbBn4ng50fZa5ieOXMI7DgL14t7
	 tpeBe/yyfIPncGqeZ5tATagOKfDR4aZuxZVA1KDpQ4gds6Swcu0ZRJVYU/ykddBPeF
	 8chXBQ9+oC/A8wiKPnqjeu5COJr987FlN7GDfmUebSInifNnb3tKntd5ElG1rDXD1a
	 2Fdh2NygbvG6Q==
Message-ID: <00e3bd13-eab8-47b0-b577-dfdb3bd5900e@kernel.org>
Date: Tue, 3 Dec 2024 08:57:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] tee: add Qualcomm TEE driver
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 05:19, Amirreza Zarrabi wrote:
> +static const struct tee_desc qcom_tee_desc = {
> +	.name = "qcom_tee",
> +	.ops = &qcom_tee_ops,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int qcom_tee_probe(struct platform_device *pdev)
> +{
> +	struct tee_device *teedev;
> +	int err;
> +
> +	if (!qcom_scm_is_available())
> +		return -EPROBE_DEFER;

So this is part of SCM? Instantiate it there instead of creating fake
DTS nodes.

> +
> +	teedev = tee_device_alloc(&qcom_tee_desc, NULL, NULL, NULL);
> +	if (IS_ERR(teedev))
> +		return PTR_ERR(teedev);
> +
> +	err = tee_device_register(teedev);
> +	if (err)
> +		goto err_unreg_teedev;
> +
> +	platform_set_drvdata(pdev, teedev);
> +	return 0;
> +
> +err_unreg_teedev:
> +	tee_device_unregister(teedev);
> +
> +	return err;
> +}
> +
> +static void qcom_tee_remove(struct platform_device *pdev)
> +{
> +	struct tee_device *teedev = platform_get_drvdata(pdev);
> +
> +	/* Keep a copy, tee_device_unregister() sets it to NULL. */
> +	struct tee_shm_pool *pool = teedev->pool;
> +
> +	/* Wait for users to go away. */
> +	tee_device_unregister(teedev);
> +	tee_shm_pool_free(pool);
> +}
> +
> +static const struct of_device_id qcom_tee_dt_match[] = {
> +	{ .compatible = "qcom,tee" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qcom_tee_dt_match);
> +
> +static struct platform_driver qcom_tee_platform_driver = {
> +	.probe = qcom_tee_probe,
> +	.remove = qcom_tee_remove,
> +	.driver = {
> +		.name = "qcom_tee",
> +		.of_match_table = qcom_tee_dt_match,
> +	},
> +};
> +
> +int qcom_tee_driver_register(void)
> +{
> +	return platform_driver_register(&qcom_tee_platform_driver);
> +}
> +
> +void qcom_tee_driver_unregister(void)
> +{
> +	platform_driver_unregister(&qcom_tee_platform_driver);
> +}

Why open-coding typical module platform driver macro?


Best regards,
Krzysztof

