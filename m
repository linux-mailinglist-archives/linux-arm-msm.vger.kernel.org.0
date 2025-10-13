Return-Path: <linux-arm-msm+bounces-76989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A0BD2A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D57189A988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820CD30498D;
	Mon, 13 Oct 2025 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="acWk3rLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C930496A;
	Mon, 13 Oct 2025 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352529; cv=none; b=SR0Gw0tStj4xG6wdfkPuyagmhVuy/vtJWS4e6cqZEKEAoDFcBAZJVUgbO1o6Ip+dfuEhtVtLRihKVTGSwJOXHZvCIXGz496zIq3XdB5XEcaXFBin+8icXbj+sddDjvH31wzQvPzCKDFtrWug2s66sSxzFRap10WC5nyPBvsB15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352529; c=relaxed/simple;
	bh=VwhYX+6xv7jWtUkvsT0hoy1xOnkh3wLDAgl3UvqsBtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=mo4ildFNWFmKwW6Ot5skGSFKyR8W1NPCeAkza/x7l8WyFMsE5HfftrsUQsJR9/M1bz7ufnp5oyl1S9al4LLAELRTNcxz8agOr0BSp1ZxcLApCfy0QBWqZaoqMNrWCiFg7H9puh/6Xi/SAI24xxp6YyKLz+FNSh0ylFQuqnBjcEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=acWk3rLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7QtD2013172;
	Mon, 13 Oct 2025 10:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=1L5P54TbkrmzP9R+taDQQgxfP5BKunkmfWNBPJgNIT8=; b=ac
	Wk3rLRhGCyA20fcguXZAkYgmed26bSnM+1UX2I2VMY+FbjN4tSVQ1bmFxkut/dh7
	IF9t0FmedhjbmZaoAShIHljoxrwE59VVCf6an+MH7pHHty80+WkCYhFdP4yyTYlf
	rzDLbkGAiZhndS1KzRjD9HKC4zKn8OYMMPDPK5x5vbAEWMXi4dSTJXE5fw4Lvip+
	TNIeNRVGYtD83hY0cV8OzeYxgCYoW0594YMdLBqd28TeC+fEVDrTqAT4woMlxNK/
	wDvZyK/k1pVNgwzHo6osYcH3h1Z8Wl+gJWVJldjkz2IY2kGH1Z1sqtZRbGlF420I
	ps3q4zIOxY9YL/HjdjBQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1a8ktg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 10:48:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAmAeN008953;
	Mon, 13 Oct 2025 10:48:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49qgakrrqu-1;
	Mon, 13 Oct 2025 10:48:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DAmAT6008934;
	Mon, 13 Oct 2025 10:48:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com [10.147.241.247])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 59DAm9rM008926;
	Mon, 13 Oct 2025 10:48:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
	id 06B685015A2; Mon, 13 Oct 2025 16:18:09 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: [PATCH v2 2/3] dt-bindings: display/msm: qcom,sa8775p-mdss: update edp phy example
Date: Mon, 13 Oct 2025 16:18:05 +0530
Message-Id: <20251013104806.6599-3-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251013104806.6599-1-quic_riteshk@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ecd8ef cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=OeHa9qK-VhRcXjMeMoEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: -H6F6hoADkz3ekCqXDBCKJ7F__f7MZy6
X-Proofpoint-ORIG-GUID: -H6F6hoADkz3ekCqXDBCKJ7F__f7MZy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX8Je60umfCz1/
 AWrx3nQ8e6FK27adx0oP7FN/V9zQq3FeAyIq4fn5IBzE7YZmv4ITG1mbYLCdIYgwgljRAqiN53q
 HutVPGRWc2cY1bzm/+mBE7G5eJIK1R+DT+XItsH18AS8mwFWtnp3DiDlG9D3K4d7oKdhg0aSjRc
 EBK+HfDGBoePvAazAds4Md4sx7Bo6PdbatM6bjY2fgfGmEPblwbV73y+W5YAqaqOvVpxd2Pyuie
 2rIYAK0LOjBQneoo+O45hEaKKmP6XbrY1slKFyQZ0vSZXiEtX7c/vWByBgC2bmTlf6maOFISM8l
 P8JeRPaH+5oOEsJt+ILpsyZLmgbua7M5Dg2KrSsR4NrT08aiWAsJ/9g93rQILtLjmpI3x229N1/
 LrTKyBTPdGMpBmdHJ7oAhb1PDdaaWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Update clock entry in edp phy example node to add support for edp
reference clock.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index e2730a2f25cf..16bb3f7043c8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -200,9 +200,11 @@ examples:
                   <0x0aec2000 0x1c8>;
 
             clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_EDP_REF_CLKREF_EN>;
             clock-names = "aux",
-                          "cfg_ahb";
+                          "cfg_ahb",
+                          "ref";
 
             #clock-cells = <1>;
             #phy-cells = <0>;
-- 
2.17.1


