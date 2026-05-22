Return-Path: <linux-arm-msm+bounces-109413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOeJD2C1EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 769805B9C6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A09230265D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BD2384CC9;
	Fri, 22 May 2026 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqpsrVmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIsVzMHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0537FF6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479698; cv=none; b=F0CqZiHhnyvcAQHopuea6V5UjnBxz3XwyS2hYQhSuZVgsISIVBqD6KG8cN2ziIA60auZqCVf9AG0wO7E6VocbBILzzbm0BeaL7YQT/p6MbQ8FooSyXYfn3ubQmeWm2689WweD526LBM59IpxX6+NEF4Fr7wFQ5nbFpAvOh+pn3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479698; c=relaxed/simple;
	bh=UvmAXkOf8HrF3l6BJrIdhv9+2SxA39m8PzqUXCcyi6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tvb1HaTuim/NOJoGJEsYTampPP0O575d7xPbUGzfvHpPFBy9M46YI4UdcekXRUnjFOTQExRWJi/elaiKU+SMJ0GVoTgQNy5Fkpk44Ytn1cP1pLhoIsfAldWi4ZX+PIaaSuRU7hOj9i3TTzkp3MVhTp9loJ+568FlI55R/T5f2v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqpsrVmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIsVzMHY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFX9681816086
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=djvrU1dTdSj
	oBvgK1qQQP8eniHhzDVX38fpjF7rgZKQ=; b=JqpsrVmxmjocGbEH8tQUTBViHsS
	aBylPapbI78rQXq77hvIC7Ymk/XLje3R7rOCPf8ZY0mIgzTPd1vxW+3EY6GI3JMa
	K0HTqAnwiqQBjH5pAKSyHF1TZTIiunk3dWuSOeAQa8+Qv4/7dNNd0j9FII3akH2m
	EYCMy62HERFBWXFSqwdjQMTHHP0v0/qh/YQ57pWdeZ+3fnIZ/D0Q+OrcTQjpHRvi
	AEmoWjcDp+QlSuqttkI09C1c3UxttCawNVvRZ5id/m4QmfrJDwEitChwUDU6do9g
	oXGElXEblb4e8TitqL7o+akllu/MUYMAj87I9uUywTt8JjQf3CZZNqKItOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm3mb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so83242765ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479694; x=1780084494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djvrU1dTdSjoBvgK1qQQP8eniHhzDVX38fpjF7rgZKQ=;
        b=aIsVzMHYRRnWHHxh4+5ZhHlgOSGYRdPvFGrp6l4I8DlFdFbJDkNUw0rJvp24kXhXJQ
         0ZwDqnBWaKVBtQBpb5syrEGevFDlM5sYkXbLsI0COoqhiLv2P2EBDvyowifDQb0jyWjW
         judiBDb8qTb3XeZ7YB84FnW9abPVX1atMKCHQskWhcIjEEozkboF6YiS+Knwtqg60YEb
         768osUc7n0/6Y5fozNr/ibQ6l8Bi2tLrknp+Ki6hwFSsJ5MXkWWLFa8bNqLKm41laIyt
         HevIH+AcLKP1B7869Ajmofh3b5FLuFO5w3C8F1SiqFjEpSndAVfJXc8c+h1J+S/lNk58
         K/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479694; x=1780084494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djvrU1dTdSjoBvgK1qQQP8eniHhzDVX38fpjF7rgZKQ=;
        b=joW0dV77Y5szigZsvNfpte3ujg1tiAI1LxyIkcm885lWPttSNhwS+rJcWgiAR+SDw+
         n4kmFUrlcxxcKP2FdjETXStzMgoZW7tn18Rnm9L4QqKzqCHjW6z8I2/F58Q1U3KiOYLb
         RHWCAxRKCp4/gK20CPwtSbQyPW2rJmSSj8Vhe9ycV6bXy/KTuW1y9YVBq8eQI3rbh2CT
         w4ZeLT+jolkhlmZlCO/HQLbaYiSC4qr1DOEZ8FWJ3P2Sd3jGb6QgJYf8ghcIq8cz95PU
         aa19bC65vMfVn91oA9CKqI60pwuWVQVMp2A4SWYSGmjomv6oHxtkiBBYD+5JV4k6D4uE
         DsFw==
X-Forwarded-Encrypted: i=1; AFNElJ8IvLoOiYXzRbkqf4WPi2HzbiDLzK5UrCRecs81UsK9KWozQAp8r8JPkPBRUUwfpDZkwSl0ghOFAXFIZXR0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbcmq3a3k6kr+wdz83jwC4sLckJgJugC0JUhX38SCoxz3Rtu5c
	EOQqfWaldoiWPL0N5EydmR/uLdIfDJ9ymC6lTM4NV4Nnj+Vb//IBltLOYbmYrdNmmjaLs950+Wq
	KL9UixCbqc8EARSpxFp+Wnlx/+iA/s/7HSSrND3mCsZjR73aPrQPi/1l3FEASwWTmlCV7
X-Gm-Gg: Acq92OF/nOXNPIRgBJK5S4BA60hvtE/begzQjjkhUOyeOn3D5qZgRlbJ/zsFpZ0lpr+
	URpDpU/B5vQWnCWdIvMIWgL/kSz77ph9QdnVhDecYn7eCzgbI6K34KERslCMNqcL8pRgLKjzTXG
	yoW9MEq6IAlLBIXKttEV7XxU3aL711e0tvbePONxjyYrbUc8LxzjsOBGfo/Nj8LtAKKmmXWkM9Q
	ihYIV90sNloxOHUO5ZTniLt0B3T9SLA5ZFFGkFAPqsIYEeW+eEVgppPu7pRPZmi1p+nLHdLHH2q
	ukJEQH3VL18TIV4qRZWMNiMixIi4+fWvqRUI8Iw5B3e9nR3fdSqjPvcyZgY9fqRh9Z1zs3mZ/w/
	akQ1hhqlWK7Pxv+sjgFZKNyR94hjLJpcOGAHxtA4QY8s1VQal
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr85251565ad.12.1779479694422;
        Fri, 22 May 2026 12:54:54 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr85251195ad.12.1779479693835;
        Fri, 22 May 2026 12:54:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 13/18] arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:04 +0530
Message-ID: <20260522195009.2961022-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: udtUBs31SREipRXAn8juVq-gPtbwfPqv
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10b48f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0qvS_bSzHNCwZkaZnqgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX5l4iHWyO7EXh
 kfm2m9iYh8qyKdp+htGa9RE7hTvaG45mQiXGNEyZhdL6971vxTan4ASzbAMHFUkbWGQMvWC42NG
 wJzZ6PIHbEER8ic4XRbvTqYmkmQlSZjzier6VsCt5cdew3kET4H+c6nQujE5mPotwLNI82qCecm
 IQXIYQLAae5cFauojuiYFMbfujITSdHNSYGc8JQuRbXR80mnsZC0fkNiruJ8vzW3aTucnRMGPIF
 Gd6UGZ/dPNhq6izoosRbOFrUrOwRPa/D4qcNl36I3Bxq9NAbKDFee9QAVEdkCsokNfc607H+The
 E3c8dBydYQ5KbCLjBNnHb4Ry2Fm5e6r5lmR9b2Dl8OEPgoPkQxTO+BIbxZCpCpm6vmlhaYd8rqD
 Pv0VXeIChiX8GaUzNahgszghOLKgWWx7V0/EkAe+oxW46gbiedCRdxfSWTz6uM2XNJIl4VFsTMN
 unZS7vS0l6pAiiEihpw==
X-Proofpoint-GUID: udtUBs31SREipRXAn8juVq-gPtbwfPqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109413-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,3d000:email,1c:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-0.987];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 769805B9C6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..dea97330da49 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -293,6 +293,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8350", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -3451,6 +3452,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0


