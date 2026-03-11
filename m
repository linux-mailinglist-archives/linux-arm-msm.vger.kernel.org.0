Return-Path: <linux-arm-msm+bounces-97016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA8hKzmBsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:50:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E9E265B9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDC9C3015C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DD83CEB86;
	Wed, 11 Mar 2026 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exKbdLM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfF9bHjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD123AE6EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240428; cv=none; b=QgzT4S90F/HjieyNnjUNnA9iKh/XTO7srw/Ypw839eZYOEgvGDb+wBViDGNCbauiui34SVbIn9mkp4cjMxWXIe1UE2Ur4g8wiYg3btMr4yeNypm1txbadhBYr9noEMnph7MhrUf33LmEz9vHNl6+F0DHFt2AW9Z1XROvYLJ9U/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240428; c=relaxed/simple;
	bh=/XsqeV+d9dblP9p/uC98m/HzXGPxUoriHQmCCn2ae7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uQw8d0H8IPIQfgSmShue4vNu3Qd7u6d60dNz3dN1f7SypK4txgXqIWeOMI4xEBA/KVpH60Lsw91/oH5NvZ35a/5fGu5Hy9gXvV/kfpVZixwXMTic2pGBiHYGJFWCFsJjhL7eoc9269JDWV0tDO/kWJ4svAScRWTEo1aZvGxPDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exKbdLM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfF9bHjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BEJEkq2602590
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=300Km5ID9tzfCP3u9XYQMj
	OHFV4q6WeAOXJezcq6Eyo=; b=exKbdLM8vJLnRxfEMoEIe2EXWoG5WrndLktz/r
	2XKi+O4c0jogYE52n5AU7NwW7+yCj7MJlN5vA6bWjj8BCvInaSXeHMvVJBcbAFY3
	UFMKZYG4atpP9i5NLvNyfGU0giRTdjJHTj39qpk7+14KfkjDq6886hq+ypKGkz9T
	olGCTOX3N/5USDl4VR/Pp2q0AAPpeD4TYEoOYWh5Wjp1zhV08vz8+BCNPEQrLv5G
	O3j9KnT1O2XSX3MR5cuLwvrMThy3G16lZXbiAH98mTU5qG3N0UvYzzd2sxCRGyDf
	9eSsNnYByNgN518XKHH1RmivFSVEYHoHjXmxQlcW0so3SKGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6a5h0by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84943c76so686345585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240426; x=1773845226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=300Km5ID9tzfCP3u9XYQMjOHFV4q6WeAOXJezcq6Eyo=;
        b=ZfF9bHjEZB8IXOqXWutuFV0da5qZodRmJGXJzepVDkf/sF5WzMAq7RzeStkuzWHdeV
         0kFu8bf4JUBqnd6ryQcgHqBudNl+vrS5sIRje8M1nRbfe2SvOlxJuW2CstEdcGqR8xri
         BFh3HTWaJ37J/BgmWvPstG4px3weXRxtFr5a/iPewJDdS37wDMO+7NyNOXlozMKrR9aP
         2BRJfXJEkUxsOqXqi4aDAjRV2MC7ENuVYc8ts0L0jXMJ7vBIV/yokC8wXUPe1PKFoj7r
         6/51KnDFxlna2OwszC+hrEVV85xam2rFCzxvMen5Em8RuSIzWZSGlkYQy3oCOTx/0IQS
         KpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240426; x=1773845226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=300Km5ID9tzfCP3u9XYQMjOHFV4q6WeAOXJezcq6Eyo=;
        b=opPSUOh9CSbFBIuEkv5/56PXMGiLIu9Ce9ajWVX8D1bbazWLssgWmKHrpGvKuILhh5
         uXQSw3NE3CFmrxZwr8vPWaih2dqnOPOaH7Eiu1lj85keKQTDrZIgxP6cCwWZqKkWZI+I
         MmiwgOUP4wuh7uSe5x5opXpDLNYJFg7Xw/UKluNP9rix9xdmp1rZ87C+ZoMZLJfgg3or
         ekqpgqHICb+ZQsVRQS29Z/wkRCvB1OA0OQIGHB7oWLDI8YWopKfjvgfxNAcFG/x2B7vT
         IGnPC3lNOt9tJ7bn1Z+iN/HR9Dp3N31yk1KgU5acNa1ruul+eACh5uV6x14sv2L4c2h/
         sg8g==
X-Gm-Message-State: AOJu0YwVld+KuEJ7kzmPitD827YJI8dU5b2Y9C5JIx03fMAGvmFoiYaO
	fKgz3f79qpPlGnP9zUkHiUVNOpkUwZ59X5eRvswR80mz8B5Rl3g72wuZYY7VCV080b85KMWOczI
	Z/nh4pZCZ5Q1EExHd9i+iMahueO4OKs81d2fcWR5hexFVJaYhc8tu1TGzKEEsXxFbLxN4
X-Gm-Gg: ATEYQzzyHDAqNtk4NDb+QP3vzb/JAbRebr93+0aU9RUQw1D2bw9OPhIphF7J+WADgcG
	pC66R1JGoMMDFPbuDp8vWgnCVgn9zvmg6knpXQsYLnSBs7+MCOQCyWpuSSKr3v3pkCha7n9Rj5y
	i7FMk2R5kaEo0rPBOfuQqc5vpe8rGg6mwmw8o+Tq5uOuZ14TNN3u29ibIPcMGb+HKY5+uKdNL6d
	ltzqkDJPjbBCFc42Pz94A1yada77/q/QbrfjvHnK704+Y5I0bhM26sC53z2Z9996T8lROS+UMOF
	yrp7G4d9v04HvaSxoSPHHrAqFvnMZjzhGzC4XlghELnKg9udN1u+f1RXRqhGbIcBF3xatyvtdnT
	BTJ4qxyE6QIXzEo/k/uUHYK9YS8/SjA==
X-Received: by 2002:a05:620a:414b:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd93b3ba55mr825812685a.2.1773240425453;
        Wed, 11 Mar 2026 07:47:05 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd93b3ba55mr825805985a.2.1773240424785;
        Wed, 11 Mar 2026 07:47:04 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RESEND v6 0/6] clk: qcom: Add support for basic clocks
 providers on Eliza SoC
Date: Wed, 11 Mar 2026 16:46:30 +0200
Message-Id: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEaAsWkC/3XQPU/DMBAG4L9SecaVvx13YqArA4yIwT2fqSFtI
 G4joMp/xw1IDYEsJ93p/LzWnUjGNmEmq8WJtNilnJp9aczVgsDW75+QplB6IpgwjAtGsU6fnkL
 dwEumGtEiuMDQOlKevLYY0/vAPZC79f369oY8fs/zcfOMcDhb581tyoem/RhyOz7s/0TI3xEdp
 4waoyJ3kscK7HWT8/Lt6GtodrtlKUNCJ8aGnRiiGACITslqo6GaMeTFENxMDFmMykfQ3qL0bs5
 QY2P6D1UMHZiLogpKaD5j6JHx5x66GAHAmBAtlyBnDHMxJBMTw5xvGpUIlXdBaPjH6Pv+Cyd9w
 90dAgAA
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3915;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XsqeV+d9dblP9p/uC98m/HzXGPxUoriHQmCCn2ae7E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBREyo8HNfyfCbCXBYUfdHRQNUMED/qgDwtf
 6l+iisNgVCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAUQAKCRAbX0TJAJUV
 VonnEACxqo7GlvsEx4bPeByLMv8DOrWMMw4/w8DxztRhILzWWbGB1dx4BWCbrHn5VqxZZB1vGZ+
 kCThUkcWAYI0iehY6dfZd+PwYMUODsnOe3q3h0DobG/dB6Xl3A3GcPIegL9Y2pcgLtYWaRhwop7
 X+SN/DI/gNl2YJXDrhcRtv/MH7EvN6VtakLEqyyCjuYdvbwLhSoO1/OZx9bFxW6gPEEmqYtI9MQ
 dthcGHg+Kkg72HuvDTK1emtseQ3Mdr2fHvIEexHYaZCqiHD0QzzvPAVuc2wft78jCa1yaa2wTrt
 +tv9EGR2kxktuS8L6wTShHsVoMZEcFUXn5SkSk7EFlmgiVA41qsqvsro4EnG5J99NYit5fuD7Ej
 +DLZCor8veRFj3eGyYbOO18GNrrrNqUfiD+nWJFU6pPo63MRmDGKAf+SCToBIzWpfankQKo8tOb
 Ss88wsq3JIwsSShz0O0CE1rWjrMrEMfDoD2wgo8EjIqXvJ31ggNstI8v/iX2fH9H7hzAbPXDnW7
 u8ZjO22jxDL2A5nhdIOT2ej3U8V7dwQjwB6ggnIrz6a/u4/slDPsd5/f91z5IAZ6NrSUkMTrbs3
 Ut6XtAUYm11OpKVNXejgqx7pGd9r0/Hp+GjOHmn8g9J5OkATvOjGxMkTkor/VDd3gPF9vtNlRUD
 5f/kg5JY7VT5Duw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: np28eI4KWej4mKZ4x-4vgDQxVSippRjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfX2QfxyuYbzIQA
 k/XNnLX9IJbnvpMuXTgqAWvlZn/k5eOWpVfyHFt8IzjLvwhXS1mV5VWTakYduwNTr3sEOWrZxn9
 Eve6vInlnFcHdGlo1WoxgxoXgKNVPUJuJLnoPvlKpMYB75y/xeCuh1LurF83dY7xBMt5OXAh1U7
 cuZLf5jak09oVBO/QnPdsWvoAhIlm4X5R0gkTRLSqZdB06AX/X/maubTDsW1obDEmbnQPb1gE/Y
 6FiRY8DdSZ6+P19x+6uL5aWICfGfjGZ+5FLQT4LFva2a83S27fSri/PEX+r342GgBgc6Wk/NZfQ
 R0EBg6pLzya3+tDxrBVoDvJzST1kec3YZkmhSxB04x2WudSb8KyXt9xn22SgJuopvTlJPnuJWtb
 R+pLyZD07P/1+iOI729oQO1rq8rLnYcUXrCmwsqZ2pJkC+OUh/SSpi10bnph8h7tMi2r0agyznc
 WrJm0Cf0FDfH17SLsyA==
X-Proofpoint-ORIG-GUID: np28eI4KWej4mKZ4x-4vgDQxVSippRjC
X-Authority-Analysis: v=2.4 cv=TtLrRTXh c=1 sm=1 tr=0 ts=69b1806a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_fAS8OA3c_KVdZu2R9EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97016-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
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
X-Rspamd-Queue-Id: 48E9E265B9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6 (RESEND):
- No changes. Rebased on next-20260310 so it can be applied cleanly.
- Link to v6: https://patch.msgid.link/20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com

Changes in v6:
- Picked up Konrad's R-b tag for the GCC driver patch.
- Picked up Krzysztof's R-b tag for the GCC binding patch.
- Dropped the GCC_CAMERA_HF_AXI_SLP_STG_ARES, GCC_CAMERA_SF_AXI_SLP_STG_ARES,
  GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES and GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES 
  from the GCC driver and the bindings header, like Konrad suggested.
- Link to v5: https://patch.msgid.link/20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com

Changes in v5:
- Added force_mem_on for GCC_UFS_PHY_ICE_CORE_CLK.
- Switched PCIe pipe clocks and UFS symbol tx/rx clocks from
  clk_regmap_mux to clk_regmap_phy_mux.
- Dropped the GCC_CAMERA_HF_CLK_EN_SLP_STG, GCC_CAMERA_SF_CLK_EN_SLP_STG,
  GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG and GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG
  from the GCC driver and the bindings header, like Konrad suggested.
- Sorted entries in the Makefile, as suggested by Krzysztof.
- Picked ub Konrad's R-b tag for the RPMh CC driver patch.
- Link to v4: https://patch.msgid.link/20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com

Changes in v4:
- Picked ub Konrad's R-b tag for the TCSR CC driver patch.
- Added the rfclka4 and rfclka5 clocks to RPMh CC as they exist
  in the cmd-db.
- Added the missing HDMI and PCIe1 TCSR bindings IDs.
- Link to v3: https://patch.msgid.link/20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260213
- Picked ub Krzysztof's R-b tags for the TCSRCC and RPMHCC bindings
  patches.
- Picked up Dmitry's R-b tags for the GCC and RPMHCC drivers patches.
- Added missing TCSR PCIe1 and HDMI clocks, as reported by Konrad.
- Fixed the compatible order in GCC bindings patch.
- Link to v2: https://patch.msgid.link/20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   26 +
 drivers/clk/qcom/gcc-eliza.c                       | 3105 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 10 files changed, 3567 insertions(+), 2 deletions(-)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


