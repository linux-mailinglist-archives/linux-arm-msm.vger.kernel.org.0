Return-Path: <linux-arm-msm+bounces-51743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3BA67685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D63543A9C12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E4A20CCC3;
	Tue, 18 Mar 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCp2FSEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E220D50C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308617; cv=none; b=HaPaswjF19kLpyS2DaOrvi15mqvOB14nh48CPwef5naU7vZzuqvOIm1WM0ilw1jw9aG7DEyHWsp2J703tNuj3tAo1Mw5VqR7jb2RNRZrLt5L9gKfYElIrAM2qQkncT+i0Nsk9wqBdW00oiHVIdcPD9RCoOPz+/6zRE38rVql0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308617; c=relaxed/simple;
	bh=TS7yAlFtyA4w+UW6DGl+TwS8HEWTF86imH2nDVNImpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PeOuTQneQ9AHLaTQDlC8AbPfakcwLqQffuirnItylJjWL44cVJZnLAM96VZLuXspX7HQg3U5YOA/ADZbYUQ6roQ2u0kq30AG7kb1n9vutRMAXzy7PuSQGjru0kByzlrbYk7LDjB9cZ4gSwkwn8zqmjfjOraguythuwAOVhDPQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCp2FSEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8we6a005980
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3i/WfiJsCWYWSa50/DOQ09XMPER/DM23N59KdrrCh2s=; b=lCp2FSEZ5VcXhX2I
	U9+rycuZP8W8+f0tpC10IUwXwN8oaI2SUkcDf42s6Qsa/6hPG7UbzNClNmbVZqPQ
	DdNpCBiXqazzByvi1h6fqNio/WY/9nAz7jeESH1yjX0pT+tMYIuNnlloi79EF+A1
	0xTkwZx4vg0/YyuIzFRaAiG9FpZi+6K9a75sPrbgC2yk/vyrEmMP63hiaFnyPjq+
	mWu8EJy6sr75BiAc7ejnCAYQSZtbfnyDyk4uPrUjtsP7fCbIGnh8RUjLiPT+Ydcg
	LKbouWsS/a5X9C7UmDZhw3GrkesBcj6L4f3fvIwwt5r6oZ0/c3vVMEwVPhRTd4EB
	/YpiqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbts6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:36:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso19899316d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308613; x=1742913413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3i/WfiJsCWYWSa50/DOQ09XMPER/DM23N59KdrrCh2s=;
        b=ApoVUQAOcvutxbLZa0mw62zExMmcLCFB8YSTApN4URI++o4dt+zK7BDzVYsuPKvrGH
         u7U0LiHvDG0qY024CTHa8IFuGVHDh5ynMhfk2UBrO2vu+c+/y/76RVWmWI/AaHOMFdB7
         8ushhGVRfhmogaoemcmJyyFhcpt4zecwoHcoq/jLpXWnuMDzIIhj/A4FNIm1K4IcP1Er
         0A4N4d+EWFcIWbpXthN4krUyo1aU7A0Qp8MVdswCdg9BOpt06v0ROQ8tU3DF/B6hdXEl
         sqw0gEpsChHFVYd1KvJUJpZDlOX/BtQvWr9RC715phwdDkbFdFwn7E/VHohLUIz1AJ4u
         kw8Q==
X-Gm-Message-State: AOJu0YwMOztHPvpdOgBeTojDp/hkTaYctwVLqtf2D+De/cN0W2+faG9d
	nwVTeoBYCGndsMo+6l6Mfp78VvrO0n8/v9QfsNfY6hhsc5iIMBbIPjEN3h2KNEjOW+1VxYQqaJK
	sc5pDHHWVNg7VBdxEYeTySjWiOUib4wll/QBVgeQ7dHFMIfMLZ7Et870XadEsPYSt
X-Gm-Gg: ASbGncvNSCcaI6GGlyztCq7uEP7lQyuUl5yKYbGz2jTrlLwTNRgxzHVqKZP4ZvLzLOR
	AbLL7IEg4GGOWesDTe8gpWbhO0q5FwVwtRD7HkQw+UbhRzMnrdtL+9ACSY0qi8c8uQKcU0XlqIM
	OguoRuBXswfa4br/C0c9S0HTJfGW7CfYCzmsCS+ugsnoZS4EHSA7TIElRIrUPkFz4oypJAMIY5r
	9clHSUtp8K0vfPR8hP6ccD2qeUDNg4jt1B4AzGUh71tkhpFh4ELX+aPfDzCwOR5lTg1NEIIY2wz
	Ew7aUutX14eSFTSWmxVhqY5zSbfIhLqdKdPskUvNLuRTntxfGN0MgT2Lnl/LLP6OFIwX0Q==
X-Received: by 2002:a05:6214:2aad:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eaeaafd099mr79752796d6.9.1742308613336;
        Tue, 18 Mar 2025 07:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH630QmTtlvTyt7LsuCuoPjQARwW1UMfX8DJMZr/yM3CDhlOmPUiz46vASZy9uXmEk0lZZbDA==
X-Received: by 2002:a05:6214:2aad:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eaeaafd099mr79752666d6.9.1742308613012;
        Tue, 18 Mar 2025 07:36:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a40f61sm854429366b.134.2025.03.18.07.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:36:52 -0700 (PDT)
Message-ID: <c8b872ed-62fa-4c56-97ac-d01c400d621c@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:36:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ARM: dts: qcom: apq8064: add missing clocks to
 the timer node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5J2Kxj6Lu4gYC8zRQEq6FN13RlXNO_GP
X-Proofpoint-GUID: 5J2Kxj6Lu4gYC8zRQEq6FN13RlXNO_GP
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d98506 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Jgmzq8KhWWce1OBKEKoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=945 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180107

On 3/18/25 2:21 PM, Dmitry Baryshkov wrote:
> In order to fix DT schema warning and describe hardware properly, add
> missing sleep clock to the timer node.
> 
> Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This is not strictly related to this patch, but this node/binding:

* clock-frequency seems unused
* "qcom,msm-timer" seems to have never been present in drivers/watchdog,
  arch/arm/mach-qcom or arch/arm/mach-msm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

