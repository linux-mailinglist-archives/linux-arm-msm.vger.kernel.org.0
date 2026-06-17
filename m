Return-Path: <linux-arm-msm+bounces-113495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tG7bDcMnMmpSvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE05696817
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RMhuABL7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T4Fi9RU6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113495-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113495-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3A6E30187BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECCF33D503;
	Wed, 17 Jun 2026 04:50:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370733A9E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671853; cv=none; b=e7bULI5X/IpBfiPSsvoQtMnluxISuca9Y614b4pR8ncg2DGc2UXO12oKkHxbgWIsIobpIkKj3RegokXwkMl3mbzUXjyIACUA1XeKDEmoo47kTotJ+TnVYJeskkNqLl0F/jpC8rHBbO4aFDr+ODkL7o5agztB8A65dsJ0QTmcFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671853; c=relaxed/simple;
	bh=3TFRixKUSBaNA/9bG5gD8oxXYKkrWW8JQJihdOw28zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GF+qMHcmJBUllEiBq7E+DMJ4OG4sTM3KINCpxfnrjUyvZiL89V+pVC9clxA2c3vphTPIY3x2oJBQUB2MuqaD6bwn5GL+stfq4RJibh8NAFdB1PgjHO/e1e7vDkaT4pTeQ8DsVpUnT4ku4xMuPO3cl2TCkX2iXGYWcIbbfQCCNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMhuABL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4Fi9RU6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLU3YP738474
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RmZNXIxlmOrsR5DVru/ETy3abT9vEaw0KBgzkoo8z8=; b=RMhuABL7bhcRwgTJ
	VCOGxgL4GvIp3RljE2b71EczD9+7C8zx3JZLBE0AVU6Jwe4bgR9ZSpW+HGDNuOeG
	q/UVwVkIozD7trFxbokXmknWGX/3/r4Ff8AdKBy+YRuIyIEqm/VzAJv3eIzJchIk
	h0kTkNr2LaUzOxkCgAMw8R3tANAmP/0aWNEyIWBl27Oi3YyiTedSnIlU0qk/Dwoj
	qDzkd0lGH5UxLnsjW/5hAL/Ha2VLZd/queyuXkE2sxtvJdwdRS2R0nFxHK/7hZJj
	78ecJJ8lqt6L6u1Sj1m4HFpjBXfjBMqqP463EhSrOavbrQ5HXbp1CwTU+n1LzT9D
	FIPJjw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesheu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6bbd0afffso11839155ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671847; x=1782276647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RmZNXIxlmOrsR5DVru/ETy3abT9vEaw0KBgzkoo8z8=;
        b=T4Fi9RU6XjgLg16m1LdjWx/H+p4a+3KxEClD570WvgxxTfwra3gkzytLuunX0B8vfC
         ScsFcP26PQzBhJELfTvi3frb6xs6le/g0YpJm13Wb+/av16XyV7rj6BIe/V+C/sJm0vY
         RjYJewjHz2RWlux3LbSB+33xEgEa5lHoFWpGypwkiYgn9mHvAjIxgwfzDU/QmbwlfLRM
         ZZfDgimn+05+8Xq7ndUTh2Ptq6d+3GF5zJUMW8O/qR3MQNel6YcxldNiJaAIakBgz89a
         5+VjZgZYeJ8rhKROAKYrZjvbE3uzgfR6nO5bglaM6MpOqVPY/zm85te4ZkO+Hze3SLhV
         nHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671847; x=1782276647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RmZNXIxlmOrsR5DVru/ETy3abT9vEaw0KBgzkoo8z8=;
        b=KxlCWm+YaWMUyL2B8dzAhvXnA266jlV1MXANUWMmVuPmZ32Ut/Ealunb5a6qe3gmZk
         GLJHhau4ooa8k3djTB/u4HaQYz8eg0FUzEOEm24AmeoDSRr0W3olDwU29e8P9guM0uUd
         lnLbUlkmRX4n+eq88irDEECibOE0cX1jpUz6xp1cxNlScGjD6A6q1NPhcdU4auHk6boT
         B+3YoBW1DaJwfHpK6E576x2TP+YWj7fVd+bUDRwf1ktJUtqVd9VDMQio1Ynun0deY6rE
         Fn6aZe8LwMnd+DlT5BFnlAgn9zdgHfPhCoqF9QjcPBYHiYO5T0F2O9R7qifn6htOrN+Y
         KwlA==
X-Forwarded-Encrypted: i=1; AFNElJ9tRqIovIFtPeajf+7uw4OMPeMrBGZmr+WCwXSMma5oHzLJNEnCfm7cV09aleUQsTEGhQkoStrlXWwrMx6K@vger.kernel.org
X-Gm-Message-State: AOJu0YzWWkeN7Djrh4pe4FOTCzsKjlVolvpDDnsp/CLTMWxZsEW7tpyb
	xHe7ePQlp685WQ1X3/7ngFVUMLEQPM6xJt748p+etOgCWrT1YFZzPIkeDjc1qA4qRH1CEFLPeaB
	TbyYRScRt/kY8MYr62S0B0E4lTPcVu9G285gJAnRP6uxM9sVdlKHB0YAHVZoV4zvt93bw
X-Gm-Gg: Acq92OEJveAAQsMcZnt4qXAiAeEH8oqni7nApXHwyp0ujaUTuKfL0CC4XT+LREbj6hP
	OPZO934aPOsKib28CVko0FKSN5GLpsIDnCdtd8ESOuTIOMQd9PyxXBsokttvDZy/LVkVDhfitnv
	lGbVwuZO60GupE0fQ9s1TGm4zGflaNVPCiAkMqpjjSHBEwls5sE9EmsqTf7f4TSMQrpvSDXXc0o
	tLXQjLpIubYOe9KoccV3ybWwowPK+/n3zM7KLoZupiGqL/4nlAWEIHWn4AV5B+vtueVvNwT1Erk
	BqPZuQBoyDDKGtQXhItQedqPVY396XW+uIvKDjsHHlFh5qJFM3K7Tpmj4irB+xlsKzTuu153OKi
	nDepof17RXES9WKDBVm8Wv50thKcxA69wRaIGdfUYdZmV
X-Received: by 2002:a05:6a21:1645:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-3b8be9aead5mr2394659637.27.1781671846805;
        Tue, 16 Jun 2026 21:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:1645:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-3b8be9aead5mr2394617637.27.1781671846225;
        Tue, 16 Jun 2026 21:50:46 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:45 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:16 +0530
Subject: [PATCH v7 2/6] i2c: qcom-geni: Isolate serial engine setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-2-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=6246;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=3TFRixKUSBaNA/9bG5gD8oxXYKkrWW8JQJihdOw28zw=;
 b=WdcR8scR/pRQgVu8lExqLTP1FQVJHozxzcMxAscmxHIsB4VjM9N9V2EGjlNdCpuCUceUfMK3o
 1LCyWtTVdLZA85UJwpw/YJ4vo7xfmzDXFdGezmbp1IPWn3TQ5+IlGFj
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX/VcC6LBKfy7n
 jZhZbq0KBG1mjm344jTxVcmrRYbCQdSy+nHSlSwhrnu15saIRC2jCFEpdnKtF7VsfHp7HCh+89j
 W/tSqn/BoWNRj+EtfmZ6mG1xE2Z03p7Fqf7ylK4Yh3dDDk5+FgMYb2rV+BUuQmB/li28XI9XBHx
 FF8nwlEiYg7BXwV1XJaMQ4T9dDAqlHNmtAF2rHWrQe6WPAjFaNerPFi/6bcRE4U79bYokbDqkcW
 3lkSk/SZ+7gRGRhgrKmksdlnJsx+sZci+DYuaEtOpBUf7WlQbi4RlIVpcqmbrESOftiCClVn7Vw
 SftXwVoXbBw+rAcSLRPes4kZfz7NvXnwfAR/8QnpGA++LQ10WB6e+AHbMMB0XGJBznE+cSlb3sv
 I2ftu64CAikQOqWGia8EfxGK2/Rav8fPsKfEjB5bqp3hrOP+TiXo6SH4oy2iKj15IaWdOlh8XH6
 8DH2F/nG1PQbv+1qjWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX7gTm5T5p1E1e
 n2buyxJcRdPARCndO13wOmdyDgxQG1Cz9yP8mFgstsHDZxHfoOQWnlhnRms10tf+2utpkH63Tq2
 OLl9M4GYDxuJdIRgI1faO9SZ4PvDxN0=
X-Proofpoint-ORIG-GUID: Wk4k11E2Dr0KLYI5VfIW28Y88w5JJiq0
X-Proofpoint-GUID: Wk4k11E2Dr0KLYI5VfIW28Y88w5JJiq0
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a3227a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AmfWAOgrV3IZIKlFI3AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113495-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDE05696817

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization like
hibernation and deep sleep features where hardware context is lost.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v6->v7:
- Added Reviewed-by tag from konrad and mukesh.

v4->v5:
- Added Reviewed-by tag.

v3->v4:
viken:
- Added Acked-by tag
- Removed extra space before invoke of geni_i2c_init().

v1->v2:
Bjorn:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 158 ++++++++++++++++++-------------------
 1 file changed, 75 insertions(+), 83 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index d2f5055b0b10..3ee0be228d7c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -990,10 +990,77 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_init(struct geni_i2c_dev *gi2c)
+{
+	const struct geni_i2c_desc *desc = NULL;
+	u32 proto, tx_depth;
+	bool fifo_disable;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
+		return ret;
+	}
+
+	proto = geni_se_read_proto(&gi2c->se);
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err;
+		}
+	} else if (proto != GENI_SE_I2C) {
+		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err;
+	}
+
+	desc = device_get_match_data(gi2c->se.dev);
+	if (desc && desc->no_dma_support) {
+		fifo_disable = false;
+		gi2c->no_dma = true;
+	} else {
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	}
+
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret)
+			goto err;
+
+		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err;
+		}
+
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
+err:
+	pm_runtime_put(gi2c->se.dev);
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 	const struct geni_i2c_desc *desc = NULL;
@@ -1073,101 +1140,26 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning on resources\n");
-		goto err_clk;
-	}
-	proto = geni_se_read_proto(&gi2c->se);
-	if (proto == GENI_SE_INVALID_PROTO) {
-		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
-		if (ret) {
-			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
-			goto err_resources;
-		}
-	} else if (proto != GENI_SE_I2C) {
-		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
-		goto err_resources;
-	}
-
-	if (desc && desc->no_dma_support) {
-		fifo_disable = false;
-		gi2c->no_dma = true;
-	} else {
-		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-	}
-
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
-		gi2c->gpi_mode = true;
-		ret = setup_gpi_dma(gi2c);
-		if (ret)
-			goto err_resources;
-
-		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
-	} else {
-		gi2c->gpi_mode = false;
-		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
-
-		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
-
-		if (!tx_depth) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "Invalid TX FIFO depth\n");
-			goto err_resources;
-		}
-
-		gi2c->tx_wm = tx_depth - 1;
-		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
-				       PACKING_BYTES_PW, true, true, true);
-
-		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-	}
-
-	clk_disable_unprepare(gi2c->core_clk);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning off resources\n");
-		goto err_dma;
-	}
-
-	ret = geni_icc_disable(&gi2c->se);
-	if (ret)
-		goto err_dma;
-
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
 	pm_runtime_enable(gi2c->se.dev);
 
+	ret = geni_i2c_init(gi2c);
+	if (ret < 0) {
+		pm_runtime_disable(gi2c->se.dev);
+		return ret;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 		pm_runtime_disable(gi2c->se.dev);
-		goto err_dma;
+		return ret;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return ret;
-
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
-err_dma:
-	release_gpi_dma(gi2c);
-
 	return ret;
 }
 

-- 
2.34.1


