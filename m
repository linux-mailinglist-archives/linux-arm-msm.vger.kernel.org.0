Return-Path: <linux-arm-msm+bounces-99819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h3nvOGKyw2litgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:01:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2432292D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E87C330E1D16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85C938D00F;
	Wed, 25 Mar 2026 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEHSLyaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqaIil+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466B3A3830
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432642; cv=none; b=Rpto7moJOsPxyaTFs253ZOWZcoVN/i87KFIdCxloE++4TDp5Gbrw23tf+eRT7gq0bRvtCF6OvbP6ZwI+j7XxLuqifwGMrW3lsaiFZop0c/KUa0dvICZzHsSFSeUUDISJQifP3F1nJGcdYD0cGBmA6d88Ddg0kZLmZwUfzBNhy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432642; c=relaxed/simple;
	bh=ldb2A01X/4SBKAn9Yb9xhnEIWPqbN3p+7aLQ9d3QUfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYZ5lZMCWBxIUelqzOe1nWW9dvjBWdjr/pUT2NE5kN+895/zVQxI8TC8/5ZrbyFtepd8zNduSyq3076fmVqrJLMkzR1Xj7brWLt86LP6eOLL/8eJflbwcMkDUdCZSn967KXVmGhJ5AjM7v6AkNF2LoPoE6RFGq+YLHxN9YCjlqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEHSLyaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqaIil+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4a0ER989047
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOwgkkoANNmdVUSLIh1kRTsKKbKDjbh2qaVhE/kgSwg=; b=eEHSLyaQYExMTVTC
	VpdpWhN+6wr/5VBFPNc7tK2uBuRsGU0Xw5KHaLVj7D7KSIIknqtPjLjJm+NMLXKh
	dMNogGNxd+DrjRbVNSACJUSXSeYoPCQtmP3p7rgssBHeucTHg9URswkYoy3Dhvma
	1rhEXSaueUwMpRcuiUh32rJqEHb06DwHBkNsSfnKFYOPMqJb2vfMJBWX79skttQr
	2GlTxbBKbEzZmG5bYbQWjQw6PQaWwNZKf4vGJqdgA4GhbxNFA5vTeHt8ZUnFUd50
	oSXaRwlO5oaH77795INh39tynZTrCuCngxNswFElU6RHV53WQr145TBcDwKPqKM+
	6VeK6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m463v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:57:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccbfe176eso1028696d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774432640; x=1775037440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XOwgkkoANNmdVUSLIh1kRTsKKbKDjbh2qaVhE/kgSwg=;
        b=bqaIil+dgExXTE7oVjPYnN0ageBSNQglRwkmgMWu5T5Dr93hk69O6Z7TpLTZsPDCbm
         Ii7pZAX/QFyg6wYTvpGWrqtsjEfyg03GDPRqqS0ZRP9hsGmIcHaXjifDqza8NCuO4oNQ
         ah6JL57AI0ly1N56gEs08LALBzS56jxJDUj7kA6qMEU9ImN4Fi+PqOJgXbZVW9RXrjIl
         Q5WMZxiNVJWAhHtSKxB8XxCXs8bnmP5+BVB0UM/uhfMjps1jYtx2pWxyQoGyIC0KWOTC
         pEEyRgCs/0eaNOR5YnJG6xAEBztNy1liI2LuS9XdjTWYOgA/H1MMrxtFWgHeOUhAnza9
         rrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432640; x=1775037440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOwgkkoANNmdVUSLIh1kRTsKKbKDjbh2qaVhE/kgSwg=;
        b=WTwuro6aq4DEQJI6QXU34UNeiDy0Vs4OHSJnuPJuyGM8OqcbITmMuKXuqJJNsCb1IO
         mZ9c9I/pcDlguV06pquyx2m1H7MPVymodMwZwhbRMvWstAWANzrWmbPEB4D8JN3JmWt0
         HXdzqrZS5e6zVLA1CZvVYR4J79iz4n2Hd4x+WRn2Ti8/NeRSuKLiTA2iD8PnECGcQom/
         GABjSxeXGXqKQ7vZecQgQykMeLwT32rbyqBjBTDRbSWtCpau00O2z7Cnz8GIQ2ZMe5Lo
         bflc4/WiPritocq6RwbxRZpXDLU8EHA34OwWyiby9U4DA2PpKf46WG0qzyvdwZZJTZ4b
         uV2A==
X-Gm-Message-State: AOJu0Yyl1IbC7ZYA4eaB+DnaiYsaa5ybGCulfPdIWjI/rYIrmMK94TJW
	2p/K/0zhVWVUmyUPLghysBMewbJG4j8hOJQn7IX13Tz5SE54pHDk9e2Yq67xaNzNrI41QPwhmMr
	+wXsvIrDi3HgkHxPb81B96OZX8dsjgXhAZ4jCj6LUCIveCAEVvCZc+Q8rJYSWcThPbmFA
X-Gm-Gg: ATEYQzwJb1+JxGzc2s2KAT8KiTKz5qqDaxsXe95uqCIzq/Sl3TXrO8sxEZQJGkgOOxg
	r9btoC5FmJVdr1+x0sgpfDzlInphJEqDhhOGx+EokbzmNkZ/X82JgnnKCARDjZcNbGFKi992goe
	FSJ7+AyJ5nlhB21COIB/Ds6fW79S1ji17ysjpiwVgYoQtsawxIl1wNL3POFY3BGE0dJrFeaKjlp
	NS24G5czaLqirP1+yaRFr9OOTr61NVV50CLoMCZ3zoAiHyVPz3zowXzckg/AoRnDEgfgc4adacp
	xw/UdgFP5lgcwwzD9FSDJzRcWGgZscUAffUh8v+Km6H86oNu71z/m7s05oPaWQ9cZpD0k11Zze3
	DPQRdV9QDiiEOb3D1EgZu56X4Tmfl67WcQ0gASYlyaNqBX8wjYLLdyn+0ZUkYAmF6mwXxPSwsWV
	MFnio=
X-Received: by 2002:a05:6214:2385:b0:89c:64b0:f91b with SMTP id 6a1803df08f44-89cc4ba1c77mr33529626d6.6.1774432639796;
        Wed, 25 Mar 2026 02:57:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2385:b0:89c:64b0:f91b with SMTP id 6a1803df08f44-89cc4ba1c77mr33529316d6.6.1774432639385;
        Wed, 25 Mar 2026 02:57:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm669017566b.31.2026.03.25.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:57:18 -0700 (PDT)
Message-ID: <3f33e61e-d244-4600-9ffe-218371c04541@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 10:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct DP MST interface configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
References: <20260325-fix-dp-mst-interfaces-v1-1-186d1de3fa1b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-fix-dp-mst-interfaces-v1-1-186d1de3fa1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c3b180 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=V25-4Ovv3ou56tOLyxUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: X6V9eeyKMC2HDwUKuJskSiC2nJ51ytUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MCBTYWx0ZWRfX6XNeFM3ySztj
 AZqkRW8iG0cyg5fXlJ7TaF35RGMFticuVlc1X+rhktMVh5enhrwffGAdBJmGRrG4UZw5CFu4cSa
 68ChU4mlSu/Haud4Co+WZLMMAobmAWJ9mTMZm7Y4iSh+0vSjAvWWdgw+IuTOV3elUhXnSR3DsW9
 dBuywBvKGf4/zjZkAIUEu6rgJ0eBQMW0+SFrzxX3/RZ6CF/VsKQjgjrMaTT1TyUoYBm+kDJT7MH
 FGQIrjWOTguEHyLITc1DzbH6w8fif5Znj5/hYHb8I9QN00nqG1k5I9JJUiqOJkKxJ3Or+bic6rp
 YfX9n9E/XQOtjlSRt/iWIjntbHPtfLGX2TFViUULh6nHVqm4SrKNA6Tva/Unaqyt/2K6h+PAVNH
 Xj+G5DD9g3ME3oLZ97+3HiHir1z1/MgB7pjvWIGg7MNO4zaEA5tu4wpC7tVsfZZWpL8ZC6S9voG
 27fT8ACgNPUraT26fqg==
X-Proofpoint-GUID: X6V9eeyKMC2HDwUKuJskSiC2nJ51ytUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99819-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 48A2432292D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 6:32 AM, Dmitry Baryshkov wrote:
> Due to historical reasons we ended up with dummy values being specified
> for MST-related interfaces some of them had INTF_NONE, others had
> non-existing DP controller indices. Those workarounds are no longer
> necessary. Fix types and indices for all DP-MST related INTF instances.
> 
> The only exception is INTF_3 on SC8180X, which has unique design. It can
> be used either with INTF_0 / DP0 or with INTF_4 / DP1. This interface is
> left with the dummy value until somebody implements necessary bits for
> that platform.
> 
> Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

>  		.name = "intf_8", .id = INTF_8,
>  		.base = 0x3c000, .len = 0x280,
> -		.type = INTF_NONE,
> -		.controller_id = MSM_DP_CONTROLLER_1,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_8 for DP MST */

with intf_4

Konrad

