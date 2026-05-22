Return-Path: <linux-arm-msm+bounces-109266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNk3Eg87EGqeVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:16:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C015B2D53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC253008A5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C9F363C45;
	Fri, 22 May 2026 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxCOtAHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQM5unKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607A3D4130
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448232; cv=none; b=J9hjn+Eguv6VwdMeLG/MFvwHqjl3hxyW2Gk/LilM1qLuLLl4eHJaeIC/ia7HABW/vBWTGAR7ifay70kpCcUnpmPveP/0NE1IjJJR+IbHd/qIoJEAMT16WZqh+D9kGIvj6QqMJZiaGXtM/dNuvvNAQUMVh42Xtat2kwBFeNcEAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448232; c=relaxed/simple;
	bh=7QeD4D35Lu9FczIe/YORC2EtD3i3MlNmzMEyPcftMas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C/Z4pKMnxxbsle4ASVLdoULqTC4prkwPNogOGKDWUz17AYzmSxQd49P+6m01EG+5Sr1eJ3jypCg2zD6Qi4E43aA0IpiZDJoY4h8WSMWpiKgDIpL40CQ+0LhNqq4PhKvcl5KK5xI2M/uF5U2YuvbPrscS1FNtHkQzs4wOk80l+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxCOtAHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQM5unKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7ULcs778735
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ZItP6YT8OFjPlREFpiOWN
	E6f39guF4GQvjFE+VYuDs=; b=PxCOtAHxcn9CTi649g1LBuwD0WJM5pcZrQzU6f
	kE5EwxlKQ+TBkeFvDhG0aYLWtkh16q7v95vgi8WOJZqVZamahB+UHop4cQc4F7rL
	jDYRPkP+M9Xe9bmbnklJ4X7HxfbStmQII672TH4j1v/ZhU4XBgejka2rS0nF429w
	lAMXBw7o1hwk7pdeA/xMYhZltFLv1S+/cp90BtkSkW+Iw4BKUNQD1CHebCTlNYAm
	cB41Cp7yQhC/NeUwlV8pmP4kmFtrj9/FjVGgvz5Gu07sdOYh3K80IDSMT9iFp7+1
	8EWdt+bUB1Esun+m3sfQNOd+8bBQ6zJvApOyY2GMBwHWVsYQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:10:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so8269527b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448229; x=1780053029; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZItP6YT8OFjPlREFpiOWNE6f39guF4GQvjFE+VYuDs=;
        b=CQM5unKtKBrFOvf0eXfn2IGHXHftXtwXsjX/3gRTjt7rkRQuSRHKKXdL9NKta8gP/+
         ulldQob5oZ3yQxy6Nk92ax3DxPtPMvM5ZsDwNf3lLcgOro4MVb9wuNPBTEF/as+ipJS6
         +pjBC9Ro8yO/tXpcF7zOevKd71o6MnsZH6r+FfH0nsLVSeJZnHvprXvXWVgsfgFMPmFX
         7S68PFPKCK3tOvZBz5AsMJplId2RnlyskMnCk005atVPTTsI7dmUWgBdD0DSwzNjkuBF
         2FpcOJ8V98gBdVTsyNt+AJ36MC4FolYz8NxNb3aeAMsHVsqSbxZnc3N1LopqV9c1hNKy
         8mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448229; x=1780053029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZItP6YT8OFjPlREFpiOWNE6f39guF4GQvjFE+VYuDs=;
        b=RwmBBxf2pW7bGQFCjeEQmI5n5P7ZpgVbuboW+RRzJJiJI8+hjbEoXbA0r+CX2CO4xU
         ohznXD3J2M/Xcx4h/cEcWdLSkw+c9aOPrZMfw0Xi8wI0RdnOgitW8FEAACe8GlKg648P
         0/WclXKAgptR0+gYTj4RZV+igr8ZZJATqIpbInrKgUdDZJVBGdiBws/NdvnStLVSTic1
         iIH1CXubzvw2tk2m8FEHmpBnu6OzGyTdwMOenWsJ/5yhwrc2qWSHQM+qHQj2nHdQT4VA
         4V9T3PLbqef27jRt3wOvdLTOCwoC8yscqej410IJoPJZIxy/6E8yYK1d8NCta0jMFll/
         P31w==
X-Gm-Message-State: AOJu0YwUqlTOaK65pO4D35UItUa4/TjvhSFG5+ODWZwmPhvPtrfWungy
	MEyPf+nKp/KRGO2cEH54TFvdNPNv/OZrjVkfBtioC7Iw1haYD5VZi24/zsC1Y/auhNzfCSUsuwW
	xA+rG2mT2aBNrnwO7BMv+zBz1ewREBBWbdOSJqMFb6AUW1wKThvfOFl8M6OYruhUT3htWhcMbbX
	gp
X-Gm-Gg: Acq92OFnEOOxm+IctE3ZPVynncuaZPb9IzhVGMvNDfpP5llcTvxEqsWm5xdG8COR7zz
	o1Pbf6ZzhYIMHPLqrauI/Wfg7xVspDYyPVc3XwosMa9OmDHcuxfLV2eFhUGvVykdv2H6NU2tzPO
	F5JTE0YI1c7ioK4FwuVou9IWQyUIRnNisLyIwUypLNVEmqVhXtyB+4HN8ktOmGXKpiQpVWnguff
	AP4MY8K06yEEgevqMHY41VrbTtP4Op4kupM6Ex3j7jXX+Q8vgyn6cPm7UiRZgQGnn02cSEkxg7A
	U/+ldHE61Z/IneKSA1ZfEWvtnCRK6fHCif2yb2iOfWO6cwsF/SHaY0C8DFzAa+qP8UwV/xTLDV+
	+eBE6VvdTaVqHPTFvMhL3OMTU5YrpJYzTMl2vux6RYk46r7AyRQnJYU21qgQYOz/BseVb
X-Received: by 2002:a05:6a00:cc7:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-8415f1560b9mr3321883b3a.11.1779448228591;
        Fri, 22 May 2026 04:10:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc7:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-8415f1560b9mr3321853b3a.11.1779448228125;
        Fri, 22 May 2026 04:10:28 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841648a2bf2sm1578962b3a.0.2026.05.22.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:10:27 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Subject: [PATCH 0/2] Remove gold/silver_cpu_sleep idle states for lemans
 and monaco
Date: Fri, 22 May 2026 16:40:12 +0530
Message-Id: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQ5EGoC/yXM3wpAMBSA8VfRubaaCfEqkmY7OPKvDam1dzdc/
 i6+z4FFQ2ihihwYvMjStgYkcQRqlOuAjHQwCC5yngnBlrlV+0l6RqYlT4uizHKtOIRgN9jT/c3
 q5rc9uwnV8R7A+wcmOssnbgAAAA==
X-Change-ID: 20260522-ml_cpuidle-da0377956dc0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779448225; l=853;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=7QeD4D35Lu9FczIe/YORC2EtD3i3MlNmzMEyPcftMas=;
 b=Kd4tUcSXJ35UsF4NRDevQDcSuuW3FJSiNFkuyJyz1ljwtViJQGzPeIizRAdw31ErkEvnZkJPx
 8EuD+7SX6JPBC+FZBYK0PkSlHozD5RP+l3ipkHLNvO6ad43lni7Uicp
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: 0qiWq7n89_u9rCLikb54oeZAt-Hz4e7w
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1039a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7Kxd-bO9P_s-EMYgHbYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 0qiWq7n89_u9rCLikb54oeZAt-Hz4e7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfX3fZRFnnPmF5B
 QuECg6TERWPvVlmkIQYYYK6FzIKfdalyOqKeEdhsKHQFyEIaUk6dlAbQnmqqQJiyTjJNhSGe1GV
 hcYICNOrVq1GyakMquE1mK/fHCIjpni2iFKEEPRc6NHsrsk9N7eGMR32hHjWljL7vh7Zbmc8UV3
 hyDd0iPzdx8hNrP0dAYOqWR8uW6SnLNCyKFtJDd9lTiFvU5xc5WGURlqPJocLIqX5++0gnL9+ZE
 FAfBAH3xUJW+2dpR6nAgytbeOuyvzSWZ3Rgop+1tDAO04KPf4oeD/horqD6JVicrDrwRUw1qkCG
 q+PpeFjXYQUQvJAjlS9uzWOVtQdXkC6d3cJ3Hw1cGIFdJ0eNZPfG+RyOuY3wB8lHn2zm7ySpg0A
 /JEKXkWJrtlu9TyhtLgwdaSRLtLBRNyzHOhNmSqCdO722Vv7v1eFVJE7j8mm28l/64OZtka6deX
 u6QNezxe2OJtYXiaRKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220111
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109266-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05C015B2D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Firmware supports both CPU power collapse and CPU PLL/rail power collapse
idle states. However, CPU power collapse mode is often not utilized in 
favor of performance. Remove CPU power collapse modes for lemans and 
monaco as well aligning with SM8350/SM8450/SM8550/SM8650.

---
Navya Malempati (2):
      arm64: dts: qcom: monaco: Remove the little/big_cpu_sleep_0 idle states
      arm64: dts: qcom: lemans: Remove the gold_cpu_sleep idle state

 arch/arm64/boot/dts/qcom/lemans.dtsi | 36 +++++++++---------------------------
 arch/arm64/boot/dts/qcom/monaco.dtsi | 36 ++++++++----------------------------
 2 files changed, 17 insertions(+), 55 deletions(-)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-ml_cpuidle-da0377956dc0

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


