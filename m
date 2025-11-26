Return-Path: <linux-arm-msm+bounces-83426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27263C890F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E7E4356A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5435315D2C;
	Wed, 26 Nov 2025 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpyDTyJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI8DTVTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3E303A15
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150254; cv=none; b=K7EugvrYiYwDC+mLp4wNNRJyvXhcJfLdMgthuy4bwo6hFxSFN8849cbSY5dM7HOuCOp2+xCgdZfPLZICR9YwobHTsJxQTkDy7yLoCoYQ4zq5B23uObBkDII3J41xBHdYYZEBks5WJvtOwKBuEvrFyRBDamFEKgB2l7lv5Vrp5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150254; c=relaxed/simple;
	bh=BWHiuphdpAexmKsF6SSW4GFqGYn1FqdQJ46cfzoDqYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rozLuKP5bknzKvyHmTyImR8JRCqjT6aLn2ZmD2iEfp3S4kRsF2hyyoqyZoo3Fk6ayZGOuTIt/dM5l2IPPjCXk5NOcu1x4pupoN9KPyM9lhUJmflUsg4clsjuWqwtPEWYDxKlvmSKvbkv37FBk4MONoAuhWWqXB9jw/hKsSvcc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpyDTyJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI8DTVTs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8tmu21522262
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FV49zdUclFTYoIDSy7+nc3rNkW1ZPs35b4lOm70gvag=; b=LpyDTyJKcSgR4a+V
	EEREIIKNhlzN9CA/SOXgQ9d7oodHTZDTM3ZkSfPTOsSez3bkXXtoWAqk4JNm3Qdz
	3hHDcGSf0cKsb2FvWri2RNHC2eeGfIMzAD2vyKo1/dOopT8zvu1leEFBCubckyjt
	5S8uRMQWhBSjo4kT5Z/fNrYkrGmd5Efc+HqIKCtcJmN4HDXnjviDBV5WPrxqtups
	0dh+KC6oZ7iugeOYCsvnaOyVLg8zUQN/xbas2mhbsgsOpU32NLDBtc/z1IUnTZ+l
	ibcskHYlDeO3tdCLW8setCEYvbSpoxczG0pZ6YizureXo05SX1pGq00a035qhEj7
	i0elQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk05te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:44:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso168323155ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150252; x=1764755052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FV49zdUclFTYoIDSy7+nc3rNkW1ZPs35b4lOm70gvag=;
        b=RI8DTVTsMHcODBu5obCIxktP5EVOt5lDxJjIVJUtr6u0YWGkIaYvMST3Fe4olCkKGy
         xI9mn4yt6LOZwU7lg8mbrKsEanJD5w5CnYgkcSnO3MeIK45Q4hGiAwkKBrVtMIHTYFw6
         lVdxPibzbo6Bw+g6FvnhvbWE7d+CwLGUMCM4y6erS7LLCsGjja+ROfpb562wnVrjWExg
         tb0TiOE4i6vFF5A1+6Toknx/uaMqJivg8BSHF2CN+/amPDEUgEDnZLH4L3whQJ1F1YHj
         E/l+MirPk30HigOoSUP7CMClxc9u1QoE791KIope4050I/3+Et7xliInVE8o+QmkE12q
         +D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150252; x=1764755052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV49zdUclFTYoIDSy7+nc3rNkW1ZPs35b4lOm70gvag=;
        b=YaOnEK1I/w4bBlIWw+w9ZUuGDH+7yYiWfMTt0tn3K0R2s5rBS2DXQFs17PNn77AFAY
         zYOr632FmNa6leXPKoJCoYwui2iu2ruTRmevSccNaTv+Rn3ya9tliUqqi8VTOUFSVXPM
         oI1P3ny1uHrzDXVWN5iC6fGiW7cHBfNqV7P8KV/bHBpXdIRljktjcg4uzNZOW9VdVMH+
         FPpghJcIAcgWJXbVsJuCQUO0zw0xiraWsMMKKgfQsGC+G8JFK/ZB7ynp9O4IwIDrNgKX
         iAsdvVtHKYL5JiHOMRSD9R/B6cIbyyeK9hGm9Fg2eiGoPgHdSONFQwHHt0PexFocFeGb
         vnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCgfPbSO2aAC9+6rkJlWJaf6XrCQNfgiukWIy4jhdr0xex6YBabXtHZTu/lqv2/kljffUnZrSeC/4ZDvLn@vger.kernel.org
X-Gm-Message-State: AOJu0YwHjBJtdDPSQaZ7salu2R8m7DequnFssPmt1QRg3Poqadd4uZxG
	znEFKLuX1NMe2VybAgLPyTcBxRBanGVP0JLvpBhxHLS12IfTgRVsd4mZnlVUdALQOHbeNC9xC7F
	yvANEQW65MABHFNYbDOlXawLEYkJ1KiHOj71nylD9ja3Ikqa/62Wj1r6eSQcX2VcIc5bW
X-Gm-Gg: ASbGncs72PgJ8DlhBVd0bj9YJeFq7OYFp2b2ZWIto7BXhGoaY06jm9Nb6INn22urAeM
	CXkllfWAvuJQtj98trjtYcqHJUEhAwMi3sanZySSyBt/PFITgXtNqoeQqnO5TDZkyZjOqcCImFh
	06O6LVQQayGGXLN58ABa6P9pT9QDGdgwb7u63S3jiK4qm/gqB5Eo6PcpkQGmL4erRwFJ1WcvXOD
	+idweNPaoXQ+h3RiI3l23KmUPkZoXJls5J4yGRgcaCRXzbVt3iHGVgaVFXU2gdf0K8FrmApI+15
	wsdU3+/LD64xFeIAG3y5qF6bZS4dYEs12qLFMiJmekEgJ74a1hnmN8/adTZCjr3mZYRCRnlTTB+
	q6NHBLC4iWVEQsX8A1RQXy7U045NBySXx7skJrQ==
X-Received: by 2002:a17:903:2302:b0:297:f5ad:6708 with SMTP id d9443c01a7336-29b6bf779d0mr183254785ad.43.1764150251855;
        Wed, 26 Nov 2025 01:44:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj4MMXOnSQSQwzFgEUop807lde785Y1Qxxt3b0PwjWziBKli6ohViSjGFD1vpUwDlfYPzwXQ==
X-Received: by 2002:a17:903:2302:b0:297:f5ad:6708 with SMTP id d9443c01a7336-29b6bf779d0mr183254465ad.43.1764150251388;
        Wed, 26 Nov 2025 01:44:11 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fed2sm195028175ad.69.2025.11.26.01.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:44:10 -0800 (PST)
Message-ID: <d17232b4-4b80-42a1-82c7-2508b5072286@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:14:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PUtJshW3l4jCBtDiD_BoPLUrp9__DDM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX3qwtB2RRITZB
 ezWTLD3koNKA246F4WbmTNgX6Qw+tYzLHVSoJIEdd8FceBECS3Cu/d5AJEKdqaHfBvn0wifjcSD
 7TFfJJvOEIZ3z0wpCV4ba4TbnHumXM3wYkR52cPeJ/oLtCTHona7Q53k6CYrMWdBdBg8n2UJ8DH
 lNHgwAh/198NqpPqez+iI+e+asUDoVYffVFHAhw25SHIayAGRD4XTD+LO1538lAmHRJ2jtGJTET
 VNTdfbLagSwfQyY5PVdDO11PlAmEZI37RQPnXqN15dKPzDKRJFK6YxFc9EC2bCsVv6dDYa0ycPI
 Og4shsFbreYzs0EB4Rvx5587PFQ4HIvUlSbLm+/i5uTjjsKr43XPUvBgzpQbJ3oxAEIav3liNp3
 H6B1X/lbrKcu7NbB+uXatI1kihyItg==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926cbec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BxFOA6ydGOS16N4CFHUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PUtJshW3l4jCBtDiD_BoPLUrp9__DDM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> index def86b71a3da534f07844f01ecb73b424db3bddc..db81569dd4b17de1c70ab5058d4ea186e08ce09e 100644
> --- a/drivers/clk/qcom/gcc-sm8750.c
> +++ b/drivers/clk/qcom/gcc-sm8750.c
> @@ -1030,7 +1030,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_8,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1052,7 +1052,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


