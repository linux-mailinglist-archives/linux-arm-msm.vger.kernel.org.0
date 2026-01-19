Return-Path: <linux-arm-msm+bounces-89596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6FD3A3E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E99E830268C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDED346E73;
	Mon, 19 Jan 2026 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJld3oOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BktFPm9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE53358B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816622; cv=none; b=AwI9vaEGgt10Xq7M22L7oZG0M/IFQuhu3VG7V3V7aozNxQmPM9C/l1EKsBBQm+4cbnYQH/fCEWYAdh5TRf/zQQxDzj706x9orb5QeylO9L6qZ3P6hnLm1okmQ0Ad0e+yvrMT8ZERK6wa6fHsORyaNz3aRyN0BaGWnZ3o+5622lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816622; c=relaxed/simple;
	bh=w5LhqyrtK2foDVF6cSsSjiv6bAGSSxjOZCtQCJ2+fdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETkBmNg8ob2Y1oqg98ByxdA8sU+Qz1XnE3bEe/W6W//3/AqqvWIGxDmscUV/d0503zgaDXoOa+oE+o3Uv4sr01l59Wr5zNPPLG7MUFUiDry1RuwExHGM1rpd8ejigA01BVHzBy4F2d9x0D9K5uMCV6e2YDU4nAHqDixXGIUMTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJld3oOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BktFPm9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90oQm228217
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRh/bpw38nqL0k524WZlYiDQjQWP4HmfccZ9c+P9Ez4=; b=dJld3oOmrgljq1s9
	3apduHIQF3582Q2cZq2ieE5SHRYNGrAOgTPbMteDb1kTDeAmSwitZtvxBTAomkaV
	Nrrwf0Qv1p4EF5QbSwTL8RxBU8kLHKCEgQAo5M3AhQwwjy3hT6vtU9ZhZpG8ssGO
	w5sI19hxkNMNMykvqU6qcNq1phKfbwTJVeAZxNjF6b88EV0dy+L1cXh2FGgsHy6v
	pWf/w/LU3ko1BZ4bHP23Ejrf2sau2nzYCwJP2m7yDE/tmfkiTlvB7wbptp9KT8UJ
	q4IKM/3dm2UMZM5pGTk6QUs966CB+dCH52o4WAmsv4xsrPWr/c12AIUBiwqA4yr6
	AKP70g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8fdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:56:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso4018651a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816619; x=1769421419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRh/bpw38nqL0k524WZlYiDQjQWP4HmfccZ9c+P9Ez4=;
        b=BktFPm9pPRYCOwiByccVpFqdplokbcZR3aSHl4WejoyMPs9JiY62d6GcCGd094Hyyc
         KM7FtxQ54Z+BvQaFbjEDfXq8f0trlZP5X0jwNu/0ADo/aEIkfKC6uOu7jM8qOCMrFK/Y
         XwjjJeImYq+/MwjzMxJUVYe3pHEoXiFa3DDqyFWxCsSuMc/I4SMRK1+MUjKSyafAjFik
         FojLNCp4R2DvWu1//q2a3f8CF6/0dezqqJ/QVTvZG1fOO22tvN+HxlE+4DiqcM01LubI
         /aqyJaT2UPSAsDwMMpw5PSFyPnwk+JFI+W5Kf03lyEmuOUluvrsuN+29TXqvEebZ71PC
         gnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816619; x=1769421419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRh/bpw38nqL0k524WZlYiDQjQWP4HmfccZ9c+P9Ez4=;
        b=hQ9OF+8DzTC7w2PT5ij72jDxRgh53JfIPXVbGJEDqYCNF1rmaln1tQkriKurQQ6lmJ
         ANZQvi/S7B0StVLmPIF1nZYYVHlSyv82A2v/kkiEt1tv40e79xq6OWW11VWd/kQgwLPI
         l1AaLGMqhPXzu8oeWCBLUjioaJzKL1uhbTkPUESePtYH6ORceZl/sTmPl81G2O2DI+fj
         imXfYnrdjzSBbs9QL/kqB6ajdWpyWOP6hWAi3coJ+6L/oErpA0v125p0oG/+vSsNj2VI
         drPauGeRDCmgu67IZqaMapWhIz1h6BJVVfXhX+EqvJXZkvDnZ8ncXA7YejIxndXEECB+
         Oc8g==
X-Forwarded-Encrypted: i=1; AJvYcCV2zYZuyYDMiWImKvuLY8bJJSWUl2XEKLP4S4PeCvzEhx5FwvtllFYcMz2fBDevfxA2bncm8bvzuXVMtxmG@vger.kernel.org
X-Gm-Message-State: AOJu0YwbwfOgyNAjVqz5SCM/K9UHfWaD0/EPHmhu9y8In9E0N18S4qLd
	qWytM5Rk2ok/5kAUga9UcltjFSyg8hiV4iGtdWYIzGCqi+GeoYYg4tA75lRdh3BDykYeLanPPl3
	d8GehbXMwjPhageDqZ7uRJANRVcrup8VAfmxQjTzw2NoIAZBh2iCuLVoumdo4mgf1lKFX
X-Gm-Gg: AZuq6aLryFBrJ2ufF1PnCMiBQT9iUBQGPIm3ic8kMDghEftiKTDmCvtPbrg3mw40FWE
	GzXZy812VOScVKRxf4oMKB+7wwgj8eti45AVNFDBVDYs70V+21LrKeI2h/evPq4m0CR/sRL7BkZ
	0s0axMQ7LrKF5zGTCT8GME8Z0kn7kfHRsBB0rQrmTxfmjnsCInEd5kPJaMt0FAPBafgk+lcOKjQ
	aEiCt9EIR3OtrbnuRmA0BBNqoyxEcoR3wrmWR0F5TUqBxTxliNKhUbkv3ioWO2anvEk0AlhEEhB
	FpfcMcC++To8K2RXUmH0J8710OFNsErfmPg2PSLvT6i7prn4jnmuxVyw6/+NV1UCX7JnAQZBy2U
	XpggTCU2QpKZ7qD8Kl7AvRkfWdnLRymOQZjTsJXJrnW4o
X-Received: by 2002:a17:90b:4b08:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3527325eaacmr8891744a91.31.1768816619023;
        Mon, 19 Jan 2026 01:56:59 -0800 (PST)
X-Received: by 2002:a17:90b:4b08:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3527325eaacmr8891719a91.31.1768816618541;
        Mon, 19 Jan 2026 01:56:58 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ec7dasm11348365a91.8.2026.01.19.01.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:56:58 -0800 (PST)
Message-ID: <975f9f4a-2898-280d-c0e5-83190f814d34@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:26:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-5-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-5-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jY7DYUPOT1eGKwrdz1Ip2vFAwKD9whhn
X-Proofpoint-GUID: jY7DYUPOT1eGKwrdz1Ip2vFAwKD9whhn
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696dffeb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX+9+xDBRL4AnV
 BM0o4s1638HPt1YFWit2oi7+gZIPYYjvS2EnRdSu3A68tiqjrqvtKZPOAdf+V9XYVLHEzpsQY+W
 yxL00OjGFlb+VgLG8UfHqNGGsxqAFt7HYDUoez4+OxQj/7blurfZxCIpxtbdsRahP8n1CS5rP61
 88HmSmemZJ7pi9eCjWfXjquZiZyUpmUPv7DV0LSdIO7niWUjmjhS50brFA83h4UoaOjcM5vNmAG
 6RTI9bf9fvcgfgdrxOkYTKhODJQEeiRM4AWIYrC6wAwUReqc3NPcdF5J52jBWirNCgz246cvLDL
 IbtCEyfIPMMW/03LeSkds4hPFQ2FkU5DxTLNMTG+ebb1MoiXArHEtWuZZgDLFv7DBZ1rkoQ2DWK
 TxvMpXeg/gkWSXay7i3USeAASCktmH2Fe24lXicYueYwJLWN26WagCWcTvFTaHH2cxwbUL09pgi
 YoGl0jhCCAo4ONCx7JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Modify iris_hfi_gen1_packet_session_set_property to simplify size
> calculations and remove redundant code patterns.
> 
> Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
> every switch case, resulting in repetitive and less maintainable
> logic.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

