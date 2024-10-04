Return-Path: <linux-arm-msm+bounces-33159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A99911D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D54FB2410C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7AA1B4F1E;
	Fri,  4 Oct 2024 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I5PVdvEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84B1B4F0C;
	Fri,  4 Oct 2024 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078589; cv=none; b=I+46f/ZizESPAOtWgc4zaoGjFTDd3OzABOezXRWzXbdsicsKuwTVC7NW1ourp3mq9vvLZgvX3BOI+ll1By7u2KKoMNtKJrQsPZtbhRlbMhiH7NFQ1F1OKbaLQotC6w1PPRbQA/PSS3TLiH5LpDEoP+DfbJV2sdfnDtlmhSgAjFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078589; c=relaxed/simple;
	bh=NxOsJ/X5q0lVn9sCM1rgeACGs0mI3BWueRHlnan+DQU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPsAJaSXsQChh0stB0mrks1chZZ+LgSnV5bKAIzkxBGdHVhY9z+PlbwZILR8PyzDw32vETCb5//Z6qSbMtiKBhGdxhkMJKrbm0KQYgip/+yqXWUCGm30mexkN0fmOmZmxtxkjV636JbbxWVHesMmmWgBrlo7NLncMglf2kXGWX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I5PVdvEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494ARDrP026173;
	Fri, 4 Oct 2024 21:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lq7rT5ZzUap4bwlLN5DsOLz6
	nWrU1nW508fbolR4VYc=; b=I5PVdvEzSaxuANLNECXWyaCaugekttkQPnttD+ge
	APtlXzsmAewAkoo1Hnc+m3cVgtwh2loY/yaKZY3zutjTAgNoGQH5YWd7XaSPUOBl
	0JmtPZ9oXhFaknu+UXMAxeixM5d9xtjpf7uP6erlaxVymW4QImZmpVsZAhFyUPix
	De9crbVtkNx1bk/hVsRChZ+IR0Z1g5LfNdBDkyNTFBAPlsasLk4xTPd5S3b4XJZZ
	gQ3t6wTU9VJ93rVgUFuoOQiFOBcMqXerndEulAKueIR7Sf9anX2r/C9D+PPe3RWb
	VERPf+TUJScYpIYRwZy+R/m4Alq+rrYw7qeh5x6qGT1SnA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kkax4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:49:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494Lnj61029980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:49:45 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:49:42 -0700
Date: Sat, 5 Oct 2024 03:19:38 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Johan Hovold <johan+linaro@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: suppress download mode error
Message-ID: <ZwBi8mMNciskT5Il@hu-mojha-hyd.qualcomm.com>
References: <20241002100122.18809-1-johan+linaro@kernel.org>
 <20241002100122.18809-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241002100122.18809-2-johan+linaro@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BrlAznQaiVf3Guj9zusVitW1bAIcdB0B
X-Proofpoint-GUID: BrlAznQaiVf3Guj9zusVitW1bAIcdB0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=949
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040151

On Wed, Oct 02, 2024 at 12:01:21PM +0200, Johan Hovold wrote:
> Stop spamming the logs with errors about missing mechanism for setting
> the so called download (or dump) mode for users that have not requested
> that feature to be enabled in the first place.
> 
> This avoids the follow error being logged on boot as well as on
> shutdown when the feature it not available and download mode has not
> been enabled on the kernel command line:
> 
> 	qcom_scm firmware:scm: No available mechanism for setting download mode
> 
> Fixes: 79cb2cb8d89b ("firmware: qcom: scm: Disable SDI and write no dump to dump mode")
> Fixes: 781d32d1c970 ("firmware: qcom_scm: Clear download bit during reboot")
> Cc: Mukesh Ojha <quic_mojha@quicinc.com>
> Cc: stable@vger.kernel.org	# 6.4
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh


