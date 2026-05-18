Return-Path: <linux-arm-msm+bounces-108242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLllCzlEC2qsFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:54:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C382B5713F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D0E4300BBAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0210494A1F;
	Mon, 18 May 2026 16:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlf6SxZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFrIi5qx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081323EAB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123246; cv=none; b=UIRnK7kNbVcXWNKyLfqCa/OzVQVzOpbZjv5g6hC7mb6gKIQfKeRmHzjemc/ipgmIFHjk/hmTn5ncssjiuB6YQD92gZZjTfwLWaMItuCbmfp4OQ5ZLGP87Y1pIFeAtjgOq8vB9Guhpwd2pS66pXGEskT6yC60V2/uVe7HdEoOY9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123246; c=relaxed/simple;
	bh=ClDDjyUl4SKlH9uEahuXtDhQEAFlq8qG/UeEokcx5uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/RUeb4Zyrd3gFEEfcbDF0u3AAHQzipCTbSv2SPiRbuVCSaR3R8uaBRmuABjEd78tvfgKl409rVXJity+XNViPmi8I65mlgYWPJkgEwB3LnJsM/EArRVrzI1LtABoW/Fgvax0T3ShHUPx08XqU7vGSeolzoEYfnNkv6dbodxGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlf6SxZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFrIi5qx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAorgE2083092
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QsRIgQLI2Vx
	jSQE2G7J2CVT4oRZL8O7+2aFEOMgl1AI=; b=jlf6SxZvDkUjLbUlYWpqN9ECRy2
	1TGxM75oOz9LiqLeJoWb9CbgFhmRzX1pWc8om4HJe3Z/S/XVrEi0LFqdI97mCI07
	Yi8DL77Ba33eIJ4PEBXAz5JwlkWOfmcV6Zuxd2s1TdZBi1nlqaxWPfLUE7/ye18G
	cumjE5bpEiu0iAOZZPrRdKFd8Ww+9kINVFucLybXsVM81qvgDC2SWksWXcqYq96w
	BSCmskxaYfvF7OC/QELhjYbBszkkUGwMi4bhD1sJ7839UqSw4agv9thI/imC4ySJ
	dwhaquucbhB6TEixTO6obuW3sjY8j+63iYIwrMC+5a4VzOz1VOUE7bL5qvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch9duh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:54:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so27408395ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123243; x=1779728043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsRIgQLI2VxjSQE2G7J2CVT4oRZL8O7+2aFEOMgl1AI=;
        b=SFrIi5qxkeibayzfg9Asu3hYe6ni2NgiKTxHUlI4nBxPUpgACuuI5jixLs5oztw6GM
         xdhtuMsK9gocefNoJqs53MKsUeZUVk2UIPfrCHHj44YaTo/E60fj7QRn8A0LGzF0ha9v
         +W8GI5eeG0H9iy2kR7FPvVs3hziiGV1hfoTjvIZi+ap7p8B1mHb50x69Zdsowd3/I8Ng
         IpSLFJpKXo/FclqP+nCn+oQDBCq0njcjnieOrnxpW6oPhFeLJ3pPogI675pUcOdmTxta
         zxrzvMWcesDWHG7ixbiml9QNIl6VDDXXZTOnqr6ofF7+EXOyU2kcEAfnvNuMFy04Zpth
         x5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123243; x=1779728043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QsRIgQLI2VxjSQE2G7J2CVT4oRZL8O7+2aFEOMgl1AI=;
        b=Fk+lGSMjGVnm5m1SiyXsNyVsmbgElNdYK3KizwyDqneuU7FSz8MsncurF+Qdi/l3O0
         tkq6UoLmZhZf144d13Fr7+9dKESnVzIzmoJRpbnGiN4aMTcpDCvK2x3RkMFwVqp6qIos
         B1K9fAf+UWuFhZD3rxk/gSjEKKoBjpVj1JHtpDivewon2OYr9i9frgTTZdJSfKhEj6Jt
         gwAsg5+Wg3LYV3siF2Z8XXCJW0Ye396SMzvDWyKiV1ZOs/ZPwCj0y5K8nsZkiFLm4xcy
         MKvKUjwoeTLLW481twHDB7ncE7eQxjuI4beHByDH0lZHMmFjj9U5AGCovVXeU+X+4wix
         OdCQ==
X-Gm-Message-State: AOJu0YwrZVJS0LCJUqHiiALptQMpV7KlNc1DOgQox8x90Jumv/kqzU4B
	Dckm2mvQb8SZVpyeDPcrVMlh+zomrDjo6NuXs1b159V2XjHcp98AD8idKiT/bN+6/96Ij5x4TmD
	gN7WXqCZH4fslQLiscL0bWpiXai6mt1sHhUv294CaWqyCcWguWJ2jH+zbGwySdLomXMja
X-Gm-Gg: Acq92OHHT7tllPXiiEOLBQDk1As99oXvax4Y6cjlUXa3SPxBqWw5ufZ8Fj6+z3+CAJ4
	u6VytKMZyfgAXEeDhCjiRHHRTMu/H5AoMkmJU9I8u0LloQsSVDaBkIak+JZddiUBoDrDDxsMHi1
	kLfUMvzgq/thIYNGjbStdfy4kUW5BIcc7HcBb3VNcbh76+/DJi+1LiCp84KnkIdWRrke9JbxmJE
	AtPi666F5ryGxhThR114cBQDjWtvijVDOTwyTefDCD1z4zUkAKhsSpcFVJaIHqE17DRkEp2U4CK
	/WmEmWkdtEu62C4JJGowCu63LgN75zGXCIAXh5TvU2NrnbsgI4mHVIpPc9Uk9LUceyL+c9X9rPn
	SFK4/z0nRz0OaTfXWBXGCUI2+fm5gpTzTj6d8uLCbDGpDzXYwKw2FSA==
X-Received: by 2002:a17:903:3b8e:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bd7e8056e8mr164901095ad.15.1779123243454;
        Mon, 18 May 2026 09:54:03 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bd7e8056e8mr164900635ad.15.1779123243000;
        Mon, 18 May 2026 09:54:03 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm149971045ad.10.2026.05.18.09.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:54:02 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Mon, 18 May 2026 22:23:44 +0530
Message-Id: <20260518165346.1732548-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b442c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YyC-2lJWTkF9Doz0jaYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfX2TLjKkPEU9yn
 TBrFBOiJYET4I58kQjknAXSRjfThIDg0jINXLK0L/LAj6O2di0OET8yOA0YpYMX4wknhj1JQO3h
 25hLHR/pC8t4XD63yOdxu1oA9PUwxh8LGPv3Wr38K4YG9+0eaonnKrvHyMCbYdDaFp62LOsy67R
 KHJFtIs2fhSVxxGdZHlutaGBgobhQ5ZINS54EbfaMak/vgDlhgcjBKGMMWYE3uVYG9pOpVsmsF/
 TYxzxtUKJM0ywemto84MYHHmqdrqmAMnaBe0C3EbuzPIzrcdle7rO59ymgPpqLQY2PgzikGu1Yh
 UNPQmE9MMzjNl+c4Ny6W7drzhaJDsbuVrjJgwW3Pmbzt2er9HZKMmlLkfZQOBDX8sMke9yzoEOL
 p8z9WXx+Ys7U6N20+vFZVygn1+g3gR89w+uChPaFNyYqrDInFjVUUNVF1VMPE0EKGppIkEregsE
 rYNO+Vrh14E2Qx5byxA==
X-Proofpoint-ORIG-GUID: 7uPvs845s9-PdQUGK_uNFtyQpyq1iEK7
X-Proofpoint-GUID: 7uPvs845s9-PdQUGK_uNFtyQpyq1iEK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180166
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108242-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C382B5713F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..2326dcf38a46 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
-- 
2.34.1


