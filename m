Return-Path: <linux-arm-msm+bounces-65681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B5FB0A7E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 953F03BDE3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFD12E5433;
	Fri, 18 Jul 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQD2puhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C62E54BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752853673; cv=none; b=gx0lE44FuTYT7NB8rsW6iQUth7kFBHcV1CZb+8ioheDVgESMC/UZKivTyWlc//WfBErZo0EIJmZfPz4yEUMF4rW1QYSiImz25pRBSPEVW76BcBiFYBv58pKxxbmgO/Cbcjtk2XL5LvvDDA6qAzQmNe+umgtzZx7keBaLEs3810I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752853673; c=relaxed/simple;
	bh=BYnRfHJaDXvngWQZ3OYnZquLXtcmhMchLJCEZgpFfwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCElCggBZVp0fsDHMLkH5KOWUCtjzOUY6JE2lYmiz22nyeK9JC+Bzu6InUOPI8cbjvbplO2g1F+XR24rl4sBC7N7lJFzow/3MR+9CHLu0719AJdlw/mQ151R3MtfRSGV6x0o2RHusLQXMXWq1Yn3CxHAmGNXofVc4wf+hTtoZu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQD2puhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7YkHt020661
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLCM3cPYa2rzNnUypN3ITU/Q8s6JSMH9shGW4VoUJnI=; b=SQD2puhOK5hYvHhP
	3m+kgEzTNt2zEAG5djlAKCSk2ort1Qs40rzc2weRzj3oEtdy3ynZE8hNPd1yzfV+
	VojCdIjit9zamhyevcqf4qRdertGB4stIQlIpAk3FCbuvGm0BdrIDFWSKwYcMTBZ
	7sjzU6CYrBdQ/WRv594UZqiRAQ1PxueZKZX9dypAB3mp/SynGz8MZWTtqi9KfBch
	vyPwia/7rH7uRdagmbOOYCMwd7xxWWf4Ys61waiO8x1LZ+8MC/vKHArDqroiOUqX
	D0pl7T468Cs6SNvXXguHkDT0i8NizttdL/lZ82ST/fK0+FX2MYY7eQYblMEmkGMv
	rwS6Ew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpq7as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:47:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb520a74c8so36677266d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752853670; x=1753458470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLCM3cPYa2rzNnUypN3ITU/Q8s6JSMH9shGW4VoUJnI=;
        b=ROkGVriAHIOR7BcgyWKYHEktFS8Qi1n/n4MGmtxQTkRTiPfWmGHIwVLOjXDwyLWcaK
         M5BqU4x4jG2YTVaRSJfQINR8fQRgowqBserMvx1o9kG1R8sGqCzk4/jvKrNvmBZrN7rT
         GdJ2PYLiBzQeRQRd6sy1RIfjgn76eCyeTlEQYVVf9GT+fSWYgyV9pnIbUoAJLx75pzXJ
         L/ozoFz+SyXA0v91+dmQFkjMFd2olAYcAU3bsq5NwYEyCflInqlOKRK6nXbPhIpGfCxs
         szLbMk3QKbHOgcVP9Wl2TKkJtmNlC1SYFvhFeETldxecl3qwG+LnwN3sU7hBH9LvSaUl
         KZ0Q==
X-Gm-Message-State: AOJu0YyaVJArMtlTeI1re9ukzOqAxWQ0O9jnOb8WJDoKHsqpvkj5o4st
	pE1E+KTlMeL0b6ZhjEZJomJeyyQAumz+Xdk+ZDzYwQOvLmvFIp4IgWZsCgI5W78M6FmneQxz07S
	jQhzNgQ1Wcdqk1iZFMhjl6O6uYF6d6KDjQrz7+eRhdW5Oc0wS4GodprPXXB7Oxqa7CyWy
X-Gm-Gg: ASbGncvDOPyZufwmJXXOA9SlNucH9bI5UsViiUunKHD9snQUvUX/R2ge/lgPsr9be4Z
	lAD2HTpM5vuaLiin0EO0WtimVFjO802PmN0utMtrtAJO3Z/s8XAyI6zmiDvqHjnAwuUBIDfRYzD
	RyxuUcj35UOwmcrn1LISmXWggPFuwLH8orlmDG1dgFefkDmmPBhYbYF/tVOiDdeo+z4jHLURM+a
	UoU9rv5aF/X3DcQefMM/XfZZlBYRsAjMZWXSW+qmJKQgGCDsBzyWDbun/ftMO2XfYmYf1vIwwW7
	74QkB+NweYQzHVB2TtakjfIUcS3RYk39nUhcsWTLxQmrKUymGTbxV2+AjpxWXng6bEMYKFXXWdW
	yt33awBac+3X17+oZ9k7zM9yY7Dj/EDXplxTqa5x+QxdJD1KpxZzU
X-Received: by 2002:a05:620a:27c5:b0:7e3:31f5:c8e6 with SMTP id af79cd13be357-7e343636bfbmr1621485185a.54.1752852344766;
        Fri, 18 Jul 2025 08:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuh+0AlxBLgPmVe3eyjw7k7tHsmQTFMsVPrzZnfI81Th8/7Z3gjsDWeTyYmw7opS9dxnkB2g==
X-Received: by 2002:a05:620a:27c5:b0:7e3:31f5:c8e6 with SMTP id af79cd13be357-7e343636bfbmr1621472785a.54.1752852343300;
        Fri, 18 Jul 2025 08:25:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d994csm2466821fa.84.2025.07.18.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:25:39 +0300
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8150: use correct PD for
 DisplayPort controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-fix-rpmhpd-abi-v2-2-0059edb9ddb3@oss.qualcomm.com>
References: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
In-Reply-To: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BYnRfHJaDXvngWQZ3OYnZquLXtcmhMchLJCEZgpFfwM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemdy3oXmWhQOnHxAtoEM3RXwiGDR8sLb1FD5J
 6HfHxafFKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpncgAKCRCLPIo+Aiko
 1fOHB/0ZGrjmxUXurqUnj45Hy/MLUKJ+hr7LBSN5QGm59MsGeHJd9SYnvXICto8fFjYmPCJOjYm
 rHYflZ5ZxHRQM6Yja8HDZdYe3swJmPobdNzaU1vJgUWMIcr+6oZ07HUg5VpqhJDqHxsSnbKrw8p
 bbf9fNME8tbNwvnj63pZiKwdILpPWP8R6G2Kuccke5fIX/05ga8xYJ59J5fai7U5aTMb5NEqeiX
 IxnMDsKcciC63SI7JzObOwjCsH9dFa+kF985gnlUey2s36D8NsmjdKdTlokJU/EgQHr/Cg+45xP
 uTOjRaA1T9Jbp8+k5IAD1fWVrbA0y1TzRZe1vZf+Bosx0QV/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyMiBTYWx0ZWRfXw+puzGZVN8Ts
 bA6sRNJND1UZyGWstdv2pfZ/uDbGtQp6W0WsecVKhEX8muiKw8gpTrpej2itQ8hCbAMAcf+Rhl0
 XRF47MsuE/vwwXQcQ3XeFe1HUU13M3jKCQzE5U3qadcdvO7dvtUHXF//suSRKes3mBDaD+9m1cs
 FT2mzxyh2Bs0L0JkN/T2Jrnj7BPwSxOWWIsjc2M14awSanQNl00KfNnji4m/8eD6CyTyX0bzP4v
 sNtDMs3rVx1x4vZ1PzOtumlHesWgp9GEvchZcqHff1TWSZsW7S55uSPTIls4ElW6hbkjY/Dv75Z
 6UOIkmPoNfForeNOEvtVt/OhnpQoLgFebsBXNj3p4Bpf8dPxl97LUPYNmA3cRBV7ddm4wAVUopI
 aAPEcxpurcKX5K0C+oHwgF4OFoHFXTRONfNc76mq7FB2jqx0FaSOWu/0Bpzbep5t+sHQ3T7n
X-Proofpoint-GUID: y5mNPQGDzbxMFFAD54vrtStppVcJevGZ
X-Proofpoint-ORIG-GUID: y5mNPQGDzbxMFFAD54vrtStppVcJevGZ
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a6ca7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7pnVX8DWB20M0aN1Zv0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=742 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180122

Commit 5dd110c90a50 ("arm64: dts: qcom: sm8150: add DisplayPort
controller") specified SM8250_MMCX (= 6) for the DisplayPort power
domain, however on SM8150 this indices maps to SM8150_MX_AO (= 6). Use
correct indice instead (SM8150_MMCX = 9).

Fixes: 5dd110c90a50 ("arm64: dts: qcom: sm8150: add DisplayPort controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index abf12e10d33f1ce5c74e3e9136585bcb0a578492..4b347ee3244100a4db515515b73575383c5a0cb7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3908,7 +3908,7 @@ mdss_dp: displayport-controller@ae90000 {
 				#sound-dai-cells = <0>;
 
 				operating-points-v2 = <&dp_opp_table>;
-				power-domains = <&rpmhpd SM8250_MMCX>;
+				power-domains = <&rpmhpd SM8150_MMCX>;
 
 				status = "disabled";
 

-- 
2.39.5


