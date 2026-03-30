Return-Path: <linux-arm-msm+bounces-100737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJk3Ii1KymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:02:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B688358C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E44093013716
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2933B7741;
	Mon, 30 Mar 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm/8akS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IK5cZUt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D33750A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864836; cv=none; b=S1vqj8q9s9toeGUVqKpBkKVza3zpzjusGTBgL1DUULKZZga5WfDd2ufb/2T9OE/OvqX5TSl0UQwiLQG/yD/u2z75KJ64g8+M28Ge0bh0l7lsDeyhHrDrKFKOPcJqAwkuS3V8yr6j+Ml/6xb1lWpgzoEjY/Sx1w3lPLjl9BKoDF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864836; c=relaxed/simple;
	bh=PLmEpJqP7s1KUMkKzqcQ6tDKvPVq7wNz9tz2kuo6qfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tz2ARRSQqP/ukvkGKsbPTMfPVDMq9s4lsRoVcqmmF4lww8mtVQzb4q2eqpEzK/b047BwNEDziWwIu3Z5jrUsUu8yOuzItPdAUZ0mKpNrxbR/EoXE+6v5hNl04tglBuCiccOV/KSdXcVcrSc6kN+cu4ogh7R4sh9ToIjbrsa7+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm/8akS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IK5cZUt5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7d60P3250323
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JR6tXdbAULbez3ydP74JlxQJzcCNgilbHvA1DDCMvzE=; b=Zm/8akS+/M7jn33Y
	2B7vnKrJ09R8Lri90TLdTg8P/XkYMeNufulpr2RkYP3VG7xhYkCDH/TPLplf0+9i
	PK7BdK03ufSOl/cnlCd9KXsyg9nHSY7KKh9WUEhqlCJY12P53RBP6tbbdB8DhecS
	wjrFaxhThDDD1FayNcXqGPL8j509z+wqsmegqGj4mMRzCh40QwNRkvzOgHpDQj0K
	jBZR/5SvH4f+ElA9Bl8sNA3TvjCVb+gjvaFDSF1+cD90goneeD8GOAhjZjhqb5yF
	3kM+HUSOsxYUiJAm4UnuF7CXAaXneTWAt/sLHiRqCF2uVu69jgHxJd1Qxx9MvxsI
	T8gvdw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkpe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:00:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so2622866a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864833; x=1775469633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JR6tXdbAULbez3ydP74JlxQJzcCNgilbHvA1DDCMvzE=;
        b=IK5cZUt5+0vsUyxyPdkAYTd4FlSTQtXabr1o7tmjxQlbvDyPbatfE6PdvdbNha08xv
         /3sCu06xbyjIlAL1PZ7AzNL/525oj8i8L5zE2wEOoERtFLCwWpH3gSGaBSPtLv3FaQBx
         /QdlclncmAnZx8rLOAAPMnbLToJM4ks6pFmzpCFnstKarkz5N0DU+afArOmCuOddIK1t
         o+Y99FZaij2NVj5i/oKD1qv+51ALQUQlPmLn9jkF824UpBQHXRd03ZYh7rlPibleik0o
         n1enT+0N4SsJw9q3jkArWfxjD9sosdk88m0RbGe4dhBlAFEsjQg9w6ySQKeE3UxoR0w1
         oqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864833; x=1775469633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JR6tXdbAULbez3ydP74JlxQJzcCNgilbHvA1DDCMvzE=;
        b=MX5qXvAPxmoBn+quPd0xMpxshlwlcjclbt0o5VFpzuQ1891+WvWO2HBOei2ix9ooXV
         p3QzxxK+foYQrlpZecGJZeskil+bqubnJ3KdE0TU/tzR29zcELIASGXYRqvV6PbChcFZ
         lEaibwKQEsFzJ7nR21RaUIPzTJYa22eXQJY6TNjzmkkRscc6RglhuBW6XvmxeIO0ZB+D
         N692tx+nrCYWTRnaypohXXR+/YFtLSdE2z67l9slZcw4ofhV9UEikqVGVlL3sfuYRf1W
         GrKlNRw6p5z5qI97D4k+ES8jRw5tQ6wXHuanLOOcTaH99GcQ0NDeZCPTqcgj1KLTyjOL
         bq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFtjJkI41iysowpD/heIB6de5PUmccLDFn7nZ20YUZTh6RRylCOEaDXH4stHwuQCL4maN/YhGJm4NpQkKZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7MIBKEiCVDtNpW0D6RtQ4k5dwLU/m2Beao6DmbJd0McqpkNN8
	RuTb+6pMn3tSzkMzTKnRuEk6XuDkXEsQ+hi5T2M1ZbOOrvgVFvFfFNogRfEzNXdjFcCZEnapzIF
	zemk9pGv2wzsTs9yntz6iRvNXJq82JdeoXjtUk3q+94+Ix9xxQZGw2qHvx79DBvMacyib
X-Gm-Gg: ATEYQzxidyZi9iSNf05S/YTX6ZkuNZWsWzBOiDaO7RMRYznlZwgJKyK7Y08ULRn6LQO
	3JMnQO5Red+W3hWuqrT7g9QnC3MpXJm+N46PhsD7LTiWjJJ+KfapGvQHW30rAgqI/sSuSjxAOAq
	DNzU4aCyXQcLa5skSR70NglJPJDzDoO8uGOjCGxK/ucLr1BJ4jymZImJiAcdJcEpXr1+diSp6iD
	FhGjM53Ziw7AMucGQbvHXUnAEyM8rk/EidAWuANZRWnH7Tr8w/MTPGNZNdttZuVkV7JYpFuAat4
	rEExETWoss/kKMN4uVZlConkTB9n85j4n5hh6bvNdDJoVFKp/FlT/Ph0zq13DA3Pxy12FCAoUbp
	Lw3Ksi/bWX5q4POMBijBPARSQvB6Zdy97znu1v4TnqtrNcGDL
X-Received: by 2002:a05:6a00:2884:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82c95691acfmr10648703b3a.0.1774864832883;
        Mon, 30 Mar 2026 03:00:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2884:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82c95691acfmr10648319b3a.0.1774864827387;
        Mon, 30 Mar 2026 03:00:27 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8466e01sm6900120b3a.20.2026.03.30.03.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:00:26 -0700 (PDT)
Message-ID: <b50e9474-4d80-437a-bc0c-0b37c2a04aa1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 18:00:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/38] drm/msm/dp: introduce stream_id for each DP
 panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
 <wvctskhoyphicaymbm5b6kermvubhrn5u6uzui3pqf7p3a7ia2@zirqohupflvp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <wvctskhoyphicaymbm5b6kermvubhrn5u6uzui3pqf7p3a7ia2@zirqohupflvp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfXxgtg2W0gIqsA
 ZAsMXUxp2xps9JMgerYu1F1yn3e/eCLlow9uCJ6gjhlb14mEGxkQ1zjeBLSqtKs+ecqRrO+B5oF
 3TZWz9mh3npopYThh54RGGVy/gg7w4TmF16SEC/8tsvBHE3IoYyOCs9FDwUByuB7mGOKuJuLobX
 MMsnxiR9DOzX2cD+0Zy79zrGPg/gqR7e3MgHwKyvNskum8pwbhXTQfTya3013MzzPpOUFuossTS
 l1TkzQME+7jjRaaYYhnyGTmcLGWbFTnU+AVn94GM8GqjxH12ePAbyATdEIFSyRO3S79G3m+1jfA
 56RIAjeupPcv10T+CQy2UuutQg6e7xr3rNHGv5Ov6yYs/5MYEXu1pzTPBQkftrZ3kXvclna3tMF
 mMujtB7Hz9L9T3nu/jz9HhIePHJ9kf0NCIWtePAUiFFDZOrv6ceQ8DYSLBKLgdAehmP074bJuSb
 HyJ06522B7/9ooLcS5w==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca49c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=l0Ss5M_0uoGcHLo4SdsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zLMKzr3XCYKpgX5OfYnuFH5rcrjobsef
X-Proofpoint-GUID: zLMKzr3XCYKpgX5OfYnuFH5rcrjobsef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100737-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B688358C7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 1:56 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:59PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> With MST, each DP controller can handle multiple streams.
>> There shall be one dp_panel for each stream but the dp_display
>> object shall be shared among them. To represent this abstraction,
>> create a stream_id for each DP panel which shall be set by the
>> MST stream. For SST, default this to stream 0.
>>
>> Use the stream ID to control the pixel clock of that respective
>> stream by extending the clock handles and state tracking of the
>> DP pixel clock to an array of max supported streams. The maximum
>> streams currently is 4.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 58 ++++++++++++++++++++++---------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>>   drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>>   5 files changed, 73 insertions(+), 28 deletions(-)
> 
>> @@ -2677,10 +2675,11 @@ static const char *ctrl_clks[] = {
>>   	"ctrl_link_iface",
>>   };
>>   
>> -static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>> +static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl, int max_stream)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>>   	struct device *dev;
>> +	char stream_id_str[15];
> 
> A comment would be nice. Or better replace this with the array lookup,
> it's much easier than snprintf.
> 
Thanks, will replace this with the array lookup.
>>   	int i, rc;
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> @@ -2710,9 +2709,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	if (rc)
>>   		return rc;
>>   
>> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
>> -	if (IS_ERR(ctrl->pixel_clk))
>> -		return PTR_ERR(ctrl->pixel_clk);
>> +	ctrl->pixel_clk[DP_STREAM_0] = devm_clk_get(dev, "stream_pixel");
>> +	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_0]))
>> +		return PTR_ERR(ctrl->pixel_clk[DP_STREAM_0]);
>> +
>> +	for (i = DP_STREAM_1; i < max_stream; i++) {
>> +		sprintf(stream_id_str, "stream_%d_pixel", i);
>> +		ctrl->pixel_clk[i] = devm_clk_get(dev, stream_id_str);
>> +
>> +		if (IS_ERR(ctrl->pixel_clk[i])) {
>> +			DRM_DEBUG_DP("failed to get stream %d pixel clock", i);
>> +			break;
>> +		}
>> +	}
>>   
>>   	return 0;
>>   }
> 


