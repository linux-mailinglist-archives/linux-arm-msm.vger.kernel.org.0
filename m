Return-Path: <linux-arm-msm+bounces-94871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEk9NQBtpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:57:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D21D7076
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 941E2304F4B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C04E35AC3B;
	Mon,  2 Mar 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiLw3cv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EY3HIX3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2DD35AC2B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448831; cv=none; b=iLp6yo56RL2vc57A+F+KyqR0LrWNyyBNGUiJxpOAV/DFYlE1VXrBhuvpr7kgdQRi27hW3H3Nc+9VZIIv55gSrR3lza6uwjaLB3LdmmnlCRy7ql7KikWiDN211+gDMoMoNnQosw74TKJ4uhFmgyNrydN7OA2WcTQYiLp6/iBaq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448831; c=relaxed/simple;
	bh=MmbwTnZejqoXZwYss2/ok3DTFscJl8ejhJtrJnSujeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LE0aYqQoCJMQ7DiAbvEKJ9WTkoe3unNfhW+QGcrm0dKTQ9wbykpcG9wfpPWKhs3Tg0vtjoiF2DahLxfHuwA7JY4opiSqfw6/kz57XIJZrbePwaSdbS8p+wcptH/xoavtT925Y2myXrEI1waeurVGl2hIyXHXY2ATx7mLkGj/3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiLw3cv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EY3HIX3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228FhhG2302941
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=; b=YiLw3cv4NQlF48bQ
	K3kwkiZz/+uGmMBcm4aue9Rq5A7PESY5by7rMuC6h0ETMILOHnrWG4bRrb7Aikex
	Av2wWnoMhJv7RZC/n4motDYzufwVUK4UiKQPBtPh9z+JN3NCLA/IqsEEcMjKX3jo
	vOQ+ai3vVfNURMf1ujIeaKTUFBPrHwfzvD1bsztPhiasEW8K0M4x8neevH/RdqpZ
	N9iIfDKY9S9dQCqnadxO9C1SsPfpkGnBKJyHy9bdHWq77sEaKdQM3nBqDQJJJ0qy
	PDXMdl+eKCXR/v6miZdHBF13UUvHo7Yw08rjvO1DOGbp0R0pCRMADZnyG9F75Rvl
	w+WoRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd58ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso3469043985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448828; x=1773053628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=EY3HIX3E3tH0T9S3l3IGyu52rHECBi27jFAett2QBmCWG5OySp2uqDSKRwxFPqvZz9
         lsIIQGb0Xtp5gh0ttQK59ggqfgVPZrH9l2gORMLLwuvbsdbyZyxcO1TbwAAOVKckqQ/T
         kqi0g26c9nVRq3b5bVdoKBWCwsdIm/1U40s/5Ou/wbjleDpi4j2e41e3A56vI4vrnVC6
         4XvPRMo3KOYNx7XtWioX8PBJEGwV0VnCAdSkWpaR7TTV/oJjdZ+9+rPpoIQdmdi0K/+Z
         b4OHwCf1P4kuvo6NIH5bQ3Gps8CuIrunbGfnHx+QlUkcMFsJUs9WdZMftnZR8/FosXcL
         ii0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448828; x=1773053628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=iqzbZWtyIwNrkZ24r7Wloi29rm7sRc7ZjmxJ+DuGaHyIclqx3+kGcRpnB0UoiSAZZn
         lewZAbYWgy5FOr+so83zh1D5Bdup1+5aMKdu04U9gPGgpJ8vdIu9xNNhK51AGlYMzGUM
         JzcHzYOVHc4bBUmfYOW4bZtxvJO3qrZtz3GvfSJUgi2vIYwabmf6O6KWEsmUfas7RK2n
         s1wQgCXGMPx3Y3c1/RDbdF7P8B/D5iS+Lga9fci5wNi3JRUHJi7lnjB1JXj1ADOiqe+p
         JCmwUa7wXGiH9V+3tTE8cBf3UZWzs4gtJu/tqXU2oW4ig5n0RK0I2hxcIzTISRSEedxx
         ixrg==
X-Gm-Message-State: AOJu0YxHXvoPY97TDmoVE+Syec+TMRZTU0g/b78Mh2uNhpeTGCJcXm5q
	xbApPnu/ctbywyVdtzRPoi06BEv3Up2ETeaXqFJ2dWiZF5iICQ9JOVJG6ongECzy8h8bt3IqNi8
	D9mhTjAqoDVlBxjVKAqoHOpqCaR1fR3HrZekg2c1jqtIgJ3pngZJB2brGZVsHqgCUyOKw
X-Gm-Gg: ATEYQzzlfM6J3glUqph8IST54YvDoSRAEgywOeNLMtKVwRIezPnan9UQUWJLLtfnpAP
	u0gK5fTiG6ZFicNFmShgjOqCS9CC+J3KrVgQwYYBXz/itjeKLm31ldqjrwbEZzcUU8HSeJgVHcZ
	UpLBseGFz12yct+wvw2/gOasXPzoiXKmW0GDVYL6C4orgUUlQcmjGsgr1aG2Fwa4aDaDtqx/Mp6
	htd/5C5h2g/ujCiraZfDRVJHnurUQ7GEgvFTWI4fO6YR+KNmz5HPaN9945waF8kxEJAtmSSBF/T
	eL5HOpLyU8iRewSGZgJh0U7XI5Y6+t4bRQVni+/TFjP1XSHGUpKf6vEG+7bQix+6/fOk/jVU0em
	QvwXllRXCFdVGUdIGTj0VjG+IoVaTQQ==
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id af79cd13be357-8cbc8df0658mr1570599085a.44.1772448828035;
        Mon, 02 Mar 2026 02:53:48 -0800 (PST)
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id af79cd13be357-8cbc8df0658mr1570595085a.44.1772448827345;
        Mon, 02 Mar 2026 02:53:47 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:46 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:32 +0200
Subject: [PATCH v6 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-4-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0WfDXTaoPjhSkdPdWPSYcrpiPi2RGOcbaSM1A3kW1B8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwu0xkR6DhNnUUgDxhZimwFKJD+cJP/8ekuW
 p5XymIlucaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsLgAKCRAbX0TJAJUV
 VjTAD/99I/2kHaBF2q5FZjO2S5D0ijRrHnhv1qwXJSEfRuASuCldTu4MDCGqtaWNOyObqY/LhSA
 2GDT/CTI7RFRmXkCiP04yokAfG8Z6muDWz8lupVRsWwzw5CoXbA+fl8FBdEo6wFZWuBgT19ndoK
 V5J2YdYSAJB5OTfAI4svj7zzpvb4G1IHXNI1ohuCXb/mU7QeRlIm3uAJtSp8yGkfX6a0Iz5eZxd
 FuQ8RWp+UsrCmZGsX9gEs4wH5TuzpfxRyDSQj4PpiXCaLw7hBRMe4UywcBrfE/uzv6M1eT7Us+5
 iIsj/Rt4gMKOwpP94p0MDvGQwjzQMeiOtLIZXbKO4+412jwBDpzamY9fNVXuJblUSKmb3tiRkL8
 fmn0EsoC9A9SmSVY8Gx2zmh+SbWwBPULacc3S+QbkPt1rpA7AmD5OmsPLVxtofetAPhaF0dwHOE
 lV6T1YarPoonQI/m13VR4Sr2mJ1uh4d08C+WiVT/tPZYgVsashe593B405dfB60apGiWmy2uEwk
 Fl/nr5Mkcrvwxl5hxQscXz958Ab7S+zCvWv6bKnt5hSm/2zVoydAbqGhztWrRyYdwWFFGLf41ax
 kOQ9Z/S32r0swAMeMxry2HJIAyiPdi6EUDcY3h07IvsEyf05THaDLHzLJdaik5H7XyiLV9sjFLa
 /rm3InAX1Q+9GdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ukOTnWaGHkpqdmItzz9z-T5PCyajkP_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfXxPfa5aQ0zSgb
 EX65yexFBxqTSNTI1TIKiuuA9HYXus/R3Pre0PfwukwV9M0cGlGPX3F43B4PbyihPKlvXfEwmBh
 tyv9oqeflqz5catudAxqi2OYi1JEG3CaGrBmAG34+r3XXniU9GpeXVNUKm/mXh9iDkF5tEdfpUH
 WvQ9IXG0V5URQDWrDDHHtfASkf0DqZ1yboBuqD5/jlQIMYWk44BsC4jRojMl2VqLFfOYAoTXXhh
 sOCDqHCSBXkH1wtO5BtqwuEzxPS8FoQzSIFJexppZh1CFyYwPvgstF+j8ZXlXhltfxxBsTkmQPX
 A8bOZfMSsMdYk0UzK5YdIkXotWBluduTvCFxCqpg3YRqBIvtXCfHzaCnWNiO/qqufdomqnVZCyw
 dKA+NbQ2NXQYy1dBQnUpExR8qHg8oJWzArqMc8AqqTQOajhzCMWgs/OIq364Vp+WcW92f5o/ykI
 +JoAoWTsE75Z4Fh9w/Q==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a56c3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WYKAqXAjdBNwTyPbr-UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ukOTnWaGHkpqdmItzz9z-T5PCyajkP_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94871-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 594D21D7076
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..6a54481cc6ae 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -372,6 +372,8 @@ DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
 DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
 
 DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
 DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
@@ -940,6 +942,29 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a2_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1054,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1


