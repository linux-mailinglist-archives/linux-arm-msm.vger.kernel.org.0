Return-Path: <linux-arm-msm+bounces-116558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vSStB/KRSmoJEwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:18:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCB70AA8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:18:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fA+A1nE/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BO1/ma++";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A15A0300E252
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 17:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689452F7EED;
	Sun,  5 Jul 2026 17:18:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD72A2F7F14
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 17:18:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783271906; cv=none; b=DONT7L/67zxBMN8IHNdmAW37sE9NLMHZHcEcqfJGSwiMGEYt/LxA5DMEdXcc5wgHqsqFWR3oi47fyumcThOG9G2SUay/SzgYJ4GRWeAG9Kj7SvX6WGUQbrwc43sAHZPEMj5PgUybQPrewutOVRYwrS6LPgmnhv2D0vhDbbOtzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783271906; c=relaxed/simple;
	bh=8PVUoT718M7KRoKLvaHqmMtuoruySWTjIbUbNYakP3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NV8vglage8z//6bXj/uYKMeaBSfO5ss/uAty+Sw+Mb1xNScAquL05wDawFuUQE9mQqWznjGg74BwHQZSKAzh0ic2XM/4dNsxZRymVvrAbG0gLJH7VobZAPO676A+hpZWtucBGQYONpS/swwwD5I36r9hVDt88jXVTwJCLnBs4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fA+A1nE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BO1/ma++; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651jmPc391370
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 17:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gAjSxzK1NRG
	OdBoP1gZ/QEZVeLpNOonuOuNW/4h3GVY=; b=fA+A1nE/lnxuJzVIHes9RiqF1WO
	R0UcqCnH+ZO1DUtdWC46e1XcUy6FNRYPcEP+89L1Ob+PUVX3i/Nr2Z6cY9KkSXmx
	EY1Ake0eBUI8pk0JIxtPoWCOgP132648Oq+d4eaQR4jTt4JJMQy8ITXt0YhIc/BT
	gGvdverXSIsrt9o1UjFAxVNiH/yAiHfbVUFK/YOk4hKwjPSIxJdTkPb7XHjjyVAA
	7fzz+sOu/1F1zLFFrX66DCoLHVeB3ed1l77XrpRkPs+6O4af6CwZtO+neyTwpQ/G
	nXA5d0OYq3lfxw9Awihgb4Zp2ipEnKmN8rUZ1CMMxhfpUi/i7HYbnOcywiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh35me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 17:18:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9a2b95b5so336384385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783271903; x=1783876703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAjSxzK1NRGOdBoP1gZ/QEZVeLpNOonuOuNW/4h3GVY=;
        b=BO1/ma++m3OJfldtllvau4qMYpOLGfPe4QRFUDuQiii7GDkEfAqu1pcDSkn7T3AZYT
         6Y+SSvgp8T4Ym5VkxI+RVbZiWkUigRjuNrD9da/mYFOL7DoLC4MGlIbdIaJQkru20sgo
         XxLzv149+UEE/PLjXCAFVUCGYq6j8QzBeKl5cvgsScOzpiw8iCYlrmyV+uOip0c79qOP
         LCH1DkzlhvDbKZGHaI3KVxJWzqoML9JJcWWozZngikTkNYruv0p7ADBLdqwSCqt7mMZk
         qP4R7DuSo2EZg9TA4T5BTZ4KGU/kJ9hlcCZpX5L1rqrJI4GTK6bUmi62DHr/5rshkCrg
         wGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271903; x=1783876703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAjSxzK1NRGOdBoP1gZ/QEZVeLpNOonuOuNW/4h3GVY=;
        b=RiGmnCm6txhiUJ1oDZkg7Uu7XMI0CHuoO/+2sJ6bwztnnXmhx+n2wJp7vInN8j8eSN
         NlD4bVKc3UQhpmkBj06nLVEugp4ixm30q5XoC56/lagPuL3LWwTkEbc5TNHLe1R6zR25
         OaEtc3X8YNoqkBPJZV/tdUZz0uXBT9+XaVQDNbkeoA5ahERCJU82lZFI6XSxqKTHU3r0
         nt+ahxtok7OY4Cuzg5ifOrNJr440JbvPdxCVg+A7qQWlSqZv5hzcebMYoTFqOLyzSw6K
         gxi4oqo8Qe+wOIy3JSzXvUTXfpREo6/OUZY70du9gU4GEw8C3DS8Bmu3HJgoKIg1ub2q
         Dmpw==
X-Forwarded-Encrypted: i=1; AHgh+RpWtjkJSr/edkxqXSn/J2rNsokIagOqEN915Ku/STGqRegKl+ujxnxdcGHVkRQxnM3qplWcHgJ+R4GabVel@vger.kernel.org
X-Gm-Message-State: AOJu0YwuR35/3VWV90LpzNdW7LruBCEkMULNk2VApR/RVvMfgVm0iG26
	0T/hXramGvRj+5G3QHO93K6Pbsf9T0WVNhaMW6kFkbIEIFEormooT8DTpGi8HQekOHPzrsMe+Bu
	k/pse7bJjZCo6Guv8BsaB+VUPq0VgyrGduXlJ5NM6HSJnr/iwo4eZ+k+Miu/xRymSTpro
X-Gm-Gg: AfdE7cki82Ml2KmeEPd5SpZhTHTfZrl1IiiDBhw4gEEQ0qtD8J63AZghOJv1JQt+C0c
	TfFVpdPyNDLf84FLnt8V6ZEV4hs6/0j1TQTcs1+qjlqDguv0YO4l0gQLc2gAE5hVj7TqiOj7u9W
	hQDensQc2itxNHTG/F00OxS+HN3nUVvvaLxZzC1Y7f8t1fOT3vP6C+UKqA9gyvJXmP4Oe/Mcw3E
	rYxw9wFIka0nJylBLZEKOv15bPAKoUTZF5/kKmmPkDSCkp6GoNlB/e+lE0TQMLue8kK+OANQv2V
	fpR4p4KImyJzQ1GItRue5lw2B9ZbURluRNTzZJ3rBdWv9pvO4lV0Wh/apJn3h2In5A//X+dq6Wt
	gfHqdd1grNcZqBpraKx9neJFAZik=
X-Received: by 2002:a05:620a:6508:b0:92e:6864:b83 with SMTP id af79cd13be357-92e9a4c5dd1mr953774685a.69.1783271903243;
        Sun, 05 Jul 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6508:b0:92e:6864:b83 with SMTP id af79cd13be357-92e9a4c5dd1mr953771885a.69.1783271902824;
        Sun, 05 Jul 2026 10:18:22 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdabda3sm220513485e9.5.2026.07.05.10.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:18:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: videocc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Sun,  5 Jul 2026 19:18:13 +0200
Message-ID: <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8PVUoT718M7KRoKLvaHqmMtuoruySWTjIbUbNYakP3s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpHWM8vwGcHCZRqw/TSJsAN67PrPDyFG8qEwx
 gRvWdw1cnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqR1gAKCRDBN2bmhouD
 18NLD/49Fn13Vq/wmHTu+YcDJYD9G4J37GH+u46xpdTj2dWlQuctPXEyZMJhIKOSpG8Q0xI7psm
 /0vDiPG+Kr95cTzbOXbXhR9bGzhoVTY9eERaYLBfQYA3+0Q0rX6LkXafbTpBMIwRuFxOjt2dUXe
 RH6lOoaJdmJyGHs/f3ebsbB5hCuBRbZaDVsB+4O4vOG/wO8vJLqxYZSfHMpsH9sHk7LuBXuIAad
 17f7QD+vufRy7Umguc0sp6wum7T/k/geoeXg+0YySKFB3hSQU3XdGYb+mO3Unik7HKkvRgaRaGn
 mNzN1OM5Z5O+6ebLYcr1WGWCNOf1UeI5HXxSBNgFceMqkCyKmuve6CHTupETfKTb6j0uc/QZnm8
 rpfjV2PFXu9E2BdqBbjGjpmA9h55Zmbz/bLHZ8+ZtIJLtjz+OxWK0ElU9qv0cCAFKPEuwkt57+P
 MN8hKWFUsvhh4xQEqBUFQ3KttG45bfx5p5J1S5AmBGYw28DeNOdoomrrFSBK5mXJq4jIg0rE/33
 zxOVWNRVLjF7HGe2MgGJwopbnZlV7nuGeKt1j2fT/dQC8rb/fcUZfB7nJpDqO5YvXQypJMRl7JJ
 ZQN1ENqLtzkKhBgLLj3e48gRU8Au/YOR2LtaUKVztdKWRSy7SZXeeglozu4TrZIKqHI7iLSFolx ytiVZhWiGljDjwQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4a91df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iU4H3tFZNPDWGuvcQnEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX4gZGI0x5SlpY
 +JOgjXuyYECMXJWX8BDBprT/k8CfpVATxp83J8+zRZJr06w9FVh4On+mYICJrlkTDBWcftYONf8
 NtqSnPB0lnMl94woVS1v5vUyZ7p/x2wpemmmnSiM2Aa4j9i0WdN4eSmFEo85o9fUz099FJY3igs
 oSNbIxzNqVAs9MPJGym3UIXP5q3VVau9OrxjCixhlDfWmhpgYjyqCAhwsyTruzQj166wY/dpzR3
 Fc8g9XBstYVUCP7QtkjoMvk+oKa9e6wZGHXumklmzdOieFi3DYn12TO8Fe2++S9jrq+io5gTTJ2
 u4M4GliQ/EovwWledXiNQzW1NGHdualeQcg8sdJqEl9MkoUYz1nFTH5PjUeNxy6fzKoip8G7k0v
 hDWaPouyplBEKGyZETIKzOsHmnCaAdiRhk4b6oaZdObUksB/ebV/1ys85hOMG2toycb6Kq7HTQo
 rx8MfhWDNqpvCW5nP1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX3vefC5JoSfHZ
 66wrQUFx4x78HEH3VjV29LXUtLlPJosSnyLB1G6NGFVHiNCJUJwvR6MBAi6nHzsGLVi+qDjfJpx
 F+jhrMDOGRQatZfofBe30uICZqaNN8s=
X-Proofpoint-ORIG-GUID: vQsmKVZJiXHq-Q-TrPxeUNerBbX1Edby
X-Proofpoint-GUID: vQsmKVZJiXHq-Q-TrPxeUNerBbX1Edby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116558-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BCCB70AA8B

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-x1p42100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
index 503c03210ec8..6de596908cb7 100644
--- a/drivers/clk/qcom/videocc-x1p42100.c
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -526,7 +526,7 @@ static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
 	&video_cc_pll1,
 };
 
-static u32 video_cc_x1p42100_critical_cbcrs[] = {
+static const u32 video_cc_x1p42100_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8150, /* VIDEO_CC_SLEEP_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
@@ -540,7 +540,7 @@ static const struct regmap_config video_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
+static const struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
 	.alpha_plls = video_cc_x1p42100_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
 	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
-- 
2.53.0


