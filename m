Return-Path: <linux-arm-msm+bounces-48307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61180A38F25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48578188F049
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3767A1A8F7A;
	Mon, 17 Feb 2025 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pc25FFhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9894E18B495;
	Mon, 17 Feb 2025 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739831755; cv=none; b=i5ghx9FRyKlNs54XJ2Bhrw+OqPJAnbih3AhrjNKjfSWkvua+1/g+q71uVEmp1x3u5eiK+dwSYPF5V2RawkGRKt+AO6/ay1GsErc1v8cjS8G3/8nD4FQSrNorQbMa23nbkvsnrbgNIFaOXJv2SLaAwcKjHEvo+Z6Hlu7agJalDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739831755; c=relaxed/simple;
	bh=qRzmBbeoh6fBnNs0PxjeVx1xqAJf59XWMVhDoYMMtFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFRNF6+G4j5asMLZgt61TQjEGmAtIUynkzfTcxyH94MUvY16YMUyY2ed0wtpIJii+3N2Wes07UFC1VCONHtRlG410Jx+l6ZfmVjoJotfo+fKoPnqyUHAW1+GhXCQE9trS2Gfv6/pxDLzMrKOiyS6+j6rt2inJ52TlMVmJkRWjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pc25FFhi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAgoRJ025635;
	Mon, 17 Feb 2025 22:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K1agHqlaztfM5It1la4dfVloICWgV+BOwAIoXuNymAQ=; b=pc25FFhipRMQN6O/
	AHl5MsMcVvWg1IVugegUb5cwziAwwe/tFjSyaa6Vxqvyb77vUJlW2xwy+6JSZYmn
	RbBuUxOnR3UPaxDwfSYnw4aaxenVDfdjdnd5zYlTiy1TMRHpzZtg68wM/qKdhG6y
	YOfu1vkjlczrd3SjmJ+raNBULrinMI4IoUZVt0vjHm/0HJ2rmJUbg0bwSvoKcH4W
	9cXSZOruZDdhlyjQirF8x9f6Xi6iEHVmA62cBEbQ5kMR+uQ3EyWNwbxyqWRqZ0sE
	2v0jLo2TYTY+7ZOCSsZqd026F10LDaGH/wpq/P/0eDkPnw+k4gHIQAxmiVuMTMjI
	ahYRtA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vty6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:35:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMZkdW016944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:35:46 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:35:45 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH] drm/msm/dpu: Disable dither in phys encoder cleanup
Date: Mon, 17 Feb 2025 14:35:36 -0800
Message-ID: <173983156145.1711393.9709645159653179226.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
References: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
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
X-Proofpoint-GUID: eQyEEXLI3z00TMVmg1V2ohtRzmnGXA5J
X-Proofpoint-ORIG-GUID: eQyEEXLI3z00TMVmg1V2ohtRzmnGXA5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=588
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170174


On Tue, 11 Feb 2025 19:59:19 -0800, Jessica Zhang wrote:
> Disable pingpong dither in dpu_encoder_helper_phys_cleanup().
> 
> This avoids the issue where an encoder unknowingly uses dither after
> reserving a pingpong block that was previously bound to an encoder that
> had enabled dither.
> 
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Disable dither in phys encoder cleanup
      https://gitlab.freedesktop.org/drm/msm/-/commit/f063ac6b55df

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

