Return-Path: <linux-arm-msm+bounces-56886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A5BAABA38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100923BF4D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934F3217739;
	Tue,  6 May 2025 04:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MpcvTscH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B8327AC44;
	Tue,  6 May 2025 04:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504456; cv=none; b=m4Jzr5YVvRIywATsL+rTWdcxj9JAXOkm8ReIhQpoQtvNE6/C5iqK+pcJSpDZ+VwFwfK2c3VhE0deK/ylQ6hNEPYneArvM2bsrsUS512ZXPASLIXtK0Uno/naPxvTVJ5YcfG2vCeVcRovH6YSU+H6no0TB94Y9cZe+9TVNCpU0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504456; c=relaxed/simple;
	bh=xKEaLg0xeLxv/foHFiczwztCwAn6AMmjzHxBpNaINag=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lO+miZbRb2Y8eqRQ0+l/4WyZM9wg67+RX8pFbgqZkhb2GPsNNWI90GSZz589kQenRJaNWiVR4r5/P/aRiQBBtcDlLtzau4N/aPD4WF3vL42uzLUzFES7iWHHxh1Bs4uDB4vyV/Cy6hV28JC3/JlvWRghjHWh5k505KV32UOgd8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MpcvTscH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M6YUq014186;
	Tue, 6 May 2025 04:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBrQueunD29pwtZ7nyPlnH4tPT+aRDKtGtA0hlttyd0=; b=MpcvTscHxD2Qcx5N
	KYwJ80/u2SB16OaOtUxnh4XyVHAK5xiX47WQvG71qh3Oj1jFsOVZd7C5mm3UEvPq
	ynU4tH5zjb8w4QEgBpmzdt2xTmQm/mwSfDn/TbY2z96ANpfQpT7N1qEHVufk6IJ2
	r4gS3zq1ixapSx9q95uZGwe9fjTh1kKpxhM0CYzkaQAgOK7pwWKHXRvwwRTtykwE
	CZ5gXuq6805gALUEDdmYAPPBj4Fjxjo9ZNaB4hfYqiwgakteyXr7bpxHbeSiZDqt
	2dU9N3GoVmqIQ/C4NdeJtsBlejEymA2EUEwEFCAzVWR1IW4CbFjs8NiKkVyuEpbi
	DP3Ciw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u40tuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:07:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546478fC002368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 04:07:08 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 21:07:03 -0700
Message-ID: <42beadc3-4c90-4012-a019-dca2083d4c89@quicinc.com>
Date: Tue, 6 May 2025 12:07:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core
 Clock freq
To: Avri Altman <Avri.Altman@sandisk.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com"
	<beanhuo@micron.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
 <20250502042432.88434-3-quic_ziqichen@quicinc.com>
 <PH7PR16MB619617AE20ECBC06E548EC24E58D2@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <PH7PR16MB619617AE20ECBC06E548EC24E58D2@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=68198aed cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=v_nTldZyZx9e_q5U3aIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gjSWctVIkbPZxKujJFNy9qQrBVu4ugol
X-Proofpoint-ORIG-GUID: gjSWctVIkbPZxKujJFNy9qQrBVu4ugol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAzNiBTYWx0ZWRfX2aONhp2WPVi8
 7RZO/KoSbwwYg4v9XtEfSplGZm1xHT6IYLUd04wN5oi2d8jWLRVrjbm5l7QFBaxaCYkwEvzeA63
 6CAGUoI0XUlawWiZ0ABGn9KNTeDkWxaI9tFnMbts+69h0k7kct1wE3B+pfz2JMxOJ1aU06PuO8J
 TEBWg1P/qgrrbG8L5+lCnA/P1t4oQCcWwY9ELifsI0Abb5rFebAjTnLcrK13v4Tral9sf3SkhKV
 boFebGQCESxL17EBrwFyvlQA+ws3GCvlnZdSbxIlD8zDpgdNRpqSUMbZFeU5fy0LFgdbWhVwDJ/
 22kdyrqi6T7TFzLzpk1L8BLSDOzpNSPFuaCzEg94AzhWNopILnYfby3QhYhrpgwn6VzRO1W+Un5
 qh2wd9jGFNhPS1Me56cP47nLVCiT5t0Olj6sB8FIyamBS3j0BQQ1e3PCkaz9UdNtsGgST/o+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_02,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=905
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1011 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060036


Hi Avri,

On 5/2/2025 1:13 PM, Avri Altman wrote:
>> +			cycles_in_1us = ceil(clk_freq, HZ_PER_MHZ);
> Does ceil() is in fact DIV_ROUND_UP?
>
Yes , Both of these macro definitions, ceil(freq, div) and
DIV_ROUND_UP(n, d), are used to implement the function of rounding up
upwards by different implementation methods.

Ziqi,

> Thanks,
> Avri


