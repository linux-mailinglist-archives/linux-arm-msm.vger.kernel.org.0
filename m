Return-Path: <linux-arm-msm+bounces-113497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tEw0BAAoMmpmvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:52:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A078C696833
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:52:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TAHDBC4e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QmA+nW1O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113497-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113497-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A3F7301603E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C445F33A708;
	Wed, 17 Jun 2026 04:51:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFAA33F8D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671866; cv=none; b=WJXyYFiHxf9WaIeaxL0gzq3LBOGeMTKo8LAwk/os4nMK/9TqIBcsnn6iYaiT9N8AXk2l3w1qIeRvxJq7CvhA46OIVUKjIfdm/RHLa4Awx2eEc7S7JyYDqXtROQao4Z5vIiuafZ7m5u5TgtYezP3kjmraAPMdwytmDeaY/eokSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671866; c=relaxed/simple;
	bh=Ip5DPWIadhU87IAZF/NVvn9ENoIlNryscISD9i7YDLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUeXfNjcPgNVsf5KQqN+Ln11S4MO3L+JFI1T4sOhyHIoNR7sJj/w1DHElXTQWQitqCUUsEe/Sjvdlalcvl6p+aD27hOh7SVupMyX26JJpf4Cu0vgkNmKfYBW/CnwNeZHbdl2/93nSz3Qdmna4TgYeuZasSsnmCZbGerYKP5w5Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAHDBC4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmA+nW1O; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLUY3b252999
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ck4bkKMC1U3B4z8svFXa4djpj5CpyZ083Y1U4WFotHc=; b=TAHDBC4ekoxbnpvW
	oH4U2XfEWXCpm/TwwGZSvUp+Vbye6sRMuiXrhDAtCC8EVihVMyQCn/Tb0HzJNk+0
	5W/WN7oVKysK7n+lBpMQk0FMHeA3Kz7l2GQYe2gvP4bxXybQwjepSbdr1QP3ISIp
	78ccpSsZWqhmwTL/83/rhauK6zQlkTfMJCWVs43M2KNP6if4qPpxDJ8HWIgP3boL
	THCgNps9d6TWEgBQAasC6dSD4OLKnLaDVxtMVn5bBz8f4DrnhcKBtOvFIDdvnoOt
	AUNtqKN3sGz/EPlQ7NSAujmQw8tMaFOsquRJ429Nf9suAiaKRNMToim3MQzshLRS
	X0tUxw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet1avf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8425a9979e1so3531109b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671858; x=1782276658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ck4bkKMC1U3B4z8svFXa4djpj5CpyZ083Y1U4WFotHc=;
        b=QmA+nW1O36UzQuexKMEhPn5fj2gc0QbQtZ3zoZsm+2WRAz8ZLhZTOa4az+e46QBXJb
         SP9+ivXcS4BrJzm0BgAPa2ocGeIbrB+4m7LYKBhwX8iEm7raO4Z8RmIL+Fr2hGH51J2I
         HISMlGWQiYciDEKs/ZggAwWLuoALEV2x8J8hf+wOqS5hftIm77x62OjucVqvAnyMajI9
         8ViL8a/E+ffV0XGh+sL2SFlLAQhU9gkndNYr9aroKgz5hsmJHYZ7P9TQq9H0O5eryNKy
         kcNWkBj83Uvwm7nySP6h3loxkopI0XOSM2MQz9DuLFywjENYtUUqLBMXArgvqbBWy0++
         RHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671858; x=1782276658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ck4bkKMC1U3B4z8svFXa4djpj5CpyZ083Y1U4WFotHc=;
        b=Lne5p9vFU7ZiPbjjaF6oFCJ4MqrnAoPq2EnYAqohAxOaMY7ZAuGVBxDLhpcWE5Vu0P
         Fc1pAJSTyzQ39A5D3NbWMM6AMdWEtuggI68MlDjGgrqa4rlScQtZeG5swASs02PfxsXt
         OZy7GbWKJRxYtj7GIzfc2RIGMv5ui0NGybELl4QPGVrOFTZY/blut+fxvGb92UUdtPw1
         LO1TSXADz4+480ylf666/8xXGHyR+20oFP7cM/aKzVbH9Tr16T0Nh7eZYyr7zi+GOglL
         7asRpOmv9yX9RwXcixWms413k8UegMTqKOoul4gEb9cZZAIZDMtd1FgcoHlI4o3GJ0rZ
         6ngQ==
X-Forwarded-Encrypted: i=1; AFNElJ921vaEWX2S4v77zMKyj/B1JJN9nYI/btZOj7KSJrc9j30ZE6PHTT4NXvBsD2grl7Yoy5/PIOXRLU5dDuV5@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVUdANBnGYMRGy0rv2GjA60mVybnP6MGsoULOFZlU2gPs+/B/
	2aWl5yDHmtE4H3W62mw6xGno+a/Zc529za4W8DgoFv1Okr9I3yrwLjVVoZMIi4wWK9B1usnvp9x
	ajGvz244q4otsO6SMHAideIsEkCJQy5OI6YP2y7mYqrC2QZDb5ibG2fIczbkRJI1cQZHF
X-Gm-Gg: Acq92OEckMsTX51Ul5/V9h/9st0JpLTEsXxkuwQ6QMQ2D79Z61ub4vgPeifnPC+NJqc
	wQoSZkKN450EfbyFjNSl70y6XmsehuBa/lIuJapvmKPvR7iA4HlbfS93bSOlRcfpx0Icdt7F1A1
	I4TcjkAJwisaK3iTLMI+xLwrN3otIjd3+hiBrZ6Ziq2dLZm27+iuvOK4w+Ifk4ceDvB62ioHoHK
	XHXGOX2MMUhEaIJRpJgJAI5O3OpmHuwHnQRpMs4D8ILuGDLLnO73oL1pmimQYpvU5Eo0H444D5y
	tPAHiEd1LtRE9Nyjc2OY0aQUiJAGGym4kZZNzsnynuzf+opGE+eut3RtM+xyvCwcwC8ZO2ZZAk5
	Lt5nheNgVLeB5hbI2J6Rfm6wNFCcwyFzzrDZ237cMqDIn
X-Received: by 2002:a05:6a00:21ca:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8452446e715mr2212365b3a.16.1781671858100;
        Tue, 16 Jun 2026 21:50:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:21ca:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8452446e715mr2212333b3a.16.1781671857565;
        Tue, 16 Jun 2026 21:50:57 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:57 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:18 +0530
Subject: [PATCH v7 4/6] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-4-ad736dbeab57@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=2520;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=Ip5DPWIadhU87IAZF/NVvn9ENoIlNryscISD9i7YDLk=;
 b=rU6xiLazapp3L/wx+4cxaDFA+H5CLeERaT71KI9C9ew+AgoAI4If7xgEcKkvDbojuqtLwjCEc
 ys+8Ou2PQPqDBPV0/GhR7ET6pun1xRlW8T/uLfezLNTt+7CzKheZQYG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: TBMZQhGHp163XEOiDJuv89tnpyKNzaF-
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a3227b2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: TBMZQhGHp163XEOiDJuv89tnpyKNzaF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX0jqwkXQ0JY4L
 XvYEkL4olJXyMEeyR1A36hu06priL8+w4pOSxkXA99ifrw8Wcc+EihpU+4TbcEbD9WqfhMgrYpZ
 ZpZhPp4Uajs67BgVfCfEPPRLn7LLQsuHhuN2chXyn76mVLe2W2Zx0mcij/X2Cjw2XmtEiiPKwEd
 GRh5WqPYBssz+CFKyRhfVLlv+aKEF7mwuN0gRP5GrYhRZgfDgpY8pqMsZlKN8+/zFB7/WDhAgFJ
 /wm+9sjALfWJsvGaFmfvWTXDxIzs8+CC1vxW9U6e73bGBUUYOJItir2ItlMkiy8xEveiQrvarlo
 1bRQUHqpYlT9fEZCzFn+VkU01S8bQn7/pjQLkmHsw3JpKacN5PrIaTcTDjcY/d9MnmeRiq9G6fD
 lrulBmO1D9LEbupPcFGkd+AXi+ow0HP2BRViZ9Z2AlNLRa8UrPAwzReY9AVX2USrNDcgHPgkPme
 Gd+E+txMsW4PbmTAQtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX9V9IJZ5uIfxN
 3OwsbkyulM+jyER0H/QtdUnSkNi3ceHlTmajN4oMQpM0B6HiVFq7+/WIqmOPydvblLPcqzqC/n/
 02xSIhCeJkBC25SDkfrVtEym6r9ZUe8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113497-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A078C696833

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v5->v6:
Konrad:
- Updated last return value as "0".
- Added Reviewed-by

v3->v4:
- Added Acked-by tag.

v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a7672b6c2bc0..8f8b74c4e88a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1172,15 +1172,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
 	}
 
-	clk_disable_unprepare(gi2c->se.core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	return 0;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1188,28 +1187,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->se.core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 
 	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->se.core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
-	return ret;
 }
 
 static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)

-- 
2.34.1


