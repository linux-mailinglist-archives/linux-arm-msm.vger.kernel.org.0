Return-Path: <linux-arm-msm+bounces-117333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zz3gNtUCTWrctQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:44:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B476E71C133
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:44:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fuKxIRJI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gHs1aMmv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117333-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117333-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 242AA30BEF93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE9E420E74;
	Tue,  7 Jul 2026 13:36:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1118641F7E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:36:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431387; cv=none; b=D5n21akaLbUgzQ0nLggpjtiPfFz7bzxkUis2QdrMhwQy+sz+5fMtMEAOym9VmT0XsxhT1NMrzoC3U+ue2ZyYqYLhKhJS1BCaFYGX7+mj11GBTDRstB32bVqXUE9yh52DIT78LLVeKWdYm6amwBkmsPDf2T5p0HKo65X966RJm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431387; c=relaxed/simple;
	bh=Alnhyse0RQd39vex20gZgJKJR4kmGM195sWvR+fe8RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlcqJ22LVAb9hFk/CXERTittjdPNXRt4CQpar2XmHNvTlzykkvfOwhvZyZdyNB1u899xEaDmN7brbH26rg4POh4go7YQyXe82jjU/x6uBEDeFn2lXy51/pIM8AmtWf9Mty5IoRgFraft3UgNJmV+Sk/wXd01qAs8ze3nEEuLvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuKxIRJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHs1aMmv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8p3w3749131
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leLUisrQGv/CBLm17Ajf00RHu0U34YH0lxC22eUx6kE=; b=fuKxIRJItmofEKH5
	hJZvlCdj6EJ1ISycg34HMDNPaEI3zcXhcptTONK6Vv/zahNaBKs/VODJnWdedOn/
	y+LIALIRURRLiB0TCKL5utsnljkFmL3FRxnj/NVl1wRcspC9kp/qZm6rBQ3oQK+t
	WhHTLHIUX51W6RPN6GMCeFQMVD/IsHIef/a3nswYQfLUbk59eF91sNblmwfHW2dn
	i20a+glDQ5XrF4ihZRkX9WSfOG/ZoooW+CPxUYFaAn+t/QJbQcRsfietWgZjjCdy
	5zwXOuStsqlvmSvEXjy9eykEGI/qCmMivs/YdKYzYm29uNmTwspXSkCaYDjZfIsj
	j6J93w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9na7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:36:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so55616366d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431384; x=1784036184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leLUisrQGv/CBLm17Ajf00RHu0U34YH0lxC22eUx6kE=;
        b=gHs1aMmvxorWydAPT7XXMCSl8nwoLaT8NrCu+dtm5dXG5TseCME8rFp1UruxzBUbAi
         SVgfSxIA1cczOeZkxq+B4/yKJ4SLEPwSMWm9R0BO4ERleaxpL21Qtk8PHLQ1IUYvOXLI
         HExnzr+58F7lxTfK5M/l/Nd+2fwLC+Q8ovoHrshUMscSE5SlTfOT0NDnQnJY0kiM09ih
         z241niLHJOIT1fQz8cHDvkP9G+rIWewTYgY4lHKHlv3WDQwEUFkGIBHio53j68lh2918
         dDA7AYm05z0ZIEFrogK7ZGnk0gcnzDP1h92eyZ4SKbDIcPmcYcvfhacCAHUyZkOaI636
         fUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431384; x=1784036184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=leLUisrQGv/CBLm17Ajf00RHu0U34YH0lxC22eUx6kE=;
        b=hcInTo6fe8CMivSmV/8Qt0F7xJo2LSDIWQjCFQUQXu1o5WmtAPCI2D2jnNUog5s6mL
         MALMkVbz1kh0vFp7EYIEYThHTE0bMXES80p8e9+hvIGoEseJvMvMUxYp2zeknG9D8ril
         Dy2wDkNAoeMbKtc0P08fweyqW26uU8a1BDaixwc9L+Kb1+yt4+rzuNSLAjZ7avN12+4c
         mK7gVasLsr8KEv/b0aDUmZInixa5thDFifnO9wK6x/OW00NP8q0rEWDxvAGmdUSt416c
         42/fdg0ky/TpMCw0yWG0PZnZbZN8CVnRUI4mVJJ8vVNjmK9CRf88PpgBHk0GcJwWzcJQ
         olXw==
X-Gm-Message-State: AOJu0YxEr2bzMrwd98GXYprgsaiOekwYEAuZgUPPHL/kCXMkHA1diMCz
	RcOGq5msYqyukbf2w0/eq+MgZrP78abTLYsCjxdJgOvtsErdVVf7yt/HcqAuggqPDA+cMLhY94h
	DDVdoapncvCMDakIv+qtts6ndqQxiua5zWj+lS09EnnR6ajQKDHHtvdzUYewmDFh4lpHk
X-Gm-Gg: AfdE7clemfrOpmAiXMSXvAPjmHMDZtxQwxe2xB1bMweismgWQ3wftkINVSoK8RRwDcs
	piwdHjbgMIgN46eE2+lFKh/+Cawmr6veWDgfVCy/0zf5raUeOAn8KJabmaWjM6EBi0ei0J0d6XJ
	s3neFNXyqvjFxThUlTXEd3bfh7qK+f3vn8oj2We+7b77/g/zUYCRn5IKty7UzJbb1Vt1cJL6WCQ
	tpI40WJOSY1t7VGmCb2J44Rr3eXc2+imJn7w+YHd8nISl913n1Bnxb0w6LEme5Jy5u/lSDF7oqp
	u7bZY0AfvwNwv4BiFGculLMHJjpdHJXtMEm/f28H4GxaIySA/dthZ5ECgo4MusXMVYr/5mcrGdd
	kdZNkp7tSUArHKiXFkoCf1M0ikjJq2vsYJk4=
X-Received: by 2002:a05:622a:487:b0:51a:8c9c:7f52 with SMTP id d75a77b69052e-51c748dfd67mr53539931cf.69.1783431383900;
        Tue, 07 Jul 2026 06:36:23 -0700 (PDT)
X-Received: by 2002:a05:622a:487:b0:51a:8c9c:7f52 with SMTP id d75a77b69052e-51c748dfd67mr53539451cf.69.1783431383387;
        Tue, 07 Jul 2026 06:36:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:36:02 +0200
Subject: [PATCH v2 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Alnhyse0RQd39vex20gZgJKJR4kmGM195sWvR+fe8RE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDKa9/McfhgHEAf+92ts1AnmYPjXyFKbRtAx
 yflO9EY4tmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AygAKCRDBN2bmhouD
 11duD/9cWiPR6DbLDYU6ngKngxMn+IplCI0ewwvnDp1XojF3k+Qj0j4rRJeP4XgrJQEQo5syWNI
 Lt1juQPz8qmXV3i6dAD4rCjQm541mlMWwLMKgF6AYPq+ZtjbkcUMA8AdQnBQQxo/vUW+N2PUDqt
 U1ccWtrXd/Fu/O1eREP1S8rYfDHjeLtXS2jTVe0CiTRWwf69Hw28boqHDRWLHW3H6uNUhHIOb+G
 lOduiupRJUWJtdwxxhbxRvCHOztBHPJv167Fs7XxaTlC/0rugTBEX2hNmOtnJPPaoNtks6E/cU2
 o0nc7clcsuMxkQIfu3oqhWAny55D78Ik22TxdNKinvVYiucdlNAgrX8s3sGBX9bp/IprioHb5zf
 yewrEfg4y31lj8wXBkcutCyU01oVNoYKqNUgm/wmr4afY2oe2ZfdBCbfqoP9TckGjU9cUpKwZPG
 ojnEZyqefYbXAWJdZ8OM6SsNCHG+nQhn7URSV25g3gjAKZ6m1ewhw2SGED+d6FaN53/rKDjTqEk
 lPOEuLg5nTmhlgz+D94H2JfQqFG4mM/3RMfoTvhlMXzxRqCGCUesDgWDXENQEUgCDMY14UOEFov
 u/Q8xdyc7T22KvURGXWBidN0pbkJQAfyB0sb3blzxAxln5jFqX3qEKBFq4kjXC+1aSFu9qF7q/C
 FFfb0GWCGzBYw9A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d00d9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_rAPsDrPz3teXUbocaUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RxjdiyoC6khi9-K27FFGntxs5aeeqUBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXw6UuB2p7U18R
 z/ZzbSWW2A/8deie74BkAta9BQt7B6cYgzE0HRQPw0F0k/vh/2oZQQKUFwcA3hiN859qY91x5cm
 DrTs0u5+j/qS/dFkzX28Qrx0BurFGvbjrsurMumFrAkh5J1OL05hFnFvSDgKlxIquehg4Ob0Gl8
 V94hrqy9m611l8Ef8ymW2UHTHyn5IyUr5Qo4a1EKFb7tQukTiJuEdHSu5V2Sn9ax01txaG5iFBf
 kGXTK5rMGO6KUinTfjI/mccvOeNQEudfau3ruVlFj03WVnU0RkFFui1MPadKLWOfCF+hRXHeQK1
 VlkNlg1wz4WNXKFmEd2mxSn5fp4a+FsuD9LOVaR0LJvE6StM6Y5Z1qwS8wtOgETS7lj4TMOd/yJ
 rI/JAmbsspZmWgzSjBYbfCR4rM0O5ADnNxO+6f/RF8HwjzV0O0UjJxP3whTfmu4Bjk7dVh9tNnM
 sKOVUkOd+0ujKXkiWTA==
X-Proofpoint-ORIG-GUID: RxjdiyoC6khi9-K27FFGntxs5aeeqUBT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX510mGLoOTDmB
 vEjK7NkhKxycbO8P1LLCKTQWT8upTry8grDTjUN5hGiyY2xUz0CpwqxBJvIsdkok6XUd1pKmsjo
 v36T5mxTX6cDUZtI8+YwlNRbz8kPnzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117333-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B476E71C133

One selects in this schema captures "^qcom,.*sa[0-9]+.*$" compatibles,
because there are SAxxxx Qualcomm SoCs.  Unfortunately there is also
WSA8810 and WSA8855 I2C speakers, so they need listing too.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index ffdaff073c92..d8806f6c596b 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -110,6 +110,10 @@ properties:
         # Schema matches also sound card nodes and its front compatibles can be anything
         - pattern: "^.*,.*sndcard$"
 
+        # In general non-SoC Qualcomm devices do not need to be listed here,
+        # however in a few cases they got selected by patterns in "select":
+        - pattern: "^qcom,wsa[0-9]+$"
+
         # List all used generic fallbacks. The list can grow, but in practice
         # it is not expected, because specific compatibles are preferred for
         # fallbacks as well.

-- 
2.53.0


