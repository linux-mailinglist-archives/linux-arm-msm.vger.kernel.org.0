Return-Path: <linux-arm-msm+bounces-77174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299DBD8FA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A199E18A299E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADF830C361;
	Tue, 14 Oct 2025 11:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/G6qLDF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3E2FD7DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760440820; cv=none; b=ee703oUz95fXL36N3sKrCUes12gFO70a9V88UMrQ8wfteavfcDHNaBMSXRAgapY5auCK7zLS3WecU99csrvh9yhwX5hyIfLo0Z1tg6kwW1b2Gbrh1qPckMKUQlNQfJ0/FrCLi5xL+LaE9ub8RGMmIsbVHY6B/7AP8EdE/y4pfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760440820; c=relaxed/simple;
	bh=9c4sEBdDNCuyNGgDOg6MiHVAziL4QP9mRC3r8B4XAso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHOT5HFD1jnU9tGbRytLjl4EbvDnSl7cI3IxRhjMK0L7QnZI7rTdMX6dPR+xLPRxr8X+r5TNcFdJxeStGTy3PX2E51i/VdsFOv3rgr/pXWlqByseb6+zjq0fsvZStY6kv3lTF0vocQ51KO2sLIjU2Cx8IdgKtuFUY7+HcOzRSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/G6qLDF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87GmR008937
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3zlQTUnJaQdMxPkf1IdgDBVPpkVTRW0DJoAFXU8XFM=; b=N/G6qLDFP+eAensO
	6eJghkWxbPoGOUd1xGV+yHwmCKe3JpeAqcXYFA8HtMsXmz/YHRi/g9YjJuXuQyPQ
	wi9dftRStvS0xDAuhIwkep+OsKngSKqgjVw1IBKcBaUG5cLXl1XaYyT6hGaKJy2Q
	8YWFDDq2JLAgtVT1xb+MvSXYrmlJrFCIdP37chmhvMqqzVXp3KmEawV5zw7/Njqj
	JanWyrxGInVCRuEL6rgC5BWc8tCHkTlz0g0wEajws0ShTgctgtE1a/ofEiwP6hta
	MQVfMDSG4GIERAiCXD7GvYagQs1Aq+F+KjZITK4WX01EcPUEf10FdGFrVnal+7of
	9hHnkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5g8f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:20:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3306bae2119so2481711a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440812; x=1761045612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3zlQTUnJaQdMxPkf1IdgDBVPpkVTRW0DJoAFXU8XFM=;
        b=UYs+vhk3Ss81KdvVbim/Mfm4juyXiDGgx1Iyh3/KdLyRaitsWMB17gLAdefKkQVrzP
         MGpPrOmNJzXT6/8CezI97Ps52ih0Qi3jrFaIEjGmLWxabKgptIa64DblXxP3EGuDoAZb
         s6hwNEqWPj0Wp3c8NsUmUtrMMc6VyAR1sGG9eOvFzC66iqjXbqlKAn5Fy+m70Juic0PK
         S4L9NEB4Fy03myMeOsHMHxI8gdkxJaLEglCvIjiiOs5H5JuyLOFdkqZBmgA5M5CuxYmK
         GWaCAcmMcUGkUybLUJsUnzKLX6oq1YkFp+q138eSCvF0Vb+jxjO6/25MCSEkUa2Tm7TT
         mKCg==
X-Gm-Message-State: AOJu0YynnNniZkEqJBVcTFFVPF0Fj45kKYyMI9CHU3sr4EqnCNx4q+4h
	KEoGtsiRObI7EQHz4tzUISJK+pNRvzY4YQlGnYm2pwmhSG9UUY5e2mvUGRRGSK7Sj/6mkaX0PLt
	shs5u5T12yT2HQYSgMvEkQwbpoMjN32o57VqkbSt8p5z3UAsC5fYfykghoprvyj0KjHL9
X-Gm-Gg: ASbGncv/woGAhRr0Ze43RXhvQrTBQ2jk/PR4GUAxqeyWnF9QLqRsL1MovrO48igqV+S
	hTLWr81dijIOWTxX6K7lS8xXPxESvZZSr521KA6F1Ti1WyN/UNKaAScScqL9vXAyiZSSRCIPN1g
	MRKpBF57/dfimOxLxhcpBhzVW1n9+Usie81X/KULf6L8xMcJ52XH1+DG27kwX4VQOigDD4gFv4U
	LnpsBo5v/ABkmAlu5Q2ubVn2+E0G5gwd4Jvn22swFc5yKGnZaFp46aAygKPYGG5EE+zPuYfTxSz
	+gInGjeG/94rR4dDmunzqBRhE9/GlbVhVJM7IaH3IJX6FPKsxyQwZ27YmsynNlKEuMQ3QjG8L2R
	zlHRDxYe5NEYnlOmwyXXYA8RgcDqpb/d8mWI=
X-Received: by 2002:a17:90b:17cb:b0:32e:74b6:4ef9 with SMTP id 98e67ed59e1d1-33b50f297f8mr16955304a91.0.1760440812103;
        Tue, 14 Oct 2025 04:20:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8ccPgYpBB44vAXWCOVRI1VlGEHsze44hC1G2/E237fphW4r1GMjOiSsLUZtF1AZ5xwCYD2w==
X-Received: by 2002:a17:90b:17cb:b0:32e:74b6:4ef9 with SMTP id 98e67ed59e1d1-33b50f297f8mr16955273a91.0.1760440811521;
        Tue, 14 Oct 2025 04:20:11 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cbf2sm15693949a91.8.2025.10.14.04.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 04:20:10 -0700 (PDT)
Message-ID: <47e72a8c-0dc9-4c87-9e1d-b4c60a178a94@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:20:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
 <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 43HeC5Unwce7m8rjO7_g--QyR85KCr7B
X-Proofpoint-ORIG-GUID: 43HeC5Unwce7m8rjO7_g--QyR85KCr7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXx5sO8aUNc3CT
 R1ztclz4b0HW0w6LFtkhSo/sEmiY5DQxy4OBQnTDC760uWFVou5JXarbAaWIOqkEdD8riludFyJ
 5yn8dFhHDK5edyGQWpLkU8k7HWS17X1Y+s/uLVdL0BlJYS7Kb2inRPib/o9aVUbQaquIcmxYLPk
 3stl+hu4djzlUAym4dGYFqfj+Xw5WVNDRpjhS+N4HzgXwb9+RvyhhWEKg4QTwU2cAdBxZdlBrjs
 ck2r72ZXqtpWIBhIPW5w+RBl1xXfioAxp7jsMsOylbBy/85tEVDzg/MoXr0QAhO8vVFuVzJPG4D
 QkKp2WT3sXdVC8uOdPz4Hd0i5mssEq5Xky7fHsbNykO9n79k5nP1S2sLXbxrmh1GwsE5U2iC171
 EgN1ojmJRR93j+AWd4+T2k9Zi7jaTg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee31f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iK4FTFApuVx0pu7eI5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020


On 10/14/2025 5:52 PM, Konrad Dybcio wrote:
> On 10/14/25 11:42 AM, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
> subject: "qcom:" -> "qcom: qcs615-ride:"


Ok, will update subject.


>
> [...]
>
>> +&mdss_dp0_out {
>> +	data-lanes = <3 2 0 1>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> No 8100?


Yes, according to the HPG description, this PHY only supports up to 5.4 GHz.


> Konrad

