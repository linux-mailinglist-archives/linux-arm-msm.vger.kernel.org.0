Return-Path: <linux-arm-msm+bounces-82045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44DC62973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D7973AD880
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DF6257854;
	Mon, 17 Nov 2025 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q67ZxEuW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSIWIRs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115030C368
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362211; cv=none; b=GZ93+tgCzgIZEOfu3i+DRkJFD2tHHoTdDNKw7yEQdfHlWZbj76O/kA0Xxt70RQekid8WViDvnojRp8Dn+qG4q0FqR+JonxUSpRsIalvGBNsn1F17gkxgXH9PWMKLCNRHhahdjKPckS18shT8qR1BWw7P6AQFxGVfzhNP8oWB3go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362211; c=relaxed/simple;
	bh=z274ULlADt/lw2gGIxtDwND6Y6jAp5qc5uzGWrEpZj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aFZz6DAMEIq5+7QEHMmQ9AU6Jzxn+Io0dxT+I5D0oveAgSYpu2wQfrFbeepAKugxOErScJ4OUNNbXZOCDMJFtmZZSqEm0CKAAe7hEhKM0ACEwVPBQltmtwmQ8DRCbluxdCsPhSafsR7GAcrZS3M1g781BJD9LEL/x0kZB9EiTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q67ZxEuW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSIWIRs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o3to2910696
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zIUEWC9aTnKx8Mg2PMyUXn
	CjmFDNukOgtcjHjNMgTDk=; b=Q67ZxEuWDbW7WOlwbwFDxmsOao1BMJLgPllYP6
	oHQvF9FYEZ9QwVet6KebNkug75u52fIia+eDeriSMKh+UdTZvChvtf7+lLoVoL5F
	5bvUYmmam4CPR3KDbbImsoB1PQcRrW/7SGz+7Do6Ke1QHM+MmalMcmOZL0+yfRt3
	gc7KIyi7fSnL7tEktNCM2iawVI+XXINGYG7WHfwee0lnGuVa3Ucj8S/gSUBUUNbN
	p07tME3APQRTqwbQ2t3ZGswJeHb6pyYFC1IecOmea2XTw9PP18bqHg3nWc/Ousg7
	4jsOYyanpaX8pCPvFkgF6F8ccGiAVxzNSil5467QP0LdfnzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcbn07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:50:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-89ee646359cso1327928985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 22:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763362207; x=1763967007; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zIUEWC9aTnKx8Mg2PMyUXnCjmFDNukOgtcjHjNMgTDk=;
        b=RSIWIRs37pBbxP+Wj0CU5+eQO2UcG8cQSEhNt1Mfu9RDekWDtLJ0BDGpyn7kSZzIgY
         YlFWZUfxz4QjC9Lmnmbi1e+JSqJMhAgkwMesas6+ziLyxLRDNh+tlMcHx4VAZNWw/gTV
         xKPtgvhUtGMu/bVZYfyyCi5BVKEE4Pg0obF0nmZBxIOS4SAnhx6w12iBKInAXdxxum0K
         kJlziaXquXiLUdL2JwT1Eey+GGlw8BrN1Q12WX6tRZQbI6pLtm1Ku1buMo/9hSMYSElq
         y1TfLBx5+ZXFDBU3eYnCMGVJgsmXVD7hoRLE4/LGEkcyLXML16VZS1EgOoCqNB89cXmV
         9iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362207; x=1763967007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIUEWC9aTnKx8Mg2PMyUXnCjmFDNukOgtcjHjNMgTDk=;
        b=BegIee0aDvU9hj65LNfFkDN/GamdVV5TrWf30mv0VsA+ZAcobiox4dQFt4mXYNaLwo
         A0VDXKmVKEgaPFZLYNe9Rpq2rSCLEX/5GaVh1UvznUZQ/gTyOPBWSYLrpESHTBd2CCNn
         UVGa0o6CeZSwC1GcGK3t1rdNPmEk2HGcu5Z3KRBWDUTceO5yxhVcOlI1D0F0vPFXlT3Q
         2nkSIGeX+v1YYnjKGQDxd4ajul5IXWIXj2zKlDDEt/Kj4D/521Y6dS3iTB/KvR4L137k
         wnHZ/TTrks/tU4EpHACSbzsX/z/HemRqAoIGciZRyMZvWi6kDtT+ujK2JiJmGS7hNsMA
         AT2g==
X-Gm-Message-State: AOJu0YyV+4EAOnFb/JoOj9f24pqz9QoEnHzDjv4s8jNVDIIK3NpBHkec
	AEjr8MfEbk8uZfjGfXX0p5UBOyA96MPNLeV69xuSlUPuUNXhQjYem5Rt1I7G98itl1VKyfnGNt0
	EAlfsY6ZPrTTku2+HDLEQ77t7ntW0mRZPpm+qnAZRoxLGvejaesgDF21MBs0SXrYRCU05
X-Gm-Gg: ASbGnctjZF3rVhugeUVxUd0PYti/GuduZGknBJGwOFEO5roLMBiDksonel74oqY7JqH
	j7Ci4NZDPEp2PJBroh+TZ4C0msprgwjgTJE8a2EPDYMGTGSnzElrumjob0TfXhfvVtm2nesrvCT
	9N+7nbLkbNjdbSLkUqDkxZXrJSmd2AGIasi1JrW+TZEjjOLQJyDUfX3PgGNhO1+g8Fa5aomOOJd
	xcwQneTaht/HJAWDKlAKugQpplqqYBMtSKmU18bO8y0QN8WCA5RO8vSTYbFB3+sZLLkH6n6+L/t
	IyOgUMwZX1ASQSJNjDiQ9o4HsylKdtftgnQTbCIjv537ychD490L3nRG2V2jt4dVs8fxVKPY8dN
	focggbhtHqouglKOBS7VCV9eQBHvF15fRQGElbghrAA==
X-Received: by 2002:a05:620a:1a22:b0:8b2:213a:e2e4 with SMTP id af79cd13be357-8b2c31e8b84mr1512874985a.84.1763362206619;
        Sun, 16 Nov 2025 22:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERIpb4ytfGZ6fVJ9ikfLVzznxfE12y/q2fWgMKF6V4xdzoAKRF5ntRaj/dBcn5aJsg0FsQHQ==
X-Received: by 2002:a05:620a:1a22:b0:8b2:213a:e2e4 with SMTP id af79cd13be357-8b2c31e8b84mr1512867285a.84.1763362204675;
        Sun, 16 Nov 2025 22:50:04 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2db481f57sm498961085a.4.2025.11.16.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 22:50:04 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Date: Mon, 17 Nov 2025 14:49:31 +0800
Message-Id: <20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvFGmkC/y3O0QrCMAwF0F8ZfbbSZuvaDhH/Q4Z0baoFt7lli
 iD+u3X6ErgXcpIXI5wTEmuKF5vxkSiNQw56UzB/ccMZeQo5MxCgpJSah4VOkydTCsG9Nc4oC6G
 KhuWN24wxPVft2P7yjNM9o8uvZD0SuRVtit1qCrD87536QMQfsuSCo/HGZxaCg8NItJ3u7urHv
 t/msf8e6xwh/zZpaQoRwVpV29LUuosd1NLqLr/rg1I1VCF4pZWByNr3+wMF0WM79AAAAA==
X-Change-ID: 20251117-dts_qcs8300-c98a8592d4f8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763362200; l=3230;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=z274ULlADt/lw2gGIxtDwND6Y6jAp5qc5uzGWrEpZj4=;
 b=Axw0/VQ0jXOr46j7Vrmne44qu6LbhQdsy2bYKEAt2UCTHaBGAOQdvPR57q5BNEG4bMPTjOngT
 B12/Qrm4Mm4DbA31JMseADo377KDzcIjbiDZLzXik3rQmF8XE3RPPwh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: Zk-uL1gKPooWhZlfN43SJDHyELizlvGX
X-Proofpoint-GUID: Zk-uL1gKPooWhZlfN43SJDHyELizlvGX
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691ac5a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Ki_nu0Frpaj405WCvX8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NiBTYWx0ZWRfXx14zzvpHrq7i
 +5O16l2vsX/iS5pTsGUKkEmBqQXrSqiIxcPhWmvjssh25kcesuKc82xNOTrmJEqDZli/uM08i2w
 y8hKXU7jLGnnCz/087Zr7HdAstTOkyl3su4KkhzSYn+JnTzOWpwc3RS42rEsjgT38vfCVruqDlt
 CjvSTdekZ7HhcnipUQVidg27GjJS0v4pLhEbgpVvGQZ/flR6Dh+xYRbpz+8kjLb8SL1kuaGR5yn
 ysBSZPTqUJavWkat8T+yHmE9GgFeSVeW8aXkJhxLmCKEGmFF9rXaliWSXrD0iBOA0ZHLIViEzUn
 pce4EqwpPY1Zup1kNgeYx5+voMhuFBAO2Be1USYaemYNEgND8kT57yVFsalggY1yPcrwIPqdvd7
 4re0rlHT+veAxuVomxwcVS3z1ZaerQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170056

This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
This series make top of:
https://lore.kernel.org/all/20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com/
which has been merged into msm-next, but has not yet appeared in linux-next, list here for reference.
---
Changes in v7:
- Repost after dependencies were accepted and rebase to latest linux-next.
- Link to v6: https://lore.kernel.org/r/20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com

Changes in v6: Fixed comments from Dmitry.
- Rebase to latest linux-next and remove merged dependencies.
- Modify DP controller compatable to use fallback.
- Link to v5: https://lore.kernel.org/r/20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com

Changes in v5: Fixed review comments from Konrad.
- Use interrupts-extended to introduce interruptions.
- Sort the dp_hot_plug_det node by pin number.
- Link to v4: https://lore.kernel.org/r/20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com

Changes in v4:Fixed review comments from Krzysztof.
- Add the 4 pixel stream register regions and the correspondings clocks of the DP controller.
- Change DP controlller compatible to qcs8300-dp.
- Rebase to next-20250717.
- Link to v3: https://lore.kernel.org/r/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com

Changes in v3:Fixed review comments from Konrad, Dmitry.
- Correct the Power-domain for DP PHY should be
  RPMHPD_MX.[Dmitry][Konrad]
- Correct the interconnects path for mdp and align the property order
  with x1e80100.dtsi.[Konrad]
- Rebase the patch to latest code base and update the dependencies in
  the cover letter.
- Link to v2: https://lore.kernel.org/r/20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com

Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
- Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
- Reuse DisplayPort controller of SM8650.[Dmitry]
- Correct the regs length, format issues and power-domains.[Konrad]
- Integrate the dt changes of DPU and DP together.
- Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
~

---
Yongxing Mou (2):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/monaco.dtsi      | 220 +++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  42 ++++++
 2 files changed, 261 insertions(+), 1 deletion(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251117-dts_qcs8300-c98a8592d4f8
prerequisite-message-id: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
prerequisite-patch-id: 59af38ff68afe283dccd4295951153e59e512bfc
prerequisite-patch-id: 05fc429deb58c4aadd82f7d0d714af7d34d8399e
prerequisite-patch-id: 52ee61224c7589b2122799998a8e99829d06eb47
prerequisite-patch-id: f664581f48278298bc3501eecf637d1eb16dbf9e
prerequisite-patch-id: 465ab53516efbbe38f85409e7ccb3793b05402c6

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


