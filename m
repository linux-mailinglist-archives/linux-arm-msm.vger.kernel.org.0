Return-Path: <linux-arm-msm+bounces-111770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id exNRNCiKJmqNYQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 692216548E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:23:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Nm/j/93t";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BF2cIrQi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22C2130639DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EDE3B14D5;
	Mon,  8 Jun 2026 09:17:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129C33B52F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:17:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910238; cv=none; b=T9t5/l7O3lOLGXzqJOWGciuvtvFKDDe50jNGMKPOl8V1UwEmlZgxKJ4RNCefdbrNTg6f8MWR+BAgV6sARq3Z9yyYJcPK0IptVQ7JszWRx1aktK5xv8Y5AXe3j7I5n4eujOZZoM+Cz8bV8vkCUaLd3EplV1vrkJEbxjvDKczLMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910238; c=relaxed/simple;
	bh=VC+OAXuz8EAO0x2CZC4Csp47ug8+MAbajNt/UTVkJS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtq+CHKe3tHz4B7phMoNuiJc73HvXprOIx7vN0zFs1zj8WiDy+uXde8vhM8XsJ6kJ5J2CP/jw5weg6EzWywjCgGCt8PcBtyfUIcWXwtel4pDKGZR+ibZls3qB1+mqDyqAU39LXMm+acrQofIJrlsMXBGxftUhAI876uULFWt+58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nm/j/93t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BF2cIrQi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QqsI2771090
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cGbKRVpcAfB
	zmwnC0CIk+WS2eHsVaNTyn9isA5S6dME=; b=Nm/j/93tcKam1NhBCXoXtouwDoM
	1BONcnKJBWdwlNCe/bE47ja/gwnAnxPISiWHM3uRRhJrIdqyYvMWCkFuV9hpAA7x
	vV7YnI2mK7MPzoYT4mLWz6H3GSts4Bpbh/Tg3GT5nmgzqMk+I1x0T+cnqcL6sfA8
	7yqrGFE9TZrwxBJ2EFdaUqRAUnCmq4NLCke8ZGOlR6bQ6xGYXUpo+GuWt5KRkw2l
	pWUJ341K4cVDecusc6ON/3zAL3b9Bx1Jdqtv79ZKkZg/99jqWUz7i6GRnMBEEAHJ
	5yHxFo3fDS73a/ICUryzG5cjLfuC2tLpt07xnoXESF5X39KO60kI2PLgEpg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6eyc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:17:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137daa666a6so594323c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910234; x=1781515034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGbKRVpcAfBzmwnC0CIk+WS2eHsVaNTyn9isA5S6dME=;
        b=BF2cIrQiuqKKMM2PijhlhbGH98wITK/xAxWdU0nidWTq4dICHLys0xLMpzineqbv1m
         aa41ol4l6IGfAs9Q1VkhLkG6tU8DWyPKeWb4rYOVESwBBZOwXfgKvKFFE+jZ1tRFqy/9
         6dY+ajBm+vu7hWLidxPOTKT1HNLqjvGtnfYfg0YqqGRS3ZNpz9GDnlvZg0qD50R38WpN
         NaOw9jJIyj2TvuQRoFE2uALHnt0qeFZjeohcwfwRIZALTRWzEPoREZJPYF5Aj9WPTL2z
         oqlq1TQq4rqV6zBy57Jy5oXT47F5dAJ0xiOiKtX838cxBWOHjkbyBiESwaJpg6vmnL/Y
         +HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910234; x=1781515034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cGbKRVpcAfBzmwnC0CIk+WS2eHsVaNTyn9isA5S6dME=;
        b=XA+LWVlXYF6147hq32CC5uZFAI/IEl5lbDp2zb4iy/GBSSI2gRtVBy2Rw8CP6NFM6l
         MzQW7IB2NHNOQ8kGk0MwzPLI49+Yst2SNUN3CFRkNDN7DuyT97mcSAxG9vTWTtGIWhBo
         YDcAyws5qPf7iP+9gGUYyFILnod855pIUz1AikrGPKMWywPPiE4W/DA0Gyh1eo7NHrNE
         BXkqxLgPdOcg6IeaSxiAp/ciHKZADBl3T76Fh5O/wVX+4/11h1zTjrRUSPgYM6Ue9Tsu
         uidqaRVxBe4G+tGY5IPf1IChdgbjDll9Re7I2jYdjsFo59VwJc2eT/4a80SthjTCPQLj
         zmYw==
X-Gm-Message-State: AOJu0Yx+AYptRoUhviFbD1FOsnuzeIVnM8M0vdWxErDl0y3lPgEsN3d/
	cPln2HV4E1Jmc17RFKdIVY9NjlEZWCiuhzik/Tnr4O/7HlLBZZcrtcHhexNnsJzH2R8xTNTNhFU
	nNRf56L/atQLQn9otMc6nQJisree1sh18y2lpcR3wmHdiD8oYCBVxdCoukHi12BtGujf/
X-Gm-Gg: Acq92OFRy07MTZ3fQO0qe5+BJqd3CVWlDJGtv3iMEpxL9tAVijuMR91LP7Y0MFsCmkv
	NisTE4xcLhg9VDnpTv/Hh6VNza3dswCTZq3mMSsH3WvM4bKIFAeZrr3Z4Zr+pb77fN9If56+kxQ
	9+iqU6E66utwKyn28LFQkAaIKtB95/9wGfHmlHOmgP6zDdMVtvUHL4vGSyntLayjdRq/60RLIV2
	tPIkCPbxtmupZG0tut12wpx+na5iYolJ3MuDJeM0Za/Q+/ZPFbddR5nyL2+6EGKQJ4O3ycmZa/P
	tuEoSmWBkGASw8YJ+bHRfYM/NxSag1T2++emwYBWj76oTNvIEXDbhguA2oTVsN/OO+sy7q+DSL5
	BaWB6K//31UoxVqRih0MSkV03S0/vdDr5BZeba5ceRGTkM6qgdOdakxX4pBfRn/FiuFM8wiMx72
	oSOTzij6Y=
X-Received: by 2002:a05:7022:fa05:b0:137:d966:d890 with SMTP id a92af1059eb24-138067af64amr3099091c88.7.1780910234057;
        Mon, 08 Jun 2026 02:17:14 -0700 (PDT)
X-Received: by 2002:a05:7022:fa05:b0:137:d966:d890 with SMTP id a92af1059eb24-138067af64amr3099082c88.7.1780910233547;
        Mon, 08 Jun 2026 02:17:13 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm12178656c88.14.2026.06.08.02.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:17:13 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH 1/2] power: sequencing: pcie-m2: Add PCI ID 0x1103 for WCN6855 Bluetooth
Date: Mon,  8 Jun 2026 14:47:01 +0530
Message-Id: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a26889b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ohc_vuBGHJ6k7NFuzkMA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NSBTYWx0ZWRfXwd5JlUL92b0p
 biYVjBCVo8pBz5fF8Tax1WtsjKMX6nxDpk+uzOnhCD/caiTDM32jMXy9nwk5PqKd1nR7XvRhnBw
 qSnNnPfjCVPO4/N52GDAQhmKsZ0lcrzoBqVW5GCd2goy6Cae4U7Mx/FpclHwoFSMN8sHnNiNwse
 51/ASDxUP2xMJcar0kYr6zcisWlbEYGycP9vrQsson9lYzRMfR9A++KGsc0oh7mIaCyaMtbu0M3
 gtzI1ci+mkZOT/d5xPqRgb3wCFZ+NqkP6hHmNUxQ9tm3jPEmGJGa8CwNtgXrcpZAUVWZnuIv1FL
 PaDoBGvuQUrD8XzhCKTuYJXtdLsHzNg3xImx9IRcOBw8qTRx93vKKt3Yy0hoMYQwVDswyLh2P1n
 PtrN4Kvzd8FMSEh7/w/FmWNWyo5fXqorLQTuIuSu2bUnEXVyIaJgMhVTe00rchp0vyDwr9jiXDI
 uNhYlH0t7cKnNPWF4UA==
X-Proofpoint-GUID: ljbxpaztzcJprx8ZGGkR8md5tnsv8tF3
X-Proofpoint-ORIG-GUID: ljbxpaztzcJprx8ZGGkR8md5tnsv8tF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111770-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 692216548E5

WCN6855 is a Qualcomm Wi-Fi/BT combo chip that uses PCI device ID
0x1103. Add it to pwrseq_m2_pci_ids[] alongside the existing 0x1107
(WCN7850) entry, so that the pwrseq-pcie-m2 driver creates a Bluetooth
serdev device for WCN6855 cards inserted into PCIe M.2 Key E connectors.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index efeb25ba9c79..b3af14464314 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -188,6 +188,8 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
+	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ } /* Sentinel */
 };
 
-- 
2.34.1


