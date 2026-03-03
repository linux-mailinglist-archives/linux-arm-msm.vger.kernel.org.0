Return-Path: <linux-arm-msm+bounces-95064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD0+E4SbpmnfRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:27:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A51EAC50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8655F31010A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331F8382F18;
	Tue,  3 Mar 2026 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dus6kN1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Va0pyPLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9EA386C34
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526129; cv=none; b=DoRU5T0JhjnTd+wke8g6M2DfNvS+IKw87Q3Hsk8fA8258dgJpHE4jjSstUJG69xox/qoM0w1wnrZykxQbO810cS2p6uAZ5XfOW/KDgqkJW5XANh2hqNBjmr5GssuN4bmsTtVSAf/BU3fgyEMPiGJu0/zceJ5n9RHTBCIObMdDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526129; c=relaxed/simple;
	bh=5MkZoh9idZENL26/28+Pn/HPSrFTn/xu7abpBPsP8zY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IPqtYnaRX3AvNdQr9GyCkW0IMsS+EN9YRnTPOQIrF1jUdEUIDrVdT/96D5KA6ixtP+Z6ZXNCLdnVlf7VnwgE2JL2TGgQomnCMovhqk4K1VTiPFcDZWBP9FIu6rWLWUQypR9IWB2lWZvSiPPusTV32CMTzfboaTb5GwhY5atseRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dus6kN1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Va0pyPLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235XHPm2996379
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nIvKr7vT5akEbC8p+WY+aXK+vgooWO6+4BB
	YhjPYrZs=; b=dus6kN1CihYouvHJxRRoNZ3O4wfRQa9dw0iag8vIH20gukPsckm
	pEouSDhMh/Jq7ZzshlKVtt8iC4kCF7zyPcxSNROnxuvwcngGEnIAZEfRbS3ykegO
	YMBFUjExkGa7jH/LHzkluVBjKXKME7hDtpBuhVRMQCFVfqsigiMExyNdgy/jO4Tz
	OQavTEQfQwrUgvB1sk/cVZFVYFQGAE4K1DXKWwMeYFsSJA+Lg5Zr169IQHqJD77e
	NjiwYBlWVyXrHhxOMHu2KmuO3Qvg3QdqOF8QQ+17NfqjOGK9kn2Kwnl9tVEpzIYI
	iiAeRhF9NBlUa6x6pzxfUBlFypB6DJFLSvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6ua41c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:22:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359812e4fefso1689281a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772526125; x=1773130925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIvKr7vT5akEbC8p+WY+aXK+vgooWO6+4BBYhjPYrZs=;
        b=Va0pyPLEUA50+ROW++Vo75h5juiG/p22tvcwYFd3d8ZqPPgJFdeHEZUbHmMSJm0L93
         4UKiRvn1/JYq05sWEE99j3fJbtBfArl46Mzp2sS6+fX6d8vjD08VqrJhWxpsUcEJ71Nf
         iOI+dbXAW1BGWv1+o21STghUElq3Rm1yQh1myXkk2SPeyoYZVPaJ/XuQqHZoeMlHqxCq
         2Qxd+VwIGe8G0Sqnbr2EpIx46ok+LIZLbrHg4Dm/O9dINpXrROI++WyA8dYm00t8RhXp
         n3TNNz3x+lCtPuhTtwGPzQ9LF3QmuDHY5FF0rfEwknez2EUqJNIBWVUFy2cSImprHr2d
         qpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526125; x=1773130925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIvKr7vT5akEbC8p+WY+aXK+vgooWO6+4BBYhjPYrZs=;
        b=M5axfKvNrHQ8frG1rgk5SuUarXTF2LhEtCClM+UGjWIrUyRcdXLgsDqtSWAKGKnZyY
         oU09HrQyBa917HtS7e4zl9U8VoPy230Y+25/KiHpCs5Zn+bn+SYp4+bKlZm5dR9yP+/w
         pPAuLRHBybp7T0CSaVdHHU7pc9+aa9da+gkgO7/Ps+uxbo1ZA437pkpK5E3gpWTe2i7L
         8HdwmB/IHgPDfvnR2oUD21zaUOaAlGBvQJiDYE31dPhDIJpz3mQBxJeFIx1IiFyvPQW1
         uPR+11GjuXYQ6ik/mNybhRGwUlo/rRq2FBsqx8ZDvevx/fqJTZJvHonam3Bui+991tns
         IMBQ==
X-Gm-Message-State: AOJu0YwZNqJVw3ZAcCoO/Qy7zjtOPGz+HbJygTG09tD9Rwb6Qkpy8kDW
	XmpOBCdq+fB3DFgrZHifuywQHcgBnlyT5S9gNIp/w+kWlxoJPypiV8rLanRy7t08gy99sGNlLgT
	5d9wsJqeszyESF0EYRUCl1PB/AuwHb7Nxr2wUoUJhdfnl01MRsiGte7luIq1LPE7Di5RaB5QiEo
	0x
X-Gm-Gg: ATEYQzyEm1EGyA9DdbHjO67bdsb1pb+zNdkhz6Zz+8y8ET+BN7AIz42bQXClexcrWse
	xMdg9q8mUqBWubYcYK5aHrMFZnHiJF6bfwozHbgukYCXX7DFWvCsPsGdLiFyo7xzfNHyAhEKSKc
	BS9uQ4fLbb5mso+Y3/n3q7V9633beSlLLXFEz4FzIVvqTA41Kbq/4ooOZcS0mYAzPAwBoGeaUbL
	l91P37lBcliqT3VnWThgkTtyBeJVVF13APoqsvskSYb5NfakXaDrifT+mXC4jUT4zfbi8DGQ1nl
	iAaw3tObkYf7+EQJo6zIwG/dhK4NMfb7ruH7HA8VTpBCZEYaSiq/aRYFFu6xgDMVk16JcIngZ5X
	Su8ZNBH2xlq8mUsSbl9bOPDHpbxVh235HZ9SSmiZagKB3ukNzJvS+jLU=
X-Received: by 2002:a17:90b:5587:b0:359:8ca0:308d with SMTP id 98e67ed59e1d1-3599ce83a2emr1255253a91.14.1772526125163;
        Tue, 03 Mar 2026 00:22:05 -0800 (PST)
X-Received: by 2002:a17:90b:5587:b0:359:8ca0:308d with SMTP id 98e67ed59e1d1-3599ce83a2emr1255218a91.14.1772526124629;
        Tue, 03 Mar 2026 00:22:04 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4e2f85sm1797214a91.17.2026.03.03.00.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:22:04 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable secondary USB controller in OTG mode
Date: Tue,  3 Mar 2026 13:51:54 +0530
Message-Id: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2MCBTYWx0ZWRfX8KxOYNfIAmHw
 n4oAuavlFtbBs+JxnqAFd4U/xZIpNqEH8a8cQ9n3N5nwEby09tIQlbOo9ZTHID6MKjnp0BjPv00
 WOQeq12cV8m17GPbUOkCf5jGaLcfLgADTe6AdTCBNyHl4J0FJcba7xyM9IUthUL47/EMvaWTuoC
 gOOK6+9upIZQJbF4EokHatLrJwT87MfPkij8b7d5Z9btKJR1di5HN89V75/5CATxy9dncQndAeS
 +cSOTU7sLFW/YKgBqdn7dHDEWHkM/ibdkSJrut8HKYGmG0ywjCUQX0n5yPBFi/sQ/G5kzSqlDb7
 yBbaWAOd44oQ/KUMhsIuxtL0/F338JyfMMWJxKlWrV6dPS2+NgDk0vUPnEMbfrha0dAxOCmwcFC
 /3+kxMD6Yf3lK7J6DZINT0TbvetSvmI94YFvjShBuoPfOaj1j7qA6/IbPqlOziO8FURfqyVVU4W
 3s8G8gLZ+ZSJ09CGiNg==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a69a2e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xLDwsqNg2EmkyYomXIwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XAM8xPN1zMVQYWCH4OVmzSHIRMuoJRoP
X-Proofpoint-GUID: XAM8xPN1zMVQYWCH4OVmzSHIRMuoJRoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030060
X-Rspamd-Queue-Id: A30A51EAC50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95064-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable secondary USB controller in OTG mode on monaco EVK platform.

Changes in v2:
Separate patches for Monaco and Monaco-evk.
Minor formatting changes.

Link to v1:
https://lore.kernel.org/all/20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com/

Swati Agarwal (3):
  arm64: dts: qcom: monaco-evk: Enable GPIO expander interrupt for
    Monaco EVK
  arm64: dts: qcom: monaco: Add role-switch support and HS endpoint for
    secondary USB controller
  arm64: dts: qcom: monaco-evk: Enable the secondary USB controller

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 131 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |   7 ++
 2 files changed, 138 insertions(+)

-- 
2.34.1


