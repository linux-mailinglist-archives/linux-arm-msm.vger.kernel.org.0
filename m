Return-Path: <linux-arm-msm+bounces-104590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H2tHIG97mlQxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:36:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF146BFBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44F9A3040441
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A00225FA05;
	Mon, 27 Apr 2026 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbY8eZuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxynlsb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950626056C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253572; cv=none; b=Xaju0LmWRW6uNMs2gkd3JT5/YvqNB2DS08L9GjaIrFflcOV5yJOIUlS6/AV+ZAxUvlbYgkJf2gN4VGvffjkJHpfCrvLXsjMcNmK2eo7omd2tvruEreZG6M9p4QPceBL/h+knM2r5XhGtHsATkq8Kpe/HR0hjeNm4xi/1uDhoqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253572; c=relaxed/simple;
	bh=qdgOoJPrYwE3M6SbNj/xaSbJRAJU5RxLjx0JdrgyqQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4yL6k5lZcUzlqqd9ncMBIQ2HuaHX2XnVddaCLnE5qLV8z9SMA7wqEuaUnvVERMIEyQpKxuTntc4tUoitdNu/fX7/Xdxbkm+ByUhW0YUZUjFPqdZJpQUKcvd+WD8xacVz9EW2YM2q09IzuuIv89GkUfTtfLIQGxQFy9sDVU+RS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbY8eZuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxynlsb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKDOK44128510
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sOYlVc1RxI7zDZA7t4Xs+obBnFZx+Qhmg0M
	MpXOIeLg=; b=AbY8eZuHsV8aWF5/lnxGTV24OoslIEorh0myXDvEATwEM1I8Cav
	E7anwz28dGFPAHHzKRMYUEkP1gJWmfSglzn7/QvhTvrn3a2vlHPSiBIwkTsyYzbw
	qTeZ8Lugpfq1ETaOGbLsOa0J0xoQvcIIUBo31lxQfjKP/7cBi0Mc0f/o9RHz8FBu
	H0ydXhwIjAOZHoExjMtibe/93qlFUWDUjBYoS8qsjvmm1TYTAZnVZF8gDA8q2AC+
	13/B8RqdczheI/Gn51GerNt3FStxEvgEVeFYrvC4qvF1ninA5n6Tin2i/gwIvv1e
	UE/YNXoGr01cIQboFWZWHKz//itwjdt8eIg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrkvex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:32:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so26900329eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253569; x=1777858369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOYlVc1RxI7zDZA7t4Xs+obBnFZx+Qhmg0MMpXOIeLg=;
        b=Bxynlsb0UiSxrrL7NLbEz3qSoytqs6v3nDnZ4YRIfWh3CvezCQr2kZ2zWp0NUyiH18
         5Ao9bjt0SrSq5wT4NYqPMZyqAP0MeO4ERQShA5jpPbN1Hz2dKBQJ7qD/0sNXCILdEJjX
         bmCHZx4a+mMIj2LgMI2bxWObos5BIaj2p9Wnhvo/7WxGBHjbWQNqIDiyE00m4DucHoTi
         +4zsfxCOF9XrzWRGfpUhgsbllfJYYLdc9fp7w2xQF4dMyKh7xV447OmlCOfIn7RuRZ1U
         m88Jg5tY/5vWzupp+x9GGNQ68uGiB0KNBuAse3W3dE/HfUVWstg5t1VVfbNABmWdgKJC
         pB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253569; x=1777858369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOYlVc1RxI7zDZA7t4Xs+obBnFZx+Qhmg0MMpXOIeLg=;
        b=OK42Klmo+ijc+Cs36BhJRZhfYIGgXdqTQ119ZO+BUJwedgm5ZQvzCga4eZqt8V9FVd
         TJEnesmika4mTaOoEeqlmCwamBcOfXMjUnVFQLOwOOxqQOEiMCih4FNRQDpwbWiUjmyr
         hT+icfPpp9anD7+Oucz5aMLIbnf9R98PNyQT/tbbG7o6f1RC752B23KHzhmm8U1z94jO
         t8qUyT7fR837UnMVGiUBDmZK283zieQFu4manc/xNGvg1BTCG6eWhwskFunxs0XyRfVw
         1kIlmn2X/fEZsrz4yZnnVWNt3MPDNAoR6gEUmeQCztMH1c9v7pITncdsgP4yby5KUPGX
         Ppgw==
X-Forwarded-Encrypted: i=1; AFNElJ+nW4gaQaAYgqjw0ZaNdak65kALmLyx3tZy/t7Ao9tQ7E0Yujn019CoXyYCliM+2E2F0b4dLR8UMHGJGX7K@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUpqSRJq9wy2yz4Q++QvhkrBXHm5k8LwmxMYgVtya1ebWbTSc
	DaoYZAGHbIf8UWM+offHMz3+oZS0c/QaprT4N2FqJE9H6JthG71XSAvtPADrnpKbQbc0MIke8Cb
	cUzIsmUBkhCXmkQjQgQKdTrc+O2IcapzVLjyPx7Lz0ExYdowm/82yhaYALe9PKcIT1DYRtJ8Q/z
	/c
X-Gm-Gg: AeBDievIU7QQidPD5Md2VdLWB1/+x2CaxfXYjp78nEVKF0rdzEWrkbVBBQT7zm37dcB
	qXDESj40UgsxrM4J1Xa9YrOaJCzLtPvJILV6SKQ2HaFkvdNy1e7yK7yi/aEpKnVZOCkkWVm0GpN
	Ke5iM7lO/fnswn80ExlZnK212yDoO4etFoS+E00/QS1MMsEpU0o5pYAIVPYiPgAWijgCqOqU0yV
	uH6CCZc+XC4cjPd5fuIrkhdih4ITSes5+c8AJZiCcWYoqi12WIqgPZU59NdFTFnXkLXZ+bO+yfY
	ErGBMtdg5Jz3G+m5PJgM4O4IxcXPjZTCaP/lg7WiQWY3yKmWeuclLMQX6f4+N5xVuE8OLRWvrH7
	c3NaToE4BDAqLxHNMCpANZ7N9RQkVMqdpvs4h5WRSN3+yAZ7gFCDasp1Fjzvm+3uOG/a8Dsf+Td
	Wmm+cB/hnJ5H/Svjog
X-Received: by 2002:a05:7301:5784:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-2e465293dfdmr21456630eec.4.1777253568722;
        Sun, 26 Apr 2026 18:32:48 -0700 (PDT)
X-Received: by 2002:a05:7301:5784:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-2e465293dfdmr21456609eec.4.1777253568236;
        Sun, 26 Apr 2026 18:32:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e79c2954f6sm47558002eec.30.2026.04.26.18.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:32:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Add compatible for Nord watchdog
Date: Mon, 27 Apr 2026 09:32:36 +0800
Message-ID: <20260427013236.231841-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfX/tPSlaZbNUM9
 TjIP/fbnG0SDgg96x5wTLMco4OnSARfOj92KkqX9+klCkWvt9eO8DPPDJ0twOG4fLc/zAQBmuTr
 xwjRqrcasdPsRAMYGkXk+xLzSHlNdcxTp5bxN19ZfE6I/B7I8JMBpbC6p3/uZgRqi39EIIGYzn5
 lmIHG7zcB2ozL1IG/NPbKOGlzAHRAQJQPWkVuq5fXLE6vNhy9ykfZIqB9I1Jd5NHefDX4vbcQ+/
 NdbSxQHMUxp8xTWhYwDhG+ZSLmzyztplmFqJbYFv3cydqr+M0gkEszsVGfEycs1tRgcJQIJN15Z
 ySiN+/MgeAQ2/bofcfDGih3MX2txllmMbSENQ0wWDNHm2fBEnsYzjV3OLkwaLgJytM0Jsq6Uq7z
 y/clkpDQ9WHLNibjvo+BRX7LDydxyU16P/gsVklDfZKZJtMyDgmNR40eqPQqHjlRxhfp3dRzmnC
 SgllZ8M3NA3XewsgKmw==
X-Proofpoint-ORIG-GUID: TXo-iwAs6aNMnKFq1uZes6YLKzxRrrvx
X-Proofpoint-GUID: TXo-iwAs6aNMnKFq1uZes6YLKzxRrrvx
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69eebcc1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vLXAFcHGVjC68m0yDQIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014
X-Rspamd-Queue-Id: C9AF146BFBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104590-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Krait Processor Sub-system (KPSS) Watchdog timer on Nord SoC
which is compatible with 'qcom,kpss-wdt'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 = Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420114950.1253792-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..f2e6091902b1 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994
+              - qcom,apss-wdt-nord
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-qcs615
-- 
2.43.0


