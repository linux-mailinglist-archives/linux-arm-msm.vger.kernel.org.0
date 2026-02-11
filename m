Return-Path: <linux-arm-msm+bounces-92617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA1+IQDajGlIuAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:35:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20F127309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE625301FA5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9663D353ECE;
	Wed, 11 Feb 2026 19:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH7nDTmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMp+aZNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254734EF06
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838515; cv=none; b=rvk6oZxKXa9Hih6MH91TLsmATyJuYDwiPPr2TqgXc99gwD0/OURIa5hgOS1BLT7pIH5h0liBuLJr+BxTkYvMnFQruHcWSjF8kVxi3PJNC5XdvZAvVngMiu1cBRJD5HfONSUw8E+nEf+kPvHTksgap7sVOhhmeJ0tlbaX/JlnhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838515; c=relaxed/simple;
	bh=BcQUBtC5RaVht9w08zC9w1djQ1okZSAYTrJTdUH5Oak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Huov/dGkX51esy/YQnC1UeQZFi42QLkZntbeiKmK5V6+n+wL0aoqfpv3FNEDLb6etXwE5ipMPjLo1EA1NvbdDCP+hy+GsKTmxjPm2FDMuwQ/ixWcAn2NyrKTFmlBuLhzYcIPjHX+nyWh4HBabrbcqTw1jgAn4wIVhAr7eTvKvwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH7nDTmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMp+aZNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BCVN8o519145
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/MWaIqBoW7l6xDUumSvFH+oS
	13ASzXNm6j1EShT/Xk4=; b=jH7nDTmwyk0drA0GJFWlLJ4yYgRiwO90r30teZBg
	7uypO/GzJcbJ8nP+EenHUkskWrcXGc1QAEguxy4GTBg3SuBu74pPPHSbEoyCsKEi
	gjpEn3b8jV0z9othIg3C+eabhlXxepXvEKjCJEVzq9wIN8mxoq9ueN+PK6XGewdB
	BKoZGZO2yeivrHoOQ5pc7G9+QjK6ZhUtbzQ3F9g94OnfV+Pobvw8RY0fSyeHGNCD
	orBoFQOfuyvW7lr0kZ2YYNnqmy2GTn4nyiVsAhOX3PtDEXZ+RdFrOvBqNzaTa5JM
	IJ+SBpChbvGB9MToa6RpvMsuh4vvpbxFErKigfXTGmKf2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8sup9ej7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:35:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954adc2173so287392996d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 11:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770838511; x=1771443311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/MWaIqBoW7l6xDUumSvFH+oS13ASzXNm6j1EShT/Xk4=;
        b=EMp+aZNhj0exRO5T9Ufab9OkQ9uUJt9ff5uzkB7ffPPWz4GDj6caFIKagUCn5Flg4W
         OJJjBXUCoFBN0ca0WBUTWvscWZIdlA2kyfoZf6yk4W5hwkyb5Q/PtmzK3htQYKnJkj5o
         T5DZ4+7d/v2e5tQNbjrDU2gxo9AVX67xhbuEscf8A3CIanj4DYIq+qHsZWYnoButV1qW
         vYwvaVKBDS5vPJcgyb4KyjWIOzQRmSjBFm28qnHi8yo4VBpSSxDGygSzYwWcb8H8+OII
         1Npbhyustf/5YEB0ka2QHC/s5pOYey5A81LGiWanv+kosDzHmkG1+eB23fPha0ufNQxD
         cnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770838511; x=1771443311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MWaIqBoW7l6xDUumSvFH+oS13ASzXNm6j1EShT/Xk4=;
        b=uC9MFZIb0Mw9MgLiNm6MK3l4l1gPSUMbV0xfJI4YlJfCeaM2ssaffYu6Xy9yQg2S85
         LVJQDlmIyBjia+Hb4XCqDFofsJBAwEAMg9jAH0nhZQsbJ5xnMoj5QO+2EGOmM6OpCjaE
         xsELmmH/Mi2Hnrjn1mNHXbOuZXQ33KQP0OkET028prHhe707y3zNx197lJ1kq5nGBUNl
         cSL5sBtnzrbjGrpMuCQcwiTx16TX/+t9CuG2tH0MKh9GWce/+0oBbCJWUuQeszX4dco7
         980bRbk5zQKW7jzAWv9vBXJe+RGEmN4DReg4WCgwKvN07QugyV/mnuAB5LT8cBW4wakc
         BWag==
X-Forwarded-Encrypted: i=1; AJvYcCXyXfhbWxug0UEC8jvdmk1VEt12yGCeuunGjU3fUtnyhgTyCUVFZwuRsrjFwWuGD/iKEbKdwg5g6z9rbe8f@vger.kernel.org
X-Gm-Message-State: AOJu0YyKLE6HJg/BaVBWpFLVb5ynrDUOjejrhlzaNHtPmF7qX1/tGB/w
	+vp+GCmFYt+nGYgLjJ5hydcR3ve0ebZkjCEpoHEj7f7JpevrDGO+40Z8wAsmNmLOxrQOt7+4yTI
	nRE+xxEI4lGoh8RRtl21o3XG0lf/rsrk0bzK2Zd0IK0C82wMe97EM6+ICWAOaIbp9LTrj
X-Gm-Gg: AZuq6aJfsIiCLfPpH/4Sr7HtYHVNcyxcqW/OhWQpjOFZqRg5HBI3GpOsjq60GdLrYz8
	mREHrLVjL4n5dqFNSrWXxZNcr11RpqRREA5l8HV61IU5E2ICI5hNs8fYiYKWnM0lI+DM2wFWqo0
	YzclQpOjB5gbT9tuTujFBr4yrv+5BMJV9HuiIBg1hCw7AplxfmMwsbse9XKOISUSzAUKtIJXy/8
	89TnsekfhIy4jOcmLP/Ayg9IoLpJJ1P9tGmPbCxJLBLSvuf9DWOXXgUAbnm/16JikEP1RH7qxgq
	6n2EToqA1FVVOTXPwS+La55tm/9EV+WkB17xPgtpWCKyrRTtHxeW8XBztFaEZQot2C3SimJZfs4
	XDO4AShobCRWz8z5paECKDX3jWfoKwV/j8xYhx/+pru/6ONRz2ePxrgd1TV/89DOXYQDEAuhx8e
	6vcktoO2QOxZaFIIctQ0rTgiaPeMECvJnI3P0=
X-Received: by 2002:a05:620a:4407:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cb33118c00mr48388585a.53.1770838511375;
        Wed, 11 Feb 2026 11:35:11 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cb33118c00mr48383085a.53.1770838510850;
        Wed, 11 Feb 2026 11:35:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387069067a1sm4089271fa.34.2026.02.11.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:35:10 -0800 (PST)
Date: Wed, 11 Feb 2026 21:35:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
Message-ID: <pzffmjl7crico34lt5grelvothuukv55czkgpjupeiaauqecnr@ivtu5may5nmi>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1MSBTYWx0ZWRfX+yaro6XFI15u
 3TcCI5VRJQiDSEQkCj/XzUl1aHH7mY/ydB6GMbRC7D+nkrfVcl5NSJMcJnOtU9iXDauHmGe/3XP
 eWTlxLGmPKRaIrYPHLMvDd6cMqBjnlFTzlu9Yo2Pmt4ZJEqRqKwEThkMuMFFzcUxAVz6c91ejAF
 2y7HCrl1tVZq8B7KRMQOZTVMBHLDZZq1EHvf9xmObrjhwHyplJMowKcq6TFC/8ES91JlWYJAMNd
 1Axo3bw5cKBoaZzw9hpZ2RKQah8k+AMibT8DGCfvASBhi42uj/8Sfmb/AaPDOaz3GX6mOKV8STM
 xtSrMbFLP61/yiUTdtSHByV/xfK62QJZSiMR1QftCCkq4VTCKLRJVF1xG+OIuA2gu/eR93HpapQ
 AnFNq56I6VWzChBqiYj05Okvtg8234oABjsIT7VhV30IF0fWWfVob8krobLHkhIGvzPg/qkQ7VU
 0s2b032yT6VcLj3aFsg==
X-Proofpoint-GUID: ZoE5xldGa5ZYJji0QMlBq78TFBowejb5
X-Authority-Analysis: v=2.4 cv=Uslu9uwB c=1 sm=1 tr=0 ts=698cd9f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=liEOAQfpDFVzjJCTmxkA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ZoE5xldGa5ZYJji0QMlBq78TFBowejb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92617-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B20F127309
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:52:06PM +0530, Taniya Das wrote:
> The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
> Update the divider value to generate the correct output frequency.
> 
> Fixes: 874bc7be1e08 ("clk: qcom: rpmh: Add support for X1E80100 rpmh clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

