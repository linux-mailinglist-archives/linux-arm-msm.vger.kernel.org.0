Return-Path: <linux-arm-msm+bounces-100658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KnX7AkoBymns4AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:51:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C2A3555FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A9EC300DDE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F46313552;
	Mon, 30 Mar 2026 04:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6s4M8Su";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqf+FF7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1F18C02E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846273; cv=none; b=W2/oHymf/InpUIix9/cJrZ5KQn66m+92SAuBUAEgWmkl+5XUHKD5leXWvEcFtaYETtfcF6v52PGxbnn4UcFtKWkNt0+p09JmQ8FJhIgxES/IU4yXycH1nyjZqwZFWTPCc5pdIkVcoOk9d66hNjyjfpX5QA7xOABsDugPphqYfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846273; c=relaxed/simple;
	bh=IbMfSA/YZ81DtiE0UDc0yWJ9qnzluHNhmHfegFBS4zs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EvIKo4+Ee3Uix/EivhDEBDKkEs+iUHPCWTv8VfJt8TmG6srfL3bJ26zjdZP9sbx+q71FJneDycxoL48sUH9EKtfdvopRs7h0Sp1UJAU6JqVpp5pskf+k3mNADXOAEed3g/xV76oWF6cRTZ1fI1UfAWTYJZKel9/wZwTKRi0dYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6s4M8Su; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqf+FF7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TKXaYc2961221
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vKmfxj9lYsf73NBF2dYNq9
	WOcQ5WGyYMLr/gxZDq6dY=; b=O6s4M8Sup13S8gIhCaoH/C2/1TYeLviSLa1jcA
	2E60BzrCfg4WYJ1Tn+Ayrg9R3EHbRbOr912o2Co8dFsJNaNqcs8Q+uz6E9KVPoS4
	Q3/JNEl3mmf1FjXnNumkX8Hbf/NZ41Rt3hjQHaTXJh3yVDc+3JZRndgs6WupMRiD
	OE8vyDR5VOJEOD9N//Vp8O54uDDQVs6wV0egEMpvVPLducUDvQwuaP3iOxBt6hdK
	PTCwsakGJsE7nfDqUlH7k6cwAXmWKaGURNV+i48QmxkBeUcc6i0unYTl+xZ1Vz6G
	QgYlbOncjewT8h59ZNltLGOSmDdf358FzEEzDIGIRyGqx2DA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmjgyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so3444956b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846270; x=1775451070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKmfxj9lYsf73NBF2dYNq9WOcQ5WGyYMLr/gxZDq6dY=;
        b=Gqf+FF7LKf/s7TyEvolldCpHAzX+qltSfdqnRcp1dsAw+9EUFCtSZWPH6pdjLgFqF2
         1St156MBdVpSBJN3LukYOVx7KHaxPZhtLj7kXgi5rwxNxnpMr+JxwHxgrg1+EAkkJaV1
         BKn5iRsBTeDwBr81BdDXwq8Dkd+Dix01HihEogpLOba7xzFg3Y5B8w/hfONThchmd4h1
         V0p070Gk26mzmDc6/vn06ZkbsjLEWxxm4kmL/TKTYQoPS5z+qFI0LWeKrMEwT2prM3RE
         pUcq2+LJzSmsCwdnQqvpo/wQ7Hz5kK1dbD8mEzjmG7/5t0UGvi1oVCIVKvgC2n2+4bm5
         Lz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846270; x=1775451070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKmfxj9lYsf73NBF2dYNq9WOcQ5WGyYMLr/gxZDq6dY=;
        b=S8269lQHEDyK3XORNG1FnFg408cz68ZVCIS5PQndUn53HiaqdLG8YxuDfrvJ1rjQ3D
         N269t9xQSnH3BwpT9/D/4ot17nWSrCjxPHfzvqay0/J1uAcVj2wmQiQX6G8SBn9Nye41
         1HJNg6T0c2gZEa2nZdiUQ2eNoPYAJ6NgWgagtH+sZ5GpCFs3l2VyPDakeA2KT+AFSbo5
         RQCetztWc8F653ZvtOK2Cg0Ci1jv8RcalLeUwmXnyQ9mtE4JF6IdAJPAloirJpRha/et
         jYANZKmnHN71fcKUlQdx1jvcuodSzM8RCDU5zADqIT2KDfJWKbA+i3PZLKOLFCD9Ea+R
         OJyw==
X-Gm-Message-State: AOJu0YzkRz0u0Ol0DGRbqcybuS4Nx2CRyZeslv2vrMg0cmeCeFF+KAeq
	lLzonZuLbBQYCGgYqtDNMeTQLwhNnQmMUMSMNU3c456rMeOT8BfjvZNCvFLLHt9Nc0Vd3Y9iXI/
	3g5F/yYZv0m3vPfARYukGjXc+hQR3IJG/YHKKcJwviNNpj9dU3wXZxiRLrl8yAGoF807ifSX0oD
	2Q
X-Gm-Gg: ATEYQzzcfWMfhGmPZEB01ESxCLiI0FcXZd//e0iojOu/7IM22uOLpn59s1wsgrn2wTf
	JQSx+983wEVTs4+68QplTFWIR9EGoK/lO9F7G06uOCTdLy0NmYWEyimiIfS9rJY1dlecQLDWrWC
	95rh02ad+8vHwGlNKosbcJJEG/g8pAAmajB2zolLox5D7iJ+IiokFKZqfwkMVNMKkKCtTBeoCly
	GviaGzXgx/d8tvIVxy5aJ8qsWEkzNXWe6gVMn3TwEgo7f9SDftiLi29Up5lWArAJfv8Ki2GwKN7
	fz8h+fcqEX8JVu1r+gBcTeJ+mmj8YxSm1ldosHhl6VHvXFsr82E9+RsVoowb9dQQynXHMpJzYh5
	QwjjZ8TSViObpLVB4y4CZ/z64/DbsFNT7hUtXZwPktTv6YYmalolZbPdK1mQmPZxEFAiMX5o7DI
	3rtgY2kTh6xXhXklXB0j6UKBB/lZUPwKe8TwSNzs+D/K0fgfWRXpXagrsx
X-Received: by 2002:a05:6a00:440d:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82c95d4fbddmr9946277b3a.18.1774846270483;
        Sun, 29 Mar 2026 21:51:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:440d:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82c95d4fbddmr9946259b3a.18.1774846269960;
        Sun, 29 Mar 2026 21:51:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm6776896b3a.4.2026.03.29.21.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:51:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Mon, 30 Mar 2026 10:21:03 +0530
Message-Id: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcBymkC/23M0QrCIBTG8VcJr3PoUbfVVe8REXO6Jsy56ZJi7
 N1zg6CimwP/A99vRkF7owM67mbkdTTBuD4F3+9Q3Vb9TWOjUiMgkBNGC2yGUQAl16mzFqsGgEp
 NiZACpcngdWMeG3e+pG5NmJx/bnqE9fuGym8oAiaYlqB4IZkSnJxcCNl4r7raWZulg1Yvsg8Dx
 I/BksEqLg9S5pI29R9jWZYXucp0DPMAAAA=
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774846266; l=1865;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IbMfSA/YZ81DtiE0UDc0yWJ9qnzluHNhmHfegFBS4zs=;
 b=2RUh6vn2ZqA4qRrimPbl2CIuEY8CQHZB/7Xvi1b1APO4Sy32LE4Q2ilNOIiEwNH2aioYkSdQ5
 ZF0DenxrzNgBkB2ZiTK6M+CSn1RXoe9bdKBPefH/o1/FEKbpgKEc1Vs
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfX9He1vuZ09nv0
 5gV2kwbx9gYTUov/p4vgfKit65mlCTDimErp0Fb/OaPa5wMK0DGDBHydG9/b5RIZxsYgpbsr+/A
 BxKNIRmbBnBBlq+9QMz5lgAV0ElAroIHGQ5RaIxI4EfdEWWvG+VXCjyNNgDw32PkvzcW4nnvVtu
 gtFlR4QbsoYbcFJmmndE6LckTK/hoKuMsQQpkDED7/NgW1Z0qkfcBBPsN/guhS1P2oFvRmuzkNd
 0gwLGGsB3NA3DVUepYlDyxJ8mz7llLyoiqyhiSyNljODGWpklWVFP6sXBTUnEKQaDE6cP+SjHxL
 I44yC1LhQbOrwDAQd0NintInV9G5qqwFZ22fzWibdj8ln/H4BginbpIYEmWEKdZcvKnf7pWmQUn
 DbqjAvqvzfB85wZBLRwZDNRCzRHU+4fiAf7qu6IuIQV3ODqHZC8wG7WGSdo2ytVQh3s+4ywXL+h
 DrS1kE/grz6P1tjo2Vw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca013f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: tU0jx6OpiSbb8dGnWnuxigm7cEUYSI63
X-Proofpoint-GUID: tU0jx6OpiSbb8dGnWnuxigm7cEUYSI63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100658-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56C2A3555FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Fixed the W=1 warning reported by kernel test robot
- Picked up the R-b tags
- Picked up the Krzysztof R-b tag which I dropped in V3 due to the
  changes in the function name, but it seems not necessary to drop it
  just for this update.
- Link to v3: https://patch.msgid.link/20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com

Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
  confusion
- Dropped the R-b tags due to the above changes
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
 4 files changed, 1030 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


