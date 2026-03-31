Return-Path: <linux-arm-msm+bounces-100919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IESgMgoYy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:40:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E10362BFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA50308850F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EA52E62AC;
	Tue, 31 Mar 2026 00:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNQIag8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byLXxbiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE312D2496
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917319; cv=none; b=dcO7s620W9Gm6WrukjwDrvbiCul5cSHg5Hz5yO2BmsDC2+88NOr1pZM/ZUgeunib4Mv579ZZCoHAwkM/I+Py10cg24QTH6M37N3R6VKQ17SGklCe1V1c6QzJ914ky/Ofs75p8Ua54z6BT8SrjGkXDa8rVO0NoBhM5B14+rnAOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917319; c=relaxed/simple;
	bh=b0OEQN74wr8+xZG87rDz2GbjDXOiu02SrCev/KQ9vcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKfNLKFk7Wrpm7XXL45R3CkSDb66TN3WjSU9bmN+9tRpEknN57TYVG8VSXOBrWpLtEZsYX1801ZmsBwPkjN0YHxJxa+lqgzAaa+4LZW/Nd/knFcvYhXlJiAeRVJq+okEJYY6cwH8YlQCBy/KoX3XWXYMMoC4ANxS+lZvq5hBbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNQIag8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byLXxbiN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMN2lF2391218
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDO2Ukjx9lXayEy65b1C2A/WQjag1+kIVouVS5GCjko=; b=GNQIag8KtNipQMjP
	ExlAV7UHLXVXfI7EosKpY5O2GhLZHtabqE83pfAB5XGxeepGSVW36XL/LO/qAQuK
	rtUMZMb9Ql0iSgURoPAryVLGbVqPzUdi2AS6Xni21vZu3uVWPsNcTcx5kwEGWVK2
	gV/oicLjYgxGeFwKF6C/G+XMwYjeL+bjtZb354M1hHI2wuhb4qcRedhn5gyiYII9
	e37aMBe27YjCY403bPdGTy4BQ1/wvggRe4F9VKQOBQZlAlUl2kW7BmfRA2Fdzd0i
	OSm6qw5PLm2ZsCGg+VOWkxGM/jazscwwp3hylCWHEdQMJMS5cFSZ8Bdc6x8emXXf
	ja9KnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7hxsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c1631e6189so24277154eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917315; x=1775522115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDO2Ukjx9lXayEy65b1C2A/WQjag1+kIVouVS5GCjko=;
        b=byLXxbiNjTee5EA3GlrWXUGULNCwpmGzZSSqEgquP7y4gx0QSaXF+EKETO+Ogm5PTM
         FKDA6LcXmkD7DaORR7EFe0TVRgA0yy5JFxsJrQoVGJhKUyXmf/8USiYJ1zX4+6Ah4Rcz
         QvjiAcheTpkThtHS4ox1YAvSavCOfhZ3EtcKiTGQkLkoAnjPnkmHVwwYH/kpC3qhknSD
         RPl4SHsWowsq79umxabgf+QLXoS9EAogpvKGjMX9oO9HtSJEpqdsHDog93bUj3kg9KkD
         0C+6bMda2VCx4VDXX30R8UMdhsF7iuUPNTP6PnKRvIbxCk1rGZO80s2Jm3JHkWRZs38Y
         H04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917315; x=1775522115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDO2Ukjx9lXayEy65b1C2A/WQjag1+kIVouVS5GCjko=;
        b=N+H9K3HgJV9gOM1OskxExbaatQzHHRaXqPij+1M9HtwvCC0+AQLbGgvNCw0mHA6Z9l
         15VTa5F3ARVzSZmUUeVkVvL0J8Ay9rm3WLecNC+2+/dsvt9fXCu5ihncyvmpBge9XK5C
         C1k77pU/n5TZl9Aals434p5ZC7dkehBKt76xiLGjyacydE0GBgR8o/CdVrG5Fl8GskjD
         MvHQ1yGiaZ2e9sK+5R2Miz40WPsilFAxqyXVttDDMLlidf+sCtFSfWA0s+5pn8ZiimaA
         l9FYEQXlqDMBEFuYC1Y9FpTHjR0sU5IFVuW0qRcbawaeduS5Y2ACmUjzybD7sfTu1CPf
         KgXg==
X-Gm-Message-State: AOJu0YzcGurnqGBaEYhScwyYoWaB86cKQ9A9JU9RqnTsHWcOvL/Y+Ecq
	Q+DGDoX/4tbET7AYE6IdExwm+w1092uftkThL0IBkGjzqeth+imE8We27MkHaJOhwWBCntNUTjR
	cx4Pm6IyHed+CX5iGjFPQFkcNSmwmIJuhRl8LYrDSi1wg35WBLdz7RN22tJrsa3ZqnX+RMYkt1z
	h9
X-Gm-Gg: ATEYQzxwiM9UkZfaw7Bid/vTI2zwD08aWXEkCS8xo+N9geq5WR2NjfufE7ooW547fHp
	yYXTHiNLK4AfzLeuuWQHhQ8U6vcbqPfuYmScxVXio5vWfPnINpXVOwiQJ193a+wJ99cQbu0cyKe
	IvUWxsejft0l2JlvseM5FbluzyDHGJ2gAEjg1WKS0U/Qw2l4uKvvL7q1PXBU3frI5vGNWk7RFhb
	SelDnA4TqeXul/5OPcsSthXiu9Q+zzHoyyc/caKyrT5qbEkx+JpR73a4G2bfzCXiBW4muKIiftT
	2b/TXzX9sAENDeI5NQDfIXfrYPdWZUDuSOltXuDK+4Hm7KHUNbknv7l+jCOqPDYw8EtROVmGe7v
	ObvG/0dc4aDCt9vfT/qsW+5Wng6RvIJhe9ISv8dUDas7P6igsNh92v1ZF/3z8PTZaO9bS5TJ9Ed
	vj
X-Received: by 2002:a05:7300:fb8c:b0:2c4:a862:2368 with SMTP id 5a478bee46e88-2c4a86266e5mr5224002eec.2.1774917314662;
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
X-Received: by 2002:a05:7300:fb8c:b0:2c4:a862:2368 with SMTP id 5a478bee46e88-2c4a86266e5mr5223972eec.2.1774917314080;
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:34:59 -0700
Subject: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=2879;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=b0OEQN74wr8+xZG87rDz2GbjDXOiu02SrCev/KQ9vcs=;
 b=0V7WutXN4fflQ6qsYpRB+9TK7iUO1eBmk9l2+SMfBBmzuCVvLCMQ+6aQWrr8SlSZPR8im4/VE
 bApz3XjKZA9AQIEdpUXLbWzI95PGbYrchSXPt+zju2hLBLLGcrr8lhJ
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfXxBWIMnRa5esD
 XMa4FPzRv4eK9BEwEO4CiGA08bkhofSarf83saSc0312sC7P5B/5XLLcN2A7IcwaTs0QYwZV15i
 1bFnfqPKo2jX7xep99vk/QwBpMkoTXPFvpzkZmAhXNc+vbwEwBaMq7ezgqB9biCHPoxFNRa/wWR
 FIpAVuXESeFLy0dYw8Zic7jGLcXKfFyXTdve9Wsd2CDYGW3o/d6FuxfFxMNiBUmy4DKv2W7hDNa
 rxpuzWgmvjax9MgTscidzfZJp5cwHEdMPL10lhjPEjMbSgWVZIeeYzOaIRYvbgTou7ZSJtKcjyN
 5a+k3u1B/HpwNwPMed8i5frC8Lli0DDvSlgd5mZVCEwXMX1BA/f9qoxvYgK2amWfD7vOQ9soiaE
 FMDOwqQ9fQtvepPpC4rNB/ep+vmnoAf5ZoVM8D8hGD8oB3a64NI495FcnLt70Uu58F47IIwWmf4
 hg9nLGjl11RVeqwTAOg==
X-Proofpoint-GUID: fxN874bsXImOUAy5tQ-xq9sIsBzMgJ74
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb16c3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: fxN874bsXImOUAy5tQ-xq9sIsBzMgJ74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100919-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43E10362BFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add RPMH clocks present in Hawi the SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae..f9084c15467c 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.34.1


