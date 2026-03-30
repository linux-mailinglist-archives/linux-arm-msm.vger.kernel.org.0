Return-Path: <linux-arm-msm+bounces-100724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O4vA/ZGymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:48:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD6358838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E803E3033A97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8953B5307;
	Mon, 30 Mar 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gflOG65V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNZEtKLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259193A1D14
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863592; cv=none; b=joFAKRl8Y/bpQ4au377NuCgEvvvQNCa6OTq389o31a8sF1vbHXIyrWpmn0ZdDjhfRTXVJzrHjzzmLByiAejrDyT0d0pjuQ6iz997uENNlrfekiCD+Chvh6FU50nQWvXfrPNvsKNf8HdkwI8iwn4jMbU/mw/rb0JRQsQBf4xPPgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863592; c=relaxed/simple;
	bh=fhYxZW1/oACvCmUKie0T0Oy5TfW5h+9M7T9L2njIcJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B42O6YCUHRSQY+FFA6C2jTjYo4v5iGfBKpoZ1rEtUkBhCYl9+iCw9RbGp7rD7UkLrZUos6uUXlseS+LZgsfEJIuMI6A6jZzIq1aOQa+LRCNtSf/tfGBcAAFD4ejAVW1vnbIBJ4lCNpJFc0gtZJIR7a9Jxt7MePHq7u+xt2NbhaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gflOG65V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNZEtKLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7U0pk3694924
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h47bOWyPfKTRieC2p4rGGI
	BbvF+Fy8LzSg2e4NkBkSQ=; b=gflOG65V+TpuL0WiwZS63yunnsZstwdIZoYgT+
	bF1VZ/tMJBV9IxBW/JNKQhrmbsCGl2mIdhjRFlGMz4TJxpO4eNM7Tyg9O0mkJnBL
	WgMJ5vsRgqHQXFE8NqqJoF62Ke11oxJ8jI3wfZmD0AxElLQ9tbCsztne5o2XGZwY
	e+eKeRDX0NQCBBqHeDifKigfpr0k79+/0vtPVlpZwn+p3qxmqhqAciC7ZOYgZpF8
	8xMx5oGX77bAi/vgcMJmVqfQY7gNJbH0b5EkQBkAj2PpidnEgZ6wK4yAZstvgSAd
	z+K5H8DKrmZq0uCFse4c8bIYSHlyDBxcJojAH8VkoJrRBXhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afwk6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:39:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so709521eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863588; x=1775468388; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h47bOWyPfKTRieC2p4rGGIBbvF+Fy8LzSg2e4NkBkSQ=;
        b=WNZEtKLdnsD3KXHM7w6v0mERglV+/oLrCXgwuFivoVjPHoMfiTAtOutto50TjhKjVv
         KG8Pcs1P9z4UBVtJPiEl15DyBxODso33E9qXwHnnSOBV2wUfgDOnVruqXxx9XNm9WMrJ
         NGwyegxyuF9q/KbQ9tCFgve5jNDL5WcHkKvF2VPXpYM1NqJJc3T4sNOCvIuwrH54on9J
         30KHcbmuxRYWTNSgocAw32tqRsQmbt86r4i3krT+Ri+V92oC5m0xSlsM3TZspAf8E4C8
         qBtFSRCB4wjaampqPk7kRePvem7uXFwTidXa4WOaKgEawfVnOTIYZjk4JyqFIYJb8Psg
         Cr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863588; x=1775468388;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h47bOWyPfKTRieC2p4rGGIBbvF+Fy8LzSg2e4NkBkSQ=;
        b=Fv5X8hf93fjUpak6hi3gEbtTMxzKPpz84pvpzFtMQWKop18Y5xB4rMJcrNfXy2TXhq
         2M5aAh6O0D2ExE0IrCixxmp4UwmpQBorz8NS3ZIqtrsaydTSGw4uadUo7nv3wFi3yEFp
         wYQiL9kmMTQjR+/mbjDiSQGKPxCuv3DbCNDoGMJeqdqapiAG442p74YqkMtaJLuIMvXe
         2pTahz6laTkJQRINLy1e/ci5tK8wn+4Ar6td79heZ1MJm8k1HuvbA8HM5cJbOABiwm0S
         9BlXVeLhKxER4AWsCd70Fss5xN4ySjixGF1BwP8PcDdii+fzVD7mvEJXMaYtpSn+VDi7
         Utmw==
X-Forwarded-Encrypted: i=1; AJvYcCUdZKDIVbkr+OeDP9XZzPX+HtlGjp3X006uCMwq/UWtzEovNf3lfx+WsRL8tpdWa7KMsIfVDUPL4E+kj5MK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ZB2C/nlmAhcpVwx9aTR+r5ObhZB3mr/AEWVeZ/+KahJ86Vdl
	X8PQSMoO4GAb1gGRYQUZj0ElwaHxdIyy+J7ceFNKcaH7gJvFbAoIXPgWgWPiCblj5wfudt43y5o
	R9UTWhM5+KxPbf1TdwBMdIgBIfmEPaJvNLh+axjA54NgLJYwYie7oJyLhTXtog4pDCcoq
X-Gm-Gg: ATEYQzxB7bQD222k+mNNiSUFTXqzsiQfpx5vJl5BwmSBueyfCQdwJ9LUuHmP3XDMvu0
	n52qMNAvq8tcxDiqzQLhyYwTuzP/TnW1AJPCJxhquiLf16niSp3Veu6stIIwYjw489hUjzUDMsX
	n8+ZNfXE0qIbG+B/+UXLCUMpEIZDc9Z4mnuNg7w//L8g+qoJufusvIK23vcMjag79RfnTsbZyVz
	4hAupP8iEE/MLt044/4o8a6TUv7sr9z6eb2RVzmWSnEAUF5X/a1w2+aFK5kvTr0PNGdD69JDmW8
	Ttz0uApPaq5DbU+R9kGag/BZTLWkd3bws5yjuHy2iOGQ/4I7ou+J1RxE8mJUIPJGWXps3QetBDD
	cIUhcv+zLuj/IJyQElEN10JTl3Gg+55HPZJU/ePhr7gqn4DQlyU2r6nUtEaiePkZr0Sk5M3ox
X-Received: by 2002:a05:693c:3008:b0:2be:8216:57db with SMTP id 5a478bee46e88-2c185ca3913mr7247440eec.3.1774863587994;
        Mon, 30 Mar 2026 02:39:47 -0700 (PDT)
X-Received: by 2002:a05:693c:3008:b0:2be:8216:57db with SMTP id 5a478bee46e88-2c185ca3913mr7247423eec.3.1774863587476;
        Mon, 30 Mar 2026 02:39:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2721sm6266521eec.14.2026.03.30.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:39:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 02:39:42 -0700
Subject: [PATCH] arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN1EymkC/x3MQQrCMBBG4auUWTswJlbEq4iLSfprByWGDBWh9
 O5Gl9/ivZUczeB0HlZqeJvbq3TsdwPlWcsdbFM3BQlHiVH4USp71QzOT2hZKkODTCNOKemBelc
 bbvb5Py/X7qQOTk1Lnn8niWGkbfsC8pG/9HoAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774863586; l=1094;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=fhYxZW1/oACvCmUKie0T0Oy5TfW5h+9M7T9L2njIcJ8=;
 b=mzcRK6+5RnlflB73JmwaYEq3qILMs2TE0BvNEPjSSQW693PeHlk3sc1mUlP++r9Bc2KUWMzVa
 QEZ4ASQYOMuDdt8whrFihr2qKamBd7e1oqfU5iLetUI/ayVNwrmUGB1
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: OjDj_Tmqm1o2rJ5_23RWvPSKEml9VJl-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NSBTYWx0ZWRfX68xXIvppsM1h
 VSkYEifvbHoV/+jqMW+3vJrxEq2p77qHPe8kKmROINBHYCz6u0zcujyz8ht0GwslMSkrQ2nxenH
 we4Jw962/tUdtGh1cQy0DBp8ZdR9ae8vTx4i08SmyYWVf01mbN4vfTF1byJKqGQ9sCpaYkZ+QeT
 8poV8jiAvgOLgeb8d6etaVbKQ3NgeDy0ZXrmuvdxkSIQ2Hv7J7OYlrm9jIX7JOzvORI5Bpz3nrW
 U6YjRJifBiFue5cIWhYJ5EzZi4g5Co+ZN1OBeOeN4SVcF5WM1NuKqWiqfr8FZYPymnOIiq87rQn
 UW0+Gn3Z+DEneQQfH0kUcUT3rkvZgMtgW/K8e+R93o2qLfJpEh1c2sEeG9K8/9D0cR2BySGPYKL
 zchUbA+xJ6zd4jkZH36u+diS92c+X1Lu3eUot2CsWSA5klOl4/+P4BX43mNuIQ4CZOKPk+tyN13
 s2uDPS9JJwkHFYdWVgA==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69ca44e4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=S9qrxxQzeJ0pvEaOSPwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: OjDj_Tmqm1o2rJ5_23RWvPSKEml9VJl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-100724-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,310b7400:email,0.0.0.13:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60BD6358838
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Exactly one space is expected before '{' characters, clean
up duplicate whitespaces.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ef6add4e5a90..7cc326aa1a1a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5838,7 +5838,7 @@ compute-cb@13 {
 		};
 
 		/* Cluster 0 */
-		pmu@310b3400  {
+		pmu@310b3400 {
 			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0x0 0x310b3400 0x0 0x600>;
 
@@ -5899,7 +5899,7 @@ opp-10 {
 		};
 
 		/* Cluster 1 */
-		pmu@310b7400  {
+		pmu@310b7400 {
 			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0x0 0x310b7400 0x0 0x600>;
 

---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260330-knp-space-cleanup-ea20d5e8bba4

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


