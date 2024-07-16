Return-Path: <linux-arm-msm+bounces-26270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001593203D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 08:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64C21F21C99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 06:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E042A18046;
	Tue, 16 Jul 2024 06:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aixTbhL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788528F0;
	Tue, 16 Jul 2024 06:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721109635; cv=none; b=fhNfE5cr42FFbKw8MU45iD/IGdFys/j5vCfXBg1ikLm8UQAF8HpcgPzkODiboMiDMi0Eaz+bCfb5DP43CbmECJepWEvd4nIW3Y0f1x8O8aFBNhepaxs3fJOhhX+QhTVyXlj4nNA1Bvsaaes9f/Pq39zUAmuHoEndzG/lq0iZbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721109635; c=relaxed/simple;
	bh=bVWmOQt5IRhL7bGMcdMB579jPvPqGnvyi0ZtDkVa2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PbTmWsXfkfnt4zP0yrNfAw6TJoia+X0P9B0kb7P8m2TV7lc+SkGNDdoie0mHbIbEClN6wRFpNRXQqwICHxcLlHRB3Of2Be78GhpZorhFuJdTZUFzaUpO7xfNG0bHHVKx6ocNfZ/4MnhpA/fPQYSmX33xxoWMIsKRPjHq9OtYgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aixTbhL8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G4WN80032697;
	Tue, 16 Jul 2024 06:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olBB5yu+2VNAMeSTN2w26tSmRGcQEfbCTTMqHY9QVeY=; b=aixTbhL8MMuh+3rS
	2yCF2PPEVZN48dlPez4lEcpycrHjGuw9Oa0DQxXQX2QnvWft6BF4RGJsul1mmbl9
	aIFfoMWkzPjCoPYNDD10WUYm5oOkw8RARu9037zvckAup76VD/unPihWw8Ilpt6f
	LqaVsqf+8Fn9vgf43eQp0zN2F1okQttPSsUFT/p39RwA3hp0pyXUOqBij7/ecbqh
	CgYz2CFHBrCjgn+UZM+Ah11P+5lD8Q3MlFViwsz+R1jOhFaG5l5O+M0eH+H1fexV
	YoU13hH4LExBijGRn2UWGks5DvtXfXoDV0PmyaVw6SBQaqBHZD44CaYvZWkVf0qc
	LRLTpg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhnup54v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 06:00:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46G60Lg4002929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 06:00:21 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 23:00:18 -0700
Message-ID: <c8b0c7ce-f02a-4d38-8473-4c20287ddbcc@quicinc.com>
Date: Tue, 16 Jul 2024 14:00:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Mark APPS and PCIE SMMUs as
 DMA coherent
To: Andrew Halaney <ahalaney@redhat.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240715071649.25738-1-quic_qqzhou@quicinc.com>
 <nulprwjd52j2iq7cpx5nq733cbi6ccdpemq6a7ocglv4ep5jmh@jvs6zof5u535>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <nulprwjd52j2iq7cpx5nq733cbi6ccdpemq6a7ocglv4ep5jmh@jvs6zof5u535>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T7HRDBsksjqYFc6I_3eAWbrOPkZSq4xl
X-Proofpoint-GUID: T7HRDBsksjqYFc6I_3eAWbrOPkZSq4xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=843
 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160044



在 7/16/2024 2:14 AM, Andrew Halaney 写道:
> On Mon, Jul 15, 2024 at 12:46:49PM GMT, Qingqing Zhou wrote:
>> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
>> mark the APPS and PCIE ones as well.
>>
>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> I think this deserves a Fixes tag as well, not treating it as
> dma-coherent is a bug and can lead to difficult to debug errors based on
> a quick search through lkml.
> 
> Thanks,
> Andrew
> 

Andrew, thanks for your review comments, do you mean to add below two lines?
Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")

Thanks,
Qingqing

