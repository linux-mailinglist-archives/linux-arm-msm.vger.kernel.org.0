Return-Path: <linux-arm-msm+bounces-115328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AxZFAE+DQ2riZgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:50:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887CA6E1CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BF3dRRSE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="AV/NRTxO";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115328-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115328-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AE21300D1DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307FF2D0603;
	Tue, 30 Jun 2026 08:50:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129393375C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809421; cv=none; b=l/wtUlvGrfYG9cdpheXXhKqWUzlVjRGJ04C88/aUIXp4kzoSHx0VA5ErIxCK+pIVzd5eqCRUMVznLz6G5lZDS1PO2/6exxC33zp3f/ELGT2OcVcqh1RXVojTn+OEhA0RSgf5tbOEIAylB7z9kj1FyPekDM9krculjvfL8/qpRpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809421; c=relaxed/simple;
	bh=/B33/5cEi61RV6iNCCfnMgKyJeWb5eLiQ5voWCnDs1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pns7rKkCNRyOELrKM+AAfF8DBICOlm3MaWmeJR6MtKSr8YcWxSaMrcfx2XvJM78jRHb58HP7uC16+nRdcTc9CqWXGu90WjzjrYiD3TDMg5xFxDZrDzP1+910h5XjtIoNF5yA8zVpJtlK6YWj+6CYrF4MKuBZCLSISsSgeCCKIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BF3dRRSE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV/NRTxO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CJaE1073825
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeTmc0+pnXWw+8RJ1NKnm7U6qJNLJpn7qhQk6NK1F2g=; b=BF3dRRSEuMu/9zjo
	fmMI1e2KxigLztWz4Uyt88uPIlXVvQ9A7uNkhhBMgDRyUWhCp1E58LbfAj2/5Nwt
	CR0CcAdj6Q+46/TlsyvTMRoIerFtRgZ/0oZA7q3yBakcyjUeM79sK/8sQG4gvaCM
	2RbW8/w5LJZzZWFyejegvBEIqVYCtXfqujZA/Rb7K5gPdht61WNZwrYFNOcFBGAv
	1xV4rzdMls0Lkvix4yh0M5+MucdGaTxx/YEfdgOrpm4EFQzdeueYRw7AfqkgFP8V
	kRzjAJc6vWcS/n5lHp24coLRJ6ArrzMxc2J3IcCiyuXf3CS8zN0/XZUREC7c94rR
	WtnRMw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k2h16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:50:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96917d46b8dso205632241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782809417; x=1783414217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeTmc0+pnXWw+8RJ1NKnm7U6qJNLJpn7qhQk6NK1F2g=;
        b=AV/NRTxOHi1G4rNCnTLG/967TPVtx05y3iiVyKv6qYeLZI44t1SM7PY3fo0+DqKASR
         Zlc+w6SH8tI88vaxLSSZS1zK2GYm+5j0tocxN27kSs5N+Wpwobn9PEh96KFlNCkfmLBx
         OfUl0nSWWlt93IndNqncfSCCFhzQWeuwa3mKpArL3HFJt2n3uZgw3Yk/HJNZP2gIFgu5
         bC55cOs6KiuZMiiNVuU3kCxdusmJYY8vKBZV279IiJB+9EIDWN9bljpWXyreXYiA4dAg
         Xk58eUOZmTGpO7iko0R0BndGQWcc0X9tu2vjrjbUE+z+8DeNhSyVEJM5n7cbmabiZsmO
         yuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782809417; x=1783414217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeTmc0+pnXWw+8RJ1NKnm7U6qJNLJpn7qhQk6NK1F2g=;
        b=C1Nwmah7mX6Y4/78r4a1zB6wVe6WprKdm9ppzPr4z3EEd9FnqWe6mT+d2usj/9BsxM
         wDGLRZz9ekXFZIRQV6caiJR5x4h5ncSErGCbTTjGkHd4ysMAUtWKdwOO/nEQHI60XQPG
         /7BgR4QYmJhZoy2SkJiU7YStvO9oR9LPaLfmRSbyKgPViAcX5u3KPD+mY/Ns5YddD057
         G311ucV3jw8Hhp7J5o/K/pVa0D8ttY0t9rjNW6PlXPT1SbknhdLiPkUpEBUV3cFKHDfC
         p+o+wruMc1qUEZQCkYjUs0smbZrC1suACEh8oFh2rSJkO2r07meNTa+ZuBi3K22wJWps
         Tg9w==
X-Forwarded-Encrypted: i=1; AHgh+RopS+zRXU/BcJKllOLI96z4MQmopLSdKP2kvvM6AiseXbtkG7MK7IdZKBwINh+7RmUdy3Ussd9YI7xIOJ5d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MG7N3zuUxGEwPo8rlmmWPSkmJj2F12CS5Qm3wk6lD1iVO7eW
	vjjNaLP9Uf6BTHqPxN6YFFxseqxeP60/Vi98FfJry0sBkgdjJrIdrlSpY1wps/szI+azmBuOVYi
	vf1cMsRLuI0WWkURd9+OI6iyRV9qmH40m5hGFB5YKftsU4OxX0lgrFwRLrKbka6rnBp//mMuvuh
	7D
X-Gm-Gg: AfdE7ckBKHgr+VWXcGn6CNdx4RE/E2afoAjYBqiU5a5Nlq/XIwMEGC08/lBZfXTfLDq
	n6Ygi/pyn6KW51/pcT76Zdh8eBtG0J0BAvAEUnSfBGLg8PcyMgENxe+6CUNgzaQu7+4fksa5fnS
	FOmWRQcNNLcQFiVyHls2vqi+cc3NHERjBEOsgM3ocCVte1Lb6VyrVj/BDC+2ws6QJ7pZni1ls85
	sKqP0PnL/HCv17moz3ZG8SU88PsI4ZLdAXPrrO4ELWjrdZCoDs9KNPVEWK7AK+fd6Hp4tal/bpS
	DMvYH93eJk8q/F2j4xQqQsfDngcOrGP4HuDuNp4R0ibqrtQl0BqtLr40GVRDMtfOrhVSbwE6h5r
	mIYqjo0Gh0Ei274RLDjENzkInHDKCYSHlrlI=
X-Received: by 2002:a05:6102:290a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-73a365ea4cbmr491470137.2.1782809417313;
        Tue, 30 Jun 2026 01:50:17 -0700 (PDT)
X-Received: by 2002:a05:6102:290a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-73a365ea4cbmr491468137.2.1782809416938;
        Tue, 30 Jun 2026 01:50:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cacasm788437a12.18.2026.06.30.01.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:50:16 -0700 (PDT)
Message-ID: <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic
 allocation failure
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Dan Carpenter <error27@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260629162127.3910603-1-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629162127.3910603-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3OCBTYWx0ZWRfXw9FGXSMuGqyP
 aYvFNhEoB3A3Y0GoQFPChkQdNQNYyMjZSs827+8K5Zsb3zNmjuFQfGw0+2N8eCQLBTjj09yLrEc
 fHkmaKwxg7mxIqOOVl4gAanPHGBVRsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3OCBTYWx0ZWRfXzeeTN+TUa7Ul
 U4piQH3ZEC8MLrKYWIF4EGflK0M5ZobQtBmrNxyshXFHbj9VqaGKy6mM+8k6piAX2KLHz1Ye0en
 CnK57vGNb7orahKV3uaJ6uPnYmS7AOdh1lknQKuBZ/4ksgx6XN6NtojOkU8W+5XyVs4inUrq/F4
 kDO+1xcdtTHqjaYGMO8Ix8QPgKmz3ITt8GO5KzL1cEgnoyWPxeCDCnSI9HUfAwg6mVjANBehfIB
 1IJc4195AkbT9pR5//937CB26dyTcSaQ9wSH06UGiYdmiUcuz6SuTvJ7LnWUNKcjoo3bBzCUOjq
 u595hrbgSCcmIUXupH17hrJpoNX5LE1uuyC6wIPmHV9pvU5/YDhShJEGxUjt0bJnpMDHbePwicg
 KfQzVzpKy1t2RGIRd9G7oXMTbZgy0PZxbMQyMfVSLOYRJOgSjPxoSbFK6TejicuWw9NyFYUoc1h
 dsfBrABsAyWngh63zUw==
X-Proofpoint-ORIG-GUID: qQOEyPE7SKCTtMNHmNgaKmgBkK9VCZ4A
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43834a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eQ2hbtzqWvYFnmOUgewA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: qQOEyPE7SKCTtMNHmNgaKmgBkK9VCZ4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115328-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vz@kernel.org,m:andersson@kernel.org,m:error27@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 887CA6E1CFC

On 6/29/26 6:21 PM, Vladimir Zapolskiy wrote:
> If a dynamic memory allocation fails, the returned error code in clock
> controller driver probe functions on a few legacy platforms should be
> set to -ENOMEM instead of -EINVAL.
> 
> Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Hm, I'dve assumed that static checkers would be able to find this pattern

+Dan do you still work on smatch nowadays? It doesn't seem to
catch this one, but I think it'd be valuable to look for this pattern
- AFAICS it only flags returning -1 instead of -ENOMEM but I can't
seem to trigger it with a manual edit to this file and the following
args:

-p=kernel --pedantic --two-passes --assume-loops


For the patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/clk/qcom/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..0e8f380873af 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -169,7 +169,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
>  	if (!node) {
>  		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
>  		if (!fixed)
> -			return -EINVAL;
> +			return -ENOMEM;
>  
>  		fixed->fixed_rate = rate;
>  		fixed->hw.init = &init_data;
> @@ -186,7 +186,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
>  	if (add_factor) {
>  		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
>  		if (!factor)
> -			return -EINVAL;
> +			return -ENOMEM;
>  
>  		factor->mult = factor->div = 1;
>  		factor->hw.init = &init_data;

