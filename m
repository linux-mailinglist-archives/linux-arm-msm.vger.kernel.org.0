Return-Path: <linux-arm-msm+bounces-108652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EkJDwF3DWpAxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:55:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5858A3A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C58B23035C70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540503AFCF8;
	Wed, 20 May 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFzYwxZl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6zvw6tK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E456F39C657
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267288; cv=none; b=AaipoNTApc7pknDa7VTsPeYlyGXDU1A6U1b0x48Lv6SGvxnyBNLawC+CYQ14qeymxs+uhNAYbvOpbfdH5iWoYE1/8OszBhEG9VQZbTUcW9xz2sTVG+t+gc1OdHSqmSOAxlECLeTjdLo6gcTpcTOUQfLYG7qr3+B9o8auHA5L7bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267288; c=relaxed/simple;
	bh=CjTV8QBGlydhsyVQTzRqgueRHR67e1eAIahXmknwPMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nztQdL08z2J8uref2pboGLBmsVl4kyMbJYF4rNpWjAOS4hWlomlx4KOTS0DjHjiyHxGHNBWGSNALv7jHiqjqq+H2PurY+4rfPE5uVRPjCfsIlYIT4cM0n76M9kWFQggWm3hQFyjpTzZO/rYmR7fhnNyFSAYaJTvWWGpoDvTe9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFzYwxZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6zvw6tK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kRuj2984427
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JjcwkslOcMmSQKpp5qTUuofPFeLxCYtN8XgHirflsY=; b=dFzYwxZlmhYIfXwW
	hJ31t9G40Xdhl+Z8NorAhDxeAA6qXhJQarZtIHQyUKxtV6oYtEf1MQ0ymTMKGdLP
	BLX+e//cECCHLFjNN82L7Xugcn7RKH7xtrWgjvWdBKm+PTbDAAk1/0+T9CAh6FB/
	/82TqvkudSjE+37Q4Pdhlb/rXusviqRkpaUTjXw9zWl4ZJXcbhaxf3cLEUbfN5vq
	listlmPxfKfQayqb+1A2uBI3ZykT69b0aX2HYseMxfg4vj4J+gKIGvF4lmVrSrye
	hp0ExjDneVLQvd/3QTPUEyGndDynErfjXqnkTRadLpxO/A9VphjGk0O9tjNqVnE1
	wV4fVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3yqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:54:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso52080425ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779267284; x=1779872084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JjcwkslOcMmSQKpp5qTUuofPFeLxCYtN8XgHirflsY=;
        b=I6zvw6tKSxNk30/5rU25fhEhf8csxx9C20bBsQp+hovEGu8Dvmn1JLSSSPwzsfqt+G
         L/YzBAehuTbUrwy07gZw7/7D36ME/b5oOIGPhIvUaGVndxNAT5yCyfCnDr7kFrY3cM/P
         eBewqnQ4GTGYiEc/9wZhTEBvLd6XDXi76bzHxjBIwgQ6SMxV25wIncbAMHNx/dY0C4vA
         BnIYSC2ilwncLjCIAN4xBgqULNcnFRU+8T0E3qQ4aCaVqkW1fcloixetfb1cb9YmpYPZ
         5Rqi/kgREEOYK/s8Ht4fQavcLLncHQfWsziF8X8o+Piu+lNOCU6+X7YS0+Ij6CyykY+m
         P9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779267284; x=1779872084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JjcwkslOcMmSQKpp5qTUuofPFeLxCYtN8XgHirflsY=;
        b=a3LIbefjo558x497ltC865cZ4lGroYWBnRIHJWTjUtyU4udqY/v7LeX3qhRmbAaCUw
         v9Pq/1KU3sv0bnHDGch/PEY4CKCxmwRO0I971DiePE3GQxPZiv7SBBNvVCaDJoopnyXm
         c13ZGpDkeoYOu3s3+dyVEXYooC9Qc8aV96yvheuHT44zmpj7r1Pn6vlGB3tar/YDvnQ3
         4ZvheXXd1BiX0El0Id/v+Pc8DO4vPBw8w8wHnIxycPSB+U3mGLkQ0wAHPRN4J9oSHuhg
         zjWdg8HOKU502KJ4Ysw+BEJTFOFocUcqT9C3Dr+WwybZvl9AY4dRxAZ1yUZonNY8xfBD
         /T2w==
X-Forwarded-Encrypted: i=1; AFNElJ+JPzkh6Dxhh3AlV5Ze0BleiGrKfDShpoNHccVHnCk9E2RHbDm96vqGjItEiMF1G5IjhRldBueJCwiBtRrS@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlhQ7ci3VrXwST9eLd+H7oqy5ULXaB/6wjFudnxZoYyQzy+jN
	N3yfrcmc/FPSWB3ksn0Hf9SW5h73lLyT369IEsTww+vCWtMB3XDQ6xqhF4i6u+n97ADTWQGxMei
	gDtt3oomPWiZ2+9sxOR20KF3w4ED6d14/RY927W2V763q3YAQ0rPA37ohVMPHm8x8IAOD
X-Gm-Gg: Acq92OFKXGEZEH5R/b2Fgtcw6fs/ianx7fWRrowePCO1xaNo+nscSBTV7SkTngkCHCE
	pkrroiZhxp3paG3oP/Q9ilEdLaUeX1gIGnGlQnOnHIZNrZdYSSbF6Ajpy9jJgd8cwlJknyn/5Ya
	Rwhs8v7J6vT3nLCzYvU1CBjXsMkxsWRcjkWaM/na9+r0OPKTO3We+B5Qs9DMpvLPJD4wn52ZK+W
	b4daJPpYJlviM7QgwEgRcg6yMXItj1aag+pMz0p9YbBE3Z4hhX2GnHjjbgSf+khs2sVjOcs104i
	QPe6qrgjyfxBC1ZhBUS3grU3XI6vOJgP29hsNFYV/jkhvjvW/Ow69c5lVTa+rgcIPJnKnuCwKgV
	ZnK5InMJwHNx9rZMAII/IGSxiSkUsYTdsDqjISAuy5kOXvv3yFB3fIzKBMYtYh/s0YFhP9bbVjj
	HzqFSs3G14fQkJxPVbwA==
X-Received: by 2002:a17:903:1b6e:b0:2ae:803e:6c12 with SMTP id d9443c01a7336-2bd7e8ae6f6mr267807535ad.6.1779267283902;
        Wed, 20 May 2026 01:54:43 -0700 (PDT)
X-Received: by 2002:a17:903:1b6e:b0:2ae:803e:6c12 with SMTP id d9443c01a7336-2bd7e8ae6f6mr267807325ad.6.1779267283412;
        Wed, 20 May 2026 01:54:43 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d1062e9sm214505145ad.67.2026.05.20.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:54:43 -0700 (PDT)
Message-ID: <e85a29ef-34b8-41e3-8417-d73a8079a980@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:54:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/39] drm/msm/dp: introduce stream_id for each DP
 panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
 <mswfgwuu3x42s7edcyk2vunc2bsmqciam47nunwv3r4uylx57y@wwufxwng3v5d>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <mswfgwuu3x42s7edcyk2vunc2bsmqciam47nunwv3r4uylx57y@wwufxwng3v5d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d76d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8Wk7F6lNGgSB0avDr_YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dptogECIA88EfXJ3sL3bSXkEoB6Xzq4Z
X-Proofpoint-GUID: dptogECIA88EfXJ3sL3bSXkEoB6Xzq4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NCBTYWx0ZWRfXxFb9R7F2ETTk
 6k9/0uLA3RRaBDA48m9RyAukaD6oplquA5SdJ9FMh8aZ6VhG5OKELXOkpEpkJV8pH8UJbInax1J
 JEfqH/OSVFaOKQK1reKGAKyKNG+WYCQ6I2fME4RqrdRty+04Mw9daIcF2pm4veq393Qs0AmSjwT
 oHlGHiH9yk1JX0LwJuqoC62f2amZakV49M/6szL0Q+1JE5xPFUf9wGaf+Ize3pbwEftg7YmSBP6
 HOA5vctbX9ZgZ8kSM1dJWETOZVHZJVuQMeKmd5V101OJKc7/UkdycHMLYI6p1sv5RkCK705Rcu0
 104leDa1TNDUsW/kI1PoCsv3m1vxwFWOYylHOj+7zGueE2Ooa0LHJtvB3Rx257cQuLHGq9jYDBx
 3JFMGZ1giEBAVNuehYDSEXE5bShejmQUVypetfrq18JSN8Mj0BedzDNF/z4DQhoBFIurQ1rVE2n
 Bs5zxytBH+dC5dZRFGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200084
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
	TAGGED_FROM(0.00)[bounces-108652-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 62F5858A3A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 8:04 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:48PM +0800, Yongxing Mou wrote:
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
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>>   drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>>   5 files changed, 71 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 120ec00884e5..fb6396727628 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -127,7 +127,7 @@ struct msm_dp_ctrl_private {
>>   	unsigned int num_link_clks;
>>   	struct clk_bulk_data *link_clks;
>>   
>> -	struct clk *pixel_clk;
>> +	struct clk *pixel_clk[DP_STREAM_MAX];
>>   
>>   	union phy_configure_opts phy_opts;
>>   
>> @@ -139,7 +139,7 @@ struct msm_dp_ctrl_private {
>>   
>>   	bool core_clks_on;
>>   	bool link_clks_on;
>> -	bool stream_clks_on;
>> +	bool stream_clks_on[DP_STREAM_MAX];
> 
> drivers/gpu/drm/msm/dp/dp_ctrl.c: In function ‘msm_dp_ctrl_core_clk_enable’:
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1937:9: warning: the comparison will always evaluate as ‘true’ for the address of ‘stream_clks_on’ will never be NULL [-Waddress]
>   1937 |         drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>        |         ^~~~~~~~~~
> 
> 
Emm. thanks will fix this next vesion.


