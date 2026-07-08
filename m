Return-Path: <linux-arm-msm+bounces-117565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gwwBBy4dTmr2DQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:49:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F167D723E0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:49:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fy4+A+It;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LSqEB/DR";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58895301EF42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896A737EFF0;
	Wed,  8 Jul 2026 09:49:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AFA33BBCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:49:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504141; cv=none; b=bWt9M/Xm/Ypsm+RcntImrKqJ632OaKW9L7JfZjdTrsXaV0oatQAHxL1zLawHWzaarlvF2D3aqLLCSf+OBy2s/rhos7iyu0WkUZkQF7S/sCOZ5wC2aSAlQ58GWhGgzn+95ZMBsw8nUBkLCyMO089C5NPaKHuNT+IQkYTBFvCF9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504141; c=relaxed/simple;
	bh=/g/RgdYJpwg9WPX0kGci3O/a/JAF5+J+OsRXlWOxgn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee0TJ3PYH6X49z5HZg8yOHPyAKXy6ALERceHI74z+BFA+D51VpAgnlZ2+xgK489CnnQwlc3pVW1GaXndjfUSO5fbWND1lUz5G0XtxMT51LcFnqGxGBB/qhbREKNhd1zNRZFT6kVu+EUpO10PgPJe+f1joY2CHMrRMo9P34AVUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy4+A+It; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSqEB/DR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889HeC2219891
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOh+D+/o2aUDHYNGrbXorq7N43Rcfu8PIdYfEiz5oow=; b=fy4+A+ItXJ6pLpcQ
	5jYaAwLWib3oU36NdBsCj19kXAbTop6tJbOTrX95YIPitMGoFJpWPx3W+3IMM4e0
	p4fh1JoHBP0D4U7dx77huE/iP/aC6avXMz8Kg0tTmUjHfTlgZDj6gYea9AmmdeHs
	8niXAeB9uOpngp2nmQnB5PZdDoRqeRfpFrJgb5Mur3c1qLrwasMafK4G9xIg0NT3
	EICvIVPWqTsLvlnA8mTdMs4rCNU6YRSSKWEiJk6e4O/s2ysN2BPtXDR0QKeR/4Nr
	2oa2C24OiMxQHSaHL/Id6fj3dJqDY5ehDqvG2+aIGfGIv46YmKlNIZZXSm/qzRc4
	qXqPrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hh29y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:48:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so9730281cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504138; x=1784108938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOh+D+/o2aUDHYNGrbXorq7N43Rcfu8PIdYfEiz5oow=;
        b=LSqEB/DRL9JnX6xI2qcAsopyjcw5lHRAmOebyMXkd8t4/Pt3uEJPoRqR9luxbx9tO4
         fX0A7q1dOtZxNqnAw+Kt65g47yG68EX1eQNiEZIiUcOOAcG1uBOCx1KlHKgH1lIWuCBw
         Z/t3ReRNT4WgyPaZ1n1B97gZwjuMo2F5p78RsQSeZ+JinT1jWR/rTv1IYJyYH/+pg7Uj
         miq0qkVIGRQyUa0d3l1xMC0ozgkSKtFN7sdZHQhvu6Lte8rPANMZJjNibt9PDG3Gsl1I
         3XzzPalMdMUHGMxhymU36cYPk7U62ykwTJe1rcZ+3xPZBHwAPXV79OVJX6Y8k2RUHHFI
         jy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504138; x=1784108938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOh+D+/o2aUDHYNGrbXorq7N43Rcfu8PIdYfEiz5oow=;
        b=a+Dqs25NNPpN3icD4AmOkgK2WpnV/jdw/aF7KUDmv4eKakAWuYnynCik2NjLKEYNPd
         WkOlFP6RBLuuCQMI4sUyYWJu2rrGQLVGXqIprD/nJ/bRBoIo+OHl4nCuiAt78gIfa2vr
         Rd1y7ykgTpiHtI64chdA4fdVqYA+MoMAlFQmkxAdQzGOrRnFIjOZECWB1RDdLapoJdbx
         HLsWDuPtrehLYO6+XbDKiqIHblXq6s1C4Ug/qEgeo694O1AbXAyUXgkuc5uF95oO44g2
         x7eHZywtYw0B3lDiZz1Iek9RuYAkX44CqppznfpDPQ8f37AK0kYW+nJsT8Qdh9uCaGMF
         aLfQ==
X-Gm-Message-State: AOJu0YzQz5RTbKgVl+isBiAiNskbnocHd5TFSC9opsXVukB6zBw7HhVt
	Q+qlXW6B34MI/4PlCgc4WCa55pZs0kV+S+IsQalok54Vxjh+6Lib5R2xQFNXpehTcEchEW4LQXq
	10pJEg8I7fyBafV3Yaf0GTYoNKGLABoDADFufXebV/kgF1DgYQr0Bd93hHgHeu2gq6njl
X-Gm-Gg: AfdE7cnFuNlLd6cIujHS0JkGBF00O8Xxkjl7h+wmtqRUHkNJpedkDQ57cIz/Qg0j6Zn
	x7HhV2kf17dKXTz9JQVTdCZi+geZPNtcaEiFjEeQxVO1dATe2m+hIuXoJLS9OE6YzE57o03rEgx
	bkXYqSBPkhyZ7DjZlwMQ0EHLuyAByKNLOLBh8UlgSOHWzQV4xcv/k56fwNINficuog+B5kfLItx
	x8gnDaGMX0JvimRe1U6svL/UL1SX8BhK3Ofi2DevsPN443l9BO+UVYHoCLxxjuoMunXu+UX36D3
	5IoAB5iOj7OrET3QPbNKFg150FgT9Xq3bwqj5IsasybAmyrJ3QeHSXnSHBodvITYchD/TAimJNn
	OCmpeZ82dnH43UeiMXnyk9s6pz2uU7788XJw=
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr15547081cf.61.1783504138511;
        Wed, 08 Jul 2026 02:48:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr15546801cf.61.1783504138061;
        Wed, 08 Jul 2026 02:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:41 +0200
Subject: [PATCH 3/3] dt-bindings: clock: qcom,sm8450-video: Require
 required-opps on X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-3-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/g/RgdYJpwg9WPX0kGci3O/a/JAF5+J+OsRXlWOxgn0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz9zOy8xQNZjndcz2igUzCnFfPMi83dBD4Td
 Xo4N/v5C1yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/QAKCRDBN2bmhouD
 18dlEACJSa/FGOdcKAQmsAwoaCHOaaFpDqqPvsuPSYl5tHLPX1rN46wkUbkm/zImrPnKTEs/i1r
 XLYVB8R4jxb4iD8QdW7u2v8M29OWxmpqfivwFPUa7n72vX3QCbjwrSJD7d4Bs5PBva6/mRcncn9
 IblfkGwTebKZmTevujAEpr47EQ2C48yS9nd9lkd9+P97jiS73NDRhdROn6YrxTg92vthvZvdF8b
 zAUewGqO93FnvJ3ZNTq8E9Z708S0O52fNebGXMG0KukZgqlXCKzjqVXHdE6drlj/ZJj43t/5YNd
 6GHRqdC/ezg8GIN4paGOIzk3YCfh0nTRW7XEvDemb8qi5EAwtLmGMClzCJwcxsg9UhAsZKdgwRm
 sA+zt3hWaoqX7l6eTLuOn5t/PmXCFIsZoc2/yPPo9D6rZ/OMeNRe+vLSkISOrqswc0FlepOwVUC
 ED721go4wJles6wH6jg9meABoyVU8Hg7fJ07etJoLMEtCZ1XmdFa+1XJwOd4oeGcJUVdJAKEsP3
 7wAbZvM9y35Dk2zTxWQgetbVes7sRirdvx4EYiT+AyT1tbWvQJW9/BnOYhD0k5iiZPJyzSiYc1l
 +n1c7Q+jvYEPX7bEyHXQbuh4KADBdx3u1599atnobSEmCSV/JRws8KPt5dicSWu7rVupXM4b9st
 dPTQDKuH6/Xzm7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX2flexH/LUvIP
 FhDsY7rWh0J7LEBVn5b6kQi0/Wc6RCtsUSDGy96a1Hwm11k3UZ2zeMpWpPVxbjFwSE1gDSIIF39
 lEHBuRsxOVceVi7UdLHGvUhBOSkLmh6W13xO998sEgoLOf45y6NtCUF/DbyS3tOtTVGTbN4aTqZ
 jIOgJ4oyZzrNQKzHhO6fVWoN2I2BTKQCXR8d78hNIHHFFBOXyPKBI5n5EfEr7oHDYuJhmIOrZn0
 +XfOitalFsx+RLWFOytGfus3XV3FPWxwBQjrMpyygsRlwVDPu/Vsb7qc8nRedoFc5JKp4D/H3Ta
 6qZhwSbiu0Kjsv+0eCm9kCCNgXUTwLc0w7OhpMcG4GqaU3SA5GPvu3aBQpFz09whMzpJzahFfm5
 dG/r41vuVz/cD2DU8MWTDm4kqt3qfD1X9rGaVKEn1QHakW8RTP69rMtSYGTQc9FETZrnDdpaJFv
 9xNL/ljMZCGgCMS/ibg==
X-Proofpoint-GUID: CUqDmn1-Y_n-mG8rzUpDTA84rez0uv1z
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e1d0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DujDKyJwy_lwSZm1sVYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX2X0yNjNMXE7f
 JV1q6qksDIROFvZPucdO1RtK0IWsAPCIzaGdo6X2vUplmAhTh5nBuxmsjM82buHqK1jxq/LpL8H
 lQKLrRzRDvgjC8sq1vK1FZSBGMxfw2c=
X-Proofpoint-ORIG-GUID: CUqDmn1-Y_n-mG8rzUpDTA84rez0uv1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:quic_jkona@quicinc.com,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F167D723E0F

Reverse the logic within "if:then:" when expecting "required-opps"
property to have negative list of only variants which do not require
these.  VIDEOCC on SM8650 does not need "required-opps" as explained in
the commit 6720e8dbcb1b ("dt-bindings: clock: qcom: Drop required-opps
in required on sm8650 videocc").  Requirement on VIDEOCC on SM8475 is
not known.

Reverting the logic in "if:" part has two impacts:

1. Adds requirement of "required-opps" on VIDEOCC on Hamoa (X1E80100),
   to match hardware expectation, similarly to existing its variant
   X1P42100 (already expressed in DTS).

2. Reduces the chances of forgetting to update constraints when adding
   new compatibles (like for X1E80100).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml      | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8..be5105569cfc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -65,14 +65,11 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,glymur-videocc
-              - qcom,kaanapali-videocc
-              - qcom,sm8450-videocc
-              - qcom,sm8550-videocc
-              - qcom,sm8750-videocc
-              - qcom,x1p42100-videocc
+          not:
+            contains:
+              enum:
+                - qcom,sm8475-videocc
+                - qcom,sm8650-videocc
     then:
       required:
         - required-opps

-- 
2.53.0


