Return-Path: <linux-arm-msm+bounces-109279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMYrIfNAEGqwVQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:41:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E61505B3295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A2CC3017C26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E2C36B07B;
	Fri, 22 May 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laXkivSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joOZNTgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EE1DE2AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449712; cv=none; b=Ydf3+JYa3btzdPIQqrXvXS7rPNLZosxu564APGACVo8POs52ObXOnGhhevVrRWr5hJ6rGwlb0Ddv5Oac88W5sMtdtdOyGO5omSGm2GNthvhXuE/vP/yML4mm3RCHQXpdunuRBg1L+JeZrIOkeSjJjdxiujVmUKCHXs7rV5fcE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449712; c=relaxed/simple;
	bh=Fcnnrfuc3r6eyLl/lYHg+MW/gfauHflaY5wPmj8YJYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPyyGTpf9WTawEM7fwzcXG2VpzVTc3bpekVyWFcoofJiS46GuSze5gqZr+LXz6BjlO4p/HmHiDNwpnFbTiTPEWQMEUxXcg+Cw3+IizDl2yDpvJA6qPqK2V4kCF2mG3UNVru3TjfYhgVRg1a6PIZdWUhWylRitZt1D/TFE6eLzDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laXkivSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joOZNTgq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4BxM3947428
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sACrtE6qtRhpt2JdQIi5CbPXs8tHHRt6ISGnQM29WhU=; b=laXkivSDvSaVyOlM
	3/Pzs64SNB+lrSASVuNZWJuraXj/YvBXWCf/MWOyxg89gvkoa00EHIUCUul9u4oY
	NFMNNGT+0+kR2zmthaofRhwQsJqvVLgW6oxqOFiSHgIHUYgU66xajSazK012xCpZ
	GjcSIU9o00ugx9ovs8QR949SE7/sHLra8VdO01YS1HSjcbThvDcmaTniUvyxGKVr
	8sWfgXNe047pPqlmJBQqR+UcEhF2kwvJNWLpT0f4xZZvhhv6a/6N8JoAoEDQsq9/
	mSVCZr2BfBX7Zc0jVI/W2LosOb/Y6xhRlV9PVfKy521IzHwP06oqCpYtxdZ+kOO1
	cAlagw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng9f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:35:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f1b94ac9dso27402841cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449710; x=1780054510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sACrtE6qtRhpt2JdQIi5CbPXs8tHHRt6ISGnQM29WhU=;
        b=joOZNTgqsoZBWpZpXjpZ7gp1mWEqGQEG+j3uBL7T5BfWWDlSIUootc1Z+6r3jnKCQF
         JWZuyCTBSgjP1UcM2jVN9aQhvBHBAHz9zIuJJ9+pkVAaWo9NYz49MQUlNbbhfngSccXO
         wT3IAHELEbAVNcLYB2eInL2RgcnKWn5qHXIyE8pOleZDaul2ZEfrcY9Ot22KYI/kYtWM
         ardY9JR4YGDuExvnghzZST5knCGT0jDsP9aKQ/yEDcVbTNfkHm/o3dKm4ojsJbwWycI4
         QeJIqLna0lhwe0IfNkYrsmW/Ut3nJBLU1yaMxAzqRgVn/iF9wReepEO8ZPetdxjf2sOt
         9t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449710; x=1780054510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sACrtE6qtRhpt2JdQIi5CbPXs8tHHRt6ISGnQM29WhU=;
        b=sZzgir1k2blS1gvmMpZoG2nxdCiR1i94cu8kQdY6suxPFhci6AX0sP0ycvuO4j4/nW
         Snjim+VQmJQAQCjeOo7TrM5wE/bf8iptm6bvW3aZAWKQcL+aRKgo/2ByEayEY9i1ndMe
         1UBqGHzKqE3XpPhfVqiqkXoASheZU9Q33Pl04EahijSz0RwG3rluuDsBBqypyz/Afui/
         NIuqBFMWaUjLZZM5l4Vn73xr/5xDthPeQ1/LPPgGhhtdLfaLEPBwGmoV53ICFwz+qLry
         O7yxJHJHLRBQFU64en9hi11a6Iez+KeScQyDKiHE22IN8TwGrZs8YaEJCA5XdC3QZjqv
         Qyjg==
X-Gm-Message-State: AOJu0YzesIu/nQSpx/VXGvpJOkxe4/N1bjopGzNxo4kS4nDcbW3BGHFp
	8wieTdmpXzhEAEmuqRwOYGXxZoxFJXmVwZdTeMneMs++0t3cBTfCvUiVEdlx8iOXQ6ZrtlRSG8Y
	MXhsnDzS9pLRLoheXqDXnvakaMe1s5Y0Fy1YbHxjUXltWrc8xXLYJhaECOFq57KZ/SQ+8
X-Gm-Gg: Acq92OFzMKkjXp3vI2GWZWawn4XhFA0JCCUjksO2ox1IH7LOdZsz8OEVX7FRXHJ/YW2
	6EUV5vARLV/gXmI6mnmke0/r4UDu8EPvyruWDIC11DiajFBzKcQ2TVU9uX6HsjcuthSWTO35tT9
	Y6mRx82CMH1fmSnnNRrDpdef/84Up3sTLsKuIhbQo3ixAfA2SeAis6RvjfV9LYpH1khCi1X4omr
	PQO9QxmtDW3AuYSTUweqHxD18IEIeZKwyd1i7MYfUNHTHnKIA6t+NygpbW+cIk/FQjY4jszZkkT
	dp28oweC+SWkTXGCNDGuFpifTlr4SFCYYb506FCPujqJLMf1I1/RWQ5haKPOBtc8ZAHuH0TQfry
	kNS/HM2hc6mFxQpcAwAoXwPiMhbruFNZ3+r1KStwKs+1SQA==
X-Received: by 2002:a05:622a:4a07:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-516d43cfdbemr33250991cf.6.1779449709962;
        Fri, 22 May 2026 04:35:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4a07:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-516d43cfdbemr33250651cf.6.1779449709460;
        Fri, 22 May 2026 04:35:09 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm571364a12.0.2026.05.22.04.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:35:08 -0700 (PDT)
Message-ID: <0093e285-e38e-4586-8dde-1fbb1ecd8425@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:35:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-5-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-5-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a103f6e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ls25Rwon0kCaizU-UYAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: iP_EyZKbUcvYVQ5GT0un_u-qhux7oXWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNSBTYWx0ZWRfX2/a44AewJiLu
 DiAFW0zjbbTRtiYwTrW0LYqKVRDCGEbfnb7rU2K5G7dmCX1aPW6P1n73TEdmaU8ZvlMInAsuQeJ
 3GxghCuyku5BI8PQDoUKHBIXxpiltyBuZqPGM/fHDAXaVdaJ/WmThVrkhcXuX7aCbynVpEIEjvh
 srzjdpX1DvNUaQlk1NggA4RuSX7IMAk9vx87v/H/UVEYP0GB95g/8b+ecl0WEn//ydes3MV3SDd
 Aja7w0nJCg+O8cqTqrRq9hWhOtv2xjaPqv8w51JB2n7lHPYQI5cGFQPCXgVua+MZI0jg2D7aq59
 MAzQZ9kWrNkSk9O1ek5ahirx3adIxkLuM0bR9EY0wpdrBAE9n2I5JGPK4AzNFm1lxPoKI+gv6JX
 maYKzLim3c7Ma8ife6L/4823bLkFhb+UrhQyxfDGuwVEQt6EXXeOgNgCquzZnuuMGFrzx7YkmEJ
 +GAOMElJXWdTi8iPK+g==
X-Proofpoint-ORIG-GUID: iP_EyZKbUcvYVQ5GT0un_u-qhux7oXWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109279-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E61505B3295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This patch hasn't changed since v3, so you may want to carry Bjorn's
lost rb

https://lore.kernel.org/all/ztriduhwhimeztfdgijai2qeii2giaosb6qizhj4skxg6k5uq4@bi6vomgv3whj/

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

