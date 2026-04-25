Return-Path: <linux-arm-msm+bounces-104520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YwIYH7q07Gl6bwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 14:34:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D9466393
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 14:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08486300CC2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFACA175A80;
	Sat, 25 Apr 2026 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK85mPkd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMQUMZ1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69640DFD5
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777120439; cv=none; b=pJfI0/9dIQh7DubhaG03ZDE5+atw5VtCw7kneNJsdOb38d+t1gHISbeUmdxqaQakrZ26sUTLxJk2URg28EDTUF+Wm3UkkClAWAnE157a4w2Dmt8r0flJRgSn7PkqWbJEXQ5iVhYWiVcDd4dGnr8t13ou2qwLnGYx+XbLvwA0LBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777120439; c=relaxed/simple;
	bh=4EHrx9O0zy+tPpiQTmGb67MVCUynxF2C7uZoBqaBbBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uSomM0HQeuZL2SgaFpbeKihiD97jfXos+pRQpEHmz9OSy8HXeVe9pF95tJdighH6s3K+ftvLqw5JQwlFU4SqzT9yA8V6dMnZURbg3RK9K9mAYaxJaTVt67RnumSQT0ZjYRPYaOJBcwoMv/CM7fwlNPcWckL0+SLIQMt5n9dttn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK85mPkd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMQUMZ1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3MqGw206546
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 12:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=klF0v38YUv00mDFPTnwJug9xOiBA9PSH07C
	CCWnh0Ck=; b=KK85mPkdkk+neFh0+A2grw1rUEyF1JlPDySBmVQSOv05aCGsAVq
	9GKAS5iIXS6A9MWijLfQ9o7pfhaWkM4s2tLv8huxooW5q+ihzEjbB3ObQ/ka+Uqt
	CjxVw6PCZ36HkKmRdz8csN4xaoisTWWDcB1O3CN7jzNPXe9wWES8VrMen5UIqe1T
	cVgHVv0TRNgVoiE/ayyQu7BFIf+ooY6cfrAu5NWUiAl41XtuGPHtYNLQqbZKQo5a
	ZXkkwD6Jan2rPd+sDCJmxmxFG2NYNu+4ccmgHrToMlraw6/KYNiFnLcKWCV0qLvF
	lf6mCHEt95UGua5tGDq+IMw95eaKtxjOytA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf0v8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 12:33:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3403e99so148609211cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777120436; x=1777725236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=klF0v38YUv00mDFPTnwJug9xOiBA9PSH07CCCWnh0Ck=;
        b=SMQUMZ1lVIrxMeYoAbcgKn3prTyzJ/VBMSvvrKMw6imfnexG5McfkoFh1lbxmd7esc
         yW7ZHEQdBVHZoYkUNsTLR4ABBE0BYGyT7zmchLPqx1HGdGMsR8NubJ1jRGg5GkBlJvjD
         yAi6lkDxSCx+yqMSvEMIuAaOYjBgAdey3pfM7Daxf/cfqXgEPVZm/qE0eUHtYCQVQcDU
         otoJDcl2SeOXSl84aVz/pVpRAaHC+S3zYIuDmSPKBkhXU9KkDrZLck7H4BAP5QLTL6it
         mKRg/HBmXgI7nLoPxqrtHPyMSEU16XIt+iRSUWRc3Sr8JXemGJjyAUR1aj4I3Jzbq3wN
         RbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777120436; x=1777725236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klF0v38YUv00mDFPTnwJug9xOiBA9PSH07CCCWnh0Ck=;
        b=PyHj2Le4BNuLpzA6nL8YgHeZghj/LRVgmQ49pQ1iC7UU3+p1KxysFWE2CKsZ7zQ+ms
         7xyTJL7vQwmrukXi43uLXBboLJ2h/KTGz8n5aYehJ91zVAyPIP7apdZEq6M9CYuZdCAh
         I4RSXPvKofZeAy6HnHtI+wKaIesfKDNCi7xg9DnZaRfTJiReCkokAt/2H8AeOfNF8tM2
         omTQHdej7+IGQ9rBsmWOZkWnE34ZuuXLXmYWLOMXYa1sAiHb3jsVQ6A2DImEViQTiME9
         r64aVKqagO7qiUqek08BkoC5MKLiyrfFinntWkPPgqa4s7an2ed/Q61tJ7NvKXVzxGuq
         W72w==
X-Forwarded-Encrypted: i=1; AFNElJ9v8Lc5Uu1Na0r2wT8Ml2/qtVM10OYhl7nvNvrcVcSrgCXaMUzutSCY9YNppbHO6JMg41wkRMXoCiYascpf@vger.kernel.org
X-Gm-Message-State: AOJu0YzyplN/71VxDVV9R75VyLxJ7ZuiHtqU/RiGjY6k+4aEVMcEI6fp
	mrWc5+Bj3Zb0Y9d5QUj1CXyBR7XjyjRlKItlFwW9TUJQPalqtcWesbOgirjuPD9PxK6CTQ1+hzw
	eo86jxpX4/TYi/zGPNo5OZrBquqZHxV2oL/EYbMh/aU+awDfe22nw5hXsXwcMejw1xyU18eZSDc
	GQ
X-Gm-Gg: AeBDieuZzUykAa+Zseuu362N6t4Xg3+P+62mgUfXp8CSvdsole4jYlVolK6ujjjKyTu
	0XM4hg022lU0+8Da6cxDy1LlcIMPoeKrsOwqPWg6E4040zY0ONBRNu+VjgX3gZhchvaOjpv7w/q
	1b0/ffm7lavRAsgezplLGZ9SJZFBbcyKaZTIOyvhvLHTHGr+RO3pB1ANZY1RRpUC2oFvW0EZHj4
	XE1TXvFUdrU78AJ02t/FogDm6bsWmHbx1irWF+yAVIdwTP6cTSBqTBjuPQU9smZ26fd3TsuZoCx
	e0sZSnW1t3sP60RDg44csEaehiKcKaoJIwvKFXomGTX2zPt1oyB+XbKy6xY8aAHMdx9HNiaRVcu
	lvYAUVB7fAWy3KIlJqt1wdfb5V8UomD64FHRp6+NsMEQRIxysW4LfGfdfjLV0nvNv7eCTsTN7OZ
	lnL/QsQJb1wTkb1d1CtvRhSb4WLyKLVQWvt+zqVy0pfTE=
X-Received: by 2002:ac8:5892:0:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50e36b40e4cmr542453991cf.24.1777120435660;
        Sat, 25 Apr 2026 05:33:55 -0700 (PDT)
X-Received: by 2002:ac8:5892:0:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50e36b40e4cmr542453521cf.24.1777120435235;
        Sat, 25 Apr 2026 05:33:55 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ef3d4sm884189666b.17.2026.04.25.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:33:54 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
Date: Sat, 25 Apr 2026 14:33:51 +0200
Message-ID: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pQvpA_grno5WrIi0iiDYDLRYNAnKjc1N
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ecb4b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=iLpfOVNSR9RCDSG3wP8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pQvpA_grno5WrIi0iiDYDLRYNAnKjc1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEyNiBTYWx0ZWRfXwhBDMrZFQDTr
 aH4c1qWk4iSEU71cZnqAxoTas7SZX44bdWJK088nfF4CKHl9/wHv62POGLKl1Ojr1vN5G+Amyab
 CgH3tyHApb2/uTmQfJSH71ELsSsXqnVfra2U/JWp3zREl6DNSzOptEhyPm/YmlPGsRKza6YGeW8
 6OlTO0Eve75ciZuCgSBmE+UiQh8AGXELSUgicRb/SZKBfZbF93w7cT/RbgHF4kGS5370xrakDBd
 RRSvlj+y6kb9aFyvhSvM1gexRB9kYx+/IItnbdfQkHBz/f7HRQwNHHHgva/3Rt9lrIwQMc0HtAP
 RdqqGQ423gKW5/N/NxB+lOEIeqWVK6RafFV6NfjCpMHztTHENZUUqx0ZakS+Je+nTWjM/TbzdBA
 ec+y76Pamld1gE4c65+XgI7rcBR2OSrEeYsehZEBO/A8HbzCvjJX3YAjlXFSttDRZCeMbOEMd84
 dHOtNwfGMwsQW3yJ6Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250126
X-Rspamd-Queue-Id: AA3D9466393
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104520-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
to stop functioning. The EFI GOP framebuffer should keep working until
the msm display driver loads, to help with boot debugging and to ensure
display output when the msm module is not in the initramfs.

Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
to keep the EFI GOP working after binding the x1e80100-dispcc driver.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index aa7fd43969f9..cd45bedf2649 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -580,7 +580,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
2.54.0


