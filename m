Return-Path: <linux-arm-msm+bounces-70879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E03B35A74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DBF31B62178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958BC321420;
	Tue, 26 Aug 2025 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AEeClzP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795F301486;
	Tue, 26 Aug 2025 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205638; cv=none; b=iFXkeEBrArOgNgOYo4GB1iSe4CfoBz+IqaILTx4sQD8+1eHWZ6xdWAAsYvxHenAE8OQdzEiuH1jvBOJUikfFxk2oDHTckJQqfVcsHHIsDOjSxh2rULJSUS1ynjFwvlykzwtiK2szP/10NaT7kBaGmARs0tcqM+x/HFTMcXmNgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205638; c=relaxed/simple;
	bh=jVjyHzHZyNGXEvhdRTrU+nCu2u4nZzxXGN7Twr7z52Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TLXIrVUKp+BenGyyd+21shxAEcA04y96qAAF6b2dKRMK2s7yv6QgtihJFCeAMY0OEw2rJRCpbI1TLetwbAuyuv4PpcdNhd5KO7dDz4QS5BTkY1Bj2GkfE1hg1qSt79YLLToWQrhgsFxyUi2jDRDGaXxW3sNOsM0WaDmNryH5F2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AEeClzP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q3NvCi007563;
	Tue, 26 Aug 2025 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUfWlbt6ZoojGa9BRgsOhqblnhkLPGS5L6sEbwkYO0E=; b=AEeClzP4W1kLAOv5
	Qm7h8Efg3emgQUucTJIMzKxTpkfUw9AFUsYjUrJMnIuCB2ChyDGLOIRoMPeR/JGY
	jfseo7ZIiKSlB/XxY5YJwrIFILQUic6N76uOvQ/eilhIjaWSDOQErRc6SXvOVqtw
	wjXSEXwxLj7PBMDD0bXGHS0R7TxoUxkMQeFesQfHRIw9i8v76XOwsLdfotoNBe1k
	d+lJ7l10+kNhyDXYZfVKXNFYKXUYcQoiEd53N5a7Iuheybj3PUEblpG7Yh7j8lgg
	IOo7zCQs2X7AEyW5PfPkgiiYA6ODHfSv+rDbO4ZrtfYKcEGl4AaGJTpSo0eR1W7v
	s6pXOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x88hyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:53:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QArreU016950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:53:53 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 03:53:51 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 26 Aug 2025 16:23:39 +0530
Subject: [PATCH v9 2/2] arm64: dts: qcom: qcs615-ride: enable venus node to
 initialize video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250826-enable-venus-for-sm6150-v9-2-486d167639a1@quicinc.com>
References: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
In-Reply-To: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756205625; l=797;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=jVjyHzHZyNGXEvhdRTrU+nCu2u4nZzxXGN7Twr7z52Y=;
 b=5bl9rYshp5WIDN3IL26hOQEz+qBkmlIZDjriL075h6rHQ9hJqPlGDIZ7FtKQh9E32OpWi74ph
 W4afDwd4cyzBd9+Z7016gRtFTlxZ0PoGYDXjFdPbX5CaF45/YytiOtJ
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XrIiGJ6X8lMuhUHWsxPgOgEB30m0S4II
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX4UWv04Ela/Ci
 A/Bk4RCh+fRCdnEUmqnAV3cSIUk7RVtVLozasPVZxwu2GE+mcPPvgjUN7WwFPh9Cebf1j/pXKDR
 0bOuwti4E0banOsJbg+SVXKoYey8+ArxFBhZkWF7eNtkzXt9EtfH+x6qb06j0LQ3ZWgS+kqtPD1
 Y+kKOE0fjZsXq1ra+tpolWA7I8DSYhNcHm0VDoeRXcXlQyK7H+SJn+2Dh8Bk5Xtj5Ibg7pHaI3V
 UB0atszPiT7Z6F8/h7VKGB9D6RuXhvLQM/LT9bRGBvAGaOfBevLkIxwS6Pp+a9ag6ow2HVvppZ+
 DLH7ietsTpuEidj1XzmqgV919l8OXYQo/S+/HRlg5PNY8vOhF3ckCdsmpw9gtcf5k/hepuF5n+S
 2snrBAGG
X-Proofpoint-GUID: XrIiGJ6X8lMuhUHWsxPgOgEB30m0S4II
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ad9242 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1tseWai4MNHguRGVtBsA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

Enable the venus node to allow the video codec to start working properly
by setting its status to "okay".

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index e663343df75d59481786192cde647017a83c4191..705ea71b07a10aea82b5789e8ab9f757683f678a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -513,3 +513,7 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};

-- 
2.34.1


