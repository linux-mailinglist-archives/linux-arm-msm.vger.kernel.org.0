Return-Path: <linux-arm-msm+bounces-91202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLCEId+Ye2nOGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29728B2E5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A796300615A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C73534D4CB;
	Thu, 29 Jan 2026 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpXHJ6Zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jcw0q5fg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21634DB5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707741; cv=none; b=oMQI3xWxe8Lfx91wh9cgei7WZDK8Qs+yHd7nFp55P4eS7aUHuyKs9U7uhXnvHCT3mPgaXcUT/Dgb660rDyyX1BdjOAHZbGtJth1Oubi+KikvijH2177zwhmwhkTfM08lBreGi+svQzPoPCMknBbgKJXnFx3EOgKpCCY4VHLRbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707741; c=relaxed/simple;
	bh=kRbnXPSdHLmFaiKUIbrgL3HK/Z36X9MjTvJueasETnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Py2KUhvv6BpO7rJ/7Uu176Xp3w2aI9xMh5djjzd5OSoJhyoqrIMZ4LQnmkGG8nbV9qwzYAQbvmT+xZKN8QG0AeQU9xkLzqrqlqtRlzeuPPEKX6WUufEFMnLrMybBYGfnx/Npf5jcA2XMavF0/AOxejAZPCh/CSSzP771kcv1YhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpXHJ6Zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jcw0q5fg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TH8VgE3900829
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9kubpa1cvLlQzQ+EiE4d/QDWJ2wpwH8jOFl
	GvYefjjM=; b=CpXHJ6ZuvMJe4l8gZZIvtgn3UwRK5hR8m/e7G92sZCCUj9p5tLM
	6llqoQM5dJ63dOjSRnr97MAuPCJ6eihN1TbRimgP8yHSzuC4R0hUi9jTtDZGeKMn
	oiL1EhWXPiB8UU3vcncZMqHGtieArSgzpzevGII7cuz0pjdF3UTefwjmt8nHs6WT
	+dN/NliR1dG5RtGFnNo2SOCLalhILzhSTZLjVOmOBdnumOEUcKfwaQtxMibvY47U
	vX+SvlYXp9vSSizY3u7/kDNVzG2NS8f3y59I+i6OtSyb/mwAK/xIdGZqZrmHLUSq
	3Ril814X+HgRnj856dPos8uPGrOeBpHITUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05se9djq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:28:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8a03b3319so3592125ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 09:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769707737; x=1770312537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kubpa1cvLlQzQ+EiE4d/QDWJ2wpwH8jOFlGvYefjjM=;
        b=Jcw0q5fgthvDY0UYdRCARhIohBSFRi2mM+ykhsxHT53RTPxcZuV53/0fj8L2Rdt+Mc
         KUFUthxBIXdjVsrF5AvdVssX6Up9QhG3mFy3feSd3fVVxW/i4iaOTtahrVO3hPuE3hGu
         7Zp5D9VYuePKhFDWSCkVVCS+rc1ixw9wxy0naANtHPbjesa07ogo3C/CQw0jYLJK3QT8
         tcmZwuQNDsRFaDd77I6e/6TOHj9zx6wyneeW0cp1N2hL2PbT3hZrB9lhTCmFyGQaoJF/
         FhfkBepGeZFgA5Po6ULegKFb2ehrqHDflmdLeCUuRQlXfZZCbdMFmEFcK035OSpRtMUJ
         CYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707737; x=1770312537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kubpa1cvLlQzQ+EiE4d/QDWJ2wpwH8jOFlGvYefjjM=;
        b=VNcDetGx+fNayi6tIgPi6KsNTZtOnqWWVygF3zf1ulgyFy7c/rwkITMEaq4hJWz0YV
         VgpXMMrXtC4xqSTcm2UnYcOY6zbAJvZW8+UgDb25lVJ7s+1GzgjWdISZuFkLi471AiAN
         2+laXGsJ6A9vxuvjJtLbg5fkuSl1c7ItEJFGeR9xkv/jK6sPo3IFLYOcx+i8OYm+DVLu
         ls2fVUORWSbVK18lRUrpe52CpfRfb1NHjEqeo7dewyngo1EP4jD57FvliwTO8v5MoHZi
         aaCisoE/0fKagu0E8JNbEuysIAPdWatq68GVmgNAGh1fvwXysmulkTWpfbOlPPVj9woh
         iOJw==
X-Gm-Message-State: AOJu0YxNVYV6Jv6nOdQEtypm5EsT+huiv0DcKAU/ql2zRj9cmjGf0kvP
	3+6AQdBndfBbe73Erol19mb/3GCZId1Wsgl4wIFMafuDC/bmYDH3wjfPjj5BukHcE+atlFvdKPz
	y+s848z5eDg7rJCgbTuQMimvYJBN5G9VWo19HTmmu6x2yNVPRe1321A27XSfCUxfz4e1o
X-Gm-Gg: AZuq6aKPybn0/AfJ4e3gTAv3x6vr2L7QBGucSHjaB2ix/JQ/+X/YytkJ3bkPi9Kg0nd
	JS9pdlXZB+7Pqw1RBPKQ6GFgbr5mjs7/beIl9R1g/MR7NMUuF7G8xYa4HDUCg4v7hw2VA16ydgq
	M6yU6UHyHpNxdm3d0lTC8jZca01z0VbH9vUs2y0Af2y5CUgbGNGgT7pPbT92Dj58ufIFV5rped7
	IdE2mm036XFQx4ZxgcPK7th3/d+TppawpbNuNqkeMVVJEilhvmR7V+WvecMHwhaVb0Mv3Bpdhhb
	iE/XDc+BoxacMTc554qVGaZ0lsRnIy+MXDcV7RuBXMPP0Z7psMaDFBmep+IEEmNzOxmHjFPzgz+
	JfnCrngzQBUr/ZWBfdI7kMLV9AytQnfawsHI285KB
X-Received: by 2002:a17:903:1786:b0:2a7:62d6:d053 with SMTP id d9443c01a7336-2a88e3d525emr36364285ad.3.1769707736833;
        Thu, 29 Jan 2026 09:28:56 -0800 (PST)
X-Received: by 2002:a17:903:1786:b0:2a7:62d6:d053 with SMTP id d9443c01a7336-2a88e3d525emr36364085ad.3.1769707736368;
        Thu, 29 Jan 2026 09:28:56 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8b47f4717sm37384105ad.18.2026.01.29.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:28:55 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH 0/1] Introduce Lemans EVK Peripheral Mezzanine
Date: Thu, 29 Jan 2026 22:58:49 +0530
Message-Id: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fJFmiB-VdWr7ewHRiIzVgei4brnbaB_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEyMyBTYWx0ZWRfX5LtjXSqBMU2f
 3sUv8NrpX/QqNKOlEJhNbsNMxQ2bE5HDb39cjn+xgt9Ikq1Wbq3eQioOgKkDljm/4a+Sp5f40ac
 C0AHtxtY369JidTvhuz0g9Ju0QiU80yulimGN9p37M+wSBO9a6gttpY/niroWL0wmfYSC7wjL/A
 gVI3Pgc+ebV+O3nJlsKjlRLoolGSxVF4UHImqFVvnYyv1cDTF3Q6XeWj8r0nDo02Utf8ZgbfhMo
 d+pPqSTL6UN6dIEXyQS/v9agkubX4AQ/2VNlmoQ1nwL0jYw7qj0BlfgwvGhIvCa+SqJJ9T2a9ZA
 RD1gk/woXIMtozuIyzMChm3ADIVIojyA5wRscPXPpbjHM5CY0xPytgVx7wTFj6dfz0diB5RIZsb
 j34+y5RCTf0SeH6OkEZmM+lArm9S5+DMXRzbH0Cypl+eKsEBfxK+2oBU/wLLcMmWCW7X6DdI5n0
 fdiHbvjmA1B79nPcOQA==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697b98d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=i9EfSPZJsWMLY0D97e8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fJFmiB-VdWr7ewHRiIzVgei4brnbaB_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29728B2E5B
X-Rspamd-Action: no action

Introduce device tree support for the Mezzanine peripheral expansion
card used with the Qualcomm Lemans Evaluation Kit (EVK).

The Lemans Mezzanine is an additional add-on card which can be stacked
on top of Lemans-evk board to extend peripheral capabilities of
Lemans-evk used for industrial applications.

It connects via expansion headers on the lemans-evk and provides
following peripherals :
- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
   - 2nd DSP connect M.2 B-key connector for connecting cellular modems.
   - 3rd DSP with support for Dual Ethernet ports.
- eMMC.
- Additional 2.5GbE Ethernet PHY connected to native EMAC with support
  for
  MAC Address configuration via NVMEM.
- EEPROM.
- LVDS Display.
- 2*mini DP.

Umang Chheda (1):
  arm64: dts: qcom: lemans-evk: Add Mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../boot/dts/qcom/lemans-evk-mezzanine.dtso   | 301 ++++++++++++++++++
 2 files changed, 305 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso

--
2.34.1


