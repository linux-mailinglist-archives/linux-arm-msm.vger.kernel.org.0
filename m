Return-Path: <linux-arm-msm+bounces-88448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F68D10AD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 940553013D77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ACD30FC1A;
	Mon, 12 Jan 2026 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ell4aY1y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="es6l+za8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583430F930
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768198100; cv=none; b=QHuDuKHjl5xRbBQUpZgrr/OP5W4wbnbJwBY3WEKEf/Fs3NXU2wWAKKcB1+RkndRMhy2/cBJuaH8wW17pC9DP3jWrfAPspFJ+uHovec1MMUR5C3Bqa/zIXNPg44PIR8HxWkEQsKeBSwXA434ufUOR/CoTE4gUCghEMeSAZQ+mBHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768198100; c=relaxed/simple;
	bh=io1/EO7qZ8D++ZWvFtGmXpjAe/dJgd4CdronI3ZJKjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFNJqvfEJOLOyop9NqNymhBphTeGxkkWtdG1NtSARVvv/Sr8K2JUVtXpAnq3AY2vSIRjNPYEeGhm7MvxFjLJ5kLmQ0VPY+aCNvumW5m53t+8uqV6hSsHquNb6ZgKPAOnJqY6wO78ZMAlY84bdkXgwFRXecnd7mp+y19QbtDu4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ell4aY1y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es6l+za8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BN01p33703588
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UoJBo1Y66hMfFOKNQH8UDtE/tAPuYhyKXUMEMjU+5y4=; b=Ell4aY1yrzhKAezW
	kl6M6n+qfqlMgVcXwRX2xfN2HnrySP76vmLsRvbjSm5+7byAjjp3lZQyaZvEoMRY
	3a5e+CRI2fvqHJDJ9vYh/sikosLNlCNAMBloukE1YJoE5m9sFavPBGWfsHkK/Fs9
	3/NCyocY+TmfuL6JndEr7eN5UHZ74bw+u24yijN8Zi7X7p/z6cX/XFHDkH9nkUj7
	c7mjbr8T7xAd8QV7qpvQQzCin1zJiqScTOUR468dYSrk/yJPPkNCooVq+d7NZ3XF
	E5kMtlmIQERVCddl/M8GwLR8sfqlCp0O5JAuNRnzAN9pAoZOJXquRdmCXFnNpBe7
	GU0kRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks25avym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:08:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a09845b7faso47462935ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 22:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768198096; x=1768802896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoJBo1Y66hMfFOKNQH8UDtE/tAPuYhyKXUMEMjU+5y4=;
        b=es6l+za86uodzZh3zswZtixLNTsWqJvfpcK33Pyq2NQVPDfgv1m8hDNa3l25CQ0v3D
         KvRHNqJ4U4BclCO8iho2BSy/P/xajeFZL4/oQYblR77bvF0/KqEqQZg23LZuvPMZSInb
         BEzd4IDU1EIsJHlsIgAbuCBWEA5Eisotf7ofF9442ElzOSzS/us5cSLxoUBm6n9rI04Z
         XqWGnqQOzvSwiV2DfnG6/g7kiGbik1/yGTy0EJgsVeXp5r6JiqcLpbWfpM7Rgk8K+v/F
         eYc/22lr3vHoeBZdIB61JsmSIgJ6Av8CJqKqLjXFRltfwpAbZ1knT4Q+JLTTGKoMwXOK
         5+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768198096; x=1768802896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoJBo1Y66hMfFOKNQH8UDtE/tAPuYhyKXUMEMjU+5y4=;
        b=L75FnpKt8dQygnVVit4Auvy07ninNhDqOZ699fsNE8fwRciZhBu6QHT4CzrnSMmFDI
         /e35RXYcomP4muGDmsSi5Okws2xljUi+aiQKB2Eiief4k4yuMt5lHoZeDMgAWSmDwFlK
         JudNDwGIwMFaPe8Tnbuyjr1gqT8oL0UERrqYzUJQy1QTgTGDEuH/gsIameORBww2612g
         1WLS9PqP//NehCyuuYDXYkxMaltXVCJzTPZbtHIC77GpAPyt8Mqsdadouni+WFj6B2+J
         VzLzFw+YXsZild6jHcU8GCIgGhpIeg/ogYWxzlIveOgeeK/JlUxoxQtAsGCV8f+b8DHS
         3nSQ==
X-Forwarded-Encrypted: i=1; AJvYcCULTKjRX3t+WuOjoL6ELyWF+jAjWhLFNjsoK9gwHdml6CkvKC2LGARZZ9Zv55fP4zjLd7CST27UI2mhm9V+@vger.kernel.org
X-Gm-Message-State: AOJu0YysL9I/xiZ1cuLXe0XwqZkb6Hm0moap3ReGgDlXzxEyiJpvLoBm
	T7kssa0iz/NaCfncB4IBW/in7zck8635ZyQ88KV+SMRErBP4aqneRFAow5pmeokMiwoacsC+v2g
	hPlE0UcuS6+rKfDU1cFgQs5MxkWxVkqMJqOad7No1ggHD0+X1yGo+0deETgk/58ZZCgBR
X-Gm-Gg: AY/fxX4II7Ek+drqwZ4p20XdDgR4umFYR8f9RiC0cZ4k2WBFXloKwfJUYEp9kZ2iN7B
	0ahK95MoV20mOXl1Numc6p8/w4fCHU+tyo+4jF9hfsMuIIjMhDFmYWA2ooqILi5gXK6pF9Ypk3N
	33jCuukFqKvRel4tSDHWsmAGjWB3H6Aa2TfUfF/7HkGoIUqSWeRrbUe0vk+4wzfAAWCUN4VFiHf
	WoGA3A7kRzyounwJinBQqx/DQmF44c96E+1aSGiAfFn50Tbijc0C0y9k1bLv4AUhmtRj1S0Vys+
	ZOkA2sIiaAzBjxNoT+5SGS5itZRacTSQxYfDbhGKNJEtNyfr9mmu0VrP2CcYJb2/1VuyIYGvOUx
	8OYynSlC+NkcgQqikc5LCi5NCpIrpLUWiCbgiipHQ7yRFLA==
X-Received: by 2002:a17:903:13ce:b0:295:560a:e499 with SMTP id d9443c01a7336-2a3ee43316amr150407045ad.5.1768198095886;
        Sun, 11 Jan 2026 22:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpmcoGyinZqbF4aQR7iNidBKkm+5B7iUJMyIbDtw53UPyD4r99nrU/m7uA3scJIp8dtt2ulw==
X-Received: by 2002:a17:903:13ce:b0:295:560a:e499 with SMTP id d9443c01a7336-2a3ee43316amr150406685ad.5.1768198095353;
        Sun, 11 Jan 2026 22:08:15 -0800 (PST)
Received: from [10.152.197.138] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2b72sm163943995ad.51.2026.01.11.22.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 22:08:15 -0800 (PST)
Message-ID: <0cd181c2-76da-4b6d-97e6-bcdd553e6850@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:38:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260106105412.3529898-4-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.palanisamy@oss.qualcomm.com>
In-Reply-To: <20260106105412.3529898-4-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NiBTYWx0ZWRfXxc+0l7F6KLin
 RAJY4Kb99id1oE008AgHjP2dGzGECFLUysrBkmKsJzC1Ri44+lP4cjoow8qksslzWuYpC1tBmMc
 pF30E+i43kHcqgRYkNrqCT6Qt5N3kv0NDIqC5ECTmEU+ZS9jpCrAzoMLmI8jSj5z3k0PrBhfK++
 N9Z7TraLXY3sUn5iVnHM+ty/Ca2MmmjtHx7urOOuB+vkaSyQ9OpxDGSIOM5kZFv5+k2cRJA/fbf
 8kWhgVUkmCMhYlt96GzDX/r3QQwJivaXhvxumG1SwOYRqBW94pk6LhTJNkytFkgVdg18qTBs/+p
 Wv+4GTwpWkMNZkzuyAwmFMsTE3/9QWSS4cVNA8FC9I2hNzyu3KX5jHVyyykBIaAlDk+O1/RKoSY
 emy/lFa83IX9L0kIUODzIMHI1uKnRo1alfSw1yGBQl6g7pZ8c4r8QKXs9kQr/k/A4ZTu+l2VjEt
 S+bX8+gF6u8SP9fGb7A==
X-Proofpoint-GUID: IhVeDJOalcK_L33b2LEK-9oCiiNFRw46
X-Proofpoint-ORIG-GUID: IhVeDJOalcK_L33b2LEK-9oCiiNFRw46
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=69648fd1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UqCG9HQmAAAA:8 a=iG3OsJvFCE3OXJAcmq8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120046

Hi Varada,

On 1/6/2026 4:24 PM, Varadarajan Narayanan wrote:
> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>
> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> SoCs support secure Peripheral Image Loading (PIL).
>
> Secure PIL image is signed firmware image which only trusted software such
> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> load the PIL images.
>
> In order to avoid overloading the existing WCSS driver or PAS driver, we
> came up with this new PAS based IPQ WCSS driver.
>
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v8: Dropped ipq5424 support.
>     The comments related to 'use_tmelcom' in [1] not applicable
>     [1] https://lore.kernel.org/linux-arm-msm/72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com/
>     Changed copyright for drivers/remoteproc/qcom_q6v5_wcss_sec.c
> ---
>  drivers/remoteproc/Kconfig              |  19 ++
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 328 ++++++++++++++++++++++++
>  include/linux/remoteproc.h              |   2 +
>  4 files changed, 350 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
>
[...]
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> new file mode 100644
> index 000000000000..10fe3391decb
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/clk.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +
> +#include "qcom_common.h"
> +#include "qcom_q6v5.h"
> +#include "qcom_pil_info.h"
> +
> +#define WCSS_CRASH_REASON		421
> +
> +#define WCSS_PAS_ID			0x6
> +#define MPD_WCSS_PAS_ID			0xd
> +
> +#define Q6_WAIT_TIMEOUT			(5 * HZ)
> +
> +struct wcss_sec {
> +	struct device *dev;
> +	struct qcom_rproc_glink glink_subdev;
> +	struct qcom_rproc_ssr ssr_subdev;
> +	struct qcom_q6v5 q6;
> +	phys_addr_t mem_phys;
> +	phys_addr_t mem_reloc;
> +	void *mem_region;
> +	size_t mem_size;
> +	const struct wcss_data *desc;
> +
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +	void *metadata;
> +	size_t metadata_len;

above member variables are now unused.

[...]

> +
> +static int wcss_sec_probe(struct platform_device *pdev)
> +{
> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
> +	const char *fw_name = NULL;
> +	struct wcss_sec *wcss;
> +	struct clk *sleep_clk;
> +	struct clk *int_clk;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
> +				 fw_name, sizeof(*wcss));
> +	if (!rproc) {
> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
> +		return -ENOMEM;
> +	}
> +
> +	wcss = rproc->priv;
> +	wcss->dev = &pdev->dev;
> +	wcss->desc = desc;
> +
> +	ret = wcss_sec_alloc_memory_region(wcss);
> +	if (ret)
> +		return ret;
> +
> +	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
> +	if (IS_ERR(sleep_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
> +				     "Failed to get sleep clock\n");
> +
> +	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
> +	if (IS_ERR(int_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
> +				     "Failed to get interconnect clock\n");
> +
> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
> +			     WCSS_CRASH_REASON, NULL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
> +
> +	rproc->auto_boot = false;
> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = devm_rproc_add(&pdev->dev, rproc);
> +	if (ret)
On failure, please include

qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);Regards,

Regards,
Gokul

> +		return ret;
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	mbox_free_channel(wcss->mbox_chan);
> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> +	qcom_q6v5_deinit(&wcss->q6);
> +}
> +
> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.ss_name = "q6wcss",
> +};
> +
> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
> +	.pasid = WCSS_PAS_ID,
> +	.ss_name = "q6wcss",
> +};
> +
> +static const struct of_device_id wcss_sec_of_match[] = {
> +	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
> +
> +static struct platform_driver wcss_sec_driver = {
> +	.probe = wcss_sec_probe,
> +	.remove = wcss_sec_remove,
> +	.driver = {
> +		.name = "qcom-wcss-secure-pil",
> +		.of_match_table = wcss_sec_of_match,
> +	},
> +};
> +module_platform_driver(wcss_sec_driver);
> +
> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..7b2159853345 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -472,6 +472,7 @@ enum rproc_dump_mechanism {
>   * @node:	list node related to the rproc segment list
>   * @da:		device address of the segment
>   * @size:	size of the segment
> + * @io_ptr:	ptr to store the ioremapped dump segment
>   * @priv:	private data associated with the dump_segment
>   * @dump:	custom dump function to fill device memory segment associated
>   *		with coredump
> @@ -483,6 +484,7 @@ struct rproc_dump_segment {
>  	dma_addr_t da;
>  	size_t size;
>  
> +	void *io_ptr;
>  	void *priv;
>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
>  		     void *dest, size_t offset, size_t size);

