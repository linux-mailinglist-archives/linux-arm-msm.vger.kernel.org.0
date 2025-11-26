Return-Path: <linux-arm-msm+bounces-83403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC489C88BDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2780B4E6538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE99631B10E;
	Wed, 26 Nov 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5PlAlX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5POr2Et"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287D3164A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146989; cv=none; b=F8lWFZQlJazVANkOu1bXLI9V4wS+/Pdd6IFSqA3eXIBIpIiMkmJyHT+Bo3XiQOQn1CeIzP0VLjGAGR+frLdi/LSdOM3P419B2ALrxuHtibYb+WOIVJf/eL6EaUbcO7PQcIG/wHwZNAFNnEo1d1hnLedt/kCOzfrDByw7TkffCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146989; c=relaxed/simple;
	bh=LDNOATw+wFayHgsz5DDuEHR4RebSw2I2Rd+e/2Ycvyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuC+ZGc9te5RVdQiRRDbOL1NHmz4zr7/p10bZjoRvsvEG5xAxGM7YbVImzEKwP/TH558XXVel5ksn2HZJwubm7OEOsk+13Hc5xoqNUuWaJT0R1VA2BzISqz96fVz2yPHZMiReY4/O4tgURNCE8dNpW0TjJvFLUGUQUY8BNghGE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5PlAlX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5POr2Et; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gI091234822
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+HDFXM3B5nS/Bkeu+TQXGxPQlN3/FUeGSnVPol6uGs=; b=k5PlAlX8tfhj1lX0
	irjtGFFtD0F4lMM5FngoaL98LBK4z5nZDKWbjXYdNIOqkT+oF9PgYuZXujRktnlb
	a7CWeXlvSmDFvOcfggHGPhva94oOGMl/7acK1jQkJqk5vwtO2ZtQZLQWlW8tEWcl
	11m25tCDGjPkSnm4lLdtlI3GRFoldSnIULyTb0tAuZQpieWsr6+r7OFie12cFtsH
	zjFWStqC/GMcUoWBhE5nJ2wiTamVkJ0/uJYKO/cHwZF6eVhkodQwzcXcfrTS6/3A
	jOJIsUDuxzVvhkRc9FP47Uwft/MR+oAA0x9AlpkXHYXc4jWWJ3E+cooKHcq/C1bt
	GFcHwQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd406gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34176460924so5533811a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146987; x=1764751787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+HDFXM3B5nS/Bkeu+TQXGxPQlN3/FUeGSnVPol6uGs=;
        b=M5POr2Ety9SCyPmdh8PMlxg2zLtOmtAKZa+70/kYm+IZtOcUU4v4tm6jV/oU5oqYeG
         XTY34MsstIguJ5qAVvWpFeODAn7rXj0qDavSaLnHa5OTN6wk+kslnylayZNveCMnqHaj
         gDZbB63Qz1wFYnDq8IKLv9BB0n4CWHVZWzNUpJu8UIaCaCk+jPohB6JpwdxMmE1lbjJW
         wlZXl590z6Pgvt52AkCL2fGbyKfmSrgKQEnVLcE6FmkaKdR5Y2PrjacDXf5Q6UaDLgjf
         goO2awe2L7kycuIvEBM7netJloplYf6liHEtrtjXTuLCIYyqJedBzTi9G429Ty4t+NH6
         MVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146987; x=1764751787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+HDFXM3B5nS/Bkeu+TQXGxPQlN3/FUeGSnVPol6uGs=;
        b=lU+kjlqZ17bYiwzN9GZLvs3wIyPyiHcXBzUWyWi8hwaR+ORJYwcK0za3zsTzoNerob
         88gx8vuok6mWcYUahrGwnevgrbUv4r1v54ctXyZRdfl3Pr+HDK4RDByCsRlL5IZFfb8Q
         e+bUVtNOknPrGCxBBrLat4bAnEJaBYTefUmCILAn6FUzBA07U/uPDF+5UeIU58Err/07
         iEOh8aOlxzXIq7aGP79rjqZDeygldcuYR0wm+CZn4ZiEUFkjQkzcSwDlb2BYWndkSAEW
         qMv7PN315/leFVsysV3qifZweMeHBXV3IzlzewhbPkr7XmEUqXyHRx/1J4jHlxcWcJae
         YXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0r3UZG2VzZom+CLXQyvVpiKuFF8QpPcGlQFbyMPTS3TFfFyfFWAOa/HR15vsCciBDqPLjz7HNC6tenZRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2DJLZJzO1BnEG/METk9X6cGaFJ6BKIZgOZ9u7kEyBXowYihEk
	fbTgdUjuidRewCU6YKUaxhJUSgbjUPIs2HOmiWKoGOXdV4EJ2HraVmFXk2+abK1hEaOJ9wsJe7g
	sqz9rt2d8Gd/HJrIWT8xX31Dp1iiQl4cF5iroO3PYzD9UsbsB1rEy2xqki8PSXNLGQ4t0
X-Gm-Gg: ASbGncvOVW7/tz07ZS9tDHU1DgvrXoap8rywgH7LckIFfqgL2iMrVABt5mjkW9rmAA0
	HiZutLV9nR7zA43eSfMEbwL3ceQNClLFGc8UHovzBT/eHANvjq5A9zfU+JUo4oS+1qVfiYDXtDA
	XdOG4A2wDuskAyMLY54vmg0z21Mj3q3aBY4fei8jAozyhJ65nRj2f3+aehtkQsEexZtAY/L1XEH
	n6IDd3A52Y5gZy/zG8OHM1XNoH6roONyDMnKD9neDOCm3Qs8cwkpguAuhOCcn5AQBvSGw5x6d4+
	i/ISMThLumCXB5oQKQ4r4A4oh7SBs8RviJoZbDS/MzudUaEsL6O8BrQD5uAy52BbOVbZtiATAbo
	YGq2CuG2ssyO1EDIFc/Mf4mbL/lEYCha1UbIY
X-Received: by 2002:a17:90b:2cce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34733f5d400mr19137822a91.37.1764146986940;
        Wed, 26 Nov 2025 00:49:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY5m0II1yfVQ+AfN/2mzF2aSYu9PQ1TvU+vUQjc75JG7j/M5I3KBneKWcayCHeTc75gNeMxQ==
X-Received: by 2002:a17:90b:2cce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34733f5d400mr19137801a91.37.1764146986453;
        Wed, 26 Nov 2025 00:49:46 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm1817261a91.11.2025.11.26.00.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:46 -0800 (PST)
Message-ID: <ace9f08e-48ef-48b1-a0af-c3506258c7c0@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:19:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9HOd_YdCJXuw-uTAf-UYkzy3l2K9Nmvn
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926bf2b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9HOd_YdCJXuw-uTAf-UYkzy3l2K9Nmvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX0riZcOIyHlS+
 Tlo4uiP/qpkaGzee2o3N9e6oQ2dwHz6FB6rhaXO9S+538dkYeUgstAq8XCaJNrYLIgtHcvFJu7K
 TXNa3DN51Z7Fuc925QMqr67tswEa0J9DfxPyeswkM1BluPhRuotDXP4XhJDW3ct6CU6aJ0b1bwH
 //GXlzElKvyyJGTebZGfwzujGdNyuoAxC6Nxl7y4wJAkssjtiZ7p5pcs5bmlt6NshJ0GEtMVHTu
 3vDzIfMTe0cl+D1Wqtlpw2aOtCfRepwsu1iRGs53dBlxjtzUZqrFJho9uaKqKp3jLHlTiC2Cjtz
 4cLlCaMc2a0MaPA/SNlF6zDZz6Euff7V7pEVNK6sRDdDzVKgVUkuCLDWYdv4AU9L9NyAC3pRKmt
 aJ45IE5AGtA79h2qsmRSrkowTO9dbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
> issues in SDCC usecases.
> 
> Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-milos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

