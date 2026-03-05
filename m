Return-Path: <linux-arm-msm+bounces-95545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NaAMDVDqWkt3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:47:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524720DAE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D728305DD08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC5A3750BB;
	Thu,  5 Mar 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtnPMlfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYKI5jbq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7B3750D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700423; cv=none; b=WlLTQVbYF3w4TXsB79fXTJ9R07Yc8TAtH5OSUypz3bk4d/+bhIKGsYHFzWN0KpIU+t1KhiN5gMtcK/Iaop8vTX1buzV4cILabLOHMRrK6+WafiViG3iLLCmACMw5331BS7QDwnQvf59Iq73R7j6FisgsTA1pJBmHXhlM9JoehvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700423; c=relaxed/simple;
	bh=GE/ZXsKI6xhEAf1zpKn/aU0QUJ5sReC6hPVoMaoqe5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+yPtwYnq0PTjTR2ILl5lxcIZ03yWAR786FkpWOn6wPTT26J62Z6v/NzoYzqc0kIv7msjAYB0Q1x/qddoAcHIw1Q0UYe4E+x66AS8f9OwW7lE897zTFTZB/OrNdy9ysKCS/rhtDr4vRwPtqny8puU28DSOLUqsU/mffnWqZSLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtnPMlfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYKI5jbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BlR6628796
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEOgBc9y66t0i7jzheHGk7EtWShG04ykxJbEQESEjcc=; b=KtnPMlfuYVOw9Pvq
	l+MaU9ycyUSbHRoZGtW5za5wQE20Q5smM8OiqY9g8gcQibyBxoTDdsqRbu4ysbkZ
	SBbfVzxVWEQbEi9hJiURkF4DySwvLAQaqwfTzTE5ECz6m4pzGwB8cqtCmkRVv47L
	MXEPHGpg61SrEExIKQvKjSNEnzc3Z01oREk9ZRbfec43YmPic9N89VgPeKh1md77
	H7dP+E0pBwxMLLrqJ6ugdXjRNLcmPGCq9NxeK3dE5zKvTyXm82bf6wbwdKun/yjN
	oP9IHJUg64Y/Gm2d0xczzUTbG29qtxGqS5ftVz+hZnhG2XehHwtJVGuYcAH9JFg3
	E7J9RA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2j58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:47:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35980a994d6so24353779a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772700420; x=1773305220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEOgBc9y66t0i7jzheHGk7EtWShG04ykxJbEQESEjcc=;
        b=DYKI5jbqFczK70LGoBKuNut1FOOP3jmnBQsN3+phYZ88ONZSVHWFiSfQNAv+hNjDxA
         81jexNDTRVTGsX/tGUCXcLSoCey8JCCkdF8xQVQo7BFcNvHlrP77o/USP+S/4gTcbB7K
         IIG6KUzB/4jT1gMELqZgF+kZd+KSirjkvUBC5WDzgVtTl77QJwyzC6n9R1UUxK/nZ+iy
         oTHiA9DLEEfuHoTaOtGMta4EUJ0LXrjh2gRQvK9jkSTjD/62UrDhiMq9zGm1yhtZen3s
         9jqYtDi9maKqPJy/ejYjF15hjTI4Y8/j8Ii1FiYB6EbA8tONwVZ5Pfl4o9p0vU/mMVeT
         jJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700420; x=1773305220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEOgBc9y66t0i7jzheHGk7EtWShG04ykxJbEQESEjcc=;
        b=Bc6zm+SigfaPxZ7Mbzel3ejSSlM9AtVt9SpiYaNASJpC8RmWyC1PeNndV8WucfP2/c
         kVpJjUeU7J6Lkqz4jleGTpTk9xxVPax5SvYNXfyT14kOaqwdIQLdY+fsmOcj7JRObbiu
         1vdJvYRYtvOqmpuGZMMiK386JpSfsbtmY6L7k6QdFk26z6lFYeR4IBOWBsuy2EKBHxZd
         aKQXW3Nwj7raFmUosfOCp1HWI1vpLH5Iuyn32gluXzJ5QcBCUb4B765BCiSia7QBLkUC
         KOp85VT4A49QN2iwxGn44sQKFHldS8UBBuDV1qT39n5ySo9Cn4J5DRNDIRTpR71SZ4w2
         R4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkB6G3Y5D8fxGs2R5y1IJlhuRjJD3236DvC1Z3tgLRSYuAouiKvhIrtcHVvnjczcLUEeQ9wrxjnFX0H+iL@vger.kernel.org
X-Gm-Message-State: AOJu0YzCVMrDdTRleeaALR3yKmEeUWe24vEFNQlY8/3HfyMYrALCrWzK
	SGnxc7aD2OjRs/iG9guGgwzVsnz9mTqDSDXpPI8V+oTvts6EV/BKYIp8qIVHbN4pNO8NKkUxd/L
	LgT4acYXiUt+n4d7EpHwluF7QJD/jVebFFlxCIArHpmvdqcMmSskyzyX6GEMnXs36faoT
X-Gm-Gg: ATEYQzy8y9yJJ5E03taYuVje5/w0mHmyWP4jTotdcOECppMXQCrHKoNPYwwKWeqj7QG
	TFYGJBcoP68IZOh4ry4qB3RHz4Mgxy9CKCKYkXfcdA0zG+d3+PHAuSFb0QnwQ2KW5e6Qpmjaas0
	X92u6e5sleIbGmF7Isx0lSqyhZ9RfPzVejz541wjlFk+oXIDiQ2TuXsH1L2rP2dh48cOBSc22cx
	y+fTjEPZjLLN5s/RxIB8w2FCBBAWVBDmt5L9YCTB2S0LOFHNC7ett2tGe3I3rjksVjz64g7H8Kc
	k9fPVMm2rknXmxJ1PZ6jNDRzRe1fhbRRKELa0KyKIFVuEE4KBVBQH7AHLP5solYtlatYjEzxTeD
	ToRhgf1/xx4k6I9KATmQI3jsZBS+1C+Hd5EwBCJUHPUBUVZ2prQ==
X-Received: by 2002:a17:90b:1fc5:b0:34c:99d6:175d with SMTP id 98e67ed59e1d1-359a69aec27mr4491083a91.2.1772700420279;
        Thu, 05 Mar 2026 00:47:00 -0800 (PST)
X-Received: by 2002:a17:90b:1fc5:b0:34c:99d6:175d with SMTP id 98e67ed59e1d1-359a69aec27mr4491069a91.2.1772700419857;
        Thu, 05 Mar 2026 00:46:59 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d39238sm1313800a91.4.2026.03.05.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:46:59 -0800 (PST)
Message-ID: <80c2e898-a6d3-443e-84ca-a3cc3b72a068@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:16:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
 <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
 <b7svdypmdfyz4j43l56zutt7uu5nwfwjnsuz62yv3sgm5j7huj@kw5ppzf7q7rl>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b7svdypmdfyz4j43l56zutt7uu5nwfwjnsuz62yv3sgm5j7huj@kw5ppzf7q7rl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a94305 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=uGXflhEc25sldzt6jLEA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: zKUmCQ_yDV6_IJ-RGeZVkRER2UB-TVVZ
X-Proofpoint-GUID: zKUmCQ_yDV6_IJ-RGeZVkRER2UB-TVVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OSBTYWx0ZWRfX262W1hEWGbWC
 Pt2gsgAs6nsBP9QvwoXt0HF7iXe/z1snODsEBIr8olKt1d7QS5f38+7wt19j9vrTxAKU0y9MNrZ
 OykMHWRQIlI1vWF+niOVpGrji58VnW6sd3y3ny9AKbKLyERg2SjfQDcikCvTD2LKpSYeWQTt0UR
 K41692UUniL5ujjhCxa0bDDH1vaPd65yGjAg3JtYuZXJH2uyI8eg+Debj6bmUWjwsKUmTjJjoaP
 e8cR2b26f5WuZnEHwaaFjEisX/ryq9sw9gaDQaRyogMFSEbxyethZSgQfwXsLP9+vI8oEb+EHne
 2mZsspCVl4nEHcNBbkEQqwYymgMxNikQYWwRxVTgGF7AGsbm4mPTBtCvoD/o9l3tIKyettzkE+E
 T1bWFOpSpDkBRmfPpNn6xhYLUReyScEizfHXJ8AAnzX9Xdq3cmKEzdnj8ty/0Hul9uOvbS0IFgn
 8eVX/M7+582bksRRY+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050069
X-Rspamd-Queue-Id: 8524720DAE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-95545-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 7:54 AM, Dmitry Baryshkov wrote:
>> +		.ops = &clk_alpha_pll_postdiv_taycan_elu_ops,
>> +	},
>> +};
>> +
>> +static const struct parent_map gpu_cc_parent_map_1[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
>> +	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
>> +	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
>> +	{ P_GPLL0_OUT_MAIN, 5 },
>> +	{ P_GPLL0_OUT_MAIN_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gpu_cc_parent_data_1[] = {
>> +	{ .fw_name = "bi_tcxo" },
> Why is this clock using fw_names instead of indices?

I will fix in the next patch.

> 
>> +	{ .hw = &gpu_cc_pll0.clkr.hw },
>> +	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
>> +	{ .hw = &gpu_cc_pll0.clkr.hw },
>> +	{ .fw_name = "gpll0_out_main" },
>> +	{ .fw_name = "gpll0_out_main_div" },

-- 
Thanks,
Taniya Das


