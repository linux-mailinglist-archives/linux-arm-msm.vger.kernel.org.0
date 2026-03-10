Return-Path: <linux-arm-msm+bounces-96600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fu1Hgz4r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:53:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E788A249BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE75630C5527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13103859FE;
	Tue, 10 Mar 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmhGZMy1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNrL3yCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D69D3314D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139724; cv=none; b=CLdr9MfAGiOBwurU3aG1nk1uolASBppOd1PRsS2oXkpq/jXVCf6LwBJDQ5pgx1eojBaMiMgVB8mGQ5RhdjKizBurlQI0ngcha6aOZ4X3QjohSpnfgjrVgotsV2VKlk19tRcQ+eCV8ZiF+wIusjJs53KCDlxsA8PDkQ2p0+migNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139724; c=relaxed/simple;
	bh=9y3vAnjP3UtwfjC7j3GU01y6De/z672X2VvVuImLkRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxnsYG+Qo2P4F1o+LNQbP+EPXZQ8FqGoFuVWrBkuoDo9Gm99jEi2M21e1arXVJINPKEa+/OEgV+D03FKAC40wNhTMN/wN3ZBqgfO8a8pfrNdzVXwRGJiYB+02xsREgifNEnqpyAcGidTnrpIovC6y982ZFzzjUv06bm/AXSVEqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmhGZMy1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNrL3yCp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lJlf568763
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BUr7hXhaCbtwBIPXp9T/qypWoIvJOLLwsRBQ1CEOlg=; b=cmhGZMy10GIGbRim
	PXqjeP8UIPyvLxExQ2QNuY694zSycjQT/ML+bxRnn9ButtcRMZAfyj3lhVjTFEvu
	JLZUEOC/ICBV8qFcZ4MGImth+eh05gt1yC0mczwvucoK7TNLghJcPvFkKY1v8nbj
	nLHiOcVdLTSzLSTevmjc5sTm5DZqX61q7wyePf8ZfoOwVifcUw0Meftl1K0yVUb5
	ePcEFZ5Q8Vdf4x8GmsgqCl+o/SBqLe9VE77aWJiudoF/2hAWgFtxoWmmGDpOCzpN
	j9oRmTnDd5NskAHPAzzGccKJz7UvdTXuPW6yfk63IEU0Y43j6DodFuTota3TApda
	kYwZZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h47d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:48:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8dc8b434so121742285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139722; x=1773744522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BUr7hXhaCbtwBIPXp9T/qypWoIvJOLLwsRBQ1CEOlg=;
        b=TNrL3yCpeRuZeMW3AbFt867cfvwz0q1nMdGTKtoA8olT8a9RaqReRY/zz9RKHmtK27
         c/xZ52+78dPERYSPg/M5J8JwOoMwfJpzcyhRLS+503OoCXvjRBOTNhRkSuh+xvUB1YwU
         e+lb6D4Mg6WO3fisVTqZyHwxe3cPwJDmPyBALtt+rkAUwZKo7auNLLeecuPNAqNZPBYt
         yYYQmku2qWFy3Q3VtuLP9iSKGx3K8pQ4yG34yj4KVdLUcVkpOdgDGp6fRW2oRibaZa/H
         tlqfpZV3leQC4y8Scs/60GoT9wmlLerrFYm4IevU+jS0mEXl7dfsnGWqlij6s34flWBt
         9Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139722; x=1773744522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BUr7hXhaCbtwBIPXp9T/qypWoIvJOLLwsRBQ1CEOlg=;
        b=rdU8kSWPEfQmXKVL15co5O/tDscCpfL84SOLUAmZafRA2H0EtITzPPaxTCy2PC6vc7
         BgnsiV86D8jKsdEikHJqHE9SSz2V4gKyhVBw9a/0nPUlznEd1KJym2V5n5CKXi9Ioj5r
         2Cnven6DDSWIQlrRgbSV1SPkVn6eVY1y76ZdwUt9FPMDxu8MLDHP+U4KfI43b07s8Bxf
         AKIN53mc+Jo2mKcuanLqAjkcvJtdtg4vdOX9YRuP0S2a0DbMAD89NPzbZOQa584hD1gA
         YL2dHzw9AYde3lbLTO1V78bjG/c9ezhflOQG1UOnjPxQda2mevFOTrhwFmXOwVlgjwpv
         Muyg==
X-Gm-Message-State: AOJu0Yy+S+KbuIObeiHnZVx6LgyyCmksu5l1xrLwm1YvjDgnfLpP56hN
	keMEZKRlrMJB2R3wbuzszk6LkxcwaQ8QxwS1YI8h7zoUfW8x2C5V3EHocwcqE6odXS3fspK/6JJ
	gFQlz1nvW7B83qeRETF1LB+mP3RAqsSv1ySyU/k6ik/H1vb6mHgw+6lXJfdsD9wxBW2yJ
X-Gm-Gg: ATEYQzwBL9jUo38fz5fsfu0FrFoMsR9ix6mF5IRuAqVybgzi36xf5gt4mqpZfjJJdFL
	PRo4OUsyIqspB5w6Zt3h7FgMVKU8Ua6jJk55Iq1Ml//mowlo0PNyw5/ef5qmfxS58NvLsZ//LsL
	flaMtaVMYKpEArMj+204nhPO6cb2hf91wM9yEsnQNko2TDGqhezrpW4/G7zPMvVOioD0l7GNydI
	gPl42DFDDdzjReBykINI344qC/jyfj9Ik8TMrEHXZPhgWE0a+/mvwMNse4ehTTsYY2aN11Wsca+
	FjR2V6FtAPH7vSINbavzUjGiw07UyXweYXZQNdh07pMEKLlJRpeOLeUEF3bqKIcJpoCTH8ihZw0
	QRCJ2rzjk9Zw1NdJy6j7/I69MFEqGwh8jwEMINLvU36R6C9nJIbblTnvMgOXJAZUFrjdChr8/99
	32p2k=
X-Received: by 2002:a05:620a:370d:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cd6d49009amr1450051685a.9.1773139721794;
        Tue, 10 Mar 2026 03:48:41 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cd6d49009amr1450049585a.9.1773139721332;
        Tue, 10 Mar 2026 03:48:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15c40esm494024166b.46.2026.03.10.03.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:48:40 -0700 (PDT)
Message-ID: <5f41efde-3bbf-4832-bc46-1e83126301ce@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:48:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad
 and touchscreen
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MyBTYWx0ZWRfX+5ul5wDTNFwz
 fZGD5RTPtUQP6526yFSFgP55ff9zOI2K76qV/Ex2RyffLE+1NOHVfKyAycnBuOO+MkWrKtiWYC2
 WBXAVdPG0Ua43xqQU/iYipG+FNcBb1hIvw3dK55ajxk4OO7ugLaiPvKAhbreNogbosE+R7L+B9z
 35wruOxvZy1xSm7G6l8ICmB2ZvPDSYwYY3wRQ7f9J7dJURHhkiiw4ZBFjVKe7S4Ej6MKi5T8CKF
 HbpxhB2Demy27foPJ5rRmHktvCF+AsWlAoggSUuMvbgjVU83Cx2mS8NVVhPHXuC8LNGwKk7HX8y
 DCqFMfBnTVa8thZuVS6wnoyGWQIaPJbW1qrXmKlPKcrVvqHetlYqMbWq4rgaRavnptgyQ0I0T4b
 MEJ0dn1NV2w0seIv4HXhjpm71HnRwtGFEo6r65eUy62Ei5ONxyhxUdfPvuoxV3JfTloaP0XbQg7
 VRF+ChKzPs9mV9bOObQ==
X-Proofpoint-ORIG-GUID: lZo3p8DrDnKHYYZyqmxlPt2SK4PbnAEZ
X-Proofpoint-GUID: lZo3p8DrDnKHYYZyqmxlPt2SK4PbnAEZ
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69aff70a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bX_bX3K2iqdTeITeXfoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100093
X-Rspamd-Queue-Id: E788A249BAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96600-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 5:35 PM, Abel Vesa wrote:
> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> and all share a 3.3V regulator.
> 
> So describe the regulator and each input device along with their
> pinctrl states.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +	vreg_misc_3p3: regulator-misc-3p3 {
> +		 compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_MISC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&misc_3p3_reg_en>;

property-n
property-names

please

[...]

> base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
> change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
> prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
> prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
> prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
> prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
> prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e

More importantly, are they all actual dependencies?

Konrad

