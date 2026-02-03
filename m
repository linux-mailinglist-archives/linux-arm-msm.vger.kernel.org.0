Return-Path: <linux-arm-msm+bounces-91605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG8DIHKZgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:45:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4DD56D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7902A3094CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8056C37AA92;
	Tue,  3 Feb 2026 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AC2qstMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDwOplm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF236C5B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100369; cv=none; b=VkyGiKNXTyt1Ym4tcGc1sTmE0i/nGDkCPdDp+VXPscfXovfZQszpuTJ3FAN28QcLMaPPpw8HU6EbOgwY2SKEy3eJbHT1QV7ZJONjb65sWHAIiwwuA0in+z0smX8pOp7lvu2NxoJ+tBLHgJL1wxmijWmSxTrKZJ4x41667YoEdt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100369; c=relaxed/simple;
	bh=kICWRRDeic3FzjUYfk6wZA50Xhw23GGYToPtLvwwX70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jroVAI9KFHxyQ6Hgk0A1PuDsgyDvdQMDZhw/El0bUGfGwIasR3ifoZmdRajZtk/dlgvEJVOtQAnvydoeXjOQJzTMzq5DICxGlFsG/ozDqZ4tQ0qFAFVSu92+DffN6DmiSFxdO5feDizuPVgqOYw8K3f4ZqYtAy50YdUNJghCRCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AC2qstMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDwOplm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6133I5Uk933184
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N2oBlPbjkzULaEw9PhLk74w0izpOPSVkdcW
	C0nfRP94=; b=AC2qstMiIzvSzflLO2crl7lLLSEoqUBD9jUqy11eDdCiYdgKMAt
	iv8Rr1dGziHMCuCNazC2pST5+MlV1bqvSDGCklw7mo6GfyYqnKSltG4tg0qjspzi
	5EoRQSG3WYYrpXgXYeCVrORSzh7Od+V9SjyphGbH09JhKvEKBeWBBdNnEVPeOLT/
	1UL5wlL9Anekh2mCNx43+cOXtlD1CJP6go0FF9Of8FT2p9UL50t4PD69qKeJjI37
	5YvmqFNpXg6DctAkJxsmziV+Ftg5BcoSLNDVqpqFKUcrRFlEtkoW49aI04ogypoT
	XKh55cicP6BPpxcj1IAPXA8t68P/GNaDYFQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu0gum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:32:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b74766fae7so6252015eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770100367; x=1770705167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2oBlPbjkzULaEw9PhLk74w0izpOPSVkdcWC0nfRP94=;
        b=QDwOplm1ZFkceVGqsN+0cfPHEmjQL7EvJlXI415RQ2/mhSlQN+RLpwCDZFZio8kvQP
         ataADpo8iVEvxEKQ1BWnj00omQ5kK9CFg7M0Owuogp9ikHSypMXA2q+OF3Fd0i0+ICvS
         dDw3GdCyxjBfGZ5OJ10znVjO83VZZAkvUtfhgXPWaoVYSNNccVCEH4uoBuuuJ5OVBhfY
         sm6jo6kB3172ycUeJX8G7OLa2IWnjjeL7UYbXe45XR++EZ0+KSDjjTKUSPRKFMLPH5pz
         SKKASxWx3RuMB95OTi+dhs3foHMFhpuRgbPtHNxJ0zhVcaqw7iJoIu0L7/dELUxO1hUs
         zMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770100367; x=1770705167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2oBlPbjkzULaEw9PhLk74w0izpOPSVkdcWC0nfRP94=;
        b=CQtLU7TShWXnWwFLo6tFnbRmHQMcm+C3vTPiHMC0qo4F8g8UvNQlrpdkrC+3spGKCG
         MuqbTY6xV8MEV2MI1NHTRWgIprcdVf4ufni1SaWxY3a2VATSIvuURCQ4BAR9vv6dyeFk
         wUcUBEm9Q7ItGrkzTV8UIjoW511ECAdly0YnFlfhsZTEUua/Y2L7/toVJFUoOELSuBn9
         kIjD/Hdhv/gSt2lwivLRpVAxtElRUPU+l8tefqyoKPgo/cvkfwEhFPNqR3QJxweTikHP
         3gV1UnKKDfuWSjsrSEN8e4F2Zikv/ZUWNLA2Lu5pfXchm0ayMOWZ9IAUaYo5nfC5VsJ9
         nV2w==
X-Gm-Message-State: AOJu0YxkqOqnk/Hr0tcn+GQjV+UuWDfMqZVGDBriBwPFa43a82UBVLZc
	L15wje6Tp0NO3zhY2v0z+lGkNb2ARr/u3i9cUOCfQBEfJChueq7qAI9pVDdF3V/Q7hGSoEG94W3
	dnsuK3XEuLCt1ZP03obFU9g/alkKnzickh5ZsVq5opQj8Tfwwl07Wf2vktW+datNS+ru2
X-Gm-Gg: AZuq6aLDgOurNY3Y0Y/RHdALSNnZ4za/rMISff/9VSsb7NWz4nnAkRiHTHS450wlso+
	Zkpm0JGh9NsDVnU2dN0odRDeI+TM+XAqF3f8CGce7ufWntUhG2Y4rAISgy2HxT9NeqmOV6qLfor
	RHZfa+8PUjH4/lExUaFrPTHdEh1Y84ftLChBAhlL52myXY87XkkgDoeEuBpAjz8QGHl5eQWY+QR
	ZgPatTS/Pcr9CJb+Mhc8b+7CpZqoSRUtDbBaHbMFmKdSeaeR5UTXkyL5Ry9/1nss2qERIJ6EJhi
	NAW07bWR1e3466fvtIN+NiPJKJMk/0hsDa9m+Zk7BAMIvqCEMq/3AusEJIUicR31En1W9cH1AQi
	jIa8WjmHJ7GXtrdy6Hu+1txYZ0YX+FQNnMcq8wpHx6NZj89/u2GQK8Vo=
X-Received: by 2002:a05:7300:f193:b0:2ab:ca55:89c8 with SMTP id 5a478bee46e88-2b7c895fed9mr6525199eec.43.1770100366589;
        Mon, 02 Feb 2026 22:32:46 -0800 (PST)
X-Received: by 2002:a05:7300:f193:b0:2ab:ca55:89c8 with SMTP id 5a478bee46e88-2b7c895fed9mr6525184eec.43.1770100366009;
        Mon, 02 Feb 2026 22:32:46 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16eab72sm20957408eec.8.2026.02.02.22.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:32:45 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees
Date: Mon,  2 Feb 2026 22:32:44 -0800
Message-ID: <20260203063244.1498699-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MCBTYWx0ZWRfX4RQd7CJEP1mF
 btJwAvDMnYsKIBlpGWSm59DzOTbXehrZQb5PG9NmqBIxuHda8hViD6ocZMC67KpK/BYla/6oVaC
 eDqezATv7pyPJZES0+GQ6K42QUFqEI0PYvgnY6yS/lJJaohyE3rf7BtQ8N3HcTzkUMvcQP+fstz
 LyPNt27dk3UX5f0rn8U6M8lDvuLAZJMxfrqMxtqIjx57kN3ftiY85Ezt6UM7TYN8CEJ5QG67S6K
 izN49hDIFzrEmactPrjjNnF3/H5XpSqpivDzJZcBvO0jjqMpMH2QQfMy/4MTJu6bx49uTfjKRIr
 XufPRaR+2uWf1L/X+9Q5xZL2eql8e0qAbwbhNf4AjjuBDf4EbtV3uHsikREt2rtIU1orzw0a+sJ
 lOr2IEdAxo6QQU8vOCOQMNPLJS5YGLC65SE2TpfbogmxC8z31xgMvlhUN/jJZUt+QPijsFUdHzj
 O04aYECvECgeytFbcxg==
X-Proofpoint-ORIG-GUID: GskvdrXSo4GmAVM0rYdCaZ55ZLpLubmw
X-Proofpoint-GUID: GskvdrXSo4GmAVM0rYdCaZ55ZLpLubmw
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981968f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GxtIMRurDqL_IDABb0sA:9 a=eSe6kog-UzkA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECC4DD56D4
X-Rspamd-Action: no action

All the existing variants Hamoa boards are using Gunyah hypervisor
which means that, so far, Linux-based OS could only boot in EL1 on
those devices. However, it is possible for us to boot Linux at EL2
on these devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add remoteproc IOMMUS to the EL2 device trees to generate the
corresponding -el2.dtb files.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v3:
- Modify the subject title
- Link to v2 : https://lore.kernel.org/all/20260202055436.818098-1-xin.liu@oss.qualcomm.com/

Changes in v2:
- Fix the adsp iommus mask
- Link to v1 : https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 175679be01eb..ee006742d6f3 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -52,6 +52,14 @@ &pcie_smmu {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x80>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};
+
 /*
  * The "SBSA watchdog" is implemented in software in Gunyah
  * and can't be used when running in EL2.
-- 
2.43.0


