Return-Path: <linux-arm-msm+bounces-90150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KF8E8zvcWlKZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:37:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244C64A03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1CEE95687D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C533A9627;
	Thu, 22 Jan 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kte+yHGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaS/q97+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516CA3A35DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074156; cv=none; b=gbqHnrWLiwqN5O9SVGFPA36h13o2SvxSlxzZheXJMB7iWBaUe5cFFJc4PbPIy8w3KPjWrE4RRsCK3W1VWZpf29vKGqgGvRxk6A7+PZKgZ+SVj7KJi7O0UhFVXV5vFtKirFUW4KTEu79u00W71GvmEh4gTztdmEO3AXi1Ie7URWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074156; c=relaxed/simple;
	bh=pKJ4S9Yb5F8U/tAd8XG56d8jkvFTawkzeviPDJYVaI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kQqQeWkGsPtHUmq6DuLMOI2M747dGaQpIXWEIIS9Gmna4S8ilpouqe4cGCxpSX8+w/U98u8r0eI8wuB1LJA0uXLKYF01rMUWGb47i4B8MaeeisndkiWMGMTfDz1D/s5q8tpRncDcuRdvhcf5jVfeug0Xr7MWGf/9GYL8MjSZsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kte+yHGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaS/q97+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M85Chg1407419
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LZubwcTjSmV
	mCnfQ0ThfmfdbWaI2XjiaGGGtgqlveZQ=; b=Kte+yHGaaB+CJe3yRFQvO64BKD6
	Sdijt051Ut5eoHimNoH4PzjfiHWEihjrKokFk5/h0kcpWfml3FmttTcdKQMHv4Zh
	yjrUoU0TplkZMStlt2VRp4TtShQQjYUOfAz5gEwzpJrxI3zhSp/jxqSBWBYBOg+J
	b98sEWRVVumNJXI15V2qhtMWycd4EOy+8KZIBqQjAO8joQiTpa2jyo4QFbBvVnQH
	YxXk2PzwWzmGD9D6TlsahCVd5+99+RiWJUPBwHQAZr40Y9h1k+uHK0wezn9wb/GP
	Sa10+GGUds49BcY5sKz6VUe7atTKqgLgEUXP5x/9nNuBUeeOnxEYzfqZYcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu802spx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c3dfa080662so481397a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074150; x=1769678950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZubwcTjSmVmCnfQ0ThfmfdbWaI2XjiaGGGtgqlveZQ=;
        b=AaS/q97+nHJoY2ua98q6AT7NNYxiyhaMY8PUNSHsOKNcxghw38ShOfnsH9qhbBN4Z3
         5qRCP/sXye+lr2z44Jx+B5Ac2sgNEV+ya9cp0yjpZBJymZR577Ar1Z1wJk3rCS1geogC
         jXPZ9HGdy31pQgx8LaivgudfAadFbaUXUAdJE5QL845cIbfJt0pac3pa5DU9oLMYAAdV
         m8SAYItDWs/QvbIqa0soW83lWJEJjrYuSsiPywmkfCUDkI0VUrw6F8DpeZA7slzREkdT
         LCuocnlcNhLnnnOi5D7veRT4TuGf+InkOD1fuCUms419x6xjK3mwPkRAl5c2XRBn6H+A
         dZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074150; x=1769678950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZubwcTjSmVmCnfQ0ThfmfdbWaI2XjiaGGGtgqlveZQ=;
        b=fZ0N7J/OBKn8kLSYYvXoUIx8qngu6MKhLMfn9OnPQFJvpZhhiKzwGMxhF9F08ZGv7E
         ETgCzOD/+jshLLOMGQmnNkztkmQ1+QmRdQiLqOYFUNKLXK7tldn/Mphdii5BAUsfT8Rp
         liWKpSZbuOv4Yu2VogQwVy8LzQ5gSTE9iadk7Or0uW3/aaEPqSXsucJdqoO7ykqrRNBc
         fZv5neeV51SdLGCZun6zsBOTHt0Cl1xlTX2r3LsLJS4u2tkVSxxtmiK/yFuza8DGDNmQ
         pI4KLzXLKO58HTr499vphxSEWP7S54lx5+ymOCO7QAVQeW0MO2bqLSNILF+AUQt8OG0o
         kUdw==
X-Forwarded-Encrypted: i=1; AJvYcCUIB1VFmVwYUgDPK4L+4H+igFk9hqWMG7bgp4mCffSfpKyVy/88UJr5UDc0Wu2Q/N2xZ/YEh2V7U3t0Jsmp@vger.kernel.org
X-Gm-Message-State: AOJu0YyLr3J+ZfCi6wrErO3KajHWpT9dISLCoQZVXqKWSUMwntf1G+vS
	bE/qhgTYWE0k3jNOEt8/j5IRZ4edkM2MS9faHSgXUa5cJU44un5cPwDECgZ98p1NFFl7WfaNAI1
	/TwEVgJXUNgIlrN+XN1hJmu9Ptd9dFWqxaFakyQHv9Ieaa/Do+CwuN/Wm6Hxg6VmlrOaF
X-Gm-Gg: AZuq6aLbo5n+hibbRKFW3s2eS4riRGcTPgK5Yz9fap2C3x6qMyNlrzxGMDCm9zeH2K+
	/csXMgzvPqKlZfQmj4uOSooEXJqMCiluyuXSVoArWPar6kpsM9OreS7LeiexcD/gOQkKtKVgUhU
	Oft8UOrIesxlCBVCz1yDWPcP5CzI+phx5PUNhC1Rxrpi6g7fnr+t5KnlWkqrVTkjG5JFOUsEcuu
	82RA5/fp00c/VLNN0s18wnDkzUpF0+MlSgl1ThDSweri+ufcwW3xhZuKAopNxuUIGEoMv15AMdh
	bqqLWAB72fLlwoHIYPpe5eRGYf2btkkm4LjjZ500LJloO06v0dhLEMT5ygFa+xMNnEfzQpT9TOp
	VttMwH7NcVehHQMvR5Oosw4tSHOz7vDM0rfRWii96rbw=
X-Received: by 2002:a05:6a21:6089:b0:35e:835:7ec9 with SMTP id adf61e73a8af0-38e626a462dmr2196917637.17.1769074150118;
        Thu, 22 Jan 2026 01:29:10 -0800 (PST)
X-Received: by 2002:a05:6a21:6089:b0:35e:835:7ec9 with SMTP id adf61e73a8af0-38e626a462dmr2196885637.17.1769074149619;
        Thu, 22 Jan 2026 01:29:09 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm17395247a12.27.2026.01.22.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:29:09 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Thu, 22 Jan 2026 14:58:49 +0530
Message-Id: <20260122092852.887624-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcWbdBQh c=1 sm=1 tr=0 ts=6971ede7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1mrrX1IwxDsCUTwcy_oA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NCBTYWx0ZWRfX09U7gC9CsG5J
 BvnwL67CJF7a8BMb0aDdP9BL4b/4cLoosbuU2P/xwnvU+roB/E5ZEQcyxykf8wMFd3TbIeeYKv7
 JBgGjPQkdrZB/wcvYIcnfSfPbWLVJbtgbz3iqEA0Iri6L1hM7AXfDGLrfrpekPY+yIixmIlFTz0
 4sWTb6jExTntfrbfluFukho6ZPlO/fvymZjpTRtkRUsIDNdwErUhrlPBzI4U2yfVcJl1ByjhhFo
 aDWFtJGtAfA8zuEfO8/o8T4/9MzKZEWQNTUBXKsJaNOYznxwqN1DFLLYhjZBVYcF/xMWzFoGxvI
 CQ7IxhowOY4FhbxL9U3kHkBblqR25AvdyVSg+IumdaOUoo/qrSGfakeDXGnwQL3irNPaPlZgSjJ
 /SijwF30AHyuzqz6JOyi9AvVee3KTJQmrPoX/gNbDvF7AX3XZ0dECQrxA9YLpEW7/zql1dG+r0L
 kBJLt0f4/kgNKJW8bPg==
X-Proofpoint-ORIG-GUID: EO7f9ZwR3RMMQQp_nAWZnd3JgvRgOfyh
X-Proofpoint-GUID: EO7f9ZwR3RMMQQp_nAWZnd3JgvRgOfyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0244C64A03
X-Rspamd-Action: no action

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../bindings/usb/genesys,gl850g.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..6ab13785e832 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -56,6 +61,7 @@ allOf:
       properties:
         peer-hub: false
         vdd-supply: false
+        vdd12-supply: false
 
   - if:
       properties:
@@ -68,6 +74,19 @@ allOf:
       properties:
         peer-hub: true
         vdd-supply: true
+        vdd12-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+        vdd12-supply: true
 
 unevaluatedProperties: false
 
-- 
2.34.1


