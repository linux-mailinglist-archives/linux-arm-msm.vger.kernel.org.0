Return-Path: <linux-arm-msm+bounces-97841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 29yVG72Vt2kMTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:31:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BED294CCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 643B73004DBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3B4346A04;
	Mon, 16 Mar 2026 05:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j85pw2KT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YK3OEded"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21D23741
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639095; cv=none; b=I4M/2zTJ32CuJHPzRvdxn4gE13Z5Pjf65WCdGIEE6ETqvh77YLaIEgi31paWeeKuAa4s2U5e9/2e72KVWWgBJgVK+oQJ+VJmv+Rq+NXIhSznzBfcFiyPDw3pJERC/m9Exztg8cMl08+DQYaju5/M8gvGD7DSzlgFBH0XvMn0KZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639095; c=relaxed/simple;
	bh=OdrgWYBpsVnIMh/Rdvkx0gqk9AhhvjVO6QQyAyLEozw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jBWH5NRhyqDT8CqjAeWg+ML8CcYI8SSsmeGYkBFNnPjgj9iI9djLjxgDJAhQGKDd4lsJ6PVlYWxLY9MX6BJ3O6XCp/BMXXKfEKQL79xreW02ynakOIBakrKR0wU9GO63RkfV79pg/He7mjdRFjq76XVdCRgQGEg5iaH5m0GNGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j85pw2KT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YK3OEded; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FKv1gJ583288
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i3Oz43XEEAV2bXcomxm+Lj
	NAvy0OBlpbyo05bM4H3Hw=; b=j85pw2KTX0CYjybQCjA46MpE2GTtZh+soBbV83
	jQA1+O1yVCiHTjwTqA72h4SaEPYB8RQp19NDqU06Kv8GwUtW9XsQM8+62kpxDoxN
	hFu4c2ibKxGCXhkea9bPI6mT/ePuRyMzGNyYnQA46j1YeveoXkHzZXX8Ld1+hIaD
	iXNu+45RJgZWUEnEYFnknG7loNHwtGRUkOaGjhln4HH0+lBQwIxqa+oEcge4gYMU
	YROlyCY1SWGcrnAdng1w8W+XNmgTxhfKEd+CVq6prkAEwzFsA3T3ZBDvQjTiK3ul
	DlYEPyhnWfXaxIRYMg/N0Bt+fkTbdfD15EDfH7U1U/F715Gw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udm4qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:31:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aebfa0af7dso268846415ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 22:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773639092; x=1774243892; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3Oz43XEEAV2bXcomxm+LjNAvy0OBlpbyo05bM4H3Hw=;
        b=YK3OEdedPLIOoTHvP32tZBUoCA36MOEnvd7WhCUJBoI2Q9hndTIm/TUilJJbycknfd
         4EM31uK3QoM80AnGe+CUtB17Gqdf1DCF7G9x4QdTtvMbgRdqP5a6PIj+Q23fEVXWbh4g
         xNslrniiv4QbAG6+CjxZ7ZNVWIYJYdq1Rw/oUdypz9Ec9F63lhpxpBv5pfhWPOB1LIaZ
         jXWO5BybOkn4dL9n9SpOaoegqYVuDQcisd5P884cmFDq8+OYp7Yc6oUYjuKLbrwMnElM
         AP/BBvK5GKpGVYuh34FRXCnQqlv5Z27zZNBrTsZm2vqlkISNfalyaM9G8I7mYI0E16cA
         RZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773639092; x=1774243892;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3Oz43XEEAV2bXcomxm+LjNAvy0OBlpbyo05bM4H3Hw=;
        b=WwPvIw7z2+8vE67OXBmXbNOiySZMIvujzLNvCNYt8YrYZR1wIS+fEFWxYSAWnUTL3Z
         zCG/en1RQhjddIKvRLg4+tRoKrO9bF9nH3gNlicZx+/wTwIB/yCoI1TOPVYA62DAbkRs
         EKXKswQLbs7yycevhHjH5Uh+dkd94TqGaBU2xZwW/Fi0cloECRpBZ9qlubtDYaYflT9/
         jdh/KwB/FvyfVQ0+nFoBZeddoXWbPYVCOKjb5ctsfe99zdQQ2ae6nenRA31K1eXCq1uE
         bzqCNCehSevw+HyZyVbQ+Xfl1oERD4oRgtjO+zaOPHE+VBVaxV7huzhijLEie9CmZ1Oy
         Yw8Q==
X-Gm-Message-State: AOJu0YyF5G70dUrWCDkGkSvs7u1IjtpQz4WN5tFu83k/rFLt7u4ElL4b
	1nTpxhXJZX3Vzdmt1ZZU2xlpzVP12R0kv4av7nvHtrzaZ2o0xM4jb552uIMB0qtXl7ONQxcoZ0r
	PgZ50LN76eeD5OAVg3Mu5zZ6XweammrfXXh++uXDFFFRdrBVdgD06P4avVYjVvbgJOpcn
X-Gm-Gg: ATEYQzxysE/ZkDTwvuEhTjXDo3Xpq36hubzdwMrCgZV8e7n/W/LRqjf++ALkLp8ARon
	U4gra42WQExZNfTxX4DYG3OR0mjFZvUviLGoxlRsm+NF8O25Pw8TNiu4kejUJTEBoOku1o+ckuo
	NgjkR/Mz+GYDmJyxBQz4kg7+8PXdcvicvkdpmRZnPrHjN0QJ8XcDC9KRBbRpnwvCQzVm37d9Ktc
	XwVz6f2/GCxsGQNK9O2SuY9JfCGAvANm7fi1oJl48bOnthNk98u0njPiTeHJO60IV8xYbrwzm26
	JQiWcWSFDSCgu8i6Yb5A+14Qmpu9OH3Qp3WBrlC6UIJs6jB49Y/UkSQbG5x2aYEsfzVexWb+zLn
	tD6xamsmiiR3NPOUSP56immhk2rvgUppyRMhztBwWZW1tZg8pJK3SoS8ps0Hmqd203mpwG+D63Y
	2RnbAGeYmR
X-Received: by 2002:a17:903:124e:b0:2ae:abe9:b391 with SMTP id d9443c01a7336-2aecaa9515cmr137829635ad.24.1773639092268;
        Sun, 15 Mar 2026 22:31:32 -0700 (PDT)
X-Received: by 2002:a17:903:124e:b0:2ae:abe9:b391 with SMTP id d9443c01a7336-2aecaa9515cmr137829295ad.24.1773639091478;
        Sun, 15 Mar 2026 22:31:31 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05d95796asm5750875ad.52.2026.03.15.22.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:31:31 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:31:11 +0800
Subject: [PATCH] arm64: dts: qcom: remove the disabled replicator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-clean-up-failed-devices-v1-1-f22fc9b072ab@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+Vt2kC/x3MQQqAIBBA0avIrBtIpZCuEi1MxxoIE6UIpLsnL
 f/i/QqFMlOBSVTIdHPhM7aQnQC327gRsm8Nqldjr+WI7iAb8UoYLB/k0TfkqKA0JjitzDp4BU2
 nTIGf/zwv7/sB7VsQ22kAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773639088; l=2048;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OdrgWYBpsVnIMh/Rdvkx0gqk9AhhvjVO6QQyAyLEozw=;
 b=fE8Wz8EWrY2vQNu9Wu4mevdrgkWvDknwd8FFMuScQhZIQqCuWFBTdcQmJR6APUCyYCDF4o29X
 YYg6AMwSEhMDIR5z7gsatBJQO879mqurdV5BT2z0J5dWYLo17IuACiN
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b795b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tc_rCIf4_8PxeAFaAM0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: kaFDqOLHeoiGuVzJyK1d9ekx-4fCG3fi
X-Proofpoint-ORIG-GUID: kaFDqOLHeoiGuVzJyK1d9ekx-4fCG3fi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0MCBTYWx0ZWRfX5/Vu8/vwIfly
 aIXSn1kBKvNA5rxXNGSVy72IlcV3BDaM1q4WyFE1Gfw0+i58KJTF4xn9CCuaVzleiIOj7bN0asw
 FhpJ6a7c9nC+H/g0rj//gAe6zx3j/iRupnUN+h63IOLeC/dUPTCzXtr95YMOSz6jA7UMoSCl3E9
 7se6lcazjz2+naDlZZ8a7Poudnu0AseomuhuELQbNasmMDMcpFghBfp629lzkNjFN7t0DBuWrVb
 aQaNzBHBV9U6PXJ7B1bvqfNfSeCaxx1f36ryrwDpZnHI9LpzTzGTMNsRlUHskn7AlNbTjJXNYR8
 +FzskGQqjQKPcmX4bswJMUUmgx/2Nl/UEm+1MWHwqq/GR7PSrcdITiLZTu3VziHgCZbbcHzEDrJ
 MJZOdH1785sk9VP3xqSQs34IGaUqOFZfOMZfX/gwRYouTJMe6u/sXq3bExeqRKPyWb16/XbKHQZ
 GLGnIfwB8KsSIxEj1cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160040
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97841-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,604a000:email,0.0.0.7:email,683b000:email,0.0.0.6:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61BED294CCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the disabled device that blocks probing of the connected
replicator, as the replicator driver validates all connected
devices during probe.

kernel log:
[   18.540971] platform 6046000.replicator: deferred probe pending: (reason unknown)

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 41 -------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e0282a5f9a6a..1e2cfd040fe5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2263,14 +2263,6 @@ replicator0_out0: endpoint {
 						remote-endpoint = <&tmc_etr_in>;
 					};
 				};
-
-				port@1 {
-					reg = <1>;
-
-					replicator0_out1: endpoint {
-						remote-endpoint = <&replicator1_in>;
-					};
-				};
 			};
 		};
 
@@ -2317,31 +2309,6 @@ tmc_etr_in: endpoint {
 			};
 		};
 
-		replicator@604a000 {
-			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-			reg = <0x0 0x0604a000 0x0 0x1000>;
-
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-
-			in-ports {
-				port {
-					replicator1_in: endpoint {
-						remote-endpoint = <&replicator0_out1>;
-					};
-				};
-			};
-
-			out-ports {
-				port {
-					replicator1_out: endpoint {
-						remote-endpoint = <&funnel_swao_in6>;
-					};
-				};
-			};
-		};
-
 		cti@683b000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x0683b000 0x0 0x1000>;
@@ -2763,14 +2730,6 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@6 {
-					reg = <6>;
-
-					funnel_swao_in6: endpoint {
-						remote-endpoint = <&replicator1_out>;
-					};
-				};
-
 				port@7 {
 					reg = <7>;
 

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-clean-up-failed-devices-188fc328b5d2

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


