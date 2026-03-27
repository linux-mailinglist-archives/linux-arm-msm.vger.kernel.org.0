Return-Path: <linux-arm-msm+bounces-100188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEcnIA34xWkjEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:22:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E133EC56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 522D0301E712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE9B36CDE8;
	Fri, 27 Mar 2026 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/SDd3Js";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8WrkcpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0435C195
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581650; cv=none; b=gT9t+Gg1YbMFSrCvRteQ50sN0mze9rvEiPRL3+Jiz97dg59aNY5vXNgKS3J1yjAb2ms9IiiOXQR3CJvebFpxPdc1X74XZty1NQcOiTNSBQP1xLEGyn5ula6kyWpI+lQZFcQUqrNRJ2xTbFZ7PZlykXtJFTD3uBY/vuPuLrJfqCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581650; c=relaxed/simple;
	bh=OjJnMS4bKp1KFIgbbWANuCkzgNHaE+QzZ2HuSliU8Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CR7C7FcvTLdUAQPXM/8WnLyp0/qTYsJz0ILmWqDDDpNiU9Uo4VBJBw/P4qwyLuUcst/gTOJNJcNS795axz6aOqLXY8F+jL1oolPjOSEWdIaIjWwDtGawp6y5ZgSPCBv9j+yeYPJxUO5QcXaQ50xkoNrJkPbakdQsIcDiGZOQr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/SDd3Js; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8WrkcpB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJuOEJ3075407
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3Yl8WaU4/FMJSPNlXJQyMAwOK04CQipc1xWtL05tKU=; b=k/SDd3Jsl4YsPPdK
	ZHhbaSTD0kqlsio0abidNGgsy1EV47orpxIQV9b8AX2fBmIPdIxmBoJWZXmwTkPk
	yIQXs3UCcUL15ApDbQ8dzeh4/XV7X6AnvduhJ6CwG4jze860mq5So5b0cTyc4p2+
	mWtpDyqRtlLhw0rCUajmGYMIn3t7hKb+ZhK019iVNX48q5Nio6k22ECbtvuOCNQw
	lINNSMP2duep1xpVrR3socqvj9Zs6K3awlTx3PDGIy7qPkJSOhouIsDk9p/TPkwt
	MuWlKYWLKjROv2FvQXrC8xJJsoBKkX9gL8/YMjyY+HdSXgW0P8AFshJIDmMrM1mS
	lYQ6zA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8s4h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so1647883eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581647; x=1775186447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3Yl8WaU4/FMJSPNlXJQyMAwOK04CQipc1xWtL05tKU=;
        b=d8WrkcpBgCv2dLymTqlP8Dn2CfFIrOd+9dh1EzMKfSujgkZsHyuZJKulMiDFIDxoU6
         l+apGJeVKWktozAHdA+biKC5y1xx92f22DfJ9qtz4R0EYyhk1d9blWE0+yPsHMv5QUlu
         RIjOTaXa7uy5geivWWwEv6f5lWLpswP+saW5Cfx6dMvYq73vRblIDeFxkULtmTFhyZ5W
         /jkIU0AOSm9qqOVDjos6LFjBOhoWaYTibSZNxGo7m3HaiJNsCUYl5e5cUfhWxSkvogAF
         V4gDOqYYqPuKKvCv3SUmNqhzM8fLW5qn3sWseE2VtnaxEc9hoUTb2Ticw59tMV7VUjJw
         pTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581647; x=1775186447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3Yl8WaU4/FMJSPNlXJQyMAwOK04CQipc1xWtL05tKU=;
        b=rhVkwguI6VTZb1QA0fMcqxhkO3Sdb3HTbFKqC9GP8CVcsVEfdN1aYgAntklzL5AZBp
         E7sTEAnkLMfIZfzHb/hnWYs1gnmuyYKJnDuuwulTwKvbG8qjB/iaQpc0ul7mnZIgMhnO
         +aiyBxJzU9CyfxuWGNwrfncgEdNCpuqNFKEx6kUYhXTDAWOTzn1cLk1Q0mYTdvBjG5YU
         /5hlUQXO9OHgYeiDYPCYafzik0GMWqrl6xvESbXB7lw9WSdhQBznAmRuZALFkbf2leaD
         nvM0Y8Gc7jpxZJtW8ELi5+vhSMnaWfg+PUqtY81biRnj3ZOtRHH5UA5hi/vcKGCiqQS8
         xECw==
X-Forwarded-Encrypted: i=1; AJvYcCWXAahJ9IqWsOr+T5glP7YOnXFbFpDLDIOUBMVu5rSC6q9wtCraulwfnWZMPqsn0J9cChc5KmAruw/S0vwh@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKgalCQjyOXxTsPr6rqlvEjJ4wVpknNMq4WTMKIyEXuCjcqyN
	y0U7WqpdBU0JeZ2TjghpvjJltRV/IBQ9kmwoE5+cVTWD1YwwYTixPx6j9OVbL92n7ujcxSOCtwy
	saDquWe6I98XEgqLxQSP1nDzaGjYPp6ODZoQ127Rf/Isu1O8Un37We5EesT1OJe2La95E
X-Gm-Gg: ATEYQzxazge4CB+0PI8ATilqcpemYb1FMLajpzcDgRJsoOXUItytJ3uaRcr9DgwgaEK
	dmhbbMPLoM3pmXm1/oZ8q+XWVt8HOIG+Ujs8sDbYu0mUt7WHUnYkUT1MKU9+YzsVeCjkNoWXX6x
	QaeHh2Xlpf180WrMkUyrqUFWB86mnKTjVbuPMsOYeqFuRVH/1dQOrW/QGYqHb3FV11/oOjOmTYd
	m81QTT7ph1Sskg0FADwaUHuAxm9vSFn7X7BBZ81bB6RrjE58zt5WugYRc9v3WcFdxyaBjhb2uIY
	RhMmVF42oI1Gb88yDj9r1Yq8inKHMv1Hes2mivLtjL/AOMzE2xhlWHecvpszBq092+8FB8qVfKP
	n30u/DqmmMku+qxMYdoy0I5gqhLqmKrqQXgrYi6SaIPWh5Nv/oyjr4iJDH7cWCv36GAi5un4M
X-Received: by 2002:a05:7300:a584:b0:2be:833c:149d with SMTP id 5a478bee46e88-2c185ef43abmr553397eec.28.1774581647364;
        Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
X-Received: by 2002:a05:7300:a584:b0:2be:833c:149d with SMTP id 5a478bee46e88-2c185ef43abmr553384eec.28.1774581646850;
        Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 20:20:29 -0700
Subject: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=730;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=OjJnMS4bKp1KFIgbbWANuCkzgNHaE+QzZ2HuSliU8Rc=;
 b=W7s0JCIsk/Lpq2wGPDA+4G6PSb4kIW20/yHLPHCJhFZ7lyF7Xy3kocymi0IRQqyxYPPVpqNue
 9DeFuI4gphJCKPkb/7ONmTWheQjDZf2N/Nn0lEV/Gg04IqYe4lDB9OW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfXxWO8TB2mtUjq
 PpBYEyOY8VLmqnG1oFPhLVskW6ncYpo3vk3TTO3GCeHdrh3ciKgZIka8rwKDR2Ir6jb8CUUSTTp
 FAahCGgxWsdPKbk8zb4e/Dr/ouLdjaJgJfS7gqeTgKruZQPcZTF2mK3GQxjbYNSHtHRy1XLjjGH
 c9HTnzE7jpv2+PKvDvst1HGqe759FBxJiWaPCzj2QSMOygTmc5kHzJuPqLlnMqOFf/hnVMbAvFu
 ob0N94W9PszxwLiNeJnaykuxgyG+MftyW45BDQYO5pIgc/q2pMsLo7eR6Jj0K7ZEqFn0UFu5ORS
 7IbOXiglP5FhuDXaClz2eujIbQGMBe8RMMIdrpt7RXdEDlBZ9fhSDksUy6gCDgiAIfRnZ/dy+sb
 trlqMugAT2G6fi4gD6ev3VsW6yxZMpU4dek60cUxYUKUHKZLCcJJCnMDJKfmi49afSVP4Eii+lc
 RbFsI6hRmzN0tfMRFeQ==
X-Proofpoint-ORIG-GUID: uKBL67lCqLjX0kAVWqRnUJjBiqIWyj-Z
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c5f790 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GxBrWPNX935TnGObzP8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: uKBL67lCqLjX0kAVWqRnUJjBiqIWyj-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100188-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F6E133EC56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SoCCP node on Kaanapali QRD board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index da0e8f9091c3..6a7eb7f4050a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -781,6 +781,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.25.1


