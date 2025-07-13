Return-Path: <linux-arm-msm+bounces-64706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64222B02FD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 10:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F1F27A375F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B9F1DFD86;
	Sun, 13 Jul 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7hkrAmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C881AA7A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394759; cv=none; b=nczi6juAtZisacaLK0hPjCcfIV/TA2M8fSHuh4KmZJb/PhfhPDf6blZku6QmWQkGc5UaJajb9B7vyZYobyzGJgltEz8PVNCDRCQo0YzADdJsxo5QJ1eM4YuNr53JCR40P73h9h5h4N9iqidIvykEw5IJObeYjZt/XkpBrpI7SAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394759; c=relaxed/simple;
	bh=ygYuN2TTNL2SM/3Pw9NF1EZYs4Jmwm183kP3gMiksRs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aE3HBhZyojZqR27i1h0xa0ChQHNzVt5zOClJabrHitFENThvDMwYVCr3ab4vIMsBbmujYFKEZebpOhuMreyQJEhXhZMMUPofiwnzICC7uX2o644vHlDLhN920DtPzkEcrkAMLWbognI76okHfMwggTfDVqdXdLltTP3lVtbNISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7hkrAmt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56D2rGkA032687
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jvVyW4KQM51jowUkrrNklb/y
	GAEEPyAbTimsRfsNU0I=; b=o7hkrAmtc9G/UYbo+0ybUftp2vIyXp9rMQE4bEUC
	ftGXDVsM+zZrCtIVZGGsbEK5aCY1QJZGZBabNqx8lwbpZWvWaQdMYUvl6dWAyujU
	nSrh+eD6k5q0B+8vExwKLhW4Bswc1X/oew6MwVZIDchM/i5qE01VwcjNHKA8ZLXT
	WUXLXIfyqJYZ0KqbDF9kdw6XKTCN7ijd3NKrAtkNq9Atu1MndkaRw+w0HuDCc56a
	1QjiLsrKi9/rBOq+SEAGI4nn4CR57NKyInrs34d4NWEQ+2r4M0FvzE42WxwFLDMt
	SYzwbDP5sNnJBRm9+VLZ+F8M4iw/ojKrYLRZELF58/HgDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut1s00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:19:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2c8137662so8251585a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 01:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394755; x=1752999555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvVyW4KQM51jowUkrrNklb/yGAEEPyAbTimsRfsNU0I=;
        b=hCBFfYmMctLu/8zuQZM721UmG6FsIfk+qsM+/n1bHkBIeewtGV93QpLKpUnB6EuuAd
         YRrb93hYQiX8c5mH0sUt4St9nRChsV/o7IvbXabyAhiO/XxNXCp0iiBw5MGGNFNWoRkc
         J1m/Or6Lr+PwQf1dezxAKsTY7wV7a2Nzew87T6AIVLYlJkAdV1r74TQNe9mSBql27G77
         ZJAOVfnMNaozTG7/3SxBCMLDwzDStrWhYmDQh2pUllYFWVAS/M/eEZqFtz+eSBWO8FPH
         jbZ/1cL2eKIELfMZdb8RuJcoIajmfxZ28c6xl3rQwtuzUuJGrzDDClITEGwy0ULXPZrn
         Su6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwWGukQ80DNpRxWY5FMWwFttKGRf3QBpPqjjTMfHQhBNtXfSGjwKiDw92J8jSrukNj/YOmmWBfDtGWMoWX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tcKpqLQpQOaxhtSLiCmUqvPGCVfdrEhlw7T4mg6my/G3YH50
	olc5iXul2fcRuHViHmkZlJCS4Bf/9oF1EpjM5B++PV7Nzum7ZCtgyijDrInQBaGTVI9nadzUKoN
	b5xhK/4GBx3k9uynCBBwSS3p+2tE/mEX30dZQI+nF5ocqn1PPDklOZ6tpets3+NxRspMY
X-Gm-Gg: ASbGncuIbRPUy0heeScrNidQ85X+X43aMLuQ/TfZ/d1GD9s1qhEqd4wXrNQcDOKdbSw
	aDU866mUyU8nH0fYrKtTcA/qX95RWFRMjsJpW/5omhoWtoRSGiEpVgQLF2gI3T0G6tK1QVBoAcM
	H1bk9tPaJyi0DXh3+NoyUz5rJSZMirn2SUPZZ7pKDnTeGnS6k+8bDw6LF3roKwPJwTzzuJ2KIm8
	MPiAmsy4Qo03Spy3SW/tvWza4/IuYNi6nYub9NkV9ThElgsLP3j5lbdlUEne7IYqeCNWxnZ+MQE
	jjGobzlIVD0MjLTpOu+GyxhpZiENSsxUQZetfpTPudB6JoOPvBhkY3OpZAOcDiVHWIFteJIGgcI
	=
X-Received: by 2002:a05:620a:4056:b0:7db:94e6:4929 with SMTP id af79cd13be357-7de050a6b69mr1148779185a.20.1752394755297;
        Sun, 13 Jul 2025 01:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAXMY4Nu22oS4iMPfYBCmtTx31uTknxbB52WB2wjHLaXr79YWw1L0N7FvVH1enfsTZncgitA==
X-Received: by 2002:a05:620a:4056:b0:7db:94e6:4929 with SMTP id af79cd13be357-7de050a6b69mr1148776985a.20.1752394754876;
        Sun, 13 Jul 2025 01:19:14 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d758sm9002937f8f.49.2025.07.13.01.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:19:14 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sun, 13 Jul 2025 10:19:12 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aHNsAP6Q6mvc6jX6@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
 <aGuOzdCu5UmKDF94@trex>
 <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68736c04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8
 a=DVtxpjqVNlKwMNJ2E7kA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: 0pkYwK_2js-FONWgh7fRXNh2iZpPXTuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDA1NiBTYWx0ZWRfX1ufGz57ab97b
 GAz5AWx9E3lDiun0+8881WzM2zRRC0WUDjO4yp2I3hEDkiHqlFH/zJjjupuLsGmfcKp5wEPr617
 CFIeGJCUnKbL2byezeWAksk944/Tw3L1HA96FX3BPBKm9QLvQGGEfY9ORs5vu9brlFLZlNtiWKy
 edJfoxQYxsK7VtX7r73zzNDF3t+bxVC3xySzUmbZs9HPfbUPHVTVMQ7dW9o/RyaW9Fw3wz/q4At
 6+cQiK0pPEoZfxgRjk42E1was8rDWUy2jPQSR1MaDaJizIiPFsN+MzN0BqHSp4FGDqREZ2UOj1x
 QuAIxdvs5LMxDCHGpuE+j3DrXGMB3vZ7iuVxWKV6I4X63yTpSmJaF64rnpnpmzc87GmR7rpCUXt
 eSUKrAyHunkcEgJDzwsbFk2B2iwk10nal5lv7mo/Dkje9b1rdxPKBByVgHnsGf6z1Qu8Jk4W
X-Proofpoint-ORIG-GUID: 0pkYwK_2js-FONWgh7fRXNh2iZpPXTuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507130056

On 07/07/25 11:19:33, Konrad Dybcio wrote:
> On 7/7/25 11:09 AM, Jorge Ramirez wrote:
> > On 27/06/25 18:46:10, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> Add a qcm2290 compatible binding to the venus core.
> >>>
> >>> Video encoding support is not exposed until the relevant hardware
> >>> capabilities are enabled.
> >>>
> >>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
> >>>  1 file changed, 39 insertions(+)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>> index 736ef53d988d..f1f211ca1ce2 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.c
> >>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
> >>>  	.enc_nodename = "video-encoder",
> >>>  };
> >>>  
> >>> +static const struct freq_tbl qcm2290_freq_table[] = {
> >>> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> >>> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> >>> +};
> >>> +
> >> fix this corner.
> > 
> > ok, will wait for Vikash to confirm the other ones.
> 
> Actually you can get rid of it now, I think:
> 
> https://git.linuxtv.org/media.git/commit/?id=b179234b5e59013f8772da17b273f463f9720bdd
> 
> Konrad

yes, thanks!

