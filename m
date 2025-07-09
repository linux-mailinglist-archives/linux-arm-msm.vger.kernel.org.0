Return-Path: <linux-arm-msm+bounces-64291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778DAFF3BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 23:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9F9543F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 21:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FDD2397A4;
	Wed,  9 Jul 2025 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e/Bx1v2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33E2235BE8;
	Wed,  9 Jul 2025 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752095661; cv=none; b=kGCWJTmk/cR74GS3bk9oI4uQclfXUcf9fOipbgiAisChhOuWPejMy0Ccs0rpuc3JEm3DlKGoRb/45DYKqR2uTr1XUwDGvfV7yDTboBtm2/Z1kNWnMLcP7ozALqDi2bVQz/ukEc8+sTFM/9zoQtLrrUOne988abPsO4EFyPn5DmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752095661; c=relaxed/simple;
	bh=9KE00Vwfvn7smHgPqWuuB+mbXhp6z0jzNeYVhG7Ib0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aloFTlTZ3JEQR31s/IGH88wWGrVTIZeK9tgEAtGfWVBmhDYpy1lMsNCXoQoX5VzbSXOj6bXffaGBsO/RWbCwENLQEtSMEhcGhzsLOeRVG+AhnwGwWp3/hE3JoJzAQO7BGMzTRn8mEzafS12Lu6RNDallr5fTu3YOQZwj+2CirSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e/Bx1v2X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Coixn030114;
	Wed, 9 Jul 2025 21:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nPCEWV4vb9msc1fgEgWqYaHAbD5KVC03zhO82vm6oK8=; b=e/Bx1v2X8pPuOnn1
	NNAYvSR6Gvuj8mtq+vZyfg4SH86zuD7TXIE2WQJkN9E7JndA4cQ+DqykiBXlX8aw
	Ur1TjImMMd7ogJctYoIFkBiS4W+i0FKDie29UV5MM8j7pvDZaQx6RdEofki81xRE
	QVdO9En2auEEV9gLXkm9fj/AwBDDIE9gsjPrNErBLB/hp5Ranng60Y5bt/fyGMCl
	zWx/QCo2iMaJhfbo+Xzr/kKTP/9uFdeopBr4+LVXlKakW+Czu4vf9hUdyTI+o8kx
	TlGuHEcmwk3/Aa4MfK4MDBF7zPE+UErHsH7/XgUGt/dgZ/M5ZMQd31JrxdvYa5Rv
	pUB5Ww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg2fvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 21:14:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 569LE72t003021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 21:14:07 GMT
Received: from [10.216.6.66] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 14:14:04 -0700
Message-ID: <f4654034-a94b-473b-907a-2687acf11af4@quicinc.com>
Date: Thu, 10 Jul 2025 02:43:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock
 Gating
To: Avri Altman <Avri.Altman@sandisk.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "ebiggers@google.com"
	<ebiggers@google.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
 <20250708212534.20910-4-quic_nitirawa@quicinc.com>
 <PH7PR16MB6196F9B8C676FA18AAC10F3FE549A@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <PH7PR16MB6196F9B8C676FA18AAC10F3FE549A@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686edba0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=f1mw9qcMm9sB_ICStggA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: JLy08inFUPqbpea98XrFHe8GXDGAlgja
X-Proofpoint-GUID: JLy08inFUPqbpea98XrFHe8GXDGAlgja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE5MCBTYWx0ZWRfX3CWdF+olAPcS
 esI5IR+C/ZhSJFZomrueeqfWaCyxQkuiiRpsbW973hxHakpr4GTTkOtobXFGnqOlsT0zB1uPKjz
 PGz00Tup3C65hkfJNqGE7XNAhJOl5oaQrd9vJliWDG4XrcaqGBjgpkKQ7doS9Cnq7PjTCk77FgY
 LlSUBP0lIWO0hVX6UWWD3B8aZCualBU/9pV+ZZ56iXF5e2MUoXs0hce73f8PdaInp+UKksEbFdB
 6VsIr/Y3LPeqRHeeY9+qEZjS1d9x2klet0lC9s1/o5GUBteQqD0jPeLC1fy8hkY4GgCIdSxwkfx
 GFA3hZA/R08WPbn7vk0+anMSeunlcmd7XjaSK5ifEYOXjgrxe5y6ZUGwH3RIywUHY65eCZXrPgl
 KdVYmdsZ2HA+HZV4q/9PcM9SQ7oFHLwA83myLvvruKoB+eFLzjhMuUQslgVcDANpPbUR4wKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=757 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090190



On 7/9/2025 10:46 AM, Avri Altman wrote:
>> Enable internal clock gating for QUnipro by setting the following attributes to 1
>> during host controller initialization:
>> - DL_VS_CLK_CFG
>> - PA_VS_CLK_CFG_REG
>> - DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN
>>
>> This change is necessary to support the internal clock gating mechanism in
>> Qualcomm UFS host controller. This is power saving feature and hence driver
>> can continue to function correctly despite any error in enabling these feature.
> Does this change offloads clock gating?
> i.e. no need to set UFSHCD_CAP_CLK_GATING ?
No , this change does not offload sw based UFS clock gating. Host 
controller has its own internal clock gating mechanism.
> 
> Thanks,
> Avri


