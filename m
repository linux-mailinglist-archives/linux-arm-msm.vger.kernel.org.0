Return-Path: <linux-arm-msm+bounces-110831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZpW/NCEKH2queAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:51:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0291630645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:51:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="GX/bXGNB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fIcfSQ5i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 186EB302D955
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 16:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140D537206D;
	Tue,  2 Jun 2026 16:34:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A06187346
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 16:34:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418059; cv=none; b=LdHnmj/lV60doVAyJYt6YLXwOevo6im3ejtSBF/Sv4o5v9vvQQkKQa07dalGBqnPzI7B3Uv/xMTofJteeF+Dxry5TW9dSqeIpnjh7US0oOCI/+tXpjrr6D0Qb3yMS9VNuWqDKN8K09ZtWocvDOsTY+9KDhJjtIMB8Y9NzwlXtEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418059; c=relaxed/simple;
	bh=J64TBZqTk1QXlBUQoeGP2nX3l5e5H4REshFs+0vJDvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U513TBsUsLoanTAVb8agC3qWcmR9EmQPKXcjVXi1QTeAnrNG2p8TIMCJGf0GJIVu9ihXTPdenoygzggLVwy6KRYdY5TgDIU7Bc8+qob6e8IuJuFsiOup351ItQ8rPImAYPc8AOD0tkHy+o05nfhTpVORXA3BAAQuaDQuepatL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX/bXGNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIcfSQ5i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CldnR2767719
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 16:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I4bu085v3oEV0BzO6mwiS3
	He0mHSwQVVghQ9SvGPq88=; b=GX/bXGNBfjy5uP+eYfdyZosjrAqUXCMkhQHF4L
	Pn21Oj09s/qcxVROk3E13fljcmUMpd05dCcRIVKihC6pNZVx4VS4tZdpNz3TW+5J
	tPB01ngnFna4gx94IQkGxNrji/vM9MDBzotqRXFShqzP7sztwsbDgybUqTCjcQqM
	E/NY4VllfbSXjkTbggVWAoPiK1+I4e+eLOb19RW5syQHS19uXDhTeFvf2xxU6h+B
	BQ+FrCRUwf0EbY2dTQDEMIZDyppB9coMj+VY5PpfipNsYC9JZrRhCYMormdKuJfu
	AnNPxH/n/V4BBomU90eUEPPdQUooEqH/bhRs79GlXADdhJdA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus2hjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 16:34:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so16981a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780418051; x=1781022851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4bu085v3oEV0BzO6mwiS3He0mHSwQVVghQ9SvGPq88=;
        b=fIcfSQ5i8whEXcwPAbx20kdyMvlbL4jF3UH5aEpTfSfTEaFGIqODu7b5KT7EgTlOn0
         tCZ54uIAQBs0Q3YqweQ/2l4bY4HA574Q+OzDOWbj4tF411XOH7Hu5zj9V6ya8lm2ejJj
         +1DBS3hancsbwMlAOlpQtdLPGhEOqtheVjaq8yDuqJMyogINBEEDP8I62NNzPor/VKzg
         QGo6fk5PkpvT7z+4G2JY5o7IuuZF5F7x507SKzz3oF9U8tUvzmUSgtauve2d/A72UFL+
         +Smt3M/NiiS4Nqos2jXqfecVINL8QoH4f9j220R2LvSqawd1z3Io7C1LhNtqyPuwKb4v
         4Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418051; x=1781022851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4bu085v3oEV0BzO6mwiS3He0mHSwQVVghQ9SvGPq88=;
        b=dGMS2OH1fUvzhDorJXiKXIJT75ywzC729yQLNXu0v20I8RZhHmurFU3mjxeztb2HTk
         CfID0kOMLI6cvv88viLVvqvxaHaFtxx+Z+BJ7mZOv3tlEDjc/ov2E/AIoOEiEdWBSx5J
         HNgHdRP+xQNvZwUv5uPETYewYCECC3+aBwPQNmGHW6oauow5Id/wPUbx1MumBe+U0Z32
         bR6zqXvQnEl1jiZEIq9TnVIW7nG4W3Q38BTTD9g6pEKuiVGfqc69p55d+JtUa2kpMDXS
         copx6Wqp8YGJaOaPZKoxqpP+/DBsvivsGM1cCO3GXuoY/+bXKBhddwwnm29Njx3IPxbk
         tcdg==
X-Gm-Message-State: AOJu0Ywlh5NXRudwwHCIsXe/xQ1lY2AQJVPBL7o7eyl0Ir1WjUs+o23O
	e0Da3lXlfiqnzT7OT8PA37oH5J2oE08nGVg1gm1GmsKq0BETFP1fTRhBG7tVezSLvwNxVH11uhg
	TPiRyRTO6odRLTHc+r0pAivcykdJQVhzKRy5yzwenlrEafVKihGB1pu9n0ItozJbUKMnDb1/Qjo
	/9
X-Gm-Gg: Acq92OFFUrTLVnS2ABUiwhVDQ3D2fNmJZYlUISgrvpw97cj7Tm4Lr0c2owlMalEJeKn
	kWPucJPYF9Tt68k6fLJpTxFrmYXrXtYcsPRl8M1YNcZ9F4KOcfP0v7WD9w1XYy/ru1eRcLSvDe7
	xjU4cKzSVh0ReqQemrzItL6cnLaseXv1REZUn76JuLuXzW0Qhv5nq+TBbyGTmQYuHb1KVT9wpgn
	+nE4Eq9DDgUNz6Da+3eYT1Su6v9Mq4ckbWvvC0skpTh4KTc7LdfJYfD0DM2kaeBJ2C9/WsaYcTX
	xn/g3V8Fk8B0gmPe+XbIvulgUlFqOkWG7pInCEqzQr2V7FCQFXsuyVXK8NzLmlVFNCMGAA7/hjM
	TJ1BdlL9EOox8VQVXYyTm9UiqPnX0NGHtZs6y406VbDisdGCuyVzVPPaGkZpAVVx8nyNUJMLcBT
	NGNYB3RUSVkoQHzIj/n+Ap3mVWNm+YBCXmpatFWOqT8nk/rwIIvIaAQVVXtspp0J6c6SQ=
X-Received: by 2002:a05:6a00:338b:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-84282ea4f08mr341655b3a.18.1780418050816;
        Tue, 02 Jun 2026 09:34:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:338b:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-84282ea4f08mr341622b3a.18.1780418050318;
        Tue, 02 Jun 2026 09:34:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm292181b3a.7.2026.06.02.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:34:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Move PHYs and PERST# properties to PCIe RP node
Date: Tue, 02 Jun 2026 22:04:03 +0530
Message-Id: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPsFH2oC/yXMQQqDMBBA0avIrBtIY43gVUoJJh11CjVhJoog3
 t3YLt/i/x0EmVCgq3ZgXEkozgX3WwVh6ucRFb2LwWhjtdVGfeOKLiFLdjk6TsrW/jH0vm59aKB
 kiXGg7bd8vv6WxX8w5OsDx3ECtuDxbXQAAAA=
X-Change-ID: 20260602-move_perst_to_rp-63b4fab37bc5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: NJMyGbOvzlENphmoZiC2KzcIGabwY6Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX6I3tNMv8xKfz
 lJ95qDKLtaW+TTm0FZ8LY5c0lxkUYpOy3NiCX2v5lvYrGpzHb9IzliZ0YxmYfnbD8nv25LJE3vq
 YGBGMLKn1IjA6Vz59jmyQANn86tPHWUKzF/0LHaWQG0f4BYbyl8pIBD8qULF9c9QiS9iM9VdxUV
 75DSaqlU9jJc9Vm97ZXtNt6cAWrvBMfe+reh9xRDcNnToMw+cVwEQQ56ahUVb6bbKZvoohkxDuv
 XI409o7Itp1dB9gTgWMGbj0gPNptSQ9Tz8y9NvhswchHzgw34UMyL7PeUpoEmr+PRgVnOREMdpl
 lgbb6Zu9CWMkycYhF/pgjmR0daLe17D8gF0qXIJFbINK/ajHbYFnksqVLoe4VW6KxcRYF3FsLSO
 71DPvxSdlTRdiLOk/5CjDtYnw4dGSVOss/+AQb5cRLvRBckDs25sz0+T1ntMS0LBlN8qUvtiwx7
 pNGTkLci+cwZnVfRn6A==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1f0603 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZjL6ptMYfJ62ds8jHLQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: NJMyGbOvzlENphmoZiC2KzcIGabwY6Mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0291630645

Follow the new binding by placing the PHYs and PERST# (now RESET#)
under the Root Port node instead of the Root Complex node. Although
IPQ5332 and IPQ5424 are intended to follow the new binding style, they
still define these properties under the RC node.

Move these properties to the RP node to avoid mixed configurations.
Also, drop the phy-names property which is deprecated in the new style.

Other IPQ targets still follow the complete old binding style (no mixed
configuraions). Convert them to the new binding in a subsequent release,
which will also allow me with enough time to arrange the devices for the
sanity checks.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node

 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 12 ++++--------
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 20 ++++++++------------
 4 files changed, 30 insertions(+), 30 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-move_perst_to_rp-63b4fab37bc5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


