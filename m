Return-Path: <linux-arm-msm+bounces-118741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V/SOLH3FVGoCSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:01:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DD74A150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:01:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HIumgAAP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xghlrzbb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118741-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118741-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB79D30480CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CE23E8C46;
	Mon, 13 Jul 2026 10:57:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939F3E5EF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:57:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940257; cv=none; b=SFRG6NQ6AtZgiq50inqUfZKlHWOir6mDdFhkMn5Ix/xPlgvAiSwotXBxREkygzHArTG8L7XSlHVD3hMETgAf1ULmzVXjHo3HjHEIMTAL307xQ8wr5wIxsJUxpCGP17vnaYN4b31y6Nsgt4D/GfIr+/ywiaT1HuGY0JSHwzpbHGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940257; c=relaxed/simple;
	bh=eWKFIqGcxb5daYB5XV84TSZ/un1mg4zb8ypW6BzzXIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLu2n7qWzwK4+RhJQ72BQ1pJHDtIaqdfLIM9PT07+pa0gI2F25P7/KhIChFM5nOeP5lc5iIjpDOvGZXWQ1KVI2b0CdAJ8gMHxdESfZYhzYuIesLngOHck1v0JivGDDQIpybA2As/+sN2RifyTqQeB+ztXPMfvl3JxhtBOaMlJio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIumgAAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xghlrzbb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dxO0955934
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWLcV4ug3P3dkdLY6r3CXDviUHwWQeJyI4io+fMIJj0=; b=HIumgAAPNhAc5liD
	XiOuxoeL1Fz5l6Zr8YWmPNKGe+AXhR2FI/0s2wyAALIXkIEgGf6uoUe+c9weDPaP
	2V7n2OalmhgPiOG84P7V7dqNqV9vT6GLyeFOOa57D/0jfvCC8R0IJ/noRrzIQZnz
	ebtuKZ2CRBS+89cvjdfchU11gca0N5v4B06JF9mYc955qv4Np3qNeqieopNV5GEn
	JYxuLdkYx2iwHCwKhYFEfrIRQ0kgb1lA/3iCUVdPKC1lCfU7bY4IHEfh6Pa9AwO+
	lnC4yNsguxcYNsA3pjchbPgR665otF3RWKFySM8mGyB65aPFU0rHHE3SMvlw5eEW
	aHcyaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9r8qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:57:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so11869341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940254; x=1784545054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWLcV4ug3P3dkdLY6r3CXDviUHwWQeJyI4io+fMIJj0=;
        b=Xghlrzbbn1IsEQ50g6UiLU6tzKvkdNmoBSDLWHtZykeaQDIlPaBpup+1hVMy8ljQp6
         OlYSiLiSMZtdGGhspPqOZ26Km4KJqWOBa1QnshLkQCFovxVathcDsd9+gWiQTjWcYplj
         qbWRY0s0DPg1o7cBJDKltwDwG1Uufv67tpDjSg5dWPEPrdcItYP7gc2Z0U4XK8fMaock
         TWXiC30dF827omWy8tQiYZLUyN9sSt3wUfCg4+C7+bDtbAgG57QWo17/sI9AbblDCTJ2
         lCH8Pfb2muJDJcByCAOCiSNrKp5c7BNGq9Wu9hldqFbENswBHCxpU0BWSmuBT1e8RUFE
         PYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940254; x=1784545054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWLcV4ug3P3dkdLY6r3CXDviUHwWQeJyI4io+fMIJj0=;
        b=AUayWolRvQXpkWJhTXBtbujrahr3gqYuPxgciUAPA70xKVxE0dGgMbYQUwwF06rq5O
         5aTcA1ktSbvqhd6NaX5vweLLys9cVSYZW2TgyFKt4p1kJNqW7sicZrLMzv8oS1dnk5RL
         nF3hRXm5XTdnBQD3SODfPKXQsZRhr7JujYZA68a6cAGSojfD4mU7g9BN/hP4DsQf4FTs
         w13me/5ZKvlYzU47ku01P8EM4L3+F9sCj4B9eXZHI65lOMSROIdvSxmtN1iyGqAE/IS/
         hJOUTP3NVGfsJTeTLHc2Q3YPBTpG5IfPuQsqfQMqqUvSA/f7iBY/RiRTH4RKmjpqOyet
         Oqdg==
X-Gm-Message-State: AOJu0Yx1PRMuWB+wnicktm6ehYtwTESum4T4R49S+yte4OJWY9iulosU
	Bg/i8U49BWjcu6iW8SK2Rv7cnNd8hhd+/qOZoQZvq6o8Ew6hOAKb4NhSa7kKvdrkyT4oeVtXpSl
	4ZUQ/RK52ZwqOeK18DMPt/AkAkHu6Q2a0R5a1SB7mjd3l39gaVbbfPFMmAh9S050ZQ2Ay
X-Gm-Gg: AfdE7ckQlwo9lqFjz2KzesXKjBMJ6ZqJbmNmCLcJywahSU81JLLnRPzdScHp8E5tIBE
	gYPkbvLNSOge52e5/iXsZ/IjlOdDrviy2E/ELmEH90D7jOEBMwFaZb769q5IAGfhkASIIBMw1lG
	wVcOJUucWatSmuRAoivqROL6QLilYjJFqbOkQBIP03nYvR6/3V/kGlN8m7UwHTHmb/qD1rIYeJg
	tXzs6ZZatyEJrFhyMmJqJEYeT1PPFv9hSZr0Y8YNOPxNh3LmJQL7EDUJF9xNDaoziRPX96AwFBL
	pMYasjnACWjwqd4xZeMMR/PWhyHbWDxpajcdu3gGNIhm6cFwHQgW9YfcStGfGoT0/asOIz/Kcxn
	6jAwKu/jdhF79698RK0DTYNAchpoV4it8wrc=
X-Received: by 2002:a05:622a:4d1:b0:517:8999:6c50 with SMTP id d75a77b69052e-51cbf32705cmr68035341cf.8.1783940254282;
        Mon, 13 Jul 2026 03:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4d1:b0:517:8999:6c50 with SMTP id d75a77b69052e-51cbf32705cmr68035131cf.8.1783940253827;
        Mon, 13 Jul 2026 03:57:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ba3a8ad52sm6872474a12.7.2026.07.13.03.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:57:32 -0700 (PDT)
Message-ID: <d6a56ee7-2380-4e2a-b217-6d7398944279@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:57:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: dispcc-sm8450: Keep pll types as is for
 SM8475
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX7Ci9zLFb86le
 qsICcOf9R6DTHqcX+nHCnJUC3gDYlLYC/zPmpBaM/5uHvenKYdHJvQzhkXrDL05JAJDkJjhCf7x
 eU1zkIMWn0M4gfoHpGu2HNeGAqQK65gb3dDI9t8ciMM95FjlXbH2xE+HoWsOwg4m8tjCt/cXxRm
 64DZ435vl7RTiXxT0+I/z6LGlMfzXDSOH8lWQLtjUHFefEzarradyCeTfhAdLPPYKqmZnS1whXX
 qeS4Jw6rMq0BP/Yb7p8gdwFo8QEWzhsUSAXkHXm9Do0sYV2dbI8ketvegTA/cqfvRMivRcXaqJy
 qCBkLmfAkrW7w6M/mAxbT7dT4ZJy1eH+U/7vrKmgk2M8pLcByvoRZ3hB2uhzkNVbztacFW1nfVN
 uyyIZh6ooCPTdTG4l0m2JUR/Dw7JDJysn79P5FDn8Vhaem4Lw5MiblRCz0PvYjkASCiCpEytnhR
 2QYxXFMlu/7AaEQkKcg==
X-Proofpoint-ORIG-GUID: JZ-zNV_-eXDDyhIQug6SBZ700IrRZxNW
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54c49e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=LUpji9rnTEX90CYeXO4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JZ-zNV_-eXDDyhIQug6SBZ700IrRZxNW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX+Co3l1CskuAu
 itBgLjGbe0+9R17Lk+yT5ORFFhSVygo4Vvp6OKfzB/EZeg6nHylSIs2bM+4Np9bzB23ESmnY6f5
 y5on9Un5VtVqv4XkDC6fS9OTHiBDsgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118741-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 561DD74A150

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> While using an OLE PLL type is correct according to downstream code, this
> results in the display flickering at boot for SM8475 because downstream
> uses EVO type configurations for both clocks, while, for some reason,
> upstream uses EVO type configurations for SM8450 and OLE type
> configurations for SM8475.
> So far, no regressions have been observed and the display no longer
> flickers.

No, these are two separate hardware designs and you can't mix the
configuration like that just because it so happens to circumvent a bug.

Taking a peek at clk_lucid_evo_pll_configure, there's an early bailout:

if (trion_pll_is_enabled(pll, regmap)) {
	pr_debug("Lucid Evo PLL is already enabled, skipping configuration\n");
	return;
}

I think it should be fine to copy-paste it as-is for LUCID_OLE. Please
check if that resolves your issue.

Konrad

