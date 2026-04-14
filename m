Return-Path: <linux-arm-msm+bounces-103132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB7vCngr3mmTogkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:56:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A53103F9B0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C2B306CBDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729333DDDB1;
	Tue, 14 Apr 2026 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOfyt489";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYATjmug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027C43E0C69
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167589; cv=none; b=U+ArROghOeIzKpJkfOTSLNcNI8K9c5DN7Y4YeSdXLHN/YJxjltnSFjQes6D3n7IJMycCHU9dCzlw+YVvH0cipvnqLWW8Yev7KCz8b6but5Xm/UFZ9ocoMZkVbPRW1GC6H7+IU05ITT6FKoqGYNct+Myfj027Aqj/pGG/LOani9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167589; c=relaxed/simple;
	bh=J2iGJy9WuxQUrTwdyN0lu26cuA/fTvufaAd+d5sGPBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XX7KgI30fQuZAMJ5awfuoHFsDFubeRP4DdNa1TD/k19w00PEpUfSw1IYmntisb5KeGxpnGxAWUfyj0D3ZnrZu6nR747Qv/N40bIWRQQ2P/Dsovi2kiEhrdgn89a6KOQJKUAYkjwA0I/Pwg8wvM1M9W7P4oE9cvkwWSK3Uy+uG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOfyt489; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYATjmug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBlkZD3157473
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2lWwi811V+fX94Vbp9/sis+NUG9UP9DFXsI2Zikw4g=; b=oOfyt489R9QHYhFW
	BCZ3qdIQdTBd9/wTH/x8aOYSD72awQd1mSDvxA/1RaRkqLtI4ICdmG7t2jKm28v8
	Ody8b0kMXQqaNHdRisVIhw/0NU6LH3RppoFu5UuaNmObmJU2VHzKVPxNg3j06OkL
	GL5IUomk41R4PnUzp7v9JIDN+/OEPmROc1iqDqLEm8YynsI+AJhnQdf+G1tvKDum
	2W1LFjm40uc6ENZMAtW8Iq7FU6XMRj4BO9CzgyF3BQUPna/UuZMnpaUS9yM55StE
	odr/WcguWwJm+oFnrTMfU9fNPKwUS7q/mirFGMuLrcYxPpJOshSi6ZqcbMoQbmQD
	hYYUBQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bah76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:53:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so19582446d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167585; x=1776772385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2lWwi811V+fX94Vbp9/sis+NUG9UP9DFXsI2Zikw4g=;
        b=JYATjmugqtby4C3zFS/2o5zntkP0k9/BjNPeCtAJ1RQypwcNTEnsItGLqV25O1be67
         BrykC/kNpuqkWWTK5Ajns5qfZBGbjbjOf4V+yuScySsygsnq2ntr3SyDgbil2ZSyPnV+
         WARCaoYCLNn9A/hky0O2RByqMOWuHbc9J5M0OpFWoll3zakzrSX5wWTkJpjZv75UQ4HW
         q3U1FR/BeJBNMfikI+FBIriydRGICKgGk70ApPgrB8ukikApyzlQjTRCMM4HIwpageg1
         6DaWXPOmJzJg9C0EcXllPkfkRTXABJWuVz9s0HJk5FZ6mfij/LGohuH+rCYsY/W49w/U
         nTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167585; x=1776772385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2lWwi811V+fX94Vbp9/sis+NUG9UP9DFXsI2Zikw4g=;
        b=Ttvkzg3xn5oTkbFwVVZ5xVqAdQgrCOzAv/Dmn1ctSXdp49c2ye8EJDeTYrh+QA0s/A
         jtPV6wWyrfIgIDH3Qk94mvARzz1iT8iOqiK+AWes6hQrgtPUwLTOaEbAkps4u6SiYBWc
         L8RJlOvlySiJU6/saiSE+HimgoEWxXMMCY7X1ZHZPFuRRHLOkssDkfH0aoRLxUtZETK9
         VS82P1DPq11bhm6r7PJeAWEUCxJgzwaiu5llZf9indlBpUkjT4ULXNKLsm16bAl01zah
         Bvbw9PhmXsdbJZazzB5XCqNG0zMpWHjQfljE1vabLZjQ62Ir6bfdRHSi6hZhDu82hOJI
         ADSg==
X-Gm-Message-State: AOJu0YzjFOhDIWhCWzE7Rk9yrbjN/SMUuUzqeShykg0SlS6t7aIy82WV
	MF2LfBkGFJ/gPzC3bhteVSyXS0h8O15nPagnKaRzpg2FqOP7OjMtJkLALkHGKugDUHdHrYvjmu1
	/BAwvd1gc3dV+L3j3JElhYZz0yAC4ZshzmfZT2JhB5Ps+o0AY/Ac/Ch5YlQCg4ncwHZeb
X-Gm-Gg: AeBDieu/Wi6neVYs7rvQU0wlZUifGtgPXCsgvw9WDizRt26RfBazRTMob/9KY9mlb2W
	i9j75E8rc/ZXGa55ohz+kHeXoNmh/FXNUARv5VGup7CS2jmvcwRmvDW7dYW1ucDP9bQc5qImltw
	anIL6lOnmwRVXNSWyHrcAMkG2nQKx+vLkkW3bbGg4T/xQiWfkdu1wdiNcEDK3sxcmY2lucG8OpJ
	y4ba44O7GaNvbkJ1JhjOtvHwDng+JkJLNa5PJheSUP0iXgv1OX6Sa/djBo/Kqwy7mf3p4gcHI2J
	ywCpPD1UA9ekG35ByfRTZM+8+/N1FgzHbOB1B3mlJ6FJtn6F+mLAleGrE4akj1KeIQhmpNLetBG
	hY2CUS7uvPeMuPhZIho07YU1cANEKSgBtHS3svcd/achOXqofJfncWza51kRlnw3YXCe4JPT3od
	SzwabGb9uhlBmScA==
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr202653396d6.7.1776167584827;
        Tue, 14 Apr 2026 04:53:04 -0700 (PDT)
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr202652976d6.7.1776167584347;
        Tue, 14 Apr 2026 04:53:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5b98sm397026266b.34.2026.04.14.04.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:53:03 -0700 (PDT)
Message-ID: <2c1da6e3-a7eb-4c85-8933-84ba9ac7a363@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:53:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: clk-rpmh: Make all VRMs optional
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMCBTYWx0ZWRfX9PCuIlwV7+nw
 v5EKYQ2mqBfDN/cddQFPCWkOuIwmAY8iyzzXCJvyGkoime4XIt0U8/TfWUnOFEesNCMNE5WnQpb
 tdRYtnX/GTJBJoAW43wg8mP3lQGtDyxyCGCYo1d/ONyzmaMQMFHLgJdDMLlD4zO6QFGUHDmaeMG
 bufnfAPrELGTqlzn1P32qJZIFKEOKVU3QOBmbA+77TE417+gt2UO7gM/vExZSD2psjB3sYR6UBL
 KMDKC+IlxqTBMOst1lu6ALoQlW2k1o5J1FzDuxjdk0Xuyts5ASumt2qmO+KShHji9cvZgrXcq6q
 T/AI1IBm1tGYKHQK6tpYeKup5G86TcNLz9nI7xkDvoK9j9Ikk0Xe8u8vACWcs2YE3hfQlxS4ZYo
 FqpxJ38NM1u/69lpukV1n56Bz0MbvrWpqRfVma6NcWM9rE5fiu/spie9ernPQ4v8qcX7vcVSz+S
 g9XwCUGOu+ABvpSOXyA==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de2aa1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QKdSdXKZvfk9e0BhN10A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mouc1NjGlpb2-cBR22FWcFeOWrVSTg85
X-Proofpoint-GUID: mouc1NjGlpb2-cBR22FWcFeOWrVSTg85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103132-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A53103F9B0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 1:34 PM, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> This matches the downstream approach of marking all VRMs as optional
> and makes the previous clka_optional handling redundant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v2:
> - Squashed clka_optional revert into patch (Dmitry)
> - Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
> - Squashed cover into patch commit message and expanded on background
> - Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me
> ---

[...]

>  static struct clk_hw *glymur_rpmh_clocks[] = {
> @@ -951,6 +946,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	if (!rpmh->clks[idx])
> +		return ERR_PTR(-ENOENT);

Hm, this is going to surface in some places where a nullptr has been
happily accepted up until now..

Bjorn, Dmitry, WDYT?

Konrad

