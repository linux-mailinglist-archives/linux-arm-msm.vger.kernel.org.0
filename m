Return-Path: <linux-arm-msm+bounces-93164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NnQCCVmlGkpDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:59:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6814C361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 993C1304A151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402793559E1;
	Tue, 17 Feb 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5MiopZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYf+50wy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69B3563E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333114; cv=none; b=uu5CmSXnDgFKufQ6OSdvU3osD5i/1DRYLrZRKRACDCoY2CYD/VNIhTnX0XGu90G/xflXpnwgh7mlKJjIujnmkO76mT3UJ9hI9TYnS7Nv0e0fK9ohX59cq6o8FiTiB5d5/K4M5OrFVfwKINi884eggcKt5zjY7ftV8um/ytd59fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333114; c=relaxed/simple;
	bh=fWEkW6ZH8IrJFUPnlNKjyivLp7F1ygXj6utw1Uk6dj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLAKqe4bKPEWtVaVV7itB2f66y62K7A/7UedCo/+bOOUndy8FcNTCppzPw7CwPz2xCvHAWEDyfbsfbOAYQqtmUD7yt7RjzSC2sbCEM171CzR1eiU/JPVgiI1LK67ZsdWUi9Ei+k92+vGQCw2X0xRQY1gOYQgVXXXiEy21WmXTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5MiopZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYf+50wy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBMgqI1613313
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8Igk+MqdEWy
	ha1tqc4qfOt+Li/8rGnpjhDsVBz3qVkg=; b=R5MiopZ9uVtID5Hz1A2bJh7Ht2p
	5CIo7H33FMbdweuAOzRlk0IJYNQt9CVP2CbjPy6SMBh/sJeXv337O67Y/u+xtQxg
	mPg/Fmfcc6JyhPaHoiVbd6Aq2jSsQU2P8d3VIgnrxKm3a08Q7BkvU0N7cew7zWrD
	xLMu3TFoxvUBFcCke7XaHQKYmfdC0+qVZqMdUfuLPUthTpdZhTcHjVSQBdpeKmNd
	6JR6/4s6NliGFQ9MHsxmXSw+qPU8DeyHLFvI1Z5gPs7RzK08O6qRoUFWqlMQHV8P
	Yvs9MS8zseyrS/G7eHyzeS++GtnZ5IsD3PEW1AVZPh+DWL3T0u+XRmmq2zg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662tfbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:58:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71304beb4so1934250985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333111; x=1771937911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Igk+MqdEWyha1tqc4qfOt+Li/8rGnpjhDsVBz3qVkg=;
        b=LYf+50wyoorHCJekDzSnrvh3rkHF8rshoLv6uBq8IN4YHYTGP/0IOI0ni+Y9ihgyAE
         SZx90+Hf9GYM5bZUFuZcbEUeUppxNBZarhf1+N4bn9rx87VArBWHy2ieTJVL3BhxKUyy
         Rd9gxlD0/aSkAL+a+Nv8r1PCT+vCRdLZGZz6pYpmUMVkBKasCL44q12sukDX8hgq9zjM
         p0yXY96x03jK7tY3E3z6Gh4tFHbBjXcEfViMmJqE7XVdk/5c2ZPzvCsMS22euxfo3dHD
         gGl8IG/JoZGDvXMs+Z6ypKuyviRhEutyrNaPL7dUhCkgMdGG0tBbCGWFLJvGax6YJ8yw
         q5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333111; x=1771937911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Igk+MqdEWyha1tqc4qfOt+Li/8rGnpjhDsVBz3qVkg=;
        b=laGbRGnNkES7L12kwvBE7R29NDZuYkc3VXCGe9+jHWmzASI1E+B9Qd9pF4KnZxlbfo
         5BvjzlYvrYDe95b9bZJ2CUAt85YCNpL7UNeoYYxq6z2yrfEVPiGUbc4CWCapc0KtICjw
         uMNMQrbc87KroNURQK5Hzzm25FjCDqLMOEIqWUj7NA0XoyGr98V753HEnGSxRJm/y9B4
         R39JpU4FKESiV+hB+UrK/Eb8A41hd16tTTi1RY531gsScxgTsToYiaRbMsKT4QC4wezL
         BWcII+cZ6cmuY7IbMwvrsHDMjaLNv2w5bQg3DInefSAl+nifUhriEPtUVgEzYzwslyid
         fmUg==
X-Forwarded-Encrypted: i=1; AJvYcCV84Yn0doEHQMQ98cmobD4rf3ZqOWiJGl6ZeQSivTQnzYNmHs+cfmkGDtmHuttk3uHrEjjLZpzbuMizZC8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3BPF3eR4ef2//VH38R1osncWYyrTYt/U/+5IvTPfJCOIHhDpn
	jDyOhsFe9wZ3RXnvCCJS/gA0/qwGbCVNwuVweinFhPUQnNPN21YGFxnvvPl3Xwy140lxePgBSF/
	SemLaAbrCNoW3ACSQWUemnDVVpRlC7opKgn2QbUMBWTK+J7X+pXvSAZe5/HMPFpQ6Yj+N
X-Gm-Gg: AZuq6aK869VkLjZu6exLzr2yROyp17A3woTt7scJMv518QkX2PJuWB0HRligRtlIvnV
	6exDeEWzYc4PmOQ/gzqDcsXBK7dpoVuqHgatSI4sjtecXfe709Gx6PRjDAcUxRiAY2VuP1E6A1r
	5ZZy9fhlXcK7Iwf1AlYtNSnxDUaF/ZMOt8JKzEFKj464x8HTP2/o1b/htXnwx3+cuc4uEei9+LK
	Bpk1KKnjL7Pe6JnZwxq9mFMW6bhGd3ykCFJ2MwOlPCzlKcODckiRCourHh0wshgz24uHXxV+AEl
	R/gheftlcFyAVMTHw1njaSkp0Wk9ZNTN2cbQwXyTVQQpB/FTNIOeqbWEJcP5dnqdgED52BlKpxz
	l+sNsoE0TtDFXfFNpdzvi40glWjjmzp7xvOa+Bg==
X-Received: by 2002:a05:620a:25cc:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cb4245c4e8mr1433575485a.59.1771333111333;
        Tue, 17 Feb 2026 04:58:31 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cb4245c4e8mr1433573585a.59.1771333110925;
        Tue, 17 Feb 2026 04:58:30 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483801ff9b3sm229088465e9.13.2026.02.17.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:58:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: interconnect: qcom,glymur-rpmh: De-acronymize SoC name
Date: Tue, 17 Feb 2026 13:58:21 +0100
Message-ID: <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=983; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fWEkW6ZH8IrJFUPnlNKjyivLp7F1ygXj6utw1Uk6dj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGXsHSTo1GC4fIn3OBz89yPOIDSjGnQ1kDbAM
 zn9RLpswFCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRl7AAKCRDBN2bmhouD
 1693D/9CeHeH2UDnTkyB3RZvdF0j4CQEykr2vixREb/a3Nmg38Lm+Vfm+L2aFRJPuBd0ylpdEIO
 8AOcS1sag8p9OCjhT17WKDQsFCrGW8Wcs3OtQlT0sUwl2vh9m+Jlf59m/NoZLAMmSYo9fyjka6Z
 gJ99e55jAB1kfpooNSLQ6ONP/49fzrwJhuxghwbuHW1gvlfuW6lWEMoZGallBrrxdQ5blKN8imx
 ulC7f1zyGS1833XTfPDDBesw7J2kRjUw/Vxy2OTlDZzAO43ILj0r1MsN1i1NIXG7NbxREgyHGwy
 etvcMSrAmiHJz4pDu55mGXTC3CyD6AzP8OiiiUut7XU54zESISpJoxU28Bw04kdpe3uVC85cueO
 Ek2f0aKy/Ld0JyTRhOCv5m8s2MkXC+IgHwxb8yY2mqOSU1ht5vL+y5ko68e1wAFRBQ3nsLB0dZD
 DGOdlhsTtqhDDYZH8+29ySJb7xKV7rFmqw38NYnBGJKFGXUjIXisNFojZNESER5ZK4k+reJpE2q
 MepS0o+58qX7+yS6dGuWdrDAsaVa6byMZuYrRZqlOTpQymt58TZwTTLifPhkYMfpCiYvVe2oKWC
 tIf+K6cBTMKTVEparqHU+Jy1NWYEqbC0fWp1z6HbJIlKaN1YGwZwTsz5IIXtmbyxswoF9GErwIW yYHoUaOJcrxOHcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX6lNCCmbiCcIz
 ifxict7bHwJRsa9p9NfmLFAdn93bGZFXKU/n4vVDPD/YnD2dWf3YeWna7QNcG7T3W0t8taq/IQH
 LxImICKQeTco9PIsuxmoJ0+a/syuT+DgzdGAMryNWU35iF7nJnMFlliY+kxbFPGofs9uGOxG12Z
 vv6hniYZ6m074i3h3LEYTpPXI95m+wkrBnrTVLF8Ch++AfY+sqHOg+c5NQ5jLrNHrtGRapi7v6D
 yYrbAqObEz+egr7qoyDd1zH1vIUYQycDHH0HjSQwXc7qZWlA8GceTORfg3MY7/GZq9IYWBh8LbJ
 Vd4x9KReXzPJQTvk0IH4w9zQSa43oPrkoowDmYBXAzrh+YPn0Q1FXMCJiadh8T3M0PVkkHagGfe
 n7rQnG17GComv3DQFpDNgAyuIBKqhfFH6l3VS3Jn5JoNPNKQPYdwnS1ExgatSYIeHD7gLsgfKx2
 zUDue2zP7wZJHJJM8YA==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=699465f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2jho0oskUDxAPustTKQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 6XJrLgL6h_b-Krlb1aQju24CEae96vVm
X-Proofpoint-ORIG-GUID: 6XJrLgL6h_b-Krlb1aQju24CEae96vVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-93164-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FF6814C361
X-Rspamd-Action: no action

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
index d55a7bcf5591..65b0ff2b2c85 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm RPMh Network-On-Chip Interconnect on GLYMUR
+title: Qualcomm RPMh Network-On-Chip Interconnect on Glymur SoC
 
 maintainers:
   - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
-- 
2.51.0


