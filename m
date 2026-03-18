Return-Path: <linux-arm-msm+bounces-98349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPoeFuVkumklWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:40:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DED2B8319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9882A300C358
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A29385525;
	Wed, 18 Mar 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjXtbTiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/4uOf6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25B36BCDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823198; cv=none; b=ExeE+2DpahUx0sfxw0ZXCrTKIyDr44FBjKB8fl8+cztDYIMXUfbXBEirj+Rul3Vu7NooQhdKSrQKTtg99x1mxCpKImGOzpI+AcAqFJE81s1efho1GFA3pM9hRbZ5EnJD2VqLyPABgnno5yP2LVyXI8yqcfSMq1jrp5yTPHDUGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823198; c=relaxed/simple;
	bh=8KLemRvyA8U7Tou0b+aUT1ILPtwWJUdfQLe7MtExwhY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nxA1QMmD6mQjbOC5KNi4ZuyIAn+2Q4Pn9ZMrvZkK7u/w1qq9tSrScHLeSBIfVSFO/2OC/Ew6Clx8Fs5pYKd1zoLM+fNkMGt7XH5Ctd2wUA2KZgGA2ibo92Lwcy5WkQ+5+s5UXWZS6Vll1aHRP05w/FpKMkpAp13GIfqO94RhCe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjXtbTiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/4uOf6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8Fc3j2790978
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2xQdqFYF5upcTZwVd+odhw
	ePsv9KSOASMh+UY7siCF8=; b=mjXtbTiF3rIa0VXcm+N3PNNjzdWXuKdS6tZBN/
	BJN6gZNL1T+0faACyoaJIM2OV6Lx8lD/Ilq8Jn/zo81X3YT0fI3SqXRUszPiyXEB
	qqVcCUkCJ6LVHnfkkmLoS+JH6R38dG/KI+x8k+rWaraDNV+6qmVP/0/YHEAL1mQQ
	wkXmMUU8xMl+9OP/0A+a4fhe9UVSl5L+2LRUXeBmhlLYfwAY9Gm0D+I60WmmA6iY
	T1pDyTixMXAxAGqeHYZBbIiW4hPm+urR2FaCfMGzODX9HUa/tw5P5Nhaz4J3jF9C
	pTLT/gpvoUNl7EgyDpfHwKtNRsKzZnonVsiILDSr71viBzdA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g1kts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:39:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829ad972df6so3761819b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823194; x=1774427994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xQdqFYF5upcTZwVd+odhwePsv9KSOASMh+UY7siCF8=;
        b=X/4uOf6VYnRkCPITWWUwc8+2MTNBvQTSBCIVBc+3xS7yM3+zPBCxfqI0R/KknVxKBs
         KlGjl1PmjtKb2hMjxVNz9jfuFRgE+rC55me3yzbBzUZHC2fJYx3r99OMny4dJif2FG+E
         STu4OEGS4v81KYMpYAYuaimMM8wHARMat+f0r1CQGe/UWNwoy8eIaUxtbaKmiasI6GMh
         yXQjeS2cmPeOThFyfjT0OkjtodFlC4/zaB9x2gYK53QW6rmSgYPbojJEvCfpMTYYaVjB
         yz/uE5M8jgocRsAfn3GNJUGT7dSCKPnVO8eIZSSdUjIrRK7jsRwKqHr+xtd5zGz2z/qb
         qeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823194; x=1774427994;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xQdqFYF5upcTZwVd+odhwePsv9KSOASMh+UY7siCF8=;
        b=n8QgpthuuXM6zcjf7/NiSrCyOtR0xjlHK8vfnUocaSwg6NkwcRzP1nyPsoojsEwYHB
         lkCKTGXalxK+Utn9eSE+QZTXMcax/WBLDc3/hHST/CQE4HwpdFtMYmCMCXwghsy3E0ZP
         i6Vi2k9f4iVp7MGnvQRubl5bvqMk/1Qsz91EX0V0UIRqq63vpWZMqz3O3Q4W3sLpP8wQ
         8ZAFOeoLpWS+kMVJfwjzAcwYwDaWya8JmHq4J2185YpixrAfVqbLUW/znhuEu8wPzUGe
         8bdCKWArLPJXiot/JlYIsDOfQbNiov4VeTZTfjzgR47puHLUH8HE90/LzMNKIrYh7jX7
         BTPg==
X-Gm-Message-State: AOJu0YzDcn0JTwrwKoH25pKpj8hiJFT9Ikfay4iT7zNzCzuVZtQlONVc
	xBw6eAtP5GVW5f7jKMe5QqdPGagsfngHGec4vB+FLVpuft9/XRvTPiSUaXj9/klkCNgVYzdaKxu
	n2hZWAYMzEyh7EtDLoM4hb9YU30zRBX0/u8UYeGZjOgpLLzB2F+9KdFAVaYI6rZ4boqjd
X-Gm-Gg: ATEYQzx4Wk0GGLLQ8r/Ty6pzrE/i1Mpu0aixF/hy+Ep+U399y+UYtBhPhFV7NOapgWd
	X00jo+VVF6l0a+UqSdpGD14sQhatRD79q809RhFziONK2ze5hFEHJFbGg/0E825wIHYzNsel0WB
	k5Ns6KpGQKuYqv4oqB6+4linaVI4l5uvrQ790JTtAap7pdmVaFVV6xoBMSwPzjYQEA5I+vRZ3EK
	LJutxja1jKwTXbfKpQd6XrplsbcsllbfvWxPLR23KQUhcugYZJaPCHOptCsGOMDpWM+rzClqsKH
	EKaoYdOwpTt9Rmh2FmcMnGWQ8f54CoL8Wz0C17WxZ55O/40oBZZCU6MdDAJK8seAsH6suft53qc
	GK0hniDouNfhM3Ydbm/QoSrSaSWwnebk/MPXybZ2U6AmMPbsplU7F0OkTXiOsZCLA8VwC3+4J84
	AnxEMg/lsAjfk2gR5QFzued4Uz9whcID63OjDKwXrA+7HKZBJKGLLbn6lf
X-Received: by 2002:a05:6a00:1749:b0:82a:8aa:cbb6 with SMTP id d2e1a72fcca58-82a6af35779mr2068501b3a.55.1773823194276;
        Wed, 18 Mar 2026 01:39:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:82a:8aa:cbb6 with SMTP id d2e1a72fcca58-82a6af35779mr2068474b3a.55.1773823193772;
        Wed, 18 Mar 2026 01:39:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:39:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 18 Mar 2026 14:09:42 +0530
Message-Id: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5kumkC/0XN7wqDIBSH4VsJP09QS/tzKxGheVpCZqmLQXTvc
 wXbx/cH5zkHCuANBNRkB/Kwm2DckoI9MjRMcnkCNjo1YoQJkpMam3XjjJJeORf76PowwTzjItd
 KcMHLeiQo3a4eRvO+3La728P2Sny8x7+enl02LX92nK3FemSMKqCEK97s7KsqGQAPzloTm6wCL
 ouyUkILibrz/ABCLW8iywAAAA==
X-Change-ID: 20260309-ipq5210_boot_to_shell-43db656579f0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=2901;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=8KLemRvyA8U7Tou0b+aUT1ILPtwWJUdfQLe7MtExwhY=;
 b=Ij908p/ruhzBRYl3BcnS/46dbjz231JgW+ha2Vw5SdAn4uvlP+QiBQ9WrXueT8sCPSWSGM1tN
 arGAli6ZQ0bB7cquSTiWGQG6eDBt5SUPDYvhS44iBMbaUrsTJBOLWve
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba64db cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iO1PHWQBdAPoGl4AmagA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RqD8aLMEAcvOFLnqTymfKHEsKkSHVdtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX2lmq4qJGqPhs
 hrCvbJOYkAfcV9PVL2cX97hdG1LynbOeE+7FFHGty0YCE6/YspkD+pOxyfdL/G8qfG54WLFIwKv
 dnYgGZQ7GEoUV08uq8PNc3vntH9gDg2ElUwqG37sGwtaFlvQU46XeIb36VotLDzp95D+Habp9Bh
 tHYQvIYA1/ogERQOoUJ5uO9mkqvEKZJSB45v6X99nQN61dbKbawYio5WjTq8+hmMQwO00Cldi8n
 9EDp0SkwSPk/ed/nFYeyjJBoUKrNzia5ivkSubDShBff3dNQ6qqlgzIYWHD3YeLhbRb5wl5PAEW
 ITHNv3aHyvbxL5P0HvH5jGknBmsCJMOdbSvNx2j0SsvgyTn22niblGR47Coyj2/DHPsqeSCHwl8
 mbMZwpmUSxVj8f2r50KhUYaOFHemSVNJbt6/wegOjEjkDLIPeKGbivthu1Mu+8pR9DadFi/zOxh
 7xkUnq6XboU+A8FY5IQ==
X-Proofpoint-GUID: RqD8aLMEAcvOFLnqTymfKHEsKkSHVdtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98349-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76DED2B8319
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
series adds minimal board boot support for ipq5210-rdp504 board.

SoCs based on IPQ5210 is shipped under 2 different marketing names such as
Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
F8 parts has the Passive Optical Network(PON) interface which acts as the
backhaul where as in N8 parts it is ethernet backhaul.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Separated out the TLMM patches into dedicated series
- Dropped the extra ':' from the GCC binding
- Added a comment in GCC driver for the need of CLK_IS_CRITICAL
- Various cosmetic changes in DTS (inclusion of dma-ranges property, \n
  before status property, lower case phandles, enabled the QUP node by
  default in the DTSI)
- Picked the R-b, A-b tags
- Dropped the SDHCI binding change since it is applied
- Link to v1:
  https://lore.kernel.org/r/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com

---
Kathiravan Thirumoorthy (6):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC
      dt-bindings: qcom: add ipq5210 boards
      dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
      arm64: defconfig: enable IPQ5210 RDP504 base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   86 +
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  311 +++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq5210.c                     | 2661 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 12 files changed, 3391 insertions(+)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260309-ipq5210_boot_to_shell-43db656579f0
prerequisite-change-id: 20260317-ipq5210_tlmm-df221be105b5:v2
prerequisite-patch-id: 459d23e18bb8cbed98775775e4e330d9a45a36d4
prerequisite-patch-id: 7ed57adb6c96a0c74f5a13321770595919456ac7

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


