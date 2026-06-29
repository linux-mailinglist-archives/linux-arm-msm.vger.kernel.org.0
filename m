Return-Path: <linux-arm-msm+bounces-114996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qO43Hh5aQmoO5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:42:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC06D98F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:42:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pumQgj/o";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dVW7MRJD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB00305489C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C803B8409;
	Mon, 29 Jun 2026 11:27:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F9367B98
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:27:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732435; cv=none; b=pPtSuDGeIJJocyNv7glMvEPJ/YTNq+AXyGWBGFTC9HWo2O2ddzYzYy0TOdxS0FhU02RIePpR0CVQbDwxWZaFeyrIW4i0qr4OTx+6TzBiud8AIEiXZJYfOcbnvWkN/eTiosxigXVvLTH5FvUcYej5APhSZv84l0U/Y3I5U4CdcFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732435; c=relaxed/simple;
	bh=5y/17dYe+Bvw0qBRtqA4kM3JEDkLAjs4N59TrsSoxLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulil7y8duv7t0wmrxzb1b7dXJOVZlBXMYLDIh+E3FPxyi/VPZElOLa2TWS4vAw9OVxjmb0P3lB4MUUa3xMbIGuHWNh7U9K4vr0VYo+EzKvYP+XnhSmpuTI9f4KzWXrMdfuNq0NaLswcuQwR78fMAQ7VcdRni4Y2AZ7nC0AAohqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pumQgj/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVW7MRJD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATePq2648345
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mkl9ZZvS8Z3Y+zNIIUBowVu2
	nI0rBD9T8F6UB6fM11o=; b=pumQgj/omUBLfnKfponUFIXE3Fj3qML4892AP3iq
	sS+83arkhEF0+gUGFm8TQ0h3kR3Ea6Ci8kxBRBeQRTvAVbgrATtlo2z1qBbnkcqK
	GSYkJA2kJjviKl0xbyB0CemMSMWySb47hQuNZy5A9O8waSuxK8lsM4m9k/kmmvvT
	i6JkqFf++t/KeRXvBqiWnXvBubNdRsrmbqnCG/P5NsuK/RrwWrGCAM854hocdwQG
	k7yqzpketgkuCJ3NdRdSC75hYLVkP/2jdipqEm8yFX8dSE9nT9uLki4Akp4txFco
	FXzlDcL3aRmhX+QSYbT6BzR+/Vel7jSBdoTLvAY0SvFcxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh1a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:27:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so694812385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732433; x=1783337233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mkl9ZZvS8Z3Y+zNIIUBowVu2nI0rBD9T8F6UB6fM11o=;
        b=dVW7MRJDUSH3QC7J8yXQ8tBTU8JP9PVjUhiKytUgiOXAXv3vqruLhjf0UW/+F2teK6
         MQ/ippQgqZaUu2qzENs1utX+oM5BYkmW7A02xW1Q9v8j8LHukRHwq2ot6cHA9dirJfEm
         DWSIF6mT3xKqtlpDewcV6K/Xpv/tztRIM3fdnRefehBnVtaPwfcJsy9PqgTuThtVIaw+
         bozszqlUfH+6gU6D+tJAlTkan1qiHsIAeHlp86s3n3qGBIY+MTjkMiSLYZmgbB4pD4K4
         Sg5RqEl/JEFaXzuevRcJgvJuJvXd0cACGJK2+UF7w7k2hWLbm7s0Wx6Z/Lj4SBYlhWuB
         yi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732433; x=1783337233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkl9ZZvS8Z3Y+zNIIUBowVu2nI0rBD9T8F6UB6fM11o=;
        b=jVxe5QFsGVUh1Yi9IJPApNAQ9KIDXcmM1y6PuW1vuTL4Pa1o+Hr4Rsn+iTHQ7Hy3CG
         H0YkiHHKvygdxjxfjkfF8gp6jUfXenMs22c7gamOx0UMTfsLkqNpKDTfNAdyXVKTrpTL
         R5HU7aSdqRBZcIQIbXPNEbLN+abngnhPf63tpXk/80Ia8cZQACtfIMyfdfhoyeFY4CMu
         wV/KzduQt1x+oZdSgjFjoJTtqbePBkhE+6em6U/OYDJebM6pWG/1A5XLgHS/Rhq2sV/N
         eTd8kQq+2RuS62h0Kkx8doS1Y2d9R7OLJY+HurOM2VQ4iWqtCd1eN9BQq8oBjqZRIhEU
         S7OA==
X-Forwarded-Encrypted: i=1; AFNElJ8e0e9GRD+r6U1RUWWU+F1paMTuZmGYhh5Rc1ub5HR3whGU9D/gCnwfcGiaFyQzXMNI+keT+keHLU2mIiaC@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmMBqLuHlo0BXUthxcaKeuwpkru/4IXI31Z5GCjb8ETdtdYCs
	60V47kZqBrpLtQ/3IKe1Uu49+z2Hkjb+yoytNJU5UYA0p+9AwgjXlqDCRSjs8+1gttukHVhO2Cg
	5hdrsxB35hA34wXuV7vzpFT53leb65UnXocNo6MQG631zFQI/MRr0eHOQRKTN5KpATQAD
X-Gm-Gg: AfdE7cmZVa53XFtxz4/q5EmQEZnWaQ9HgnvZ34H0KDelp3fk8hZZv5FoSDqo8GhpJfn
	4ReH7tv0M4DTtuCNg8vRTewLS+DTJBuzclii6zWjHWtq9OKGywniC8ZMr42Dn5XWIGg3jkFm097
	GzREwZIfmVQBd9UZKJ/gWVpSSC/LldkDT4YLmPY9hsmJYTR8RUSP/R5US/cCdgt0vERxoQVM1Lg
	Z9J+dbKSd9BKpwi06tIpQyhp27+KgV1ZB29UyiWF5xYfD7+TYR7R/MM2mZU6iQ7iPyWn/Wlbszv
	Qzu/k55EqQa+Z+5Q3AtltTUsXX+z8wiAhflw7tPArg4LOkmor4zyvsdc6flSohsi/wLNHRSVCSP
	Cfpd9Ixk+XNKZ/H+RvyeBUg==
X-Received: by 2002:a05:620a:1794:b0:92b:a2f6:d1a9 with SMTP id af79cd13be357-92e5f3fb05bmr45400285a.44.1782732432473;
        Mon, 29 Jun 2026 04:27:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1794:b0:92b:a2f6:d1a9 with SMTP id af79cd13be357-92e5f3fb05bmr45392485a.44.1782732431659;
        Mon, 29 Jun 2026 04:27:11 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm537854145e9.15.2026.06.29.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:27:10 -0700 (PDT)
Date: Mon, 29 Jun 2026 14:27:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src
 RCG stall on Eliza EVK
Message-ID: <lardu363empfwocbf4g5z3ndb5tyaa6ywnqusuzea62435vvb3@iu7qzomz4ijv>
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: hTVQZrXMZRTB_c5N3eB_238lhlicSj6M
X-Proofpoint-ORIG-GUID: hTVQZrXMZRTB_c5N3eB_238lhlicSj6M
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a425691 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NLju79vw_jn_z0NdLzsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MyBTYWx0ZWRfXxphxC0AMoOyT
 je4DGmVYOkd1L1+cNjr6pbEWqZXuj/4sd5PG9ayIv5CF7G0SflLNKATzcXXM2yxgZWKsvXc22As
 ad9ttYGoryZ67iJYip8u4aU1nz4pMHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MyBTYWx0ZWRfX9f7jVy1tt/1+
 mn7Hcce67DDN4nsV+SMRsuC1wRIgVqp2VLzfBO+uyK26zWYjFK4W2B4YcrGTkaOI/ieCqMVNXai
 pVnFfw1+fykETnEqhGmdzZbyA2tVZLZlxqcopVQn7P93br8svR4sdD6kcpI4oYOVesoA4JeaLZ6
 qFMBm2ym4H7mkta1sANlg3soLNYn7ZgCwa+R5QtTqx1uiYAZMZd0mmJRg6a4KbGKqNCOCqgXTE4
 9ha1WR1R71b+OaLNzzEgqnw4lUqQwyTLQSnz4tAytvXYZ8B05Ot6v9ers9pKjZaiYLOntkwqWmC
 mcZKDnMOsgY60cMr+a5zLEFUAa81tjbLZj1M9lhn1JvVyJSZHF6HDrOUlrlWmdrxCGNJA1QVYGu
 CTsM5zXrmQfsZoYlM97QQ4b6VGo2OHQ1O89360nsawdJYU6CsQiyEnUKvfRU+b4tciTxc2RmCxs
 kJrBsQyWbhCtiKQ2FbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iu7qzomz4ijv:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6EC06D98F6

On 26-06-23 13:56:45, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs, which causes clock reparenting issues during probe (init) and
> warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> Fixes: 0e66f10942b5 ("clk: qcom: dispcc-eliza: Add Eliza display clock controller support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

