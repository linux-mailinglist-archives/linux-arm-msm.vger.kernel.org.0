Return-Path: <linux-arm-msm+bounces-68103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB50B1E53E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0758C1884920
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE726560A;
	Fri,  8 Aug 2025 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydXIEDL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA59225CC4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643732; cv=none; b=MqcCZlliz39v5/DbB+tFk5Vox5h9qpGHn2gifK4BPzykSkHl+lnyOHhF+gGbUg0uJzAT0bemxH21ugkRDBbZkdYNU7+zIjyPcTyfebYOWvDPgQ+1HGV7+L5mu02P9LXChyvP2+leKsbyGq4l/sF5iqh4nlmWKiR05/qRyvYBHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643732; c=relaxed/simple;
	bh=fDzavJLkQQRW13faP4JIo9BN2hll5Ct+MBqPxVN6J7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncQ6+Rz1EXhjernjtYKtNxkCoibkl1lG49x7QmNJEhC5WrNPOwz1ubWZ2OPitcls0xzhqaLx2pZJy9t2/KkRTBo+DRun7H87khm/2b6qSLtM8g3Hq8vx9M8rjMxnvNqrW6O7bllr7InWKteqrb+hX3H0o2yP4MmJ+qvhbU165BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydXIEDL5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso9727705e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754643729; x=1755248529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcB29esXATuhjwQh2nnDRB1ldhsISGsvF6rcqzubLyU=;
        b=ydXIEDL5s6IEpk3HGWRXJzmq7PXjUVDDJgjc6jz75VH0Q/DOZ26CdueEBfCL9UVuu3
         86ntg2oHijBZMGQc0MewUNMmRJ1BrPlbckuEDqzOpfWjSKOWZBNCKL3mLy2ia5H3mtmD
         JoA/Wsq+v+frqi9L2MrMyMaV/BavofetGY99IALFCtEzQpH/X+PxVyYcyO9CPW/wpyF0
         aVZJd2DueU5dLr9+PF93NJTLlaERNkq99PrXvV3Qa5UH2ZbB90W56pFVjj6X5KYz4F0i
         IwNDAwCKnSEzNp1W0mAmbK1UDD5pH68ryvDCONbJ/q0gspA/HkIh/D+RH5ZmZwaCSV28
         c8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643729; x=1755248529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcB29esXATuhjwQh2nnDRB1ldhsISGsvF6rcqzubLyU=;
        b=IgNymHt7AhhzR7DkrxWCSxeBLAH5kR26r52AHMEs3IJMQqigGRphjWn35sWWr3NM8e
         pTD90vGHiSMnUCIpPmJZlRWWQwDECIezGJBHAaaj/cRKhLqaEArc2o2rBoll3SKMGnnM
         t42444R6bwRROrU62jHgxsrGOYNb1kOtVmXeL0iRRal0oYyxmetu/rSS3rB4PKZMrQvp
         YD+6W3b9fL2wCN3PmPh7UNoJRXh6UmFH0nRYroeHb12BObk1QzDXBra794Ep5DmmO9Yz
         jOXCePA0YjvSwaxWnpTJtifX5Dz2avktyX/gwCduQSpuKuhbRxO/PUn2OuJgfu+mjXs0
         wopQ==
X-Gm-Message-State: AOJu0YwytZbUmmy86pkzW/kZxv7RMjc9HBAMJxUq0N4yhCBawbNZVu3O
	utJ70a1wccDu53n9IpeUp4AZ0cc0AEoYz/WCaJQa9glmiyBziSbOr1wMfXj/jhrc1Pw=
X-Gm-Gg: ASbGnctyByGyXzgde+5S7F12q90t4ppcYNFzpn9Ohx7z9e3ZaCto8qugzhXN6/VZOaJ
	BFtigeRdwTdGtvUOwK3cUkYAGv4lcy440g5SYiscrA3ZiSAzHLowVpqPgNtRlScqWQWovcDFnOr
	s4s1ZIqKyrtKdRmpDE+dngfE7Ig684OEExjQEeod9C3NAIkJ/8vEwXV1eh62kVSBzz62VRy81kR
	9noNfQZ2A4kmsLvhJfPsJpZXW5O3kTu10w7upA868yJGVSMc8As48CK0Rie7YvNnGgkxU0/JAda
	yozA05X+8lHNEhiIOV4/1n5e3exfEZo73rU905gVq1fHQO1b4p1sZjZ6rXMZppue3F3/5U9PmV3
	sllaC4YLy1IQISs7T1Yo6ZfuQtCtnJKdkvRIGQ1HcKnWw5Kb3ADgnPotWj+LXKmg=
X-Google-Smtp-Source: AGHT+IF4xWpCF3XDsGBbn+mook9Gvgj49NOgEPXm0we3aHZF2BikwKecUFu5oecUVvF8h37VelrB2Q==
X-Received: by 2002:a05:6000:2482:b0:3b6:162a:8e08 with SMTP id ffacd0b85a97d-3b8f97c56bfmr6003028f8f.12.1754643728792;
        Fri, 08 Aug 2025 02:02:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0a24bf1sm153914825e9.1.2025.08.08.02.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:02:08 -0700 (PDT)
Message-ID: <00db8dc6-f8a6-42cc-ba5c-803ab56b9a06@linaro.org>
Date: Fri, 8 Aug 2025 10:02:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Venus core.
> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The driver is not available to firmware versions below 6.0.55 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 9604a7eed49d..a7c960d1d818 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1070,10 +1070,60 @@ static const struct venus_resources sc7280_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> +};
> +
> +static const struct firmware_version min_fw = {
> +	.major = 6, .minor = 0, .rev = 55,
> +};
> +
> +static const struct venus_resources qcm2290_res = {
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.bw_tbl_enc = qcm2290_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(qcm2290_bw_table_enc),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_4XX,
> +	.vpu_version = VPU_VERSION_AR50_LITE,
> +	.max_load = 352800,
> +	.num_vpp_pipes = 1,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/venus-6.0/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +	.enc_nodename = "video-encoder",
> +	.min_fw = &min_fw,
> +};
> +
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>   	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>   	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

