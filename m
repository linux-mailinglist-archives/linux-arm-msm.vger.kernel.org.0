Return-Path: <linux-arm-msm+bounces-113374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xLaYFicmMWoGcwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:32:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9C68E535
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:32:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IZEc27ej;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LJWdU5s3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113374-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113374-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC99B30AE75D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEED343C07C;
	Tue, 16 Jun 2026 10:27:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6303D43CEE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605655; cv=none; b=LSG0MqtE6tdzMsKsoO0x/O4+Tzb68Oa9994SDMdmbKkATXj3C69c8H9mB7z5e02RmyEH3z23yEC5DA21wccDtQwZ96fBI/SvWraQKPF1o4C/hbV1QClx1sBvi47dgWPwYjV9ueJoIgF1jk0Ydk3FR/lv/ZQ6NNIfExYMviQXVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605655; c=relaxed/simple;
	bh=o5BsJ1d63lHRYY4XwHw2Wt/Lp9CliM2aWMRETby61dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZzdeSv2swaoxMbqEasm18DnyQIqrQiw2dZjmNUaLZOIU1bZlXZKlACvj+9paW1Pc6Lk5fKSVO5tOETHcBWB7FW/RuL7aoETmF0QcxPEOEh9mODzECB5/DkvvDbOnnxcF39pq/9uT+na8EY+4E5W4FjNaM1UgCG58Q7YIkI+mLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZEc27ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJWdU5s3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9TRa1414887
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+ytMUmOrv1qZfBjeDI+nLZ1ZFRXBO/OXE2KQoRDg7M=; b=IZEc27ej39QdY3oH
	Oap5GfzpoRIuYhQFkBMhhecL+00HybnNNAN+vjzcAm3+Dan2AsaCsa/DebPt9lzR
	eX3lk/DEiVcbShCVVLJhS5Mw8HL950mNWgYT9QR/tlJ0O7iOvlrjYtr5XQ2uGwt/
	8rwsq3FgTNjL+XV42Tx2Zpm6fgzv/35DHI8ogjCWwZS9prVepKyrKGG+UyghC377
	iIBWp25v54yskgGDjcTC3vq8un28xm0Vzu23zQ0EboHoH6NwGm4igFrN55mG4kAT
	G8+u+REOyLukc2+FTjGjM+qsOYzuy54h9wYtKMVt2D5TGgly0irD6Ycn2lzDV5UP
	6Vajkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0bjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso52693245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605653; x=1782210453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+ytMUmOrv1qZfBjeDI+nLZ1ZFRXBO/OXE2KQoRDg7M=;
        b=LJWdU5s3BGtfpx2wHHXjviKPYLQwz3/wanQbh8I2sJ9PiDUHPsJcPq5G3WPoK9y6Fb
         3qlmMEkvwO1wcMKy+6qe8mbC5hNrLckixax3Rlp5u1URW5vYmTj77ocnzLlkAfR6eNIy
         JrI5AXcfnjd1weK+7glpj7jHuA5TPaPPCrVyK1SbRVoIIvrx0iQ5GbdkdeP0o9EZSMm9
         qsff8qIPeIQDS0bY2qYw8kZPm9PpYwsg2hkR3GkBZevpHM1+TOpNz96l3GCIBLQXhzWE
         SZW9dNBdY4p1eL5/1bf8vI3b+lbf+yL2+2jqpIqdsue00WBz6tbVyRuEbGZerSbYk2dk
         9Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605653; x=1782210453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+ytMUmOrv1qZfBjeDI+nLZ1ZFRXBO/OXE2KQoRDg7M=;
        b=A5ONCoxlA7YwqjBuBHx30xf+PW83kF74G8hw99I4tLZUgSGuK9j0l8RP3Jwmrj5SZD
         LgP/LXg5ix2xT1U+SgQ5Bbl+Ua9lEYgLkonnnJx6d2CyhhBDjmY8JBO4yYKW9sDeolvu
         o8vadh/5v5qIUifWoZn1RrCIitbkPGDLsRau895qXT8e1GU++1bvrFkgZcs3X22vC6wI
         3O3jUfwgvg9BYukP8xoe6Xr+x96gFpIP9dtH8NY6hJQ+RNtyWdffsXA3F5HJVxTP8OXJ
         qeX3ZXlvDH4+DmsBqQFmbs1p8dNCjTREnDsqU3D0TdFwfhRJS2aa85SxRtiKGJ5nbTd2
         A07w==
X-Gm-Message-State: AOJu0YxCXZ2IRjBtWyZOmkRC9CZickcg+55s6PTiL32CmGYFuhH15azI
	VUWWlZlw8GtGyENhaVqfuwSdRQmCRtHVOpTbmEestRjWl8GYoLCjooGcgxvkWl2Wqpshbwq2MH0
	oqHm9dqTaerl2NVcMCtFdSqobfS4vG9tLzoixcCyOvTmWsYoTStyaU6mfgaNITdMwirwd
X-Gm-Gg: Acq92OF/dI/TH0r6ZBYQEsI8EX8l4oz1s12NZiz8QxmkotoyL9vHvNWv0AjT3cGaZR1
	mmBeYXvcOk92Hr3teXMqj5xc3uK2Sui2HVybgHBty9vX/tRJj7XRCKDYgzl6CFMPBTZsTRmgKwa
	TOa/ujZDS49HYFu4B/FE6eIAGz34uo1m5c5Q8zDPRiwlsUq9vN0qS0Py+ZYXy/w5duUO6ENq3ex
	3ntmw94kaIu3SD5DMr8cYfqypTB6mN04PGuRFSHBijGp3Z2yJ0FHa7djCKg29jHd1raQtQg5XXW
	synj7nz3UHaLeVzBOCNmacuVaQ8gpb/3MLPxVxlpVeotb2QgTsYDbtbY5LTG6mClNh/+nSP0RHB
	KrYNec89C1OJqrbS9qkd7BKaE0u2t0sOm5zrIrtCP/QZYUtse3g==
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2c411d7b1famr212724845ad.22.1781605652943;
        Tue, 16 Jun 2026 03:27:32 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2c411d7b1famr212724585ad.22.1781605652506;
        Tue, 16 Jun 2026 03:27:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:32 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:57:15 +0530
Subject: [PATCH v2 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=1015;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=o5BsJ1d63lHRYY4XwHw2Wt/Lp9CliM2aWMRETby61dk=;
 b=rv9mgXSnGYOD5BNxgor3l0qJ5G18o44KdmHx6l210l8TI3XtpV87JapyaQSO73xWB01g0qwhK
 c9a/CUJX/rNDSHHa7rdI1Hhc0HIfJHzuUOIiij0YuyeKW1R+1ytc84T
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a312515 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7F8GWd6Rnz8ceMZFFMAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: lX6xi4SBAbuneBpAgt9PYmQuOOqg6on5
X-Proofpoint-ORIG-GUID: lX6xi4SBAbuneBpAgt9PYmQuOOqg6on5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfXz3X7Y6Nkc7jV
 z0m+q5doTxtbV4cj/TEQYjcv4KyEUaVluI3pTKNfBWrffinKyEZlp5habsSL9XSsR4aEorSkTKR
 Sy5nzFGxK1OIuyYtpaG2t1MdBITdHcrSs2NxGs5vIkuP+LiCrecyDgn11Seiu3w3WrmbwoDTV4t
 mWt5goXM13iGVdYeC8JPDRqvNUM8bVbqlLVEh2IwKEsNxwHUDbMUHtpBG+loE+FSDT7zLTHjQHd
 y/4GNkpvjrjXRIYtKk6W81LV1L6IrsPq3vkBtWDCl4OoUSErs6vm5s09lyKKpP2ykyL31p8mU6V
 moejMiiy1f5yTpnI+j9q1qTf2dYndzqjvKluTJU57b0bVWFm4AmikYaKzG/4ATnDn1jmCT2F5En
 9na7PBM6pV5OFnGEawdZlycu9LUUfiyaYNrZvdmsc4T83TEE0smJoLhhCsIpZm/WCtlujP7u9rq
 p4d/69FiULPh6SrAEmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX6mEv/1KDRMCD
 yZ6ivcz0irHOpMXzZqcnF/a0BlTk1DKZdEvRHtrU4RLkFRp0kRQtZ9hot7UO4H3rPvEzxk6beIO
 iYj3V2tJhvS5Noaqwydxx8lO5JTk2uM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113374-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0A9C68E535

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in sillicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index c6f2935ff788..0f638556d4d0 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -704,7 +704,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+	}
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 

-- 
2.43.0


