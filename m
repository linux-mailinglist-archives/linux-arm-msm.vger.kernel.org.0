Return-Path: <linux-arm-msm+bounces-64044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D98AFCB88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DE1D1BC7B87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD422DEA60;
	Tue,  8 Jul 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PP6LPZ7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E92DCF60
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980131; cv=none; b=Ee70rbBmsUxCNij8HNNgVjwK/mFxcmafleSHWGbiMdFQF0N/EuamxxOAUoF8m/WtCmt1IWSu/xdqjdOY127z0pBg9ji7buF32EiZFvAS2Rus4NjT8G2ylO0BNr2Dbz7Ot8VMtU2wXZl4HIz1h9P+RPVdW4/rkRnSDCABiFpezOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980131; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tk/qew0gVjnZf8qaTnnk/jP3TJ+E4SLbnttNYcKLx8aXtNsFGk/w7clQ6dt3m36MhJ7Q4Uvl203VdkLMKXifnqSnQZkW9RgAoXfcH2eCmOLwa9XaBlyMeAeW8eiBHlyI13Tgo04dvuMxZIDmHBay3BJlPNFcXOm4LhR/r/wo76w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PP6LPZ7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAQnx012318
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 13:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=PP6LPZ7JgWREVlGz
	xfOB3FpIVnYll1AYnAcFtC/DmwaJdneoFKAds0rkDurunf9pH4YLir6HsmEf4de9
	HcAb4L1GmOdV5asQHAXWWHVSYybzZscWrdsAnruQvX7JKZoWdGwgOp91+6ZrIWQX
	YUre65nGE2maSnxdnrutcHQbULUETjK2S+d+a2CpRm1GzVKb36THIn0oNrO3edvn
	EhkHEL/TwV7aqGGErrPonLag+kMrXl42AS6mV7ArPdePlVFgIjTmLDTZcPQ9ohiD
	20G6VCM78LPNilAxjywxwTnMG2XzL+304fFq0SgWTulqm1zX1uARzTyBfJQBNETZ
	rAGD4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97nbm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 13:08:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so68885685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 06:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980128; x=1752584928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=U/YDTYoBRt61HFDYfoCmEXA/TGMJKRLUA6TEcfs1iouOw5hFqpAmVXvxlRMBCVHV44
         AdL5iWeJ7MkLZ10s5ZEaa4eUGcNwIURUF1gLXYOQZ6mAlWFCMBuTuXWJgSokJtoPDlSb
         IQVaYHn7mUDOaAx6UFRzqbMp20NjMa3Y9Hx+XaOaXZXnowERhRWL7ixxPqcyVtOTxKM9
         g4T7ORSUCjtCeM0RF0iZJpArqxJmI3kXKbfdXtTgUWCUg+YZkXprPdm9kLMnDd2fU7AI
         b3qUW40LTApxBj8Bnf667w2bJ9AOzkO09cJG5Sr7G6DEHXDL3p5AeUaDfIQ5MGx/UdVs
         PIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmUp7uz6ZtgzSi8KF8yDefB0AZaDzmKJZzqAQxupUyYxfV9+rfumhrhnfogoqN2wuGSW9Cg/SAxcb6oYHO@vger.kernel.org
X-Gm-Message-State: AOJu0YynF/WsExKPVceVvuYhNIe+dFThy75zaOuVkmPH25SPE7+6g6k6
	uy80OCw05ukSXsk+UoJkFvFKBOTAgyh7H9Zg2/mVUpFMKAuLbMV0/KnhuJVB4lpYWQ8RI5ugLVZ
	i8QwHgAcf7V6k1HWzWQxC88szH6VHHgXCGrIiq+7oS5gRHTw3eq/caC1/Z47GWToU3joj
X-Gm-Gg: ASbGncs/iEq5Q1HMtftDV1JSrHkM7+XhcBh9udUDuVd1mF5HD5BmP5rKwtmD4N9Gi1P
	i2h46iAOI2X722kb2KjLkOLKV7xu7Qw1jkn7100g5J1cY/haSk+G6Ls5rnuvrJNaOxaNOAbevOs
	lYdUapFl7Is/S/Xogj+c9yXLTw22/hHZc06VduFexfjWfLaDoXgk6Z9wVp57F6OYACF4qNIhK6B
	awoBEyaoS+CSeo4hw7tuJErU+onP6qWCH1bJpdkEEx5yk65B92URsiHB42ECfyWb1fbf8y8e4JC
	2wcmSbrnm+MpooKiYiAJ8heNUIuf3pOPLe9ClCIhP9wUem1pDLRSAfEkDtkMErppf9D0adKDybH
	C/WY=
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894186185a.1.1751980127648;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiGS5COZ9Dfk9VqBJ+kMTORiJffjyBCmhWeiZXp87B/AUtfoZjbT3vyAV0W19xiv8/+LqXQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894183185a.1.1751980127166;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:45 -0700 (PDT)
Message-ID: <8b473da7-5e6b-465e-ac33-a114a2b6f673@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d1861 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX6fD93PXqqBwY
 kHs+4ON49uS0N4n8FpRlCbawr6tOlzxz6Cl/ZcUgD6/qHeqblmaCe2jsQ8you/ADzSG615yBa3U
 sw387g8ag7KJympz77de8DcTh3d7oPMiMiqpMKGsWtl+DVWUoppJNYelfVSpeN8cJ02DNWWy3Z2
 J7XPTCtPUVeNUTKvg7ai7AOdJpDI7kSrN+Gj3HB9ZzgYy2Sd/flgMw+l2zRxQKIsxenR5A6ODiU
 QYguvM3Ayy+BhihMAiZuJu+gMoP1LpW4UGlXnL/AQdhFFtq4oVAcPUysfBGiZ5V/+9vObWp4zxl
 7ETsFPJYtNu6KWp0JX0/m4XLS5n8VIm+a8mlc/Q5Dk0y4qY7kX3kuIjz0RryP+kK0vNrsVp5mhV
 eA9hjVGSj+PHVq22neX+fYI0W74eyapZeX7b7uzinvpiOfGzabrujsl5CPd9xQo31Z2AzGyI
X-Proofpoint-GUID: 0aGUisAHNEVq0NatsK7rzfLR6r2J6KcP
X-Proofpoint-ORIG-GUID: 0aGUisAHNEVq0NatsK7rzfLR6r2J6KcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=796 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

