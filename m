Return-Path: <linux-arm-msm+bounces-107031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL1aAWmoAmpSvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:11:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56237519815
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75186303A900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 04:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15164311C27;
	Tue, 12 May 2026 04:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCUCEUEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OatY2NeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB073148D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558942; cv=none; b=Glsps5nKjbKMHSA6mcl+rXQr5rY0voK+HXvLGasFzpJObXh0/anOTZB6c+cc4SWX2QTvt7Y2gg1NxB38hWxiZm46iENgp3duEFx4YxkPocc56H5JEpyPjQvnbF3vSjGREvJPD1WrcTqR6nX70xqmYFDkjKhtbihuM5J+XXUDOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558942; c=relaxed/simple;
	bh=1ljQ84A7zAj1l8wEckyCPg0Y3BG1MCDQO9YwUdHJcxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1MubZE6pLCZzUQ7B2IdAOK6kaIfww/+Qx28dPIgfLPolgCroab9q9x3JXRkgqOqzwOtnTY5Sqpy+MW2QG4IfyoOh21E1KkiaMM8HODQDSpKf7JOCO3fZpF1fClVEHaHiy5myrVqWqlIpHcGlxO5uJJRjcownM5Y5RRpbxPAEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCUCEUEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OatY2NeK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6h4c866134
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97aapM4tZqs1IfO4iQJmxPEFoE1eTTwgfUYVmSbJ24Q=; b=jCUCEUEuCaM5YdFI
	r5KIB5d/ibCScPeS6tCfwzix8rgUQrysCXFYZ63l08rrsD9yJNziJyvJYx9wN3pz
	14OaXYLvndElO+2KhCv12pU+eYwpyVK5aCDttuOGRN+RK6N9IvQd5URa6IGn/zyj
	VpGUvxrUhYTuUnXHtT1AsCehqQtezGiu+T2vSlb/t6A6Ck3UT3hgnM7ObOVZC3wu
	rKyEJxfdu2gaGZ1QGixMgMW5NZfk2V+mnKzKfHWd4VYw11YWhlaWYau7pImntc/9
	dJeJiqulzXUU/0WMXqT3XO2irhXtDjObDY9U0KK/DTsr36M4z8DMM+fE6vDTB8+Y
	r1DuFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv295tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso43617735ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558938; x=1779163738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97aapM4tZqs1IfO4iQJmxPEFoE1eTTwgfUYVmSbJ24Q=;
        b=OatY2NeKsQeMb4vSzbdFWjOyKR/e3uRaUIM6AYyaJ4BqWKnAiTBvfTblS3e0+P+vEu
         hM3tFhfU77bCjwZSrab/Web1Zc7y0F49L9BY7MacWGuI1TH3ak6dDwH28O6D7njXe967
         +QOa3D6+n7YlRsKt9btuEOjA1rFdCrUYvk8yT5QleJXelIYnQ+Hti2crQ4MBmIUuMGJB
         6bFnV3Fe+8yZngZf0jTtslD6QFQ3KK8VJZZGiahHKtMuViP1PL8/04rpaFknikdy6xhg
         G9LHQxF5WJJw2fIuogp92lK8cBYNjM2cI1PWpkTyvxiQtffUjSL72MS4gVX1N91UI37a
         ZDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558938; x=1779163738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=97aapM4tZqs1IfO4iQJmxPEFoE1eTTwgfUYVmSbJ24Q=;
        b=MNbVDiwnS9sUY48FSsLFQ/VPo+7tvb2I4o2lDEL53uNwF04V9+T27nADBgME2WHr8R
         VJ/t7d/ZIlIgND01tm+n/TRP0sdpON9g1D1YC7gA40TgoqChvzBXgfZXpq3AqMwQ6+Xw
         z5/vc463kzUa33QyDi79edzF8T6Du4aUpeCBQ2aXnli+XXwUS8sBliNAdnBxU4lhxWd1
         bwxPqkXTt+7/hG+F/Vg4uUMxKnRtqRdKg/lhHL7UEx8pqvq/qfsH6gavcKXp7Z46GbOW
         RypGMPQVUMZ9UopgYEb3oXZyQhI16z2ZMqTVOV4M67m/m27DoJSmIxL9+vmCvk7+j2Uj
         OC8A==
X-Gm-Message-State: AOJu0YwbkjrRtc2zWcQvB0ICfb6yVd2QXcWCCP86b5Zq1jidb88ah+0I
	FNbss6CrSuzdHZCZ7y8NAT1oGCzTpN9n5egrbTjxbCpNp4W9Nnf+56tybV0GviZhGQBpUnAiGF7
	ome2gULK23p3gyWpQKUi0jHv2Anyrya5VIDAeDBDV2+IrnQlj8yQr3vpfFqHk0VEvQsWL
X-Gm-Gg: Acq92OF6u7KYB0T7pDOu2AYMK2EeNa4xryDttg2lPC8QfNrAK9PXdCZVdiRjD6wYlzH
	PbYX3mZ/ymIme7WpG9l2oFat819E1RSoh2S6wRI7Vhbmakv/sWPLTGWtfZ1/Z3GekXce79N0T+p
	5SfZ42vD/A8zVmboHqy9nTy1RMmvsaNuYdhqazwm7kKjmF9UQtdiUdv9H9U6Cp3G5lEsro97TH+
	EAmaZIZXOIdOS+LFhbMiAiFSLtqYPHXC6HHG0h4/BoDQBnHV+af1ZqHerW5zRVTDTbm04DXfmOU
	6Ls4/W49fw9TL4ri6JMr+NXvApXNVtYfbpDC+nMSwYHaM6kY+2XYrVTdPQOBPyJJ1F2bYebTbVo
	AsAhkwde4ZPZWHg832omZYtuajeMr0KTZvf0p
X-Received: by 2002:a17:903:948:b0:2bc:78ec:54cf with SMTP id d9443c01a7336-2bc78ec7687mr132514465ad.9.1778558938066;
        Mon, 11 May 2026 21:08:58 -0700 (PDT)
X-Received: by 2002:a17:903:948:b0:2bc:78ec:54cf with SMTP id d9443c01a7336-2bc78ec7687mr132513755ad.9.1778558937466;
        Mon, 11 May 2026 21:08:57 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:57 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:38:07 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: Add Shikra CQM and CQS EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-shikra-dt-v1-4-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=5885;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1ljQ84A7zAj1l8wEckyCPg0Y3BG1MCDQO9YwUdHJcxM=;
 b=T+MjS3kbq+x5i3hAjxh/jxMqoeQz2ipbNRnaqfXHH5A3gzuih/ViELVdU/34Mw8dA0PyaFzE6
 7z18xCvhLJmBQUj0gxEXfjvLKNQb4kpXgMoV6kkRNOADaNBlTEeCEyO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: HIsUJTM77fVdtjyQpjKYFmtGE1MVLBdR
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a02a7db cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=GgAk_Xbvyzovik2Das0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HIsUJTM77fVdtjyQpjKYFmtGE1MVLBdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfX6vqUjTLlQ8Ic
 ir1cz1e0ipR6vFnZpUn5UsA9rnTkMoa/9oesvr7+2btg7yTFUs+YN3Czck8urk3i68DnkFuJFW2
 s2IA4nWEm1I8zfZaLRCMjvpXvAx4ma1OgG82TQ/lfJeIIE8lRZvyw50M5qD6AUHO8G5LabDPwGz
 Z9Ny97/Z79pD17QTTqwjGh6Nd6hrrwhqRDXgI9dza2zGjJtfYWJPjy3FpzONGlfIN0qJy1WloeT
 +uI/h3xsUN30catNI/RftWG8REiObUMrjqL76GplHV/wgp98yFEIMgVBHxcIdwI779dUt/VyRva
 rHupdpxPlNkhNrLwby7jO83P1FAVJohcerF3Mg9T0N+jb/ZACvI4u4QgmerI0zT1+yt4aKgh8q/
 QMRJh0b0dNVWNF2fnTBIf5t85wFp6dwv/ziTZLASbZEAj0lVTgMdqGo2cjfTDxGq34TcXtqDiHL
 zzBEyqeYizqtFBmHNSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120035
X-Rspamd-Queue-Id: 56237519815
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107031-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device trees for the Shikra EVK platform, which combines the CQM
SoM variant with a common carrier board.

Two EVK boards are introduced:
  - shikra-cqm-evk.dts: pairs with CQM SoM (retail, with modem)
  - shikra-cqs-evk.dts: pairs with CQM SoM (retail, board has no modem
    support)

Also add shikra-evk.dtsi common across both EVK boards.

Each board DTS enables USB (peripheral mode) with the appropriate PMIC
regulator supplies for the QUSB2 and QMP PHYs, and eMMC with the
correct vmmc/vqmmc supplies for the CQM SoM's PMIC.

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |  2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 13 ++++++
 4 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc42829f92eb..6de783bcd133 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -328,6 +328,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
new file mode 100644
index 000000000000..12eeca84832c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
+	compatible = "qcom,shikra-cqm-evk", "qcom,shikra-cqm-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
new file mode 100644
index 000000000000..bc93282f64cf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
+	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqm-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
new file mode 100644
index 000000000000..fae8c75b68b3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+&qupv3_0 {
+	firmware-name = "qcom/shikra/qupv3fw.elf";
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.34.1


