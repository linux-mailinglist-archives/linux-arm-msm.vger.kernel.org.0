Return-Path: <linux-arm-msm+bounces-109391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCGMLB6cEGpuawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:10:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EADA5B8D96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D2E4305045C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81E1366DCF;
	Fri, 22 May 2026 18:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lf2+x8vn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGhPuY4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267283624AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472958; cv=none; b=S68IoEojVhNkZ7y60+d6YZxNH1JGgDdb4qzrarUWVjk8SmEKSXdqJq/xbj8r0j2DrcMlQ33aENLnQRK5u/kNGQnPVQ/rEMrNP3Rh4523tzKbP7eK7yarNhe3kb5rl7x2jFDnVNwG8oUZHroq2PvcngTMUEmLxrFXjnIpynZUDOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472958; c=relaxed/simple;
	bh=pZroIWpiG8XOhgJ3fd81k0YYBbfDqwIwoXH9oA7369Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O2fVy+Fcdfpe7q4b1rufRcBgquxV5IQaxbUl/w9MBvcEy6itQrkfe0Pp+46TMSQhE1airVpKyWm+hMtAZSs11sYTWhZY6DR6Ylghuj38R9JpeAoS3yCnuKfQiPn/dA3aUdWEnhQKzloRj1psex74hWUEFzvAbdN/rFYOCQ0YuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lf2+x8vn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGhPuY4L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCCZJ8778849
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tGUY0HP0Ge6gesCUfbkPJg
	Ka31LyRObnpgZ08bQ4lPo=; b=lf2+x8vntcDy9evL/Ce/64SRG375PNTOhd3PBL
	TQ3NqlpVVvOleniUi+TnoRP8rGcqrgFktgN8Qgu1RnrPZHPttmkfh46//9ur/wOh
	9UF4C4FXoP+b10U72T3mwwwcj07W176ovTfCUH+Zg6kOg1oUoL3/WUbNm61m1iiZ
	9/WA/Ph6A8D0VNPbkwjk/3Z99tc5bDCmK3g2EMoE3s9Vk0g7kWtXn77vBwDl6fm3
	iNry96w4sMtLOGgRP6TM7VABdHyfAaOlWiyDHEgE4ko+iArkRcyM6kuL9b1CJIAt
	6ZpRG61yu0x9To1t9YBPe7xW2qwd0PxFmvxelIFkX6CgGooQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7av253-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so171399485ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472955; x=1780077755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tGUY0HP0Ge6gesCUfbkPJgKa31LyRObnpgZ08bQ4lPo=;
        b=bGhPuY4LB0zNLcgCmoFMbdYtzEzv2cViCUKiJUpdDpURjhNtjOsUc4GDB4W9W7qSAL
         nwVH25OUsrw/pxwmp8TO+eKt5Kduwu8o20S1t5VI8dC7rOUJ4WodcnuiAYJ7B6pGpglX
         UFn7tT4fIUGMH5vehsiXV0THQ1pVMQJrRAZ2dB/tEUhDCjW2J42w1/Qq1VJ4BBfuGLGi
         S6jz87BhW2F8YZxjCcw/euDE9SPbpUZLIx2fylkEYWEPOHqT8zK7ZVZCWvPuJZFh3bDw
         z0lySt+j7ebsRtngbIPKUGnT2Cqjox4IBYBpKvmSO2n6WdX+b7ZDh6lsaf3XeVMmpbxp
         yChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472955; x=1780077755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGUY0HP0Ge6gesCUfbkPJgKa31LyRObnpgZ08bQ4lPo=;
        b=oYDS9ho+SySajBFRRWEk54AtwGQu3e6D5D7MNwWqGlilIcIdUkQV/jZmqHfiylYhcV
         G+vitLH/fhyaG3pWmfqqYvJVEALD4Cw89SWLbo3okl1But3EP3YbqzdfgmzoMxsdMkp9
         GI6ewvN2Fy5J3lnmWwCrqc1NzHowwx9ZcS44tswxGRaKayj3xnKssUHw6Q2tzZqt/BX5
         35gG6NBDK3+P9F7Z2FInTZ5SQi4IGNanJo0uH/sWIXfeEpeiyhFxOf3N3KOdgs3bYEWb
         aVSHkDmyaSDM6ZzV28mfkgdcaSBM7UZczDzT8KC7Ve76pqVWJtHuCeT7M/wKShe+Djdq
         uNjw==
X-Gm-Message-State: AOJu0YwX2jY7MYOx2beU5OA9ose7yElI2HtLpIl+Ky2CWWdJIN5YbnKS
	XMg7vjiNvfMKYepspbNjso6fxi2UDh5MSfVcciMIRnuroGxXo8tz2miE6Sv+U3jR1yNTKwwInkR
	fbpa3IMDsxOXKS4ZB6DucxGEd2v9sCt1nbVs0aTD+1CGmj7skI8riJtuU+QRQ5GuE3wXu
X-Gm-Gg: Acq92OG8CzrDSoPmoUP6d0wGuTzrv/l8zYs563G0uWAm7E8kIv1AMB2uF+QLJ871YUM
	v11x91inolE84uspDkur0lsbnA3TuktWxFn+T3ExuoW3DHED0Q42hV3cPvSww+JSiTpdy+6nH0e
	1bUH2Bo1N7X5R6UR0SdyP724s1arjfbDSQtJf6xHahWqZPT8MdmaqPzOtj939Ld0EacmDi6WjTF
	cxWAj4vOsHl62I3U1x21R/Uy8gvKmgUQA39+OTqQbNBENqIk0y+6VS9MNojzdhas+HwbQovQYMU
	fJ+cRDz5nTgYmhPjuSrDN/UyF/iSi95634FJAIhqKwJpelsA15mVBvTBLhOVNtRAIIOUQFah/my
	9ctBer19cIKkNthU+o0o1XHdXv0BHzH7AvrkT
X-Received: by 2002:a17:902:e884:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2beb0770e7fmr50875935ad.38.1779472955020;
        Fri, 22 May 2026 11:02:35 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2beb0770e7fmr50875355ad.38.1779472954504;
        Fri, 22 May 2026 11:02:34 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:02:34 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
Date: Fri, 22 May 2026 23:32:23 +0530
Message-Id: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCaEGoC/42T2Y7bMAxFfyXwcxVol+Wn/kdRGNqYCOMtkpNOM
 ci/V85eNJnpiwAKPJdXpPhR5ZBiyFWz+qhSOMQcx6EE7NuqclszbAKKvsQVxVRiQQjK2/iWDPI
 z8kp4rbjgksuq5E8pQHw/af34eY5T2O2L5Hy+vCs2q5Mep/qqN8XBzalD4BUxVgbnJTQHXj36u
 FCM4gvVRueQJeACcEEo9c2BPSOWOsb7duprInCbwmbfmXlMGRmmGAgWLK9LOfIZnKZ+8u3FLgh
 VK2YpGOU+KXrJ3hSbBS+n694yoljz4AGAWdwc6FOY3d7Ym9jZ8b01w8lDe04tKj4oCHXQksMrC
 zcVlPt+j2wcfBw2SNkAgYvggJpXr76jsQ/9DTXKWu0pEOnpC1Tg2y/J7pEEEGCsx/Af5OxyuqG
 lVUTWOnCs1dfoLz9ubihjZU7egakJfI3uYErj3bKjskyYlA5j82JQAtMr3HXLb7y2uGbUUh5A8
 WvdPuRs/mZrgongfK2YZEQhgvpxiHm7dtv9YJL5Pua83u1N58a+X5djkbEmB7RcxLlZORKcpUy
 DYVxIQbVhlArBhAanait1KNOquaqWhdzGXD7979OuF0vLRl7Wmj6s9YEgjBSRnNWMYe/xvy4Ws
 dKOBwH9KECLgMPEagyWMy2eCByPxz86Ob5TewQAAA==
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=5405;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=pZroIWpiG8XOhgJ3fd81k0YYBbfDqwIwoXH9oA7369Q=;
 b=dZqMZph64I0imrk1L8NswLOuSu1ctRh3jIwbo7XrRlyNvgdaaPDicrmXefqIh2nkU7W4Isxho
 If0+5GMTwzQDVXNZDnHoLBjaHQdrTJ+22rNu9/8qdJZaljT3MVYDaM0
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: j2FzVNqKsjZdOkurjd7jKnyfEyQ976Bb
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a109a3c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SooAoo4rPY5SEZaVHzgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: j2FzVNqKsjZdOkurjd7jKnyfEyQ976Bb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfX1D7+BpItSRlO
 vzecByHjm+TwrvesIxQAifQH063OcEDIQ4/Na2O/WqPzbSFw1zUaXvFidtvRX/PIEcG42ZPXqCH
 eUYVjCm5iukcpq3F6imXKJj5otT8NFNfNUxBY1zaTfqYGJdosRZ4GUvzqaWidQpN5umuKBjGTjW
 idgm6BoTZduIFDw0tQBMo8wZEqzFX+Bjahqqak4qlbtbJz7N3yTzxHR8OKk65uBAPGCHVQ329Ek
 qEe1Ar79fHMN+H5Anqqhn+uJNxd4jjX3LK2kwnsKYQCNKojKMx2jX5vb8qyub9OPnjzYTjx2sSP
 ZBWpb2SjPqH3l6YIgSbNYRhLEAU2bqTwpRC2t1KYqw0G8p0A4FdOt3WXT0KmFfCc+xlh4F9wgYM
 Ly2BT6uiyl+0hn72jgldDRKGgnNAlyaqV5WRCgJPGGDQQReb777KgZtaSG/IKQmF6hfuCvOsj1F
 NP2RdZ/kY4e1ff/IMww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220180
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109391-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EADA5B8D96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQ2390M,
CQ2390S and IQ2390S SoM variants and their EVK boards.
The series adds:
- dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
- SoC base DTSI
- CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
- IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
- EVK DTS files enabling UART and eMMC on the carrier board

Note: USB support is intentionally dropped from this series. It will be
sent separately once the USB driver changes for Shikra are concluded.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Changes in v3:
- Drop USB nodes from this series; will be sent separately pending
  conclusion of USB driver changes for Shikra
- Fix CPU3 reg address (0x300 -> 0x10000) and memory base (0xa0000000 -> 0x80000000) (sashiko-bot)
- Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
- Fix MPM interrupt number for ss_phy_irq (8 -> 9) (sashiko-bot)
- Rename SoM variant CQ7790M to CQ2390M (Konrad)
- Add PMIC DTSI includes to CQ2390M and IQ2390S SoM
- Link to v2: https://lore.kernel.org/r/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com

Changes in v2:
- Update SoM/EVK combination bindings (Krzysztof)
- Add per-CPU-type PMU nodes with PPI partitions for the heterogeneous
  cluster (Cortex-A55 + Cortex-A78C) (Konrad)
- Use full product names CQ2390M/CQ2390S in commit messages (Krzysztof)
- Update RPM interconnect tags and power-domain to RPMPD for sdhc (sashiko-bot)
- Update to use MPM for ss_phy_irq instead of direct GIC for usb (sashiko-bot)
- Add IQ2390S SoM (PM8150 PMIC) and IQS EVK board support
- Link to v1: https://lore.kernel.org/r/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  18 +
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 156 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  14 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi    | 170 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 842 ++++++++++++++++++++++++
 9 files changed, 1323 insertions(+)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f:v4
prerequisite-patch-id: d84e0b4c2788ab6cfcefc9806e7a6011eef8f91d
prerequisite-patch-id: c92359b721d8c28f4a62887052d0fbb2cb64480a
prerequisite-change-id: 20260320-shikra_icc-b1fcef45122d:v3
prerequisite-patch-id: d36ec191324b7992a56c463a15ff09bacd8d7ba1
prerequisite-patch-id: c6edf2e05d1409667c9674b765dbd0917401a903
prerequisite-change-id: 20260429-add_pm8150_regulators-a373f53eb48f:v1
prerequisite-patch-id: b312905695c635bf1e3deab87b718c92adf07f54
prerequisite-patch-id: 390dee07914f18c7df08c57b3c59c25d1588b62f
prerequisite-change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c:v3
prerequisite-patch-id: 2aab0b42cafb535b31c5154002c12f381a52be9a
prerequisite-patch-id: 599ed97f57ef0783f69d4c22384e91e66a2888f6
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3
prerequisite-change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f:v3
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 2526e0507d3b5c065eafd75a657d7f903af8488f
prerequisite-patch-id: c3b7e18cd60d1f779b88ace2fae1227d3d37d83e
prerequisite-change-id: 20260430-shikra-smmu-binding-7befe45ecf2a:v1
prerequisite-patch-id: 657d2fa91247aa0c222b595c41328087f04f01a2
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-change-id: 20260501-shikra-wdog-binding-33873dcfa81f:v1
prerequisite-patch-id: de5184831054bcb48889fca16b2f4b5e95da9935
prerequisite-change-id: 20260501-shikra-qfprom-binding-c262fa19640a:v2
prerequisite-patch-id: f284f0dc01674ea0a78c8cf40ada72a7a1636463
prerequisite-change-id: 20260502-shikra-llcc-binding-7832b24ef74f:v1
prerequisite-patch-id: b9e53d2b5b494d4a957a691340fb2563f3dd681c
prerequisite-message-id: 20260508101544.736317-1-monish.chunara@oss.qualcomm.com
prerequisite-patch-id: 2a9d88175f19bfdb9495a704681ff0093da5566c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


