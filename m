Return-Path: <linux-arm-msm+bounces-118634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sg8QBBR+VGprmgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:56:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285174760B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:56:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eWCEZ4Vf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FO8TmxdF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118634-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118634-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A08302F5A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E153612E0;
	Mon, 13 Jul 2026 05:54:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD654360EF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:54:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922078; cv=none; b=BaL2E0F2SOM7Treu0sYZya5Awv/aB95lgpgaHcZDfl6hbCM1kX9MInY8M7fnmWrIl7jB0URnwLQU5ZdAeAVVmOOxX40Vj39xol/rox8ngBMYowhUtq5S2EIRHXdXM+eJ/OsjBwdK5QM70v53PRwBdJ/OfMICMy6ubHlyLo5Y/Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922078; c=relaxed/simple;
	bh=DMfDlT9bsxrHyKP8oYQv8QAbSpLFgAnmglqR+FPPdqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpDDQoXMX3QF9mIEvt+xctvY0Pb6dH7j1LXLcX5YDlq9DpoxTLCxwrv4nN9l9Qh7BALuGwwry4dbVabMyOAcpeyfC9JW2o3cFckT/fWsrDDjGzdQvI7z7Xvw8dqMKTvHxWyQh9GOXBRtb+962REGLlUCUsdBE9Lrkl5KyhqLpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWCEZ4Vf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FO8TmxdF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AFUm185571
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWufmJLmZffuA40T+VuvgB28
	WuhjcxcWicXobvilNRw=; b=eWCEZ4Vf3MGZRo6gKK5uuoi7ontXh0VoCZ1YwpFd
	UkS7S4qwVbHbYMoik14MeOUrBBgoShxqAHHIppdYvYFSpVrxCrJ+l3DlmiP/cOZw
	JGpBRWfPUTqp4/hb1IV6gJ991VmaapF6xbM/x3AWUA2/CmNvS9WE0G/sTD9yuCgC
	g1mQ0Xqe1UhXCE07gk2f4DxRrEkaeBfKBR0iAs2tMDd7F6RrhSTD6mPdcWD1pcqj
	LNwPyauRNRFrov2Fkb/vlJcuiriGtgAiUUG5rqcrCvfYb5sfUxk0FAWVIhgrNoN3
	Wzh12vuUlAZ40c++Xs9ITk7714/CIL6UpN1uaxAj1zjm0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamvjkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:54:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so4054373a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922074; x=1784526874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWufmJLmZffuA40T+VuvgB28WuhjcxcWicXobvilNRw=;
        b=FO8TmxdFx20jcGmMBed5l449yFYLqlRnsJAahUBlYCMUJaRDCxunUt3VIDkNIKxKfC
         DbUrOCspBnfI8dKH9wAX1eVLLeevn+Tp3wNmZg1QE5o+rWlP4brLINhg9+B6MymLhOtw
         jspwWxZn6mQiYFK3INH27W1wy3FM1IC89+6aKcxgAhuzN35XfleWzJJZQmV0Nqc/LQH5
         NAvSVptT4pRKviN+x8C6NUVFH2iRWmz6UJ8BsQQRKJRZd3An/gomdkisQMB8FJi06osb
         aHGywqfE1x5XAI6/uiFqWOK2ZRKX2aVRZnyJ81bKqmUytAw7VXbLGe6+V93Ryf1TtNsP
         6cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922074; x=1784526874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWufmJLmZffuA40T+VuvgB28WuhjcxcWicXobvilNRw=;
        b=QW0GzQIKMKV8BWhlvzCCTOkNBNbYnFFsan7IB1uykr6MiF1O0B7JeZB3ctM1SDUabM
         xHYqNfl5jfLlzEXZtHtZwyLeGqL1yWx6dGZHVAr5fvOrMlk7hZG7lOVnnxLzJpIwJdlw
         l06DkGhV94H1y7uh7qHw0wBCGNZUela85x+zOi2F09NFwlAGSYUi6Hr5dePqJlgwvcAn
         Db5qa1E+qmhnKZPSa/qEm4WNNP4RiFDSdwc3Ay0zGIxmDkvA/SlafIGItxjgJ86h1mmk
         z5KgoPOTRWGgC72S0kNytzHpSDfjvVg2pO5lQySauBeSWxu7mIyxrW3cmhNGzGu2MMzC
         ezzA==
X-Forwarded-Encrypted: i=1; AHgh+RpPmkRqZs7LZpUWOyMyoV+djgi0hjKmouyWWQWn0VGG2AxtYNGR+iU6N0/6rp2eotF3J5V2A8VR5059pb3M@vger.kernel.org
X-Gm-Message-State: AOJu0YwzLUKxuzS0r2EU+nPUkyzN6GYYZemLGkFBhvkuuVqVddF+cWVX
	BNAdD7ejSQmuh805BdZo+JDqQBaLzKIKuDtljdk53MPEuG93NxgE13s/+SRjHsC/152maqG2cYp
	au69Uve6m+CBwGWljJA2XSf5zDhkNjVcwenjL13zD8nGtlIyj9Mxezwd2UszMz9pyHxvS
X-Gm-Gg: AfdE7clCrplNcPrVq2xXQTY9dN9yZ29sQ5YooXr0Aio0NqeqXm1nvF/+pITXaoQ+G7L
	6BnH0f7wU/qfEFvWFCUOQlqqD3ZV6K7eSueybLgcPbbN+exbqcN/5rglyDqwhtwJZ64zzlbRHAx
	IVQPg8eo0CQeVhEgDayDWSXbzVceuQHdYQKOsAcr1hMHbWhNMfeOU/4bj6VT9nHp37Rl5LVAjh0
	9K+NOl6txMrduebUgOHHR8swf96ONwovgSf30DUMK4EOuZqHgvAWzBdPgQVh7lnYQDdvky47PCk
	vYXXupoB4XcEWVJpw9ABq/Radu7Y3WQ/wm/nyOPC/Yv4MBAa9lxbfS2QHhcRQ5XPjXgsGTelQve
	C7+zYxHEIexFsMTw8enfpgqlRnpzy4MBmZS/UQEspBiuBCMpMzlDXeKk/2HqS8iODQ1KX7NtYJa
	zVQB23ctFNyIygJe+hMSNLnHMgXWIexduSg2HfDzBx
X-Received: by 2002:a05:6a21:4a41:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3c110a9a0a3mr8572640637.32.1783922073865;
        Sun, 12 Jul 2026 22:54:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a41:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3c110a9a0a3mr8572614637.32.1783922073389;
        Sun, 12 Jul 2026 22:54:33 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm67753127eec.11.2026.07.12.22.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:54:32 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:24:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <alR9kQyO6fQ3MOvI@hu-varada-blr.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
 <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
 <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX+nIDKr7xT7nT
 xUaGdV6yGu6k+qXsBiG9Ps5GotQkRYMovmt8XbAnIkhB3ESl09gaHlJPtT33KUYTTLD6Qa+aGNj
 w6/8PcUJykqhgaKcEzhFFPTP2DaPDBI=
X-Proofpoint-GUID: zlUDBiAw9Q1i2zVU11USz2c9ARZ6tWLV
X-Proofpoint-ORIG-GUID: zlUDBiAw9Q1i2zVU11USz2c9ARZ6tWLV
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a547d9a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zuQeyNwc5QvROW1TF6AA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX3DP565WNKvn0
 9iVU4fb0jcKNQreSIFJR3NT2yFIHMtG3oRHD4RVeHkBeDYFfGQP3khT4NkQ6iUovH/7v+NMcmkU
 f/iAsBp2eFXmCYGkC+Ugp2P6Q4SnFz7h6aEE+B+R5L2RDfMAd7T6loEIpUqfx0IwDIiRR7zteQ6
 ek+pyEkfKq2jNLoBKag0pgZzmqxb0l2vPOJcj0HWiGjs9c1ywyMXH3Ny9bErHr+Oojv18lXTcSD
 UZ1ibcAD6RMsnYFTjhyJbTAB5oiLpoQUlmHJId3u7U9AK0bOu2E9S4YRBBqmRm5IxRo00dtmwTA
 9hZcxNFuHvUAxkJ2stg1StuZb9C3eacO5zS/7Anp/W7rS3Hw2D7PjnHOC0bYH8iXFKb4+h2hKLq
 drXPEF2iBDpCABkBmNztooEjOh64q2nhW/CTV7CPcSl0k9T4f7zx/9rUdRpBtUPCwY/5JWLtVSm
 1aphupbum64cPp68ytA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118634-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-varada-blr.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7285174760B

On Sun, May 17, 2026 at 09:51:52PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 09:11:19PM +0530, Varadarajan Narayanan wrote:
> > On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > > > Use the icc-clk framework to enable few clocks to be able to
> > > > create paths and use the peripherals connected on those NoCs.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > > ---
> > > >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> > > >  	.driver = {
> > > >  		.name   = "qcom,gcc-ipq5210",
> > > >  		.of_match_table = gcc_ipq5210_match_table,
> > > > +		.sync_state = icc_sync_state,
> > >
> > > in Kconfig:
> > >
> > > select INTERCONNECT
> > >
> > > OR
> > >
> > > depends on INTERCONNECT
> >
> > In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
> > COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
> > INTERCONNECT and INTERCONNECT_CLK.
> >
> > Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
> > Please let me know.
>
> I've sent [1], let's see if it gets accepted or not.

Don't see [1] in linux-next yet. Please let me know if I should change ipq5210's
gcc to depend on INTERCONNECT.

Thanks
Varada

[1] https://patch.msgid.link/20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com



