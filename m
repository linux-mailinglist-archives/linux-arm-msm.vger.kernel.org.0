Return-Path: <linux-arm-msm+bounces-25608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBF92B5E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55551B20941
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E61156F5E;
	Tue,  9 Jul 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDEQtLrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5592155A32
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522312; cv=none; b=knJeNWaBpg2MxnCDyWXvhFNFe+W6h2Kx8+tS2v2+l0mA3dFBOPTZ14j3E1kV5Vp4S4PUeqnR5Mk1HJG8OqZL5Ke+treRrVrw8KmLJxSFd3blQGn9xTXVe985HXG5jbXpxCkUEsE2AUtAHV3N+2mWK29MOtfGSIFafT4BSwEYokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522312; c=relaxed/simple;
	bh=cA3RUsDXkBxoSAcMkVT+b+ttoxvbnJTaUNYMDvI+vCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOqwRNd2qpy6MSruQY3fJz9tKxf5yVu7whmCGu4LGlQthtOPlbxlXdWZHQmcCX/hg9sCsoaDaHet7ObiHb4eNbkJeJU6xu/5gXw20eI2JWu7HaCuRubXIU0PPCIcIBAmob45mTolrF9R6ywaTmaJ76nkgeiz0qArko6MY5vp3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uDEQtLrN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-595712c49ebso407737a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720522309; x=1721127109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2aJgCIXvib8wAEOFFZMtmdbxaP8wt49zCXrKRn4F5nc=;
        b=uDEQtLrNf7ItHaqNDTJEsA+rtGqB5val6xN1cWYHXvK54baL+oiHrIHGEBnHHMLblZ
         I4iY+GoMhHVGfAkpyfQgHkcCDhdotkltBlNQzS2Ic5gvd78TyiwaiaCvXi475colSdhQ
         d2RqPyb0Q6eUg9jzhJuzwHa+MSF4PwRFuIi6LNTnFQpUT33GbHKHQ+jV0P0ZXtnJ0A6G
         8qSAGkC8C+LWDZd2XfXgeNNpyeLR47pOSY2jbhOEuZNWqnCQZhwKSk/9aOrBBsYRTwF9
         PHNpYcfZaVP6Hn9l7y49jTum2dVmw0XiaR6aQesyHxAkr2hKF8x9hQdnirjsISKoP1lu
         VXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522309; x=1721127109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aJgCIXvib8wAEOFFZMtmdbxaP8wt49zCXrKRn4F5nc=;
        b=uqY5WWMTmxUsaNVmRTZLDkG/Wax7I7B9KvDrfI9omVSA+AOMD13LCnY2ayyWmHE7YM
         Q4nX9Z2IFJHqThghkuSZNbpiQrpnDNBRvcLbbmDnk3nqdZ1TlZ6nugEn03fHyG1DxUUg
         oioT09/jjHC5lithmtzoX+nBuvO3rNT93jshe7Svv822pIN0ND8i9DGKGraMr/ec/3Ft
         5JxRqA0GC/w3h2pwMPVU1AR45txaNbCqtu6VXAQFT/V9J/HvbGz7WAYerIkaVeKWhfpF
         Gz55zlF0hyjwVsD5VV8mBykxXbeD/ngYcWG/ryZDDoBo9bQr+Fqnyi6Mpf8judvbjoX7
         lV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKFrJPxk77IgJTaTgCcLxE52dyHJtSaRGm3+n3DryiF/iOC2n3dcMd/4bjnZ/ArzihwpK7AxTVQ2HTHgQfw4EJkLQPeoTqPC+bhI2qfg==
X-Gm-Message-State: AOJu0Ywix+BxDtpuVzqJhR0HfNe7qqUJFzJqOdSW4jY60BebB4FmOA1O
	rTQDOl9HfKPEDNMgXrwTkm83SXr1a0Ae0COdDURT3Pm2Wy4RL07+smXP863Zx/o=
X-Google-Smtp-Source: AGHT+IGY7qmSYB6tpHSuApW/RciJG8sWNKiijIGpjoUVIGgaO/IQe1kPnKTxAnF4IVl3aQWTI3uEkg==
X-Received: by 2002:aa7:c258:0:b0:57c:abf9:e6ab with SMTP id 4fb4d7f45d1cf-594bc7c7df9mr1503050a12.31.1720522309015;
        Tue, 09 Jul 2024 03:51:49 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c9e78sm929125a12.57.2024.07.09.03.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 03:51:48 -0700 (PDT)
Message-ID: <54219ac8-45e2-49ea-b49d-d5304b8b7d94@linaro.org>
Date: Tue, 9 Jul 2024 12:51:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 3/4] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 Amir Vajid <avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-4-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240702191440.2161623-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2.07.2024 9:14 PM, Sibi Sankar wrote:
> Introduce a client driver that uses the memlat algorithm string hosted
> on ARM SCMI QCOM Vendor Protocol to detect memory latency workloads and
> control frequency/level of the various memory buses (DDR/LLCC/DDR_QOS).
> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

[...]

> +/**
> + * scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
> + *                            by the Qualcomm SCMI Vendor Protocol on the SCMI controller.

'enum scmi_mem..'

> +static int populate_cluster_info(u32 *cluster_info)
> +{
> +	char name[MAX_NAME_LEN];
> +	int i = 0;
> +
> +	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> +	if (!cn)
> +		return -ENODEV;
> +
> +	struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> +	if (!map)
> +		return -ENODEV;
> +
> +	do {
> +		snprintf(name, sizeof(name), "cluster%d", i);
> +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> +		if (!c)
> +			break;
> +
> +		*(cluster_info + i) = of_get_child_count(c);
> +		i++;
> +	} while (1);

of_cpu_device_node_get(0) + of_get_next_cpu_node() +
of_get_cpu_hwid() & MPIDR_EL1.Aff2 [1]

[...]

> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
> +							    struct scmi_memory_info *memory,
> +							    struct device_node *of_node,
> +							    u32 *cnt)
> +{
> +	struct device_node *tbl_np, *opp_np;
> +	struct cpufreq_memfreq_map *tbl;
> +	int ret, i = 0;
> +	u32 level, len;
> +	u64 rate;
> +
> +	tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
> +	if (!tbl_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
> +	if (len == 0)
> +		return ERR_PTR(-ENODEV);
> +
> +	tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct cpufreq_memfreq_map),
> +			   GFP_KERNEL);
> +	if (!tbl)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for_each_available_child_of_node(tbl_np, opp_np) {
> +		ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
> +		if (ret < 0)
> +			return ERR_PTR(ret);
> +
> +		tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
> +
> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
> +			ret = of_property_read_u64_index(opp_np, "opp-hz", 1, &rate);
> +			if (ret < 0)
> +				return ERR_PTR(ret);
> +
> +			tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
> +		} else {
> +			ret = of_property_read_u32(opp_np, "opp-level", &level);
> +			if (ret < 0)
> +				return ERR_PTR(ret);
> +
> +			tbl[i].memfreq_khz = level;
> +		}
> +
> +		dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
> +		i++;
> +	}
> +	*cnt = len;
> +	tbl[i].cpufreq_mhz = 0;

missing of_node_put, or even better __free(device_node)

[...]

> +			/*
> +			 * Variants of the SoC having reduced number of cpus operate
> +			 * with the same number of logical cpus but the physical
> +			 * cpu disabled will differ between parts. Calculate the
> +			 * physical cpu number using cluster information instead.
> +			 */
> +			ret = populate_physical_mask(monitor_np, &monitor->mask,
> +						     info->cluster_info);
> +			if (ret < 0) {
> +				dev_err_probe(&sdev->dev, ret, "failed to populate cpu mask\n");
> +				goto err;
> +			}

err.. the same number of logical CPUs? as in, PSCI will happily report that
the inexistent cores have been booted? or some cores start doing some sort
of hyperthreading to make up for the missing ones? this sounds sketchy..

Konrad

