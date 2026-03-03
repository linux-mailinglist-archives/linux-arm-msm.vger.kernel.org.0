Return-Path: <linux-arm-msm+bounces-95136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tvZWI1HepmlkYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:12:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CAE1EFFFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC2E3107F17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3760542317B;
	Tue,  3 Mar 2026 13:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N58YvqwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3sD0Joq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BBF346795
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543297; cv=none; b=Y6v+aB7IPVH51HdVWlBCnxfEPJ7BB3eRB+yGdm8NnWi0PFzy1ZRK1Sh1gSuYzjLn540HiTGrtMS5nQDdKoamdBeIrJ9zme7mOmy1j8c8cExjkxLkeOHgiGMueFaocCXrStCgoTdSyokwI0deIg5ZuLSdhWa0dw9w2pm0wVzytF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543297; c=relaxed/simple;
	bh=29zuWhSdKPMixfedFLH1EPTW4fPqordVY2iglKGMw2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYqSgsfvcbrN3L1xVMDuER8zB5gzmorGtWuEiWcYUHm538uMrtHnnzhBAoHLgGMoMfT19lbnMsXDzgJEvCeypg2sduX6XLNq8ALmFfx8ETF9ONDVYBgl+8OP62ep27HQ269yEF4+65vrFUz3AOnaztB2vLASDVjwD0GpheSdwXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N58YvqwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3sD0Joq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n2D92736774
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3J0UpBFWUdNX9Om+xi+7i6jgyBAiM0Mmaet3+Qk3RNE=; b=N58YvqwGvg6C2cED
	HuE6QOiEOgy+xUMOXfRdT4WU34Nt5GlRr86dy5cy3Tsa1ShiNEFDrhUmI6gIAbVi
	AogQHcwHnXpGlZjVcI+2dDcXxis9mWhkiacZCcGxo5bo8twbOWwhV2ZOz6PmP9T3
	w0h7J3niMDDV6QiGubd+2ipfGfeDTkA8DDdiYMvWIbb/HVpdCB+BB08i2aVMsVDb
	cut8plcZSFbOreHxDdXvlIW1Kgfv51d2Ur7Ng7/xJkVLV/GDmjA4Vi0kcik0vxbS
	9u+9ygfPJ847BaPYo2BmesW6O/HIRyVIcsijbRWUrQt3YWJ5Ws9wqnTm3glW2MUN
	O9/Nqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe1c0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4467752285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543294; x=1773148094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J0UpBFWUdNX9Om+xi+7i6jgyBAiM0Mmaet3+Qk3RNE=;
        b=V3sD0JoqCP7khaoo+Ilkn3HhoYmK4VxL1deXzXGGolgzqC3uH9MK3ByASF20i+t+Y1
         szJvoQeJdX8bGId9uH53MTeUjJy66wx/CEdKnyPAYoe+VskctT+bGA3ZllRl7/N3y7ov
         GVBdFnxcgvWOO0BUu8v02FUzgMmkeUXYzGpOW7t5FAJJ12nJtfsFzutlsQPg1AXwV7Z4
         FXh9VnM7yqHUmutYsoAZInxkF9HB20BVjkd56c5NwXnmfDtmJ1d2Y1omSNGxaUFpu2Sa
         pCceS4SVVJ6U1a6yVmg7+v5tr6KUfJrXT+fCrVsDbtrYPW4vn5gfnxoAQWJaYXi2um8A
         jtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543294; x=1773148094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3J0UpBFWUdNX9Om+xi+7i6jgyBAiM0Mmaet3+Qk3RNE=;
        b=S4GYeOc9urpPsDhmhK6TzckNXaKT6J4GHlVfjyIH8jOxKCDdeuk2lklUXsppTSTNFc
         w1/3TjrmSKU5wLxBcwm318BLz91G2ootsyMrODhGyTdQJhyOgANkULrxqGKbcqCE+ez7
         izXxpDPmS+kQ3lK481i8kKRODZtuzHg0Nxx2M5aGSFNaxaqw2KRQyQteN6FVpG/nV1KQ
         QJcc4LUnEcJStdcXHJz0VOGh0RuY2iCqvXhaC9DO2v6yi6yg0Bc19GzU+WYflrXzFgVU
         qSgA5FYJALtf84TQ28z+V8+0fzg0+LDcogHYtZEczgdYi6mymEaNSKuMvevUZKNnGNOj
         QoXg==
X-Gm-Message-State: AOJu0Yzafa76dPQi/Mb6/B1eVm6zOUqws8esPY15NeFeJExWa/baz6Qk
	xXxGBZhnlCZkiFY/HBQwqPSRuULJ6or8gtp3bASia4BNZBZ2dK9dMFNFhg1AFeoJEFTu+AuTLQ7
	++unw4RCB3DLmN6dSVqD7Dl0UGXbWWbbAAq6Yw9aSEDSAVWoA2S+ySHoLKkwyegmqpaVO
X-Gm-Gg: ATEYQzwOUeVjFD3TaWhTNgIyhmsrtVqP4h0C7xTM7FXKOrZjXsZs+KjuVMR9VSdimHQ
	tbtbAIEtyBDNKCGEtfs5IfmFIox6ws8qf+UEzIHHpGzYRJ9IYdauiIEBXHA6nv6s+zfedwUhKRy
	+EoTG90scg4k4xrcdDNEr5l1M8IojYgbeAUoqFJpGqiLAXMuUBhECaCvhzutmuBFt3c/4NCegqE
	b4xY6ghld2heqL5zgYc6ZdpVs6/uuq3rkuQu/8GLpU70D+m+MijXvRU5BVFWCQs9SoFi9+ufH1j
	Yn9lrGCFP2rjcVkRtYR2G1gFSsStlDNCLWLNS1YLldVbrXOj5YPoUPpPhd1cuXg7iBppa+x0Ty1
	Hk4Ci+KuedAOGPH/SdOS+iJ02mFm4jR5dyQ+6gZ0POnA0
X-Received: by 2002:a05:620a:2892:b0:8cb:31d8:43a1 with SMTP id af79cd13be357-8cbc8e556fbmr2010944385a.11.1772543294341;
        Tue, 03 Mar 2026 05:08:14 -0800 (PST)
X-Received: by 2002:a05:620a:2892:b0:8cb:31d8:43a1 with SMTP id af79cd13be357-8cbc8e556fbmr2010940585a.11.1772543293917;
        Tue, 03 Mar 2026 05:08:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:52 +0100
Subject: [PATCH 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=29zuWhSdKPMixfedFLH1EPTW4fPqordVY2iglKGMw2E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0sXVNpJTnshGDMF0rAAssEPGRxS8AaqwoaY
 /aBmhwFcheJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdLAAKCRDBN2bmhouD
 15UtD/9eh939/lVG+ZgxCCxkznIRgc63wuA3ndNre37KbemBOq9sG/b9bddx0k/lTn9zcWlBtHa
 8feLEH26lzRTRM1pWXIAmQtb1SYAV2+prpDfZtTBzaUxXZv8YbM5JaHZrPgoUyVApTpN7f0+Sl6
 6JfcMlCagrbr9UkKiTwFJnEKVjjSYndql54Jjx54vr6CSnc/yhfFIq9UHtv641goeFHNnCjXNJ5
 IcgbGvwx0/+bM1v5ax9vcrwGXtcDofK6W3fldm487P9Grjvr18H1dV4UDzg+iKUJBY1SXVkZd/d
 ChgITb0EOFu+bnw7SQMJ7LNASzidwhkO3UuyJsxDrSB6Q8mMwDIu/7WQlgyRRT/vBufJ0cE0tI/
 l9D+ET7AV1TDA1BqsYjeF/7duuEIVy7vR+7l6EdqJ/Oy44XrFdRPgXt8IUORTeERTk2NzgTpSrw
 ue9uqACuzOKP4ElGxBSir7hs3IoDxugVaH+2K6mcSwuTVoKOramgYp9dm/bzR79oFpuqcAVc2pW
 6TeNexf2SW3gu3wS2O8NFsOW6oM7CX3N4H+oMw+f9stN+2eBXbfsOQ2qzcdq95nwEuczNwId6i8
 azZk5+IQpKq2jXS2UzcjqqgX0esEGc7r/oXjl6MuL8S5DUuqidtErHSl2z7Ta3ywbW+EX3gYM/e
 y7U+08lQkJ5o4Kw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0UB-pWBJMoLvTG9gJIhcIDxf2H7ChBGc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfXxZi4kI7RWh3n
 IYtftkWIDzSdYn/bOFjRvG7Hw/RRqdkbHi6a0tG5SRBD//c8Z6cHGv4HgS7zeruz6V7APp3vZ6X
 ke2/6pftBTal4S26gphXaeqM4aM6YKcxHPh0akcknMo79+7MFIy/wWVKu+NGudeiew/qgiup7Ve
 hDrv5anPzXO6U3LJHI6ujprKeVDLvHZhdicgs+J+oU77+ve1kIUIT05bpFjN06E+JbP1Qgxzuii
 SjVgjkS1SGOmjtua6k9h5rE5udGjeGllqGrG6FLvoojpDVaJ0rkdO87mewxXc4pYOeygg+b/bj4
 PxtVxiScC6gd6oqqVGiCQa+VGSItOWfyFo25ztQ9uBK/EgHw7MHb3Sb54Em7lXPIIHG/vlX/Iiv
 GMcS6RBYD+Zu4TCA0GS9WBnc8NLmtQzjqy14hEtGk1//dGtW48pc+lmSjD1TyhIUMXMfKehR6gL
 6kqyWVeWsIgRqOZ/1NQ==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6dd3f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ghL60u8iUD4uIiEFN3gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0UB-pWBJMoLvTG9gJIhcIDxf2H7ChBGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
X-Rspamd-Queue-Id: E5CAE1EFFFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95136-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
compatible with SM8750.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf43..3ce8a9ff4555 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8550-dsi-phy-4nm
               - qcom,sm8650-dsi-phy-4nm
               - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,eliza-dsi-phy-4nm
+          - const: qcom,sm8650-dsi-phy-4nm
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm

-- 
2.51.0


