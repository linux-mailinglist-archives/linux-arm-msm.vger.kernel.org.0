Return-Path: <linux-arm-msm+bounces-116861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SENqK4K4S2rDZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:15:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A9711D31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:15:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IG1dJhQ2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AZWnK8dL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A46E30D7A57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FFF388360;
	Mon,  6 Jul 2026 13:28:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3952E7383
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:28:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344525; cv=none; b=KdDbqLUmQJC3Q0CM5yD09H8SHaa2lCBF2tC5OIUwJq1CxzkUneIqnB2E6LXYskN3On85UGg6mlokH38ra3szSrOv4Xm33ErGWGjniJhlWaVigeF5e1tczr2g1V5P9dUVtzj1H6Us7rKFldEyrPV9A8F2UlYh352jA5inXQRnn04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344525; c=relaxed/simple;
	bh=aeuaeWBxBFIr4Q2r1Pi1YsBsyu67CD4Zmp52h51ilWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eka4lSuI42hpgM010yN1ZL7uA7OC66RDECQ3Qi3q8AsiLpGV8CyUxsclA3dqP5vJu4oOwLUOP+HPrml7pbU31FunF+RhyfsRxJASelvcmqwdJX0p7q+ij05ye+CsWLiEJIc+O8w3E8Y5NRR03D29d8f8uiCM+lK37Jk46IFXnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IG1dJhQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZWnK8dL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTOJ219060
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F4YzPvkIFafrsTQeecRSVEE3
	uDq8Tr9d6kglclfX8Qc=; b=IG1dJhQ2TK1lZoqXxDBTZiA7WcNFplkT0ifrIvey
	REBKNB+1aTtd6BL6LsV9wdDjL8qgV89vpH16GQLHAqmPJnfeLEIy9XeHlqNcPWWJ
	oME0IbkU8hJOxP5YoBeZTu6IdU8bWvCX3NHFkb+X8EnCuql1NuAxMkfe+FD9Shsi
	C375zzzMq1XIxbkKxqV+rfmGw9nhM+6ZNwKClwVUBFYKx5bH2PZgiq7QlvBLHo1k
	7LxSst3uI+FBXZpOpm3MlMhNmmCsTSckok0vrwBGcir2X4eRvTzJscTa41pWaMI/
	DwN60N0CdgW3F2CbamteCsjfWzNJynl6ue8gtZsquHw/Lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs998v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:28:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so3753589a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344520; x=1783949320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4YzPvkIFafrsTQeecRSVEE3uDq8Tr9d6kglclfX8Qc=;
        b=AZWnK8dL7qokZK394cLzo+bSiq+ON6wIkLYevQ3E+6zVAVu/upH9tfGarrC6b51O/Q
         2NeVm0tgQF2wiCB1rm0PWS7E9JoOlv+jGKKeMXkNv99Vlv9sCgqGCk4EtwVEACz5IQze
         h5xPk05sioQ3tcCjw17AJ46IREv9XrGUBp9tEIS9oz52XxeYCMU5JQCAFmE94LsVcSCj
         qqP0Fkn1ml2ArTsRfqfABZ6r/nNUhA82pg2v0Ol5pOz6k6zAiNjgc6GZ9PpS+fS0SmYU
         lM3mROu+wLi3ijC8G90S1wHkNOkvxy86LT9eerFDeegNnzFYKPowbaJYuI4xhB7mnvKl
         CwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344520; x=1783949320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4YzPvkIFafrsTQeecRSVEE3uDq8Tr9d6kglclfX8Qc=;
        b=dy2IsTuVQiOr+ntLYGI2KjoGIJO6AcYgv2KDTDIl1+z03zTC8cprFtZniN4tQsZpmp
         TXasQfbUzogDHVEwk26LdbU0ttUQjvMWPki/eP+U+MB8B4qqNV4a9qbZfgLB4AbwdgDc
         KZ/rboiZdtXcZmKqKQX6reoXlGzuxFQ845OdatEK8IbMbgstWBr+s6++GcBCTABOp3zX
         BtLyw4WwbwoX13ty5SDNWQOQII9oU0dXYLaYYD66fQJxTwf1T62CHpuwxVG9yVsUsMqH
         nAQ4UCyRdRnV5lAp7pVno60E+GUWAFBLuyXWhpWB6l1FLBLm1bioU/Gk38mHqOXIM7EQ
         wnpw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6sT0kmn+w5OCVJmd6OiXQsikNUj0LhHhB61xJPG2AE94d0F0CcpTFGS5rqishbAZJpC6VNko8OVHN34Vf@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXzT7FMjLdQyeMhaPatdkbBrWBezxkjP7Ls5QS2++EuZ0VRxJ
	3dcF4F7c/jVOtIZJIruF0G5dgI0n0V2yvE9pblB910awbvfBQ9CdvdkcK/x4jyniZMqPkU7lEVc
	MaFZZwua1v0cPRy7tHhwebquAj/fJeNPpP0TcIm75ENcMhwuHWxInq5mZ83DEdsICwdEI
X-Gm-Gg: AfdE7ckELh/bAxuMVIZ/MrnBT3VXHfYSvB+qc81qFMTdxtZj9swJYIExtG3KPV1NVYd
	rTIfzgMV9K1DffHBa+2mziOqttxFa6HbhDroOQI4DaRApoiRr4dqDU2HWmvlgmof+9ZxrsEYbqB
	d2RSVyG65HssSkdZ0ydlj8hqj+KU37yop3xezXPWzrsOnuXnakZ1hVDP7mTjMulPwMh04SKR0q3
	hjipcCRXNNi9v+hAf8rA8A5FL7oiI62iLUiH+pqapjQ6kc4g2g8hhEplLbbCdqjnakt6oEdJTOl
	i7uAhtuIsWElvJk6bjMXDS9GJxgj7oNk+zZjZDMjOFEqPUMgTsuEtah4kzraa2Om8WMnT9ISmYZ
	HDCeXgyI2JHK4KRVjIy0Je8rBDTKOJtwkzg3jWfo2xqBE9rVGz1Oha1HXjA==
X-Received: by 2002:a17:90b:33c2:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-3873e06e1d7mr573774a91.12.1783344519618;
        Mon, 06 Jul 2026 06:28:39 -0700 (PDT)
X-Received: by 2002:a17:90b:33c2:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-3873e06e1d7mr573749a91.12.1783344519098;
        Mon, 06 Jul 2026 06:28:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c3a92dsm5135980a91.7.2026.07.06.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:28:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 06:28:36 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <akuthPV9qS72Y8an@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
 <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CSmiEulb4Pt0raFi9RaLQz7WvUobGll5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXyUrrP5hGHZeQ
 qiLqajOKOAH2PCBktuzKZzF17hZzWUNz7AYZuxF8jXH6oN246JD9Xt4mTg36qA5pEKfwCM/gK4+
 WYdw98lc97nm1SEDrcIjGTZoGnxrAToPepVGh4baSk266qf2b2tNqb1yUuRfrHymfwOSRXgXkIC
 ebR7csSJBJqPk1GG3/CvYRho0VOvzdrGmAr5iVuSI6ZsBotQO0ncZckUqQG4ufDtfmklmjR2EPJ
 Rg5TgcZjzBsRyH/44bMWGIvObrR0FEqsa9lqOzAzuwFM4PutYu7sjWylOVJmT/tJGisx2Xt8qCE
 dm+poHevqTPwfZwGXromWLysxxfeGob4dPvkGxKHy8ury7d6n7ghW5gZdoA7520Y6EqexUC+hD/
 G4hG8r/v10tAxPR9GnrA9zBwSTjKXBbbDy0LIGgezgtfORJxyuJjJVT19OoO4lHUpyZc8rOO83d
 6U3lXbdCSggHWYj/Rnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX5rJ3cwkw0SR4
 bT4SAnREKQ9D+m8Q8ZI9h14UbiuQEUFAD/16V085S0U2okRz1MlBX3u5Tv4wFShgyZ+3o83wnwE
 F2s40QGNAN2H0Q4ERd9fnVzytuW2v9M=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bad88 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uIdvwDQCYy_p0Y3DDrwA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: CSmiEulb4Pt0raFi9RaLQz7WvUobGll5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 908A9711D31

On Mon, Jul 06, 2026 at 02:47:40PM +0200, Konrad Dybcio wrote:
> On 7/2/26 9:36 AM, Qiang Yu wrote:
> > Mahua is based on Glymur but uses a different QREF topology, requiring
> > distinct regulator lists and clock descriptors for its PCIe clock
> > references.
> > 
> > Add mahua-specific regulator arrays and clk descriptor table, and use
> > match_data to select the correct descriptor table per compatible string at
> > probe time.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
> > +	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> OK
> 
> > +		.name = "tcsr_edp_clkref_en",
> > +		.offset = 0x60,
> > +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> > +	},
> > +	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (PCIe4) OK
> 
> > +		.name = "tcsr_pcie_2_clkref_en",
> > +		.offset = 0x4c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> > +	},
> > +	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (PCIe3) OK
> 
> > +		.name = "tcsr_pcie_3_clkref_en",
> > +		.offset = 0x54,
> > +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> > +	},
> > +	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> [!] (PCIe6) This needs +RPT2 +RX2 -RX1

Correct, will fix it in v8. I thought PCIe4 PHY and PCIe6 PHY use same
QREF.

- Qiang Yu
> 
> > +		.name = "tcsr_pcie_4_clkref_en",
> > +		.offset = 0x58,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> > +	},
> > +	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (USB_HS) OK
> 
> > +		.name = "tcsr_usb2_1_clkref_en",
> > +		.offset = 0x6c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP0_HS) OK
> 
> > +		.name = "tcsr_usb2_2_clkref_en",
> > +		.offset = 0x70,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP1_HS) OK
> 
> > +		.name = "tcsr_usb2_3_clkref_en",
> > +		.offset = 0x74,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> ("USB2_2") OK> +		.name = "tcsr_usb2_4_clkref_en",
> > +		.offset = 0x88,
> > +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> > +	},
> > +	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP0_SS) OK> +		.name = "tcsr_usb3_0_clkref_en",
> > +		.offset = 0x64,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP1_SS) OK
> 
> > +		.name = "tcsr_usb3_1_clkref_en",
> > +		.offset = 0x68,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> OK
> 
> > +		.name = "tcsr_usb4_1_clkref_en",
> > +		.offset = 0x44,
> > +	},
> > +	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> OK
> 
> Konrad

