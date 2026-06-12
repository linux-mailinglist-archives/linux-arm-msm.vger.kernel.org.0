Return-Path: <linux-arm-msm+bounces-112920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jE0VH4vSK2r8FgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:34:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5BB678562
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GpWJqQWX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=admWCVXK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B0E53503E0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F39D37E301;
	Fri, 12 Jun 2026 09:26:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08F3AA1BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256390; cv=none; b=Y1Cn9KXY2G+utQGEsvtDaHzV+Qv/2pRk5G9vJJJHZCAFYgXVGB/E0R0ttenjD9t3HVVgIHtI0cvw/ua33Lneb7o0ULhWdJudSICGHWWGpvHxAZ6k4eBSH4D2T0tvXER6WUUqAhdEPuvkq9nxRqTnfy3aBbx94gVtjucsKSEQhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256390; c=relaxed/simple;
	bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hu1ZLjJxBYo12GoGBSKC9z0W8LGyo6ArXmMhSlXDeAb61geaLfzokbrf1jRTyLLuzEPFeOvd2EH2LK6+aT8xtf8iM6Eii5Ll5JavBu2TQDOM3Pgz+SlRtm5HY/9FNyV85GFFXCwQP8a/9Up6u1yw9QHR1ixH4C+lUlLMsZofjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpWJqQWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=admWCVXK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39ZbN940563
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=; b=GpWJqQWXfweDwNmj
	6xqtwlX9roDmCLyyowmW242yENQ/um8sW0UEfooqoTFZdcpLnPZszyJjh/7ae/sd
	pQfcpTgowSTpGTJvWMdNk64VJhZU3K5gICyfdculiAHN/a4qrf+9O9M/1scIjFyn
	v9pRU+6BgOvmpHDCNvtbakyXVmO6MyLwJ3nlaPxtvsRdgpIzIuD2cPMQe9Y2E2Xo
	jsHugN1yRivPXZFa6yExAR9v57zNWoL39JOss8YpEKHR+3RYHWy+65Vx429dd+la
	Nc2lrDRjp4ZA6F+GEXZapVKM1wYlAn2onFfLm6mEZjI752G1HT1xFFtCPqO65aaC
	nNmJ9w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014kb8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-964172af027so678663241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256387; x=1781861187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=admWCVXK2GOOVy33SMGg1rOi8wI6YHLxt6OIbsBuSOjZG+X0EEdQlYgEvi+mkKvSoH
         +eXScHqIkjnvvMScKQaVwx6y/dHg0qXsVX90FH85LN84IcaIBJtCZa0TZ86NdScNdE7N
         jJTxoDVTBxMCha6sRpRlKaygpTqxazP6X6nT+ZZSRNoPauVtWKSPThah64yyoGK5Ui4d
         E0gSWK7WSPdCXrXiw87YaJSpn+keCTAgzLv4QdrqxG4gmBhg84vAOPG+j4UebsWHti91
         fnqxduOiYYBJgwt9vdRFCDIVAlMvDPcgvkNnx3e1G+8KX14Q9r6NIoQ6J5CKIFLZ4BX8
         GSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256387; x=1781861187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=OUU6T5QKftsy23pT8RhHOMbyoXJckNWbxKlJ8sX3bTxoaTaN2wvEMY2s+DEkTUCWsw
         7yZw/9jnjFZVNF0A4AOWckmEdM+p2LZZQ0B2rIOhkhfUuRKrXlLVP+AnQHVsajgAMG7n
         cgQfcUGqNuCjdGl4sv+eJVlw6JDeFaQxuGrU2ZK6f/oinKRT2EtpvC8WtruMFcgNkBGx
         4zC9j96oWnAcW2XvW8urmyrIBVbyZjRwAOdmA04GAXD96nyMDUXXQtaNfaHEUAHYErM6
         BKElKTUoxAsfWjhDMmKGMHtWatlevaIsvHw/aLFmiBOyZXIbdeUeYlW2kTYIFsmbolUn
         EIjA==
X-Forwarded-Encrypted: i=1; AFNElJ8sLKDhnP6f+6cwGI3Qtb9mh+I5h9haGV+Sb2rSUtrGE8m3cwYdMJNhByic48WlxmS3PfgIDiJpxYMCr6kg@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLlPwjPfMfuFjJHu34YUZRJrUckjFKu73UwM6+rPyakVkVDyl
	akrGQHDGtv+E+K5YYdlpDArtJJh3MuUtgws728g7CgYLxOZj3uIggXlInhvvpJiNE1EdjMja1T6
	11rGXWAAC5RyB4eX+5k5LReZoiDSrrsnPnzgmBSgiErx6Gxiq7fIY4p6r4rit7a2buP/S
X-Gm-Gg: Acq92OE7FJCPH5xIENuzBZmRCyOURWa4lH/5Yk2fZXD0xsiCmqVkqGnjmH+ZbgDMJHN
	wZei9+WGUdnveKrCcN8E6dj/xJJNLYujEDT7JFEJz2F+LNW/YI36U1RHYHYh8FENkoQsQbisSRV
	u2BJCD+zVHreckZvDE2Ywy7nv6Du0UwludRJY5j8770hvUztWWtBzVfSyUaxNVVq5Gc2+dFhyEF
	Ja7F5mSAC67RTyIfC8z0m6/K4bstu3ePi1rSRUg6H5iq3slXd9oH2uoMGoytoefhcTwCAYX4nvE
	sHNkLEpwxEVd4SxZBcIXJVGydv2toL0hKeVlt2y/xuxZjyePt1pDPEzwCLUz+CQ809Lq8MlIC8X
	YhIWGFoXfrJnnjTkP7QghgkWliobFiCe+vLDXKcX5+Xl7g/ICljPmx5uRcP3kCaLzDanXY7ziQe
	2aAgT3gGsrczvAdQck5vIuVOWYO/OZbM7O1Zg=
X-Received: by 2002:a05:6102:5e8b:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-71e88c3d34cmr796752137.14.1781256386605;
        Fri, 12 Jun 2026 02:26:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8b:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-71e88c3d34cmr796737137.14.1781256386209;
        Fri, 12 Jun 2026 02:26:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:48 +0300
Subject: [PATCH v4 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-16-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRDFsqLGDWYoOyOaCpvBHq/7rzgZWJ/wHIO
 WZ50XFUH+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1VpRB/96OpmATW+x0xCVpCVxqXtI4/D7EodX72lSX7Tlb2+zEjDX/V7TNre3/9TSkWmegtuL9Mp
 m/4HCTfCQ+btfddAnZDgBztbUhjIarIQzWH6wHnC5FsUHNCPeoUEP1Qdsoup6YMeYgVuZH8q33c
 8jiqc66tOSghzn+S7jXRMSVFwqJW5v1E30FSzZyI6MH4GK8gQhZoypj/gn9wRW3MenPl58UX+w3
 F31p8sHvLEvhh8376Fxd0z/Q2WFPwrdnGWsgKnACt6RrKuMH6bAJ+ZALiiuq0hJukNKZsYyz0lH
 1MbHGMLuKu6uq1Y5f35BUQ03pE5kk0ndlIrZpIKJ/asjsLUu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bRVmBPaGSFBd9I-SZDZyVsqhVwoXMApk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX0ajmpmEIrcV3
 M8bC64yHzZXN8MWP1cpdjP9sNnAz74GcRQBjv2M9lOcN4AiAqYlEmTKMfD5Jlmv2kLtS9M7TQFA
 u193PCxNDTHbbTdtr3TwKEGiTCIIARI=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2bd0c3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX4u3GUAwGKSEI
 svOjHF+3iz534fBqvZGzsegEfimYuLegSnB3LBaL2JlKc8OzNjHIUdRzZPx27Wp52U2ZSbbYX9X
 Dx4/W04Oi0fXp1uiRN8kiDtzZmDOvK/oengKq9Z6NI/Aqj1anjDTDmDXeKwAb4QJRj3McOrQ9w0
 MdJOITeUK6+5Hx/Ve1gKzqwLqHXh0SASK73gxqedF0x0kCgYmBea8qcM73mw5iEqLAb6gpYDoEE
 u7AEcTJt0yVDWntxqDpo06WDCCu1UihZSs8ESJweXaPtoxOyGhZIek6o9fYJKtD2nsPVVthH0Gh
 s6bHl0V+C+olA6cIb1kvcLPmml/m8ugGFjD8UEJCyTLx+0pgWdcctWVcp9g+uWAI80Jvv7tfb5l
 5gvoH9J2sMxJkxGcUwlCTfhF4/ualCgnunrQHsR3+1q33NIgKRi9uYQdWOUG0RAWue3wIulmYBX
 uhV2BsBOpQC5DjE1/ZQ==
X-Proofpoint-ORIG-GUID: bRVmBPaGSFBd9I-SZDZyVsqhVwoXMApk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112920-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF5BB678562

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index f57af31dbd9f..a8819470f703 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


