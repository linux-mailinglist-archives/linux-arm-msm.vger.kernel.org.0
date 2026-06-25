Return-Path: <linux-arm-msm+bounces-114443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +A1GODK/PGr6rAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:40:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0C6C2CFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:40:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IlgfTr6O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bOFQKuoo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114443-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114443-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BAE6301A2AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 05:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463BA221DB6;
	Thu, 25 Jun 2026 05:40:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B8B19ADA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:39:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782366000; cv=none; b=pUj6/Dyoyl2R3R9joc6vUXZGvyhgO60AJQb1AL7SusBpmPcDs8EOOL22my1XQk4GAXD0FACFfpLn+4ZrpnKQRzqPANWGMaE2yRccdzEk8u6xvk3lPEpK9CE2kT2l6YWY5wIjj6uyLw0NLkUY90SaCM2GKPBEIempdkP95d3zbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782366000; c=relaxed/simple;
	bh=WwZpJ4qBLy737eyf1kgXyhTJOquhD0FEELf75mr6mcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NRpWxAPpurl2fzZucQBMl3eaTDCUOW4YCI8VbEg/WlC5eVUdirSZHbHcIILQHURgKJiZnZBuzKnSRnLEE375GmqY3GJin2JdiB7e2XO0QIom8vUawSMm+i3wYPgCBMJogRsLK0WomkO9WCNT1m3r+jyVEGP+P/lc/OSqGy/o4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlgfTr6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOFQKuoo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3edHM1226474
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ezExHs67ZowB/e0UR8RZrk
	Y+B+ErVvkQTBeAmwaZ1pw=; b=IlgfTr6OyGRlQRyFblGPuEvYQi5qJdn33V3oTH
	feJ05BNqQnHkduNMN4QqBU9r3cg2B65LfWNK7LHoeShn3fXv4jtdpZCHftzhv1vE
	GcibpHxsaY54UzGqsmKLQJNhZWL5bkECyrtc/8hanYMJ55HeeVhhcIwCis7gNeaZ
	rELzwQA7/63zdK7irfapIQrDUUByyjiaejYt2r0V7RuNB9IETt05rTnp0ytzVkNo
	OdxFUmi1o8hczTXoOc0QoyG10PziXoxaei6t5qxnVIcqmFLbm6oMRs+Yn3J/IIdu
	lpMjVwlLWYdhHoGlFUUWmmb7qOruRinIGryNrVreAKqRpHrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqggcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:39:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453e61d6f0so1853590b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782365997; x=1782970797; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezExHs67ZowB/e0UR8RZrkY+B+ErVvkQTBeAmwaZ1pw=;
        b=bOFQKuoomhE6eDx7Y34/laU0WXR80Y3I6FknNX8Dqt8kpuJF2dsFrAywdEd2WxDAAN
         Z1K0D3Id15/+I7UBQoPZtz3jH8bHwBdzgB6SWXZf3XA03VZlJW+cy0KkwoVn+rHG5Cb5
         9sWdy4z+lhFb5X8afnk153lVngKisBZtkV9O5UZ9tFM8vo+8NvEAGuIaUbzMWly4zZrl
         Wf8S2WY4kHtroFIuE2O3E7e4dxQTkY+9xTv1NaPGz12Ru695fygQJdTLSPhOAWR/kMYD
         14iDmN42Iw6CfI5KVszJCGVdWlyWZjOWtbk7yqI7wjkBZhkcM2Lo2B4rI36TqpbpsYHL
         HbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365997; x=1782970797;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezExHs67ZowB/e0UR8RZrkY+B+ErVvkQTBeAmwaZ1pw=;
        b=Mv1FVmm2xJHON72MfOyR5ce1tuoKsxsP+2hIB+Xko1GR9EprQGd2mPb7tdBLm+vll2
         lsOre+Bq/7ixdLA7KNTz2yllki/02tzS6GU+GlIKaxz2e+sMUOkLvb0xOpsnP4VAn3zm
         r7C+A7FdnBsyoOtxfm0BZgk/TbfkLYJGT6FgKdG5XEa/hazKQ93tYQrnf2YGuq65D4YM
         5Pu5ZFwzEFFAKfmQ786NDcSPSBPM7FM4ZyvF2+a3H+CogBkw/MNrgqw18XEvZRHVtU+j
         nVB7AKdJ46MnET8DrON2hkhBMdYwJa3zKSnttZLdouqxiBpWIacSjzgicffzUOC2Gfw8
         EvPg==
X-Gm-Message-State: AOJu0Yw4a1OXh7vXWpMJDdPq58kwkysOSj+Qfpvn2Taf2yGHuL90Qbvq
	KVLZ+OkVR52ylV6wDBBy3PY6URzaQ3hDEL0cb28xXLn3S2suSRpTDZnYfB69Vddb4iW7lL148tL
	Iep6dZjnzvjSPMB/CAK9GyJ8uU85o1Vywtd1RS5TmCPZv5OLVKXaZ6fwc8CJgDcwlfmlj
X-Gm-Gg: AfdE7cmQPpSeWbi+sPX6nygCBMHPFR1XHrGBrG1/yE4yMzLV/gt9EBZUTT997qHYARR
	WR8As6iOAvHqaLJqVixmR+/14zUt9C/uTffsquL1sslBpLsspHvntG6m8Uq7YE2WIeF43vWxo/c
	8ybsKptky5U+6tfmrVJglMa5Fg7uMQiKFrGYVoarPBNvtNsYTXQNUY7Wgl4+zs6kW1RbBjiaG5V
	PjfcN1K2QnmhEVtbVVQbEnJSVm/st8wsKzPbV4RMBamLug3EfbHT2b1fkmvYizuSB24egCYOm3r
	lVA8p1kcLcYGI2HrpDWy6+3Y3K0thwg/67lRWOkR8O2EQCCu90FbEh5MBDReNld7tJxwHoBT0Qt
	L2G4UaJCAmhBnpXUJwxr9szZBW5FIivEzn4Y10MsS7G29
X-Received: by 2002:a05:6a00:330d:b0:842:7476:2376 with SMTP id d2e1a72fcca58-845b3b0024emr1736299b3a.41.1782365996787;
        Wed, 24 Jun 2026 22:39:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:330d:b0:842:7476:2376 with SMTP id d2e1a72fcca58-845b3b0024emr1736269b3a.41.1782365996202;
        Wed, 24 Jun 2026 22:39:56 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fedaefsm4551534b3a.23.2026.06.24.22.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 22:39:55 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:09:35 +0530
Subject: [PATCH] spi: core: Abort active target transfer on controller
 suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-abort_active_transfer_duirng_s2r-v1-1-7439e3585ad7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABa/PGoC/yXNQQrCMBBG4auUWRuIQVPrVURCmv6t4yKVmbQIp
 Xc36vLbvLeRQhhK12YjwcrKc644HhpKj5gnGB6qyVnnrbdnE/tZSoip8IpQJGYdIWFYWPIU1Il
 JOKHtLp1HG6lmXoKR37/F7f63Lv0TqXy7tO8fMEYNQoQAAAA=
X-Change-ID: 20260605-abort_active_transfer_duirng_s2r-ce4e79896e7a
To: Mark Brown <broonie@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782365992; l=1345;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=WwZpJ4qBLy737eyf1kgXyhTJOquhD0FEELf75mr6mcs=;
 b=ytdW2E41EoFVe/wMqKAmLhnemRvaDDBbvKrbVVSAMcanoXtH25OhMCpXDiOrwI0TgjslOEdGJ
 PyF2jPLaLrICuSdLiyy0GzmawDJ/l9ggTUk7XSm/CvQ+qCWMX857t6f
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: REGtaL-jdHsSpWe8wdwHeGNaFaEsT-OA
X-Proofpoint-ORIG-GUID: REGtaL-jdHsSpWe8wdwHeGNaFaEsT-OA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0NyBTYWx0ZWRfX4E/k/qlMfMGG
 k/9XEsbu+/DaVuOeDP7NaR26hO2p/vXZiyo9VD//Px+nTCfpbRptKXZIj/fzZCehVATRHeaYPmC
 ytEQErLAx3Btq+qPEgO9OrbG6e2MyMU=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cbf2d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XUkRz5sAuzcGnk6uUTQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0NyBTYWx0ZWRfXyadgmXRCJWNH
 zxSmF28qaFjUVxq/1v1/57M1mohu9ZYnxBeUqpq2D72d5NrtjDMhev9C/vnXuBY82Ebb1aJBS62
 76RvI9evC/SZ8VZPJ6Q6Gl4huo0I/lFgIavyquVIxA133IU6Pgvz5R8LC1lfWoGIw7209OUHTTS
 x1hE0V8ilS0FhFNHjv2/gPsnPVS1SM9oOMPN4fxiG1vLM/Wukt4VsEUogzwXlTs3rOIhDAqGrSQ
 xMoFWp6TBTcqxUHGbVxvva19PbvjuMeKCN0UvRgcYbMmUEWlF//EpFq5AzDAgSKzV5fLx7qq1mZ
 WtB5kzjR9m21DR1/ndpESz895aQFjUlc4HPRSEGPoPTppLe0uxPDR+VvUyuKk1JZYacFDoHvyCB
 PtPVCdIr4Rg2MT3Vke6V1hlByShIxzdMQUozoLH80RGtR5Ib7Hm0xMukA/E2JsNDmJkafBtQLx0
 RV8olXpoMFQtlf3nzhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114443-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50A0C6C2CFF

When an SPI controller operating in target mode has a transfer in
progress at the time of system suspend, the suspend path proceeds
without aborting the ongoing transfer. This can leave the hardware in
an inconsistent state, potentially causing the system to hang or fail
to resume cleanly.

Fix this by invoking the controller's target_abort callback from
spi_controller_suspend() when the controller is in target mode and the
callback is registered. This ensures any active target transfer is
cleanly terminated before the controller is suspended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 76e3563c523f..2a96921ca55b 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3667,6 +3667,9 @@ int spi_controller_suspend(struct spi_controller *ctlr)
 {
 	int ret = 0;
 
+	if (spi_controller_is_target(ctlr) && ctlr->target_abort)
+		ctlr->target_abort(ctlr);
+
 	/* Basically no-ops for non-queued controllers */
 	if (ctlr->queued) {
 		ret = spi_stop_queue(ctlr);

---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260605-abort_active_transfer_duirng_s2r-ce4e79896e7a

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


