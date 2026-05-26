Return-Path: <linux-arm-msm+bounces-109813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLpmOjiZFWrVWgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:59:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FF5D5EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1757630557CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E649C2494F0;
	Tue, 26 May 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGast7wV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEGb63ZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D32309B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800110; cv=none; b=deMxV3Wu+x4xt6TW4mIQkoPR8z5BiKM3I5TMB8hvdMKDFwKT3pazLieg8lUUZV8ZnQdjx9GGiHFF29VrcWsY1jwdV6pcrxm+bNkwt2dtcdIsm5ifY62yYlwtEJ8lcLDmrKnhB1wfDT6djHZeKdsbshLsYrB0LwZ/P8FdfMhWldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800110; c=relaxed/simple;
	bh=SBo8GaUsBUS3ajwUmdyP4g2M8m2Uhtq9FfllT2EErhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLon5RNdzDOkZZizuydjy/6UVz4sjPQCN2ORMG9bzxvOEac/pQkQXAcl459Tw8bmXk15WwrphBJI1nA+YjpVJ1RNwWYQJISvzv3LZBtfd0rXOVGusk5aTpb5dlfXpGp3r+vtq4Q99ZCZxvY0v3W3uWWWyhsYtEPTRyoSpMloeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGast7wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEGb63ZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVkC2385447
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=; b=oGast7wVAdofn/2p
	CMLkS+djPUe6o/y+oz2exELY8dgGXqfBzqezAfcTi5SmgMloAsQ3myby9WEusups
	XuX7u+4cBAEKifIR5DOZRQrdKptVNU5//YNi4mRA186Gw9WYgqMtAQhwfpkkIWdr
	RY1i/zdydcvPnF2wxbfYx3qNgnwRg0VrizdwTbKZHONo2TqyB+SMxY6Setq4b46n
	QI9Xs8TlhRefVU9tr+7sflhp+fuRPKC7W4JAlKvtSHyMKWYKuT6J6Akwg/Dwy/gN
	JkM4t6QUIVKvHtlz7bhCsM1/hqacvbxxd4PjCSFFsoyW0Guz9AfhFmQzMqPVnMN6
	oTacTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs4pxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso1304575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800107; x=1780404907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=;
        b=OEGb63ZAv3/RdF5OfZVvLfe+APSC2Ky6LVHUBxDXrqDRKtDomYQ7DJT7e7Zz4k115w
         qOXJPoA83s48DAO0EoA4m3XXbMBUgaxwEXu2hFYs7YpQC1c/SYvRhtfV2KduqVzzEZO0
         Z60qmePuCo3yGk08gTBlN72mnOMO9n8mD6Y4OZQgnM1VRTVkHZXFTarQFRmYBIZqSngf
         AiaBQqh4HZ89uIuw/LzNpH+xe7KE1rEMlgFXCF/wUjKoVHi2cX9QA8vzbcObI6QnGMOg
         684Wqh1SJLAF9JEBKtcUJF1JyeSpfx243ztOvyw48nnk6hZ+0GZuFapj/76pRgN7/Uql
         nY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800107; x=1780404907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=;
        b=lz/ZD5eFO4KCWjkR9QszrFV6JggdrYaiV58KmhvjYQ5dz+5GJTYN177lxT6V54nwqq
         4I/nMgjwPxQ2O9NZxEkSDsH0L4q1ofJIYhkmZpiAG6U2GgnPxVSxpuC7S5kW+g2lY+Tt
         ZlrYrUnvx+w/+JnQMgYoow2Wm8PJtjj37aaZU+irp/+bB1V8Ku2hS8WJoN341g7tdPN2
         YIvWGYcBsFMTnu3l7gkkZTES8g/FMv3xBkBMYUOdfrWYiZI0oQfAFQ6yjtavVh0iy68d
         W7b58K76KYwaM8OIniP9HlfJra1qjDFytOjvApj2mHV1E2E33QiAceuMB7z7wySUqup0
         RGpw==
X-Forwarded-Encrypted: i=1; AFNElJ9typT42qc/D4QucvrCEsEr3aWL8GODVFH7e0Xusk5UVFH2Xs6jz5CyBU2xIHToATamGrmLQKSUMQFf9Hn6@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkd5xPlmoMQMvQsfD4s71k9LFtCEaHFahw3Y2+2pni2m7/Oae
	encRFPnF+qF4bn73o71gpxFBZVUIuJu5iKxuVxOMLSH6nuNSKrAdenbhyDnbuM52EPbbSgdi+Jx
	dJLSwqpCGBpds37hcSdoxmdqLQCTzXsd1yzH9rfB3cPO/vjrM03Cn3Asr796rG3TxC/nQ
X-Gm-Gg: Acq92OEBz55kw5qWbxVYiOHxho15MW7zlAgUPkjkq4kwUpbamoMLD8qnlmNE35w7uTJ
	ODaVgyT2sRhWxm0U8p5HVD/9ee45Nzv3loAo2WHgRDMRJFgrmMZNWa6+sKb1yEyFLqYfywGtZQU
	EekKtSZXBI8ediYdzqJxRqMS9W5eNF+FzRFI2c9Om/vvBTzZtDQ6LcVgpUai34z4yq8ynjW9C86
	G3kT+nPo3G2GmnWV9crwiyW0H0uYzOJxbnvDZUcyLbKAmXUlT05u6/pRybTMnwin+tlIUgakRWO
	nLZNJerRz3ZNO6FwTUfXhDCkNXwUvrx4Wl/8LxdBvkcs8yS+U64XwZqijcoC02X3+Dqzvu7bDjP
	BTjryQh07xf/f6NtS53/37/NrYKoSCVJ3OrK0Qm99Qd2mrEIJkIY3
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2beb065f97fmr207160565ad.36.1779800107063;
        Tue, 26 May 2026 05:55:07 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2beb065f97fmr207160105ad.36.1779800106591;
        Tue, 26 May 2026 05:55:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:06 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:24:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a15982c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8KYR8grS2LNeUGeHJPkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ubfQ59EwfcIsSe9jYtdKzaUI88bMYSZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX5WwUrQ3LXp92
 gmt64SUeQn3rZ7CfIYGyvk0tka0Y7nr+jIsYB5FUejBHo8n6g992Z9Iuz86JRC7v8rcCtCGWic/
 dX8Yey953j9YZAFd7ndqVpuJ+hB6QaZZXah1rJm0H/W+1qOkk8pVtPYaB0sw9mUpHLMuN8qfrkk
 jHVYKlK8gOyXwRVqsUFXTRsCH0kfhU713fb3QU6/LhVzxl4lluGcDdB9uXVGOLHMe2DrBQA+yoX
 ZwYk152eApTufRFOXAu9rzfym00BytdanMuSKuoBsUc74ZRRTocanXZg0pptGvCp0ezsoIfO7Ku
 i0CRC9Y50hUW6QnJwdL82TocDLqBmHrQAHAZLDXzmuxabn8AQormmQwk9fabUSyyXrD+Sf8zeDN
 hpPUOgbCP1/hITLG6t59McniLOLfuJhqS3GKirbmd1/pOKMZuLk/wcA8N4nFrri3F9h5dZdqQeU
 zB0j3nvJ0nmGqUaCkEw==
X-Proofpoint-ORIG-GUID: ubfQ59EwfcIsSe9jYtdKzaUI88bMYSZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109813-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 552FF5D5EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index dc55e5652caae247359f869a998f81a785a82e0f..d3abaf541a33beaca4d5a2a8a0930f2a45ef8524 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -258,5 +258,6 @@
 #define GCC_VCODEC0_BCR						21
 #define GCC_VENUS_BCR						22
 #define GCC_VIDEO_INTERFACE_BCR					23
+#define GCC_USB3_DP_PHY_PRIM_BCR				24
 
 #endif

-- 
2.34.1


