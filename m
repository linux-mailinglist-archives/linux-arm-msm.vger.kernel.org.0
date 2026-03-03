Return-Path: <linux-arm-msm+bounces-95184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNKlKJ0gp2mYeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:55:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 027DA1F4D72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C3003136C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 17:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597C2351C03;
	Tue,  3 Mar 2026 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qrz601Ch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpzqnhmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084931A053
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560394; cv=none; b=Md0Vd8So8oBmR1i4MoXhNBsw3wDPxeZdnXLWScxMOlcO2GpJoGauTTiglIhXk9+lI2Bf00iVe3K2eRrMjj+mUG6UktLeofj0KkK1DumyZC3rnmbVe+LEz2kWRYVHQJvcADLIiKkI2tWELKifgwgCy77VbbQm8VkFnCU4aGSDuIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560394; c=relaxed/simple;
	bh=L4i9+NmLTenk9NvF5rvg09qhVWv026X/cuN748GZbcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPNvVM0n/5avSA9AnrQw64SYhEgzLAx2FPm3PWsNJAYVWhdM+Jdsml9hRT6rS/lm4vP7eQTWDZDux+rf9KU0IPFqNG4TWiLi2yQomnumIe/gcAttFAoc69yM1Kz5AYBF2STCYqMyPRTeFRS09fCsj/3lr1uP6rKMY6GN/A17FVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qrz601Ch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpzqnhmJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0WkQ686981
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 17:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IcyxQoUt0WKuaFn85P6nhvrEAnaAOqSDP6o0bqTd7c=; b=Qrz601ChTeX83kwv
	htBd38SA9GJ2Sicjm2J0fwnT6HmYjd8rcfzuV2Q205pD//FXR6hDbMgBvmrAZcvX
	cvr1nNxnkoDNMBXxNMqhewaDJjxSfvDhxvSZd0CDFcUEXm5fQIfDo7r12XWX9wZP
	+uDHXRH4Hv602PJULROdgLsD/XqRj8l7GaqNtaTNqZId2QzTfPAMTer1pQBq8gYh
	XVbhAML6XxJrnsbQwhVpscawiaLGo/8L/uo0lkzvfEIOv9WuMcJNP5YoN5Js/5oR
	PVyXq58yn0cIPhJjHIuY+BTLKjLThV5cH+ysi4Qpa8UeDsI04bjelFFssYXV0A0j
	fyhe4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3na0wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 17:53:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3badc00dso35620185ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772560391; x=1773165191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IcyxQoUt0WKuaFn85P6nhvrEAnaAOqSDP6o0bqTd7c=;
        b=hpzqnhmJWPSlBL0+JC0DAos3f7ZSr71QFPJfYnWRNURrYpLllXE0wo++wPMO7CO3+f
         h63HQIq8DhzbixNjtScS+86u4VMsPNLpZOCr34ZMgQ2qAPHRvoBkSaARkYukNE7DJsYY
         FDVwe3UkfPKVthIqw0aK3vN6e2ct8X5gl7P/F1wsnhEqiPGE+bzLu77ue/kW2qFjLUos
         0jaIunXajhZtA559M7RZbPsZ9/7ZxStWVjjT0sPGCnxEPOlF0mG9YdepuE1lNST7VvAi
         pOPBYOSPjZi7KNNuBkMLNHDEs3JuzK2ORvqmFZ6VvnzrhjQ3YhqM/BPDIC1kRUyx+WiE
         yGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772560391; x=1773165191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3IcyxQoUt0WKuaFn85P6nhvrEAnaAOqSDP6o0bqTd7c=;
        b=utBJ7m5VNqk8r0OAc9Xa2qfTp2NyHA7mw1HlYIXavMjtJF7TQNdn1ju+XO7tv85qLj
         TuOkVvEuv51Z+//LByoSDKkzRbZ4KLIbSdY/xXW6ewHjooKMpY9vT23W0HJRquCNsA3s
         RWLBVayIKG4H6OAWPOn6lb9utD0S+FtdfR84Hp9I52GJyg7kXBf+KJbJO5A6bkLZYSjo
         /rGI37sEoD30KeZAR7GwlG++IylNRqwOpzZ95BLf9bijw/D7fnDw0xtmWtuKmRQJ6A+i
         T7cjXCcKptcO13u/+ff9wYKy2QB0/DTOsekCQ0wv9llz7V2cQ5yWmYnXHHyR1Z6AxQ/3
         aGRA==
X-Forwarded-Encrypted: i=1; AJvYcCUPSRf2pXZYGMwO5s/5wvzt9+PeMxVUkCXxHN8fD9cN4VAvyIADkX8aSQq33zomzxadnDNzII4hBt4Fvc//@vger.kernel.org
X-Gm-Message-State: AOJu0YyGq4EzIGW2zkcm7g/fEbxyn5fw0Zs/QT1BGOlKnvPyVJ7q/Taz
	KkH89ijfVSQyPZY1T4gI0eDt6s90JacftKRRhCXOdMaB3BRAmivibmN/DcNUiWh8xSrk4gMlAzB
	CQd6BiqUzVz3uvjBUe/vlig+l6wWsPifFTQMewi768XzPlzYgHSBzGRkL+BcABH9xnazc
X-Gm-Gg: ATEYQzwilB+394WxDx6oWzh3g1PPXujWcld3bLiLGBs/TRQ7EM1huMR5dJ1XH9my8gR
	Ye2Jxh/pp2wAAh9399hYnA86fu1Ww2wapIFAd0f5bZv8WwG/bxIUViefC9VDs4XFrur8uGk3m0d
	mw8TWVA8x7389HzUlxWLc958826g8iyCJ8U+4WqG/DD84o4gdYkmZTUocW3JbGuyCpyWhR6fCMa
	VPQ8RDf6vBq2UrHsGBMfneaGfKrQ63DSh/SJd9IoHSahmTjZr5orOWEk2a1G0u6027yvhHMBlfO
	be40G3LAIwO+4Nh59KdunJpiz8uQdtT9ue5E6ZH2MFHoifyhPl/uxinLdQXjx0o8W8c+aFY9df8
	boX1uognJ8CSfPmTEH/4EaWCO0QCnkN0OjVjSOQTgeOiI4A==
X-Received: by 2002:a17:903:3b8c:b0:29f:301a:f6cf with SMTP id d9443c01a7336-2ae2e4b0b6cmr163679915ad.35.1772560390958;
        Tue, 03 Mar 2026 09:53:10 -0800 (PST)
X-Received: by 2002:a17:903:3b8c:b0:29f:301a:f6cf with SMTP id d9443c01a7336-2ae2e4b0b6cmr163679635ad.35.1772560390496;
        Tue, 03 Mar 2026 09:53:10 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34e6sm107140625ad.30.2026.03.03.09.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:53:10 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 23:22:52 +0530
Subject: [PATCH v2 2/2] arm64: defconfig: Enable Qualcomm Glymur clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-glymur_mmcc_dt_config_v2-v2-2-da9ded08c26f@oss.qualcomm.com>
References: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
In-Reply-To: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a72008 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: AwgHZyHd3hs3eoeXwmfX6WQHKfcemN8c
X-Proofpoint-GUID: AwgHZyHd3hs3eoeXwmfX6WQHKfcemN8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0MyBTYWx0ZWRfXwGGPTGu2mlpo
 FoeIdGkqo/eWJjsoJIF5LkNAh5tsX//25tibYYUEZb5RXK2pl6a9KVcBPm9rpegXRiuDr1Iiygw
 xBt6b+sSR7r/diDovbjD4/7xwADo7Mo9LKV+SItXoqFeMDMwEy3Lh0g4Q87akCPotOr71RBeYpp
 YXVnlroEpRq9rKN+NrwDr1AJYGJMb7HERc7g47BMIPOwSqqY3mT9j1BwEXtuDo+WDPQcUWI7WZb
 gRpNfkbKLv6KWfEDTbTumCp8TQix9IBZHwxKLYnNCK1aqVrNc7OZSbrJcWG7+ga2WK7ZUdcfiNH
 yL3mIZ//oq7pHMrrYS+oZX8j1eehXFndgy21kqxQUI2gUNVHZfucCZGjQyKhGW7/KYfcCamvacS
 nacKoA84V4uTQni4EuvJ48a72U3bxeMEMnB6UoFfXVF1fE/R05Of6E46e2zC5758P4i84s7UIKW
 /6GoI5m6JM+8xffUq/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030143
X-Rspamd-Queue-Id: 027DA1F4D72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95184-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the Glymur video and gpu clock controller for their respective
functionalities on the Qualcomm Glymur CRD boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee854038fa7a756d8b650a609258bdb3..a607bf49c1563d22550c4b81a237d46fe4ea41ce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1457,7 +1457,9 @@ CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_GPUCC=m
 CONFIG_CLK_GLYMUR_TCSRCC=m
+CONFIG_CLK_GLYMUR_VIDEOCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m

-- 
2.34.1


