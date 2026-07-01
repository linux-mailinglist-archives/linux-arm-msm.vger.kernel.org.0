Return-Path: <linux-arm-msm+bounces-115732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rkJxGesnRWrH7woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:44:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A86EEE90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ADpUeB+Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JWYCVQ70;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A959D3036C35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC3D352036;
	Wed,  1 Jul 2026 14:44:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D3351C11
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 14:44:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917085; cv=none; b=oTgT8M4q2bf1bGl8a8PeMkO1ep1L/R7ElEQ8/depmbwM7In2rhvYgNkUe0Mm8dBbvgWR3DSeaKKEpP/Zt9jghMfcJFFXCjGXfWZG9piwK6tuH+o5Y6+xT7MbuFGdDB1lT9p2mahYEOKxZxjB82pmo1/sZYfIYFuF+yksqBp950o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917085; c=relaxed/simple;
	bh=1zGBdE2/HidtayDL0pYPSf0Lz0PqkqrshKpG+oca7w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFJs8o6nmOyoE6UPp5t8DyC8xCR51WXj3Cuij5046C35lF+EFJ0mmysr1Z8MxYcTaLVt0IT2tiNQK+r52Zqtya21dFazZ9/wm2WQ/biYVbOaoip5RnN/RQ2fbdvd3p06u7+0sTllTxQ+EfmoKI/etA4NaS1PGxvwBDV8OuLibkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADpUeB+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWYCVQ70; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A91RR755636
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 14:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2QgaJ0+AnWq9D7O8v+2m3nVEk4DWTNcCzBfbZBLgLc=; b=ADpUeB+ZqaYV5n4u
	VtkeND0Z+iBaYKqD1XrDbGnJk9bZ2+rPtUxhCEcjQU6gaXa3ltsLZUwYqpS5oyKK
	p9M2Ov/y0ZO+G0mhBGRKTqU/+/qhIIwuyTH7uYI/uVOCx4lmE7Tz05vp9eiTTX2/
	pFynL69TD1GTMPB9URkVsNo/bFQAd7YtdpILtlxWBdgUkYpyGrDUI8Qz8fZvr9OB
	YwP3ZyzKGT4tOCzTpdMU/IPoEa0Bso5abqbHHBmZjyulSsXSFZDbwJPc+fuMyhvW
	PkPdiHJAll8JceCuurbXJT/X3542apEPPCQ4j0V+Ejzd8aiSP1X73Z+2afciAi3h
	DF3ToA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqs63e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 14:44:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso2187331cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782917082; x=1783521882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2QgaJ0+AnWq9D7O8v+2m3nVEk4DWTNcCzBfbZBLgLc=;
        b=JWYCVQ70SRYWGnmZLqMIX2gK85L2fRU8+1114SMYIvKhcyy5lPEcONgIXUUUuoN/9X
         OQDcGu7KSguf+AhM6qbfUSNFxE+wP3Y331SVVBoF/fAV701JRRA4hNKdmyxqHTAI9+pt
         Am4MBVFmB6EvQVhDL3zSfhFk5J9OYYc7o4rZTWPprTr6fGFVKFD4+tH1jg/AK+Q1TKwv
         JDCPUBsPPWNiDhE5HUKPx506mCct03xhr+f3j8YJL1/TRJi5rp7mxFYw2sswWwP/LQaO
         D0mEfZ4fRz++XRQ8sB2eOiVjDAEyGio6fsw2HAwhFa5Xw11AqQLPbqYHm49xmimFKC+m
         WATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917082; x=1783521882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2QgaJ0+AnWq9D7O8v+2m3nVEk4DWTNcCzBfbZBLgLc=;
        b=a53BWJMd8/Nv6GQJsq1er/Fvpo0w+H5F1PlrFUvbN/56Shyx/ksn7fXg6RlmhSFdwO
         bf9yRQwyfbR09trzN0Gam7FJFl+UpTI4XxCvIGbqHBBHJyP52CpT4lrEVDiYH3FwJBla
         XqAJ5MTDfCQi/efYb9jlOT7u0GJbQzX/pmof3N8zniY7tSSrHJXw9RG6ItvM3Q9RY8Z/
         b6G/KG/3DTU5GUPv2lcYRTBT6F6ELH/WjTP+bdT4JuuNdpIr+1xuVkpN3bierFnbxdVI
         0DSeYJ2bi6rhI+U4zpa+bfwrZZ1l5FiTc/6CDF6XGieRO0ZKAuWkt3jtTjIi8r//sbr4
         GsqQ==
X-Gm-Message-State: AOJu0Yxw+WXUFGS2vJBYdkKoqOm/4RyuU2ZbEpMRMnR/XSJHTJKzbw5G
	SwSVrV3L4HsePFQtoTQ72vfmnPXth+STLXeg4ZsCIQJpZGTXqyXpbMiZu/N4JdvcmgdTdpapC7C
	R69+KRfPXLjE0wMEZMqt6dmYXZ0sKjx1rR+Ec6FckUZkaVfWnXJ0dm185BMEfyiolHDLa
X-Gm-Gg: AfdE7cm7/hfFcYxWpKkZk6DJWSnQ2gfZuJSGmPAg4NqjxM/483DJbM7j2/UJ91ilp9h
	DBAz/F6N0DLoGRZlMP8BxN6qenKBJbw1rXSzojPmlOOT4xUNcSwBvu2mAzzR2I32tBKzMGkRUxA
	W8pRv9zDHDX3gv2wGLPBt6jAc1WW/iZkC7NVv8i+tnj5pmxG+N5FlUXRyeUMJQ9ISf+gFVNNLiM
	kUVl1RXbxQX23uN2sQc4biyjBxDN3vc0dPx4q14CslKbh5d8RwTroqcevm64dIaSTD99gWDH4/x
	Tu+fTZ081oRiE70jEG3Mb97GKuYs1uRMI4h3PN4su4WfK+XnzUCyy0rOzNmE6qbylKoPn0ypgmm
	agpUC2txYrCg48qWC7LANgFnur+OkoN0MEZc=
X-Received: by 2002:a05:622a:13c8:b0:51a:d45e:638d with SMTP id d75a77b69052e-51c26b25733mr18492971cf.8.1782917082002;
        Wed, 01 Jul 2026 07:44:42 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:51a:d45e:638d with SMTP id d75a77b69052e-51c26b25733mr18492511cf.8.1782917081414;
        Wed, 01 Jul 2026 07:44:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4a137sm285311266b.50.2026.07.01.07.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:44:40 -0700 (PDT)
Message-ID: <07f54b67-6428-4ea1-affc-0ccc45741292@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:44:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: add CLK_IGNORE_UNUSED to
 camcc_gdsc_clk
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZRjO4vq-ysJfqYgKdkqIM2xJ16E_KAPZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1NSBTYWx0ZWRfX9JbBJikp7sLm
 ZcpiKfgz9dKx8jQ2BY9umHhrniXApEllvQvRGgY789460DmreNDfUlMETJg0+CO8rFGXnNfGXDx
 byb8CFU91RVoHYCqQy6Qt6meYOr/UN4=
X-Proofpoint-ORIG-GUID: ZRjO4vq-ysJfqYgKdkqIM2xJ16E_KAPZ
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a4527da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VuFW3N86aykZV0Cky-kA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1NSBTYWx0ZWRfXwU+d7XQas76S
 cqBjf2v8MbEUC6IDVn92t+Z5UYWQ8i1+Ji3g7nSDHo9jZPase3z5Jx7jBBam8/HxL2UbehtTpkU
 RjCLdjumbw2nx8tnAZ0XSF2DW8DHoSxPRiAPRGU4nZvsLpd2dVA4W8nAtLRgiGCdqSO+NInXiro
 xydjx5//4XToLTt2Uo4VfmLdbtEBgDG7mSPhlKkN6otW62bmtZvom4C5cLymoG7/F255wGtRfCo
 1ES8EMzpFjKwKKmGYfUn1Tbi8F+UTooII11o409FS8MNerkfpnZ5Fg7L6NwPZJdoKnxl8eixCPs
 q8hTzVpBSez+oXIjotSNBkYMt08zipDy62Ysjq/X5SxPCCVL4vbO27nwrutTRuF4FkWKYAKytrO
 aDCSq0/P2343PJy4AKHFmdc9WaKEU6wqeKTixIpBOGUCzQYBxwg2FniXY9xWuUFbApyixEx+noB
 cLNWcqBNGvIrYvVaJjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115732-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D5A86EEE90

On 7/1/26 4:16 PM, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

[...]

> camcc_sc8280xp_probe() has the following snippet:
> 
>     /* Keep some clocks always-on */
>     qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

Let's just unregister it from the clock driver. It's just a branch
that can be online 24/7 (as this snippet makes it), see 

b60521eff227 ("clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK")

Konrad

