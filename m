Return-Path: <linux-arm-msm+bounces-111119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6WHNMMYNIWra+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:31:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764863D013
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:31:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IsIiTMfh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dE69F1Y9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111119-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111119-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9812304C06B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018103BE65F;
	Thu,  4 Jun 2026 05:26:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6A3BED70
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:26:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550805; cv=none; b=TnwYEVv5IzVjcCK3BM8FQK9pumSRCyW6XHTfjrQ0tx7ihOvc1kCQBPQgY78vtJYFYQ8/3kRsSseD7ZtFk1qN2gEsVgW+Skxsa1HrWyBNMdfwAN6gRBfVV3ST3JO5KJWZ/UMUZrhwqznRyl6EeFv9KkxL/40svSIrf9mfkUfGJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550805; c=relaxed/simple;
	bh=Q5+uO3LW2fHz7K6MzYEBqR1TRxqTCEKCt8vYU5DOE7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eb7J6uxua51CpbU7K0TBUfu2Tbm0+rJy91MVC0RnLyP4qz5X77T8XmYc0EIAYVt/0ma4PLhPfwa0G5jaYe44OvJ8Bk7Gop3uv5KSyp7/C8kSyvQoFLPnVewpVL5FruB1aaMksGweaT70EM9ZHfyu1PaYXBIWAe+yinHIu2N0wUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsIiTMfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dE69F1Y9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65426rJ72260801
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=; b=IsIiTMfhGPWECGDj
	w0d/K9g3hGHlcZ4XdwTMjkTuyO8jegjOmNSmqXdOrblKErYITlOjNI6M9/w+G8bt
	kszMJgDqhKNUuDOKK5fxF5S02gQkmbBz4xDb0HQU+jWCdM1e2MVi2x/Qhz5MPUtb
	pkthGCuvlVaWp0vYTEhDh4jJvoMpMDqMwmID8WFaJd4sJTFIsZgCEviDAxNZ95dl
	yYZvwX4CHe/qgwPG38y4gxq0T8vxOKbpmpKGyJsjB1f+08tFpq/GA57N7P4pi662
	oi63c78Gn/1k3EABUBKv7MCTgrKhg5GX+gg7EQJQNSu0JuRnwBH+ZB/f2EGqC7N0
	XJvTyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mjgab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:26:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso243305b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550804; x=1781155604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=dE69F1Y9aG/s8VK71+ls+hFgOmSJqXxhbIuOCskcyWufeI8Rv54yyl+6hNAm+q8xJj
         Ja4BzHIR42KWhJw1X/18flveTgjJmrLf3r/m6JAJMmmidOiUk/SH6gWiICGwzMrW61Z9
         +bFEZhlfy6QQp1kNJGF28p39TStZedYmojY1QvN8iZ1iqa9CHAWi/adjhQMX4qjqdaOw
         7ftyKSMa/d4nDiEZg2VyCn6L/2TN9qczQHb1MyJN11fZTU6CHnMCviawYt4gWHnp3SJZ
         qMfQH2kh+essHupiDaHyeIAF48LPpHeJ3C96C8HF4vrSMJVUnxk6UjJ6G0LBJAAdr0Es
         ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550804; x=1781155604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=I5EoVwyUuS4yw/7+VRLR4hzh4DGkk26IvapLUFnd4NvnYypsRX8mkORt9ODKdrqYkd
         nPoy2pb5ctU6Qeijeb++ViHkKL7XqALgRKm/d5YzblwRz2jZ3BO/Hmm/9GJzHtDG5376
         xlaV5ba/PQfDljeU435gvNtKO76K/6hSThHk8xxgQQRbmyia3lzil8YgKkOdjaoBQP4w
         evjZrlUzyvDt26F8Ef4uTabv0jkgm2PMPG2q0LNQP7fTkc9y+PE4+Uafkltgdk1RzJgu
         JFDDEQWQWwt0Ttu5mxdFhzj4MrOEhO+arDJoHX3kBJttyHXIVd+vOVRxFfvvjzGlCUYr
         ouLg==
X-Forwarded-Encrypted: i=1; AFNElJ8DeCJt1PoCw9kQPx37J+uRa3A27c6EBSxNyPymULjwqzn5rDsgJoaFG/WqYCvwz4mnauH7ieZKlfvPIz5j@vger.kernel.org
X-Gm-Message-State: AOJu0YyOogNjPu7bq1BXqQTK5wJZHeWEfmtLDZcN2jatPf0Go7xSnCUm
	KjgQUxJ7ER8f1vxmwIO9NuALotE057Z/FjhNptGrTKfv4dZib33yHDf+JI8QfPS8giQW3CiekXQ
	YAAHUnY9YbYHsrYlLM7fSJw2QH397xIuxgzZJRVnEQ9eOWgDw15IhGX/iXLpUyM61wAV0
X-Gm-Gg: Acq92OF+7XVzLpURJg25BnUM4iNvuX2nMSPfQv6f44NpkeeebW2yIDy1BsHMoss9xzK
	Zftlke2jzggkXXMRz1ByGlZKJpUfjwwgF92sxACKsl4z9Yt75aInCvquO+S+7Kf8CFzjvuTlHKu
	3P+e2ynsxwVfZKjt12KbEINNJ5Ller4Ns6REXCN0Wcpy/HixUSdGYpZupAZL1c1vCa3II2RpMKg
	RNJELqboA7DUmacrK8Kc2oKOFtl+yaEZXfzBnpTLUffpeo66NkPfHu14AccgWDwztNBBP+m8woo
	5iVsW9UOnYH/No0ny8HoAGTQVZyd62n3RcEaEqGlQnrcMN0pb1dd39UPaNTG5t2W1kaW+loZw5k
	tEzObR02NF5YEUjPtwLKaqtgND7JBq9bVFZ98LURY74O5TPK2ZJw3q0/HGSAoO7g=
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr6194789b3a.44.1780550803653;
        Wed, 03 Jun 2026 22:26:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr6194759b3a.44.1780550803185;
        Wed, 03 Jun 2026 22:26:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:42 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:09 +0530
Subject: [PATCH v4 03/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-3-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ZzLtMeXUYwmYaHUtUAJkcWVEmBTgQ7Ba
X-Proofpoint-ORIG-GUID: ZzLtMeXUYwmYaHUtUAJkcWVEmBTgQ7Ba
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a210c94 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXwDT5emtvHOLW
 VoDESc3dNgAKRv1YynkijJTWK6oleQBph7+28YqW/dSHdiQw6VM6cZm2CxGVKCHfUCKAo1Dp6uE
 GP2LbehjeH9wQrRqZQsxjlolH8QDkpdfDfaVCuC8Fk93AVYqdD3eaRTsBBRrDhVNG7+o54vaVpy
 6wWwmPbNvt2Xv3bapQ+RIdfni99JXaFdb5Ooj/chSCM33vjQtYnALPwvzUQPjA35MFmGIgeXRbW
 M7yT/UscHZJnQtn95HdvIAs5N5woRTS4fI4sUYdnKjOe4PJ1CS3Aw54LVJcyL8d33AMb2r+vxe/
 J2Q9eC/iJGAMVofjlVOGh6b0R2LsJBiEdyfiz6DRtAWJ3WVv7wSecxOi2tYPuYGGSHM4NNhY2IR
 WnwV7JkEscVh7+iabaJqLSRM0y0tGMNOxkjZ8rFjAkMiR/ilKFPFiWpWDI5Gp8R2+qpZNNU7KV/
 HnAHjJVt8aXxvMcHgKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
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
	TAGGED_FROM(0.00)[bounces-111119-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2764863D013

The Qualcomm Shikra Display clock controller is similar to QCM2290
DISPCC hardware block. Hence, reuse the QCM2290 DISPCC bindings for
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 24f2cce033f6e109b65a79553fba5295eb9adf3a..5cee033f2115deb392fc1deeee8d5aed4cbde052 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1


