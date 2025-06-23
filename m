Return-Path: <linux-arm-msm+bounces-62045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B5AE3DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E08916F86B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADA523D2A3;
	Mon, 23 Jun 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ja7iu+m+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695423C509
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677463; cv=none; b=oGeCU6uoNvqAfTnaqOVNUfwEkfjtAXhMxhDHZFbh3o0jed5TqCc4Hbrmuq1UkZIOWg32+GAjR/H8SeeljLEExyWbTLsQ/gtlwILX43KBmZ/1GPaOY7HWaw+fiWDUD4Vg/Y6gXnIYvtfdTLEfHoD9rdpJeG5Gy5gBMlnszbBbCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677463; c=relaxed/simple;
	bh=QVfJZhPN9qiwrwnHlrRHaImgyg7M9hl5ecRtPiUK4T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugZKd9e0Rvo6fx3MKzchIPbJy3p6tQ06pNYYYhYQq9ktk11r6kt+Q0lyMaDWu7UjyX/7e0ttoXbITydDAspVsaARl3JLjveUP9lHxNEUOIK5nhtXEKa4JwZAeEbeQY8T/lCWL+ewVpKZZB+UHTTx1fUh9DDKKUrUpa03f6B0yM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ja7iu+m+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N98W4w021236
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dyny+59KUMgDnoa0Pj8FANJXdd+fC6rz2NSrYwuJ3w=; b=Ja7iu+m+DcZwXxxQ
	JOObRZ4sdQv4ObAH8WSd3BDSk0TDtBIUfkUVvXKaDbQj3z0Q5JkYClaONXjzA1Cw
	uYQr8HvL1ntj4mUma4x0y2f9eQIc9lh2uDwY3raCT4fZ3T0TeGqzy+Fe04xLrJ53
	DdGTi/dStzeQJzMhHR3+Ef9iz1l5jwaOWVizjTRm8pwiISKb44mbcbLzc1cdJgFj
	l7XcHlqcXt142Zm2w9DfKgQ4CQA4lLFhD9HMb+NR5c+x8YWCPKPEV0u/LC+Pl7a/
	d7CPvFjfe/Vpeb18fxiF+J9LEl2xdUVD7PSuXF7URh4fQEJKJiuGTkhWa+ek5oid
	lWfhsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmj1t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:17:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso107593185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 04:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677460; x=1751282260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dyny+59KUMgDnoa0Pj8FANJXdd+fC6rz2NSrYwuJ3w=;
        b=ZYp2fOo3p7Y1ivJovSDkVD9Z0O2L5yJ9dAS5JmFFoHnyxjFm0ixHo/uWGrPC3K7ZtA
         le8kMiNRYFuIivwY1KNyf6sWkAv5QETmlX8seL/Tv/O+NdCe2u5KmqkIb7LxrT5BxAvh
         x9QB8ilKXd8DTGZlF6N3c35JSwIM8g2RTlEGbzqR2RsrmmMA8Dud4b/+21uHAr/WzFge
         1VH/ua/kY4WLQKljogTIlpHBzF4BUMCiFspX55W36bf82JYgrmgrDlZ4zbLrrBJNDyvN
         BKNHaqXeeXAOohXneb0ALHhfX2oCSL+7x5LHf0qBQyqzm0idr+iaSo/ijkv6VYoY7881
         GlDg==
X-Gm-Message-State: AOJu0YxYniekuBXkWRd38LX1+44kVoze/OQ/OC0kuNuSsKssdhg41wtq
	wcArVdH6WVUl5zyt5xNIHT1s/L80ZgvMA6dzkcm3hKjhSWNidXUaRHWFVvXT8l6Cc2YS/0Wm2XI
	F7UznqHLH26rDJGydqEvcMSIPv2l8v4QLm//pkjqqY5ma2Pu6aG7aKXBktkbVXY9LCaVq
X-Gm-Gg: ASbGncsvDSe8d5k/IHUGwj7LMK3KbjWxv+xsXPNMa8daTJZ+4ZKpJrnc50i2hFk1Pj2
	3ETPO7Pbb1ZeIHo92sWYNpbEnXPq1s6UIFXsA5IphxF5DbmD7KCKlP3t7PjA/+Wl1q/ornbYpeo
	6qtFbtptlrSecXEM2WBP++BuKs+ggHFGaIX6o74N0VPX1kJEX5XCyijMqcmbnx90ltN69GFZHKE
	GmF5AYTRkzQhN/241v9FUISW/7hgTs2M13JLxo81LPwlaPli+65DBJoVNMTIRQ3OfJ4YD2eucea
	UOiyE7ZCHq3eOxbim1ZJ9J30ZT/tEIvOmQwLM5P5J69t/LSbSO0uVO1qq8E5Ztwm9PZipBSwbVt
	R9Jo=
X-Received: by 2002:a05:620a:8016:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d3f9938ca8mr701362485a.14.1750677459632;
        Mon, 23 Jun 2025 04:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKL+gpI55fdb30AiEedCk5JVTk1bfoCgITZ7zqFEzV6b0TJ8Zlfj3wjSMDQqD00Aky80qkgw==
X-Received: by 2002:a05:620a:8016:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d3f9938ca8mr701359585a.14.1750677459080;
        Mon, 23 Jun 2025 04:17:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b7258sm691177466b.119.2025.06.23.04.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:17:38 -0700 (PDT)
Message-ID: <ef07138d-dab5-4a9c-9bd6-20299e2fa53e@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
 <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jiG26uYPvGho_CJK5sHRagBvGzYAg8Kg
X-Proofpoint-ORIG-GUID: jiG26uYPvGho_CJK5sHRagBvGzYAg8Kg
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685937d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HP-r-xv5IR-xfd4SPmYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NyBTYWx0ZWRfX4DljNiXitO0X
 /EE9xce5a3SQxYgBffK5UbbWBl5NZA1PFTBIWE2egDd5SPOYHShf4fELWbpr7xY5e+KwrZHTJqI
 oNJbEK996hc9Fu++mn52HMzpNQWGclNpd64iJjLtcBvjioI38KbmfzdzBHSmyyg/aYlnt7rEHwB
 6j1T13zMAinbTngYgQWwf82LINo/Sv1mQJ6vLV9AhLFxLk84RtVXeKuhqadwnifLW4Nq159mhVZ
 nxe59C0JNeV5yAIlIDhVzPqt2c8E2VJMLUqimLbaIQNYS9mZxTIvaHhKB+TReTOura3jJt3UInc
 QgHW8iOZOZSC5kFpjotfqiew5TUrjDukdi3T85BqQ9GXEDS6yyj1eRcnHk7gzTdAv0vTGwHwhiE
 ca2YsuT+U/jjlWzu850Iejmlew6qSpj2mOgjsFRZcnYZaQeMHmCowqmQaXzW9ra20KaZjaK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=997 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230067

On 6/23/25 1:16 PM, Konrad Dybcio wrote:
> On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
>> Add DT entries for the qcm2290 venus encoder/decoder.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---

[...]

>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> 
> On other platforms, this clock is consumed by videocc

..except I didn't notice there's no videocc on this one

Konrad

