Return-Path: <linux-arm-msm+bounces-1397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054797F35E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 19:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35DB01C208CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 18:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0953D487BC;
	Tue, 21 Nov 2023 18:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RRpmmxdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7120D12E;
	Tue, 21 Nov 2023 10:29:37 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALGv1Tp013725;
	Tue, 21 Nov 2023 18:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vG3SezDCYdIrXFGfXmFE+x/MXOvguDKneXltb/Dvw+g=;
 b=RRpmmxdFIfyV8sEAJLOrFChD0W4qpxdp0YQuaDTMrpROjnu6DWwRFWx0BJyOEENoorDs
 45orMk4v8ae88bK34aGrDpcTV6UyvoBjXC8MQTI/EJ1dzroMG2o5TNG7NU8+CC0OEeI5
 8gAoLlZ0FnP76FIe97fvsu2a1PCilwakZKSGjVgns3pyuQjtPshKnwYKziahtXfpQLxm
 7vq9U183wbKN4AMxs6G6lVUyuZcUxCeTQAhvYZna8xUu0/QsJjwwWDYYZdd6SmN4lsXB
 oBJUzKufaNtRIhxWBRSuK2zHKsUTw0pXz3ZsnPeH5QIaannocI7cI/xxJNNlU5FB8mZe wA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugu549g21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 18:29:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALITPEY021725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 18:29:25 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:29:25 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Konrad
 Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Robert
 Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy
Date: Tue, 21 Nov 2023 10:29:03 -0800
Message-ID: <170059072153.29644.6387537767336695325.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110000216.29979-1-jonathan@marek.ca>
References: <20231110000216.29979-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PvQBdut0lXxlf4nWVQaud8WOdkgd3nJl
X-Proofpoint-ORIG-GUID: PvQBdut0lXxlf4nWVQaud8WOdkgd3nJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=379 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210144


On Thu, 09 Nov 2023 19:02:14 -0500, Jonathan Marek wrote:
> Use the same value as the downstream driver. This change is needed for CPHY
> mode to work correctly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy
      https://gitlab.freedesktop.org/drm/msm/-/commit/b3e0f94d1570

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

