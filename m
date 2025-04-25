Return-Path: <linux-arm-msm+bounces-55618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E609A9C80F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D17216E515
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0913A242D99;
	Fri, 25 Apr 2025 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0L+Fz1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15A1DFDAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581652; cv=none; b=VjTg0KOJfxGd52wYIltpAUEo6dxgXuE+UrVHG2ilWfJ48P+sa4AwYR1ArdEpJDAynpiDSaj0jIplDu8GBs7ZcuIj4QBIekIJZSDkedoAZNOMuDareM+fdafaq/UR/eBKdRMCCy2dj2CZTM/qu51DX70LVSuEYS+4m9x57UnuBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581652; c=relaxed/simple;
	bh=XO7eXHdqI8BqtXpaSUZZG5qhD1KGohbFDHON/kPDFUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnCR1/OtwfOTJoCVmqat1J64gzgv7RoAQ5Sh13y39uIHgVdB89o2MNNDakXGMjsBAPaNYGp1eNzD5t9vSTcqyf3MbGoylH9OFEkPqtEIlxYs90VhvjsyrnVc71cgXZMdWAoZngUbS4VP3b7+zzRGhk7pxAcdBD99/oZdADQyCIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0L+Fz1B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7YC008600
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EeiwX9qep+py+Z9/Et50dh896Nhy1ey1iEAX/LwG30=; b=d0L+Fz1BdCbFVdX5
	3srrdgjirGruOnQOUxnqWFPGG2PH47ZwvaMXZFeu21j1TiVv6qeCzVf5U/2DJZ6s
	CwyaNVYkKTW8lxu269mtw8grSneTkGNpd+hVqcXNxVGtgeiG1W5kZMPdGfk1q6gE
	Z8ifz/6s1kY30y+gDIp7U2D/ebdbNpENS7oa/RxWg8SW69TtI8xfj/myzL03lCKQ
	v1etWNx++/SZqy7s+VqVOJWYxMRDP+GahcQJ6fL2UlxWGlEO2MeMhCo9xWSbVjtJ
	ZdBfm/WQeymlQQR52Fo/Zjnc+mVqxn9KLcYz8iogGmcXgL175qCObJ6rDqk+XLlU
	ZO7h7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8v8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:47:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso5476956d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581649; x=1746186449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EeiwX9qep+py+Z9/Et50dh896Nhy1ey1iEAX/LwG30=;
        b=dtdI5/PHYTBsvEWG8ohkcS346+MXSjc7KJDQF41761QWCz9fJpJLjXkahmtbRIAKzJ
         QqWaez6G1qySR795bWf5cLmoZSJoHkxFXTPajQuVMqli2Aj/DTwHcUvma8eT9erYljCi
         M2i/X6BI/AIHc+1z7TZ2BVT8AAFONpGD+QYRh6B1GPHIFXtGQt33+vGXC6eOSeb1lofh
         u3akEmEPhwR/UsQ7vG4mUs161lT1MPpXyVMWEOkF6NKrPErnFomLOlfMvva2zo/Xngb0
         fgwIcNxdBKO07HcYouiZxPFFR9C5h08AO2XcvTgbRtoqKMBTmYs+JyemaT2Yqw4Rd7lh
         gW7w==
X-Forwarded-Encrypted: i=1; AJvYcCUuu/NAHuirHQthv2EmB3XsGulydBly9JnPwLP060Uh9GShi31g8Ih0J/lRIZxQqzta4p7RCf4JSTTeqvgu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2eBIFFExzYT3BDc6RQ2PN+MLjHm1BW1cFS4ToNRgivVhRB8v
	7t3YNMbKY6j51ouJvma1uu8P/CvuzHzQgCt3feE7XL1cYRqBiUZC1rl8grYJl/ClW0c7KZx8e6a
	fJs1fmfLn87de8TplvtCgOnCSbM9aSDaLEZCOfrzNBIy/2n610utwQN6m4mhdKskt
X-Gm-Gg: ASbGncsOmOGHhAT4dPFEGjlSwJB3SnqNT7qxdtj/8d8IedTjclRkejfRUoqyJc5UUem
	diTiihTQR4iSE7EnXEdGNAr7nZKQNid+7oue7ONUmYPvwPrAujpjiT/Vu22iza4RPVAjce2E7r7
	ey/rdjl+k8Onqhc/EmpK7m4y40/w2lRBmmNAk/dXKCbZ8zv1RX8qEx6R3ohYtP7DWepcCZA9vX/
	8eG/Uz55WCeBA/nHikcpvMMVEcpJ0kxWkgLz5fl0j1wrshM/RP8q8RSAlrcUAr+AVxqkRAEtlhQ
	8q/1TnhNl+8s0P+cAJcM2KCiV8lbIPBLA2js7whb68JY7uPqCewypk28DKtmk6oh
X-Received: by 2002:a05:620a:254e:b0:7c5:606d:dccd with SMTP id af79cd13be357-7c9606a36b8mr125289385a.1.1745581649017;
        Fri, 25 Apr 2025 04:47:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoKRaTeGlfhGtgePJI4DvsKPnQLdcM67oaFtMLoRU5+ujh2fa+ywF19BWSakcsqA6J27vZA==
X-Received: by 2002:a05:620a:254e:b0:7c5:606d:dccd with SMTP id af79cd13be357-7c9606a36b8mr125286785a.1.1745581648458;
        Fri, 25 Apr 2025 04:47:28 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed729e5sm123047566b.151.2025.04.25.04.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 04:47:27 -0700 (PDT)
Message-ID: <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 13:47:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4NSBTYWx0ZWRfXwuSSM5nZQ3HP nP9snOJH+BnNFF8IYbN6PmXoUoM8T4FUrBtyTVvCIOk+4JCYPxKiDQf0CFFnYPeemcz4osZQVUE o8lalS99qEFLcKVJHC/FOwVDV/rk2cergxmXckt0IBd3ACHh78zvaY9QWRKt3L9YU+LraeYuJAi
 H+kXTRXbmXcJCznT0L6IgxFo7Mm2rfnaLn9hgwHxeQ1s5TRPzKo8OwlrQIK7PMUQBegG/G2wwAm Mj38Vq/WjKpyRC56wDymIcg6uv3cbnQDciX9MVJ3UYZ3gkPG0ygd8wmEcYfHdsot9oUTMQlxxhR 3jS3dU0iPv5ZgUGg2cry7682oZ2lj2OJ0TPWo1xqtSpZe4HF4KKnIWQ/4D+K/fzmqL4YkUmDLwC
 duWEZkWXMTzOkFKih1seBMx1XVChu9k/9xgpG0+1u3B57203efoJi8HAHVl1JrqbGwxfFmMl
X-Proofpoint-GUID: PKRwBQmcWO44YLzACJLgJboi7ns86LqA
X-Proofpoint-ORIG-GUID: PKRwBQmcWO44YLzACJLgJboi7ns86LqA
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b7651 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=vBGl1dCRJspItBWZnfAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=659 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250085

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> SoCs support secure Peripheral Image Loading (PIL).
> 
> Secure PIL image is signed firmware image which only trusted software such
> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> load the PIL images. This change also introduces secure firmware
> authentication using Trusted Management Engine-Lite (TME-L) which is
> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
> TME-L for image authentication if supported, else it will fallback to use
> SCM call based PAS request to TZ.
> 
> In order to avoid overloading the existing WCSS driver or PAS driver, we
> came up with this new PAS based IPQ WCSS driver.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

[...]

> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	int ret;
> +
> +	ret = qcom_q6v5_prepare(&wcss->q6);
> +	if (ret)
> +		return ret;
> +
> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {

You abort probe if wcss->mbox_chan returns an errno, please rework
this to use if (use_tmelcom) or something

[...]

> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +
> +	if (!segment->io_ptr)
> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
> +
> +	if (!segment->io_ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (offset + size <= segment->size) {

I believe this allows an off-by-one (remove '=')

[...]

> +		memcpy(dest, segment->io_ptr + offset, size);
> +	} else {
> +		iounmap(segment->io_ptr);
> +		segment->io_ptr = NULL;
> +	}
> +}
> +
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index;
> +	int ret;
> +
> +	/*
> +	 * Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	for (index = 0; index < num_segs; index++) {
> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);

https://lore.kernel.org/linux-arm-msm/20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org/

[...]

> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.ss_name = "q6wcss",
> +	.tmelcom = true,

"bool tmelcom" is very non-descriptive.. call it something like
use_tmelcom, or maybe flip the condition and call it e.g.
tz_managed

Konrad

