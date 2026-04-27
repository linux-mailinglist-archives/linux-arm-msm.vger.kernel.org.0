Return-Path: <linux-arm-msm+bounces-104739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM7NNLBi72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB34734CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50D823064CFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B9A3B6C09;
	Mon, 27 Apr 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eafwYqJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYHarJkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D7279792
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295839; cv=none; b=p9HUPAILrtnqEWJp8GflY3nMH1nAEdVd98a/8wRmeo5+WdDvaylDcrSEaYpu1YOX5VEMB9pZQwM6hnKMP5/NSqbwtviJ/GklckuDkKJ2zlGCdjcJYKP0ayLDB3AL/BqpRHZBS5c3ChYhikNaKtY5m1KfmyGGVj6Wx/DERK/zMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295839; c=relaxed/simple;
	bh=JH17vrXPwQ/zPe5NZmHZhSOAr+xyyo9R24CTivGGCn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtn3YWkj3Qo9nuO6ivmI133aNnwGNFeHky1mzMJcsm6DUH35O4X6XjQvNDIL3wSH2fchVWuTBSRSP0fiQGFGzJYOX9hmmM+ITuvLbxZLL70WraEderknARIDVelGzpe7D44REFZQDv7Fc7HLnaE/5DUz0d2SwywUnWD/lkOwtu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eafwYqJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYHarJkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TKw82914399
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQ20hVfh6ChaIxk/xrbKz90SjTLBFn05mgb1/z9GS18=; b=eafwYqJ7X+N7+uxR
	HIqdnIywU9Y2UwhDLXF8PCr3AOiJXIfLy0uDSBMROxVHG0DnMbw4j764Pt9eOTbm
	JlQZnUAY1gkwk4wjkg5BSMxqwVm8+5L4gk0QENcKBpaLFvVATEqYqAh3ts8kp0Oj
	bXQupf3B6rIsQiqWWzYqPc4RSt9GtazgYXWZeUjkDEZDrLvW9GTkuklA2jLgHVWX
	gJxT+lmJJUiE0InATBCObRul3i2pR717KX853O6BVR6NoM1MhOx06svUHkChnSL7
	LltYM9YiRWxF9MtgyurJ8QbR005kJLcRHocip+GGcAilGK3sClsiBd//vE0opSoi
	MEK3TQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xhkx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:17:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94de248f59eso572250241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295836; x=1777900636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQ20hVfh6ChaIxk/xrbKz90SjTLBFn05mgb1/z9GS18=;
        b=BYHarJkGkZCiEoWGV5sQV/zYjPCTzv00wfcm0IAJupI0lXkPjGun0VesHKpLIUtKG6
         L/iqA0Zi//YMEidLAJwANzUK7X9l0LMtPwGcTnfeoqnToXwwE9jhPJqhucc9yLWROmBF
         TVjF/ZwT+dRR9VOLkREJZ7cuRYyGQSTXPSHIoy9ElzqTEq+oouv3G9WXl1hZXuuJwAYE
         GIsrEyHnBUSbxQypNm5bI9eYlocA47+WtTThAmBDOrJC10g9CJEfquSIuCJL7etocPgN
         He76z0IvxYXzOvl3vj8hbuS7GUT32KozRkO3s2oLRNNhM8Xe1PLioPkWm0bR5bMrYJ8M
         8A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295836; x=1777900636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ20hVfh6ChaIxk/xrbKz90SjTLBFn05mgb1/z9GS18=;
        b=iXa6xVl3sbMTsWGFmDxle7yCAa5VrirPac+C11KWTj1nsWAXf6FJCc1Zg2ozwE9Qj5
         ZI+x158XX+Vb1BqJ/cArE10zGRWI6T72NSfKdEDdWMWQrAsLXwZvlrq6Vnma0E8jbjSf
         21cdBLBCvIXzE52oPu52SmhbqJbvuzSAvrN/zrAWCqCHVwn5HIkXVtmS2ykbXcqyfT7J
         QKT5NSUBkDrNC7hqb92tBmj6pieYveAinEdYH/zItWUxlKpMqGZNVeviCoRuIvlful/8
         dPCzyFXEe1axSBlclGdhqHDkC+DZEfSHDsgRRjYtSO2epD5Uat5UzlSkAUcEIx1J1AA9
         AXfw==
X-Forwarded-Encrypted: i=1; AFNElJ8t8cPGdnRIJLIhAbLwxJ3fJLPWQoidanaA2xzLbz2FPjzEdvpb455iLUYsaxCTbDHpLFNFc2LGQ/4m4viP@vger.kernel.org
X-Gm-Message-State: AOJu0YzN50jNmuTi9+17qw8UNAZMda03NO4FZ+q2msqtKtEWBsZOPA/X
	CJYyaH+RKgAIRKYF9vGbmVH5foZ09tDtisC+WJL7hwLHj/vnbhvPEOecI0cZ2Try85wHwG5hxce
	cA8Hg+mp+uJUYuc5s12tnBkVxOu0tlbkeUz8wc7iOSuLb7XnkHdwGzL0zQahM65V2fC7P
X-Gm-Gg: AeBDiesZCIJhxOYm2AEW4PfZY89wj07NLx8iR3M4Fl5ydNM7N58OrqKOwXmvKP4gKls
	Rzlzli8vPewCG+wjae4lza2sVeoH9TUVDL2Iu6h5syGmJm9Kimgdoe/1YWUBpFkaK3s0f0e8mjA
	61FnRt+CS6VHS4blhvjVYjmwYKgNvcR9BekKMRhkd/jDUEnSOksua5ev1bJ5vEgHJU9VSR23pDq
	7V6bFNCjvi0YfhXvXErnpZjDrb+VvW5vjSS3XgiknBHBUfvR3IuLDe+cUTsqoE3hTOsqDJhF9Dy
	JTJ68EfZI9aq4BuDrRSVBaX9j4ZWT2OT54sC42JyaOTxSUpdc/2krPptRJrrepT63xNWZcVkJrv
	0dhZ4sqHNeBmXfFNotz5LjWtvZorQBvWmaYKp6oQVme39mZ4brgvu49V1XPOiSMJHpOc9lOEGzq
	PyFFvPjOItctEnGQ==
X-Received: by 2002:a05:6122:83c3:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-56fa55ed7b5mr8965576e0c.0.1777295836239;
        Mon, 27 Apr 2026 06:17:16 -0700 (PDT)
X-Received: by 2002:a05:6122:83c3:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-56fa55ed7b5mr8965532e0c.0.1777295835721;
        Mon, 27 Apr 2026 06:17:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-678974e23adsm3156526a12.13.2026.04.27.06.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:17:14 -0700 (PDT)
Message-ID: <4e454c14-92f2-4929-a058-3f128c901a00@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-6-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-6-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2_dJn_qeE4joGrZSLhRc0acs853JGC8i
X-Proofpoint-ORIG-GUID: 2_dJn_qeE4joGrZSLhRc0acs853JGC8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MSBTYWx0ZWRfX/JCgnuN/5Z57
 zwnv0g7UeVw1FWAjIwUlc4zTRM3ms+WdMPp/GK45XtpTeTDyVnH90BbuZEz/p8f1JBB2pM54H9a
 jeDyT/V/D8PkK/2KoQd7ECUTHc9q01qkYFnMOSEa+TUG574jYQDMDQzfHB3uz9iNNylMpE3Zb3C
 Jf3II7nQg7KA9+9kItonGXc53fQLPd68gn2VQICmfHGyibKEYfUM4DWWkmvTCvJZ3I4sMI45nUl
 vrvmOIMa/shzC0kGC5kzNnccURwYnZ9Xq6nEHvvHuxnuc+4+YGySUr5wsthifIORusmxoKGY5hA
 uWWVQNgl9+Z6zcGWw4mGmdLW/oq/cAreGB2jDyHjWxxeEWPhx4k8Ce3B+RhHFTZU0vIXPAivX8b
 qg2uHLjXiwoVtpHW0kDDwKDB957E4nz6Gyoc8oaTaOXTclgdPpb2oyU8x1qUq+MoKskyATs7Lxx
 JqrNOowlDWWaGH+JRVA==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef61dc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eR-y9ft8gFT6PtJfczAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270141
X-Rspamd-Queue-Id: 3BFB34734CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 8:39 AM, Taniya Das wrote:
> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
> which is under the GX power domain. Due to the way the support for this
> block is implemented in its driver, pm_runtime votes result in a vote on
> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
> architecture which require GMU to be the sole voter of these collapsible
> rails on behalf of GPU, except during the GPU/GMU recovery.
> 
> To align with this architectural requirement and to realize the power
> benefits of the IFPC feature, remove the GXPD votes during gmu resume
> and suspend. And during the recovery sequence, enable/disable the GXPD
> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

