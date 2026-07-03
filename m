Return-Path: <linux-arm-msm+bounces-116166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fArjGpdHR2oyVQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA76FEB1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D8J4vkij;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NcnMnfjt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EEFF3008E11
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0400C35839E;
	Fri,  3 Jul 2026 05:24:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCF73546F6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:24:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056250; cv=none; b=CLh7iSo9M09nCmVUsxQClEcCn1f+HMtR7KC7kOGtmbHDieJVnnqb0Nj6oPEjpS+/F0wbgyBE1SCKL41zXVIEL46dqUyMuTIBKYT8LzeEZDXobGHqXEp7X1QSa5TeveU05oUUsf4b4+ECN90uqP+4kyYOMKC5pqji+rx7eVlfY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056250; c=relaxed/simple;
	bh=PHavePp1mOlH1DjAoM7VWVvhRlabqCbza2ruxK0s7pY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L8ptG2Duf23Z2yq6aZBl3DCyicoZqVKSn7GC6CmcwhTQgt4p+P0pTSHSxpUMQ9vgi6Bptwy2cwCcWRvoqPh+97pB6iAApHMUFGd/Gp5cladde6Ce/5DCCI69F3gbND2P3Q0o3mmO/dSKIc2jaZTkE2HCnf3NhdDvO1SpBiyMn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8J4vkij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcnMnfjt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342w9X2838514
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5jOrsQu3BA3BQzqCjt4lM5
	wYB5ifvp/GJxL0JPl091g=; b=D8J4vkij3IkNjuWIgom6p2y6tRIQ33U2r6wc1Z
	mIx+RdK9ZGJewayI2O5YTQvNXUgETkqBKYrSTr1z9NQlJfF7xedzPydbvuB/YT+O
	T3NX55Ydt8875RXInsdJVOCvsIlZ1NF+5AQK+cZwWAX6c1Ae+EGE6SqAzxc8Ncr3
	Nne+P+L7MOdV2aIS5lwJTcPpdrTDd9qbyxyMHwp00lDgWLVwHAi/W4PEAGBjQQ4q
	zMdksbvDJ7krAUNzO98F0y/tiyf11esRQRWY/T7cVI1x+gjnqoSBjr8SxXfolNWt
	M2I3r+/4bZv0mMy7a7Et6kBDYUBCeaXL9UyOBGuAfuoaRVuQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwvhp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:24:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fe90ee192so384581a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783056242; x=1783661042; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jOrsQu3BA3BQzqCjt4lM5wYB5ifvp/GJxL0JPl091g=;
        b=NcnMnfjt+cy+Lqe0lGiyuPjhoDk217DF7P4fXGb2cmM7EAh9LsBcNkB76DdpzBtfSz
         oPLjH0ubkw4MHWFUGcqEWjbUenIZ40yRUaF0jQ23PfhUgWYzrCbzhDi4GE7TzJZ/2T55
         B5ctUuinnXOYd+hdF1+S9M99vS2TONEw2eUMxYKZ6Pm2e65tDpNZbMK5ZNgHadPvVQKU
         K+/0UO4fHHWQ3HXIpskSI/T/lGPxCHY1cxgoAnz4Xb0kf5NBtDeXeHQxHjCLQgqRGg3d
         PqHDE4HKLyU4q19t7dUs6yon8XY2+NU4P6FGsSOQOPutG7YE606EGmZHj1hXYQFerIgz
         ncRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783056242; x=1783661042;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jOrsQu3BA3BQzqCjt4lM5wYB5ifvp/GJxL0JPl091g=;
        b=aeu9H6sufHj5i6mmmxVaxF/MvtJXn3TeZ1U5n1Ik+1JD0CrLzqMSL4YLFeyjaKnEBL
         pssNnvnbGRIp5fADfnKgxBtYoU3Flx5LhmNfXFa7OpNwzn90+5uTqoyF7/WeJ13gfs6t
         NSEjSRQlnmkXloUN1fm/LqbDmR13eTFJImtNAi/28tSSAtyHQ5hZ/K/oFxVRuNZd5dSs
         Rc7/Y3YG2kTj1eVy4l8WBx+gFJGYLpAxoj4XvvO9ULDK43ttkmrk8f1Wz5EpkFBamtv5
         +2QlCrBqx4m26oqzV5Gs3auZTgmlyp1jW1cuJUmHDmqD6p1IcDPGctz2uuO17poEBRn1
         flnA==
X-Gm-Message-State: AOJu0YyV0QkWJGqZEdkEZoMFYgI8mi8BaqKYNUv0nf14Vz2vVayqwWVM
	kS82Gasd/Ae8Npo9tJ9vuxHmJbVVmqBcQh62CMjK7H6qCQZiGyQyuL1ql/gVY3dpVwbs0NeRAcg
	OYFCwL3i5GaLVaFqkh6mZXXkuloHwlWfEcYoCvf0CsFw4698TF6AIYT+J0kMYQit3r6iY
X-Gm-Gg: AfdE7cl4Dfp8VMRmxkmcjYkVKlxmhSlyjtxBrGfJXIBGXK+JxNi+Kd6id7P8/fbdY4w
	AMCx+pEDpLCsVgKGEIYq3QVtXLyVzYNmcXGRsw8wOoGeDrE62MQlkZ8Uh838aMUBN7w5J+ViXsz
	pR2EjuaxyoYjL5DdsENIR6kU8Ce2tYpWFYfJIBbN1X1xG9UAE0LffDR0Rh4hWcFwwlRVuevLJX0
	aL4ipi0+oyBVATGg5woDpLOStyjAevuSz/hmSJ29MNh8J55yJ2XLRIfF4CHLBPc1xBxuRPWYi2E
	xXFoxkxIhyUm/XExfqSJQZJJCqZaj/5/OrJGTsNDOxwSne857QbAsG0I7KH70CfiAKFsmkZSNjr
	FRs2Hz66IgDv33SuhteKXSdPODulMPSrEqGSu/U8E
X-Received: by 2002:a17:90b:58ce:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-3811b664f25mr2425916a91.6.1783056242226;
        Thu, 02 Jul 2026 22:24:02 -0700 (PDT)
X-Received: by 2002:a17:90b:58ce:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-3811b664f25mr2425886a91.6.1783056241712;
        Thu, 02 Jul 2026 22:24:01 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f1cbfc285sm7219105eec.5.2026.07.02.22.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:24:01 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:53:39 +0530
Subject: [PATCH] arm64: dts: qcom: monaco: Add passive polling-delay for
 gpuss thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFpHR2oC/x3MQQqAIBBA0avErBPMpKirREhMkw2IiVIU4d2Tl
 m/x/wuJIlOCsXoh0sWJD1/Q1BXgvnhLgtdiUFJ1spetsOE04XCOvTUrueURA0rstGr0gAilC5E
 2vv/nNOf8Af43+WhjAAAA
X-Change-ID: 20260703-gpu_polling_delay-9c0c642149cc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783056238; l=1058;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=PHavePp1mOlH1DjAoM7VWVvhRlabqCbza2ruxK0s7pY=;
 b=LPtdoaH0Do8u4M1o86/COVBms7TThDLR+LHdv6ruZxiCnTtj8Y4OY2zUs57Xair5BDk3ajDIA
 d4zq1KaUIa9BitEehN9FIGBOi0xsuaHG3m334It0WwFi6BYcc9C4o4W
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: bwByBThM0O2jnfAlkK0utOcmQWeSBilP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0OCBTYWx0ZWRfXwZhHGprqqOTj
 VMJoWnmTDplesHJIFs1qXCC2PeeOU0zATuaXFoIVFni+Z5Q5kwV+1HG322mh/JM/Um1zH2vUrPx
 y0kbVFfZDNGHa+CKFNb0Gu0aRJ5YAbbnndU+QIsoV1dwz/XgLfE0a9SV1U2qFYAmv4Qcp7eENYU
 /J7G3Yv9ycVAvj53B2uNARL6OCM0uMkejtbNhT4NOQAnemZpYYYVswPWGMY3tV1KZ5PliVUrb4o
 xvkW5B6O/7VjaiyCmYiMKGVG6Qiqz3OHl4DaQvY6TpQJJ/u7mE0++xdzkncvQa7xmDYtdrXZM3k
 ttwdYvcuuCePPlLtrQMfVCcGPbyITuGunE0i5AQGfN8mORwitlNALmpc9mObmm3sxRsmsVZgM5U
 1OV4BEX7NTMrVMOdW8O9euChOtIxA/tyqeQiBtoT4S5zrq8f1+DLaapb5Vl2amt9N3sp7OAboLF
 o0V+RlvEN3lKcSY7AlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0OCBTYWx0ZWRfX3ZgUHhoUU8fZ
 VTSe6Z4oXUV8bYxlRwLh633AQBCCjWER3lYjRAGslcLUmu0plmXlTY8pn+nWfYfq2ozNwsvPMUr
 3j5eqKZAXCkVeNRlrrCTCljElqvouT8=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a474772 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EzTgQT2ADBj4VUy-sZYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: bwByBThM0O2jnfAlkK0utOcmQWeSBilP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116166-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FA76FEB1F

Introduce a passive polling delay to ensure more than one "passive"
thermal point is considered when throttling the GPU thermal zones.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..a3943b6f299d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7895,6 +7895,7 @@ cpu-critical {
 
 		gpuss-0-thermal {
 			thermal-sensors = <&tsens0 5>;
+			polling-delay-passive = <10>;
 
 			trips {
 				gpuss0_alert0: trip-point0 {
@@ -8028,6 +8029,7 @@ cpu-critical {
 
 		gpuss-1-thermal {
 			thermal-sensors = <&tsens1 5>;
+			polling-delay-passive = <10>;
 
 			trips {
 				gpuss1_alert0: trip-point0 {

---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260703-gpu_polling_delay-9c0c642149cc

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


