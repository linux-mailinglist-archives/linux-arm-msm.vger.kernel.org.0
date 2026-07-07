Return-Path: <linux-arm-msm+bounces-117280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZdsqMdXZTGqaqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:49:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9FF71A9ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EHfO6r/J";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K73B1P9W;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117280-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117280-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA9E83011853
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A933F39FC;
	Tue,  7 Jul 2026 10:46:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D73F1AC8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:46:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421192; cv=none; b=Fu4cdRavtqhfbFoAYbFFpDpZobsqgXvE4zDMnpcYScoAna+7rijuQlXrl63mny2B9FzU0NTtEjgYmV8GUCMGt9o050adj1LvfNb6wKvO1pif3rzMARCPWsGD1HBRwpHIBA8yWnyBx1bnCO0JzZbXBMY0ZUo2AjsZUoUpc0GJZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421192; c=relaxed/simple;
	bh=dJGZm6xgrWNtliSU9OgWPi2p5VsIjPkNDtyZPFEpkRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qrl8dw4VxOzzHWzgR8I0AP/BqsmoehP8XmO1hSiDm+mKvPNCpn/sSbGpIURtlIuKJn27VvUh2n8879pzATSFUhPv4hb3mrhGAIe8V3RHC5X4AmjSvnZhzCUSjiizv6Apc9VswwC6omQiB8BubyQGFkq3QN8eM9VPx34xOBKwurg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHfO6r/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K73B1P9W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DjJQ3138631
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TCbdthLbsJdhdDNxeC6UmL
	z4Tj//MHtLYfViflFsHgM=; b=EHfO6r/J6gr3azxlAc+sUdUsold6wc4ilO26Ep
	bzeYC2qFPeAALOFzbe4FeQOi53aenaZhlZMVn5e2RUdgAj8o8FeycuYbPagb/YWE
	rFb5qkSm+ubdfTriUNm3l+/Qx9VvLaxhvkjbM4LNuxh45qrKs0T6r/YOk2RUlU3v
	wUr1CNwHmP4F71/7UDblbS/nnGk4VZRcSVZDd9HkAhlNuwob6e6rm+z8Ma4LCd3d
	ynJtCuqdi9Qx1wHMNBFaCBLv9LEel+0UVc0FdIAZNJIzcRUO8sohkkL4aPdqorcg
	nkxiJIk1B6MTJuQVyJAks2cLkG/CvNxGLN4LSXfJqDut9nyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t159jfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:46:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccafc5e82cso22268325ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783421188; x=1784025988; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TCbdthLbsJdhdDNxeC6UmLz4Tj//MHtLYfViflFsHgM=;
        b=K73B1P9W+Zkt6jClEiW8VhiMh1ayN9D78Al3NPFEj9dZQjxA7L/CjagY1nCx1V7hdI
         2eLOHL4ueZfiZVvGv7LeIKV+5XPze6NwyZJ2Vr5qb4mnbBFanV2Tz3a5v6WArjKX14cY
         x58hvX4bktGSjkpIe/NWR3puYzFAK3/j/TAhsfSPs8A0CIgLlvvPi8EaOkH9CBJnzfT1
         nE1KXvfsGkUdB+6FB8imzB3HAz6PcKE6ldsbgekUH8Lb7pDFW/KFm917AaZXKsJlduL7
         +Jatmyp6STDTj+42lCdh9j1FIEMsCcpFsQzBNoqbdSu8qGYcEF+J+uL4rtyug2xk6aJZ
         7yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421188; x=1784025988;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TCbdthLbsJdhdDNxeC6UmLz4Tj//MHtLYfViflFsHgM=;
        b=SlZjFYDqEtzLcnDQKkqDqV78F37FUJUei1wPK2S7pOIOkCcOJJRonpTtBsg2R0yy0K
         KPqwtffZMA/pn6pQRQlfCVUu1U0bdSE5mo487/1G+4VmgeYs3NwF3ZED6/oiyu/hZTOU
         dcW+NtAPbPjQMRyZfh95mQbPrL1dVxZxpA5HdWtWaQqV1XHbYM6n4UUdfqmTGB2kXccd
         hsZj5TRuIJdHtkc+HhL9yYsziWihgJF5TWrDyoOcjsX15B4gDLjUvJp+bR+7PMPFNQc3
         f8kIzkPmnr7At/3kSkqOlWCAoAqzSmfYPmMghfMO0n8MQeSiaKLzop3bR3t9Db669QD/
         PouA==
X-Gm-Message-State: AOJu0YzNAkWJnE15+hAmpGJVu1QJw+l8CUZucSJ6qaFwDShtwO29Q/D+
	lo5WPV16u2PxaZQuYZ/xdlIrLszwUnxEKp22l6XtLU+RcbrEI+0LUxRInnYWRxkdygsXPeSPXWL
	//ywJkEHE81D5EJ3OXXDNX/b38C6JodrlvH9COQs0Y71mvVF3GvcDekkA3+vLNSGt2s7et16zF7
	Wz
X-Gm-Gg: AfdE7cnlmndDTqgQkWbn9SIfVB4khL8SGMx3RyGf+1Nlwxy+pa005mPh68rcnKtlry+
	NY/S053YwFUKPVvNp18LQfr1uxaHfJdwJBbVqGxBoZJKUabot9TPA/nfweqb1NryNsuQfcaIwJP
	VQm10BPVZn7unN1tQo2lVijp5S7JKSbvPpc+73+5R8HKIOpGcQNvhhcqe1rtebXv4+F4spfxoAZ
	cOFVvtUw4zz8CX+Iwc3IXAu4IkAdm+3ifK2iJmeB5HvCI/YXPANUTrzcSbUGMIhwDIkGL5EZPp+
	jpSE8oA2c8KHzUrB+J4/Uf6rTUTMmLFefz1VcKWcme4sM/luU8w45uF9fg6GKkEM7qth9N0FpP6
	T9dbzgExXoCzcxP0nMhftzKH1U7zrTUonccPswEjX
X-Received: by 2002:a17:902:e845:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccbed26577mr45888505ad.28.1783421188096;
        Tue, 07 Jul 2026 03:46:28 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccbed26577mr45888295ad.28.1783421187635;
        Tue, 07 Jul 2026 03:46:27 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c100adsm9388115ad.32.2026.07.07.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:46:27 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 16:16:16 +0530
Subject: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-purwa_high_tj-v2-1-b66f10ebf1cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfYTGoC/3WMQQ6CMBQFr0L+2hJagRZX3sMQUmih3wjFFlBDe
 ncrezcvmZfM7OC1Q+3hkuzg9IYe7RSBnRLojJwGTVBFBpaxMstpSebVvWRjcDDNcidFL3jLtSp
 4V0F0Zqd7fB+9Wx3ZoF+s+xz5jf7ef6WNEkra4iz6SqicKXm13qfPVT46O45pHKhDCF/vOUNts
 QAAAA==
X-Change-ID: 20260416-purwa_high_tj-5f87b7ed57c9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783421184; l=1556;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=dJGZm6xgrWNtliSU9OgWPi2p5VsIjPkNDtyZPFEpkRI=;
 b=dOjlVisINVRWXIbg5c3/Hs5y/8WUmIKpoJr8SXLeLtjeWGMob0pks6WVuLQGy7jfeZ/T2xxns
 ZiCnjtA+t/yAzcUe4tAW8UkaoLHSirPFVl+h1EzrvQhN3NxGdvUScYs
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: ydMahGCYsh-JaCHgAK-SzIgLIAuibQgv
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cd905 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rnUGh-oqUXyQQgXjzFoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ydMahGCYsh-JaCHgAK-SzIgLIAuibQgv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwNCBTYWx0ZWRfX4RROfRXLE2lM
 r+f9rNyHpeEOpdzcWqNd5ilPj+ODJMCzwcSTHpkvtjJyw2ElGK9kTUzBEKZBBJRMdDMfychMBVP
 cJVzM/+fW+MuFWE4UYe37gU5KWElIUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwNCBTYWx0ZWRfX63NG8hOZzWGf
 suBuc2QVNv6bof7UBrdAfSfN7ZRxEV6ZTrpklZ9/J6ZRhtysG8ikIvyWxqlvdQtTdvXRemlyCcR
 L5iMfKl+SvST0De3i7QjV+dx2t5SIYpDBSYX9seQSbDT9qlKUSqnkbMuh1WZbsyGyDumx2TUKXp
 vh3dHjdE3m48O2v5tS50mlRcPnG+6d/nsCn7chZbCzGjYWHzEyavb5FrEPFy6WvkBJmAbuQ3NDe
 ucUjQNNAmnDG/2YrIRymL8K9Lfw6vrI8WDRpC2T6JuwSHRaOOKalY1+/ECvpfSI9EoUUGq3vyaS
 u8bP+Bpcd8sf0ZenhV2LzR1h4KA01ETjGxgDE/Q6dQctvqtbg6w+99SbjT5RRa9Rsfrym9YP0Sc
 Mq3SHHQMJzl9Zz9B8rfjlWYEqpEl1KEaIqr2IjJD0K/bMOSx3bZmO4W/TqVpP5+EmdpfPp5svMH
 O26A7umiwDkyLlej03A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117280-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F9FF71A9ED

Purwa IOT boards support a different thermal junction temperature
specification compared to the base Purwa platform due to package
level differences.

Update the passive trip thresholds to 105°C to align with the higher
temperature specification.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Changes in v2:
- Rebased patch to latest linux-next tip.
- Link to v1: https://lore.kernel.org/r/20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..261d1e85651d 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1325,6 +1325,38 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&thermal_gpuss_0 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_1 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_2 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_3 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
 &tlmm {
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";

---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260416-purwa_high_tj-5f87b7ed57c9

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


