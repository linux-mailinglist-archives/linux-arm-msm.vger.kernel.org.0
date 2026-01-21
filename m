Return-Path: <linux-arm-msm+bounces-90071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AET4Np0scWl1fAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 20:44:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC085C6E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 20:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C093B27789
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E79537BE9C;
	Wed, 21 Jan 2026 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYQX+vga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjLasELj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20976387584
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020575; cv=none; b=SbJyv5pOJF82815/N8bkcevfrJlc1kIdE16gWOYRU33iPWOppyXI6VO4vY10PQehVe0Y8CqeQ2pRzj9t8WrMw5riew00BYGZ8JJTk8myjj5NF9JSahmu8u7NccXRR+mH+CeyU/Lqj+/R1T4RyeY6U3ndP24rEnLF7Lf0DsxKGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020575; c=relaxed/simple;
	bh=1VLtbgKRr/1TWznV09Bkig43Rv332EqFELd6sGGIDbQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QwYrJ/uM6zsMPmyHtBapgoVJ+Wj1Ed4nn911tG3JQZMXIVryG0H8r864aDiAs1uyxpEH3KbGWsxcyK1m4owDKyml8PmQemCmhUJBycF7lBxzfv6L/99Z2B98os/dCXmdjZgoWJ/jb37d3MV0km5LCLMQAnKgCAY90KpBs9SbWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYQX+vga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjLasELj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LHkKx82452345
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kuAPiz1B/FbOdFrsAPANbF
	Dt/sbd/8W2Parm72exgf0=; b=mYQX+vga9LNERHQyL4vddt2SyEcHfD8TFOeKbh
	B6mA2WzsZBVU6galJLyeIPo6b5eTsNK6HKvVxZ2nzehLSSn3VdHBRnNZcR2mrE5x
	2ulbcCRSUElLQYnCb0FavEFFnQFBSLlqQ18FkQiTScu/bQ08P45Aw0cl0QjKigQZ
	4vmG0vWo1oFmUhOymF+XpHHl3BEPDZzsQX989aStiilvcbIyrNAF+mNMWS+QcQVe
	0i21MFiRIvtstwDElSCxYFKQssd6poN+wFOtTZX3ebi4iL/7zj1OAA3X5JpTQCFb
	4pGf3Zw4uXjdaXpbKU9UBhnxfbdLoFsqzZlGNPLLoi+Q8iPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqhpp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0bb1192cbso850265ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769020571; x=1769625371; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuAPiz1B/FbOdFrsAPANbFDt/sbd/8W2Parm72exgf0=;
        b=FjLasELjP7sQTupLQ7GlLxK030ofRjSTkkTVI1Cz4TYWuQWRos517hqLuxEB3jkvpO
         qXYPWcID4FCiwGZrwFqACzN+iANrTMd6mH4zsoA9twG2/hiySjoI8vuWdKhEHuG0UoPR
         +Mt3gXg27ykegY4RhTuO8vK06fIOoRP3xNUg6LtdqFB+zoyfB9vNdulWEuBBdrYJFAo8
         mySZSmfBNXpj+XWGt5JeNRdzeTQ3ZpsP6efftnel+g84Pr8RH23JndYKk3zqSohGkzOh
         JhHZlVajP4U142s20Kz3bHhgJ22laKgxxIBMasgzkY/pS+g0I7XGpJ0YzCvs6jND+Sgc
         0OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769020571; x=1769625371;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuAPiz1B/FbOdFrsAPANbFDt/sbd/8W2Parm72exgf0=;
        b=rDQiP0fhCd2aYsWIZnCRaPU1KpEgNCHFt8LL4eK/Ye0s6kEYm1do56Kci1mcYcQhyM
         Pq4cgnM28TwhQcfMruPOC7eY7yHU6+QVblJXTtmPysRmboLnA8f1n474Odgau7sa7nIm
         soiyZRcVy2VrFQcTRA3N9MCxXYx2XqLRKL59UIAeQJcHc3bvJ96Cp0hy6jPwBkd/2WDX
         SNVPT009j82QseLp0rRvyT6ghHBPbHkJiHLzTLqY6O5Wx2IdEhpQRsSuLX+eFsuTW0Sm
         IYpHjlv4jP97FnoWoGZZadj9bicAS7wiiybR2XvCvfMbb22WkDjoSmapUS8mvumAqIma
         08bA==
X-Gm-Message-State: AOJu0YzppQ5su1W/ngpYdWGNrmPGo9O+M3/CjqZNmrFP8r5kInm9XAkS
	yQBCuQgWMxswc4wr4jEQaTwQKb3PeCVecJ9Wr8YcdKKDYKDjX0K4k6OtEL0Hrten6+hLS7nUtgr
	Mi0yS9JKh7q4giIuzmLw6AzJebfq47iwvkDXHyzJcU1PRdwhXSeyC9mY55lHFAs1HtgP5
X-Gm-Gg: AZuq6aJvc/d4W2S0Jdd0tTbbWAznKEAingZJd/BFUOzecLjKtSeEmQom8x6VUAKLQpS
	uy6fKu6x1IpIy73UQhOFilJZMPQKhxaX061B/TzW/sZxkqJtngkc7GmYdMNdIJx60mV0bUwGl8l
	3bM03zLZxdopwdiUnHKT0ruQ/sCf35kT4hdOF1E6V8stJjtpcjMl7jkcIwBGEICjVz1z7Ta0JlF
	wiU/O4EkbxqYeISotxnyQkXYMZzhq+exiv5tYHShNElz8kh0SkoEDASZ3W35Cs0WI03qHAiwRgm
	n3prNQjEtrbXJtvyQLbccLreRwKHp6e0NXiGHuYMoRxt1yQcv4fUIcgUm/wx80CGlCto8aJSqdS
	0LymoIn1mavt1w+unlTqHLBuqYAXKkgyCHJo3bcuB9Iysnv1CPrFNNEwE4hCcKWxir1/sXTKcUQ
	Motz4xmh2mYLamMdVOAA+dfb6gWsAsCg==
X-Received: by 2002:a17:903:2f05:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a7177d0f94mr171365785ad.49.1769020570837;
        Wed, 21 Jan 2026 10:36:10 -0800 (PST)
X-Received: by 2002:a17:903:2f05:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a7177d0f94mr171365485ad.49.1769020570246;
        Wed, 21 Jan 2026 10:36:10 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eeefasm159551305ad.43.2026.01.21.10.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:36:09 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v5 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Date: Thu, 22 Jan 2026 00:05:10 +0530
Message-Id: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8ccWkC/42RUWuDMBSF/4rkeZHkxkQrY+x/jFGiXtusRm2is
 lL63xfj9rIVupfAuXC/c+7JlXh0Bj0pkytxuBhvhj4I+ZSQ+qj7A1LTBE2AgeSM5XQe/eRQ2/0
 i9ofuYme3N/3khmaup7BLpeZMVjLLdqIhgTI6bM1ndHh737TD8xyMpm1ILHqvo1GZPAcfxThwu
 rHpaE1NbdvQhVNOQesqa4FjvqtfB+/T86y7erA2Dc/LavcbJgNL0lM/bqQOG08XQRmVKAvRqqJ
 iKP+Hirk4ZwUUKYDKmVojjbo/6Y901JPp7nMq7ZGuEzOVSaZaVFJDDQWStY+j8dPgLvEDFhEL+
 Y69e9h1PEQA5Lzl4RTZ/AkQLZbsBxtO4PAYmwVsoZlQCjhDBnewt9vtC8VBogM8AgAA
X-Change-ID: 20251007-upstream_v3_glymur_introduction-5a105b54493d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020565; l=5173;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=1VLtbgKRr/1TWznV09Bkig43Rv332EqFELd6sGGIDbQ=;
 b=JcuR1JcJZ2Fc6OaU5AccB2LBH1eAuKzZNLfc2gJkIhOEl1JOewwXGkHQ9PGNMt0fcV7JVuuoH
 e476p6Ah9ydC6lznTH98TfCUO3v41BoBbn8UHe+geBjMUavkP+zmZVD
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NSBTYWx0ZWRfX60QjYAd+ZWAm
 2frrsqqqfhFsRHrL3a3+hTDx/JB8QVUDPNtBlddxzW/yCAgdH/GMU1oGjySinPr3C0FBb6cYy2x
 DlAy4AC0xU0yGXiTR7Pp5xBc9rD3mt1MoamjoFVfcJPtcB0LypDUDkIkKpUuqpSo8YmcjYNhrT/
 LLj2ZYYKpwMTW3tojtDjNMNCHnohmxwZ4kYmQFPpPw5c0MmokMW4TMLbSrJxnmAtnPQZHVGpLQh
 0gIGfcUepz9fU033KaGgGmont4g1r3dQGyNkE9JxrVRkWQF4wyAVXdTBsw/ShjsdoiwmnH5jqja
 x/yj/RMAvjJiBpsEBVWrZg0GlRw/GmNUh4V+0MbeuMiB0J3hkSvXWHZQOg7Su7mBe6EUHT4aJcI
 O+jphjvZpHCB/I2StkP/7jTKQxb4shICtFe2ZIUBtQSwJpdiFzYv3tsm3uqPdKqvB0QiOu7Otf1
 cTZ3QW0jFSAKysV2TqA==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=69711c9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pou2ygFnXE7-ag75BL0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JL07n7TI2Ku9LOQVRZQgkxJ1Heq0DHsN
X-Proofpoint-GUID: JL07n7TI2Ku9LOQVRZQgkxJ1Heq0DHsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210155
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90071-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BC085C6E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce dt-bindings and initial device tree support for Glymur,
Qualcomm's next-generation compute SoC and it's associated
Compute Reference Device (CRD) platform.

https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-

The base support enables booting to shell with rootfs on NVMe,
demonstrating functionality for PCIe and NVMe subsystems.
DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
thermal management. The platform is capable of booting kernel at EL2
with kvm-unit tests performed on it for sanity.

Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.

For CPU compatible naming, there is one discussion which is not specific
to Glymur, Kaanapali and Glymur use the same Oryon cores.
https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
We've kept the "qcom,oryon" compatible

Features enabled in this patchset:
1. NVMe storage support
2. PCIe controller and PCIe PHY
3. RPMH Regulators
4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
5. Interrupt controller
6. TLMM (Top-Level Mode Multiplexer)
7. QUP Block
8. Reserved memory regions
9. PMIC support with regulators
10. CPU Power Domains
11. TSENS (Thermal Sensors)
12. DCVS: CPU DCVS with scmi perf protocol

Dependencies:

dt-bindings:
1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v5:
- Added opp entries for pcie nodes
- Dropped qup-memory interconnect from uart nodes
- Update trip1 type to critical for pmic thermal zones 
- Alignment and newline fixes according to comments
- Link to v4: https://lore.kernel.org/r/20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com

Changes in v4:
- Enabled PCIe SMMU for all 4 PCIe instances
- Updated dispcc required opps level to "rpmhpd_opp_low_svs"
- Updated watchdog compatible
- Renamed gic-its to msi-controller
- Updated GCC clocks property to 43 from 44
- Moved cpu-idle-states to domain-idle-states
- Fixed alignment and zero padding issues according to review comments
- Dropped glymur-pmics.dtsi
- Moved pmic thermal zones from board dts to soc dtsi
- Link to v3: https://lore.kernel.org/r/20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com

Changes in v3:
- Enabled system-cache-controller
- Squashed all initial features to boot to shell with nvme as storage
- Updated tsens nodes according to comments
- Merged tcsr and tcsrcc node
- Addressed review comments
- Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com

Changes in v2:
- Series was sent erroneously
- Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

---
Pankaj Patil (4):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: defconfig: Enable Glymur configs for boot to shell
      arm64: dts: qcom: Introduce Glymur base dtsi
      arm64: dts: qcom: glymur: Enable Glymur CRD board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts         |  601 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi            | 6122 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  107 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   45 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |   83 +
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |   83 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
 arch/arm64/configs/defconfig                    |    5 +
 11 files changed, 7167 insertions(+)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
prerequisite-message-id: <20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com>
prerequisite-patch-id: bd5a4703a5a7fc530418337680cf1e2ea1518f35
prerequisite-message-id: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
prerequisite-patch-id: 6bbaff642cfd1f1386ff0ccd746739b68cdbeb45
prerequisite-patch-id: e30603778b23b7f7586b1c01a362e45af7bd0aa3
prerequisite-message-id: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
prerequisite-patch-id: 14469fd166b31b251b98bf25e783ab6f57ddd13a

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


