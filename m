Return-Path: <linux-arm-msm+bounces-95744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGlhDvKaqmmbUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:14:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F121DB3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C84383034C65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182441FC7C5;
	Fri,  6 Mar 2026 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQGyM54z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iO651oA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCBE33D50F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788457; cv=none; b=FdQdYdC0gtSLXuyJErscVLjLqmI9SMWH7c4cCEyIRBeuc4X3rklIO432h8xaw2OUcAMsyqq3XWk4s9RlZr6c3NQssLUqJPajg+ApfiZV2oquQJYwNZSbTSeKVeLQwe5X9LlqOKxRWCT9XXZsTZy7Cq6jEOA4iRWVRAQfV5h7Jes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788457; c=relaxed/simple;
	bh=j9kAVWEcq4kJ2U6go5+vijxNxwm9aMxldtxRHQOJjNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IHZywY+PypSEiMCQxyixx7dz9+aNXUzqMzHiBj7/twA6fTohvGcH0jLh4yQfy+W1LpuM/1p3Ta79yW7j9W3GmaTqT4nEHV9E1xDWdLxBspm/MgbmDVwjS7ZIhhouz+ci4VDVb/5LbwjIGq9V/Ri9z1FIbkdv065RI7Y5yMxKwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQGyM54z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iO651oA/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aUru1087363
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4KJdcPYS2T/
	tDwl8v/ClnTGiIeSMvSg4PoOWVnBABxI=; b=UQGyM54zSV4jf04heiQuJ3X7wim
	mIUvcoBUQFcXlm93puG2d/PmXdv+JSWg1X6jrtXR0kABVqwhMmZQccOQa02hWHIX
	UNPDz8XWVPYqJt7QplEUFsGVCoyzjujTB6yYMzowh4Wq0CHWV6T/jQ2xWZofaOf+
	S6d1RhGnzDK4xM6uFUAWfS/V1lePx0WOkAVsYCfzNf8YsooPt9n32DX9JcTIi+4h
	q6hKIsGW5B2ngBXP9nuTPV2tFNfBUNxpyUBwKlP3+IvuZNBUZDKteZh8aSPsxjR7
	N3ppwOyjwKWWPYjcV7iq5mY4hoYfeLMs/fY/vSf/uKqq4X2nAsWQheFg/jw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6afx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:14:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829aa961449so41564b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788454; x=1773393254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KJdcPYS2T/tDwl8v/ClnTGiIeSMvSg4PoOWVnBABxI=;
        b=iO651oA/vTk4B0R1LBuISo0c5U+uMdGLjJ1UyOXTp8ebbuMgdm8XBfeb0DfLEBoZdU
         ThV0B93A1NkvyD4WeTjumhWCrUshvnZAu/6IBT3HiAOU9zE8NgELqrfVSyrQ3X3o85TL
         SJ3OQDMf1QPXNkNlQb+SN4By/QVv56ORAEc4Iq4+ak7F2AW6rvHHIkMDi1GdGN5hH8GN
         OnUmzfKLOyEHyaPQ03jHu8ikP+E618d3C1lAxidYfPTwXZtlp0Hr8yfnm7MiyBvf3byH
         cqaMufBbWcqN5UAk1BDasY/Y+6r0OP7owcl0wItL/g5HEJL8aEhvlVfb1wBHjwZawGcs
         TpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788454; x=1773393254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KJdcPYS2T/tDwl8v/ClnTGiIeSMvSg4PoOWVnBABxI=;
        b=AX44DFvSxO4OOwIRm23X8OUkFtfAQRl7/cmlrHUJmy9HxN5swFScBxiL6dLOuyjf6I
         O1gHCsStYODh132Eekuw28zyEyb/hFWEh3l3SZ2fno9FYv0Azew52YakW2PQ7nEBWz+G
         /u+94atkktoLNwbgkNad5ykPqIRkWWlQ9Ryi3Gxq1n+nbMXwzHRKemPTzt3XytJU/QIb
         lCgO9E8gP3Bm2Ya9O+qd3iaED/vxe7KngkQYyM3k0W1hJTU9FuLGMrlKzQPsnOWbbSlb
         JfYDWZMCYlFnMLV8YwDn9Vt0uSjJ2YxiX7iAVZEbIhkNaTDhu0+EX+S22itu2snf1yhf
         YKRg==
X-Gm-Message-State: AOJu0YyyuLKW9JHzL0FasY5SX6TWmldD9ZHwY3a1VZ+wpk9e1/0Hl5pr
	L0dY2VEHuA3sF01/jJsQx5bcRw6e5kWlouqL1M6yL4mofPKDWseDTNywdpRAjQB7XpnF2fAFK54
	K6wZSr0Z5IAooQq/h5fP9tEuS6yldGu27fLNIwZ7/DBEwqCqpGpusELs2nPliz6SPGrdK
X-Gm-Gg: ATEYQzyLskNpii0KHopOLSlpOCZ+h1O36+tfwucdvynFWrhpWt88RYOl2LKWcwu57th
	yQwKxLwyB6s/j4sf/RdkE8ZXdrgD7Ok9g09MJLswAx2t5xETQQHdwIvjab0WV6bvRU5swgLae2M
	T+LtAhNZP5EEEgmS/C05vEVjnrUdTRqrEVaivns3qEODb+PSsnaw65pP6JT7uNdggqbVs1soIEX
	jGsai90ByzIBJIcxH4FpmlYpuLopEAeHhRP5Nor3B+MPITepwKb+oPXqFZIAGGtUDfTnQIYyKTX
	aaUy6vIDuz/DVTHpvPpI4A0n8Z175VpnxgncO1XCUY/4S6hqbhPB7ZkFT3VrktSbP5QgjAR+1mx
	+4E3Na2/Yh/m6TxBROC64roa88tuN6HsydNsX12F+vzvPuC4iDMYovHc=
X-Received: by 2002:a05:6a00:4b49:b0:824:374a:1425 with SMTP id d2e1a72fcca58-829a30b1239mr1417585b3a.53.1772788454347;
        Fri, 06 Mar 2026 01:14:14 -0800 (PST)
X-Received: by 2002:a05:6a00:4b49:b0:824:374a:1425 with SMTP id d2e1a72fcca58-829a30b1239mr1417566b3a.53.1772788453833;
        Fri, 06 Mar 2026 01:14:13 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48647e8sm1169360b3a.33.2026.03.06.01.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:14:13 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/4] arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary USB controller
Date: Fri,  6 Mar 2026 14:43:53 +0530
Message-Id: <20260306091355.1178333-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
References: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U9AmNoxADM2w636ZqmbNAQFK4TrGHjyQ
X-Proofpoint-ORIG-GUID: U9AmNoxADM2w636ZqmbNAQFK4TrGHjyQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NiBTYWx0ZWRfX/vP0nqPETvSa
 7wfa68lfu3VSqg8br18QHS/TaFhynh4M5XvtdGm93cbMaLvh6MeJpMtXv9P0OUoVwIdBzqaheJd
 onbx1dVLSCN07qUaNPuZIppLfN0xs+1ayguxLSs80gFsUy7H5MmmEBUI3fzw741QEdQNLWbmXM6
 IRqKz/cMg8G1baRRS5XiJPJ7ZGq85YE4waSEsqD97lIahhQ+zdGjwuHwbzBWloFbjVZh7lOlCp6
 mRvGH9snVsqzoBtIkauXPMG1tHUUkAS6mpn96KrF6C4R86hhJpf9go5nZpPL+sPXEZg669quREb
 t0055nMUi5PlYR60VXqQh3cqkxMwdZi5zS3iAXK6jO0bX7eOP3ZwT1P6/v9NPIAgbA6PDcUL6qO
 z2iYYE0vuHjspKtZzXezgpAAu8r6XlD7lCNWdxdFZIN8t4pYWHmpIxHz51WcztXrrgAlv/A9Q0U
 PD9QcgWfRRJFnBPDplw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aa9ae7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060086
X-Rspamd-Queue-Id: 140F121DB3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Rename vbus regulator for Primary USB controller as per Lemans EVK
schematics.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 397052394930..687cafe3d15c 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -44,7 +44,7 @@ connector-0 {
 		data-role = "dual";
 		power-role = "dual";
 
-		vbus-supply = <&vbus_supply_regulator_0>;
+		vbus-supply = <&usb0_vbus>;
 
 		ports {
 			#address-cells = <1>;
@@ -132,9 +132,9 @@ platform {
 		};
 	};
 
-	vbus_supply_regulator_0: regulator-vbus-supply-0 {
+	usb0_vbus: regulator-usb0-vbus {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_supply_0";
+		regulator-name = "usb0_vbus";
 		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-- 
2.34.1


