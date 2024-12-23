Return-Path: <linux-arm-msm+bounces-43156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5839FB07A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 16:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D7B9165191
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D260E1AF0A8;
	Mon, 23 Dec 2024 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJi1iZim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399768BEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966142; cv=none; b=smYCEtxt5b3vX1rprnLBkkjCGxoVsnKK2X5z4NG5jf9s0FjwfvrSs8Qcab9ZzFicJ7zU5GLYc7pg01zlLT//QpIPjj+mPVfZtpcn2BYbrR68OGrglYsC97lFybSNbAL5qM9Oi1bsBC2jU7ijhIqZJdoY7sNggu2gygbZAgbV3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966142; c=relaxed/simple;
	bh=grlzk4olmyXkI1Xgyy2M1j32DqQ7AzAtRZoNmXWBG/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkWpAHx7RqoWnJ4IIbx2qkiKm0w740jv6B9PnNsLmC6wmUi/PENaRDAJcqWhg0n4CgthcsV91HJw+uANVR9sWG5e4HfnLlWGGCSdYtioukfGtriPgNpzoSXiu5lKJJs0Xub314eyVPlf2MrH7UsOyxXgClEpjQ+PkYSwDKIqtwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJi1iZim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCuikI002353
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 15:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOueQRrVOdVdBWKPBRxKIz6jCEFS3rdEhZ18GsC/lhc=; b=EJi1iZimqFrk8pL4
	0Z7jnBsgzo69O8LRaWOYiWzbsY6zNDwEWV8U/WToThuKWadCoLsOX/ZjzTlYwlRC
	+3URRnWvvH8r+fakvVOJPSHQzVXRwlTnrFzOPOJw92H+EcsroAoU9uPmJuPcMHyx
	BBymPLaPW9JWiNSd/lcOkl2f73wrZYutmfkFsttN1992BeyYRrwTpO/1ixjzM6GF
	CYTQN+FW6fHHKCCP/XU/8Bp3Ld2id0fnfqxQ+Do617U2FckWY2cqBE7VZWmTXz2i
	nw84c/FlXkiVKE9OF1Ng6hvp/qdxMAj2MqxgISDkF8f/7G56GKg2ZdC8hogN11yx
	zKrJww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8ah8ckw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 15:02:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46792962c90so7985551cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 07:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734966139; x=1735570939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOueQRrVOdVdBWKPBRxKIz6jCEFS3rdEhZ18GsC/lhc=;
        b=VOFHyZBSmISNE+ydt+otX9nTT/Iu4IViiBDHJRKFPaVnT00YLDy/NZxd5usdCDCko6
         fdRorF3kFu3UkF/sRk+eSe+gUbUDEa5VaptSm1S5+B71KbvuIkZR9qPcl5PcqIGTuuns
         dz81Zkk/7rEJjs+wBI/VmG0P8lJBcvbz9IgI2IdCxIcrh8vquO//Y3Rp4R61vgN7hFI3
         dqZVCk0fDfSq+bU7euuPqTFV2DR4HDeUNALmWjE7qOIR7FgHhlgOTeIzpv2+NWiO1XFb
         5ytxzlRXODo1E+X0SzUiuN1qAJX9s/Z6iA9CY/NDRYDtST3ERP7lNIrGpJ1YDZs/CBDv
         oi2A==
X-Gm-Message-State: AOJu0YxjNTQpuB9vfAXhqgeIYJft430cB0ghwkF28qIwq0JM6kcTLmrx
	BrTn4XspXTwtmLb/TvvEhn75AmCsypKNCCnKjKYbzZyvLmwJdq9nGpuweVmCS4735qj3oZ6I644
	cLbWE55c+Lo36v0U8l6YYDYKWmhVrKl6zBrU3OviYG1d0XLEYmMX0BVoU7bGHcOfa
X-Gm-Gg: ASbGncsz+Nw7pIUzeuNQOyMepPRLN1rY4KSKN/THexSn0Uf7d8koI2EoLz9S3ZkT5Eq
	wQk/iQWU+LDOybNYzFiklE/EHGrv3W99v563eusy7o4UsaZEz12JqEu6q30q/qw9MKCv7an8Avj
	4lqlcM/UwawsTEjxUiKVztSceLeNrhpudAPkaUY7Oce6LN2qzJSVwpVOUo8b1SR2GeouiuORXX8
	OZcn3/Q0x3MJRcjguZvKX5EJ8+CVoyms+D98qSiIyVm7TGUdjbPD/8GK9KlxAnWQAbl4QqAzRk0
	n9KQ+oz8WuSXC98eWHGNRS9SxP5ZTFRQ+qI=
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr820185085a.7.1734966138874;
        Mon, 23 Dec 2024 07:02:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHREjQZz+CVTbzd5TYeq0dnl7WV9RvuT6R2vxSIAg60SPUsaB/sHNZeP/tyzrWvz3trjyaRwQ==
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr820181785a.7.1734966138353;
        Mon, 23 Dec 2024 07:02:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm525618566b.133.2024.12.23.07.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 07:02:17 -0800 (PST)
Message-ID: <f07d9efc-fa3d-44e2-83f5-621ffeaa9f91@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 16:02:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _L783-2Ph9jCpGxErKIB0bkESlH08sIm
X-Proofpoint-ORIG-GUID: _L783-2Ph9jCpGxErKIB0bkESlH08sIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.
> 
> Those entries will then be used by the GMU when passing the
> appropriate bandwidth level while voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU
> +	 * The 'CN0' BCM is used on all targets, and votes are basically
> +	 * 'off' and 'on' states with first bit to enable the path.
> +	 */
> +
> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_num = 1;
> +
> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
> +
> +	/* Compute the wait bitmask with each BCM having the commit bit */
> +	msg->cnoc_wait_bitmask = 0;
> +	for (j = 0; j < msg->cnoc_cmds_num; j++)
> +		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
> +			msg->cnoc_wait_bitmask |= BIT(j);

Still very much not a fan of this.

I think this would be equally telling:

/* Always flush on/off commands */
msg->cnoc_wait_bitmask = BIT(0);

with or without that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

