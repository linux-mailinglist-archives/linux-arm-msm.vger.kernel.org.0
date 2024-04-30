Return-Path: <linux-arm-msm+bounces-18948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015B8B7716
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 15:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718B41C222B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 13:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9DB171676;
	Tue, 30 Apr 2024 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nqXVoIBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD64171640
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714483818; cv=none; b=UTeyQIblPvZISC09Ou2bO6w8DvMT7OkvIBSdXHMYGUm5+rmgtGo0ShZsAcLvkY9Pe0l019epNrm5fTejuD6pskM6lzsr4UlYJVhtR+tgGT/rBv2BERdx+uvmLpCr5UpT4Pd8aswjGppM+VAJCNydkB+fNhbbWLi10acifZZ6Pa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714483818; c=relaxed/simple;
	bh=jlydjqBi35a3hABy/KrwYY1HopWVDMfRB2O/6Edh1Jw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/i6w1e7VcRobpoasDsYoQeEUWZomxPGjo83+egqQ7a1ZqEHw44ygjWgl7fgbjyeO+dK52LQaF7VKkcdVw5ZxpbmKsSbZuFysD7M3S0H0aM8A0mvOnW5Wg6k40n7yYN1lU7bHvJ2LVMfPMbeL89gXMJ//YjmvBi3dHguafNgnFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nqXVoIBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7dmdc008740;
	Tue, 30 Apr 2024 13:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=fidFUpi4cf1KrWX5YDpHz
	qgwyAXuG9D68KTSu4/w83A=; b=nqXVoIBeWCiDikSTdgAvmg2G0JcW8d46f50Ge
	0N0mvDAP+nqmqRAQ4ZJnh4V9RtftHJOCzjaNhvK40feRfETu9qZLFkoxrnYLn9a5
	+/yfa8kK7kGguYypleeCfIKHlUyyPM6YeFyuPPkJAUqv+DFK5xNwEuNXDoB44JfI
	iPwP4bdrFbHTwKr3rll4GsyKcdJiiJ8r73GLjUo2ZpChcmW/w9789Z3iIlyl6u16
	SD+yAeL00f6wV1dOEWq//tQtyGsiwx4IMtC7EKYW6NNOJIy3rFyxJykq58UkFI7A
	5Q4HGOq9uYhI5npXPyrAvE9BCHb7Kb5WmIqjbLa4qJCnFDIFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtfys3k8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UDU2M2015731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:02 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 06:30:02 -0700
Date: Tue, 30 Apr 2024 06:30:00 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <alsa-devel@alsa-project.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-ID: <ZjDyWFlx2cjfi1MJ@hu-bjorande-lv.qualcomm.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: afi6XheETSfeGAAApO7hcgPeQFaILgSO
X-Proofpoint-ORIG-GUID: afi6XheETSfeGAAApO7hcgPeQFaILgSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_07,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300096

On Tue, Apr 30, 2024 at 02:00:58PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> This is part of a tree-wide series. The rest of the patches can be found here
> (some parts may still be WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, I audit them before sending. This is why I
> will send series step by step. Build bot is happy with these patches, though.
> No functional changes intended.
> 

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> Wolfram Sang (3):
>   slimbus: messaging: use 'time_left' variable with
>     wait_for_completion_timeout()
>   slimbus: qcom-ctrl: use 'time_left' variable with
>     wait_for_completion_timeout()
>   slimbus: qcom-ngd-ctrl: use 'time_left' variable with
>     wait_for_completion_timeout()
> 
>  drivers/slimbus/messaging.c     |  9 +++++----
>  drivers/slimbus/qcom-ctrl.c     |  7 ++++---
>  drivers/slimbus/qcom-ngd-ctrl.c | 29 ++++++++++++++++-------------
>  3 files changed, 25 insertions(+), 20 deletions(-)
> 
> -- 
> 2.43.0
> 

