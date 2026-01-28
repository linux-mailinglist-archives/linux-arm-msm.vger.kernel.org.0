Return-Path: <linux-arm-msm+bounces-91061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OdJLKs8emlB4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:43:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 124ADA6099
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5D0330CDF8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E6C1E3DE5;
	Wed, 28 Jan 2026 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbEQJlZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3twTr4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F4127C866
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616425; cv=none; b=Tzy3Ysh/6HPNeCy0ToVALarEnpkktw7edY99OoKwzyeaszpprRnxIlTajlUDG1ClcBRH0HKaxWXkhywm16dJp5pTbd3skewy1itFcWbjm/myF+KWCDnzTK3gabt2TJsLxinJTAdEVly1l9yMSy8leanXgbJ67DySQNuxA83qwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616425; c=relaxed/simple;
	bh=8xcbMvdHouxhA7uaGvMMr+oYjd2YVtH/1NEy0WvVEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzvDM8CTC0BYRLuJevh0cKxWybs40rJqjmUzyPCGgKFBADHJUCZ1oY5qorQZM1k8TibobgEV670f4+yMdv/pev8naTk+BcSqhemn5Bh1P2GllGj7PwweT5SpDeVQEZ4jqJGEyj9ao/cBWj8MMAtekLInIaWUqc14IDX1lWjX8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbEQJlZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3twTr4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFnkln042010
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wT74JYFNoQcS4wI1iniyZim
	QN/JHMCSXvXZOTbFCAs=; b=DbEQJlZUCQ0DWI/iv0RwoFK7HTXK+pjbIfWIdguG
	mQWQTkBX0zYy75o3Le2DjFYlhdXmkn1VgL+MmaIhWeJ13JwylSNZwzATp1ePlewD
	z9neIrgr/RG38y3yvKTTCGospOkypsDkgbLtfHMq/alPqYUYEqWAsRfK6VDLTFIS
	aHxY0CyUt1EqlIHZy1LgXqIwPIWOz4gfD5HhznSy2ydxtsGsFV7TI8TxKl9v5iYI
	SMHLpV2aGr19koOv5ptwhEIAPmjpFnmBG0C5LR0AMvyljm165Vr+N8RDgJvcHgG3
	ZqJBBW+zLOtSoEKi7+/xlRv4Yi2owlLbEkiLXHYRQv/6Gw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355utgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:07:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5663cd97317so6797098e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769616422; x=1770221222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
        b=Z3twTr4ZdrD7JXVvPRmk5YMZo5ELeOnfGFRoqwFWRxtKNZxqbf1Z55XQPZhbcr3hUs
         Zlupx/ScrouQMRQ7y8+0o+FUbrGO+MGGRcVb44Q+vveHss67wVDZv30GPrPy/WHzH22j
         KNcn/F99Gbp8p0PBvTbn1oWWd5Ym0tOyFcqyjKcOKamTPpwv7OH3Zro2FzO8WOof3dA2
         BfvVHrrEFV2yD9tvuMUbllW0EILzYGxp64wEsf//cVB0Z+IgqeKy+t25hPEEXvTJxSGq
         RoQva76xeH3n+evBLv0uiWKYTSLXG4LdUYM4+2SAlnufkef0W2gViNl2z1Xvkeax3sR4
         Fhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616422; x=1770221222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
        b=ZahQ4/IiimJXYiRvyJTWSovGKip26Su3wM/c3yapKEckmp1HcKA+sTR78gh59uJCQt
         v7IcQU0ug64MtlbTxVrVl4AJr14BB25tu8RIQ+/nvzj1zMyUUttcEbIIlxI/cndgh4TU
         KhW80JdG2Bw4ILodB4ToKgdUz7KXG917XzXV+WHjhcCd91ZNoyBpZYK3G/94a0VHhBFF
         1IMWJHPkYdjKSV1MaxeAGEu4hD+rjKrhTNr0PVYc7bTwQtWXVB1Nwmq9pM0nUe7b4bbT
         6nna4FWEJUOTBjyCXWvw/bg7TWWYWbYvkjSgEinIGkJ6l/D/PeRlj+k14FHn9zmsVj0s
         Snww==
X-Forwarded-Encrypted: i=1; AJvYcCWYAxsDdQDnPW5DFMlEyFWE4GBnH8gJEq0J3JL0jSlcKsYkUJMEXtzV08IDpQKtYtH/mCBVQOmiufqZVDjN@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0DmNKdIUaG/y7RHRIo7E0PVFl30v0OlWpjEbKWH9TBY7nT1q
	93PxNdKt311llAb1inBByD6Cg0zh3fXrvOKneKwqKO25oII0eNBpFqPEQndCCCW9GFx4BZQNNmN
	65DWeFlX+uQO1rYU4a4DZXiwlIJSVV/H6yr7pj+1MMZiC1XQqMZH2mV8E5C33fFuy9Lp2
X-Gm-Gg: AZuq6aJbamMgt07xwQn4S/0EWE9uuMz0OUtlOBjDLxhCrCUVJowchviBrEfJQExIKzM
	WR21wbod80kCE6DbPbu1lr/G5Md0dYKRuDOl9r6k7doDFRYr/p1fO/eN+9hAgVdgsbI1rhCfVRp
	PcqKfJksscVwlSUFfmCc21DsLOyc4RmzAi8/YKALKzzifuvX72MOYWAKdmHAH4sz3nYaDXAN8qb
	sTy3ce6F7Dc/SLjtTbSomMhsSzFy8VWv2jy/g9ANdTHKduDQgwL4OZdydeYgpfMcvFNzqPrEXnT
	Ka7wiyyzp+hSzAHg9WJVKFfi9aBsIiKqBD7M0NN1lkauEl9j5kkLmCQpCqX6D/wnC6f0tmkMbpc
	MoAjfzXkWI2d+hoF/gLAjahtCma0XnigP0nDPf6wHbBMOtyOe+KAXlEEuiGTUUJ+8ZiHDzmcFab
	DxHI66mBq2Hsp2irESVjRbb20=
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-566795c542cmr1437735e0c.14.1769616422280;
        Wed, 28 Jan 2026 08:07:02 -0800 (PST)
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-566795c542cmr1437707e0c.14.1769616421853;
        Wed, 28 Jan 2026 08:07:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38627876ab6sm3997671fa.49.2026.01.28.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:07:00 -0800 (PST)
Date: Wed, 28 Jan 2026 18:06:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750
 camcc
Message-ID: <mpb5lca5n63vyp725nfvhzcyckjzfw3qxhjrwrhsxvbaykkcta@lhq6t2guwm7y>
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697a3427 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: FXnES4taTq9g8kLS6EU1k8Z707KnwDMc
X-Proofpoint-GUID: FXnES4taTq9g8kLS6EU1k8Z707KnwDMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMiBTYWx0ZWRfX8FIkzuxKbv6A
 B2UCDqhaA0Wg0GFrATkUU/zyjzr/pblnYc3d2n09bAlD1tbdyCy8+UTrNZZ2yXEUm6Xzqa+c3XP
 Q6zuX8BKPRQKgeIJEbXTA3bwMj+/m3aSVpyAb6VcvF53+Q7vSVjazWt+pvtFeh0K8oiuWWa/9nv
 +CwdN7do/3MG1zDVNI5BqBbk0hPwQWePg08bJ7yX4DgoM5H/XgK6bqIEm5LHBTUB13SLVDUoXU7
 ataw96Mo1OhA86zDMuzArkCGFdMSL+nl1gLnMEvoyRq7WiyxTWDpdc1ggz9IbBj8jHyNQ3ddZPr
 U5N1RDekhBr9Wk/LRljcUA5ALomCft+pxJbTXAdPgXcLpVDKkA8CvlC0uNQIxd0z6wHB/Key1in
 06gGQOAskK1s7VfjhlKIjdmT2ewE7r9LbbBlL+O/4P3F1KotYcABPKtooteu+il/KiMvhiIU9nG
 q5zJVz9GQ+HP6XtkFsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91061-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 124ADA6099
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:43:07PM +0100, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

