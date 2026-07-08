Return-Path: <linux-arm-msm+bounces-117787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JGd5BTuWTmrfPwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:26:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B207297B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:26:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CBB3/82A";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NhEvuUbM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117787-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117787-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1DDE3043EE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A1F44CF29;
	Wed,  8 Jul 2026 18:25:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B766492507
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535135; cv=none; b=Ff51lVHaWvIDb1bz7jSw4LjHnCZsBVAA/Ye+6csen9XBWinRwU84qazoPOQf/D4XipdmrIxDzYQx9qg+H7lz9opa4ZIDpLnKab+tIIHLXr9QPN5OexZWpq40Y1bXo88mYXNcApnYQHt6GThS1dlhpVNUaWGr98q6dfvs7bhGM6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535135; c=relaxed/simple;
	bh=GK3GIZYWutGfc8Enr9Qa9dwiK5VpgXvtjqrvxs6UcmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9/F44Hp2CUWfoMBL+wUtdwA74FK/wSMKQjqqC0PbP8mmA+sP63tNC/r/xoiRjVZEV6hruAqt7Lg2nNizsfqNz2V9a9GDr5vbsKciqMS41Ra8Uwz8+kqrSShED/n8qaeC6ebuwjM79FwFVbCk/0iNb3twp92toY9nVvkEIeotYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBB3/82A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhEvuUbM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL36G3256460
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 18:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/B+e7/M4mg3rq2ngkNGdepOfwfOYxIs/l+9FzU+DqY=; b=CBB3/82AW09dEo9J
	DX0fUroOMx7F3fUAMQT8goHLApD+GL/PPpAnN0PVb+8m3XFg3MavgeiJqBcxItrx
	R0eaIoi3iwe5RuoCQaU0Ikgu8A/nJwSkSuyTRSxw253yhRY0MUICeGFRcJrVHEEi
	+qlYwviKQHmdq7CvYHrsZMUSWDh4lIvL6jNREpv7/eX/n/KTgCVPC2sQTWqM/95k
	D3WX7fOVCEb18hVdf7iBVdzOsDPlABEYHxHOC9VNI5o3clE6epZ9XFVrYTcqeXbx
	4P39OcgwVo8w5OO6SwGdQLuuELm85dVtmWKynnre0gDc6SzQ8OcQPUo9GkIz0mY7
	n0P46Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw8kh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 18:25:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478423e020so199462b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535128; x=1784139928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/B+e7/M4mg3rq2ngkNGdepOfwfOYxIs/l+9FzU+DqY=;
        b=NhEvuUbM0yQnzbl0R3xJ/Qfn05Yuwb6YrTMBO0c64HZ/Nll0KlanVXA5KggvjgIpzq
         SGtlw+vF+8o1L4eZuiy3nbGJtHXRqAKGkcbuiFex9UYc6yx0iO7cMy3639dmWx8L0EI5
         cVF3foS9rWViKkldy941NNuY8xnBwT73sZgYBLqLJsQoGjr+JRkSlhPcytuQ6dAXzo8r
         QIQ1oZgmjiCFyNzmEHcH2KlhWB211/hpDoNo+5tQ6xkV9KE0cgk/dHB5uSNOTqtLPv4o
         gTd41Zqd0pjzbMFLzCYHx6nsMxnefs1J9xvsJRIOvnnl4DJKVxV7N1VU7XnvSI3/z3KA
         solg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535128; x=1784139928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/B+e7/M4mg3rq2ngkNGdepOfwfOYxIs/l+9FzU+DqY=;
        b=KhHLYIiKdX5oUxptrMVTK+MgkjSkgBOYpphKeHzf3RI5Hg4CbH0ZyQYiL3RD7yJRNn
         BqtinCgHMoZSObzdXRmSklZtj1O0QwrK7Y+cM0SjrbbjHHyD0atkqBwc8v4a1r5Jvoi8
         8qnkAey8Zl33RvxnsIn8SRZCt9NgS8d4lAq/r/30ydWL9iEtdxaOOorDdip0mX5qcifO
         SRJ4POCX8W3xvJ0eESEN2K+KY9SqOwkpipeltmrkbxHi0vXMYxEw870SzaBhqvbWJf9I
         +e6c2haHtJKpOwY2+ArKVCs/1MWyDM6hjlMaYa4gLuDzjhCWW2euZeJtfKLYJcRu4Gaa
         mung==
X-Forwarded-Encrypted: i=1; AHgh+RqL3s1jB4GKjN4yT2F/mXnUlLLtqJfZqhJ8RIv3tVdXDbwkesGKK9M2rlK6hw6/Zpf+gV4xQDs9couvhi5R@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTg+LzzF1AcB7ejkbj0TX2gfpCmBRfE7vkk47HuDpX8lB2+E9
	LGoG9trHfeJxZBuShwbQM/zJ869sLVxiBPqQKfiet6+g9Cd/PxSH2CpRfpzgdc+CkiP3BIYxe7m
	RY3UfKZHNJZIDi8SbxwndVub+Ci5NGL+HSQEhS+XI8tJsHkc0I20jOh7EetYVzQ/IiRZs7M6ANX
	U2
X-Gm-Gg: AfdE7cnHqqKk7iVl/wTuVoYC7/l9rmHr7M+AkR1jkNdbJFSbngsm2tLIgXISSkUVC8H
	sl1gIvwRMz4/8il2J5QReJCvN2BOcT0xuwmNeLr+G1WmOlXZzk9ukiR49LvHNFHvBz0vkxc9UvY
	6sbLUn1/iEua+NGdG+DWX6Ed4RX/Rk9pLKEcl58XnwM7vEUzXDT+hrIU+LLEgH9ugfX+pvPQBDh
	0k6F0UJt9t6SoiIBM57QRTY/QjsitSN+FVPWfFC5/q5xtSmyATrgL6DH3yISBPL2Bkan8/HcHPj
	644J9jeJO/yjkkfD2pbNVma6OpU24aJXLdVMOTy5ymEYOH2HO/vWkpqPB1Fw67IKX/pNaPW1rvV
	aCHGylR3lFspID5Ja1OLJ45C2fFUeem5sd1KaLjAvBg==
X-Received: by 2002:a05:6a00:2350:b0:845:dcc0:1f5d with SMTP id d2e1a72fcca58-84842fd4889mr3766621b3a.47.1783535128392;
        Wed, 08 Jul 2026 11:25:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:845:dcc0:1f5d with SMTP id d2e1a72fcca58-84842fd4889mr3766578b3a.47.1783535127822;
        Wed, 08 Jul 2026 11:25:27 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:27 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:05 +0530
Subject: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX2FVnt0u1ry99
 WHYJxIuDeknFsLrA36oC6OvMEEkkiUJyxX6NSNploIL+JMVeBQJBQ4bEX1NZEGNlgTR4jD3HdzE
 W/57HrHawHYga7mSU5A+xW4VHIaxprnbBwMsaYWTLLIStwg6IfGbBLJipKPlhxVc19deGvoxknk
 R8an8Ad1h7En+1MBiMG2gTPu1cpKEdRFa6zEJazhDEXfwcSwnyOXEVWAAE3PiiXxAdfJjFrYYq6
 VywAwFgSShgkRhSwOphAgVZk0j6aBoOCWJwkuzQrWCTlWMu+8ZyvT8BuPovDrlyzL94rGubd64b
 Rb+puMmOlj1+1DtIxugUavJ+ZqtcEK4E1yulXw1HTa30QwTPvE7M39ktGXBaiwSbCsgRAjXHlPI
 KAA/Qs6cK09DAVP4S4Tz09T9h/pdAd9X8LYdgjJAHyobEp4YOF3GeEKa9y2ExxH0TlgRujN7uaQ
 v33lycUiT7W/qz9OHSw==
X-Proofpoint-GUID: 1ElMMz4zoL821u2xrW_5UdQR2JfA0AIO
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e9619 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OBZ5FNg4elHM4VKj2A8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 1ElMMz4zoL821u2xrW_5UdQR2JfA0AIO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX4ddr9lrBI4dk
 7/QXIaNPXS7/RGmFLSVPa/ob4Yt3kGljvrwKeaqPbglz9Pddk5L2A3gBYU7Popu26vE82iY2T9G
 mF+TTceNWZiwg8yAMXR6+Y30+B9HXlE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080180
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
	TAGGED_FROM(0.00)[bounces-117787-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 64B207297B5

Some clock controller descriptors do not define resets. Avoid registering
a reset controller in such cases by checking desc->num_resets.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..be9b6ebb2fffde05e3f209571c53b601d823d479 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1


