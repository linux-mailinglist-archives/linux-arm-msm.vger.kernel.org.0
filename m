Return-Path: <linux-arm-msm+bounces-36351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB389B58A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 01:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A445281583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 00:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC55C13C;
	Wed, 30 Oct 2024 00:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gzw2760t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7CD528;
	Wed, 30 Oct 2024 00:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730248349; cv=none; b=F8gmIdg6Jy2/YaYi3EjJC3hmCpv8vrGcFnZW2l1s3B8oX5fS8yzcHhjBrkePK4zCHclBKqrbs534KowupV2eIZ0jmwsJ+nKeRaSf2FvRU4sRrW2ljPnQhTvJQTN42mOuPQoHod8+H1bAFDAHeQrc4qoKcvjoa/haaAZ+2fq1FHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730248349; c=relaxed/simple;
	bh=YpZ2l55qpDmvuz/gK4i9l+zbziSVwmk9ZMzxywuxs/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ohcvygaTK770xU28Ys1jbVVgcIAkH2buVqZhP615lfke93h7VNvTaUEd3IV0btmidWWVlf+6fJlNH93RuFfTv3XCWk+sNVWjIys+Z/Zp/IG0PmItiGa8Czg4HXxTJpP+sLBz7tpU7wye4q6A2xtzSoMzy2rCVJ/PtrjI1t53yIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gzw2760t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAaNKx013129;
	Wed, 30 Oct 2024 00:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZ7pdiwsLIsYp6Y59boCI4YznljjqwjdKMC/IJub73o=; b=Gzw2760tYgrbOzXk
	k4jPXWR+9Yn0rjBHH3B6ip74yAVozAcOIiAWWjn3qgjBjUVJF5eCaVkQfxkLTd90
	KZOiaOkxJZWeUWlSoYLfSTs2ErWZQgX9bDSn1fe3gNRPRaIkizh+51cegK4ahThq
	jwVRNyD82GWLZNr6pDtcaIICTMLp+sc87QgGyv8R39ZwneGee7DFD38P29INF6ki
	/k8Rq8/E/2zWENYYwIZa8zz/RzdO0UKXL9nOTOiPUH7yonLKftRf90yL1bhN2DTq
	s6cG5NKkMHOi/ct2K6Xws9aWkPOxdhNPGuwElUOpULGFI5E0QLnzn48GryCHxj5q
	L0mcKg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe621pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 00:32:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U0WKw0001427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 00:32:20 GMT
Received: from [10.71.115.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 17:32:20 -0700
Message-ID: <934ee86c-2d95-47c6-b507-f9aa277ad0ad@quicinc.com>
Date: Tue, 29 Oct 2024 17:32:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: Make remoteproc name human
 friendly
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241022-rproc-friendly-name-v1-1-350c82b075cb@oss.qualcomm.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241022-rproc-friendly-name-v1-1-350c82b075cb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8bycLzQhYgCBS6BL9Pr2si09lF3v6zTB
X-Proofpoint-ORIG-GUID: 8bycLzQhYgCBS6BL9Pr2si09lF3v6zTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=586 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300002



On 10/21/2024 9:21 PM, Bjorn Andersson wrote:
> The remoteproc "name" property is supposed to present the "human
> readable" name of the remoteproc, while using the device name is
> readable, it's not "friendly".
> 
> Instead, use the "sysmon_name" as the identifier for the remoteproc
> instance. It matches the typical names used when we speak about each
> instance, while still being unique.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

