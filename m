Return-Path: <linux-arm-msm+bounces-16593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C040789A4F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 21:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F163E1C20C1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 19:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8719B172BC6;
	Fri,  5 Apr 2024 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="afatC+Z0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36753171E5C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 19:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712345392; cv=none; b=JPWcVs8HdlWddTI+YSZoK6m7ONTyJm0oQTJIqw7vhD3nFkLS/p90HvdBavesaEbyjSvQ/fChFrOO72cgk4l9uhlJuI9CheAhhLDU8Zhj1BJ5F7lQAKFTyU2dK0Epci+WAb914Heqib5tPhwYMHCzC0uyEALPm5RwoGJYLugNHVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712345392; c=relaxed/simple;
	bh=GxroRTK8h/32FDygdWzKkF0tFQ3oJbAlN59AAUMf/7M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chxIECplE4v8Po6GdT9z93CKN/e5gWXTMSjVE2Ec5xjBsmyY2tlyQvwfJ+h00jecShhBuCvIbr4R2oXVjJu6jCU/OVk1fFEDQYMbf6lmsHtci/q0LcLoQwUoEbu+7WJBA8r675Z31Ykp54hjz9vG7bFuQRh3eHp/k6E0XhAs850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=afatC+Z0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435IVNEi025091;
	Fri, 5 Apr 2024 19:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=kDu2jRKSBZIpMOnYiWVt7olgV/KcGrl0XbnlFnnMBxU=; b=af
	atC+Z0b9so0hPsO/VanAcEsSYmWjsrAFibbizgUXY90GfLkHM0PEaTIajTuS0sHu
	gnW2jipez7tK7MK1Zf7D5RfuM7vGdXHuvqD0suELUOnJqYEr+oYr88RxYY/kkhWN
	ntU89Y+7vdAIsw/ipB7Zg7GphLoqi7h91mlaqRviUmE4sWS5a92oxH+TCMMxJjf8
	YppgnFvZmLT5THDTCrUBVmJsnKITj6iRcL6XtX7nXrhy7Ki7qb+jH4myDh2vhKGm
	zZ9UXkjKZF8fDmAE5AHELdoWZsIgb+CVfL/uoIcTpO8tKJseWy1T3hq8hfXPy5UD
	XiVbL0EL7NE6NnCFwxLQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xafpks63r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 19:29:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435JTdId030879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 19:29:39 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:29:38 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm/dpu: make error messages at dpu_core_irq_register_callback() more sensible
Date: Fri, 5 Apr 2024 12:29:29 -0700
Message-ID: <171234532411.1203.16442584142477005862.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
References: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OPb-yyIDrY99GV8843RgniL46a_tAxy1
X-Proofpoint-ORIG-GUID: OPb-yyIDrY99GV8843RgniL46a_tAxy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=748 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050138


On Sat, 30 Mar 2024 05:53:22 +0200, Dmitry Baryshkov wrote:
> There is little point in using %ps to print a value known to be NULL. On
> the other hand it makes sense to print the callback symbol in the
> 'invalid IRQ' message. Correct those two error messages to make more
> sense.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: make error messages at dpu_core_irq_register_callback() more sensible
      https://gitlab.freedesktop.org/drm/msm/-/commit/8844f467d6a5

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

