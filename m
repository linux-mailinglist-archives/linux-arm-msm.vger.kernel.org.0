Return-Path: <linux-arm-msm+bounces-104009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILASHW8t6GnEGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:07:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC69441448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A633056FFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D3830DD30;
	Wed, 22 Apr 2026 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW+wvQkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPIBnuoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A730B508
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823545; cv=none; b=bCRBy+ESyD3Ta9G0hY0nsCgEME05/BE9MeeI0mhtF78NO1e25uCRnCXuiWcm7QI5Oqd0kipqAgp5FHPbLRxfuO6L6zcaQwMb+jar3iz7eCV11PKEYMaeeS84REJq5m8ks2jhL6Ykn2hBUVnBBREMxgldO7WwDQfqOjTNeqZoXf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823545; c=relaxed/simple;
	bh=/t53h29Pkj7viUxmExb0P2VDmCp1KWMxYHFdwnxPeeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6QIZgYF8OvOQCa95kOgSG0UHnykWAMReLZ4Ll7f9UZs7tQfKnBOJOQrVXQapAx4XjzJ5FkTn99aEfc5eL6s/TOlp56p0HhWKl1asSYVAKMBG6qzwaOaeRYKbARqfi+NAAID2nHS9xVev6ZhACBNKgZuS2UGTNg/VrmfWLRU/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW+wvQkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPIBnuoT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZtFp3377612
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Amnf+ainR1CvooQB5tQswFdW/8sU8z+ZPwOSNkYwagk=; b=HW+wvQkTIDiUcqKX
	vMuKzspgl5pW0ZbJSaQaTnOlf5KeuloezZT5CzbREdzAhb0adhn6Ym+3wbTCnQv+
	CcQAoFnoCIHKxz/PGSVcf6WcKp/HPV7rgibxkMlLLPhoeFryGRHMs7HbsX4iqKqv
	q3BiMGsMdJ24YZK0k1SUtnMb3AX5sppYbdQOA15QqHR/UPwKQbG7tBnpmOlUgdC1
	MpEmsv0TrN6XDvxoJcCDeh1SosbTNu7Yvoxawlr20aU6wETXtvIyj7QsTphUh9Sh
	A5PliXOQSr4m24RtkiEZibO4kEzlAoIO7uwc9K2WVqeF7VYevQd/BO7QJc4Cxd+O
	Cw3Caw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng183b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so3188586b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823542; x=1777428342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amnf+ainR1CvooQB5tQswFdW/8sU8z+ZPwOSNkYwagk=;
        b=VPIBnuoTjdpy5V6egPYIaDW6sPGIo/EaoiDEtMTiAC85L9XHKSZan5RqBzXRVBg+VY
         TuEwd9JbMqojsqMikSTnqZ0GgOIRKEf8DR6dxLUlFbFJeC5bQW2A1yQtK1EkUqVNy8g+
         OBGThGtI+ZkJIOEEUPGVkYqatdOReDh/OfamMbHnfcZOB3Tm2qRFjnxgIr00y8eSOjAj
         wuzcApPw/wmAi+i19jVRPBC022qlQXJ1GPBL4aOWbU+FNGGU1TXbM1mU5Ez1Xy3ow7B2
         iM3tJH5xs2qZYC9lGE9USXhk6jTnevmoYOGAPDkzcMsIfcuVYEE8uhj6fLifrLG4DZb+
         TYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823542; x=1777428342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Amnf+ainR1CvooQB5tQswFdW/8sU8z+ZPwOSNkYwagk=;
        b=fF7l1zvMoT2hy1cQQGf14hADZM/VQI3aUtNhmGCkqk9pw7jNuEn4ngSdgz4Cz/iyd8
         69/OxLBznyy3ozJS2Op993G6TzFGfm7zaOnL23vKR3KvNYMmMl12u0E3chi3Ll/SDcRb
         sOotPVm8pTVVO3h5ldpKuFbPcjqq7kQC/stiAzP2Dcgrv4BwXWO8zgzEoVzs0yEJPayr
         1BwMrbvPebZwx/3TjYKfWHPM71/X/ksY3FOakIBFOnrnu0ve914cxUwDp7euQ0Ot45pA
         A7vz6JR6AG0PiBGJzHl8hXgt4aexwv1wXt6GgMlDTrUt+mPL9Y5cEuT9w/I23pIRk4I1
         f83Q==
X-Gm-Message-State: AOJu0YzXNNu25/fylRtv9cet5kiKF1OoUOERcJbL6zM5qUYmzmDwWZGA
	LzavjhTsxWfC2sfUHnHMAnzMQbmEYX+eHN+oQAUsmGbRApMv4PU4CkB11iB4kv3HR3JsVPDW2iR
	u9FAEbEfcydRtY7TuMM+m4cgx7b9bfXFNH8tHTjRUNpHk++zfGFz2MvlyKoNWi67cTHHKxjwjZG
	GL
X-Gm-Gg: AeBDievv2sZFs2UjJ0Bd1IJiW3uC8MTC/tAMkNTgGaFPixPBTTVrPNbbSlkRw5Mkerr
	HnZ/44lMoccaRfg9+mZiwJNePnLEwoesqrMu437RIuqm+oFmFa7XiV0DCXKwW5wQ0rWqrjNJQGo
	trdnYRsn9HDeIk9+rHnT6zu+EdyFKd9HiZ/c6McHAfNje1QSg6dod/FSOHg1xQ6ZqEz5Lv3wM7m
	JvGSzblMq35+k5dedrtis6VBWAIehLjg51xxpwYWARiLVqHoGDfSthF1ppHc+cQeWFJIZev9IIS
	parJgOpOu1ytIErnrN/DKPQoDJbcdS4NcwITWR/BFUsCvV3JSEKYaB5HJq4h2DjXFPlY8epMheo
	bNerG+UlFXWNoQzuDxJbVyqr+e4WDvk+9qeB936h4wHKb9nDQFQPqItw=
X-Received: by 2002:a05:6a00:2d03:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-82f8c91924dmr20936847b3a.43.1776823541973;
        Tue, 21 Apr 2026 19:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d03:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-82f8c91924dmr20936809b3a.43.1776823541477;
        Tue, 21 Apr 2026 19:05:41 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981be6sm18040368b3a.9.2026.04.21.19.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:05:41 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 02:05:13 +0000
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e82cf7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iJbeT2h-Aok9JeJ55RIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: H59ikNwyI_GS43klNuBTsaQREsfa2FKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOSBTYWx0ZWRfX4jma9mnCPZsS
 6o+PCaBXgpmhBhMEUm3T+S6YnAQiNEd6TqoC+ENtjSI+scqHUkDB7L6vBazQf7j4qgcz6F7FCq+
 AEg/YwCJRttDvv6TN0m9yQf6qHQ9PsmJL1HGaNI+XoGQUdbKBI1iWGmAuO8qJwiTBpXAewf9xP2
 u5Bx5mio+nFxbD5TMx7EdZY0sE4FlJf6T5Ymga7PxswXHjel7eivEaVJugiZXe+gVBuUf47J5++
 wC+U+FZx3wVkqqgYFslTfcGSHJyMTgGeSzfbrq5MrqaPtHuTsKdt7ufjEa5yBGPLWnpsvAP8DK2
 YLsUNU+yOSfR7JhS1idOZOdwilZzbiODHBdMArKcL+FrsAO6Gwvgmt3jFMGSVnVtIUlrYhfMm7T
 67RNjSNXnUWakyNpOcmqdoMHzagh1LdkwmJVwMnHx23RdTOcSulnedE5w0Zw6Kd/Fjhb52XVtZg
 tZ939Vckrg0fYHV6kSg==
X-Proofpoint-ORIG-GUID: H59ikNwyI_GS43klNuBTsaQREsfa2FKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220019
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104009-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFC69441448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clocks which need to be enabled for configuring QoS on
x1e80100 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..aa206452950c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3132,6 +3132,7 @@ aggre1_noc: interconnect@16e0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -3168,6 +3169,8 @@ usb_north_anoc: interconnect@1760000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>;
 		};
 
 		usb_south_anoc: interconnect@1770000 {
@@ -3177,6 +3180,12 @@ usb_south_anoc: interconnect@1770000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>;
 		};
 
 		mmss_noc: interconnect@1780000 {

-- 
2.43.0


