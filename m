Return-Path: <linux-arm-msm+bounces-93467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJYhCJMjmGlNBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:04:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B78E4166007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722813051291
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C065C31AA92;
	Fri, 20 Feb 2026 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSJz8RTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsZCfrVP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22C313545
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578186; cv=none; b=YFV6eEYC6Z/ChkXxCAH1iJJpDqcB0kdeQlIFssc65i20P2Nghrh8oE1y5/SiuSI9dBEPf/Mu35oqoCvbUusSDF/bXyvOnl3kxfgmwoBdKZGecXLvsgOYtpQnBxXiY850SelkcmY8qOPlL0WQpX4uRLkhwsDQvV4zcVXaIyJuOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578186; c=relaxed/simple;
	bh=ogQJTuWLMLN4UCCaH2Bg2sfc2PYfkJtCqCGSgU+0WBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ngg3205h8+qwCQ0FSqef7LD0kIriDLegS2sN24YV9NhX+OqagMp38jEOJ57pxEDGQQ32nkve1Tnpdz8ENdjQ7rmHNVLz24LuRmj1ALPzq3npryONk+RSjCckhhboAW/tpoNmCkcW/rng8eEi9XzmtKg1BMFFmcJCDH2NCuh1D2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSJz8RTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsZCfrVP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rjff3697617
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3FpfdkKZz0MStDBt4p1T0FykBqK+a8wNyzH
	le+DrDVo=; b=jSJz8RTGEFdOLSHFSjVgW53i/fPJSgpq8U3+YgPelBAYHnXsU6Y
	PrdqQSGIgpFXFooAz0Yo0GSKoo0wu4Pm8itEJ+rjKi6veR0B24G6/PeIVv+QTE2R
	7zV2EESYSTZpbZ5uy1VPnXaQW51jzglj6aJVjkEc8zq+bXY/cDwzP81qzOJKw53k
	VCqxzIrFcKXq/9VE9UHVU6sdp+gs0Q1x2kBlzoXHTL1thgHgdz2mjzvMbRusTPUs
	gXlUyDGD+RzG9KfmrjYozHmwm1+N3t3XoYMCmLdPXMnqAOVxaWJHDwSfTrYFii9J
	B6+96ww7kOdQIHDO1hdmcFFVe4WBkOougHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jgh41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:03:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad4a8c1f5aso21572165ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771578183; x=1772182983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FpfdkKZz0MStDBt4p1T0FykBqK+a8wNyzHle+DrDVo=;
        b=bsZCfrVPpYRZcF/ho+bCAkGZaP23JocAukyCuBULhCYDeQa23gScjBAnzbRy7g5xlV
         UH2I7vMch1AXbHNYwHY2k3R+JN+/z19uZi7odWmmMqpTT7vL9bc357kHjUbx+T1/2DYu
         BjaJn8H4+EeZ9FwniCo3DhFXj3wfxLo4zx/KNJpw+D8ZdsZYl7KNfE+0z2MXeWySBTx6
         +TcA97/ZsjDvYbqOxtq7Ie4+V3mzz/rh1THPEEjvcUHbjTQ/TjwKoq4kCpjZijjY1kTM
         Felk137VbL1Q10B9u7oiT1XzM53F7faQwI8xrXO0BrxSES6kaQe13ngLtjF7XMNKD/Hs
         /g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771578183; x=1772182983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FpfdkKZz0MStDBt4p1T0FykBqK+a8wNyzHle+DrDVo=;
        b=GVnB6DPG+FKsRtb4yXUBK+aG72NQ0H7FFpVoiC0Wn9uia7fzgMc9i0dxMvmzyV06aS
         y4KarFBiEEx7sJGnL5H7wlLNIxsnXafCdvCOl4UxSkain+lnB3n3ita/IPvQHIwz9NH/
         ie106KFrCUW3RzBrQ/B0BftDVqzoPCHoJZd6ZuyW/exyxapNW3iTCvgIkWCL1n6YGpwg
         /suprRC2Mwem19w1tjB8so6xyp9YbARKZgWK1qNsJK1qMcnqRRi+Dko5Lx2Y3HLfThzv
         7DrMUnKSe0turTVLs8V5RST+TgUm2JuaOsKxtoPOuxr25u0LXAS1/2lw/L26tdeFy/qy
         qiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgsPo+NKkrKoFPrJYt5c487gPnSNVXPWkQiDsTMVAnjbR5stEMM/ALJt4ZpB8k6g9jYeFeYV+iIXH5Js/o@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZz/2pXjTCuczAlaVfgEAgEUEc6Uc4sWCQ/FXU4UPZ9ja2PPy
	Yx/jbl0SoUgW2j7qMW8gZgFvrjthSOw+KPgwfBuMmums7lNsvfy8GlEEnQVQrolwLz8TlWFkjDn
	mjwSqfUMeZ1NQn7zouA37tZZr2AabQZxEC3gYf+BHt50ttoLBJOzu4FIzZEFpSBxyxJpt
X-Gm-Gg: AZuq6aLl6tKMCCUI3udyK0N5d6YalqwszRTXu8A/NDA/M8Fj5jKKFah+sheqdyBYbVx
	+vSKDACKqv8q6eAljh5xI0lilhPxNgpANXES+HqKCzAVGEMk3/9yMtagDQ3GFpr4/+Z2CeNWPCj
	TH1Yoio1MTl8x2E3bKWuKzlzljA3A0T6c+fhSKSYzGnAfBcuzuIUKTEUmqv1gdoWkJjM+wO04vX
	+Cx6sqqw2jYE2iSeHrGyBrt8yCMrDDBdfVDVUA+apo9yK03fyDp0biXzXgh9qVng1H1cahoM1cc
	0ftiNxE9QFYMBlNbQV6Uus0utTUzX6yGB/ZWwoO9qPg6nV1QM0WPBOnV2mECyX+KN1Ow8fLMHVK
	URYCe7jn2BBfpcIOaJxmlkB+9UWy6RJl5usg+JKJ8I4n/LhBYRvw=
X-Received: by 2002:a17:903:40d1:b0:2aa:f43d:7c4c with SMTP id d9443c01a7336-2ad6cf2ed03mr12795645ad.9.1771578183211;
        Fri, 20 Feb 2026 01:03:03 -0800 (PST)
X-Received: by 2002:a17:903:40d1:b0:2aa:f43d:7c4c with SMTP id d9443c01a7336-2ad6cf2ed03mr12795335ad.9.1771578182709;
        Fri, 20 Feb 2026 01:03:02 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d58dcsm177208625ad.48.2026.02.20.01.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:03:02 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity
Date: Fri, 20 Feb 2026 14:32:20 +0530
Message-Id: <20260220090220.2992193-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=69982348 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=haSj3lwk3IxK1SysDa0A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA3OCBTYWx0ZWRfX6GxEdeFV62sP
 yAskAkK+gKPBB35Ual0XKtqd5rWnyemNz0Ma16d8sGDS5XARHBIMlzCebn0qzePXc0N9v8U5SCS
 zOySdqDOBfds2SLeRyQylint82Db4Z0dW9mjdFVuaLs7iwiILWsJwIFtrLHj9lGnz59YKvxz8O4
 01WtE++p1ppvbbDNwCgnu/aAVv8vfq8yytGotHHABUhwgbOhzIVFulQOu/i9kIDv3YREpoa8DQk
 G7se55R8oBw+dvr9oNxrP9QtS8F/hHB5JsKc8wwiAhB5dAJJysQjrpgI6EHIz0TVE3+hW0/CClC
 BRHb0cU/8q2ZgtZ2STjwj/PeYSyCYJYcVrybMdhiIyf5sMArnTzjxeKK6t956pIacPG4RSs8pNz
 na0nKlGiTgUyWHpUBSvEfOPwWUQYTt8hTuq3hQIwlGv3jn7QkjTFD0B4ZqXkyIGAJhEtWMLiZ+5
 u5iYtGIbXQ68kNSbiXA==
X-Proofpoint-GUID: MtBuH296nSMxYNfWz38WpYvoaTE-EGkd
X-Proofpoint-ORIG-GUID: MtBuH296nSMxYNfWz38WpYvoaTE-EGkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93467-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B78E4166007
X-Rspamd-Action: no action

The WCD9370 audio codec reset line on QCM6490 IDP should be active-low, but
the device tree described it as active-high. As a result, the codec is
kept in reset and fails to reset the SoundWire, leading to timeouts
and ASoC card probe failure (-ETIMEDOUT).

Fix the reset GPIO polarity to GPIO_ACTIVE_LOW so the codec can properly
initialize.

Fixes: aa04c298619f ("arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec")
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 089a027c57d5..b2f00e107643 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -177,7 +177,7 @@ wcd9370: audio-codec-0 {
 		pinctrl-0 = <&wcd_default>;
 		pinctrl-names = "default";
 
-		reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
 
 		vdd-buck-supply = <&vreg_l17b_1p7>;
 		vdd-rxtx-supply = <&vreg_l18b_1p8>;
-- 
2.34.1


