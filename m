Return-Path: <linux-arm-msm+bounces-110218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NO8AFE3GWrzswgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:50:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A35FE2DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 686BB3138E45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 06:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC8E3AB284;
	Fri, 29 May 2026 06:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maZeyC20";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fao7VSYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BE63AA4E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037113; cv=none; b=EyDflPs0leU8KmRCXiLZksY7o7tccNHgjNfwKRQ2LIedW7RDoHmzfx6y+IL/njYXajdABW30CdTzPAjNNMbNd1z7PGr21ZJje0xL/QcTJf8UuxS5CQXLRo9Dbs3vi7cz+ouyq9E6Grg1ehyZYrH0pK17MQ1KqwPbq+WnEQ/uDlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037113; c=relaxed/simple;
	bh=yD3JbYDQBS5NzV5O0cc+TWqONJZR+mmEz5px19fiHzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He0SdkwUV3SNlewbEqUMb9UEiu9wSQyQpjpbbrMofjhegxubqWtcMcifTKnK04ZKKvSbpIC68vE9ifjPFMxtWVUFr1KUpndSelRgmus5KAX4jhjTiTBSFJEG2YBQuZhOmRWd+1aaTf3xuKKaTLs57vCknFFph+myLdDyhtIg6bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maZeyC20; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fao7VSYi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SNrwES2255453
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OkAKhyTC8qeodj38nW8B4+eA
	ShB0PO29nLWU3roLjAc=; b=maZeyC20sx8mzzSMqayJkE96HLs1XT/jkQiSpMyb
	XNuilzPsohU2dmwrpPPctVrYqHDSStW9grAjtXieEJtGL1ePem39iYHYCmqP0vcU
	hZx8CSObtYWFxz/8/LNYGjg83yLP1yF0QLmB9S1In8fdwdDAhSReeYqNhN2FBpra
	9dgQAs7eDNG0aALJ5Z49/1i9d4r+76VWO/EpLgxcvbQLYpW/zFNZCohu0Nxn9Eyd
	ImZ76zVcCZC/8vPh7G2Ylt8Z9mpp2hSira36yw1RHstjye3TaayFSlWXwxCFhvSh
	P0wO2bg1n6DYLeE5NPmXzB5yJZFaqeMAjPoerYZ7M+2SXA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety52n8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:45:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f1820babso160505eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 23:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780037110; x=1780641910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkAKhyTC8qeodj38nW8B4+eAShB0PO29nLWU3roLjAc=;
        b=fao7VSYiYITwkvU51XI/+07Ot0Gf5hxGKMGWbIIpbybDqHt+rfne/L3KqcNfqE2dCf
         Mxu52/k48pmcuKcLnZ82JLNV1otMkY7xDHaMOFfz4FnwoUSpKGep2CXCuWWNPI2gV7BW
         OID9SfBje11xgXeFkmgGDdL7bk6dwpZsNj6VbSf1icabE0rJOJKCs1jbRd/SOmoPDFsq
         1T/VHKAwcBCiKDZZwYlYwvHG/yOjzr95zsuEi0KZEzKognE2ZIT6GjxF1VjE3OQLEQCw
         mFFbu7bt4cxhwNMtuTbNlX9eXezmxIMZMkK7iwnxNgfalWRVr1fZje+/l6bWjV5RDrli
         uKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037110; x=1780641910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkAKhyTC8qeodj38nW8B4+eAShB0PO29nLWU3roLjAc=;
        b=hiepeSjhYhjbyyubq31xIN9yj9iRUicuPpgLQUJrQh8vrjGPMAhmarDeB5haYMGrks
         5pAuqBGCdNwlDxA8HHKXTqkkvpYRVy7qu/U0DoQw4uVeMex7vTqfdCgZ2MG0XRcUJN7d
         7i6ozgl6Nq3M3iswKhJ+WyZxvDewe5LWIdCDvafSqqbhmxYP/VQmV4cbIyWdSQG7WgSD
         LGzqcB9jfsr5kq/xMYYmpiANpoQ1GYyfnDtB4TJiuwDsTGgCgbD/8uYM4WUtSFd4iuBZ
         ojAsN+1LfWdHEuIzzHbyeORjeN9syn10iJpk97nBfocEox1JAvo9S7ERRXl3ECPHodKa
         gwGw==
X-Forwarded-Encrypted: i=1; AFNElJ+en/Ok68CRK3c3gYPfzDp4agETGtbD+V0iGHEfbEMuWBh7w8H2xakSSHR34UFh90aD+Wbku7Cojz1A9Zp9@vger.kernel.org
X-Gm-Message-State: AOJu0YxR3EVnjSX9TpN4oX7iwFZrXE+g1JYuz5lMTPdzb7A9+AbZZIVh
	omAq3irYucRNjpTZxV1BjhRbtxRG+a+5hCPLwUB7aGNv6rGB00i5ZTcSwhx5DMxDW6jqFmA+oUs
	ZrpkZhYeov0uIOu09fNYBOhqUSboy1wT6Af+ywnBPTCtVOkBMhDdLnhmeG5OE6vcvGzRh
X-Gm-Gg: Acq92OFMQdRySdAlHiw4Cnb5E7OyEs5C79kn5b0oTjFMfQexYidN+dbdLFjGcuN2mPQ
	lDEzcq/B9A0z7jli8A1+SRJ8Jcilv48LiygYXO9sEFH01SZ7kKzc4WdvQMX/lB6nyHSoJ1b6EEA
	jC9ky+eiz9Vnvh/JmWca2IxBf85+M4ks+lKyzKuP9MKiMVtRgUt++OozsHzrUfwm3wlb2fm53/t
	Ptzca1dmVQKHutVP7ZL7vhtUOEPNhZ53N/MN9TabBdp9rScaOutKwJOrGk2UwfSrN1ytaQH72Cj
	HOaxH4k6gN5a1qznxWNReK9ydwJTWjlmsYi5i03gD3cdxGwUlxtvwbX0SkaQlc1zVEOij1zEnHx
	BYp6uDcQgtCTMQQXl2+3vb+ZZ2Vse1fo/vvKwP7MG9wShq/reFZHH05GgFn/k7zNQkX0DvaY5xY
	XTSzU=
X-Received: by 2002:a05:7300:a984:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-304eb113e65mr737675eec.29.1780037109898;
        Thu, 28 May 2026 23:45:09 -0700 (PDT)
X-Received: by 2002:a05:7300:a984:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-304eb113e65mr737629eec.29.1780037107884;
        Thu, 28 May 2026 23:45:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ee0dd8e1sm690953eec.21.2026.05.28.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:45:07 -0700 (PDT)
Date: Thu, 28 May 2026 23:45:05 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
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
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ahk18dgPtHOvPs1l@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
 <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2MyBTYWx0ZWRfX9M+SDACEu5xW
 Fc6gcqcjgYhedDVKLb8gD/y2D1lAHfkeyKYePphZ6FlEsKchnaY51Cz7deMylrJn0VOTzJTOQQT
 dWdnQV2pvuvfFI7GkYSt8928FN34X+NYtulUZbqAez5TqgQbj6VCFyChnZmWwSfXYFpzM16wy+S
 kpCE7+/CFa3Ex80cjBWsWU2qvIBAYrAwF7IlUDLMpKe21DI40IFF8U3Ac+yjD4IKRFQlOhytY1o
 MwzWNTq72jre3LbP1AK+iscUTye2xhwftU37hs6Ggdiu7iTIU5pLGvrRItSbb1aErCB0/pVWXFH
 KQbUBLx5vv9EttIE93DLMHycN8uUAIXADks5Dnv4zVzr0lVPNr8hnek+Ub1cknaG1Zan1sx8BhT
 JZe0Zj9xw9fmHVROSqvF8k804mHQ76vKY+/Hh60HJvoYp5CiVXNWZSGa0Hii4N4tZTB0NyiQfJA
 rdzZPulmEZvzCZl4pmg==
X-Proofpoint-GUID: EMAr8YoyfJrj8aNIDWPy7Mqsod9jvqRg
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a1935f6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=789t7zhfkhQS7FZYgY0A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: EMAr8YoyfJrj8aNIDWPy7Mqsod9jvqRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290063
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110218-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 757A35FE2DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 09:46:51PM +0800, Jie Gan wrote:
> 
> 
> On 5/28/2026 9:06 PM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> > > 
> > > 
> > > On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > > > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > > > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > > > register controls whether refclk is gated through to the PHY side.
> > > > 
> > > > These clkref controls are different from typical GCC branch clocks:
> > > > - only a single enable bit is present, without branch-style config bits
> > > > - regulators must be voted before enable and unvoted after disable
> > > > 
> > > > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > > > of reusing struct clk_branch semantics.
> > > > 
> > > > Also provide a common registration/probe API so the same clkref model
> > > > can be reused regardless of where clkref_en registers are placed, e.g.
> > > > TCSR on glymur and TLMM on SM8750.
> > > > 
> 
> [...]
> 
> > > > +
> > > > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > > > +{
> > > > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > > > +	if (ret)
> > > > +		return ret;
> > > 
> > > regmap_read returns a negative error code on failure, but the
> > > clk_ops.is_enabled() treats the non-zero value as enabled.
> > > 
> > 
> > A regmap_read failure doesn't mean the clock is disabled.
> 
> Do we have special reason to treat the error number as "true"? Its worthy to
> add a comment to explain why.
>
I'm not sure. In some clk drivers, they return fail. eg.clk-branch.c

- Qiang Yu
> Thanks,
> Jie
> 
> > 
> > - Qiang Yu
> > > Thanks,
> > > Jie
> > > 
> > > > +
> > > > +	return !!(val & QCOM_CLK_REF_EN_MASK);
> > > > +}
> > > > +
> > > > +static const struct clk_ops qcom_clk_ref_ops = {
> > > > +	.prepare = qcom_clk_ref_prepare,
> > > > +	.unprepare = qcom_clk_ref_unprepare,
> > > > +	.enable = qcom_clk_ref_enable,
> > > > +	.disable = qcom_clk_ref_disable,
> > > > +	.is_enabled = qcom_clk_ref_is_enabled,
> > > > +};
> > > > +
> > > > +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> > > > +				 struct qcom_clk_ref *clk_refs,
> > > > +				 const struct qcom_clk_ref_desc *descs,
> > > > +				 size_t num_clk_refs)
> > > > +{
> > > > +	const struct qcom_clk_ref_desc *desc;
> > > > +	struct qcom_clk_ref *clk_ref;
> > > > +	size_t clk_idx;
> > > > +	unsigned int i;
> > > > +	int ret;
> > > > +
> > > > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > > > +		clk_ref = &clk_refs[clk_idx];
> > > > +		desc = &descs[clk_idx];
> > > > +
> > > > +		if (!desc->name)
> > > > +			continue;
> > > > +
> > > > +		clk_ref->regmap = regmap;
> > > > +		clk_ref->desc = *desc;
> > > > +
> > > > +		if (clk_ref->desc.num_regulators) {
> > > > +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
> > > > +							   sizeof(*clk_ref->regulators),
> > > > +							   GFP_KERNEL);
> > > > +			if (!clk_ref->regulators)
> > > > +				return -ENOMEM;
> > > > +
> > > > +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
> > > > +				clk_ref->regulators[i].supply =
> > > > +					clk_ref->desc.regulator_names[i];
> > > > +
> > > > +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
> > > > +						      clk_ref->regulators);
> > > > +			if (ret)
> > > > +				return dev_err_probe(dev, ret,
> > > > +						     "Failed to get regulators for %s\n",
> > > > +						     clk_ref->desc.name);
> > > > +		}
> > > > +
> > > > +		clk_ref->init_data.name = clk_ref->desc.name;
> > > > +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
> > > > +		clk_ref->init_data.num_parents = 1;
> > > > +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
> > > > +		clk_ref->hw.init = &clk_ref->init_data;
> > > > +
> > > > +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
> > > > +{
> > > > +	struct qcom_clk_ref_provider *provider = data;
> > > > +	unsigned int idx = clkspec->args[0];
> > > > +
> > > > +	if (idx >= provider->num_refs)
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	if (!provider->refs[idx].regmap)
> > > > +		return ERR_PTR(-ENOENT);
> > > > +
> > > > +	return &provider->refs[idx].hw;
> > > > +}
> > > > +
> > > > +int qcom_clk_ref_probe(struct platform_device *pdev,
> > > > +		       const struct regmap_config *config,
> > > > +		       const struct qcom_clk_ref_desc *descs,
> > > > +		       size_t num_clk_refs)
> > > > +{
> > > > +	struct qcom_clk_ref_provider *provider;
> > > > +	struct device *dev = &pdev->dev;
> > > > +	struct regmap *regmap;
> > > > +	void __iomem *base;
> > > > +	int ret;
> > > > +
> > > > +	base = devm_platform_ioremap_resource(pdev, 0);
> > > > +	if (IS_ERR(base))
> > > > +		return PTR_ERR(base);
> > > > +
> > > > +	regmap = devm_regmap_init_mmio(dev, base, config);
> > > > +	if (IS_ERR(regmap))
> > > > +		return PTR_ERR(regmap);
> > > > +
> > > > +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> > > > +	if (!provider)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
> > > > +				      GFP_KERNEL);
> > > > +	if (!provider->refs)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	provider->num_refs = num_clk_refs;
> > > > +
> > > > +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
> > > > +				    provider->num_refs);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
> > > > diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> > > > new file mode 100644
> > > > index 000000000000..09e2e3178cfb
> > > > --- /dev/null
> > > > +++ b/include/linux/clk/qcom.h
> > > > @@ -0,0 +1,69 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_CLK_QCOM_H
> > > > +#define __LINUX_CLK_QCOM_H
> > > > +
> > > > +#include <linux/clk-provider.h>
> > > > +#include <linux/errno.h>
> > > > +#include <linux/kconfig.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct device;
> > > > +struct platform_device;
> > > > +struct regulator_bulk_data;
> > > > +
> > > > +/**
> > > > + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
> > > > + * @name: clock name exposed to the common clock framework
> > > > + * @offset: clkref_en register offset from the block base
> > > > + * @regulator_names: optional supply names enabled while preparing the clock
> > > > + * @num_regulators: number of entries in @regulator_names
> > > > + */
> > > > +struct qcom_clk_ref_desc {
> > > > +	const char *name;
> > > > +	u32 offset;
> > > > +	const char * const *regulator_names;
> > > > +	unsigned int num_regulators;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
> > > > + * @hw: common clock framework hardware clock handle
> > > > + * @init_data: common clock framework registration data
> > > > + * @regmap: register map backing the clkref_en register
> > > > + * @desc: clock descriptor copied at registration time
> > > > + * @regulators: optional bulk regulator handles for @desc.regulator_names
> > > > + */
> > > > +struct qcom_clk_ref {
> > > > +	struct clk_hw hw;
> > > > +	struct clk_init_data init_data;
> > > > +	struct regmap *regmap;
> > > > +	struct qcom_clk_ref_desc desc;
> > > > +	struct regulator_bulk_data *regulators;
> > > > +};
> > > > +
> > > > +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
> > > > +
> > > > +int qcom_clk_ref_probe(struct platform_device *pdev,
> > > > +		       const struct regmap_config *config,
> > > > +		       const struct qcom_clk_ref_desc *descs,
> > > > +		       size_t num_clk_refs);
> > > > +
> > > > +#else
> > > > +
> > > > +static inline int
> > > > +qcom_clk_ref_probe(struct platform_device *pdev,
> > > > +		   const struct regmap_config *config,
> > > > +		   const struct qcom_clk_ref_desc *descs,
> > > > +		   size_t num_clk_refs)
> > > > +{
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > > +
> > > > +#endif
> > > > +
> > > > +#endif
> > > > 
> > > 
> 

