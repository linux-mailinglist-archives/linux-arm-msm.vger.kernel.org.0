Return-Path: <linux-arm-msm+bounces-102488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIHzCN+Z12kUQQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:21:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A11283CA563
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BAFF30073E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C153B0AFC;
	Thu,  9 Apr 2026 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z82JrVhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29E379ED7;
	Thu,  9 Apr 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737283; cv=none; b=M/G/z/wsWJoUhXWQ+4NN9OOB9ZfeEe+dsucRQZ0fQq4t5UFqWkZN3AV+j7ol6BtoUqzp0Z6hXWCWwb9mWFEfs77m7RZ9FAen6+IYeS0f2UmSXvoeL/WCm7LEeGMEeTPsBmVbOCSj1XbmRck+8ESmnWVHIcAfEmPXGvHa++q5o04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737283; c=relaxed/simple;
	bh=rgtUB1c5aNLZHE/IkBoX6IeByjxo/MzCTwq4f/gSu1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JezCmLF8LGSOTmL1phrBLDPV2lz8pSKafuIUxgjlQcNeYoAIkdAuyBCUQtHw36VycSZWykY6segKGLKYVYWnkCTZdd94MV+H3AQdTMniy9WfF2tv8BGrXjEaFhMib5EAsJ1L4tNgQkpiHB5CGb7OYP79XdFJJXRNiGK0uQv9UcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z82JrVhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639B4Cs12615182;
	Thu, 9 Apr 2026 12:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iRJojx90PbsK5eqwfGxXr5Q9vwOQMRc8Moo
	WzOIPrKU=; b=Z82JrVhH+IbCyM8WalLWIPT+Ncz0aiQV4Qh+tLKTFv5VY96Ykfu
	zv0/L9yRU5eiEZRnSgIp0O9YCfwSKJRAd4AVZpnHScniP69N3cdzxhm6K+L0iUAr
	n8wbE75FB7heo0PRHJ3h6kobJLOBg8obJlZkVtJp0dYHc1x3KroRKfSpTYPJtYZ4
	O9AgwK6A8zMv6Ft5Nz81YdUgO52HDyUbHXrO1eJX2MIUVNh3fgqV3j9suglBVAZ8
	gQbWzwiGR+FM9bnoBq8E8RUIa0B7Uo8Cxqz4oPe5vmDbX3cmDdxYQkEXCwgd1Xw/
	vVunt+guE1+cskVr1NEEeUGguxtp2X587gA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28v1h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 12:21:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 639CLCBl031231;
	Thu, 9 Apr 2026 12:21:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4db3u1y6cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 12:21:12 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 639CLCXh031225;
	Thu, 9 Apr 2026 12:21:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 639CLCIx031224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 12:21:12 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id D56AC5F3; Thu,  9 Apr 2026 17:51:11 +0530 (+0530)
From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for panel nt37801
Date: Thu,  9 Apr 2026 17:51:09 +0530
Message-Id: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: OXF4xuTpOgYJfK6NUmxtmVEnGPcIUQVo
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d799bc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=LDVbE-baonJtzDLOTeQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExMSBTYWx0ZWRfXwjBS59UIkWK8
 UklVZqTbftY22EAQqx3U/Q4h8D9ivNaIPqCGIiOnsqTZe7BH/6wF3NFLwjkWt0VJA5j3sv8AK6X
 Ww2KueZ115uaDTPTF0IuKhfODH65FNf3o+czc0+1aHmgjOJM5YdVcWkSJZ7OKYf9/LaMeJ44qgH
 iD/ilDkAVQVFzetNdDRsvECB5kMn87jXjlLJID5TQOlzx6S1a8NGkbhc+F5JAhXT9NXJaDh5VTa
 9NTNdOYsH1bxQiNrCASu2i5oyYGQXjeLiu6C2O26cEw7MBvDWhnK0Jh66A/CLABZEM0to5YhV83
 GzCx7H8kOMg84xfXja9D1s1vQbN1fhcj+b1cyYj1ti9SHVdljGlsCJBOfPmJwEreytY+med5Zkl
 aTruR+oMySSRmv/CHnk/6BbkYO8rcoWp4UOh5z+exzyH4883Cu1Ze0hIfQKMXIif/jSHzTnAoTI
 RCgovTYd0lZu/EOSayQ==
X-Proofpoint-GUID: OXF4xuTpOgYJfK6NUmxtmVEnGPcIUQVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090111
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102488-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayushi.makhija@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A11283CA563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..6ba4e69bf377 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
-- 
2.34.1


