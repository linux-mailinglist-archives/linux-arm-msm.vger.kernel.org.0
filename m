Return-Path: <linux-arm-msm+bounces-93670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAV1JTNDnGk7CgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:08:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AAA175E58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F3A130804C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46AE3659F9;
	Mon, 23 Feb 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2QEzmV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KStDzeZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC13366060
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848118; cv=none; b=CVgAfF1Dfoucyg/jbZ5mJrJ9Fdsek1yj4oAdNZbLKt2Yq8fYzBTFnScImgDMvNwPmH2Y3224piZ2W63OC/wBUr5PhxiOYVuMsHmzu9OSKuXa3xkLRbzfCVtRVZsoRIXh12D7nx3owLEbDO8HKcIf0gnXh2bB6IxB32LrTKW5GYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848118; c=relaxed/simple;
	bh=MmbwTnZejqoXZwYss2/ok3DTFscJl8ejhJtrJnSujeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBKV+YDcAwuKIIjzt1oNLHZSk2NKklfTdpzU7NB92jNOf0yy4PcS3XJbWchFPMdqW/4HQ+Ms/MZuDTcbvfp0fTMH+yCRoFf5sI4P2hUeN7tbmvgfbTotEkDsKQsT3cxIIO38Fie6g/rzEEK4sksD3/We8FIWLMrzoTcCEPDZ/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2QEzmV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KStDzeZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYRuf561785
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=; b=b2QEzmV8phUetfSD
	E1Z1yqDI6UXJ+brnb8rF7lmkYR5CBPKcnbNm8cFsUBEmdPJ9ZxjAVtLt8E1JqXOq
	40fdneYkMXUTS4d3pYClOon4w44p8pwJ584MDZ+I2nhkvMyPb4XKwuLHEa24Lwxs
	qoHshc/pfnZC5TBK/7rAKhAG82FnYhFK+xJOXXwgQGhwf10qmlN/lS/8V7pA8jWH
	ceEfpzRPDmvRIDkF70m8nqSn2N7hXiK1/6asZyZTTZJMlz6OUSTGggLzceTjGjjj
	+EvXD+FesU69/nBjFLZoaXX78pQD7KejLMFkUsYNka8JWJeY8P6/xYaIu9e51Weo
	6BBmIQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r87bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:56 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4c27c728eso45625493a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848116; x=1772452916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=KStDzeZ/5iO220pB7BAFtE169nbkpK8fjTFTKWojMKZZAXATNTbWpJhGDsnVVqHVb9
         eKi6uWHlSmwy2ktMU41d+nXSuWgx8Sw9MV3OZJ6EduBggr7cm/a1Gis5jBGeDL5WXiKV
         BpEs5t7tMTmP3CcvMakGu2W5CmSzBQngunRf1ttJohpl8Hnnpsa5NAuGqcGftQ1wHtzT
         YhkLOyPWo2mXYAAsRtPN/sm/40OKUSyUDwice7eqoWZYbOcuHSSlbd+W2UibqCGTzPc6
         YAbKeZ6hyJjtNNd6URleEYhVnCr7P7xr1PIva3D+mRf5jyWuBAoL0RNZq/ixOnMgAbfH
         LXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848116; x=1772452916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=j7+PRI6E30NRbQGewSBZMnMb9dzc8n3i7YYHtvHxYBDy7IMG6BAAQ7FB3bbOCdiXkm
         kAv2UNhxMFrVO2pkaGgspVMiNoUiC7k6v0r4hf+Kq/qqSeBScJurOpXCRMp9lYdcWVj5
         TBqAFSWfaYMt461Uap5QRcXfgPSYkflKS3B6KjldANf2OTokNqJa13R9MtBfYGqpowAx
         hQP9Pg0VMfMNl2WJJl4H9FvqAGI23imQ7opXE4YZk/Ywc0f+X8ihbBinJ11CQ1UGMt3y
         +lNIBagJJGObj9rTsdqRxictx/OK6hU/Zd7UtMZBWLah3BhTS17VRBy/HwW0uy8f5JQu
         v5fQ==
X-Gm-Message-State: AOJu0YyyiULZUrO8OWgmjTWOKZaUjZwBMD2FmBOp8hfUO3CN4XzauBUQ
	rVhxkSoWdXifosLOf2JB5jl277orveeWM+y9ak5aQBvwM1zIExrotR6T2KR/jItMOe/J69Ndvxd
	xgW/O0qTYe3B36mNi6hhi3upd9QZ5aFukrCV9D3/WP1saQl5gSpd+bYaoraZBClUmoZ8p
X-Gm-Gg: AZuq6aKE+Ee24sGylnb792ntsNNTsGNwdgOMbhHrT6f+lBsiPLvIYXDAinESaLjwzVq
	hqA8aaYvCqW1OHOUNWnP3l78T774Cagf6gRPXd4w1PsTlkLrf5I/JDp0lSTqMy6BZIc2GgCf5r8
	BIOZuZBcgzypROU1mlLysmd0G0W+CCE666WW3J9qAo0kJpa7cxBNeU0FLW91wm46Xs5D7EDfWj+
	Uo+HQEhhHfLx9/H5WLbgA02D/5shsoTEezWykgE79UE2SUW8aR1sYTTxsTekfXZaL77lygNk+CG
	RmXtpRLUWRtyeFcL9UDH44Fb9pkgModhXzLN93LggUYcuOj+XKHgS/GZoOi576JCnTS3uF6KG4r
	d1s21ov1eN7aqnU2ZCPk6IVIngJ6Whg==
X-Received: by 2002:a9d:63d9:0:b0:7d4:be1d:e9a9 with SMTP id 46e09a7af769-7d5169e9cbamr5267127a34.6.1771848116018;
        Mon, 23 Feb 2026 04:01:56 -0800 (PST)
X-Received: by 2002:a9d:63d9:0:b0:7d4:be1d:e9a9 with SMTP id 46e09a7af769-7d5169e9cbamr5267102a34.6.1771848115549;
        Mon, 23 Feb 2026 04:01:55 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:54 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:21 +0200
Subject: [PATCH v5 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-4-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGkHQ24yOe9wHFJEWAM8TJrX4jh1DCqhifzH
 Z42fJNb0y2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBpAAKCRAbX0TJAJUV
 VtcjD/9F0+4XNllgAuDwAr5PkRbGdwY99GabxqIsd5YvH81DwbWFsISctl2j6pDYZk0Ug6B6W/A
 itdQq31aeNbb2GtAxq+v0sNfXzD51BxJmRH/t8CL6MVZHiK90uhtFgm/A2hSWrRS2lRahs3wsN1
 L8Wf04BrTGMLdUKcxfDHRyXyGzea7ayyGgwAZLiNAn/xaWiRAglj9c8FFnVarWWje6WimbAzvtD
 ooxXOOIWDT0QRLk84G4Ee56cHDv/Gt5cfg/TZ1AL8t+c7yNpoxGSLxSzIKH2+sZkPhiI5IF+CS0
 ilZP3lCPkVFSJNv7hh1I5UcO6eiyEUja02Tg+ceiF9zvoxyIvdhWkhofZtu8B5tao8QZAE3tNWA
 NFHyJYeQZgkDyfy4WaO7MvvLamhge6ltJXdf0oufRFo75SgHBX0ehMM0w4IwmTbGSMs/LO/6n6S
 b0wXsoepd7iHqaYum1SItVefvbgmX48xu/K5J8r3Ox080Z6h6t3H3DfUS1sKJzjaIODa+O/TrYl
 nBRHJb9fmQl0t7skH1/hydBylsK+2qen0zXii2FWPpaBAUSlWwaw0GL6k4MKXK3tNkzYL0ecj/2
 GY7mTOQ+pEuVOL9GHl07L3sv0kaDVvaTAb+UcEhGW6qgy9srcocEwwcxh70XOyIaD5Of5IKYiEN
 HVI3/1UD9QY9Zzw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: tMEaK4PAQzBSxz6iHnU0-y6mew8i9VFy
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c41b4 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WYKAqXAjdBNwTyPbr-UA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX4ah3jicVqI8+
 UPlyhK3uc4rEs+uWtyuOwqesvg2VjVjkthSV2R/a8fvQn2Rn8VJIm5bj+GV9vehOjv861WAVKgn
 1fgFk8XCIs0Yi1A49MTMDixRUw0+w9B44R3FNkWrtubAd9pJEHRaJKb3VblwLpSmUCrAV4B6265
 /RDw0i9z+IgAf91+7ragM7/6m0JKchmutXplx7mHeFJv0YjuLPkmwRxKHJFf7+qpntIxjN1xzXg
 C635RVIRSjXxs+0jDqZIGpR6dLs3X8l1hGskVaJdLyGObt8KeCgsfFTPA1Ya6B5UL70aP+oXKNf
 Fl2Hfq5LJjoWULb14AvEwEznEG4lZydHuxEiRrMtKdbMRwd+tOEgmpdn+K5o35fUy6fthoF5iVV
 IcK+a3agd/tetm2ggiB9RoCbB8EKOGVmEoRkZmQKJaPU1Vf2mVDMN9WRAe5ylKpAT2HsoT8RwO6
 KEk74x82wbrBAwZwwKA==
X-Proofpoint-GUID: tMEaK4PAQzBSxz6iHnU0-y6mew8i9VFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93670-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01AAA175E58
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


