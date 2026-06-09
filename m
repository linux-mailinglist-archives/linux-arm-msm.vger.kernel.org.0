Return-Path: <linux-arm-msm+bounces-112122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Phz7LknqJ2pH4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:26:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43465EDC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:26:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OeRapUd9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NPuRCQsG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112122-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112122-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64937305D843
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9783F23B6;
	Tue,  9 Jun 2026 10:23:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E83F164F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000598; cv=none; b=TGSFlWZgmrPqwnW21Q6FKTgo8HO8RSKIOdPDsGiE4VmbjZJzlo9uEnRm/Ksf2necruNAIr8N9Nza0P787z99AhqnMjXL+RJQquOmfLV0VCq4OqKJbJ/F7UaGO0Yd4SYhOm3UxImoIbSa/c/aVqFBKq5iviwE2CJDrPDtAAwWaGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000598; c=relaxed/simple;
	bh=+m+mpXWx0qfpLvIco65ulPyu0TncN6QNo9fHPseAIRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDuZ0/GoC+cb4Nhtg02QxvVoztXzyXhbVtyQ2n7ZAkL2NageE+BzlfoyZ65hlHTagl69fL1PPN2t9AoiTr4IhOkMyKyN9FlXqi2vdN5hMysT9loQVvqBTt0R/ZzTBXpSz8ecqsrMVW20vko9WDGEV7mjuw2Eb4KgGesbAHi4oXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeRapUd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPuRCQsG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xX3e2320339
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dhkZeVLQqF+
	ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=OeRapUd9EzSWMLpzlpNY5I36rc4
	aZbI65x6bZGyAyQqODhG4McT2gUUUP5CnNbEY7ylj3Mrftm1kJ8eP8OP/7Dw8eCc
	Qx032MGBwDMFS+bueFpLaz6utnJtuwzaJ/ZvFeGiJaVt2fd29dxBZ5pMIBkdA98i
	fNVUWJQIUc3n/tgWOeb+CBkXkJbezUyy09O2tM2wFAMr2tLibjj94vIh5U4p9rto
	eUEXLn/cPbps1s10YY+/tjKfEtjoKzBoui/iI+nadZQGY26ssBQ5PuWirVwmRO5o
	+X3pDIm88yz/Ob5+mbs8vDHwHIoH4+HT39GkYhdf4adjhkoD/vh4QheKUnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearq20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e112dfso75208355ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000595; x=1781605395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=NPuRCQsG5FtPL4lMGAsOpcehwn/bJsl2+48pUeBufMuT8JY+YdBqmLBWnrvzn/8+p4
         itNmIwKAhi2RTpAjth4bw9v/bUslwK+CiL58jpPyrslLodjnAvPBdM7vGa87JbSsR7ii
         XMYfYJ4KZJrYTvUhQDN4/HQsjh8hexeajGgNJ9MZIeW4NvwySPvWfQvcjvlLk/qKpIvx
         vFrXuSLL9ewxctXw4ggu/SfnrcE8Rmf0vx4x97EL9RJ9o/hlE4X2CqvAmx78c3v29GiK
         m9suj7FArE8ykTkn9CqkTatc29E1A/FioW4xU2dBVwUI2zCZQNjiMePpmuGJH0tcQ3mD
         F+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000595; x=1781605395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=jitih8pP/V8DMc2jWMB7BIYzvLiZ9Ya6rnLWRJiMoCiQ7kvJZRgqh5Sxbq7/2MQokp
         cc21/LwMVGDje4T1Run8pyNOeo0ojg1ATzhxjPqDwTwPz3QbwS7mx41V4x7au6S6htsS
         GxBVnI+bwh9rs8fnEVanqPVaKDHM9ukvENxhCJ7/EBA5fZ9TKh9pQp7xLD/pNmlG5RTy
         hAxd0PjBqSAdVCPuPabZJkFZh1TH96ryfs2S8JWqhqBF6/qkKeqn9YF5zOLUZxilOOas
         nNZDg0ps7hbpHWD93/iAZeTHikkeBxpDcNu78Je4YNyEFXsRrRHeQfRwC1YBggy1CfbF
         bv3Q==
X-Gm-Message-State: AOJu0YyxMAGXQ+MPe7+ICMcJ15WRqVMBVa+KuczDY/hJ23Mnj/Hqn0Jj
	pgpTmouoBx6vCARxy4tr/gvFzjJfvzGRq+bUVJElm9hC2mdoLmGtnMzM1tmNdMCsjpF/S6OCIiq
	T21IZVzcxnkvR13XxiEiGdMTvzJ1y+c46FW4FC/XJ4v3VLmlQLIJM96EtGB+nkP0EwGlUHpPlFJ
	OA
X-Gm-Gg: Acq92OGMNZL4ckyyOsadLrwAMTZtmWnLS6ekb+fNqCtNTGvcpBdx3R5XHffuy/Nsq0p
	kjvIpw/QIX4vRsUd1vex3Y62UnrT8bP8sFOCUCOaDZgg7lpO3pVP0fVAXWKf2ikPsO7N3wls7+i
	sNtYhbgCH7zWCWaTN5G4LozqLXq0SDqatNKrVlOvxMVHWAmxY86CE6L8nTXuxNmJLo/qJqGm5Uu
	ON1GRJep25tGx/1C0IvdjtpbaZ6kpnFDGUIV3YmuwU4cUNZweIIEWhpR/xAa1sBVFgeXs3pjr2m
	fVwbt9mChYEOVXSDIhLniVMnuv+B9qCs2XitDqWwbE++c2IIo5OMUV/2EDTyjbLJjnBS+lnKJjt
	2ksxOldHXptPCskno76j4c5xmPl1lVqg1wM1reWzpF43QatPJyLhc8I4bRwc=
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911605ad.27.1781000594838;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911375ad.27.1781000594271;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown
Date: Tue,  9 Jun 2026 15:52:53 +0530
Message-ID: <20260609102254.2671238-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0bXR25kl2UwqgKHUzVWjtHtjDnGbDmam
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27e993 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=i5RmczF_S8wiUxY00XQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfXz53WJVqkC653
 1trJLSrEZxVjfFMdL8ls8tLwl/t/9OvhXT9TUjmpyr7GkxMAqB4mCgHKJ6b8UgtB1/rF9l0wiaB
 a4a3nqmgTAwu0Y3pBv/DNDDqgflNrPIezzhWsZbjk/TZBQO9zYrXBvbwxT/kdGBoFFmApfHQs2X
 UaExnVKfHL+uZmZ7XZqXV4vJkPYBAw3Mk7s007eMehwVhTcaVCDZ393YWHzpgXTfSxK6pXYZi57
 1i3EJiTFXM2XvqVMpTNjTcfq2TwB+e3c9pe0Xyi8apQqNPQa2vvtS7Iz0TNd8bzl8DaR2TSOoeR
 jesP/FoTpkW5aEhG8cb+EZlSP896xejPH4+5BisJfcRILwEgYcr+RuLP0Jl4PM95UWTvA1ivm2b
 IL0j5/LQSI3BeA8tzfw/AqA8+LAT2j9+pBThXdwZQ/xCB7/aECPJMKv+DPllyAr9/Rodd3GpPdm
 2C+QyJTZiGxw5ilylJg==
X-Proofpoint-GUID: 0bXR25kl2UwqgKHUzVWjtHtjDnGbDmam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:mukesh.ojha@oss.qualcomm.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112122-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F43465EDC6

When a DSP hangs, if a graceful shutdown is attempted during sysmon stop,
it times out but sysmon_stop() still returns 0. The stop subdevice loop
then continues and tears down the glink and ssr subdevices, which
unregisters and unmaps the memory regions attached to rpmsg device. If the
remote still has DMA in flight against those regions, the result is an
SMMU fault.

Fix sysmon_stop() to return -ETIMEDOUT when a shutdown mechanism was
tried but the remote did not acknowledge it.  With the abort-on-first-
failure behaviour already in rproc_stop_subdevices(), this prevents
glink and ssr from running their stop callbacks against an unresponsive
remote.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 44b905a7e129..a29084cf7145 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -559,6 +559,11 @@ static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+	else
+		return 0;
+
+	if (!sysmon->shutdown_acked)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.53.0


