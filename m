Return-Path: <linux-arm-msm+bounces-114848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QYpLKlcSQmrbzgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:36:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F344A6D6600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:36:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oQdIQ08H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GFf5XS8i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114848-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114848-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3137F3026146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72089399CFC;
	Mon, 29 Jun 2026 06:34:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418972E7657
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:34:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782714888; cv=none; b=DiqgGVK74+D7ZxpvyrkzB7p3mRc/s28F/fzLOMuFUTVFDOM8zCFgC780FNSB6tEyx0RRmoHrvn+pZwtIFh61xHFbELlRhbTKHlX2xd2Y+9x+T5Eg8bJIaA0MCbzR12iMvSFXK/MP5ktBtnN40/lc+zm2EgGyRqN7a+H/t61Rf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782714888; c=relaxed/simple;
	bh=2oFbw+8auGzyjrhr2bja7oPmC0vDQx4B8uH4GD1Al6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UMtbmLDB5MxbiJi7O9woS0OsLheFcGsqn1oxLJwkA4itf+whtdqmF1Lw35fr3WRVgAr05t6VsVIlx8OA7BSyWwzYBQORNlbUI3zRXF0zSvABWKQKz2NDZEtDw1t2kWw3SCghvsh6Q6GD5NWtNt+BYqdwbZssvCT1/3FixEp/6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQdIQ08H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFf5XS8i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHve1737483
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3STUd/qc8x8VEwzfjqwKu
	hIP/hEmsUdoVSV1069ao0=; b=oQdIQ08HgaTJw/UoE1EMwA8x7V5pduKNoOhppR
	RHJTCEbk/OOt+aDrcMErZYL39ZiUQu5I7+tDHXyDjOQavxaKQn9Dd+NHRWjtCGKr
	G5kGXS1zndiQXMibgqhCzp3zUyOzhDqOKaq2NT+to43Ztn+ytS4WYR3E9sMb78j+
	59nJGFcsXULiTSL7XxxBykxUH+QKQ2aOhsxbybT9537gMhT+TKa0DqqUBPo4V93t
	vmNoBoYsi7q276MGMTD4aC/kdEVopOuqf1NoWmLVBDteCnBbblGN1MjlYSh3wGQK
	2KZiIl29lTvxcKk+sBLVm4DHCob+fcla8tYbB+HE7TVHcglA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmupq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:34:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84622d6102dso1096292b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782714886; x=1783319686; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3STUd/qc8x8VEwzfjqwKuhIP/hEmsUdoVSV1069ao0=;
        b=GFf5XS8ivkJ6bxAHSx3AIjw2bww6PAGudyCRcwLi6ZAxMD9ARywIKY1YuDsV2UVRi3
         G4+pY6Nz6c+i2M7sg63dOmoaKTGWjINZq4qo7BwQjEppigMxS/WKCqjwZC+JY3KloMHk
         bGR/6JY3kyHd7OFxxb9uabkssNXbmkuL9WwAR6VTOd2gBE2rhMoMgNY8QI0+QkaBApv7
         72TfLkOIf58cN8n7WY4x82ZbYusWaQLvE3uvFcIUMBPu9SljavF67rGRqHUReqyAeM6F
         1B2mAAovOsFx7NCchWUwo9xlDEWs2oCLKZr4XmoUr+N/pICKYrQPPp1OvH9jcxFcmxeR
         S+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782714886; x=1783319686;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3STUd/qc8x8VEwzfjqwKuhIP/hEmsUdoVSV1069ao0=;
        b=parCb23xJ3z2aW9WPog4mjySbr0DFqj2Ib3L0kPxOyFXJOUwVdpslV6xRDastSs1K/
         8GMx333sxwd4nHFOevnevwsyRp6aQCQaRdsu7T0YivF+eBPlcqNYrKonBtQoH51TtzeN
         DIsDc98NB5l4d1EqKQ8cmH2tS2Hq0qAOg7ouwQ+tTJ7ptAfonp+FGAwBAzkKBnM4jTU0
         f1o03pnvHmxAyVn1SE2DSxLiZo/cFTtJu+ZIxkbN7IF13KO0MkCATR8tOGrXXLEkzlVu
         mPwaG8JjbR9+qdXNwRUmmhi7cmxqDCVL9oQm4GLv928pJ5hxfvjHXna9vSSLVPgVUOvD
         ZKHA==
X-Forwarded-Encrypted: i=1; AHgh+RptiptQlIVMp9u5zIzarREQSBbDuJUYEEmjwYsa+O3JL5otGSztJlKpd1HeYpFeZRDcPPwD4NHl0hhOH6k9@vger.kernel.org
X-Gm-Message-State: AOJu0YynizzQUmiu1mJQM4D0U0X64nzzrlgoYp5PEw4156gYcfsO3bNx
	vkLFbm0+F+MxJUslEkwKIMJvzvnbZhzBfBioIUNON7g6o6mJMA/NJ2AD/fowPKn/7lDPWNfgalJ
	NTGwA6RNik6WtS8cvrafvdTWB9+c3nYI4gRCqK9Y1ytrNpUyZ5/phxosqG3n7iFBm9ONuxPQqHc
	B+
X-Gm-Gg: AfdE7cm46OKEHSNHe2wLcJ7nDcNEckOkcOm8axb51YZO0pA2hjhDnRL1HUsnKBw2Bqe
	Le1VBeWowoexOCsG5y+ASbDCSDoTWzmmsRi1IR9AVW9lPsBDsx4x/4uOLYzJoIauv7eEk5qcm6n
	5XSVQTZwR1v4xfRklg/Do4lptOJXgEJViGescHvoL6xCXJ6CILAtJjo135zqnQWOmm/XmqdoTV6
	Db2RrNRy+0x5uyjSEvjiddLM1s7oNocqJGJXfA6DNZpHgRapM3Tm6DdflytwhqWmNi2xibp5/02
	EadXujvHv9WrHWr0MBzCEUoDznQxyVq8PSw6w/1ckgC7xFpw2x7oQSvtpFZqyxANbsONXNylOkI
	ktDbfN7+XHKPa7UzpJP9w44kF6eBGANBU7nFk1hL1xKI=
X-Received: by 2002:a05:6a00:4b4b:b0:847:94bb:30db with SMTP id d2e1a72fcca58-84794bb38camr207686b3a.49.1782714885864;
        Sun, 28 Jun 2026 23:34:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4b:b0:847:94bb:30db with SMTP id d2e1a72fcca58-84794bb38camr207660b3a.49.1782714885233;
        Sun, 28 Jun 2026 23:34:45 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847849c842bsm1241380b3a.33.2026.06.28.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:34:44 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:04:38 +0530
Subject: [PATCH RESEND v3] arm64: dts: qcom: talos: Add memory-region for
 audio PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP0RQmoC/0WMsQ6CMBRFf4W82UdKgSpODrI66GgcXuhDmlCKL
 RATwr/b6OAdbnJucs8Kgb3hAMdkBc+LCcYNEfJdAk1Hw5PR6MgghVRCyQon6l1Az9ZN3DGNmLO
 IKUWmVAXxNnpuzfurvMO1vtWXMzzi3npnceo8019YyOInpFkbh0uOGVYsSZd6fyDJJxdC+pqpb
 5y1aSzYtg8z25tTswAAAA==
X-Change-ID: 20260629-talos-remoteheap-3e0000501669
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782714881; l=1824;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=2oFbw+8auGzyjrhr2bja7oPmC0vDQx4B8uH4GD1Al6E=;
 b=fMWLgcIBHl/3dFUs/u3x9wQ0EI1Oo74l24jl9yRZHELLx4YLS7B3mv1JbBCI2hVmcqRlPqQLE
 JmPk8ovx1tlAMPMwuX11l8OMmURAD+qn1SbFIeN/ZP4ghp6yIPsgGl1
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a421206 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uTjEaTnFuuof5b3oI8oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NCBTYWx0ZWRfX50YmuIbzIqPy
 /4FiRKzJ6oIXB4MwvwDH0RKZznjcRu91QBki4pgxfM9Tga1t2kfMzVhRp6qqmlmu506WWnk5KPD
 73xi426C17/IQ6EYkkqiYngIPKnSIcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NCBTYWx0ZWRfX4eDROm6mu3jx
 Td3ihTwzLOTfgF9wFWvRyMrSavqeV4QW1qVYANWKvuZN1NFXvRWL8VY9M2Rhz6/kXYhUfxXOPHo
 dZg1o6tkOoU7O3IMvcya6Ef/NuP3gu9rnU+VZirgs8Q2bTJmuDxTaKTaKwq3TPWz4PF4ETmmo31
 pnfIr17Xmtk5C9Xp3Pc/H05N0X0N35FsR6WHoE88/NO9NTkRJAvM5E896CIgOzs4yedWl2dGYcq
 OenjUGt10R8Yv0fDIYUbEhZ5dtmfC5kA17yj8RY+t+SirpbKdRVlK/b8W5O4altlL8qdzPF8Kgq
 DB5v88tGZ7K1V6ubxozAn8Mx0w4iSOS4fjR+1/drJV0QSMZ3/7ghcWmJpWg8jJBYUWhwdHtf+7Z
 QFhKWHAOC07oukeWoiD28z68l+FmSWNS1eK8gvQFfUx+2nmJPw0QTpdZ6Dlqh6ZPozyebMoRmbv
 nnH+GaUMYgyh/Y85Zvw==
X-Proofpoint-GUID: p7PIn7W52nQXAWS3JHnJzEtviLZfomyM
X-Proofpoint-ORIG-GUID: p7PIn7W52nQXAWS3JHnJzEtviLZfomyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114848-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F344A6D6600

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..d4e8cda993e6 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
@@ -677,6 +678,14 @@ pil_gpu_mem: pil-gpu@97715000 {
 			reg = <0x0 0x97715000 0x0 0x2000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -5195,6 +5204,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-talos-remoteheap-3e0000501669

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


