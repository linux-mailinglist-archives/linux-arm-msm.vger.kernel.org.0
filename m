Return-Path: <linux-arm-msm+bounces-117215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d7vIBK/FTGr5pQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:23:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C0719B59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:23:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Fv/MpW3S";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dSIl4CvV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE60317BFAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395DF38F935;
	Tue,  7 Jul 2026 09:09:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B6B390205
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:09:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415392; cv=none; b=nTB9qNbXUiJeyWH3RkYtdOUUQ8I7fQv1C/t05iV3PQPKYm8HiIfvD7NeYnC2NtAtTekX1lk0oywBvw0Uqq5iewiTbMUw4h1Vkj4+8kMPIJR8dV8ctx1x0o+koX+rrdwHkrZT8QnVjYbwPk/ilDWlBSkfrzB04PY15K8S3s/rOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415392; c=relaxed/simple;
	bh=EN+FdeBGpyAvvN3mrzi/TzCpXDx8W4gkJX8PCHt0KsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwOyOGU1B7+s/bHqA0jTfr5P+bn2ivKhKa3Tq/1f4LEb53KN7iiraKWKkCgPUIVNphbIO/Vby1w3dr3XJGPfkkv+HeIXvBG8TTv2se+bRIoZ3ja5mMEfG4Dc07l0bjfIRhSH9xz9+6cAueX6wQDGZQF8RdMWlN0fncXjIhq+Uk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv/MpW3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSIl4CvV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E5u73004599
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=; b=Fv/MpW3ShNcWG/oO
	mgrRmyfym790lG3WVAvAeImva8/AZpaseOS9gsFBTHkayHfBzneppUmmmr1ljt4N
	qWxYwsVopA5S6qlIwvV8qlh1Ve1Rm+yaClfdyPsGGv9WXe6c8hwLcnInoRCr2jVK
	CDLjYbxkNNUSKQ3SCMAZsVIEzaXbcrpYBP7cXf8C0h3tG2GLF8NhdElAR89kdT6R
	jXK7Rs98h3baQDvqO0xNPS6WaErks8+kfVp7O2hsKvEkksSVAybBuSwFKP89zCzz
	qNf01t3pFrw1W9sgIx/NWQUPAbTnLXwwpdsiryZrA8/yM6ME60s+bkPAlTuusqfl
	DLOw/g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su71560-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:09:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482df30da4so968980b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415389; x=1784020189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=;
        b=dSIl4CvVxm/cF/Zsg6S7AT5Ej5a+9Xazmx9RyKfZjmhQrYLTsMvQInpQeWPpArlWrt
         6lriR1Iu6KRERW4a0MGgc7R/KpIyCmU0QKJE30bj6ag7smcQFx9mYRyB5NnEeLsCKkXE
         XiWj/RIYKzdXbOEFkBharHjMcknBettGvtv/Eh4k0CZoMFWUVZZsdZ5WVGVMF15i2kfP
         aP+EZuxaMF4GB8XivoFpGTidC93QgwzoQH836HQ6x6jqff1pofhfX3YzRuXJYUfwf3pk
         GjyO/zMr0RPIeEkAQT+3ddC7GdGm4K9BNoYu3v6PLgAbt3IU9VZKgBjeuaNew2zGDE6i
         /0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415389; x=1784020189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=;
        b=ONjOB/AIrsZEl8Ur1dhJU518lwqoQOBBx4NdSKKc8OpM29SE0lOF93nf19Z5UxAlAj
         0GbsriNhrLHkygSTn7oBxn93hxjpCfi63QG+NyVQAKIWnQXf790s9At1ATkfIcZWnggZ
         eLpCOM9FRwsXJtj4I3Iq29Mt6U/mUDy/iaz745+352mYf4j7f6aYoOXg/2Q4X43E22LD
         233URohoI+WOLFRDG3CsQ+BXf9jxhrF+zHos4E46KJ0jz0XBOej3GDhopWsIMPOhr6A1
         YPeydxGBlo3LEZKXNkeR4rIQrrOmCVau6HdMcseJNLr21geuoWw+dLcASQGWS3NZFuEN
         du/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrmtb3iAPDttV2xcW18/kDUerC0FDI/uXr0O9QvdaAcratgkQ2yDg78/Fa2CnQK0iO9w8zGXE6K/C8csMRs@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8eeyBM91yyfWw6id5ZhNhetiWIdVtlWJWgiFqZBuOb8s6Nuh
	HwZiCrHy+p5/A9mrPg7Ft4QpaGFjpXLPOGksWcapYoiOJG4GqJFSH1c/swVY8MCGk5EC+Hrmn70
	h3rFJrN/jqJnTx7nI58zp6bvcvQM/hvRVn/yBfEESUsUY/1Ywpk9THVSdicSjoULsKb7p
X-Gm-Gg: AfdE7cnNxvnblAtsQrGZJVJOqtdMjFhvuwnzNB1utxD7fPOo/N3BFp7Mepvr0/NpRbN
	ycwXG+hVj+zK7bYoqeQuwSsxMpzpywKRqKLGz9J+8vuBBOxTh14F8m+wdffI5FDroXOJ8oQtoLh
	R9b46xBZGOWqirRSVsZKgQwgtf8hdQ1KdJPy1Ax1L4tLtbEVvy8gfaPIFUj2qKB4zlBnnPcz+hl
	1Nng6ottjduzP0omjxXul7tbkBYoOthV4L5JNCeKRAH49fr2UeHm9N2ilujPKcJFFlDn/yK7ru0
	FXIjW3FkSxrXbjY6Equo8V6dih13MoS5im5vXrg1AR234lo5CSmu7Z8fWi8R6DdmQLE7MZnc5kH
	kwKkhulbkVvE5XMiV8TKdwvSb5OMmc46SDJXpGF8dHMbA9IwchioeWFyxzBOjYdySsJ53CN/A2w
	==
X-Received: by 2002:a05:6a00:27ac:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84826cdbb70mr4249791b3a.38.1783415389457;
        Tue, 07 Jul 2026 02:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:27ac:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84826cdbb70mr4249763b3a.38.1783415388859;
        Tue, 07 Jul 2026 02:09:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:50 +0800
Subject: [PATCH v5 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-2-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=4982;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=EN+FdeBGpyAvvN3mrzi/TzCpXDx8W4gkJX8PCHt0KsM=;
 b=dRccxZSbmUk4pEE5sN+9ZaHTb1sq8axFFGR8dU7llgq6JFKBk/UJJhF0Neya5XB/HgSD6VuOp
 mQYF+9vCnGrDeq/geHhwazBmPeCNJsH8gFsVxuT5XQP3T+v0qDt8vOM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX3EGTWP9OfbsZ
 xhB+W4TIwY4QkmRzSWoSu4lRO/TLaYLQCapYSZ2f9wBTd/0Pu6DZnIZ0h7HG7loN8oDVhFcL5WV
 0cZh2RSubmvz186uUNhLGDJ7i8ezAVYY0+G6E6SXNd0jt9oXhUSLOc1L+q0ttYpxTN+Lt3qTq6B
 CE2HMo680wKuCRLBCK5eXxLUccETfDEss2nKfQuar4sln2Vb7LhByfTrMKDfbWZBt6MJiN3A2av
 dV1K4cht82SFSZHOEs5dPxA8iJM3I0Y3Jg2BLyJdBlxMgV7MX5q1RFXRQ3VI/OnRGZVyRepubSW
 a1RCOpf8tniqlShFvNCP777twU7rZQqG1XXfCS2hNblkssphJ/Gdz8Nickw+MZfDiuSBIwj0ZrI
 phTR8kXp6D2TN5i4XAUul1sdortxQJFmRX2DPRHnEMYp+oK+Uz+nuQKTPEgtCRF/2p8PqrxZi5S
 jjpodsc5fTPhUPxKt+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX9VHjnWntueqd
 IBeILd3nkaZhdbSdSNPUs5iWGml54KgFIp6o24qzoW8UE6EHVlWOR7jfU6Nzuot1QPwrCkrizJV
 fTRL2FPP4E2xXd8s3B1CcFq6Md5dlnQ=
X-Proofpoint-GUID: WaI0hBttf2WTgk7t-TlqTiRxoCxYzcgx
X-Proofpoint-ORIG-GUID: WaI0hBttf2WTgk7t-TlqTiRxoCxYzcgx
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cc25e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SM-CJC9rQbeaPTssbJMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 819C0719B59

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. Binding on the AMBA
bus requires the peripheral to expose valid CoreSight peripheral and
component ID registers, which the AMBA bus reads to match and probe the
device. The Aggregator TNOC does not implement these ID registers, so
AMBA probing fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device
is matched by its compatible string and no peripheral-ID probing is
performed. Add "qcom,coresight-tnoc" to the platform driver's match
table, and rename the platform driver and its callbacks from the
"itnoc"-specific names to generic "tnoc" names, since the driver now
serves both the Interconnect and Aggregator TNOC. Update the platform
driver name to "coresight-tnoc" accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled
ATID allocation for every platform-bus device. With the Aggregator TNOC
now on the platform bus, that check would wrongly disable its ATID, even
though the Aggregator TNOC owns the ATID that tags the whole aggregation
path. The Interconnect TNOC aggregates trace within its subsystem but
carries no ATID of its own, because the downstream Aggregator TNOC
already owns the ATID for the path. So base the check on the
"qcom,coresight-itnoc" compatible and let every other form allocate a
trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..737cc802aefe 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


