Return-Path: <linux-arm-msm+bounces-106439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GbPCFqi/Gn2SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:31:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 709434EA3C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7F130A1BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8558D40627F;
	Thu,  7 May 2026 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adwB2c9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hawI4Ic3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E6C3A9615
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163964; cv=none; b=hbcvp0nZYHxN4UYkvfKSVRccqfKTC8bhxTT8pJfgG8IcihAcQouZczgGxLnIGaXiZlgRSMJdhrvCuuNNTgpubGDKvEuCjsvtbo2o9NjlBr/MEIr9aNnj3mMPBkEpzV0aJYeXzQ49QdTaUOMr+eyupQWRXqA/FmRMCBR0S27gTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163964; c=relaxed/simple;
	bh=yxxFW0lGHLlrJIKZ+qN8cjJC/Uz3gM3CTDcnUzHMmGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8yHPV5c0Z1y68FPQx0Zxt02ycRoOvcMyOsBv8uyCOfn1AYTv0Z/KzcTYu7ZkxI6Pd28slAZxW62l6LZ33qb45W6vKRbyeNmw+yIpbpjCZoNNNZ6aTHE0vZ+ZONpbdAfOY64PWkuw6myu/3wTZmc5xwz4SmuZjkjwy4NfMfK6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adwB2c9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hawI4Ic3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5W1q1971666
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZS4Z+n5yl3239JmhoNbCdzxJTz/lzr+NgykezCYlEg=; b=adwB2c9YM0FDWiD0
	cmohKfPby6lxzA0BsnDT284VXkXuOkgeUt5AL4J5FGwrvvEM6YasblgKxrPUt6fB
	wFIaK0JJyyuoqRO76/NMXdt1SExdMQkustWMCOkLNI4jUxE8kGTFkgsgFxqPwhu4
	Wm4og2BspTUhFWN93HSR7QYIG6USP0YGUNpCMqhVmJon7if0RT0DRZM49T9BJHPN
	F7vMDK/XkgFrS+oi/owf9+Q9zdE1cjlNkMLU27Mv+Ff+O7YsVeoRqoY/xc/2/VN2
	299HCLLyclAf2rrOmJZHBx9ji+oRbaxrHxvFEzCXwVcEtGEhsv/0bkXNkkz8ROPf
	+q/QIQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej8hbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:26:00 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65c21049da9so716621d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163960; x=1778768760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZS4Z+n5yl3239JmhoNbCdzxJTz/lzr+NgykezCYlEg=;
        b=hawI4Ic3F263ZK7hg9FQyVYFuUZJo0cpP3uRMXS8QnV9l+ci1GExatWWo3HvYUHCHv
         JHQGVszVsEDsJbjbL+bGPstUSsYAOV+9vl+/wj+s7+bwokMXMzLhKgwzamfF0lFf+C0D
         Ximqy6NzMef7fWhwcPiEIgEi3YDI2aCxy6tS5Bn0twDi84srxw32VpmYGbzKrsBJRA9D
         tSv8BXu1bN+SY4q043RtrVYxP73l/ZR7lui2ojw75AU3ppT1+T+QWfdZACYUEWTuROd5
         NSa8vy0e3xG6vt9dm8hdXKLyZTXMxN3SYqmdxdN8fccIh9cCHVZRBx/fKocNduejnrZa
         biBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163960; x=1778768760;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZS4Z+n5yl3239JmhoNbCdzxJTz/lzr+NgykezCYlEg=;
        b=DRDk7A2PwcflpeWJMfMIPFbe0u2LHHovfDpODzOPAaC6ZyPx+4+pw6bL5Wo6c+8P9A
         l46WlIJCkQWevdfGWSfwCR+q4W0/OiNiyLfqqqKCbSaWJQOh7ju/gioveYPPkQWNe7Fz
         arZyuHE0bWRNNat7FljrD69t8G2nHGIhfRUOJbSgzDZEacIaQqpy1+wxtTzF3TemGqnj
         53461efouIJek18pb8aFz9VvUxQ4+5Wi+kPur+1s4u2TBzD651vi+GfAsJ7BSc8HMm9h
         6i1TcVVUtaHozRI20hWxqNnbHAlcHzX7Hevv55iSfMh4JSLjdw4vdktR2kx5LIow4Lnm
         7MxQ==
X-Gm-Message-State: AOJu0YwOrhMZ+wrdPW/pnXiK2yPnr33zrLRjZg6F4wZmX9gZ/hWzC/cc
	VbBqo2Bqiejc70z+g5gwEEY63a9AiDVRpNyl0dU9HKTtncygX9ZuZhwXQEx3DqHSx4DQQSajrMq
	WBjfZc7iqxCwuw/AjbCU/4BzsARoSNGFALazzDL8/rZhhXFI162H+4lVlSy1f1pKvoheW
X-Gm-Gg: Acq92OHL7peHA+W5BaNt9xJ9XGbDa+8QhcJtzByJMIM+Yzdx7W+pVvelT2U8btWUg4T
	cRgVGx1Y1QFov625CtEwihglynZ9igrRPkc7L/OTBf/ebX9qyWP3tx9ZPzmyVToYf05M+W6xo2R
	/fOGV+UjCdFN+QlEfh4dk/Bdcb+xxIe2+ktLrll8TldqZ+y+0zbWgiurEpJi4pmO/TJcfdcshdg
	KPLiJDg0K7/gFwJJCCG1CSnVee6EgrXgZSC///SdTGc4naYD3zZ9bCpC+Dd9DbU37flwcOHiFmI
	tLmk/pq0CXvi4W7TQ3cCgyPJ3s/sCOhjlof+D7P6U7mPlflZv2x7axWGUfH70sB8Hg610T7NDOx
	3AyMZn67L4WZnSeveCohmnKO5vi1v4k8W8DlD/5N2VVhzb7dyW5pMqeU=
X-Received: by 2002:a05:690e:4846:b0:655:5ec1:59ba with SMTP id 956f58d0204a3-65c79e60c5bmr5123323d50.32.1778163959707;
        Thu, 07 May 2026 07:25:59 -0700 (PDT)
X-Received: by 2002:a05:690e:4846:b0:655:5ec1:59ba with SMTP id 956f58d0204a3-65c79e60c5bmr5123287d50.32.1778163959303;
        Thu, 07 May 2026 07:25:59 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c7adeb830sm2719495d50.5.2026.05.07.07.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:25:59 -0700 (PDT)
Message-ID: <8fd04ec6-1337-4d26-b20e-02d3429d7196@oss.qualcomm.com>
Date: Thu, 7 May 2026 19:55:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/29] drm/msm/adreno: write reserved UBWC-related bits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-16-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-16-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0NSBTYWx0ZWRfXyCfJIrZVzh0x
 YWeKWL2LgM4kKFG80FLsGVcznBjpl+qk8SbihCWQWpuryfCOb9h3y1IA0rYM04b/O5dbRu2aNCH
 zue8YfNffmOI81G6+NfDhFns3B+WWUu9svTFagrgB6vQNekiA62oE9CkYNw2VBO2LoNzlMItF//
 VnDHevGUdHXTjHpsAQa+cdKCfnitnEp2y23dNYeWYucP71tWatRVlrsYj0K10AO87iL0zDPyWQA
 jEQwNRyFOFYUIbhfksjMlXBb3Z2hNtgKCMqQGA1p13lApETMzkOWu9TrG9TTChJOlsE8IOz7hmM
 /tePj62j9ki2KhO9WnQrFnuzCIsAAvSl/POKxTejpg4ziYNGv1jkuTzh0SVD7nekjV3Z4G2+Tvo
 3UNyo+KCGxZlcdir0pAZYFz5J4gFmLSWObIxAnz9VvMYI+bWwFTYK8SJBqUh1f6YSJisVzvP6ze
 EbZuWjWX1Y5wu/qa+nw==
X-Proofpoint-GUID: E-Hfn3tTbF81Dm-FarnT3XvL7AstN0rV
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fca0f8 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZswEv4b9r44Tze3PQiwA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: E-Hfn3tTbF81Dm-FarnT3XvL7AstN0rV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070145
X-Rspamd-Queue-Id: 709434EA3C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106439-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> On the latest A8xx Adreno chips several of the bits in the UBWC-related
> registers are now hardwired to 1. Currently the driver doesn't write
> them because there is no side-effect. In the preparation for the
> refactoring in the next patch, write '1' to those bits anyway.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 53def136e0fc..7a6223ddd8cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -288,6 +288,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	switch (ubwc_version) {
>  	case UBWC_6_0:
>  		yuvnotcomptofc = true;
> +		amsbc = true;
> +		rgb565_predicator = true;
>  		break;
>  	case UBWC_5_0:
>  		amsbc = true;
> 


