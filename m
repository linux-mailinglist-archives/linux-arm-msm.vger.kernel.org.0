Return-Path: <linux-arm-msm+bounces-92601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFolAFiEjGmfqAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 14:30:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749B124BF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 14:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C7473011C43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 13:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9E3261593;
	Wed, 11 Feb 2026 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDulmL+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfVWqaNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED5212FAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770816596; cv=none; b=O1GAVTHnyV2zWpSIr1r3ncjxWGqyTWFdwLYTIpHw7s4s8MYGCYiJtsVUbtc42klTNKQnLtvzRprylY+40SQBAE2FpRiAr17P2iKNEsrQ00abjZXSRC64C3l4pmzlPgIx8RUzN2u+Z3RfkJCQ0s2i+UVHh+hQa7oeBzJPryCRnzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770816596; c=relaxed/simple;
	bh=F8dlGzylXsUZhimrq6/FNXTDw5cd94/cgBPDlPbZYrY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I4TeOU6YvcgAOkf9mt8PJ+VHWWeGDjCDS9MZOTSdjPWc5n1n4A+WpV2mCkwUovGgeopYWkDwcRWy8N5KTjD7lDdafXEgURnxOGcejYCM/+ouw+1xzyBux88b/2ZpK+kCXTnTkWPZE1PggNoVYlI50p2ZwiKXClYlwsVvQgzf+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDulmL+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfVWqaNC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B90Bh24177839
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YDSGphfqFZHevoU9vCq3tM3+41gKEg0Wz8i
	vxkG1eS0=; b=lDulmL+NGReNGymP19CwwilGoeXvz6NthGOGbaKie3/eqgTAxzU
	Srd+2bbBN7M8/G/dfJjilHaajSmTyb4diUJTaKIV29s5w7yEaeWawekCv1saE9A1
	y2sJTF+BKh4cWK5EmEAtLoe/5OceMYymi06tcYHU9s1lfElPY8x7AEbn+ubCnYbo
	jjyEPmNqWXAu1ArhatcXno6nRTiG1oC64MuSa8zWQCjChE60+NvJsi/i7GHImGOZ
	D/ulxXP3C6H2HlvyC9GjRT9BNrluV5MEkbtEDXrMfSwKh7R6k5rwDHKS/nLMaDbP
	6ynl/9YCEwvDeHBJJ1x3KoZ6Csgd1O2BHww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c879mkw6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:29:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e185331c9so416608a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 05:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770816592; x=1771421392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDSGphfqFZHevoU9vCq3tM3+41gKEg0Wz8ivxkG1eS0=;
        b=KfVWqaNC5M9hlflyvBQzwaDLYx1uyMciUQQ1Scx71nxATCEN1DBI5/1uj0nINVhPMb
         FpJPTIpsr3mLTNg/YZu6vqLsu+PvGawAOwumPqw/ivUYjV/rx6ZTd2WyuYLWSoTcJEb+
         I74UjBJxRAGIavAPIj6ZfvMOZzUIkPb5Pp0TgwOTzi/gox+hoUU2jtDW2PVuh/G6xyJY
         Iqvr4ZNX9YF5jW6VusMsfOpqrpTpfwn0r3d7ZVGzR++9c2PcXmULoOaYPTs6XKykfiFo
         hUrdprS8C+IJxssjhyG2mElqDPxA8nriskuBjuhcIIwaK2ZwMyiT5vdiVeX96VU6I4z5
         +xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770816592; x=1771421392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDSGphfqFZHevoU9vCq3tM3+41gKEg0Wz8ivxkG1eS0=;
        b=xSGgpMBRgS0uJQ5Ih5kan5Zxj8XJeKweL5vk4tmbOFRfyPpYtAax23DY9Qft5TcMAT
         gp3GTucLO5yaCUc2onM9pHXbf6F2Jnkn6JEUN7qIabrkeYtpAlrJFxiE1OwTiYCPTjan
         D1fdaTDtdEDK6dso2T1uf9IeoarOR8QjrZz4WyXy5pVbQZjgDqenFZsYlg+xPE8CBM4H
         gc3/+oGJdmVM/WPdMn4ADR0aGnVWl/fmbjT54rO5K08+FnGmzieSSCdyWe+6yvh8+wSj
         RGHn8wSqvJB0USyk/UcbdK4KoHQKrb4A+3KCX4y2L3AnrguCoIMrt3QT9NFzvu+eZYzk
         8/eQ==
X-Gm-Message-State: AOJu0Yy855hf2s4PRdzUe+LTx4MuFo7N+miTDBkv9pTrbcyJYpdPPH+W
	OpZmzggBSBN/sxmhAre2vdpKX23YAsy8J9rp2z5hHzH8XhL9CIEePdmruU/TcyCODXFCUW7n+3i
	0fmlJCteQQhQnU5PpB/wSDAAMyxxeSiYUeu1kB8J9HGZT8BoDr6uXGXshcRheZOc5o3Ui
X-Gm-Gg: AZuq6aKSvKfOmCSC0HAC6KcnsD4MehUbkgTk9Fi9JaHTSUMrFyOh3li2iOBEShKH4+P
	mBm29wf2zasOA+T6kPyb3S2RtKTBzRxU8zEYVhuFakNnbdjskIKrB+X3KE/QxGSOH0HMpqnjUjk
	bHKGmMq9zElBAirYYHAHEep3XGgr5U5FMpi0AcpecKoY6e4CNc4pzi5Z2StbkRFJdDD9jFbj7rH
	cB9jFlYy7LNxkDi89qwTmLUOJXoC7A6VGY2zOjHWzOcUo7Erv8wdqkJlZKSOXgS/Fwg69Kfyz9k
	jZkm89yRo9djPPOzj8waK+pP8HO11x4cxIDuliDkZSgp0L60N4k6iPejDZDEctYKtVkPBYLsGgw
	Mv97DrKgovfsLy7KJLsvdLn7vkBjByZ4hDWrPKRFgZNjvQ1/V1+egvLeqFmmFao6Q
X-Received: by 2002:a05:6a20:2453:b0:38d:ef23:12d1 with SMTP id adf61e73a8af0-3942e6c6040mr2508644637.74.1770816592413;
        Wed, 11 Feb 2026 05:29:52 -0800 (PST)
X-Received: by 2002:a05:6a20:2453:b0:38d:ef23:12d1 with SMTP id adf61e73a8af0-3942e6c6040mr2508608637.74.1770816591817;
        Wed, 11 Feb 2026 05:29:51 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e84bc1asm2143655b3a.58.2026.02.11.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:29:51 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V5 0/3] Add UFS support for x1e80100 SoC
Date: Wed, 11 Feb 2026 18:59:23 +0530
Message-Id: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UKjQ3Sfy c=1 sm=1 tr=0 ts=698c8451 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=w1dworix_CjMrjKQpqQA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEwNCBTYWx0ZWRfX7vnSkNrC4QGf
 mOlVTa1WTbZJtOM36g9pT9D+OtiGZDPpZUEaKf9UkvrzBMJbQUjKmHKBix4r7+FAp2CyC+ahcDJ
 6vSALVfEglkAT0/87jIm815LzZznsvTJuf2F6eslC9pdsWAE4ehGBqxcn+HKQ7SJjzyVcWXey0a
 mQ9GJUpUNA2wylnTyNy++fuZdBrOhVkqmVXIkC7/AfM6X2vxfkM6fTzBiAEgcZSRrieVwyThjhy
 j81psu0UI3cuYRFa9VK066x3DLpD8C1OKlouEtkzvD8rds+fb80qlJguPYu3lU56fpDjKd+I7rn
 1wGYwaC+IpAHsflPT2ATCD5RX6TrQG9+ngr4mWMjIgfyGNTxTMU7dZcNgTzdESRuc8ness+XSAE
 QTfWh94JQ9zxrN7yGJh70qgYWCL292aZGRMDH/Pb0jtAx9ZTd4Vg0sp7kb2vR7o4YyI5abs7TzR
 xzHjYMTPsqPIPcGSIpA==
X-Proofpoint-ORIG-GUID: 5Eatob2pi51O4imLA6W5aJcQyTFt5Inb
X-Proofpoint-GUID: 5Eatob2pi51O4imLA6W5aJcQyTFt5Inb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6749B124BF1
X-Rspamd-Action: no action

Add UFSPHY, UFSHC compatible binding names and UFS devicetree
enablement changes for Qualcomm x1e80100 SoC.

Changes in V5:
- Rebased on linux-next (next-20260210) to resolve merge conflicts.
- Add RB-by for UFSHC dt-binding [Krzysztof]
- Add AB-by for UFSHC dt-binding [Mani]
- Add RB-by for SoC dtsi [Konrad, Abel, Taniya, Mani]
- Add RB-by for board dts [Konrad, Mani]
- Link to V4:
  https://lore.kernel.org/all/20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com

Changes in V4:
- Update ufs@ with ufshc@ in SoC dtsi [Mani]
- Retain complete change history in cover letter [Dmitry]
- Remove "jedec,ufs-2.0" compatible from ufshc dt-bindings
  and SoC dtsi files [Krzysztof, Mani]
- Remove RB-by tag from Krzysztof and AB-by tag from Mani on
  UFSHC dt-binding file as it has changes and needs re-review.
- Add RB-by for QMP UFS PHY dt-binding [Krzysztof]
- Add RB-by for SoC dtsi [Konrad, Abel, Taniya, Mani]
- Add RB-by for board dts [Konrad]
- Link to V3:
  https://lore.kernel.org/all/0689ae93-0684-4bf8-9bce-f9f32e56fe06@oss.qualcomm.com
 
Changes in V3:
- Update all dt-bindings commit messages with concise and informative
  statements [Krzysztof]
- keep the QMP UFS PHY order by last compatible in numerical ascending
  order [Krzysztof]
- Remove qcom,x1e80100-ufshc from select: enum: list of
  qcom,sc7180-ufshc.yaml file [Krzysztof]
- Update subject prefix for all dt-bindings [Krzysztof]
- Add RB-by for SoC dtsi [Konrad, Abel, Taniya]
- Add RB-by for board dts [Konrad]
- Link to V2:
  https://lore.kernel.org/all/20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com

Changes in V2:
- Update all dt-bindings commit messages to explain fallback
  to SM8550 [Krzysztof]
- Pad register addresses to 8-digit hex format [Konrad]
- Place one compatible string per line [Konrad]
- Replace chip codenames with numeric identifiers throughout [Konrad]
- Fix dt_binding_check error in UFSHC dt-bindings [Rob]

- This series is rebased on GCC bindings and driver changes:
  https://lore.kernel.org/lkml/20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com/

- This series address issues and gaps noticed on:
  https://lore.kernel.org/linux-devicetree/20250814005904.39173-2-harrison.vanderbyl@gmail.com/
  https://lore.kernel.org/linux-devicetree/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/

- Link to V1:
  https://lore.kernel.org/linux-phy/20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com/

---
Pradeep P V K (3):
  dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC compatible for x1e80100
  arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
  arm64: dts: qcom: hamoa-iot-evk: Enable UFS

 .../bindings/ufs/qcom,sc7180-ufshc.yaml       |  36 +++---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  18 +++
 arch/arm64/boot/dts/qcom/hamoa.dtsi           | 122 +++++++++++++++++-
 3 files changed, 158 insertions(+), 18 deletions(-)

-- 
2.34.1


