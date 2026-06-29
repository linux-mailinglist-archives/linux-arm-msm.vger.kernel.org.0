Return-Path: <linux-arm-msm+bounces-114821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id es7tMPb2QWokxQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:39:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792A6D5E3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:39:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YMBDETHg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aVHY7mUj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114821-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114821-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 086073024159
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB22433689E;
	Mon, 29 Jun 2026 04:38:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7E37C924
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707937; cv=none; b=iLpVfbWxt26mX4fhFS5yu2aOsPEur8kGX8I4fnm8byvhYrFiLWfFGteucKBCjFR6YHsQauTZmsWyix2O7k6F1Exwt0fFsmc3b092YVbCUk3J69PBlP7b1lFddZ5yh7VMW24l1d2XeFeVq64YTFys84+bPurdJSAlSnFm7w84IjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707937; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cu59tL38rppY4ZkJ52O8XyW3XuKoFAXzNx5IyOrgAAYO77hL7EzAIdUIJsvdZs8gOM9F8C++zqRgaLnlKyRVAe8nhTR309dFVtYBqsfARie5AyBHNkRiHwnRjudjtQrTeRkwsaJ26XfPyC3NGTU+tyvMgL7ckrFERsmQvwaZX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMBDETHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVHY7mUj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NYxg1777447
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=YMBDETHgScnJD64z
	7VjJ0jJEx12BuwogcwIhsc3QfJvf6QMFB8DaeGp6HnRGFQ6Iss7BKEv49t/BylUa
	8vscXZ96OwJ8QnNvnYDY77c1vi6UEzmn7kSDJXqozb/mo4GjifEv2v23iH8vc1yu
	g7fgYWXXJ1SFzFFQ1rw+U7knli9SNQPQMZGGMW03jNscwEF7mSW1LfzZWgL9PrK3
	N2KAxmfV8vTAqRvHoAHnpgr8CWfugforPpXvUPFTY0KjPCjZMOXntkh14FfHyf1O
	bSzk5w9gjxQ1oBqWzNP05p2Zew/y6j396cSQOYowK7V8fct5Bw3RqTSg+rRbGP6+
	UG/KOg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8mh2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so13530780eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707935; x=1783312735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=aVHY7mUjIzVVQ/Uk5X4/cicp7bA5Uj9uE5QnRdIdV74EfSWLp68Keb2fH9TreDLxIB
         i0AF+uMnnzAMguZvx8YGoQadZnpVphHYUWNckwbUPfWmaVhHFYF/wtWcqO0nYikE9V2f
         UGuO/kPAy0z3TgEFqsrJj79CeMHDZaurVZsG7G5xueqKpyZ/8bG9sUgDeh1sC/3i9ZzR
         zOuGWc+Mxrio3oBpDFX09HA0Bt0ddM2Etd1nN83qRgX+M8UxB/BRORPigLZ2BV4CzniB
         ZyvIJkfJZhJnkh28bvfxcUPVNEz+kaTZRUpJJceZH+O8dEm83gZaBbNlPCb/PaAUBuI4
         YNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707935; x=1783312735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=sHpgdZS7JlPLwM4F6+pntlJMlZzj/aCtz0pwV7oBZB+7ZJqmt0jbw2vWxLdFolYP+H
         e/5Ie8ATAj2XC+KXcsCLB+CXRGgB4c8MkFryROb2QvWQJ2TILkAZkI7FX6RFZhqt3L/i
         gyl/F0KEhqt+easUK7REz58aTfyi4EyqZWEgu2cuWhz6ZZIjmYfwSi4dJfaYSPer7sp7
         2Ttl1/qMKngl5E/hERElsgslLxDSZ3tULi1EPd4K+7fzJ1qpMrOFhc5mkH+wguKz3z05
         cBtDvMQJ/459q9P2Xh+q6BQGIqWaQVg2Aby2m7JqrXwsG8AYvVM5NnbEQaiLuDjUJ5aR
         jShA==
X-Gm-Message-State: AOJu0YyjroDsitp3w0+K9PuYWpkApgZh22B0hGu0/oJHT7cj5gkq/xIE
	z8IIeeisoOeT+lox891/E//GUF9lGPa/KEK1ABM8B5pqz9ox6t6slpQHQPkiTWjW5+qHIaXVpsb
	v7fNv6eFpuWL2h3HhUmeKu2/ur4dSCgnmh/iCFsXwXExgjKaFh8S5FFtcFZxofCzNY4PX810jp9
	8o
X-Gm-Gg: AfdE7cnpldAXo2bOWUuZlh5FBzm6vgQ6AvJzVoc/Pprd3UBzPQW2OhK7HLJyD3kSih7
	4S3e/ijPtmJvuWJmbFv/Z3jKqzEX78f5277lLETxbYCrV4AVUTKFjQoBcCRKif4DjFJRDxWCG2F
	kZUxKh6nXeqZoaphdcE5NHMg+D1rH7xaQh3aE4O6FPWHhJU9I7m60a+0mYFNftrFc0NJmK9b1nr
	DEmVycpqx7IaCGz7uB1cyD8lyzp4VE8XAuJiFmEtRu/cA/ZA5XDVNXRqBBzoAM39dtsxbmFBUpg
	yR/IUrag7CJOb+iOx/awNasE6glQ9u8ngv/sqaK/wr5mHQsTLrYpGCCl1yegPG1O0vGWmTjU4Vq
	gPbzFaGOnARD0v7tWZ4sbkBRwdnXgdfYoLLv1kTECglLpgY4di8gpClq0MRwLktglb1DGW+Afvn
	w+YkiAY8R5ubIhNraUgGIFKHiCaRfI8Iwni9f9kG3C
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id a92af1059eb24-139dbb8bdb6mr11102672c88.33.1782707934498;
        Sun, 28 Jun 2026 21:38:54 -0700 (PDT)
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id a92af1059eb24-139dbb8bdb6mr11102650c88.33.1782707933949;
        Sun, 28 Jun 2026 21:38:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:42 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-apss-clk-v1-1-8c92fe118ce4@oss.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX0yCMNxXs6sfb
 TvhL6f+doYW85m08Zu1ivNlm9VvLtZeayWYIvbpnFQJMoEeSGUju/Br6T1eMTRNaCgBsiZVz9Tx
 DP1SCWB+/4iZ1qmi8SD0geeUjv9fVUo=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a41f6df cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: eR0pk-q4t_kizyOUi7a5z7vj4tCkSwNj
X-Proofpoint-ORIG-GUID: eR0pk-q4t_kizyOUi7a5z7vj4tCkSwNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX463k6r5s0ahF
 eD+PORwVn8nGaonRbZebTMNWklWytwRqFpWDrHUGr0DTZPu24Ua/GOmCC4UXib62LLNfEGliCPE
 lmq4GGZ61Rfse6YqK/PG2xzN2ASGncyxHcykGoald1aDJxGaVlgIsBgwYsCRIE3omtKhuEIo0XT
 tr1tFrLIMAQMD9/pDEtkzVH23qwG5HzHKtGKig03AQFzBARRrNw9tKZzzbxr4/PGDSGUiPNl0pV
 wN/qKS9tKH1j2VTNME9RwY6h/Xho4KZhU6FeMbyKjMyugelJGNq/6d7aePlvZSlJ21NkufRAoBh
 YhqIL4AIOVSHivl+KoIAU1PdR3wADcaAId5pNWFlt8LeQJgSmT2QnUly66l1Fkwo09IpreSLGZE
 5n2E494lcMezN8mzMw9n6a2utXdccF014a6Vy2TNErQJ5xZr1H7rsUqScssj56vCD7d9UAc6YVP
 36hxqTKwoPyLo4PoWtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114821-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4792A6D5E3B

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1


