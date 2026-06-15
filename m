Return-Path: <linux-arm-msm+bounces-113124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxDDGoO6L2rsFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F9684A3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QQxD+A5B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bwg0+w7a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B77163004C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A84381B05;
	Mon, 15 Jun 2026 08:40:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1A37C113
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:40:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512827; cv=none; b=pqBil1GSemsb6iTsD5GCf+QGSSNngARgj6X5THG7jSIrRabNDZuJSpOnIUc8rq4OOQBIrd9FnHDNOWvl27NY6Z2I2SKLlmg2ulDfMWzaZe4y0P4YT4gqqq7dJlVa616HzFndUGYS27qhXiBe71mDTJyO+mdBAPyglE9KTXjqijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512827; c=relaxed/simple;
	bh=CxLuIBdZYNZXt4AwezKYLWgOcNlyIeyrWFvFmQXHd8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhnV7vF0WSYiceZ8GCocDfYIvdf9187lk2pdd+1sw/zgjXnOSEIQuAFV9TqUG54O6dW8Lw/0tADPZgLJ3TjmNCY8OyozUc7Ja6YdHbcmsn4app84ZVy7hCHKQnzsCRZHqgwpnuKyN7t+AFjDJxRKA/ODWoEQ/DAc3/xUE6kSlFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQxD+A5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwg0+w7a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kari3709675
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ldGIRMP8+HtcjiwpP61O1Mk6
	FK2qtvtU/LAATKNV5UU=; b=QQxD+A5BPzQ0FslBLT7S8wv02FUCCFK2OLKebpVf
	XtVgIuLT3XgWoUZ1y9I3gzYLZjl2dOlj5OiD3JsGWx6y+iehshmzjIV0jxjJSHx8
	WLQfP4SY/NEYi5M9tDDEBYAbkgtKDxs7p8IfFFep/JOg3H00im1lh8vaQAvnjwon
	92+/WUk3FNyjPsSQRZlAu+bri9m+H2tV6fBm2hZwoyAvoxoUl6d6TdVC4D7gwoFL
	mcrhUlIgewt2GKl4ZAADwecfkRLpGG6oOOZc2hA07KXjKIJL4taw2PJRNm1WuD1i
	mXwqrle8el32gNnjozY6usG/a2A47yW8JihRNKM4W+Bn9w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956fae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:40:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13967c19ac6so4964173c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512824; x=1782117624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldGIRMP8+HtcjiwpP61O1Mk6FK2qtvtU/LAATKNV5UU=;
        b=bwg0+w7aFnF/wP9WH/ANexPEDSgu9FisiFkiQTpC2CUbGg2ZF+Rpevv3uI/8FpEfZe
         HXTJgv6eOngdAUQ6HfMgkEhU4i8q6QTiIThnEqhUktapXB/O0P4fhVgAMYttgNoPJXsy
         lwyj5ZHx1SFAUd13cI8rC9GiCKfziDN1hOpYC7qEroIrSKJxb6r/Uys2Xm7W/sfOYuio
         x4X+mzHBHaFScPWOl6slQWFyJMEp8Kdrdi8HEMQYieQW2DqewVpzqgJ8GEA8op1DqzT2
         hvyWhYFPwxbgbvK5ylXXLLFRhJbLljwFcUZVHbppJ1cYWmaDJ8smv/8JfAHlkmGZ5e+V
         cBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512824; x=1782117624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGIRMP8+HtcjiwpP61O1Mk6FK2qtvtU/LAATKNV5UU=;
        b=C04Ps7ahquQRPtBmm10htnEA+1EfPESEz96ghtITscMCmkMWSwKeNjRKPaQchq87tG
         bVBExkZexFk6zG12jb6AD6cdDm23C8UTB/FR7vE4kCSUxA2mi92Qi+M4Nk5h15DqnUBq
         j/czuRhgAJZhN7GEVxgnKPXSqMvMY0gddYUc/m5bHk5/R1qPf4j+i+XZUN7gIVbXEWf+
         v18qnTaeDn47anw0UeEORyADJFWieqvcgk0fxJ7XOJqqRzDzWWsc3KRCvUyGvyEtiM2h
         0c8TqO2a5QGX3EMj2PjC3QIISVNXkw89Mhbhw9EoQbmcdYaTDVtxwN8CHEJD+g3FB2XT
         3u1g==
X-Forwarded-Encrypted: i=1; AFNElJ8L4U2kKt1QopgsTd1u0lIgyqlC1PYyEJkWRE7mDRlNNV0Bk9Y2bEfNtBo4fq/T7oonMY1X8U57huW+6oYH@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNQ8AvVCUi3YTW6fz1Hl27nUY8MRqe7gF/UkXNxuY0TD7c4ye
	x7Acz/f8QfuebMTLV9Bx2nmmg8evRhHveD33Xwp67XdGVA8Qdv1Ej785bTvRwyddTye3jsN7lL+
	LohmQ6ElL9qfN0x5Bm93cJGJM+b0Ne9MkyEFmzIM3Oxbghuzl9lEF61Bc08xdtDnyFUhP
X-Gm-Gg: Acq92OEcdl+/EIYKWxg14JEbdl/MKKfW5ijPjH5XsI5y9QfU0BU91pMpFP3TGq1QriE
	BdJmvPRLwY366zBpDXmRaqqkLqEAV+gSEueLWO+B59CYOL430fxgafXgUnTkQiqoA35Txu85n18
	r2u+OWypdIudBXbOisD3eqF4Fy6xKPlSmLRmNuMi9tR+oMUV/WHkOxdaRgM+bsUc5SHiu9fx5ll
	eNL48IX+0fjnx51TIm+nWWL7cVX/fvRHzY+AyerQzsAkJWtZv+QwXjFVzYwGb2dUW44uyqS2FaR
	61YJr8+ca+ffHFDcU0PWHgFmI8yT+GjtwPCQCWcTjKaKFP7oeCxO1DNCplhft8/C1qZfmfWAYig
	SC9XRBfKGgu5usHRdeUV9YXbtSEmYmIWdVa4ryFzicudNp/SRi+nlWIEukjXvCyXlDiYL
X-Received: by 2002:a05:7300:231e:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-309426f1359mr5772661eec.35.1781512823836;
        Mon, 15 Jun 2026 01:40:23 -0700 (PDT)
X-Received: by 2002:a05:7300:231e:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-309426f1359mr5772645eec.35.1781512823264;
        Mon, 15 Jun 2026 01:40:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm13943568eec.5.2026.06.15.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:40:22 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:40:21 -0700
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
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai+6dYP6Ezzt9Wxm@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <b0479824-0c6d-498d-bdc8-63f678a6f2ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0479824-0c6d-498d-bdc8-63f678a6f2ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _QTbk5ZTdY7-UeETi6Rgw9OAwItiTTKu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MCBTYWx0ZWRfX7IPS9jRefaL8
 E+uAHOPsytfYr/hmcyTHNj600xeqB3U7M/ycsXnou1o7M8kQ1z6wQgQNMJ/n2Qr6XvPuGwzX6gk
 KhOcb/ppNh/Xn3EBbSEUJlWZTh+bUGA=
X-Proofpoint-GUID: _QTbk5ZTdY7-UeETi6Rgw9OAwItiTTKu
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fba78 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AztkedqbEEiKUJ1lf64A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MCBTYWx0ZWRfX9q1UVRU3fNAf
 gu4oeKJxi2NFGPyo/9l4t9YkRWUKPDj56l4gC94VRl1GtR2R/tGz2g/tWIaiMpUzAMEowzm3/ZY
 kGcHroyFenCOwpLu7IY/tGs4XbDZlqBS0JxtO9Cw++Lew6rD0eSX1yFlcTW3KGljSr6yUaRPVoa
 Tsd+dzP2QN/pxCVayt+YeDralrZb9ajvsZ49LZmgyxk2OMKJGvW1u3NOXBmhyAdX6Z0vDV9S3gf
 obbExPMs2nQHzoTKQ3cryJFjOJqnt7Rs5hHiRWu5h9IN3s3W5yUZY5gpNUroZ18Hav4t4OMs41s
 h59NJ0L3mAIozWUyXy80SIpNbz2LmeRiKHFQzyzUT1oSvzW4kvFpQkoV4iJlpMfaJVNQCSNgRQV
 fvOgOIorhVB8ArebCBB5IIehsaDJqwLXJaYESlWUxq2TM01MC08dbZTQnhGb9S+DCCVOcXS+Ok3
 FYBaNel16Jax8xg+HGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D1F9684A3D

On Tue, Jun 09, 2026 at 02:57:52PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int qcom_clk_ref_enable(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +	int ret;
> > +
> > +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> > +				 QCOM_CLK_REF_EN_MASK);
> 
> regmap_set_bits()
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	udelay(10);
> > +
> > +	return 0;
> > +}
> > +
> > +static void qcom_clk_ref_disable(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +
> > +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
> 
> regmap_clear_bits()
> 
> [...]
>

Will use regmap_clear_bits in next version.

> > +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> > +				 struct qcom_clk_ref *clk_refs,
> > +				 const struct qcom_clk_ref_desc *descs,
> > +				 size_t num_clk_refs)
> > +{
> > +	const struct qcom_clk_ref_desc *desc;
> > +	struct qcom_clk_ref *clk_ref;
> > +	size_t clk_idx;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > +		clk_ref = &clk_refs[clk_idx];
> > +		desc = &descs[clk_idx];
> > +
> > +		if (!desc->name)
> > +			continue;
> 
> // this allows "holes" in dt-bindings for $reasons
> if (!desc)
> 	continue;
> 
> // this makes sure the programmer did not omit something important
> // while not taking the entire system down
> if (WARN_ON(!desc->name)
> 	continue;
>
The NULL name check is intentional - the descriptor array is indexed by
clock ID, and mahua has fewer clocks than glymur, leaving holes at
certain indices. So this is expected at runtime. WARN_ON would be noise
log here.

- Qiang Yu
> 
> Konrad

