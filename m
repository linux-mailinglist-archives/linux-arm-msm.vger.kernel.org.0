Return-Path: <linux-arm-msm+bounces-33158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355B5991183
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EC5F1C2221F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDFA1411DE;
	Fri,  4 Oct 2024 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JU/awhzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686C231CB1;
	Fri,  4 Oct 2024 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078019; cv=none; b=nP5R+HnVqcEk16aaBNUBSXFZIzB5rEuqkAVGAMnxH6AKb/WUXY7UMiUPtKgdMsUMC/vHX4JmnwLeKSEaRWaEL7iRZA8GOYOj6vZMaeeN/rtdISUuayWejtJj3saBg5zQOeINZjAjxWX/cm2MtaLFzfkCaedFBFev/keoOPNJyVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078019; c=relaxed/simple;
	bh=JOl/MNmZSJ67n7It5Xw1wfunsJqzofFETO4zf4slRE8=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5hs0LOp65CCJ8tApAQWSH/5nxi3lJbuKhjdCB+BMbZ3u9grckdUxQ8Z3DyMvdDwe6DujWcuUgcjkmUjRmoWVn5gNwTanYS/xABeUc2z1o8lO+VUcW1Q21hMrcBPYw5gUQfLm6THR4x6aHIptr16LF5AOhwnwKDl+ZzXdbDAuXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JU/awhzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AXrWb025676;
	Fri, 4 Oct 2024 21:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=JOl/MNmZSJ67n7It5Xw1wfunsJqzofFETO4zf4slRE8=; b=JU
	/awhzYIU2963RaeQWpT416xSdXR8fTD2TPlmkZBnx6lNtMveAhyevj5jtE5JGft4
	m6ToYELQuYAE3q+r/oqIeirMpgCvl+tMNmPKep2ZSw7ZND/2vBRIYN8kFs+6Xf/o
	+snNn8hc5aFuUpY2rilmy4kmu1cZ/oD1egElJeTkAvva73/kG3HkhMA4YNGWWg5e
	TTOBYK3wAwTCYAMkKTxjnPEl9dmM9j4QzBbhKzMXsANJrmqHh9KmDuzHugEUMTe4
	oYypIew/tqasXVjN7geDz99kQOKJUN0SqJD+lGYQ0j5TW2iGnFmjm2k/fGQS3UvH
	mVDmr3vgV29Sj5OBmW3w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kkagg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:40:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LeEbO018432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:40:14 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:40:10 -0700
Date: Sat, 5 Oct 2024 03:10:07 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] Peripheral Image Loader support for Qualcomm SoCs
Message-ID: <ZwBgt+9pAyHGDFOI@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mGVC_yWuGGvKU5FHqR3gW17wNMJKnDfy
X-Proofpoint-GUID: mGVC_yWuGGvKU5FHqR3gW17wNMJKnDfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=533
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040150

Subject got wrapped and later part got ignored,
Quoting it again here for reference.

"Peripheral Image Loader support for Qualcomm SoCs on KVM host system"

-Mukesh


