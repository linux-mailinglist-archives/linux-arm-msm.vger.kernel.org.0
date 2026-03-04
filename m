Return-Path: <linux-arm-msm+bounces-95306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBJaEz4tqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:01:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB21FFFAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F48A311DED9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E953A2566E9;
	Wed,  4 Mar 2026 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNduG8Rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lf0r7DTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFF23ED60
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629156; cv=none; b=UJ5B34eiwmytFj2lXZTMT6etxRHA3U6s1Uf75ayZtV/uWbvkZTqJ3PixZEu96pRwsJFlDyE+6Sso1ukWaZfRHxFa4hmpTU+0FyVYtjekRJ/xMwJQ9h9YNHxejR3Gzb89oNtRD+NBHrXTUBYCxk01mpHjwZS3LHw/R0ZPch61acQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629156; c=relaxed/simple;
	bh=EwI/Ilroe2dcZtsTMAQYHEJswLAcBpbqNllMx+9MzZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWFYcWzzIRfSg1k+bh0GDmZotYiaGyktdoyFS9PDbS1CDXk4+OiQpiBjJXUUI/1adBrprpwvYKNRb4LO3q8fn8YyRlH/S4mMFDTG4/cKrWAO9N6EJfiY/ucsoXw2dQHW0HM6ptp70LYKqI6rdDbiClzolUZ9hCA9dJHxiLKf5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNduG8Rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lf0r7DTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D6mv1203226
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvYYLWhWfjzIYUd3a5Nk0Q+Nm2WxSO1rmYo5uvWd9qA=; b=UNduG8RtC8CdcU0d
	eaiBl9BTZ9wjlPC/p5y8/ysUD+j7pK+rKYfZiY8fBvf57Jf8ENFW/PZeC13xFJA5
	IhbbjJp7PsU3xCVIgA+4ECirwtjAGQcvFCp4mooRWnEhGu/vAO4ihpUOOjeR0xcX
	ooOCsyBOMuAklWOdAVumh0FLqtzFR1SSLat1+SJmwExFYRlKQl42rxEC1bd+e99D
	/1Z502u8I6gaHRBD7db7rb9Jv72ILjWm4Cmt0GN+NjGL1JUhrthhT6Ml0a/pXLrR
	5lRHRfZMmrwnNlWNKRvemQ/XfQ+pXu5oZrEA8+2Nzt22jSctAFtfA1zT/8hrF8rr
	PZhD3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c197g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1007295885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629153; x=1773233953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvYYLWhWfjzIYUd3a5Nk0Q+Nm2WxSO1rmYo5uvWd9qA=;
        b=Lf0r7DTYnBdXjnVA4LtZOApfBzJsuQdBqAsPQmMFV+AhmBTqOrg/KoLsKN4jMrKZXR
         Rx5Zwce5XLTaEQTY97GfTRc4LHkuO4VzCJbWYuwZnWE34UJEHhX2Ce3vWMyzWN2puFrn
         RriwS97R/1SUOVtnJ2zrvLq5XIU3eDI5/BmkZs3kbYEF+YHJ2Kaj6obD//SnN8eXm715
         O/8CzE+huxlWOxE/IikI0ZjzMGx3ORyebGida28j70W6qeXrTX0o6/bTMKO/GQhPRvw1
         ODoeUPRMlf2v0csOUyvj6mBhYBWKEdISTpOvGXXeRC3bZKbEASY4HmuUi9SPOQAhxMPn
         k8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629153; x=1773233953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvYYLWhWfjzIYUd3a5Nk0Q+Nm2WxSO1rmYo5uvWd9qA=;
        b=U2Xl8eESjGyC1WGG3CYyNUDcGNG5GFYKJsjOq54KNFPOLLJp3TPL+7ycD/MosN+W4C
         Z8LIGmAMBgW37+KwjcYIiC+rjO4XuM/22MDstVglz7kYDLAAsQ/HMiblP+KrbbF8h8OP
         KzpPEDmPm0saIL5nb1LEiQUl7NHBGwzq2+G8lG5illZbxG6yK+Oo5S2mtyt8CMli4/xc
         U85YZVZb4NfDYgezGIfTSnzUPSFhbUJgEZUsuvN67wRmELSfRc0upL0yA6HR6AILFHdR
         SWusO/uoMMQXliYb7g5rIoXz/RmyeRwAwGnK89KfXYLNs3bi36HcT/fTx0HOHkrJ4Mm7
         8gDw==
X-Gm-Message-State: AOJu0YxIdFt0Buoodqfwj5CcxeDoymlInhpM1A2pwoEyCa5Wik0Hr7Vd
	k67BFGEn8oJ8vAORjOFE4/D77YXUanwY+dpvbW+ea8KoOBn6BdQu2dD0t4lWXFeDDvAJ5NQg/MZ
	SMWieEpK30OcDieKKTUJaz2zNJNKkSm09cLNXPkfw8FBda023QUWUo0DT4UxGN3YVoXRL
X-Gm-Gg: ATEYQzzzCZvQXSDQSUF3vhOyJLUiew52zxxjdiOghr3g2fehihoFNBWoBFHVsLxVIwe
	OlbqrRjtNDy4Vc7beNm4vxgs67GmMfUg+vo4Pk/34fM1R9oECBft5fLx+fPnKqG8FQ3t5b/1Mlh
	3Sm7ZVLq3BGkNK/eebzERk6Ky0iu5nZHK+iH+Zd/pSM7dZfNpKyEEqNmstL7Bg8QkX2zid7e1Z/
	4g4tbFodL3mUhEYMMgElXZnKLe+MNk18kef28+4PYkkY2idu+0yPSotLeSVCCODSj+E2In8pwY2
	1YbMz7MVbUGgGwRrvxm2EqSUTn+kacBWl1jWiCuizYm3scIm+23z/oRNCX0V3BMu/+J03XEzzXJ
	yRme9EuhtCA5eANaBABm9FpZn5Aid4BRHQ0FliXJzJq+f
X-Received: by 2002:a05:620a:3722:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cd5afa956bmr229359185a.55.1772629152821;
        Wed, 04 Mar 2026 04:59:12 -0800 (PST)
X-Received: by 2002:a05:620a:3722:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cd5afa956bmr229354785a.55.1772629152248;
        Wed, 04 Mar 2026 04:59:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:47 +0100
Subject: [PATCH v2 5/8] dt-bindings: display/msm: qcom,eliza-mdss: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-5-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16867;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EwI/Ilroe2dcZtsTMAQYHEJswLAcBpbqNllMx+9MzZM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyOh5rPbpJVjTU4XV5cWNNjH+hXyGo6NFFiI
 ZH0jurPyAiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjgAKCRDBN2bmhouD
 1yBQD/4kfgw4I24sop0bep/RuNdFYcUUDfqf9Jgt7li97H6KiNO9vBw4dwqPzXtnf7MvLHJ8vCR
 juuyA1IQZH2ccpEwLcdlLoRpm6VEp0LFBfyjGBFR0En4UauTmT1lYK4LSSN1TFOnLEA1Vsei85s
 3rzVvXqIA+KyPPWnd9Hmr2aTdKGY4oW69bvvmTRClC7TUsbJoCDbwRWqqTXvZDZ/rt1O3BI6nCe
 o7Hz6ud0CH8u3lXEf1+LWFlAoRHaC9rQrXM6VnVyW1ECkul4RpTSIMGO8VY8RKCPAhyHtIz0pVD
 eS3zoXk3aEnAl6bOnsbNfmVXlrjeWAduzdQ0Nke8MVJiwpjUTiKk1Ryo7EN64MF95R8Np92VS0c
 N6x1lgFEuszAMT9WgKs4EDvHBuNaWNXuEeSxgFrqG9Ok0SgwSv9i7YOSY6sGqOayIk2DIG9vKJO
 M1Ozb87qoXkb7UnGGoWWQebKSRsPrCespFkss6HzKeuna874XIuNgvDeGLe7JOBWtjUcbC45sWE
 dBUGLoast9Z6yAqfBmlQOkOf6m9y6A7WBVT4FHaw/lwpHfE8hgKAgaii2+D2G9sJIX6s0BCCaG/
 5BCGAH4qMvpnYfGGCuypfOqO0vCaJK5MOm0crSyEPgKxyXNIm1MhCDCgw9HVWSG4v1B4IdlAT6U
 s0uyO00p39BJ1Eg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfXzQeUsH0FA0l3
 bc0V4whPyjltCWbPXxld+QDxh5hu+uda287FR6wOCucidpe1o1zVJCNd9f4uqlaG7cpugL6kF5A
 wSx5kNwnPA8u2qsNK0nrSDQBw2groYt+Qpn/7u2506j0rGYElZLayadiaa9FU4/cLz77ks2wI6K
 vR/liIoEJawFslCIf165Z0OtSC8LEP9N/RLyQusr1YjiwXzmDUD6hXK8UCuA2aRbDSKa/7PH5Rr
 JguQRCGaM46e2C+r6FDoQbq71acFnFAmlVvG+3yZEw3h9jreVGReP58G5SkZSs9QICT0uHKvZix
 er/y9xnf+S8PmamDM18at/bQtHWCuQ+GwU3tmKydTd8+AV2qQihnvx63yce1+af3bKvIUw8Pomc
 9ruoeroX15hQLyHlgPUqwf4C+vVK/RNQy/xnSsfFlgBWHUzqUgGutRdJqt2rvZiRTeC3Zuvlivj
 7SBQBb2mJRTvBFUSF1Q==
X-Proofpoint-GUID: aD819p2E8-l1cMQHQEg4mS71QSJ2BGRZ
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a82ca2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wHLdSD0nsKlegPJtv6gA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: aD819p2E8-l1cMQHQEg4mS71QSJ2BGRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040103
X-Rspamd-Queue-Id: 9EDB21FFFAA
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
	TAGGED_FROM(0.00)[bounces-95306-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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

Add MDSS/MDP display subsystem for Qualcomm Eliza SoC, being overall a
minor revision change against SM8750, but coming with few different
components, like different DSI PHY, missing DP1 and added HDMI.

The binding does not include HDMI description yet.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix build by decoupling from headers.
---
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++++++
 1 file changed, 494 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
new file mode 100644
index 000000000000..47938d13d1ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -0,0 +1,494 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,eliza-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Eliza SoC Display MDSS
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  Eliza SoC Mobile Display Subsystem (MDSS) encapsulates sub-blocks like DPU
+  display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,eliza-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dsi-phy-4nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,eliza-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+        ranges;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&disp_cc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&disp_cc_mdss_mdp_clk>;
+
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        interconnects = <&mmss_noc_master_mdp QCOM_ICC_TAG_ALWAYS
+                         &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                        <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc_slave_display_cfg QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mdss_mdp: display-controller@ae01000 {
+            compatible = "qcom,eliza-dpu";
+            reg = <0x0ae01000 0x93000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_mdp_lut_clk>,
+                     <&disp_cc_mdss_mdp_clk>,
+                     <&disp_cc_mdss_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-150000000 {
+                    opp-hz = /bits/ 64 <150000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-207000000 {
+                    opp-hz = /bits/ 64 <207000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-342000000 {
+                    opp-hz = /bits/ 64 <342000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-660000000 {
+                    opp-hz = /bits/ 64 <660000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&disp_cc_mdss_byte0_clk>,
+                     <&disp_cc_mdss_byte0_intf_clk>,
+                     <&disp_cc_mdss_pclk0_clk>,
+                     <&disp_cc_mdss_esc0_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+                     <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+                     <&disp_cc_esync0_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte0_clk_src>,
+                     <&disp_cc_mdss_pclk0_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-140630000 {
+                    opp-hz = /bits/ 64 <140630000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae95000 {
+            compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x280>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&bi_tcxo_div2>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdds-supply = <&vreg_l2b>;
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 5>;
+
+            clocks = <&disp_cc_mdss_byte1_clk>,
+                     <&disp_cc_mdss_byte1_intf_clk>,
+                     <&disp_cc_mdss_pclk1_clk>,
+                     <&disp_cc_mdss_esc1_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+                     <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+                     <&disp_cc_esync1_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte1_clk_src>,
+                     <&disp_cc_mdss_pclk1_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi1_phy>;
+            phy-names = "dsi";
+
+            vdda-supply = <&vreg_l4b>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+
+        mdss_dsi1_phy: phy@ae97000 {
+            compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
+            reg = <0x0ae97000 0x200>,
+                  <0x0ae97200 0x280>,
+                  <0x0ae97500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdds-supply = <&vreg_l2b>;
+        };
+
+        displayport-controller@af54000 {
+            compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
+            reg = <0xaf54000 0x104>,
+                  <0xaf54200 0xc0>,
+                  <0xaf55000 0x770>,
+                  <0xaf56000 0x9c>,
+                  <0xaf57000 0x9c>;
+
+            interrupts-extended = <&mdss 12>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_dptx0_aux_clk>,
+                     <&disp_cc_mdss_dptx0_link_clk>,
+                     <&disp_cc_mdss_dptx0_link_intf_clk>,
+                     <&disp_cc_mdss_dptx0_pixel0_clk>,
+                     <&disp_cc_mdss_dptx0_pixel1_clk>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel",
+                          "stream_1_pixel";
+
+            assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
+                              <&disp_cc_mdss_dptx0_pixel0_clk_src>,
+                              <&disp_cc_mdss_dptx0_pixel1_clk_src>;
+            assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+                                     <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            operating-points-v2 = <&dp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-192000000 {
+                    opp-hz = /bits/ 64 <192000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dp0_out: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                        link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.51.0


