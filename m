Return-Path: <linux-arm-msm+bounces-101666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMqfMzvMz2m50gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:18:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE29395191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBAC309CF31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0D527FD5B;
	Fri,  3 Apr 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYcp/at6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL+4p3xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B219431E820
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225479; cv=none; b=F1xVE/852rEJHY7VTUU79Mqa9Wmf2Ea4ei/4gqyijF4NZfquvLt8u+pFcU69MjAWemVTMLrDNcyc3TpQ64Bq9rfoZAeGi757rLsnPjdP3R8MZ83ZV5w1ylqp+YUYLvIElWePnLjvoHDYGF7+GiyNfPFdQCwbp1lEJffMbOXkkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225479; c=relaxed/simple;
	bh=bOXv5no4MAWQOEW9V06BfniX4jR7WqwQEv8zNJzFKjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pc3JwW5Uu+SoIqAWqBAT+NjVOKOUXl5d34pKTBSNRkJyfb45xbIIQ/+/Iz69rAKegX5qR/O+FI7pc4q8UXxbdadTRYudQuWwUfxJC7z87Sj36t/1mt3ZoOlz4fJMJ5kgIyue9kIFpm6KUvWRCCOyE64vKxT0Ct9szlV601Fx/U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYcp/at6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL+4p3xr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1du31453232
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ak0121RuG6v7YOkffH9TIK
	cZmfyYZTZh/TEYYgpplzs=; b=EYcp/at6YkIud9Mw4d7e01CnEjmOCwqteWpIio
	JvwuaVE/SfCd7F6nsJ8uxxIu3OLR0QqYvEdBsz7w/ZVJNOCTlicNgrIuQpIZnq+P
	OempG9b9I7ZNF+YTHRFKX2I5PbfB2gDXIuOexUYqgjdtCzfj6XfaQI4P436W4jwK
	QnRPffXdKyaveddgpYd86U+lSNbzzsYTCIq3BatT4MHSht7wXLwTlaY5N63zDFVO
	shspOHYIxW++nRZIgFW0OkWlLt8yCFkZUhbc85NXQScA4JCFgFJdVoBEdaVo9xIv
	o0FXReuNruf3e4fezcH8Y9FEYHvLGTstSFgKdXxBmgWtTTBg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam8g6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:11:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-948476b92e8so908314241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225477; x=1775830277; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak0121RuG6v7YOkffH9TIKcZmfyYZTZh/TEYYgpplzs=;
        b=WL+4p3xrAQSspYsizUnRWnqO9ahNdo8XvDDwUO2GEeogOhT759KVQ48SXKXSdYS4aS
         GPi1M5fC0zxohisC+U1V3zyrNH3jAtkCBwxTo1vVcyxn1ux38Qdk3U/b8TkLSpD22iRx
         ohygXkpV3AAe0BImZyzJe/dYWZUM5PKORG6eQHv77CkOnVO4WcKdWjnBUe9cH5yuEEG3
         cPBR2o/QpnwznxogUjsQguxrW3QuWgTa/zaUExfHWfo6nU74/ZbeK2IqS6mP67bz5bq3
         FVl2UdJKwzeyf4Yuuf/WV5s70/Lqhqdz6Me92zWx5rZttsXHSQQJGYmkRfl3PWY0H0mQ
         pQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225477; x=1775830277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak0121RuG6v7YOkffH9TIKcZmfyYZTZh/TEYYgpplzs=;
        b=ZsDg07zx2MHmi3I8/FReYO4LnOvGsYGHPGFnPGQzfP4l/Km6PTsUUsOmIJixtCDg1e
         mtqCB77SN/FefoqLv/FIhSKbFYlVqJuMGoa2k7Z8nPwb6lMtCKU8QjbBgOaJPaW+rJXw
         EsXsvTc7/Y5s5h0B/vKY6obSdsgUTx8uJmosikAAUUtyeQ7Zc+yAE58L4Ql4ZJ+r0CzV
         EPyTppmCl3G8LEeKOmzMgaSLBmE+LlnhAzNW/pAeF98A9f5FETtqA1HABvokTbA0Nhsh
         01mRBHxEyiSaU1CcqSgRi4l+QCcKebchqQFZc375+c0Rsjjxlr6Bytrh7GSyCCHIkiGA
         0I1Q==
X-Gm-Message-State: AOJu0YzJHkAKVaAdc1NIEAi+Z26zSyS5VelmAuzN5+OAMa0kEg1gNh+k
	DzrwqdRTFtWieqCOe7gkTPXPU3Fkz3al5xD2mqCJvjAKB/ZaDwaTV8TgD4RWGRYH63oi4/2yOIG
	7QPrIALg/OUP6UTSSaUGZsZAhkoSyayFxnJjZTqVTGZ7TrNsb97dagP4Tg+c9wkOosN2+jtztu4
	hq
X-Gm-Gg: AeBDietVLgjN8/8MbDwi/Dp0f6HJOi74QzIOs8ZFCancnxbKTyxxjQvzlCDsmL8vJdn
	g1x75WKrYNJUTSEY7O3zJ3GEI60AShWdSM8GP1S0PK5ubMiDCAbTh4DR0SVdfg64lkWMhJKMFD7
	OyV6IG02iD9JXVc/qcodO8F2TxWxdMYW5X8uygXvZY4G2Q+4DVtP46r8KXhidvZwJS//nugnHPu
	4qF/tn/l9FKFPGpmMKAN6K0CUNJe6dbstp5OAQ90qBnrvA8UbYEocJi0M+cshAdUQAmcGvjspVB
	vdKtCEtLFwjqNCS2p1s9//ZR3NcgbKa+bn8MeajP8qQ/u/aommueF/9kBFIMZAUhLYBXe3uOYHA
	FMITd1czofXsUbl9q4i7+U9iHWRduI4O5s5QqMRq9j4pHrvr3kpY=
X-Received: by 2002:a05:6102:c05:b0:602:a9f3:74ca with SMTP id ada2fe7eead31-605a4cda9aamr904521137.3.1775225476816;
        Fri, 03 Apr 2026 07:11:16 -0700 (PDT)
X-Received: by 2002:a05:6102:c05:b0:602:a9f3:74ca with SMTP id ada2fe7eead31-605a4cda9aamr904512137.3.1775225476386;
        Fri, 03 Apr 2026 07:11:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/7] clk: qcom: add support for the clock controllers on
 Nord platforms
Date: Fri, 03 Apr 2026 16:10:48 +0200
Message-Id: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjKz2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3bz8ohTd5JzsYt2UFDNjQ6NUw7TUVCMloPqCotS0zAqwWdGxtbU
 AOheiAFsAAAA=
X-Change-ID: 20260403-nord-clks-dd6312e1fee2
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Prasanna Tolety <quic_ptolety@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2236;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bOXv5no4MAWQOEW9V06BfniX4jR7WqwQEv8zNJzFKjE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p2v0k2rAI65RDWxc+efefhhHyFKwStNVoEd
 2l+pclv00OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KdgAKCRAFnS7L/zaE
 w4o/D/98MMzUfvftRA0YBGho+hJx/yGRnPaABBnva5bGm42lmB+hhbf0MFNI6A/HYKcH1C8VTkt
 kJk5uysIipeTyeQesyPy5BSgAQM+PApgxWnE0HTA309RvWzPawSfxHjg/eHb0+z+1oEB0v0/Xo2
 20Qm2yFIpEbOF7JJ4xXZjblyYV0QEsTNP/UQyjhiio2cNh0cklLE15szjLgfZKmYO2PpK0l/t+M
 RB844d+Nh1NxDXYkeC9u8iGsL0QPMf18B4i5td2RiTbXEBS7i/W7EzC3T2NBBxHhMU+EM9ij32Y
 EpOB7JHY7TOxzIv0XMrVz/sP8U4lAMLMT2/PAmP/8P+dqGORodVkelbv1AMB6EERya8NUyJBg4l
 TuQr9+Nwkp1jDGDDHWCl9fh1BRGySxPC0BGQg2VtIaCDWWAioEsJmV++KkpW7H+2yuODXAvSsqN
 UXFPFIrxXe6E23aaZCmYHR/8PPSnlWp94+r1/pStBUvo72BoXzfh37FVcMg/Tzc3LbzVttyIB7s
 6l3xGmCMxm/qJU/wRsFrTT3t8aFyFFFGFs84QURgXHdwa/Fh+clpIMatDTcLTEVgKvE3esldg9/
 E5+Qs5DHwxGUxb9eBHHHdQX/viCvKIr1ONaQeYothyw1io8sCLSqxzg5BJXpWE7tEKc5hhoiSGO
 hMLczT8U1aFX3nQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: spmn4CQrwwZHsuQL-jULISXbzJe4Jr1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX6Fra+vjhvjDf
 RN8nphhgjUN1ukC2iZbsIZ3sHBWAg1UDoJhgtD+Mp6uZyHKIAFhSAj9QIjrGiPQFgPPAZUDUHpS
 UGZ+/WmJMgU9cFjM1wHdCxEQPBkxTXojjRjaagFqUHbarVs1u0HXIuKIWaOsdZkgTDTLvDrV5zL
 E2c2H4o4Wy2JU04zdtXYH41ruSJPHQ0E8iB+d9pE9svRlqnlYpyDRkIbG0AiVhJHd0XPcjfubQY
 xxPGHWYsZM+l8SRnEL7PKrYnxN11wZukKQkBbHBvYS3jz06RAHzIozKXoPIlvojv7ivUvn4lMYH
 splRgIcayIbWxLlbX5n4KNPM2/GUzmlBI4CR4pih8o1bQHFuTQFETvdZwO+2RBAbsztuDtPmeqX
 Y+LZlM2sgUTCVrIfTA6BjJfjM5l5CA2JtOvRmFK5GWIzyx+4jmw9u+oqIgany8+Gsz+TGd1+dYd
 NFH+EB4gV08o/wgZQUg==
X-Proofpoint-ORIG-GUID: spmn4CQrwwZHsuQL-jULISXbzJe4Jr1U
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cfca85 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=j00SveKyaAADyE5UejcA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101666-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AE29395191
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This documents the gcc, tcsr and rpmhcc support in Nord platforms and
adds corresponding drivers as well as enables them in arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (1):
      arm64: defconfig: enable clock controller drivers for Qualcomm Nord

Prasanna Tolety (1):
      clk: qcom: rpmh: Add support for Nord rpmh clocks

Taniya Das (5):
      dt-bindings: clock: qcom: Document the Nord SoC TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add support for Nord SoCs
      dt-bindings: clock: qcom: Add Nord Global Clock Controller
      clk: qcom: Add TCSR clock driver for Nord SoC
      clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC

 .../devicetree/bindings/clock/qcom,nord-gcc.yaml   |   58 +
 .../devicetree/bindings/clock/qcom,nord-negcc.yaml |   60 +
 .../devicetree/bindings/clock/qcom,nord-nwgcc.yaml |   55 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   20 +
 drivers/clk/qcom/gcc-nord.c                        | 1901 +++++++++++++++++++
 drivers/clk/qcom/negcc-nord.c                      | 1987 ++++++++++++++++++++
 drivers/clk/qcom/nwgcc-nord.c                      |  688 +++++++
 drivers/clk/qcom/segcc-nord.c                      | 1609 ++++++++++++++++
 drivers/clk/qcom/tcsrcc-nord.c                     |  337 ++++
 include/dt-bindings/clock/qcom,nord-gcc.h          |  147 ++
 include/dt-bindings/clock/qcom,nord-negcc.h        |  124 ++
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |   69 +
 include/dt-bindings/clock/qcom,nord-segcc.h        |   98 +
 include/dt-bindings/clock/qcom,nord-tcsrcc.h       |   26 +
 19 files changed, 7203 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260403-nord-clks-dd6312e1fee2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


