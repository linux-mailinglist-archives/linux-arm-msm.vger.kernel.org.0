Return-Path: <linux-arm-msm+bounces-112662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1S7NJbZ6KmouqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1E67033F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hRZVPin/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QaO0GCcv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112662-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112662-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3BA4300B9E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8162B390226;
	Thu, 11 Jun 2026 09:03:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE013749EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168606; cv=none; b=Upz/3UILpw6QWfTIWIPQGQmYdVP0MBA55396VSxx/QfqVDzfRikUKPPZQ7mmquvOCJtKAYhk0flQNs+cD+DKUPfP3PF5isQ8cusSHpZftOdWAEUGsru2xoIErevwnnK7QLCevYUpBURz5MzXmeOVBUJvIAxNePeTv62hSb40NXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168606; c=relaxed/simple;
	bh=axDb+Ty1CX4/IKRVgSK8XXCQL16o3/4/13lR+5cK4M4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lv10kTzk3FLxLcai9rj7u79C058jILSf4VVrcIQq2SRzVQmllNgYVgWCZJ60tarWNd2hhgj1k8Hf55JjyO31sXvKRjg6nxRrtHmmnjGDoEdY4SEaINVOh1YGgekq7FXedpkXQgKkAA/pixfh0D2+0xhtSefKAMeDOZ/dOANnt/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRZVPin/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaO0GCcv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GW2I3761557
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6sVOtotN0xxy813wqL3hRN
	DDiZZLjmqdNer37sSn9r4=; b=hRZVPin/OWjB0VV3sOiMdMuILGd/K2Z+Jzr1d4
	eT4ekoxyafHgvig9S39HI80QqzkcS6nSgL7aauiTL0+aeFVFIA3TY6ESsS35uNe4
	dVNxNY77OXYK0vfl9fAMFYmqsGiaMBmlGPumezorj/UMKIm2jXDao96DlpMREA58
	aIjrgM1bLK7QjmG12lRVvSGeXnOdVj+KJ9fzuM/wnOmP1Xe5bhOmpj0PuLClhjik
	AyrYVKpgb3E8z20pNBtuO4VyXljTi3DEDwI16hiDwsMF9NN/YcjijU6YOZ5BCa20
	S0jiOGp1lp8fxtmY9iWleqnMN9xtb1AB/4jiByjiwNBPaosw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjnwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf243973c2so54313855ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168603; x=1781773403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6sVOtotN0xxy813wqL3hRNDDiZZLjmqdNer37sSn9r4=;
        b=QaO0GCcvTfuQRcAaLmKsS7+S3c5FCOszLzDj29h4afNLCWYxBfJ1qW3A7lpFnUAqN4
         +4gsKhdgivLrqdSyK6Vbnw2H4LQbjnjSZJmWTgiDTRrT8dsH+fGUEsTBS2uNWrHYUYiP
         oV+Vco0oNh+QweoRRScxlL75BKdOoGZkwvkC8yuBltOB+A3Rg9+i2oSSfhZiyx1cFkxz
         +uTOtbsLs7uPAX9BOtxEn6aEkU0Wz+XzITS80xrlr2N2RmrDrV1ZfMP7gCWFy45xoqAZ
         v6pbe0B4QUO7yXFDVMO2X818jsRmvgmJQpfffivXGvYDcjQpz1sfZjw7UwEYS5G9+jt9
         JzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168603; x=1781773403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sVOtotN0xxy813wqL3hRNDDiZZLjmqdNer37sSn9r4=;
        b=T57MhDKCYDCWLYanQHtoqc//xFFU0qek3kK4/s7gnZJrjDLlLrctTX+w6sr/DEP4BM
         jDAN7GJ/rWKjp/jRFIUZWzHGcamy42sRPYrRbirg5EPWYI3OQpWqW0Y7RcT/aiNuAwps
         7R5gyBzMCX0zaBjXrrjMhFnNQ7BflS4sKZ1yU7bJHkGkozrAoMpbpO/lEXeji2mRrsjd
         WDpaMzjqDal7eMpEq1qLaYI5L3AJu1iB+gPZsImTlOTW1UC5MaOe6fTtNH/BSikFXIxo
         uZ6HwgyljixExkjqUZiWSsEutHPCYUtqu/ImY6XdkOrvx0yQitOXyPmdJ6Bhc63ybayA
         M/Bg==
X-Gm-Message-State: AOJu0Yx35n3w/3VRbcBLxSk5ljhLg8BHSsx+Fn/wRRRPmf0XNHJXC99X
	hliwNmkLiLCuesuDOGOttAp8w/CrjHOlvyH+DSeaJZYv8NcC9tP5u5tZ/JuK16ihBE8xYyrBxTu
	GktuKW+r2eghbzAOSTP+KKIlcq82UhbtjMvO2bRumKEcNP57t2mUDAOJ5+JzQpPFdJ4LP
X-Gm-Gg: Acq92OF7e6/T1M6qkNOVkfhkfcAZTiS3zZjyrJ0rBMpqr+vsuvbyGmfcafFFC7lYgC1
	6LWmi1/cv9e27NPfp1N7ue7pfpigvBwuZBTKv6u0yjV/OVd7kP0vqBO0WMJwmKhqjqc00gpBwCn
	bgyoTzXvv2htgV1/Nb+3/LfrwsN6F4JjQ5bGc24VqPDKxeL5klp1rz9BPpCgOIRZRsaj5bYsSoZ
	U3p3hA+qI1lPtCY7arQ6EpCQm4r1mToBOMFOpX/adV7l3oxCDKgGY850JWUwdpdbvY2jixuXT/K
	GP3X6rNL/SwTlXc3qdghrm4MuI7Bet9mFMyGZ09uzjx6ZiwDfuWTtvbgfHLOpt7BDLwGON13kgk
	4VoX1cneY4+l1GPVJbKEMloXVvkH/309JtReGpJ78diEy4yXvNDUHKkasKfkOkgoGHEdqWdHcJh
	A3lijihdIQCCCE4omWLpPE8RsL+t0mQJ7ozYl11iubhDbZqRrxR6gVd+Lc5RqL9j03ffw=
X-Received: by 2002:a17:902:cf0e:b0:2bf:bd17:90d4 with SMTP id d9443c01a7336-2c2f315d3cfmr27031145ad.28.1781168602835;
        Thu, 11 Jun 2026 02:03:22 -0700 (PDT)
X-Received: by 2002:a17:902:cf0e:b0:2bf:bd17:90d4 with SMTP id d9443c01a7336-2c2f315d3cfmr27030615ad.28.1781168602363;
        Thu, 11 Jun 2026 02:03:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for the REFGEN in the IPQ9650 SoC
Date: Thu, 11 Jun 2026 14:33:15 +0530
Message-Id: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANN5KmoC/12NQQ6CMBBFr0K6tmRobBVX3sMQU8oUxgiFFoiGc
 HcL7NxM8n7+f7OwgJ4wsFuyMI8zBXJdBHFKmGl0VyOnKjITIBRIAZz6IVcSnh5tjR3PclXKC1T
 X0gCLoz7m9NmFj+LgMJUvNONm2RoNhdH57/5xzrbeIVcg/uVzxoFLiUJbLa1V57sLIR0m/Taub
 dN4WLGu6w/DVu4IxQAAAA==
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a79dc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=VwTxn3_DiD7NDJhMThUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ZaaeRQKPPE5bD2lOdiEtsfsoJ_X2jjyX
X-Proofpoint-GUID: ZaaeRQKPPE5bD2lOdiEtsfsoJ_X2jjyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXwnawYrRqS7Kn
 YYePELxdhnWR0IygghtP3BxwLyoGmSLqpP7rq/N2W/LpCN2/e2a/ajcYFcWm5CZ1bez8JkaZ1i3
 D3NJNn3ERxUiOy/tbo1JE9QZrvfRbpC5SHa3FdD67iHtXfvTAXc5U4/KRsga+vUfEgwOOOo2b2D
 uBbT3IcPANbkKxLHDVTQgy8HqHjGBe7K3nzy1B9G8qKc9Luf6tr0A2oOfioLSIuWxRI9XwQIAox
 VU7ozz8Ej0PkjAEqCiQJif/1EHhKcFsXVSI2UW2ENzJQQQkexNm8JvYuTqKy0JbBXkxfxmkzM2v
 pt1gXKC8OEIawPJzjHlSfwDaE9NNXqLlLVzrA1NdPSYTH2Tyj/1f6c5/+3B9l28a7mBqKCJN67F
 V/AFpLlH1aUR3w+0X9J98k0wjjAqx2o0vtFlTMYsTep4ZinZE9TT8DSIgyegvxXaggz0+bQrJmI
 4sywz73xFpJg3GII2kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX77Rtb7213fPl
 +QH+jQ4GsJEkZ/P0yvWl/NujPQGYZnLxuR6w9txldp4DCgqp6Ktc8xZo27GuI2C+X04u/dIhR5n
 /Pagbjbvu9iJnJjWfs4SkBz8a6hL/Bc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88B1E67033F

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Correct the regulator type to REGULATOR_CURRENT, as the REFGEN block
supplies the reference current to PHYs in the SoC, per the REFGEN IP
team, aligning it with the hardware behavior.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- New patch 1/3 - change the regulator type to align with HW behavior
- Add the constraints for clock and clock-names property in the binding
- Read the REFGEN_STATUS register to find out the regulator is enabled
- Dropped the unused slab.h
- Link to v1: https://patch.msgid.link/20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      regulator: qcom-refgen: correct the regulator type to CURRENT
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 25 ++++++
 drivers/regulator/qcom-refgen-regulator.c          | 93 ++++++++++++++++++++--
 2 files changed, 112 insertions(+), 6 deletions(-)
---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


