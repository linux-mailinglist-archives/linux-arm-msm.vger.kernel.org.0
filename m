Return-Path: <linux-arm-msm+bounces-116103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TBtXFtevRmp5bgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:37:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7CD6FC252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:37:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gj7kV06e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SCU6Teib;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBD2A30ED1A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F0035DD1C;
	Thu,  2 Jul 2026 18:33:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879A369D65
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017229; cv=none; b=iEy0Jx0ec3Aa3p5iGDKf0S5B8JMEr26GC3IeVJImRgX8Q9gptHMHVANbYMCpOfwoYAg15LXYok4Zn6ORzjfaxauX3DORlbSHUTLZQ0atTJhQ9lJVNmgO5vFbsGOxDLu62uKO+o+9m0dHXQJY9RZNIajvYjsIEm32xKwmvkBLG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017229; c=relaxed/simple;
	bh=dc+tPFXb8nH2BbNiIpPTtY7ziV1I+rcpbfq0MoU3rsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGOBwZTj0vPBB5EjxVEYJPjYHJCsFM3Z9ypFFt4Iecp9B0ztDVYFn9ZmssF77RBhufTeK7141261aNM1g3yWOz6EYiGObEGrc9ZtaijeCyZ+cpRVoIlB73VFW0xTRMOIEJbTuXGNVf1kXa4qL7MhaqT+N1CWFaufbKChgRBxGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj7kV06e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCU6Teib; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUXxk865976
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=; b=gj7kV06eHHeTn4kk
	Iwwibf6l2AXx5TYGHrZZ+h3BfY8r7v0uxE1sjbdjgXYTSE8ZB0mSTEYGNagHZq/r
	GnFFybYJH8TbIyhR3SM+ML0hcuseZnmCOWyjVKFkRpD9oaTQ4JtFOqt1fhyHSILY
	juZ58+QCRm/w25PZjNi+Vcr6H9JuZ+MRnNT/uXB10k5zlc09lK4mmTNr1hh+6oxg
	78zmdweJXY//XBUQ8Scl5VvHP4mt1sQNUepKe8/DYCTYrV3ibcBxoUgwSeq2eLpZ
	jWjiVDZlUkB8cSR+AweTuyig7i5uAAfBIiqOc/k8Dfho61+OVy4pLA8JA4Z+MdoI
	xxTneQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngres-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so2943430a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017225; x=1783622025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=;
        b=SCU6Teibu4jMZM7VqVCV/ryCx+99h3XvuSjWrR9LUk8jniXixCZpOUIE61BEWyQrlS
         bbUkXAhnqIyWbkIxxkmdC9dQeuNTFnkqPZDt6KYYEvDBDZ86rPvz8tE98w3LXkw0vp7x
         zjui8Ay6s9ETO3S2cHWQuKKU+QbqDzJ0qcVM6R9hQBcpJeVwKGtlaogOoWwiWTzsUnrg
         bMI3fClxwNCWU14mYnB6cPIomzg92TCihsHV03fvW+ZGul7hTVEZ+p+E8F6nT+BFOt5+
         6SauaS50RBX9P+yxwICvu93ZOOdnhNVf79hjE7ouYF++gr7KBKl6I58oBo6yhnwDnGKr
         dwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017225; x=1783622025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=;
        b=QYcHa2JdIWKnE7lXslul1FJc4uS3mOQjd+0L7dLSdams1gKyS1r46nX2AwmHbu+lta
         uPNjfz7clIw0Qj0TQkT+4oq17LsfMYt6ezdndmR1yOvb0878yIcNKFVQA8hHOXNsiCa9
         QtvGcbBqDabW0oFL/YYOjS57Vhg3RRUaeApenvBS6JrvrzIiwbBkU/OhGFmbAceYTiXH
         +Zu2sXI0wxa0AayB6PM4/C6L+Lx/7PYOEAcVZHIH14pVwXCT1QVB/qQ5BHLkdSRRSLWi
         w3yqfAh98qDPyrT9FV3UNBT2OxmKTRBWEkc9KGz1+bD51lOC5XTWd/gF7lShe72r6l/P
         WufA==
X-Forwarded-Encrypted: i=1; AFNElJ8Pv2F5JxuXR34qNMKlpcZK3JjD2gedHRSES8jCLMuqXGtqTxOzMdRdw4beqWhLT9VhdjBdCbaiKIOvSc+0@vger.kernel.org
X-Gm-Message-State: AOJu0YzLHHmauUQL2fGyVxxES9LOfwY76cRsxkZQ+Rk2OfbQgfRjo+LN
	4ZsOZSY6UcBML1GoeIrIaB3GisRenHxXGcR9H9JPRy5JiNBTVgMeffl1fQ0pkVgL5uCQx8Ojw2b
	aTIbW36w/5cajMfYDYo9+0sj6UVnWJO113d7I7pou6AB416WvpfRjvvPEOtpnFt/KhTQJ
X-Gm-Gg: AfdE7cneJd+lwUFagv2Kk40sFj3iRdxPTsDM7gRzB8lhFReRbmszBfB45xWIhEbo8O0
	dJ2U7v2CYL5Lu4PUCiv52vOEH0ka6wHnyXFJ0JsLtsU1xB7GxK98usXhZu6n8OX01e6kzjki7BJ
	vMatHiO7LYOcbR6MIER+tzyYTx0Q44DNrm60d2vwaaV7N/AjcLQcYaLtjlCe7dvALEbBuQYSyPT
	RcfxnMyVwEZ8BD4NS/M7GI/YvfDiTqOPEQTssgPJfi7ue7mCar2+XNIg8q5QK661c0D1J2A1GGp
	bE7uECvCk3fQXWhMEHAt0NUOGkpsd0eXfi/GX2FFejoTqIGFiwJU7h5e4j1WJTq35nmyOvIzSGc
	nC1xxjWyVkgmBtYYALdQ/XOX31V5erEQY6zA7k6Ymtg==
X-Received: by 2002:a05:6a21:898d:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3bfedfb6d70mr7814578637.55.1783017225432;
        Thu, 02 Jul 2026 11:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:898d:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3bfedfb6d70mr7814551637.55.1783017224917;
        Thu, 02 Jul 2026 11:33:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:31 +0530
Subject: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Nh6stBhirmpCMCZXtTGapJPyV7C2X8g2
X-Proofpoint-ORIG-GUID: Nh6stBhirmpCMCZXtTGapJPyV7C2X8g2
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46af0a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WgD0fBIP9JuU60yQWEYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/ZtUtbik1X8M
 OGB2K9Q7kSAIlLPzLhq+ZQf9LBv1CBR17EEdwclxAN0Kgia8QvzlmMJHIMSUr5OXG88Wgnmg/sw
 AYIllAOj7kTwdOoJWJewevz1zAZ6UDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXxFxgMaYwJgOk
 VvFIGU7EtAI5rIj5K5dvJ/FinluEB7z2jM2FPMfR4Rg5uiF3xFQgxvl5+pfBjHBAXFvznWUDAB9
 XVaVTul4eRUVxTUDm4565HL76DEdzHNgGQCdM/Fhdy+MPCr1tEjdUesKgVR+n/xG1Yej4T1N7fl
 Rk57vjkjI3M7X/oX1C2hAxgaaaulUO+dLjSSJ/cVsY7sAHC9+XBXyYRuXyBj95xG4FlOAs1bN62
 l59oocjOUAZPXlR7DaRZumBhySnoZFSHpYEnrPoZrHUu4t9fCNgcekh/b8qd/e7BcOxMAq/tvxc
 HygZjoktHjearK6btYehk0SSC615HSM4DRZrUJkvSqoahJ+ml4Ge60PQCpfGIX16FiR9wR6WPUb
 5u5fmKyW1pCs97GmoZ2ruT5EjaYOpI51NAx2GgGSXn3SsQBFonT21WjU59pWEr1AvwpALu4f3N+
 1wB3jBUPR1EG0Df3uSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC7CD6FC252

On some targets, the GDSCR status bit may not reflect the actual state of
the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL_TRIGGER,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1


