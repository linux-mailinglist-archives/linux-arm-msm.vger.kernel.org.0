Return-Path: <linux-arm-msm+bounces-90820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDzyMjngeGkGtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:56:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F497389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84A413030EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627EF2E62C3;
	Tue, 27 Jan 2026 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JScs+NA1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I63Ih9So"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E50435CBB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529353; cv=none; b=QrJ+VRfYhANgJXilG9gPoY2Sa3gcCqZ4S7EwnvZDIZpprIVkZFQIu7WXhs9SE5pfx4PbPnxg8dZNnEJ6u79hPb0Y2hlPoPuOpKurDltD01TrBPZiCyRARZLPuCrmK3sQi7Zm5L4G7/9hG1IaWTUwps7b0vbAvOyB2LVwQkH9dwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529353; c=relaxed/simple;
	bh=+9gmnC1MGe3XkjrH0M5uYa3M7ZPLjuPKmCKG8k9lFDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZaL8Ruv39VkIMFmaAwORm16ddUUgvmIhAx32x0h48ckEEvOcEp/GUaYggY3jqMv8wr83QO9UEfgGbexQdKthKvTroq48vC52UeSAvHXLIbk5gdnI5Nl3qW5KqJFoP9netwamJMnZzkhUEjCqWA6gms97PKu2QnssNqNNQFMswEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JScs+NA1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I63Ih9So; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAPM9M171368
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/biGgp8T3Om
	BdOANgYQbjRR4h3qGXPbPOnnjUtiHo2E=; b=JScs+NA1rR9mFoa4SLiwffGgRtO
	TpK4YpFknkRWgB1td/OY4dfaBLzGAf+HlhbmzflxxfBlbOL03jdQ/LZ/4KSBzCmM
	ZBg/mqSFfZVMCMh8SyfifNTbm0z1tfhi7JO6tfDTCkGo70k3aDwqYrRU/p3BucxI
	2xPWcjmiZdijHS4DBsVOxfq6Pr5hUJ0bTsQ+QqI7Ghg5Z5eConfMqkf7DVU2MxcA
	IecdNQy8n/KhBMbw1qkATjOITasfkJEJGr2o0fY4LkfiXKrQalKwiusq+BiZr3f2
	egG5NjkG6ZcG1hYvzcyZreBf7xxISF2VtOBXlXJsu8fm001nyR0Pqdw6tTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3f7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:55:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so5098539a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769529351; x=1770134151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/biGgp8T3OmBdOANgYQbjRR4h3qGXPbPOnnjUtiHo2E=;
        b=I63Ih9SonbYjHa42XEc7QlAvcFdl05T58ZM+WAZVt8jQ5XQ/ARJbByEEC5CvWwGpm+
         puVvhK4da/qr90PscUJlsLETuC6GdI4blliGELpCrI96Gaup81VEtYOBC66VF5cCRS3P
         xDV9zepkZiBV3CNBIDm644jq727Cb2TL1QSVYEIaxCnev/rqZlXA6yIAcKnTcdTdYOsd
         U3hBpG7bSF9uoFWiHJLoPmkcdeQmW9uRrP2syW/BTHsZp2LVn8RJ6WIo+DqmVqRiiKTi
         JaTzlvYaNJxasB0m1r0LAk6lg9YCZVtIuovjWh6qeJVsk08ZW0Tbqci4mcBfKa97DiIg
         cPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529351; x=1770134151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/biGgp8T3OmBdOANgYQbjRR4h3qGXPbPOnnjUtiHo2E=;
        b=TRodDMRRa7InYkJojhLA/vViPrqNlNXdkLNboIg84eKorITYI0AvBTWOKq6mynMfgy
         ixB72jg6KaYRQUgtpLmiNX/mIRB60d2Jngo9uvdyH/aqQ03Q1udP0WAvpAy2mz6kLS3W
         XnHNOa2kzbD3pO6DUSyJEIKNdoCDgoKCqdxU36ap7nTlpzCL1uU660F+J1koLOBTECEv
         ExUbhUdytskTGx8BhmlcrKV5jC1HW//Q3ZDQPzcmLhdfkBuTrBR+rfPDOkcMHScbLL48
         qC5joAKwwXBKgDM6St+VDFvJiss96tpBlCtkvkzd6p8mBcmdiDK5sSKiap/KKz12FMxB
         CRcA==
X-Gm-Message-State: AOJu0YzlHyyHZB1tYmZrXR3RDkGvZ7h3yLdbLeku727e1iGPIkazD4xk
	EW9hbxj8zo7HjV1UWUlFg8GWRO2JAOonl03snOS30YTj2VmFjZkCOMmfot+90one/kXEDD37H9t
	OXidQPGtMykjT1D7qT+SzFlqksSFGoGS4iK7UStrnBBTc9C3cQSYFPtKvYlRmwIt1k+Yi
X-Gm-Gg: AZuq6aLAJug5CPChFHr4P4MJRCZEJ/jHAS+3CZ1Q5drwKL/bOhTWwB4sk0/sK1nmXAZ
	hik3illHYHonv37YbmgB/vFQbPAnLplq0kmE0eNlGZBjgZvEPASMgdOs7O0QzKnjF3fK+FlGKo+
	IEEWIPvzjiCgu8qYW2lK+3xKd+Ys4z7kocIVysCkE5AEmd+XI3XZEcrvjdCuAXkVEMXwC5vK3JT
	Rxe5eHq0A0B+i1rfiH+ls9am4Xvhem51YbDZ1NJnclzv6qj+Y4umcHaJfSImkOpgqaUIWE4rVE2
	723wJ7PFcrbK7IcUnh6v9x4xgQG+6wJEzfCaNDPWOmA4LcnUUIe6jQX+SM0tg+88s+hNAnm/PFE
	PQu6EJ8hxxoPrD8PAjkq2/iLmfkcGduyJpMJlAuEO88h8cL0=
X-Received: by 2002:a17:90b:4b8d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-353feccf4a8mr1916505a91.3.1769529350608;
        Tue, 27 Jan 2026 07:55:50 -0800 (PST)
X-Received: by 2002:a17:90b:4b8d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-353feccf4a8mr1916478a91.3.1769529350156;
        Tue, 27 Jan 2026 07:55:50 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536aed7802sm6131475a91.0.2026.01.27.07.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:55:49 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: talos: Mark usb controllers are wakeup capable devices
Date: Tue, 27 Jan 2026 21:25:36 +0530
Message-Id: <20260127155537.4088709-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com>
References: <20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMCBTYWx0ZWRfX7Vb6lK9vuAu/
 C/UIqMWmC/zVHxO5d+7b4MvfkexGvvyw2dSxsE5E5xK4bt8AEuXbdlZxo1DQF8T+k96jwPZ4nlp
 2g07XYMoTCQt0PKRnDyNu37rBxj6UvQRIpRGmWUemRTdSrV3QEko7/JcCQUmcejJp+t5qtVQila
 BZt16Z8NXNemEfs8MMxOM/oa9BVEaAEmVrMAVnF4vw8VW1cjj+SUJGOGhFeXeWnZ0cP5I7N6raQ
 9pBb/YfjktCTjBtRMdFk7Xehi8XYGVUB+uJ+2DpuWUMe+4LI5UuvhPY//ckyUvRb6QCrK4OIu/B
 g10bibkwW3SSpuF2Xb+5rbX0U1vRuJ9Y/MlG1JFTs4btyX/F4oP8M2KnrV93/DtonQZ1yKyUxEW
 V3mW7sjqvZZN9n9nAtgPFSk6Th7pXzdE9m8hhAFN8El2sQXoDWRytGf6UadhA2It56ZoAMf65ip
 GdTJMQALZhOElbSQwiQ==
X-Proofpoint-ORIG-GUID: hCLGF0YlZ0p9Es0KnMUXl4sZyigIw3Xj
X-Proofpoint-GUID: hCLGF0YlZ0p9Es0KnMUXl4sZyigIw3Xj
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978e007 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NoffK1niIyA4o_zWvw8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270130
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90820-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,a8f8800:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 431F497389
X-Rspamd-Action: no action

USB controllers on talos are wakeup capable. Hence add wakeup-source
property to both controller nodes.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..315dbf3d9bed 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4527,6 +4527,8 @@ usb_1: usb@a6f8800 {
 			#size-cells = <2>;
 			ranges;
 
+			wakeup-source;
+
 			status = "disabled";
 
 			usb_1_dwc3: usb@a600000 {
@@ -4591,6 +4593,8 @@ usb_2: usb@a8f8800 {
 			#size-cells = <2>;
 			ranges;
 
+			wakeup-source;
+
 			status = "disabled";
 
 			usb_2_dwc3: usb@a800000 {
-- 
2.34.1


