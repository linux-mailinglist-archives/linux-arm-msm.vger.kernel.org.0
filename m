Return-Path: <linux-arm-msm+bounces-116730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pQbMBgCGS2rkSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:40:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0A70F504
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M4chQsXn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VThkqbSE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116730-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116730-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF5553820EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D542E8F1;
	Mon,  6 Jul 2026 09:40:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B341DEC0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:39:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330801; cv=none; b=pZIuRLASh1q2/QpBaFGsAh/18f/Q9erj7c2aVIVuYZiNSJAjg5S78qv6E0y+v7pglT4M5Wqr3K8HMC8cYPJ+PhcFGhhpAOX2Vv6O4vDkXBf6ycq4yaNfzUek7iPMrzE+wByV1yKmQfvilzlefQ+P5oqKcrChIUoZh2HjE0Xugs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330801; c=relaxed/simple;
	bh=LxlS3E3mNrtdxsceGqW1lsF8W4zsoxq5R9yc72NCSzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2otfcAoiRnETOwmISF4LduqRZxxr6bV7y3BoJyVLW3mKUYsarZd6EEk61oAxcAwOv1oaic6Wugn2f7ZJCWSuRWqCA0e//yozI5mVE7L4uHuywPNI5BKgjLeSyrDm8uRvG+fcSGmENnic4dlTAr9ZAcRVCMW13eaCYC6g2Xs4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4chQsXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VThkqbSE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694FXd128130
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czL710Wv/g2HtcHzdNl50hDpmkXZJd2MNATcvBBHJys=; b=M4chQsXnhZVNE35h
	xsHoUunqMp8b3b5jcclfINFqLxKHdnrmcFIvTNMOS6MDRjlij2mgnYri2cTFrEgS
	sm3ENLE8OJoQ61jveqoSa0jCHZ/in8pqooRigKDMDTzR1e3egEf8Wpb9uUA21yFZ
	pCn8XMNTUEcrfVKFBLF4ethQnm1r4VdzhpOWCUzTllt6f66CPnf7Nml1glNSbDZ+
	QLc2ICx1ezpxbBqp06iNZyEJREBegIoZczc7teUx7u9UFzf0bs0Uj9UndaV1Th2w
	ypP+juozCLzhTOi/h204+mgz+eWbna0EAF5G8V2A7XbnY4MAcRo/fA8lGMTcFyQm
	syJ9UQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnn9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:39:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so197396585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330796; x=1783935596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czL710Wv/g2HtcHzdNl50hDpmkXZJd2MNATcvBBHJys=;
        b=VThkqbSEZY8cVP5SVUTn3Fkr/7opy/DlFekigR9q2lEQ3qWEgm6s2k0Aln6BuL8hzO
         HL/MrMShWG2zXCKcuFUJvUIUha/He1dHKk7dMrMI+C4MUYd3dDoXUWU9K13CMGKizbWu
         2ls1qXqkpTH23wIMFya5dZNwD1jhzt8LKeaiLwy3y6x71linaGEAyxvuTTo6wLEW1hHf
         91tAQoqAUQD07jFQ9SBsqzzf6j9nAbnKc900F5d6/NRbL2g8XeQ3O77SaoxQJyhETS/V
         ixvpMd0+4y/4sU6l5kxtlaFQ5fZJMhoNRkbi2qb7ncTqizgMc8mDPvtcVxyWksRH3JnG
         CpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330796; x=1783935596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=czL710Wv/g2HtcHzdNl50hDpmkXZJd2MNATcvBBHJys=;
        b=nkOG9wZoisyYaOWsBUlGdkWvyH6hJGuKCYKKcIqL4/Wd6fKLIqjWiCJc+KZMLABIwD
         YVY0954Mm/VqdcCvIdSvc4M5eBVxaRDFppXx2lgHjdsF98DuaMuWkEH6GFaWbBPQM3ni
         01qdqwwRlJTCoaPOoAhPZMbFa0lyWDEY9l5LmZqTe06Dgp3QsFRR81t/oL9KcJSXGaRg
         18FODwftZ9aYhaYbJD5epC8FzQ+6YSCz32ia9ASc2ua4nhMt9YMyAeiJ0KVRy7k56aDQ
         0K3pOaPyBkrTRPBodoefu2uVe8kvtjC8tMFy3cOViPjb7+HP9CjZs83nCXjllyf+rh57
         UHmw==
X-Gm-Message-State: AOJu0YzZVZbUNLKDarOd4aAPb2ZnTIa+uLd/IMCuCzGatyZllbPAltdM
	wEZem6Qe1ukbo6zaPdu2eTEWeYTckPfJvztksi789wOF6sXtIyDTIBkvGFXOqi8WzaTzPprIpfK
	f7jyZDu7ser9WjUxgFa13A+U4UW4ViGaMmX5eqz8SF+OPpRbzEtTTJSberYtyOIqyHAe3
X-Gm-Gg: AfdE7cmPKJkGiyEgLIHDgKIAct7c8zzhJRbnF4wZxfd/4Dfe48H0+2zidmb59nNa0A/
	HQFgzazzuXTRijSKDJ/TmUlbpsfa5Q2CBOK6s5UEVtltOIeUTOauJxcA6/ylJC3CFpaVM8yD4aj
	xUjoc1aW3h2ShfmCwXvQ8QTnoxEaB6uQVkkC+LVaxx8/MwjVAjFQ7G+qPNXhbqvUf8dXY5fJZID
	BSwfYGUEJCu2Pu3L3kj6X0/7JHSmKdDMVRtKGEP/nFdq6mkkBDxkB9pT2EbJxm8pfb7mngF4FzT
	WzUysdxwy7w09StzeLUh41VTUhMsVOsJGChidSPhag/VP6EOJcHg38nqAGBcIczfPePyJSQ+peU
	MxLKmq/oYcDvVojz+gDppVK1LH7M8b+2/zMM=
X-Received: by 2002:a05:620a:4609:b0:916:14f5:8866 with SMTP id af79cd13be357-92e9a3869demr1295854285a.16.1783330795915;
        Mon, 06 Jul 2026 02:39:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:916:14f5:8866 with SMTP id af79cd13be357-92e9a3869demr1295851385a.16.1783330795470;
        Mon, 06 Jul 2026 02:39:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:44 +0200
Subject: [PATCH v2 1/4] arm64: dts: qcom: Use hyphen in node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-1-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5522;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LxlS3E3mNrtdxsceGqW1lsF8W4zsoxq5R9yc72NCSzI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fkE6txADvQHBX9mcSFfbDwsqs30PMgHuRbK
 MtFOcheUOGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35AAKCRDBN2bmhouD
 17+5EACB4xSEBKH+pXnF2ZaSBerU5MoZLRTtsr1YqyDCuAsH3V4uAwXmHlh4qq4u6f4JqAQMpk3
 nqS7Judr+nkWRlNa1aIY+3jWtIa1zPk0RgjA+he9peZ2jae1nuGbnhQ07jf36i6x+MC3EfHDNR6
 /6Y504LiAqEkp5QMaWpEl6EnK5I6GcsYKHHdz1fGwbjzmCeTKkku91ioP+TE12npa2LvH2RwWZ9
 gGhuGOJrxk6+8mEJPF36dyf+kbqBH15Rh08gYW3mS1pofTXWjeDHvx8dC2rC7MZEe9FHgfARosc
 OREift2XS+E1mRESvBeGEI+pi2Hgw1O5Lv4UgydeKKo9NrG3zxhrNEYPvP0v4pfJ90lBFxs/Uxl
 DO8T6lEUONbNh/szFDgQn4zgY+eO0qhFns8XJKs8E/3POdmBtAGw3YpIxUcbG+/bUfLDmO+GNLd
 cM1hbASUQWfF+uPcEHnqt5f2PX3iXcVI/bSCiVVurizHvh3F9VOY3ZVAn8ShT1iPVg7UpQ45P36
 Wa8PNoS1NNJvI1Fyt47OaBSGOZ4rT5Vb0nvZqfi43rAQUDGEal2IqRwc7vQyA05d+LiNzL1Fl5D
 aI/DpKv8BZrIFN0OaltHOPCU5G8qIba4KGhE0Iv9Lyo9DpbSKO2G+1N6Jm1ZUcIiUmO6egJ4DMd
 wEyBdpnNtrgOtXw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b77ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hdEaa9rgLK1xy9maSvcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hBd8-5cIUes2IsJLF9T7m3xi-pef-3FQ
X-Proofpoint-GUID: hBd8-5cIUes2IsJLF9T7m3xi-pef-3FQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX9g+/aV5Vqcjb
 lbZX6P5qFa4uGy1Vv4+Ap6sOwDY6nvoPZr+u3AS/V+gJY8Up2VMKPD1y/tVSXa74RIxRu96/kt9
 Eabewy2i9IlwS5twJnCVUvSj8GufgO4a8feC5SLTkULzDWGqpDVtcZOtTzd7UOmAltUWZ5GXhJp
 HlYJQee5uQWtEB8yomNb8ZoAHcu1YT5AyktlTvJx7fAAVc45Bb9U5fR+YRR2aqsGKidUOs90wo1
 o1OyzEtvfEz+CIKCeo0RYLYYXxbUkEcJ2KdpF2ivbUBmzdaHpqtxKU2uzm7VH85SjxcHZh7HrIc
 4G5UDG3BLwLuxdySKkji94lOACmqp9ji9CwWkc4nUenHyu0chsddF0Kn3TQRXWyeAnDOP70lpJt
 a9j5m1uDdGVDJ+rr6bz/RtSv7CYQuAEdSCmWwVT3Q/kPpcV2BcTEYsMIviP3Ve0ZXo9NmeyKmG4
 2lnmgtxiUJn3HMWBBHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX4FR3PU6UMNVC
 lmz5w8I5UM1kQEN9SawWeJt/x6CgC70vh+hWNNc4VQWJZpUNwtaUl8eU1lFZzoEt+7oYNu/x9XE
 5Slvt/6Y0EkJ917fGMhfB1R8fxS2p24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116730-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58A0A70F504

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi             | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                  | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso           | 2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 8 ++++----
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
index e53de709e9d1..e95da761234b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
@@ -87,7 +87,7 @@ gsbi7_uart_2pins: gsbi7-uart-2pins-state {
 		function = "gsbi7";
 	};
 
-	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
+	gsbi7_uart_4pins: gsbi7-uart-4pins-state {
 		pins = "gpio82", "gpio83", "gpio84", "gpio85";
 		function = "gsbi7";
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 95be1d2e214f..06c0af0aa317 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1866,7 +1866,7 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
 				};
 			};
 
-			spi8_default: spi8_default-state {
+			spi8_default: spi8-default-state {
 				mosi-pins {
 					pins = "gpio45";
 					function = "blsp_spi8";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index 07c10c84eefa..2c0590617ac4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	vreg_bob_3p3: pmx65_bob {
+	vreg_bob_3p3: pmx65-bob-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_bob_3p3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
index 4600d5441cce..a4c6d39cf777 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
@@ -14,7 +14,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 &{/} {
-	vreg_cam1_1p8: vreg_cam1_1p8 {
+	vreg_cam1_1p8: cam1-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_cam1_1p8";
 		startup-delay-us = <10000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999b..cefb8ff00806 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -63,7 +63,7 @@ vreg_3p3: vreg-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vreg_conn_1p8: vreg_conn_1p8 {
+	vreg_conn_1p8: vreg-conn-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
 		startup-delay-us = <4000>;
@@ -71,7 +71,7 @@ vreg_conn_1p8: vreg_conn_1p8 {
 		gpio = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
 	};
 
-	vreg_conn_pa: vreg_conn_pa {
+	vreg_conn_pa: vreg-conn-pa-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_pa";
 		startup-delay-us = <4000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..e5a57a340cd8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1041,7 +1041,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@240c {
+			gpu_speed_bin: gpu-speed-bin@240c {
 				reg = <0x240c 0x1>;
 				bits = <0 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a350a8ba48fa..c50ce1843703 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2927,7 +2927,7 @@ ws-pins {
 				};
 			};
 
-			lpi_i2s4_active: lpi_i2s4-active-state {
+			lpi_i2s4_active: lpi-i2s4-active-state {
 				data0-pins {
 					pins = "gpio17";
 					function = "i2s4_data";
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..70c130c5426c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -46,22 +46,22 @@ framebuffer {
 	};
 
 	reserved-memory {
-		adsp_pil_mem: adsp_pil_mem@55300000 {
+		adsp_pil_mem: adsp-pil-mem@55300000 {
 			reg = <0x0 0x55300000 0x0 0x2200000>;
 			no-map;
 		};
 
-		ipa_fw_mem: ipa_fw_mem@57500000 {
+		ipa_fw_mem: ipa-fw-mem@57500000 {
 			reg = <0x0 0x57500000 0x0 0x10000>;
 			no-map;
 		};
 
-		ipa_gsi_mem: ipa_gsi_mem@57510000 {
+		ipa_gsi_mem: ipa-gsi-mem@57510000 {
 			reg = <0x0 0x57510000 0x0 0x5000>;
 			no-map;
 		};
 
-		gpu_mem: gpu_mem@57515000 {
+		gpu_mem: gpu-mem@57515000 {
 			reg = <0x0 0x57515000 0x0 0x2000>;
 			no-map;
 		};

-- 
2.53.0


