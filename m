Return-Path: <linux-arm-msm+bounces-88978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D68ED1DA1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D99E93007EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584E83876D7;
	Wed, 14 Jan 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLzesBQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIk6sdvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F9F35E544
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383538; cv=none; b=oC3LNgGVgJDxgkHznpfQsYNBa+DrQ5EOkXIh9CGvz3CDMN0QZ7zLyka3I3Emj8VBZH/9C8gRs1wCggodHm3oJk58lN5K9yiAgEa/FbtislU6bULOMMrkshup4XrZ9+XLSXWU8/BDh+lCmMFekelvUtFRE8c3whmf2tquptRd0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383538; c=relaxed/simple;
	bh=Xp38FH3EHfLB/9zTGdTJEuAENX2mrwIViykrDPLmLVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyUgNHtxHR9Goqs2Z05tSbrSpo5PtCzwDCTJTODIPphpCslzFWrKdeXhwl7o6Bn8w8ajutgaLKCNADDZd2CvE2reJ1MYoyJ+oKn05Tqkkco3Fm2rSLarFtzs9ozthENgBkPQqq0daFPMpCu+D7h1fVM5F7Rr3tbaEleZIgy2SuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLzesBQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIk6sdvi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jCY12789549
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=; b=JLzesBQlYUcf9Ggd
	pr7OxN+d21DBV4892AwsKQZ/j2eY7rkxmYgeEVwod0XuXJq/NTPnLsCcJaR+IRjV
	GGJ9Itb4jKAdpx8B2sEKaPrRIDFKvpkh0YQu6ns3mtQxuPngVNY20wmfYsDXwFKW
	Z7kL04sUU1Wv3uX7/aZLU3PQMjxtslYZ8eolgGgI7aQ/uVpOhZzbi1+3YU9VGq8k
	x9pma2MOwRi/KKL3UlBIO9MUUsGTbvzsdvImCaDokX080aRm+ZFUjlhZlUqMN9Bq
	4nkK3uiuRU2le7B7t88TMt4ZMOhnnQaSSSW41U2mIF0EuworIY3Id3XGL1IF37aB
	CfBwtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7vabc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:38:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c536c9d2f7so534485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383535; x=1768988335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
        b=OIk6sdvi9DeCtSdV+WNdd2naHIbON/NfFoQJK6vfKoIlWe5XNdYxazDe/w+n81030V
         pTTaIZt12d4ePkxET1nmR7caksAw7nWTqyZW9OhyDPuotJPnxh/zx0aM2zs6RfceFvgz
         ai/z2aoTixfXDE41MyqIMZMA3+Td9VarwQWNcpnMzjFJ7cPlvvrL2HGVpz24XqXF/c9j
         +J23SqjKtfCbsK5l0aaTkwV31webPtswiSPlBkx4xc1nTVGbsQhdHAlgrdiXzXZzsQ71
         0ejTEIZXlaLAfyW/PDIm+bFfUYfHY55TDSBQEaHT2K9wJTCdRStGrAm5RmKUyvxz+6XK
         EbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383535; x=1768988335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
        b=LvruBk4FaeLDt4Hioa08qW6q2JfVeZz/WP8RgGIqj+b1aNprRQViJ7pDkdpTNm4dUW
         s4ot/6GxpJ4n6LWSCClFxyw6OYVUk0ppQhQZDj6DW1wQpBw2VG9xkHKTHeDUXt7XiJxD
         qkWs3Pm2bwEJTL60aWqB89DqokfcBh3ITMEIyHlvd9QvFMv4WpY59/5MA80jd9PuXShS
         g1aFE0JPM0KA5aWqPR/sFiVGnTlbhYoSGZfALcRsDuo9kMd7YY+6kz8Qm7nX7MgA2PY4
         lnWAMTDFaXlm7ycb+C5mSIbv8blFIXm6s7BfLuTd7QQTIctmI20u2roLbW6ikaNeaTdb
         OlFw==
X-Gm-Message-State: AOJu0YyGnD94RdQphuna6m67jbIJQbPc0y7TMti+vnKr7CSViZRbKOuV
	YyBuHaUK46S8yllzuUYaBhY28zG6aL0IVe7BLvtERjBB0zrlGTHngpORk8/Lj0TEHUh2HsKkMo1
	HAMyhNdbxitzi6+u2/Wo8T+wtWJrmoHpsbV6QgF5dy7bF+P+VlG+nhYwEET50DIv7Dw7i
X-Gm-Gg: AY/fxX5miVTo8skc/AMejbdskZHfVo1r7hYpoBnHD14PsgG2xmq9yLdAuwtbSB3mtOx
	x1xksy6NCN2o10kgE1otsO2cQ0GHq3T9X9PvbLSImhY2SKT5HR98b4ETYSfOhaLdhluVvZ0wb9F
	zFwHotTXoAin8Cmg4BVRmbtHxvDuaAZHHsKnIzKg2r7sIbNdl5AzFgYwCnDuuv9mN7mxiwrioQS
	Y1Is7iokYbfidVVm5jUHU/eXVe3Cea9GMmPgFZJLMD9aAST2xwUtpjRBGxaSBv3PBn4mA3yfAxC
	4MQW6/UJz0YQJ3/DzUsGesTROBgEF9+5lU6iOew4CO5O5S6+3jyFaH99R/nXo2yFlI9vqNlrpZj
	fdn/vV1GiGoxnkATfsaafwuHlR7thmRKrtOgQvlMEeunD0L2EFXUhDF3H16VoUQKY0FI=
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c52fb16342mr214671485a.3.1768383535320;
        Wed, 14 Jan 2026 01:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c52fb16342mr214669185a.3.1768383534889;
        Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4c15sm22444115a12.4.2026.01.14.01.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Message-ID: <87699223-c2ab-4aa8-821b-aefe7d2c6b29@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] media: iris: retrieve UBWC platform
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX1Qaq50sgv3mg
 YFv0P6phwM+xJFzyMTNLJWRlflmDX+FwNpsRo1TlMcvxcEeyOqnakRD5fcrsMz//68ToXe6RoIr
 vTxTRV9KOZlnUuUNacT91y7is3jm/bEM/ES7Kbmy95NEOKeUSnA6ax/hI3u2C0ZIzb7JKL+rgZE
 pFiTv/TI5aWOUjwZ+e+41li2z2L4zm3p2hI1PH+drVzQOkWyiECNSnSqCDA+3kh+hfYZ+lSauLH
 haABIsHjbt9jleKi5C/N4GwLEgS3Jf2FjSqFxhvZEGu8NoP29rIWzpF4k/VTEv3ucEPHodS6vQ3
 k+05J4NBdrASRspZGgrkSo6TifuNSCG5sUgIldNJQzyLxnnVmVGVDAsx+trV0+ZoQeo5kqY+2cP
 6+LrfMIcnaUSQ+MaqvuAGQMpZZp6r2HznqJMUzQoA9PW08dpUzODCSP3E8ta/yEi2VY7XV42z63
 XfL1+20Wi0tM/PVjPbw==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=69676430 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cAxcSLUL-m0wKPm7p5wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mSEATn0OCoOlht6GoZ4cLQ9dDOv8wVko
X-Proofpoint-ORIG-GUID: mSEATn0OCoOlht6GoZ4cLQ9dDOv8wVko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140078

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


