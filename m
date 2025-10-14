Return-Path: <linux-arm-msm+bounces-77110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA0BD829B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDD53E9148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D3730F938;
	Tue, 14 Oct 2025 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+j30v6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DCA30F935
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430290; cv=none; b=PHEzRwydIW+UsZ7anqbsSRzGsrVLMkhmZz6Y7yQpLD46j132eb4yUh+8ZXYyh+OeK+IXrtRFYc1aYAmwPBhzY9eGDXU5CsQ5b66fuIZd/w2P4z1zSFSWh8yI0gRgSXIrUVbvyhZLy7Ocio3eldlgLz4HDbniM2g7PHre3sRMeo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430290; c=relaxed/simple;
	bh=so8XcI+x/03oOtuo3rwz6tNXONPvNos8iThU9PotsiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksYA8XIhcXPAnvQFVBOj/uY4lBPdLO24ym4q/t1eFiDNSeKUzLgkmwK9IE/jMMaKQqi/uqxBm0WoJgjF/XwzofHHVhe4Dl6Afbw1ZBiTogtB/nEG1nxHwY1/v0j1NVoDozJWWQCimQapR1G1ASfGEgiGQbdIJrWahuiRDju5UXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+j30v6r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Gcv018074
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+TNAe6m1YYxDo2xBlAV76VGS3L4AttFzxuFepNbuK8=; b=C+j30v6rfPat1IL5
	3z1D7ebXOYADCHhLer5cpNDyuehp/1YD+UkSgy7FbM2+VnyBq956jgaShJvwrAD8
	fOqf0zjs66vUSCwGfFylXNmN1XJO3WNhW0AFqQ/TL7B6VAWma92TiXxYlDeGh6If
	AtgHJsThhBIkX30cnex3VdDaZGFkFIBpq0JVAg0OEGymPaVGoQOfNdDEpciLNopJ
	tx1nhjokl/NrEt6KFmOK1c33v3Bt3zPpdC+acAtkKzwyv9afLQv6mXg2NUFw9fMc
	vh1WW29dyqWEnt55eYJV6MRbAyOXH4NV9L7Sl9bQb9BH642BCo6VB2OtkbD90a9b
	5utnvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferyqem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:24:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b609c0f6522so15245554a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430286; x=1761035086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+TNAe6m1YYxDo2xBlAV76VGS3L4AttFzxuFepNbuK8=;
        b=tZwWkcnty2c4tIV0uxc9ggSvW6ASzPj8Cjkc6Vy11xKq/FEKWUnMK4DKWWKVPjPvky
         BdBu1+9/RrM/+2i7bSm50NhxFiDV6eu+ipvT8FU7mWNt8M9MzIiHkUnxaPouDy0pVqp+
         fV+3jq7RWuPaIdd0JAKVne9vrSuKxe38XcB4WPKfZLW2FhGIQbmHI0t4Ax8RWucJ18LO
         Chkk9oxjtyg+/g09gALiugZWWdefVILjXDHqc10YEXiOtZNliIOYcHjNmoUzRiKdh1Rs
         6phI10/ZguFXJZAGKm/yf6nfN6xhny8EK15uXQ4NdMxu4/5y3B6D3L/EAzafPxhapnNh
         4jTg==
X-Forwarded-Encrypted: i=1; AJvYcCVlyXjIXkxCBlMwWgMT2YWB0UN8rmIHelXBf8UMPc1ZMNICI94oZDXb0gBwGtmrEGh9RU5/9TQ+IChNCZeX@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJzmeL7M3gzg0VvNenlxOgZWr0WJ58ZzUNiyIdE4eqJnZiPoA
	m86e8ov2ySC4tVNQWotp1PndDRUtOdZctybfZ4tXJedro+KnxEmRGx6JBOjAfak8MvzflSj1+iA
	mSRLXFgX9cxRLOCiMXpthFJlHo4XLHVP8vi2JD94foUXeMQIvXEESoDp6DNM1kJvITKSj
X-Gm-Gg: ASbGncuEN0b10Z/SdYRMOJ4RlK/z/I5M65l2o/fha+BbzSwSrr2b/vq/Y2X/VdV7A7x
	/tw4Z99lNdnomI+7yXZJZuphexNcpjQjxzLUBDmZKeCf3bdNnhsQlCFGgMbTBtk9GuviXZoAi9t
	+7UayARCNTu6CFMxRQZY/74MM63zQ61wDv5myBd1Ts8L6jMIVKqh6ONr4wR1EBU9eUdULYVVDwl
	MbNpiCoHZ+J/aFZdAxipnQMcQfnl4u9QeUW39sfkgfHNBLCZJc3wEU1zktrikxuZj5jTGdfT7Kq
	lKC+f8mtTNknmm/vsfKmLnJT1xk/i33w98zha7RyO5Pa6Zz8m7zuqdgCM1Fr0PBEBZFl4Clw
X-Received: by 2002:a17:90b:2f04:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-33b5139a385mr36822410a91.33.1760430285682;
        Tue, 14 Oct 2025 01:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG37bvu8zyNqsfUaQaEJ2zLoNqZQDq93XUmQoaKSFp/oMQ0do/nAne528GPIdA76MJk8wYZuA==
X-Received: by 2002:a17:90b:2f04:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-33b5139a385mr36822375a91.33.1760430285266;
        Tue, 14 Oct 2025 01:24:45 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7cc0sm14775018a91.19.2025.10.14.01.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:24:44 -0700 (PDT)
Message-ID: <7c65a460-005a-3620-d263-53b6c184491c@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:54:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/8] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-5-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-5-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee08ce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-8pfya1JHn5qUPT2TrgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: NS5zPIxMToFaysLgXDmMgKBv-X0xWtDz
X-Proofpoint-ORIG-GUID: NS5zPIxMToFaysLgXDmMgKBv-X0xWtDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/RNSy61rC0P4
 4CCAKsa/IGPc7oHy710SEGSEGGjHuFoddQWBu+5BD1mFA/JRCcWvnjFX1i67FoS5DbT2YABofK4
 xhCjQUni532JqLI+g+mzUY3DP9qHNHRMz3zo6uyNwZEUo9ps9oqTTioykj83RnSx585T/RmNJuf
 brdMPeGiqaaEs6K0j0XRJAAEARvgBRanc0BgJwNHCJ9d5Wu2efrX5WzXvlatSiDbghW4cr0QR33
 ZAyk/T4RQ8x+8P1I7Wh2pBZMNmnLpgf9R/8CDfswnEoSXlGsXT9D1WWGd2CbwZH10sNm6NXtjmh
 lI4Vrnh2s1S7vTb1k+948UO21fouqj9g4hJk9zdXFDFCnk9SKtB2DucD1+dgyEPIfbd6dXIeTg5
 nLm2j2rSrYTnPl1j6WAQU7i+diKYjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Now as we have removed PIPE value from inst_fw_caps_dec there should be
> no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> QCS8300-specific tables and use generic one instead.
> 
> The differences between QCS8300 and SM8550 data comes from a
> non-conflict merge of commit d22037f3fd33 ("media: iris: Set platform
> capabilities to firmware for encoder video device") (which added .set
> callbacks), and commit 6bdfa3f947a7 ("media: iris: Add platform-specific
> capabilities for encoder video device") (which added QCS8300 data, but
> not the callbacks).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |   9 +-
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 534 +--------------------
>  2 files changed, 8 insertions(+), 535 deletions(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

