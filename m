Return-Path: <linux-arm-msm+bounces-110791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I62EuakHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:39:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F562BB50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EA87304F2E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86A33CBE75;
	Tue,  2 Jun 2026 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsXCy4q0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQDjbozY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7263CAE84
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392129; cv=none; b=pvMS+GBCs1SW5b5VYta44m3vK8q9VK2R2BCi0UnYzL3NCSwsMrfjbHtro+1ns7GnafWdSrmf3D+zQzyKvwIMJAv5RqkDcyJuu6WieUL0zV6biUJ5+UhqWF6vtr0qEdaW+eT99VxjiRDluh6SXM5wHz/25TrKXwZqkxRdHrprjiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392129; c=relaxed/simple;
	bh=CQJ/iTF08gDZ0QuTe5m6xh1x5y8gkRRGP8Ena/nviAo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a1MLJdOG+doXHgIJRw/c4wKweEeou6D6j8TWMtrPsIe/YhNJiDxkJRe8k9TDifv1ye6DJOdRunHHegpvjVuEQkFtDBjDaPQu/jxnNVO7VWkAaPp9rKEL26FwcPfovdQrdd9LffgRYkPqLexmpVqZgqcUnzA5Qt0JA59vKN962Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsXCy4q0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQDjbozY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526KxqG2884679
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DfMxrLb3OJHrMpWUGy9+oc
	bAeO1f8ZxGjFUkokeI3AI=; b=jsXCy4q0ljMmer+AYtZe/xTHa2zXjNGdQcIx+Z
	7QvHnc+qxRiuLP5gKf3rW3z6Ucyt2gOpcjdK9Z+sLPLcUTgH0A2LWZ2e46BYcSzj
	SyRQ5io7MFKmc+2ISsS0Te5Zzmchd/jMiZ8emt9TCIsLrqM0kWG2vPx0gAKJfeGG
	TdbcqxpwGWhJX1dsc4z6Av1QkCWBVeIdkYcXR1zyIRaWsO6ea73IaV1iE3euxkTN
	bP6QNG5DHHNFqBJfQp1HhgwjIwrRDBLALi295Ep2rbW4OBNqaxrG/g9Fuua2FKkx
	swBuwdal3fgVtua9Rx1opy65OlcXJk0jQY0b1CANw0j7Eq2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu10qt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:22:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so4188134a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392126; x=1780996926; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfMxrLb3OJHrMpWUGy9+ocbAeO1f8ZxGjFUkokeI3AI=;
        b=eQDjbozYwFhT+Rvg/sD+NGxfuo0mgTHtiury7lGWvuJd1hVE5GD//3Z7RQUF7WYHxr
         R/pis6RiE1R5+Wyj+FYIM9b3AyLV100yjX7iIN1QbPTWMxie9G3C89dTLpUnQzKWPF0y
         AJ2cnEfVN0swF7A2gRR2J9s8BiAFBinJA85grEt2XgLoKQ/qBxvPPx71Ky2opCFAFkfp
         59zfALFawysLUOMOzxaqlBGFfZo46jBihZXcRwauWIKVUTZkA9DF1p35q9dnnxAVIXzD
         yS3NvcKBWJHrDLkLADuXKGfmXpABvMr3wMlhdje66uHi6C+lzzFAz4t0Qb2Dy8Ipw6ms
         JTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392126; x=1780996926;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfMxrLb3OJHrMpWUGy9+ocbAeO1f8ZxGjFUkokeI3AI=;
        b=L0g82JZGPYTZFsm94CqDbYInTzPQl+qFQ+EBadtC0BzSbjOdfevPnNeyditZ6+w5dL
         arsRyvhjjzDEaQF4mjaYUk2bNy6LO1m4nHwq9ZSvTKOOiWlg8dGO067oGwMvOr7R4KVA
         EGS7zwsG7Xff++ue+8j+pXzl9PTV1FHIjR1kALu9LiMAyAMSSJv6/Cga1POzYBuOxD5d
         gbuxD6RA7x5Ny9Lo2jXBTmXrhY0V7mRlFRcT0B6zWjqcBYCxqQq3+6Z1gzg0RxsB+hZN
         3xy60Lhm1+TdWyBVuiOaHhpsuSR7orzNllAAab07demkuyf5TTAq190lKgFEz/TN5FoS
         4Q8w==
X-Gm-Message-State: AOJu0Yw5SKk+zHQLhGQz0SU2JI+s+gTlUadgvcZW0mcehjac43BcgJ+W
	KZBlHnN/HQKtXdlopKmJkI/NagR1adQ91hwwWe9z90pLI1INig+ZcXFx7uTlSg1Stbut66Qfthc
	iTNiG6a/LubvMmv3hWvgGIxGx8VcQGo8wWGCxtbW03xx7MMl6u7hJpF7MMk13pE1u5s0s
X-Gm-Gg: Acq92OE2bAnzYQHwXll6BqmAZdcdkN9JxvmS4C4e44e3ldTCS6LbhJ/cIGgZZHC9HcT
	eZJ5HIrd1vm0CT2y2SbNZLhoVVhIVqKByMYcDlFR2UnC2PA7YePjBdNAk69GtKl2cacHS5M9JAa
	iLW9+WhdLfX5H8CujJ2nYRf1FimcsQSMEmkg5iff+slVd6/JIEyJ5x+UV+jBUXVEYfDHEUHDrHb
	l6xKUiN352z5oE5qpwRZssfbHmVmdJVgU2LJK8ddwjnFY/gdzjKIa8FD6SWfWCsPJCWOu9CKjB+
	duVOvK8RedooydlyZBACEPWDWje8KRA4NgcWSW90ChYTRZSgYl5QwQ81DraSQsTFh4I7udm4RZD
	ns1JtjWKnhQFvGgvbHEuX7v+Jvm+pBYThuBHggymYZ89fdXGt/t9rSZxce3w7cU47UcUvdm3r7D
	riXWh1RCl/wbRVBkqqqptyBeV6TkZDXD9OozNgnAWMzVwssQAM/riYDWO/i5umnAs9OKA=
X-Received: by 2002:a17:90b:1d44:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-36dd91f3ba0mr2368931a91.5.1780392126201;
        Tue, 02 Jun 2026 02:22:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-36dd91f3ba0mr2368911a91.5.1780392125751;
        Tue, 02 Jun 2026 02:22:05 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2154028a91.11.2026.06.02.02.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:22:05 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for the REFGEN in the IPQ9650 SoC
Date: Tue, 02 Jun 2026 14:51:58 +0530
Message-Id: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALagHmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3cyCQkszU4P4otS09NQ8XUNLsyRTc4MUi6RkAyWgpgKgeGYF2MD
 oWAi/uDQpKzW5BGSKUm0tAFTlHw1yAAAA
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Hl8xseAmTngxCgHiVPCwRgpg73Y2XZtO
X-Proofpoint-GUID: Hl8xseAmTngxCgHiVPCwRgpg73Y2XZtO
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1ea0bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0aEQT0Sk7kFI2HZY0TQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfX2MPDuRX74Kkd
 5DKfqPSDAiqsm8cn5jnYFOCIgGnQ3/6vg59XR3LC+VNlAXbGAvpkMB2t35DZmXYHTiZQqby3bWf
 fwPkUyRM/5LLTs7BALGBZs2RO1cbFWlTe6nxhJzOrWT//qESEXJzGw8++6lyOef+bDnigx+elQm
 e5VzmoQu3OoL43bcHh9/iZxWa66X0ktnp6GuRN7bZO5TbltLQn2HTLflzAoW3FI8GJmoZXzX9ZL
 WD/eqccSpxiNCV7h0n68oKRC8vMM596yxkYYsnKTndlzM4klLjJm6q+rKFW28MHNb8yD+TpQMKN
 pv7ij13Kz7KRZuse0CUiwaupdUH04x+hJjRuufMmWEBOnu/Ly1fNiajvOllszhgY5geQ3dWElQh
 Zn3SJAv1aBgHSwynNVWNF9sZn0d/1LpACU2ChJgrHYX9nJ1buyn+lYujPFn+dkhadpNW+u9Mvgd
 RGZ+IvDIIfyubHt9UoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020087
X-Rspamd-Queue-Id: 9F0F562BB50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-110791-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 21 +++++
 drivers/regulator/qcom-refgen-regulator.c          | 94 +++++++++++++++++++++-
 2 files changed, 111 insertions(+), 4 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


