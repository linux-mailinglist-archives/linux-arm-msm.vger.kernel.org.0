Return-Path: <linux-arm-msm+bounces-118449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfLCEUZEUmpZNwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:25:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529D741A69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BNJpy7j1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cKQRDnEi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118449-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118449-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28746300914C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92A8391836;
	Sat, 11 Jul 2026 13:25:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174838D6A2
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776323; cv=none; b=DOV7Uug+olocqjV+cvomdXmkgl1b7E4qntRBJVScQN/+lFdJEWFeJU3e0Zba0HMcWx+38dCC+ywEFGTtEdAnCmwrRumtyPvIf8UnO9Z1AP61IPpHqv/zjE+3m+KCAk9S8hwxPPm097mLOUr5OJcDYbsu7dI9fk5dDMY91BqzPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776323; c=relaxed/simple;
	bh=8TSs9Nfkta2iamspr9QqU/RBcCfAwBGsHHf2WNxtx7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IP7s5SxJHZRLl1kuYybsSO3QQid6ZUHWdRDPat3BI4lq/Y91bfrSQLnhEJTs9HihxnJlZJKNRivZXvw/xfUXk8a1ORutbwupHtBLu2avn8JZodeMxc/FMs3YiOogfGVobCtobG6A7WxypRj2QyJZV8D93GPq00vD8cZOlBKgOkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNJpy7j1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKQRDnEi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BBYGo93813549
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wDO4niQLIzyaovhzjRfqwU
	vDa3R9l8wji1/eeFWSTzU=; b=BNJpy7j1d6O8rzmlwcS/dMkRHXNmEjaoeiq0/g
	H6luACiPLywWfOidvBGHDgXnaiSbLxo0YhBQ3UERyK91UpZ/Y1i46ynVWGNoQICn
	LDU0cX7cTYWS55z7xXeOk4U+2PK1ztwq7DzIERa3vthcqyvvvfmT5WeWnBJO8QLJ
	LHa041hRZmZoRR+MQ/Tt1qqApQB+Tl1myGaCCPIiXadzUOeesqTlh/cGZI3IVZ4D
	O6caX4IBQmd56pjxLAUtwJ+6F9h82/Uf2ihWBQ74wXgCD/RRQYEX2S5BZLN8/cyj
	VTQqP1YZC4f6szKGxjuajTkW2fjVJ89edBrSQ5OY8Vgj9knA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf8upx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso35605551cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776321; x=1784381121; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wDO4niQLIzyaovhzjRfqwUvDa3R9l8wji1/eeFWSTzU=;
        b=cKQRDnEip14Vrmd+BMZTdvB29fmqcTG4WyE55vscL8Q541sD8IDR7m/w+vhWmSE/ut
         OxMCyic19d/VoOodaXPFAHzHsmRa8lFpXb8D3DmOyTj3yZicXxcHho+6ok/NZoyGql5N
         rsbw/tHBHXbytDMEFjMPtkv2nzpvReITHru7FOqgtqDzVtwRvHjjt56KdnPN5vO/ekLX
         RPT9+aclUkePovuPgrbXw2+FXG6ZcVW7wfPDUzzt2PG5JnBTbJgBJX/yV/D/c6s4T2Va
         9UXvr7IW7LniqdRQ9Ooh97mQZ/NEN3LEi4jLYwkza9f3b7UUKK8O2gAoc5b4PQGDXbmW
         gRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776321; x=1784381121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wDO4niQLIzyaovhzjRfqwUvDa3R9l8wji1/eeFWSTzU=;
        b=SMcsMviRbAAqKGu7oeQ1AY2jmt72H+bq2yTx4DptKtSVn8f64xNUUpKGlrnbhNz8oL
         dUyWj3lMV3+oM8oFJcMHlKtAIFVpO/uz0ORweKx9gp4KCQMg7y6QcuoJAGtK/3/xpQCb
         RQnqDOlGQjUPgkIQg0xFKwB4L1648+qMQ+pEPiMMlxOxHjqfr2R8QvB6hO8vxnMiu0Hf
         y6qWqdpC4HSsA9Dhidc1BbUyKoJGRzMzPBT/ADXNIvlum+sG6JZnNsm+kaTQ0/J6LhUd
         kZsWe90F3bBrvzIlI2clVqnpbNlM56kPEqao7hzrkOs77vnFa3JTAiOtLLHs9WVrWBl2
         Llwg==
X-Gm-Message-State: AOJu0YyhVCGyBIRY7bRmCn8XKfmBrmrarv1/JMgaRNVy4u60RXFE9MkB
	is5v/pdVrNN76z5MqbVEty2Ql/F3hd+Y0DbvuAokn4vut+/xFIABpBSPqXmJDkvXEPyFCNn0tYy
	LMjFgOTrvmePqOSkh9xAy49DPeHMM6yYM3u5aZsxtsLyPewJ6qOLQo2L6On2DF969Blhh
X-Gm-Gg: AfdE7ckB4xz8+RQN+YgEKpGH4ATMenNIRPCq6KSZjaIKpsMl6o0rLKWahT6X5KKhlj2
	Mp0fawDcPhUUV2ZR8VDKjIpWAv0aPyE+N7vxdZUhNX77bNesJbzOEkWcwk7vZGz0jgMBMD0/vsn
	NHnHYctieEWrxTAndsoECt0ujRidLDm4Sm4gfUknkAHq5hhncnXvLhfZd2eIJPRSbD7Li3MgUdW
	UKaO9A49iMFmMdXHbdzzhwsAdWE6lbjDxeqjbYuCVAQU0Tk4vNknsLzQ1C0DTqm48yR8EFCZ7+6
	QdOrZkZIDIzuacqrykBer/P7i2X/E88Znnqq1cMW2DkzLD3uUBBYcTz0EmLmLuS/JnKYomth08q
	vSv67mOdnRspQWjsSF0WRSLGI88mumnBkxyc=
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c86:bd3f with SMTP id d75a77b69052e-51cbf2b2fe5mr26441301cf.60.1783776320676;
        Sat, 11 Jul 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c86:bd3f with SMTP id d75a77b69052e-51cbf2b2fe5mr26441061cf.60.1783776320284;
        Sat, 11 Jul 2026 06:25:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] soc: qcom: Kconfig improvements
Date: Sat, 11 Jul 2026 15:25:00 +0200
Message-Id: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbUlbEFNX3MOwaEuBUaHSAaIh3
 N2CezeTvOT9NyuQC+gIrskKwS1I6IcI8pSA7fTQOoZ1ZJBcFjyXio3W94y8ZQ/rhwZbJowymaj
 VhUsNcfYKrsH3kbxVP6bZ3J2d9s5udEiTD5/j5yJ2709+EYyzQhl9zrnJGqdKT5SOs35Gs0/jg
 Wrbti8DWKFWyQAAAA==
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8TSs9Nfkta2iamspr9QqU/RBcCfAwBGsHHf2WNxtx7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQvXwITdca0se8nnUoVzfWvtUvYU2JqV28F+
 Ah+iGiqiAOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJELwAKCRDBN2bmhouD
 12LrD/9Qeu56Tax+tHcvSdDvNkCO3jvyzqnfwDgEkBpej8cfWEplQ9pRvWkATnS1ILpvHa4gqFt
 u5MTCIyW+diVrVI61AC7p4Jt2wgMg6ASH6PmDHVYDgSVgWVvX07KkqXCejXMppy2MN2kEwJUEUZ
 3n+d2pRtjOyST53j0BvjKWp3XhlWQlRJurekbjD1UqKigAoJNRBT/rXt/RxMLy6QW8J0edXiDRr
 jhSDpnaC1wfNUHPUWgc0YNuMIGP3mrqgjaGeTxbLmnHOU4xt0eSN3dMlEgNXezsJ6bCczJUOvt8
 t5iLqXylVgOOrzs2um+dBLs/CQsk7gRfQm9o0lhd+Ls9EXaEsaUCmQQ6QBQuunyb1DuaNTUDr5p
 Mi3m+BlZMfJBJSLRSkxGoU7eTNFF5ES9ZqZgfLmLoyIz/ZSx0478kI59Cih6te1RGhkuU40sl9p
 sLGIpdl+/aWGl168La+vYg02yjfdl0IiT+Y/10l9zbD0QwuD2Ff4u64oOmGb4z2mezBRFjAzWyT
 WDL4DmsJlIE4H2IZi7v3JvFDHdURQYFKlFx9N0YWI287WjjLRnZ3hTDjMwv85/kqLHDJvlmryGw
 R2YOIyDKt+rpKbBT8yE26GwyuCeYTccqxJ/MpicHaAiADp3I/DKBd01dozX5OpNkP6VUkBJTBbI
 vNOD42zU6bxXESw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: -NXjqrtZIO9_E76epHwjKtbilE2qaWOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX3rdty8hKMOjE
 7FL3CycPvquLqW7Jb+kPNOrViXlPKN3wRTkWBrxeLyRditafsibSZw6pP4sjYO8URZYYaaiOCPO
 CqsOaHmuQt07Nflxl/R5wq69+neNhXft8eJojQdkkkaPiVIEG2xQBcVgQHZCh5rjKceDxeOags9
 5v3JOEWFcXL7aK6OPZlAo9VhemW3i1CCOI3bxbIJuagRANXIM/ec1PP6jN3dDyjaL8gHcalGXaU
 Hh4v4i87iLq2OtNABPqPDQLG7rV1l1LwhyRqJozg2K7G7wKv9GZWq+e8Bdc3P+DoIlru7cIeEVJ
 7FTVorpOzv5oqHkLhlnHhb4sTD+ATDn4lxGXRzvtr4DMogTkbCZsZY2baqQxIakdeq6EQeNCr1y
 CujvvOB4Qec6q9Wqvpiw9TGHDKT1GAnNEfvPvhQjOKQMTqC/ejW29/L3QnfDiuox1SuGm8l1BFq
 ks8XY6Nj5g/qefUXLjg==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a524441 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jSXdrQWe9asa5pOIQp8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -NXjqrtZIO9_E76epHwjKtbilE2qaWOS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX8+Uwnw8kmVxc
 VuRQpxWrTcpIRBEX9j69SxO9ofRnhN2DSfyqgWdPt9ZrBC30QjgsoRb8BZ8XEHJ+avqTy5gm4lk
 QZ90SzYp6qADqBXWuZeEWhcuu4HpB/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118449-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8529D741A69

Merging
=======
Defconfig change (last commit) depends on earlier changes, thus that
patch could wait a cycle.
Alternatively, everything through Qualcomm SoC tree, but then please
keep these on a dedicated branch in case defconfig has to be shared
with soc tree to avoid conflicts.

Changes in v2:
- Implement review - changes in individual patch changelogs
- Add tags
- New patch: soc: qcom: Avoid SCM and SPM for cpuidle drivers

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      soc: qcom: Avoid SCM and SPM for cpuidle drivers
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults

 arch/arm/configs/multi_v7_defconfig |  11 ----
 arch/arm/configs/qcom_defconfig     |   7 ---
 arch/arm64/configs/defconfig        |  18 ------
 drivers/cpuidle/Kconfig.arm         |   4 +-
 drivers/soc/qcom/Kconfig            | 108 ++++++++++++++++++++++--------------
 5 files changed, 67 insertions(+), 81 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


