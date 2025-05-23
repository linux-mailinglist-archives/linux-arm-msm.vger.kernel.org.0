Return-Path: <linux-arm-msm+bounces-59255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF05AC29B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7477DA449E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AB6299ABA;
	Fri, 23 May 2025 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pYPpU0Pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA3125B2;
	Fri, 23 May 2025 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024868; cv=none; b=q1WDojPWhCWMB+RG3yPlkqIwhW6lUXvxiM+pDO4fJ9vTt5SWr0uC6CaQqETnfpNdxlO39p3tR62kKsGIdhnKD7FQg+TCSdEes0OHvPmxoiPeyxZNFwQf5XSzxBNJaWIwd24KEE8kUhmyEvEwQlzfxK122DAg61ry+q9fvyl1qKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024868; c=relaxed/simple;
	bh=30AH6aa9Pd0Fp1Z5w18oNeDhAEk0pfFiANzAO7ruMfw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To; b=ajdbiv3M9hc6kumg0gIkaPBJArYuYQNacedfb27SAiQ06zczM7Hkj86dhlgmmn5JBLIYpJrML9cKH98gMhr0dXFpeEtZx8HY+DvfPxzolC/z0aqSmVx4nfH12H19PgCtl5CK6iWPV37c2j7pOhKDAreCSEKALtJ1qr16TDkR2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pYPpU0Pr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N9UmKF031677;
	Fri, 23 May 2025 18:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PegFuGzjYtilqND1DE756M
	csROwC8V18+e+ijhhNTkQ=; b=pYPpU0Pr29qeCnAb+rAh0UQv6vgxAcPmEI7EoK
	1MpfJ3vvhegcE8e2PlT3K2XSV2IiRs8cs4qjaqQh2YP+zWZRcyKf0iujzM0z/dXk
	dV/CMHbfvwd6XjNmI0RFvzd+8a/Crn/ok+101wif7fB47cmdZY21LpZsQHBUNPoG
	4Hoo50r1BhXXaQtfw1t+nwHpI587eJLRmVioDjJyZhGCJgF4yPt2sMxXwAPWgoWL
	JFXgOxm9AExKUmSkqEaz77eEhTIzYhAz5KnQa7r+xmKvwnc9oHsixC7lofemd7nW
	NxMoHcMoa+IopeuLPfDiagZHe5b9qvytGOhxptbhPVNp0mTA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c29j91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:27:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54NIRbKV019483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:27:37 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 11:27:36 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] MAINTAINERS: update my email address and drop myself
 as maintainer
Date: Fri, 23 May 2025 11:27:25 -0700
Message-ID: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2+MGgC/x2MQQqAIBAAvyJ7TjDNiL4SEdJutYcs1CKQ/p50m
 MMcZjJECkwRepEh0M2RD1+krgTMm/MrScbioJW2ymojd8c+FSjE6TrRJZKdQZzbzqKhBkp4Blr
 4+afD+L4fuFB3mGQAAAA=
X-Change-ID: 20250523-maintainers_update-83ddc685d3e4
To: <linux-kernel@vger.kernel.org>, <jessica.zhang@oss.qualcomm.com>,
        <lumag@kernel.org>, <robdclark@gmail.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748024856; l=886;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=30AH6aa9Pd0Fp1Z5w18oNeDhAEk0pfFiANzAO7ruMfw=;
 b=uvEfWg8KzHavqrjMVsT40l4W/OvGRtKLTMZosrjRUNajh2+HhkITyxIL6As+8GExqZ+NPyLdP
 fow+a8xi/o4BlRfiWNLay/17YXLFuezLlUJ0nEPdpgEvkv6UFugLT4l
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NiBTYWx0ZWRfXyH+p/ngLUBtD
 d9NsL1WAgfmbZh3WiHMpUhhSiKvYTCL91hP1lTBunnokRKSaGlfXw2iQkZzUozNavwV2H3NNElZ
 eDtnzC6P0op8J+i4Xa+vZUJtQzMYE89t6oAQit5KBoBcpO60z29nCWcwN1f14/L76WVXZC1rfcS
 RyrXZ0l2iNqK48/+ZSGh3T6uKyLWMkQ4NANUSTLqBOu6Y2O/3J50AMYYdniJQD5wP+Lqld4lgQo
 nMm8Ek2ju6dnXDH+ppJ0eVrJu4Yyv8BPmMaQPwlp62WhGO5xFlQlFqOt3yQadHNLHR/oCGysMSC
 z6CNySNm1RQbaYnUeWf80x1yYgSKPZWyHcVZp1aiufOyJ8cczkitRMcH38njK8ab3AMFebfya5g
 +EjQCx38RhdpnQcMK4IFkboi0o41+UdW+B66YJlnYhHIpaqL84TXDazzEHOCfkB8pHME4IAF
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=6830be1a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=mwqmRA_uxUo_KhVP:21 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=asXNODJR16N-1x4L-tcA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mbm0Gw7Ytf9e93koiZ7c1hRP20HAB9Ll
X-Proofpoint-GUID: Mbm0Gw7Ytf9e93koiZ7c1hRP20HAB9Ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=678 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230166

I will no longer be active in this subsystem and hence would drop
myself as maintainer. To help with the code reviews, add Jessica to
the list of MSM DRM reviewers.

Also, update my email to use the linux.dev email address.

Cc: linux-kernel@vger.kernel.org
Cc: jessica.zhang@oss.qualcomm.com
Cc: lumag@kernel.org
Cc: robdclark@gmail.com
Cc: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav Kumar (2):
      MAINTAINERS: drop myself as maintainer
      MAINTAINERS: update my email address

 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250523-maintainers_update-83ddc685d3e4

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>


