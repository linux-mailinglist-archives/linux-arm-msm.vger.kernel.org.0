Return-Path: <linux-arm-msm+bounces-114850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvQvOpkUQmpYzwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECD6D67BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:45:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=knPPBjpO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YNWG0lth;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114850-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114850-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2444C3041361
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2003E39B4A3;
	Mon, 29 Jun 2026 06:42:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238839A805
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715322; cv=none; b=LMWHXDp523PE/BGNXOwQ0UWrWQA+8hXmgGHaKOApMbFSb+o97v0hqcEWwsORZejOdnYYxxVtWGelHnrGEgNs/BMV6j2qVtIt2m7jGfoZpjQNPriH2fbUTgobjNpJvuDIPDo+9BnXKyu+ztWsAOW9+hUg+oLOYjkxjVDBT/fyOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715322; c=relaxed/simple;
	bh=HblyWdM57G6LtvJB9vyRpkt5hsqzVFrrLD0gb+bLj90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WB7i9JcRKkEiwLoF2Fahm2GAkUfhE8fYf3SF8dK6i96/7o/LfYOTge4EZj34aeGYX8Q2DwfEw21Itu/kfcriKha6Y8NUe3f5nkO/hXxOP+1kK8pgAxITun+3mMN5C2uxWz5affAPZuySobydV5jnaGT2OIRSsrYBFOePQr6cSmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knPPBjpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNWG0lth; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIQp1754415
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/FzBJm8LvBcNxbiI6ot1K6
	jgl9XRo/13LCyM4DPE3bo=; b=knPPBjpOSMyCvlgzzciHW9HQ21NxxVCCN15Bom
	NXWBVXUsma7OCXO3FLMeeQexCxZgqI/bwWL5ebDgN0nyR1kaRRFyc9esdDC5m1Ii
	1cSwd8w15tID1b2MWeMG/nkx2rVwr5EE4P/bRIMOhBg0+vK+IycQ1vlzODViT5mb
	mLuchUBv2emQmh3bR0qjF0tpXWEkt7uAMTGtoMZ7UAS/31uwPUjstkjcs/EOvei/
	3AIU78GsxmOfxa8GUl0aIC3M2djFld2DBS7ra63BkVPcYHqwNvmXRay8029tvo9Q
	DoGfztRsHeyvaK48lfbiY9fZG1Xw2EHnOQQeQ5KuMaRa4UAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2733541a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:41:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845df469a26so2234135b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715319; x=1783320119; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FzBJm8LvBcNxbiI6ot1K6jgl9XRo/13LCyM4DPE3bo=;
        b=YNWG0lthngHV3cboLLLsqgRi8GQSokVs5SCISsYbnENcMZym8Z3esbn+AJlOqr0x+9
         whh+0d56YgK/JBhLdF3hZZ1d+V5z31j6omU06vALOPtDAna42iHM7bW1iZ4etr8PlNtw
         gVJZS4uPrYLBRsjbWV2yxBQTI/989A6VfxYqc4z/CFs0xBhBVWD8iJDph0p/2/Izc9ku
         rF7Zl9PK14BorYDrqu9SWr5FlqOw1znGRfeDpdahvd9KNlNxStclv0IrpiTQ4LdTsXiU
         GJu2/7VmQ63qZzDNvDhp3Vu2mp9xZS6oeE4vzD109qwy05CZolLj7vjkySEBfoVfXnJe
         p1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715319; x=1783320119;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FzBJm8LvBcNxbiI6ot1K6jgl9XRo/13LCyM4DPE3bo=;
        b=e37HzCKtw//ou4i6DU2Htf2h3gjxn2gzipouu6SaTv5R+/pHJRDAcXgG2XvLhbS9zc
         cqaVyd2SPNnG0YBD8ELPkiXcgfuDTSmhNXW8Ufn4G2629uptL0vNfcWJsqnfQJzCAmzV
         ZUPIterfnJe8cjkTZ8LA2Tf/ZiHqcUaOQZIz9qlYunUCh7aJXBmuui14UX8vuSKHe4aP
         WvolnVSFJLJ8YwBekCqzi8+4Cx/VPEGgFCTt63efGO4GlHo46z0auGzCbI6U5WLbMihu
         +JtHwpbRcPGZDkyE/qf3vzwuzhwWUXgIMWOrcwzJXRam44dIUjSlsO5BsX7HxnLPjMnk
         zojA==
X-Forwarded-Encrypted: i=1; AHgh+RqEH1Nlsn8QzCM6rcD4X4jBmYOUkmHqCeNaG5vqU2ggjw8G4P2+dV8DecdyXjoGnlHpdgywEcs8cTyMpa0X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6791qlQnGp1gKNcjdsH5bdEh8iEETFSDS3q7Ve1uSQtb2avvG
	s+ZDxxdzQEF9nIF6O0AYBnaCS5UEbeUGLUjPAnphpT7BKijVN08DBlslmoCIwvPqedBSUiY2JiW
	B0+/Gd43vrqrGs7tjB1FqrPPFJGBtVNSxeOuVphUnt1iv5/zYAaTaqFu8lwg/1Kze4Qe9
X-Gm-Gg: AfdE7cmR4ruFtEsRzsNNthKcLOhUu/Q9eovr1hWXi8mCysVoJ0GyCUDxXtY3soSlTbj
	zHeXszlXN4TR0LwqCa3U2nuky/UFJPQ99yWSRL4E0KiCl/vYQrvOhhYa8tvEIuscg/E03vEhx0j
	wPHA1NObnEFP18bSyYCQqUjKg+BdPyzbcYtDYu5z+qlIvdzOelIvK4pzawE8jR7kD6sy20c4Iyb
	sIWHnP+Pt9o6HYDti6iKkCOP1897yJH+JI24WLH2fW0G4Qdm0qMHP4B+L+ZxVsv4nK5ry973F5/
	ICGYyRHXZM+tFkZ7CD+n66U53a7CJRy6kQxANVSNVYJRBiCNdm5o8DX979uI5lW5j9r33S7fKIE
	eDvKQxxmrl/os1qNdahsY1CkESmmk4Gz1NgEbfYKXl9I=
X-Received: by 2002:a05:6a00:340e:b0:845:c6c3:5e79 with SMTP id d2e1a72fcca58-845c6c365b2mr10788867b3a.40.1782715318637;
        Sun, 28 Jun 2026 23:41:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:340e:b0:845:c6c3:5e79 with SMTP id d2e1a72fcca58-845c6c365b2mr10788859b3a.40.1782715318205;
        Sun, 28 Jun 2026 23:41:58 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8477cf5a5acsm1862153b3a.13.2026.06.28.23.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:41:57 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:11:52 +0530
Subject: [PATCH RESEND] arm64: dts: qcom: hamoa: add audio PD remote heap
 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-hamoa-remoteheap-v1-1-aa868b7a6e65@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK8TQmoC/0WMsQ6CMBRFf4W82UdoA5U6OcjqoKNxeIFXaWIpt
 kBMCP9uo4PLTc5NzlkhcrAc4ZCtEHix0fohgdhl0PY0PBhtlxhkIVWhpMaenCcM7PzEPdOIRrP
 RnaiKqq0gaWNgY9/f5A0uzbU5n+CefhO8w6kPTP9gKepfkObOelwECiQta6XMvixJHX2M+WumZ
 +udy9PAtn0A3gyuRLMAAAA=
X-Change-ID: 20260629-hamoa-remoteheap-f9ef9d1505c5
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715314; l=1504;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=HblyWdM57G6LtvJB9vyRpkt5hsqzVFrrLD0gb+bLj90=;
 b=MOtfWel6eCfehsBHXNMlczjiGxpV6oeYcbcl1WVeW/xCUSSSaFXkLa8a4edgR2/tv2T5gGV36
 glX2HD+NNmvAzyAGox6/SBsJN7gCEs7rM7LR7B0O79NSwlwBu6ZiRq+
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a4213b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sbOAbGusH4yeja24kEkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QqFZnGqjzFdE-GMSN7MC9ZpXkWcWIjwo
X-Proofpoint-ORIG-GUID: QqFZnGqjzFdE-GMSN7MC9ZpXkWcWIjwo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX0M0NsXawo/iV
 LH7Z/Lp5yhPO9ng+Zwfqb3ztFQ9z8/xt282fGV4PENfY6h6tP5BEZgCqoCbdFOMOsmDiUk3Cj/D
 ih3qTsCMc1aqIZOh2ekY3/Lt9WGDPF9XWfZ2EQRpv41T6h/ugkdnZqm390bkmUc+/73Z4gZB2Xu
 vcLIClDp8JGeWPM36Fhi9hSKDE2dJnPU+ZTydY5W/8yqIZ+Rn1OfDPE2y7IvUKbI3An/IXXihK7
 QQCWIDlCsplqgS5ZOfeWdGJ8frH/JMPxlj5sdd96Q/wdddpfxqnEx8+A8Aq4ahS6zfcDHT7/aoW
 dDk0FH+93OsDfdcSwkBQkfg7OfnZIhGpqPBZEh+EylPNCVp3EN+Pq5WA4T++DwGozVFLRi8BoVQ
 LfZHOXBKdPjujWHQv9Pu2kraSTi5Bq8xY50bHQj1A3l1pb0289ZZ5dX6tgdtM6b0tegISvCwojI
 bqkcfhLciBfIsCozu/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX7O2yYb8tFoHK
 XDdBcn634Zt6SVEfiQYXsVsvAuU0qjBwCIIhuwyrEe5z4wtrr1AePrRqlCD/NThNW/c1Bsz+sut
 Re5U9/IdXxc9Auq1TI+tDlBUKxAxUog=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114850-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FECD6D67BA

Reference the reserved memory region for audio PD dynamic loading
and remote heap requirements. Add the required VMID list for memory
ownership transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..a0f42d27372a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -4371,6 +4372,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-hamoa-remoteheap-f9ef9d1505c5

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


