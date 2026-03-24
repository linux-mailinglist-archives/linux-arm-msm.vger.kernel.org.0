Return-Path: <linux-arm-msm+bounces-99697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNeHFUSxwmmRkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:44:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BD318464
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4B3304B8E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE754070E8;
	Tue, 24 Mar 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nw3XoQE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwSMIqkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D740626F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366196; cv=none; b=VcU/t2pa8DM+yuVUNZG2miaMbddUDGL8iS1Wr602ugdsfRcjSLi3JtOcDG+ejU9mXyJAqmSTYdmT4LvrYdo0YEyEheQRLubAqhN0yOG3VVGB6Euep8sHKycjxwoz7Hq9hjqcQobvdHoUcUWK0R4Z2dTF28sBaeoxT3LWKk7f2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366196; c=relaxed/simple;
	bh=Y4z/NOxoMOA+uoK+Mdtn8e/Ss4Ul6SrWeTnGOfO7grQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHHpbJtevKDrGabEXVVCULIincLdccAEoxIl02VfH5J+iJxneCIjuKdO2lGz4lhv64MxSVkPvN9P1IK+NvjQJrUi0a9flGozkJsaO5D5z3Yq7NdQvvTLAxQcf+72+afEYaEp9R8wVu8xXQSv/HOSQpueoi/zfYUmZUlwpu+3yPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nw3XoQE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwSMIqkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA79xu3903942
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNH6+q+/5IqFBWaPQfLwdi9ZOrTXVnnc7HP2Fh+Ytwk=; b=nw3XoQE2BN/zhhu7
	pZyMvIdIKYMM9CeDKx7zXK1Z6h8BxnLX/PM8W4+igEYQPqCChzPz4dKWavoar3Be
	NgqtJxhPo6/uPCwYKfzD7/CrHquLlUx3XFCkyOvM75NpUbGSJjmmpW2RUUg3dsfy
	zTERWNSyvku7bpwIUcY93WkufPXTAOmCk6vBV6GA+HaSF8vQvCNZel9IBYSpb/Hf
	TQMxeJwrsi3IzL+qpqrCYvKP65erL1cd5haM3Vv682PKYy0spoHj1wXxKuVJI7Ce
	ujwX8dbZ5YTU319jFh9xFNDZTQfXh1sd9P5a81nhKndq7MguZt6qEruirgL7AQ04
	aF4VFQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0jm38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60270015488so27826203137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774366192; x=1774970992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNH6+q+/5IqFBWaPQfLwdi9ZOrTXVnnc7HP2Fh+Ytwk=;
        b=kwSMIqkpxyNrQVmxfJwhU3HmKhxDlEQswgBwQfLxV/x330XOgHsz+J0+VCThtXRphx
         NZuj0BrQB+E4NKtnXpSP3GMquT2vjIqM5QB1Mu+iXYuR0g/Tl4DJ0AJo1N87giROMKOn
         6noEH39F9D4fHya5ZlRnxMlTVSue1llh6oqsgochC2TN0PGXDo8t3ECEJhF0V2E5wOOh
         SBIceRJ8xeBAm3kzywoDUl1wRrlqRw+HFespzLt6GAqY2mFDiaw0EjhyCJWpKr/6mFNJ
         qVeo+fK1UcsUzS94PZrC+uJa56DT4FdmjP5P8QwDNkO9NhRemn0pjjZMabIILFw9+BFD
         WoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366192; x=1774970992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNH6+q+/5IqFBWaPQfLwdi9ZOrTXVnnc7HP2Fh+Ytwk=;
        b=mdicdXK/ECZ9O/q4pYc6EZl6jTMz6UpZetd77l5r9FkM16PAmHYiEUtNczBy2BCQW2
         Pr+6vL9xmehyzqDbOv/W5MjOmTLuxYR5eHhwdriTRGrCTTdGFGeivr/woG8ipDXqA1tM
         nNpYQ3jL8r1ehARaanpSlb2pvscgBXqzSYVq4JXTpQtYjbgj8wcuyctC/xLBCgV6EdLQ
         VL4Qg7dp9ml36Ri3h94fFRCNEaDLaex/gsMm0CUrk2iOZZN0M0/tEUWF76l7wY7VrxWg
         xoBFxhNWODyj8T9JVWCrGNgL5AXahzUZsbhZGpz5PxXppxKnlHfhHMQM2v53YGFlYhny
         ZMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU0NwUaOXEWfNjqfW1sD0aUpQmOWqVWAl0owjSsDjQE3YIRK2Ch3t9aYr94wBXyISb58Ad8ltWbup6cx/s@vger.kernel.org
X-Gm-Message-State: AOJu0YwRCikrzTVzCerQGqS5cosjOCJq2GQujSl0DItTIOX5NdwSV578
	eSQlsXh2t0MGAa7cJD5Rj6k5ZofploYFRAnh27NQpe29C5Gh1GsKgglBaZ3Zoj5+4drgZxrAb/o
	5dgLeH4yzU/uczSx34tPmXc0ChcUjdOfXauaO+EtoUMign2KNZxwyevdFtwLnaK/w/KK1
X-Gm-Gg: ATEYQzzsq4m+eYz05nXBqJpM33PNj6zcST/ACqzKY3vO5cY8C1njTNjAa2Xz/XJ7BX4
	bZGBTFdYGMAx906WKfwNnQYVv2afh1rtvXc5D4EgvGQ0l+/rVMSM3k/4U/pJvb7Cu6zMprBtYJM
	YA0fHQBGhkDMeFBVQNmzLGzQPAvJ6dNaC3e3wGOxL5aldEWKqhtaig7v0i92JbX8MrhBK3mN1S4
	xT2Fptf1wi5lhLj3djzVlw+8ol/xTqR48rC0iY6fOX+XhpBUs10ekHht1Ig22G9hlhqNXShR4H8
	h33Km6+jJ6zzF2ejjq+t0vPl3gBcu4iRxm4zQPMBkg36zJJ/mgyrHMk7kkVnAZV7AjfVc/z6vo9
	fYGulufH09/tTLq1As29NmzwXDFI=
X-Received: by 2002:a05:6102:8547:20b0:602:9b21:eef3 with SMTP id ada2fe7eead31-60387318892mr125176137.27.1774366192171;
        Tue, 24 Mar 2026 08:29:52 -0700 (PDT)
X-Received: by 2002:a05:6102:8547:20b0:602:9b21:eef3 with SMTP id ada2fe7eead31-60387318892mr125160137.27.1774366191460;
        Tue, 24 Mar 2026 08:29:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm36943385e9.2.2026.03.24.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:29:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:29:41 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-eliza-base-dt-fixes-v3-1-3a4a03e72f8f@oss.qualcomm.com>
References: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
In-Reply-To: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4z/NOxoMOA+uoK+Mdtn8e/Ss4Ul6SrWeTnGOfO7grQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwq3oznSSv6z48Nwttl4YkcKgexTjEPpHpx40K
 Pfjn00ye/eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKt6AAKCRAbX0TJAJUV
 VuX5D/9ZMzPdorMDPZHrmB0F9p7IDVTru/Aq1YvObBca/lvZ64sw3najmplnwgc09IfXDq0W++7
 Eg+cKUhOws53DCj+3gJBoOL1Fc6GBrAxUQ5IgsR3H+WnvRBM2o4YSEaMMr99/wka97m6B5wYkwx
 jZzYToJ8FHRPK0h87SkwaZhYfO3tAwjUoehUojsbb6xxlLvN+VmGO0Hw0hzWfd6V9MmkgaUQK6I
 bhPQaWeopxnoOM9y0DzqqDR1CMbPIcAmYkZFFXmlvw97JBV7+lbMgssp6waBIhWZKoUF4m/LUiG
 g/X3ODmFxoADxBRHpmbSIlbxZ8E+O4wFM2FhE9nkCl3OZz0c+mm+KQ9ITEUhSUdP3/6DhYbnOIp
 rcLZTL5k9jglGBztXvzKtOEepZytGzW7pc0fUYSF4tVn2V8ViHMtpDWPycgBeo6f8KC9IMbVA94
 EyS29zNFCXK3sfafHHU2ONGXVcNEB1vAWdtRnPnTAK1ozBo5UwlNQ50apNWdud+QMSSMXo3LVcX
 alWMHGdEyJE7aVdTr//KrwJN+8C1/bSAyrrIH4YA8NzcmwziM4e5AMo/VJmhY0Bot+cNkz3YFCs
 MAoYuAEcSsITcZYdsqjvrS0gTSlDASfFgePyzTmDHvmFBxKKBUygIKnjiX0LmvCelQUSa2URZw6
 UGGIiPLLv4Jsa0Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: iXuj7KL_hoDMHow9bT5V0pDjNYxVXfHV
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2adf0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jx7dCe-4cp8LvEwUiLcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: iXuj7KL_hoDMHow9bT5V0pDjNYxVXfHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMCBTYWx0ZWRfX6i1SUSKrwyiy
 SJ//tUR4MdbAZLiMsGNBHnUNf8Y/BR3PdbE6j6YOYn39WzjcEr7tfdkujBz393Gm8nFSXot4VrM
 MoyFcZTvGtGBQwnbt5+oi1LnoiyO58fm/rFSLj9tV+9AgvL3QRNA3kBBuUCKtvU4+//0hhrHb7v
 W+COLUJb/ZmcD4e7I/m10PUGGbXvONmfKWCNqd5VpKxQA2CPao4xOvOI9SCUQsE+0nLF75TG8pF
 1smJs+u6HioRPSqOppad0NfDl3jP2RuQVBic6vPdVj8TOTW5XM+hZ7OOxe3uoECVyx2JyxGCr8P
 zoWCeXB07Gqt7NRINj4tbKHE+aLLmtEXSto37vAokQ5QgdzaG80mZoG2hjWpDG7jH2jXGSHJHFs
 leHdMkGYxSUbOuWOwO7BDjTp45fTcldMYD0DlBtGj7wEcjT69vPVg6dTL8j20RNllINLBiITd9a
 r0lq+G1qZoFyoUMeZ6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99697-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,16c0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,c42d000:email,c432000:email,b220000:email,1d80000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B56BD318464
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some coding style issues were raised during review but the devicetree
was merged meanwhile. Address them here.

These changes are non-functional.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 190f10a77d74..5dc3aede6842 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -686,7 +686,7 @@ pcie_noc: interconnect@16c0000 {
 			reg = <0x0 0x016c0000 0x0 0x11400>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
-				<&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
 			#interconnect-cells = <2>;
 		};
 
@@ -722,7 +722,6 @@ ufs_mem_phy: phy@1d80000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
 				 <&tcsr TCSR_UFS_CLKREF_EN>;
-
 			clock-names = "ref",
 				      "ref_aux",
 				      "qref";
@@ -912,10 +911,12 @@ pdc: interrupt-controller@b220000 {
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";
-			reg = <0 0x0c400000 0 0x3000>,
-			      <0 0x0c500000 0 0x400000>,
-			      <0 0x0c440000 0 0x80000>;
-			reg-names = "core", "chnls", "obsrvr";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr";
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
@@ -925,9 +926,10 @@ spmi: arbiter@c400000 {
 			ranges;
 
 			spmi_bus0: spmi@c42d000 {
-				reg = <0 0x0c42d000 0 0x4000>,
-				      <0 0x0c4c0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c42d000 0x0 0x4000>,
+				      <0x0 0x0c4c0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -939,9 +941,10 @@ spmi_bus0: spmi@c42d000 {
 			};
 
 			spmi_bus1: spmi@c432000 {
-				reg = <0 0x0c432000 0 0x4000>,
-				      <0 0x0c4d0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c432000 0x0 0x4000>,
+				      <0x0 0x0c4d0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


