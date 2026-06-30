Return-Path: <linux-arm-msm+bounces-115309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ovVvJXFwQ2rDYQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 198EF6E1281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wa08QrgV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RI2OobMA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64D1300BC9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DFC39D6DA;
	Tue, 30 Jun 2026 07:27:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41B39A04C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804433; cv=none; b=IIFHOJgT/jNktuca9nrZzeYYsrM+oskMkUu6tjoArCFpDnRrRp9k26U+v6gDqbOazXRbfCl0m8/DEHtCQNNvZ40mMQNsupTTURPKIS9KJMkzXjRK+Ct+BhSFC4llTr6zd4YmdwCv6EVa6KPgACTFGAHVdqfKe/A2HY180htkrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804433; c=relaxed/simple;
	bh=YNCEyHJM1ySzBsalU6UojRrbYbeNUuReV/pYWY+/FLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBPuCAic3OdmXWrrhKtWrpk/GkhAgTvHEQbj36iXNXIBH27gTufpc3BaflfhNIFkTiFsSpxvTCMxYxX2ps6Zh936D6tb/9oC8oupMVgXMmgd9W0foHbGBpUeyamCuku8q2dp9EURDitR+S+FCyyR6prZlQvx51KBFaaVHPmWH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wa08QrgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI2OobMA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CND21090634
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrJC4pvBdbgv6oTNYdiDl6at
	7BfUo6flLNg8BMMb+q4=; b=Wa08QrgVpDS7GRxf4ori9b+dmuAbzzzrpt/KVDBf
	zH3tDQ+q69FksCNjEE4nEcglEiAKowC8WCuj+4iKvpF+LviIXruQmW90YAJT90hA
	wuCcVPlmvd4jO3iS0RXLAaNVzd6QTcgBpliVvr5YUeNsDHmimNPiHQwMb2g+mJtn
	Eavw+J1dFYaIgqhwXSKehGOVPX++a7P5MNI4kyFV1Vp/k6i9BzHm2/WD1LcEzLSj
	KvnX4nf7sOIyBFxvcYjJNtj0lzl/bd7SDHzY7Wss1jdZ70rQozjFQpaS3Cy8bDtv
	CJee2iMG20vqRjPi5oc7WQc1xsJCodB0IGS83jf86gBSWQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5ryet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:27:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4304863eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804430; x=1783409230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrJC4pvBdbgv6oTNYdiDl6at7BfUo6flLNg8BMMb+q4=;
        b=RI2OobMAT7WVoB2Bu7ARi0IyTVCOxPef4bPhVEkvqV24FM8brzdsxzq9SvPaJyCc1O
         vgr7Z8xKhHXZeND1pHvGm3zQRv7oxvy369f1LzKLBxMnTRWt2dTHwDCTPSDavwWX4s3Q
         jBunuct2Ao1k5pa9Qs8E6yvO4kGS/hIta4ANOF41ojYANkMsxA1hrczS8TTA974pbD/z
         JIkA5YYoXznEUBc8FWbEjOANVJNRUCPixm1W2hmUj8SuezxfR8QeVSZcOdr5Cs0pmp99
         3RA7O33i2cNPNN+ajNin89vDy3A0WBNVNGuhuQU+d8PasrSUBh7rUJ6+k1ROQ0TFBh5t
         Nk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804430; x=1783409230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrJC4pvBdbgv6oTNYdiDl6at7BfUo6flLNg8BMMb+q4=;
        b=mndfg8FN5lmCQJjIFdkkXu9zjZmyUQ5W0d2aK4H4NjvZ2MuGPjMaLF1nKzh3jcjOgS
         jeTIyxESCJiytCNt3vA+YCaID9xdLrG/mJ5K26cb2RM6tp0n6l//6H4fqGCbcyMt2NpZ
         Brmth6/z+5Lk5kcwiQW3Zmu0lBt1vyjV34hCJGPpSQt9HZZ1Sl683RRvGe+N4yM4atAx
         gZQOcWZMOEyll3THy/rxECGlWbxVupstRlfNqM2dmLDkHR4RJFIKXL5gC6jbzrR5eqpC
         I8I/jNL9+sGqBZh+oFtFLiM7/r8aGb3eIHXB6Qqp1bVatNQN2nZ0bzFhy9a9XukeEZt1
         sBEA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv+rjIwHRX4sIRG+Me5deGWybj28txkdHAlBoadEH1nEWl9WUBuPIf1+Fif7MZMeQ/Sn5Zx4mcTsD6b6K6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzko7LmGK5H9P/clonyQvW1GyfSIO8iRsgA360QbY51uxmVsPzx
	laSVim6Iy2AyYUqR+0Akdxg6+EfXZsxkXXT/eq4USyvTP2V+fo1Wdyf8xBtXYkECkIS8pdwoimG
	RUvfmHb2rDkg5oDP/4M02eZEL1YdK/X6g7IIow7JaGiKd2bOSVVpP+KZItUTfGm32Wwd3
X-Gm-Gg: AfdE7cnzddjSTNEfEfB+8crTY7PU71SgwBYxvZuIYC4k8HmTt+Fk6GtxfLGntdv6J/A
	02vAZtgFRVv/6HldmA2uaMbtSMWZxzfNZwIYMd7GVA2HIfFHacJmKZrcF2akpMX5DKlETB4vI1t
	3mr8WFmxPweXyqpQxb+oJDetciAF2RVm8CIuzzcfDePJgOQZXRjVclTUgfFzZKHelvvPmWyviwn
	kMBUXjGFIQft/FzUDORRyzXaNDMW8ig//jZeTLkh5y7EaXo36T6UShwwHog8jZcHr99IG7Sc3Cj
	tU19LbMSLRTRoSClNo727AfwFMWbHK/7AXqc+0ScNI79vd/wD5nqMAIorDXCI5RdjjvxBTzh6OI
	Y/0jpPqLWrR1nnVVDcl02otLZ7COockcpbX6Ing952g7SQLDAJIg5NbLXt184I7LgLdNgDFdsEa
	zAckmrF/LY6+z/Ws3iRxPYC24aJQZ9YBMw2vmAYyfJ
X-Received: by 2002:a05:7300:6406:b0:304:d92a:e60a with SMTP id 5a478bee46e88-30ee1478ee9mr1883218eec.31.1782804429778;
        Tue, 30 Jun 2026 00:27:09 -0700 (PDT)
X-Received: by 2002:a05:7300:6406:b0:304:d92a:e60a with SMTP id 5a478bee46e88-30ee1478ee9mr1883192eec.31.1782804429243;
        Tue, 30 Jun 2026 00:27:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31711acsm4908720eec.18.2026.06.30.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:27:08 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:57:01 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Message-ID: <akNvxVS/EW8LmS7e@hu-varada-blr.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-resilient-lucky-lynx-d9db0d@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-resilient-lucky-lynx-d9db0d@quoll>
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a436fce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7cbKSgm_W0bIH79rPYMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 1X1Tb5OTOn1tbFj-87d2Z3dsVVeyXZE5
X-Proofpoint-ORIG-GUID: 1X1Tb5OTOn1tbFj-87d2Z3dsVVeyXZE5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX+IeYyOb9G2oc
 Cvvam3p8Qwm414BeqLoZxpNE3umCHU3ap+2I1Fb/IkzxSbDRWrrFPDHuyJKNwze1gFolso6YuVT
 cLVUIiXjoCe45g6bae5Fm3rZjj1B1LlaziHLHyi4z+fK6KFOXv5UgHd7aA67z2FMzmE6rUKMdv9
 S+jxjGW6wL0fjO3iDTNMW2ywyXRT/TzINM5MdyqvNiARbI5h6f8nUaU4DzZ6VzvPIoAd+8GAb41
 5Ws98xg4/V2/hmC0vTXh9DDar+S4u5v1MUCtbgESOjHp1Q6FnGmQ/tv5y7w28Xb3HE1dv9BoYeG
 zRylgZ77T8cDnps2lUKrv5B3/Py4JKkPKxm4Ee2oK4N3fuH5T2sA4phcvZxO3Eskp38fNglOrn9
 93Sw2VUXU/4PHFdYAHV6yLJbAhcrf2Dm6FJPKtqsVJOp7WIRr6en4zOp+BKM+zYC0Lpw1I45kGg
 zq9KJhNzevu8L9EJHZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX01qoYZCCwYWo
 Jwc0KsU2U/YmCTqTHwTy0k+KVbJRrBK8OAEeR3NUINsmBI7J8FBAXjIIwgk/nyWsywYZ6yX/f8P
 qyaTBt5vXcmoV37KcQSoBCY/Y69i6E4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115309-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,hu-varada-blr.qualcomm.com:mid];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 198EF6E1281

On Mon, Jun 29, 2026 at 09:30:11AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 10:08:41AM +0530, Varadarajan Narayanan wrote:
> > IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
> > for the APSS clock to change the CPU frequency to one of the supported
> > frequencies.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Varadarajan Narayanan (2):
> >       dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
> >       clk: qcom: apss-ipq-pll: Add IPQ5210 support
> >
> >  .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
> >  drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
> >  2 files changed, 20 insertions(+)
> > ---
> > base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> > change-id: 20260625-apss-clk-ed39c40ed468
> > prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
> > prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b
>
> Really, how?

This patch is part of the series that enables cpufreq on ipq5210 that
enables APSS pll, then enables the mailbox, and finally the cpufreq
driver. While testing the cpufreq + thermal sensor throttling, needed
the tsens related patches (both functionally and for passing dtbs_check).

Will drop it and post v2.

Thanks
Varada

