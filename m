Return-Path: <linux-arm-msm+bounces-115432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ftgYC3jBQ2r5ggoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:15:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB976E4B64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:15:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=laBnQzwg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jWyYIMpu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E318C30D8606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7584192EF;
	Tue, 30 Jun 2026 12:55:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C9C416D1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824121; cv=none; b=qrSTlHQfd3VtlXnzZqBduZsOPAqm54od7Gg/9KGz5EB39Jgy+X7jnjiuWv4zUfn1Tgf2qLuzTvqbD9SwIL8wIrfVr+MRiqaRPBj1OwNEUWm/rvP9ZC0U5vPyWfbx9kwnsF0QNoP+JdIhg30U7iOoBkue/zBnjIa75a/r/ICbfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824121; c=relaxed/simple;
	bh=80mmaJuw/AQCBISsLv73CDOVdsSzGwzFqmOLMNB6Erk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLjHLfrLQJrAOUfeBEuHEZOv894BbV6j72NQtPsUYPB2a37Dai2Gy7cGqcoTDW6PAkvv+yGNgyKanO6kDThixeaI2t+wj8PN9BLgItz3qE3gCe18wwiteP2YSGlu2k3hEKBWvmcPZlwOvSMtv5dYviWMtSwHNkiY2l4DWAuyHZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laBnQzwg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWyYIMpu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mrDX1611705
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw9R9oYahALifpZVpR/y87H4UNYxEDaiyEWe7nwLowg=; b=laBnQzwgEqzDkBpl
	tRNKD5+ptCWHuirAkX6JVpWgUF2AyygYzXtduWY3zlegL0YyRJbshhx+Qs/NBNE5
	LEjGN2XLO9WKzuPq8i0Xg5tmH8ihK/9PizSCsefLZhryve8PwLiEZYo/Dr9CBKOw
	+pOZd0RltWOW4X/naqcKXgnCAMerLJKCJxwH693+jTjAr8f5n9a0lRVqf4H8U0bP
	YFzmDR/emjSmkzfv1K5+JDW9vo52WdZZbSB6RGyc+ZiHf5uFuN7Xi4oj/bvG0HT+
	5V7FfGkXJl7xmAf6GkgvJIKiHc4oSFjn5syu69ZUTq0AqrvxRo3SRJ39BxOnvvVo
	B2lz/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtpva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c42d96713so3124160eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824119; x=1783428919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw9R9oYahALifpZVpR/y87H4UNYxEDaiyEWe7nwLowg=;
        b=jWyYIMpu/IPP0JRh4xkMBCZsqcPF8CQxn7h9USPiWWbGVBrc0DhPoxVurkvxY0Mr2q
         38DVDn6gUgyrpiiJ/jQgD07FE+73ELGUFPn8VeIzvtpdSiO1d9F8d9ruoaEFk3Na7UKD
         nPVXbwBS2mBYIEghMhIESR4Bbqwuim5hRMzFkZLKjVdACd/TeI3bSphVuQDz8x+Mpgx/
         ELSZmlZcBZ6p35PGATieaxvZ54Zhv2lxavDx0vuYePVhNbWgnanEBRhUQAJd8sC9RMAi
         tmDeDAsnMKHR6F3oBP/0d+PQTF71VYMOfNfrQUWCPuM602yFMzNQSTnk9WXVVn/3fp7Q
         bzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824119; x=1783428919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gw9R9oYahALifpZVpR/y87H4UNYxEDaiyEWe7nwLowg=;
        b=XRkpjYU67T01+pmPbWOkMdRrnkJ0nUR2COiWAwiCohNOnyNeVEtY+0GUs395JpI6R5
         Ne1jJIvQM4anWFNebMkPX3t9MLNH+Oi6owOymXUdAbLgys/S4MihDEwY74KaOMvPAwmS
         DslBekvTuEeKvHZV77bw7Et0XqrK88fk1RJy0SlmQ0IRz8n+xN7ZxmkHcV+LbaMTghe5
         ZEalVvBzvGQMwqcjHXUbg//Y5SoG85eANI5c0aRqyEFDCadFZRGYJz3LfyGh0LGqsFn8
         q/4EkaIxvAtoV1tOl34iXXh+qErR5Tq9kALNRW2DBwxvZZ/uNQGRsGp6ff5G+lYgkwyY
         3vYg==
X-Gm-Message-State: AOJu0YzNmgI5/KrAXbxx0SnSV3rVuu22xU1Z/8fdASqPDoeZMSLcYpEe
	pk6wCmVpHtLh8BTcjhIb076wpG4aHTrTuNVIgh8CFaIJyL+JedyY0pDW7oKfzuFJAOaEkdEC9V2
	cnD20Vlz2tcn28G7t6aznKYZxLv065dKXH22QKCZOmP8qD6PB4gdZh33KqdQHnMCJUFo7
X-Gm-Gg: AfdE7cnTQnGWPUsE95R7pJdRRX//UDeO8x3uI9iUwDwa/SylErLk6Fd+Fd6oGWh3LwH
	pKIzWd9uTg/6j8hfxctYbl2p6z0muFAsfmQTchVA1k+OGuO2r2z5NdwKHYOPmc8OVL3NIZz8gFA
	rohHT9T/xiLyjLkpoYMxxRLFAvAM6tt1B04Xmd5udPAQ1Qo3SwP8k7fkfDsyblbUEeL7l1koYmr
	yr+YIY/MoL1PDU5wYIycHLfSOiuYCm36vZmxg4McxtnmpOcPNdE49dpZm+9Kv3ZCJbxjAH/mikR
	Y7EPoqn9KkCfaQ3TSON90FRMb76hs5pKI8ngtUbsXA2QRXYT6JulEaZRMOiJfchVURTqxZxoGWH
	IRAoMFvdbtKq+g1eYjKxr+81qJ0DSk0oz8wWPdMd8CnsNRq0=
X-Received: by 2002:a05:7300:510:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30ee140ec8bmr2740699eec.26.1782824119338;
        Tue, 30 Jun 2026 05:55:19 -0700 (PDT)
X-Received: by 2002:a05:7300:510:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30ee140ec8bmr2740678eec.26.1782824118834;
        Tue, 30 Jun 2026 05:55:18 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm15936443eec.0.2026.06.30.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:55:18 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Google-Original-From: Faiyaz Mohammed <faiyazm.mohammed@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:25:10 +0530
Subject: [PATCH 2/2] EDAC/qcom: Skip ECC interrupt setup on Shikra,
 pre-configured by DSF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-shikra-edac-v1-2-287b3233241a@oss.qualcomm.com>
References: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
In-Reply-To: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXz11kCdl7IS+N
 xoA2UDV+LECn9564okdx+FVMBcbktUA5x0PS/rbqnJSnoXxy38+0cqupdxdD73p4OkKeRTiI26M
 108fT2r4KHVTY1ociExMHn04dV1hsU8=
X-Proofpoint-ORIG-GUID: VMXbTSVdNJyVI3Kdc2pe4bYVfY80xHoL
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43bcb7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8vN1fEklARe-nqYcCewA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX8lmSohMFiO9g
 G7jMMTobIrrW7rlHeoLorXNz8or7ItW2Ht4QZOhHOm+0Z7odEUQk9M/DslecaTXpmWB0MtSdScT
 wq7q0rsEJxzVP+tvRoMcbBtXY1vOn3jYcf7I82EznKjmtFN2bZw/fdnX5YpkJ/V6QaWZSv0UWKA
 0nJjDTeqdOIetysXBqCffUTBny/MscqI8Apqj/QYefHnpMJWHuxJk+YV+PiwG851wW8/6SB/mdz
 wVh7Yzrx5z7WDCg/VzcJEOMfdYcNv+OyeX20YhNcZSU+3jbnUwArIb7MsmOtnr0/6IXSEpewODs
 kEYlXzMvS1sGvrO/zsnjWU+Q2dhJTFUVmoG7H+2jH/rVdT14qMoWPQNtUjK6QpuvWMgeU3JczYc
 MjB/zbU/kcgZw0lvfqE7GYq1mqdraFcPvu2rkw/Khkguk4mX6jQdQNx2kvKnXkS+cxjXRK3Iagj
 v4ONzp0TpfaWNfhlsUw==
X-Proofpoint-GUID: VMXbTSVdNJyVI3Kdc2pe4bYVfY80xHoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115432-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:faiyaz.mohammed@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EB976E4B64

From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

On Shikra, the DDR System Firmware (DSF) configures ECC interrupt
routing before the kernel driver probes — it enables Tag/Data RAM
interrupts and programs error thresholds in the LLCC interrupt-enable
registers.

Set irq_configured in shikra_cfg so that qcom_llcc_edac_probe() skips
calling qcom_llcc_core_setup(), which would otherwise overwrite the
firmware-managed register state with redundant writes.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 22c8099cf6bb..733999867bbf 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -4595,6 +4595,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
 		.size		= ARRAY_SIZE(shikra_data),
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.irq_configured = true,
 	},
 };
 

-- 
2.34.1


