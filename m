Return-Path: <linux-arm-msm+bounces-96495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIigHYixr2nrbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:52:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6ED2458D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D948E304D158
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F67C2D0C84;
	Tue, 10 Mar 2026 05:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9h6V7Ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OynL2p0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D84435DCE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773121826; cv=none; b=aSQwJPoZmc6YRtPsbqoDm4LDLVWWbmZ9KRQecVelp0YVhoWjs3DiM5rYVjmulG+w1oNMnj/JocyZFBqi0m7ghIir/lX1oeqqhlU2+e/pfWdVy3bJnDTpA54wSvCTnJ0VV0xkcFA23o4tXA2V158PheAJ5G8Z/DPtVIynl5+pAhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773121826; c=relaxed/simple;
	bh=nc9dlR2inluBSRoAUtua/KoO3/oRa+fRUfHZu0Fbx9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YTMPsRr6jwcawb84yopK8nJw5Clfn1y79OCKJKKt1CXA8BMj+w/CCqGO0G/XQ5kvKhvjwfjyp/jp7v/I8BwDo5nOuf4Ge9eLKLECGp371NwkWj4a9ylLK7UjcWbemHw8Fy+7hWA6K1P4Bxlf6feKQZSt7T6+v1dHbUEwHz7P9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9h6V7Ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OynL2p0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Eeg52373417
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7o+cUya0Wb7bTiZLac2o9kJPaIRtMHAM2Wu
	U9iBXaEw=; b=Y9h6V7IkjxkAd9WZAWn7WdD3ejop+I505XjlNFIRmaV/7zfS6Ug
	vMRaAEPTpb0KwTS1m/AN05YYPd0JDT3CRQfBP7VZiLoU0GPpqFgSswgJRX92MKEa
	5ZBdoERWXB5v3JMZx/JE0Mz+K7QPqXzE6pt+yPY74oes5dSF2JSpdNZp+NoSGlYK
	7MGjoO97obXDeYfhgTHNyRxDRk6h2h7h69B5Ge22d45wP9WVSVc575rA8IuGTgTp
	ACJn7hOcXIwnvWwUkRkTldZeZAXPD5uHAXc6y2hLQfy0sEI7vfCyIdFagJKjMxOR
	h5shsX/y8CvsGL+/lJ8KJJh2DN2xw9/5Big==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkk3pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:50:18 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4171d16aad4so20183167fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 22:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773121817; x=1773726617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7o+cUya0Wb7bTiZLac2o9kJPaIRtMHAM2WuU9iBXaEw=;
        b=OynL2p0cKn22RIsSN7odysf3A1C8MoZbNfN5poBkj2bm7qXUSespe9VjybgGYS+8By
         dnSgEvZNPBpbHG1Gi7pmatFasSeSaUJNxnZIpgqKcINCn4uXbJqobP5cToFVjinQpFUL
         05w954lWFKbnGufytFlGbNbv7Ovor6ilDHX6c97ozFy8S8peDfbcZa+1vCWhG26VyqwV
         z2zcldXr59bVS1vXXFKeXrkJKCv2vzmT2xCapep5DzB5ibiXAvuLYWCsEAsMQ+zBJboL
         VxY5oZ/hUP23abqMhcU2a32rRADVdzjJum4N9AD0tINLjmLkssGEi0gAFgG4AGH0cebT
         B3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773121817; x=1773726617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o+cUya0Wb7bTiZLac2o9kJPaIRtMHAM2WuU9iBXaEw=;
        b=kxRTiBvk1Nb77oR49pKMZxSjRiS4JWBVaxMvCuSBxrXB5lwuR3NV5pZnqSF1nGfO+0
         DUJ+rreB6VWU9mQNxjpb4CAI6c5Pc/YQJad2zZVD0LjOzrir9ti1R0ovTNM21Gc7TtUO
         xFzWsQtqNPzrwgNE4HEoYV5EqK0NsugXtn93ikbCPtrx2gux9Ypl9QZbZb9k3N/uDCcz
         Hwec+ganqlfFunI6qWzVgCRIiOB8R8szhR/zu3XPqxw7b3V3imZ/NwrrQP6vmVIcok9E
         1GVqyMivRFx/oyfwRmKetIU0hl3+isHqQYrjEKGqIqQGDLWAIUZrf8PvjsbazeWsyUzA
         foxA==
X-Gm-Message-State: AOJu0YxvJuQ22r8bA0Oo6G0xDNYeE4X2o4EkAnqdtDy/akPhNXJCch4d
	Mr5WOuvxypHiFiWxWf8EQBq7orYhvVqlAmtEBMwBVhQDcDaHcuj/dcrqKNnwPlZg49c2Pe2J1mH
	kJVjuD1Z6V7A4WHwkElggo4RJpGUM861KsIRWgkD2fTLz2GKDvUmIuVeEII/8v7HwUdjw
X-Gm-Gg: ATEYQzzhk6mPTvvJzt0Bvt0KVir27fL/q3B2kadU0B+XTuvmm+HAdVmafG3zlzXbWLH
	TkL0r9pvxlO8SG/mk6ntaJ4+yslCzYr5pzI7V3aydi2wf+zrW88G+GOyHEE3rn7kj5XsZ9SmM6N
	MGNxEFCX0QQdqJG5Njg4Fs3bD7xfcp3pZYLKgdCXiQPU9B0SLUk3+4IKoMzJ9Z6Dsi/utwt2ITB
	RuiVsQT8wGbJbGPYlCFil36pF1u5V6jBgC82NDNQAmHUkvYSm4uqKNi6pL2u0cKrYogSMBixgUI
	4+TR1EIs7oATkHTB6XAcciCrSqMdR6eboncTojQq3km5MrLHVOR2pFErzbiWBDD+wj4TyNiiuSn
	EeFIKJJzW1TLEVa8/rtSMt8q4MXic3wahiRaOkYKMGsVHQeSepgPC67LYSbFGgH+wFy5M5Jc3/x
	rxpNUSiXsqyA==
X-Received: by 2002:a05:6870:40cc:b0:3f5:ba8f:5b1a with SMTP id 586e51a60fabf-416e4493918mr7310818fac.50.1773121817441;
        Mon, 09 Mar 2026 22:50:17 -0700 (PDT)
X-Received: by 2002:a05:6870:40cc:b0:3f5:ba8f:5b1a with SMTP id 586e51a60fabf-416e4493918mr7310801fac.50.1773121816991;
        Mon, 09 Mar 2026 22:50:16 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756d4c581sm1487020fac.10.2026.03.09.22.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 22:50:16 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 0/3] Mahua SoC and CRD DT support
Date: Mon,  9 Mar 2026 22:49:44 -0700
Message-Id: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69afb11a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yoOf91yPD0es73Ws7gQA:9 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: SAPoYZWDH9EiccLwNv4wsPboRIOeBeiQ
X-Proofpoint-GUID: SAPoYZWDH9EiccLwNv4wsPboRIOeBeiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA0NiBTYWx0ZWRfX98eIntgbOT1N
 RfB1w/2ofsh+/R3sD/KJ+3dx3tej5DpYnI/dsBOKU/5jDCyyxZivv3D8V0pTuNx6wO4+30PjrBw
 +f/fHoIRG1eLfrV2fdILBg1HnX0ImyELO9T4w0+RdoZAEDHDpR7blHN47CA8gJwAFXDyVCHEjR9
 0HcLGwyc+I1J6DlTHeoFF3iyrlFODoGxLymvAnkTh0u5y0mur4gwZsuseYyAlM82z2ain3xT7rP
 qes3RhLJRnQ7RCbbLfG1ODKvqClpubnvkneuhq69l0l7ObkrvU6KL4i3yfvnCccItzqeHVwS1QP
 7IXsopq77m7jGKFXKEFrinEfp99N/wKfaHs5dp4I37fzi3e/b7XKAlHsHBLUQy1p6duYcUCJEGr
 tPaMjqHP4mXUHTBuX0f2VYd1+fUWmL2fRdr+LjX0lL2vUs/KKj+zhSASXLTqhBICMaW5oKISEnJ
 Z9UuVjjrdj2TlHUTQmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100046
X-Rspamd-Queue-Id: EC6ED2458D1
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96495-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Mahua is a variant of Glymur with the same silicon but with the
third CPU cluster (CPUs 12-17) disabled.

Introduce the DTS bits required for Mahua SoC and the CRD based on it.
Some of the notable differences are the absent CPU cluster, interconnect,
TLMM, thermal zones and adjusted PCIe west clocks. Everything else should
work as-is.

Gopikrishna Garmidi (3):
  dt-bindings: arm: qcom: Document Mahua SoC and board
  arm64: dts: qcom: Commonize Glymur CRD DTSI
  arm64: dts: qcom: Add Mahua SoC and CRD

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  586 +---------
 .../qcom/{glymur-crd.dts => glymur-crd.dtsi}  |    7 -
 arch/arm64/boot/dts/qcom/glymur.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts        |   21 +
 arch/arm64/boot/dts/qcom/mahua.dtsi           | 1040 +++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi        |    2 +-
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi  |    4 +-
 9 files changed, 1072 insertions(+), 596 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-crd.dts => glymur-crd.dtsi} (99%)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi


base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
prerequisite-message-id: <20260209-mahua_icc-v3-0-c65f3dfd72c8@oss.qualcomm.com>
-- 
2.34.1


