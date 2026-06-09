Return-Path: <linux-arm-msm+bounces-112279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q0GnGUKYKGpzGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:48:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06502664A6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JVZX0trk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kt2yuGTq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112279-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112279-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C327301E59A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 22:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290D03C109B;
	Tue,  9 Jun 2026 22:44:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD913AFD18
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 22:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045068; cv=none; b=c2bSqbCv/vknxCpk17iEP3/JzsN0Max2bmNo2fdCOHjwtYIsc7FMe8J8GPPdaNg3wwNILljadpl+kUmUvbt8MN66xl0Uf4H6jgJQmlJEpaBjuP9dLiLJ3UAxLHzAsOzFoe5t67WD7TM1ZkFJhCC23xAkpNmwE9/vEp/2o0VPHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045068; c=relaxed/simple;
	bh=b1QsQawgbuLn9oDBIpfMHuUH3etBXQf7S4IHcuVmTfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhutpPIls9QqGE5l4O/PTWuY0Osv6dQ+eizJjf2CaAGrzpiA9U8l5NSIGU4Eo8RraK07L5cvteL71DCry3CI6n8xHWabd8YHmazdFUOLpFJVj+ykLH4TQV+sxSvDqDXkm7OJ+NLLbN6FNUF7aFLK25ZYIPMP0B4CV6RdR9HMN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVZX0trk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kt2yuGTq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MET2w3537907
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 22:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zzd7A46gEHe0q2QQUgtIlo22
	z4kZx3py7wq1qUJgP84=; b=JVZX0trkHX/NEWC8ru2zdcL3JhWVjfWpxOKvadZ6
	GUwUuiRYCO1XQ4pbmYFZWr80r1PFWDTVUG/8r6eh105t2bsB+3H+To5AVLx7Wq+i
	xC6qzGdOzXuE6bqfpBgqIom0EylZ/CJ11IrGEoBBTNM1c9xQO7tdUPjB5z1fdmPR
	HrBMdCTy6yZyfLzK7UldnWyJ2K9PmZ+iQGVAtfOYiOnMekwnNxg8AAJYh72+KXFh
	j2e2fxGnauyCbfFzHvjjRJ4c1NOaw9zDGB3Jub/4YpcpW0yyTfNULqqwU8EMlfAt
	lEC31VrpNgUH5MYAOtughHK2WgVIbMMgg6OPw449Qv78gQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jur8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:44:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfdce65690so2142180137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781045065; x=1781649865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=;
        b=Kt2yuGTqyCsDoYBBF7AykJc/bUzcshQJ1oRU8mlUT30wmgJ1PPy7EoEuE+GolvMzJ0
         lQHIjI/0ndgoy5SfuaKNGU0k0rMMRQ77ljxK1FrTq2/P7PjoEbZyputKVGTj7fEz66AE
         cfnOyH/W1tUi5925sOc/SeM1S2tBd2dw5ZWr9PVvGykPqHm4PeyOpDF1I9pfx2oOtz1L
         DbDp/FADMP1RpNGiDyGoq6SZgLvqTzf9UUfDsqIFu7cfSYs4fXcdC+RqmVv2yhz00ywJ
         jxCQD5omkCBK3EhKbfhHdBNNH+U/5v0/dY5BXBbd7R1bo6COSzLvDN8RGrdW+pECnVpJ
         hLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781045065; x=1781649865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=;
        b=i3SEddEhuj9zAkvyeJ8NwC82QLl0ZJEajovucw/wXXg6FR8o/afbnFLbkokzoQKsQ+
         aZ5gGLE7hr3pdaSMD4YeZ2zdWpbFIowRVl6XJs4oIKQcvZzg7YwH52Uo3HABp5XxqC4s
         NpIgOrwbkT0KLfX7aNqNE5JIS/W1AGQf+q7J3xayHKijoWKEYF3w4Fa/ZV2xrD6pWMj4
         +pwU7Z/ImPuPdTWeG6r7EL9oTSZYgowLMi725GVwPT7VNQJ1wKXRqkNjqaT91jKFUzdq
         b8dDxwRYJ/KBluYoaH6olgy8iTsAfgaKC7JNz1LUCMxr7Q3ndC/2Y4wlu3+58+I9rDEx
         V3cw==
X-Forwarded-Encrypted: i=1; AFNElJ+8aHP0v6Ph7TdDnB5XnuQ1f+RfKhYlLzh0jO8Tz/gThL9XimTIZucQ5byNRPdXx4aJr2XVZ3KAs/D5WW/j@vger.kernel.org
X-Gm-Message-State: AOJu0YwzS5/PH4cSwcC7p9/FLkYtTlyhIuI2WqNP07Uk+mdGfRxKet6J
	BzM6UkGkq1MPOHqfc28gwFGO5JJajtX6UxhP8F70dLATMdqertq6KxejkK/Hp21okn5xo1gBfik
	X6vBl5CR3RRFwDl0zZNPXVDSsw21797uBIB0dL9hPykM++W4Uhzg4ib2HO5lZ+cKD2d/g
X-Gm-Gg: Acq92OFLrUiI2CpjRzzUPj3ICTIScqrCrlvoIXzwJMSgxTou+sPcrkw5QICPADMG3Zt
	WETLUvjOka5h/EgbEbw/7bIG/6luLCt7L3gzO3lhz1iP/DVvI8/LWO38pZ9w7x4xHOHsuHcIKyD
	khdc8y+NFbJ01JLGRh0SY7om5jUr1sMYkHHfkvZD3g3X4ktQHd5L9oy0VA2uQAu5D3lRTEWWP9J
	xRFTIdMv5CcYj7mUatCS83EomuCTbqfOS4Ibk6Gfm0JzrS2RTEMLbsAMCRoaImJYm7fE1iizLE4
	Z1qqUM6x48o5zWE1f8bLIVGpbbQ72PDPS4zJhiqcEuOxKsrrVoL1CVeoJHyIJMpSd7S9MDF8rJY
	6ph88gcpU+F6Qnuxi+2GsHH7UX5iel0tLWiPCCDGimIJBkfmN2Rzsb6lyvPVvYkSh5md97a7C1o
	y0QV79pA==
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-6fef26ce86amr12937897137.0.1781045065080;
        Tue, 09 Jun 2026 15:44:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-6fef26ce86amr12937882137.0.1781045064675;
        Tue, 09 Jun 2026 15:44:24 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ec0sm57509621fa.33.2026.06.09.15.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:44:22 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:44:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Message-ID: <nnygotjru5ximoea73xhqwfjsjpditmhonvf7lmugn73dc3mqb@rl7agcusn5i5>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
X-Proofpoint-GUID: TJSax9mVjOzpshP0tLbTqt_8ZDWF5ZqU
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28974a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_Y7Jz4vysGH1ZB7Bx6UA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxNCBTYWx0ZWRfX5LMF+jPbiEnU
 F1xGv8JgnUTOjSt3RtYI+HUTARn5splwVfSDqbbrmUC/m2pf4JpmRl7BmxM5qhP0MJVbr6Kybov
 1+mAXpygvpOXXybcnOdPiCrqjyjBn9CZklnCCNvcVl2J+VkXFumwOH/PK9lcFVKrVojx6tWEohv
 u3e9Y7YcrMarh4W+m7Ql+KU172cy+mR9pDMeuKdZ6uB5PMTFzfkyq+U8BLJtdAacxB+Hssg9mHg
 5IqWCvCV6wQ8NPrwNFdhQLo+CHCQ4UbqRdsIHArVCiT7PhOg7G6a65ukqhm83a54g/DT8ykKGWs
 EJfvac4Vz8gjO0cd0mpheokRuLWABu/tn/mMbehl4xKciyvatgrYd2VWk0NB4QsMlLCMgAuYnwv
 uHoWVF+973EGCH4UbXeaSPEGFPvaal2sE0NRScrcCRfSkF6bKX55OvCipigqyJGjh4/sCaPtwwO
 JuD5MNicfd4AlRnHqAQ==
X-Proofpoint-ORIG-GUID: TJSax9mVjOzpshP0tLbTqt_8ZDWF5ZqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090214
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
	TAGGED_FROM(0.00)[bounces-112279-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06502664A6C

On Tue, Jun 09, 2026 at 05:32:36PM +0200, Krzysztof Kozlowski wrote:
> IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
> SDX65, which are 32-bit as well.
> 
> Do not allow building them for ARM64 to make built kernels smaller and
> user choices easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

