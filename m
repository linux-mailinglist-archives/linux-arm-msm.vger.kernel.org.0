Return-Path: <linux-arm-msm+bounces-107600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDrTLpPLBWocbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:18:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC054232E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F780306A94B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E453E0231;
	Thu, 14 May 2026 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgIiWZSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS92vSc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E7A3DEAEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764612; cv=none; b=m9M1f0Ja2Rz4nTsxztYVg4V+N0aXX42sEnYVv6btgZc4r/xhjt+y9sbDurd6A7rs0rfVNIBBhzOshHCJ1Qem0pCGu+ECMV4eXDrwvtuQ/Sl4i3lCIXtGD0qZ01g8URqG7mB1gpJs7e4/Va8oBKFhuq55J6MchajgPwZYCAWUWKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764612; c=relaxed/simple;
	bh=rz4pAC3JmkokksupZBh5SY5itEvF9BJ3dxlNr3lUXsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LACEFPjtUAg6i8kBGp/dH4o+Obw+sACClVZg+M149j2iQgTePAh+P75LUcFtSsE30hEp8lEYHI3Af4DzK89xChM1wBupqkoe3Gx4sQvaYQfaDyffq4O+IOFqrDny2+IkpI1iz50JEVSQ5JzULHY5NiCvyCFde6nUdFaPJDPH6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgIiWZSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS92vSc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeehm3062147
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fctHXbGxI63yquHiTvFAqh3nJ5cncAR/B675vKBXMU=; b=mgIiWZSZWp7VehKR
	ozbUOrZvHTRPatZj8yrMDGKSqeay0QXPAZt32spZRD9xAHJxbNtJZQXtcUVZf5PZ
	OTVLWvcu14ghNM4OYZP0a87yC+g3r+sMMYFJGCRVlh/1GqRJ3rHL/j8W3OOSI89Y
	OXYT28kSAGnuYC3liS4b7SwJnNjsIoIntInA50JXv4oiNHAsHywwL2lhxYI8HT/T
	X/mK+QYVbDJ4Qrbvc0W9v7xW0ycnXY8Dr9itoAshsNui8w/xXP4XAn87GnJbCovn
	poxtuBbUY0WXRjbpDJcl9ISYAcR5BrkUgg6fSncTCsj7x58U2Uqngv+Gjqhb74LT
	SGNXUg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aa3ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8276c91addso3245598a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764609; x=1779369409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fctHXbGxI63yquHiTvFAqh3nJ5cncAR/B675vKBXMU=;
        b=NS92vSc5iWiWmMTPtgTH66uQNHvoY2RYdhy7KTIDHkk+zY0Fi2lFdaN6kRGdb61/gb
         wGm8rEb47h4pToNOjybDBaXNy/gcnvYPmW2+RkYrWh6p0djEbhK6wkxbk49ETFngP2iR
         NSrEM4H3zgZLz/KvL5Hw4QNqKWOfxNLdMtuC5IvuYLHmnVeQT8cO9aE1TLJ+MBxwgLYl
         LEQi1KQUKvRdKyW6fOH+pOna4yTZFmOFNO8UZsKM/8ccG8V0xIxSeGc9f2vKG9XJtU/u
         bE090ztqBmCVo/T5ufNRBs18su4Aefsg4TtVS7GZCpN7jC+wtBzHpnWNsN3Y3BzHGope
         0veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764609; x=1779369409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8fctHXbGxI63yquHiTvFAqh3nJ5cncAR/B675vKBXMU=;
        b=TwrA9/A2phE6UHXDRbDuMgYKxIKmhsRZxjlzzPK43jklEJQaGUeilmH74IyLoGX8yX
         IESSbl3QYewKgbyE1njTYq9usyuWXPqre/l1XFYOfJUiVmA+2cTI33kEgVmubxfIFycT
         aKjpFdSDElJ2fQl3nYq/wJ1NDbMkTwrrUlT8H6Qc95Lfn/XtlDkhjvrWCC7Uo9X7OXPv
         tO0s0+0ONfTyRIHsg0ybmvN4NDnQIp4qiTkyZFySDIpl7BYUirqNE5tt6Bd7xr1ii6o8
         3L0bNSqo3Dpvrse2B/wu6Sr/So+vNbXerrryp+iwMNOuyRJiSjJi8U2BxUHQAUcOH0Fv
         U92w==
X-Gm-Message-State: AOJu0YxKj51nuLIgZalQxVvaiu40gFzE0R+FlCj8spmJFQSqYDFFDAlu
	ysL74sLGpmMG3Q1JE5vtizQgjTISFzLcaTc1rI2CtlhmGRBjePP6yC6leUMpj/3cxo9deZSYaQI
	i7JWXLEi0pVPvpfbrw1LPu77BTFq6jL5jbS6eILATw5SMfIx9LYcEDOXpWKTHgHtuw65gYH9kcY
	RS
X-Gm-Gg: Acq92OGn9ywbzRnOQTDWc0xRhGEYqYK6xv3xYg+9O+UqgoSPy5Fw9b69n3i7Fm1cN2k
	wOsLBfbI5jLzeoKgFRoZMtQfiyIYN3mwZ6nuCAsjjwqXIlK/bGsx6LvRfg7jyLiYfUXd2WLiUJE
	uZgLdTglxkXrNINUboK39JXYTCxZh/P4jGxITOTgFbTXpA9EH+Zfb4MlFaaD0sB9YTij+ZYkDou
	qq03fzOBpgA23+Q5DlguhZkvoM9pntnsT5pSq7cGcTZ/9LK4qPcepdKyH2znAY2Hpfp9MtwfyFN
	jEKCU+qQZuvNzSL3gEPB2BZQRYaCpelWzwJafx/gXiFp537Tfyd8KwAk2BzM3W8LIYkk1WmJrJn
	zz3cDuyu6fnNVKgrYcQBTZzOOF5B2uLkqOSpxooQVkaOX4xLMBmSqDjs=
X-Received: by 2002:a05:6a00:4509:b0:837:db9d:9606 with SMTP id d2e1a72fcca58-83f042903d4mr8160272b3a.23.1778764609128;
        Thu, 14 May 2026 06:16:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4509:b0:837:db9d:9606 with SMTP id d2e1a72fcca58-83f042903d4mr8160225b3a.23.1778764608625;
        Thu, 14 May 2026 06:16:48 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm2666656b3a.43.2026.05.14.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:48 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:46:25 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add TRNG support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra_rng-v1-2-4ea721a1429a@oss.qualcomm.com>
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: q0jdQa39Svds5ZrYIk4_cqvKB3UpZNV7
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05cb42 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h2DT8ufvGNBHFgdSJ10A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: q0jdQa39Svds5ZrYIk4_cqvKB3UpZNV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMyBTYWx0ZWRfX1pMjJ/Pr2/U/
 nXeJnppk2aH1GGCEv2PKLVfE1f8399VJlX670gk66q9x+UN7mUwChlkjfOG61fiuBPQXAbvHRT+
 q689ciXAcW4Pns86QjPeqiMZ6gVroUDx4/9PN06EIf8Vb/6btVn0il0rW+ano6KQTvm2SYxN1KE
 ZRzkcCZRJqUtlOllsFfO5Xg5zNogwp3ZCzdGYnIkCpnC7upyFYecG3gebi6d4N2DyvG2nW+0AA+
 uV45rTPoyA/ppmk5LXwF14PM39s9y76Braj9MNq0ThqiShROIAnEKgvowHQGmK3ih69hWEPpm09
 SXZybnUMRAsUzATjeSgnHqbahQNH9bCjPNUOQjMY/wErNxeK34qRzX+sSjACEkOffeAxfWTu9cc
 QqS1NdmxYlYOj5XeN6X0tv5yywPK0vXRYO4fN4K4FjvPPEfN3gyfjsBVaEAXLOachKiC0oYlAsJ
 D2O5FMPzZT0Fmh2i1vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140133
X-Rspamd-Queue-Id: 27BC054232E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107600-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.67.246.112:email,1c40000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add True Random Number Generator(TRNG) node for shikra.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..e81210254ba4 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -580,6 +580,11 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		rng: rng@4454000 {
+			compatible = "qcom,shikra-trng", "qcom,trng";
+			reg = <0 0x04454000 0 0x1000>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;

-- 
2.34.1


