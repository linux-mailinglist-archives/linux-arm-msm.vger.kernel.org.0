Return-Path: <linux-arm-msm+bounces-110796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCxKFwOmHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:44:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB562BC77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 518B7305AF19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383193D0C04;
	Tue,  2 Jun 2026 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2/Juq1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX1moGKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55667306D3F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392989; cv=none; b=sKcxK6iVrGrAle3rT5s/xYYD7ZJBZ357rJdFXFK8ED+jHE59rF+lsdU0B+ilSRzIqvVLYTIzW6JdJSUREeO9f99qKeSc3tRRdqeysdDSpe6O3v1APb4xB17My3u6ih4ZqIzjTcfJrxtAAYlHFKehebtd192mF/fvGIp/d9hXx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392989; c=relaxed/simple;
	bh=nz6hPl3LT8ptNw/NZmZMzPEW8KpUvz7yNcIiWSAfvQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a6KxvMudLSd1CwMIX8HC9w+NqRRcRw4xLZKnRxgf9LOH0wUPK5VsPQNUsMzFhSoxiSD7hDixDSQpjbBMhkJGfr8aU/YbcC4JoqqmipPkdaUuRumOnvRSG3Q2CO0m8rUPF1TeM3QVQRPHmHe95Z1MoJBKL1mpQ8PyXtkFSBvjT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2/Juq1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX1moGKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526Mp4L2767770
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r7oSzQIF/40QBt9Cym+JUS
	BWjLP9Fom/phGPGm1A1tk=; b=G2/Juq1leseNr55Kb5hlln92rWxZ+QqaCEJfK1
	EPNMe4s4lxRhky2aTLMo308qeMJH/XKEJxCC8jtULFZH8YCtPbFV2rPKVnhqqlB/
	tJO+mzKuKKVJD2qKtw6xZyNbnfjOaPzTv+6oE16zqiSYcF7c2HXbjJmGPWzQWlof
	BUZo3K68xHAv3gbFAz8fJLpNsdRI9xlXvA614e+sbVpHtkOg8Tc0aIeO8KUwalR2
	CJjwD8I+1/JWG8UpaxTJzOZklwH/ySleeLx0lGa3Y3k38eIbOhHr4JRZ08uzUAy8
	54PkT6gnjGfMKwWlUE9TB/x7xbrk/S1dqWzLNv+1l+c+FKbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0svd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:36:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32259e0eso42555455ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392986; x=1780997786; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r7oSzQIF/40QBt9Cym+JUSBWjLP9Fom/phGPGm1A1tk=;
        b=NX1moGKNShCFTNvzTocsXlceRQFuNesnfGFBioCi7j9Xlw8a7rIYhYRt3h2GSoZAxm
         8SsywofhkzqQ3ProFGt6jk3Vy/74xgHLXwAvjWkEDEFqGtpkqOk0+NGxdlPvJ1bJClEu
         tdfX5ZN0fwGf6zbFTWiJKzcveX37mgTeM1aMFtMVJlNSnbWFhnRkAaxzyK191AkzLYvb
         r3CZTG45bjgDpPVGyAmOH2vSN51kIWfIKSgvxSa95sc/QPfzRbaIiwOFf1cxjnDLcrwh
         jDcNLs9w+NH+Zz6i6ckvHxW8oQ2KQbYUjWmQqr082EARmvPLL5zYc/h9NbNmWuuKsSVd
         yIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392986; x=1780997786;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7oSzQIF/40QBt9Cym+JUSBWjLP9Fom/phGPGm1A1tk=;
        b=lqOhjhaJ5DTUEfH+i2INSjXTs6hyy86o11XF9c4w/SmcZZwvbmtOBJTLy3Vol2Lf3b
         o07mdGq1tX0qEQ4CuK1l7tBGLLy31pY+AzIlVpyZ7Qn/2n/vqz+drXklzCBrRSj3bEbk
         7Px9389NgTQ8vQaHWkueygWXrnmc+6i0z4EbD18gpnMNS2yEoObX5Bu97vSuoVs71Fh/
         DQXLIV5/nLaILWCmBSqRaT6BS2OJC3i/G2h6ylbUxb+RMVuLDePP3G9NolsSqPPE/BKH
         TzIYw36omthG6UpK70q71PwR0SZ13XdjD+MQOhYngwBeWu9t0agMB3/jFP7Or9V78gWR
         qi8w==
X-Gm-Message-State: AOJu0YwiOlw1qgDUjgTzrjsYZE03/W1vDlq+DWAQqSiC1BEnfct12+2y
	ytEoYpqncAygPV1ArqYuLB56DolNcf5dzjjdf59rrmw90s7278PLNPbwn/vn7NCqYyfOos6Cadm
	GfWTJQxDJWP+vwzQdhFmuYASllzZn/H0kIEjTxaP8G0AS/FoDbdyhCOyshLi60KF6YmGJ
X-Gm-Gg: Acq92OHn6etj4hkWOezqJ8Jtz/HJn0PekAfQQfWZvtyw9uRAqUKKUJaZ+g1n92g/6Br
	4mAOPK+uFOLMuEqCe1qZkdWPr3SsEHm0oler8EEI9ndiShZIfBHIGLeBkWrBR7i0ygzt0kM4Hd2
	cKelVck70HzWTqdHF0fQjdg3s4pKKi7j5XiT5ZqOv83PSvyQFzFtM8bNWJPqoFZyK9SjlmG3cQH
	eMKbxSu7HSNBnCF37iavIvMCdujLUQHaHZZB0NpNBkeMswibI+N8pvDBOzyiy56UPxP3CI6eDbN
	g53Tk7F/8fX9nmWPFgxvcLnbhXA8ha9bpZv/qw+veLxtdiIM9m0PwGBgGUqUXHbs/m1XJ3hSAQi
	i3qX9Okr5U0Epd/MWIkNJQ60Cl5LJUbGH9mB5Ueolurrpgcs4DW6ny32lBwLsVEPCJNXQOd9BcV
	zo34qDKQhYgJFMl2ID4kv9T1VKkbovNB3TRUPgbgeH1FLWieq4boVrQ9QXE65xSlbhnPg=
X-Received: by 2002:a17:902:e543:b0:2bd:8395:fed8 with SMTP id d9443c01a7336-2bf36851283mr157586445ad.27.1780392985846;
        Tue, 02 Jun 2026 02:36:25 -0700 (PDT)
X-Received: by 2002:a17:902:e543:b0:2bd:8395:fed8 with SMTP id d9443c01a7336-2bf36851283mr157586035ad.27.1780392985356;
        Tue, 02 Jun 2026 02:36:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4fef9sm128353485ad.79.2026.06.02.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:36:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 15:06:18 +0530
Subject: [PATCH] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_pcie_binding-v1-1-486a535da8c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABGkHmoC/yXMQQ6DIBRF0a2YPy4JkIKhW2kao/DV54BSaE0T4
 97FdngG925UOIML3ZqNMq8oeMYKdWnIz32cWCBUk5baSqOVQHo5a2SXPLgbEAPiJJRvrXTGmWt
 wVNOUecT3t70//i6fYWH/Pl+07wc5Qc80eAAAAA==
X-Change-ID: 20260521-ipq9650_pcie_binding-1c76095954d9
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: pynYcoeZU-AUkHYTxViMph6tXpr6Xmyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MCBTYWx0ZWRfX0cygfamKCOuQ
 O5N3zAiDjQ2NYMDwnLbzdfmRTN2j5BW73QcDx4x0FDwbsqdBxIb6/nw0sLsbh8XYCH05qL1+zSq
 +el7VxujHJ0koKCZVkxoyQqP8p+7aZYYW+ZXWtlG/DhniuSwh+b+KDt73p4ntBSFy0fN0CffrF5
 vW+VYMIu2IUjiUDD3fRtEJbJnFjuViL3zEs9QcaHmwk1qVSyKdpUREG2GRU6FWi6eRJbA95p4xO
 ucUNX0x8DhyF8mJUxg+uIFWiw5fqGCm8/Yxbz2QflrCktrE/m4OAjQqN8YqGCcKufVMe1uOGr9y
 ex6q8IxSL6TtsKV2SOjLV+awi1Q0MkQ72fZ5AU2rQEK1Y0bwq8Kyvcy3SkhmQfA4olu3EpZs8SB
 gVw4+6RTsWuX7pOCTD3ylfKCUkDOnAYE4vPzALmujd9YtZkAzTz0MD87ZWHdSIHJxrXRSFlky7j
 OTr2r67GESxUbCfBl3w==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1ea41a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=svUzretivSU0ezUIxK0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pynYcoeZU-AUkHYTxViMph6tXpr6Xmyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020090
X-Rspamd-Queue-Id: 16AB562BC77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110796-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the IPQ9650 PCIe compatible to the IPQ9574 binding, as the IPQ9650
controller is compatible with IPQ9574 and uses it as the fallback.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index 4be342cc04e1..7fc629bda5b6 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
+              - qcom,pcie-ipq9650
           - const: qcom,pcie-ipq9574
 
   reg:

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260521-ipq9650_pcie_binding-1c76095954d9

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


