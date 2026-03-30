Return-Path: <linux-arm-msm+bounces-100708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDqENHM8ymnD6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:03:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E850357B7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14ECC300B5AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BDD399011;
	Mon, 30 Mar 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAUMXid8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zh9J0l3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B604396B8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861267; cv=none; b=VygK8+LbjUbd5EoN1wQgCWhxs5INh3e8e6D3UH/1ACtCc258Vkm+9h0EoZF/p0h21kl9fyAQ+ZGx5/3E86ADG3YV9UV4FdRhA6s8Nt8OXJ1jEW0av3Ih1+zJCURnTz29XNCI9Q/pt66Ks74XKMKiAx5R6ICc1/2UASg6Npe94VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861267; c=relaxed/simple;
	bh=S585uwDl0z+6pBN0418ZzYR5yn684k+sDm4V+j1RrDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0nT+mw1Nx+D9KRMh8ex5W8mHURcr6TnylC410fx5vQQKy6aX8tzzv8LKktnwOkdPmY18qyQbF3z09nKdLPoVa2dxPotkrZSme1doCeJI4mO7j/xsOH9U9dohRH3N1YBTWj5wwnIPcGc881VNtndE+b1hNRMkO/YYpIJqRFPYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAUMXid8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zh9J0l3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6Dw911747967
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQXmel9kln/Jv9GA25WCyxahtbgW6KGTrH3uVBAsT2E=; b=gAUMXid8EA6mb1bW
	mC1EEgLZz6Kt7mZbkj9HDORTTKZuE+ykIqxS4JZL+Rb7DOwfGZlyqfbm2Ni6P/7H
	m/9pFuskeu3mEW+vbBKJNRxLcgoCswEvrp9nMdVyPv8XmiFONhmBU9YVcZ7f2d+P
	b5mg5Iqpt9TWNy+2mjDLIaNmzxNyjr6+PJUoHe+3mh2yEIcRL30yeWE/FNG8Eaok
	FjPkkIhR5ee33kwEP2Y9hWAjTm5urGU8IXWVCzViWHg46/9TAx4OEeWOb7qsJ4ve
	YgiWBaoohPX8UX/me4wBE88xJk9ITHSolJaIr/LyJkShStoz1ntu9CyIIDB0xxEo
	EWTIZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7dbde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:01:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso29904065ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861264; x=1775466064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQXmel9kln/Jv9GA25WCyxahtbgW6KGTrH3uVBAsT2E=;
        b=Zh9J0l3Ar3riwigtyVQKQIqerFlhpY6MLMZqGkKIY86i2s4JVRV4TeGrlLQglIWsrS
         OMkTDIGl1VDdeNkJMu4h4uNzOLa+n2IGYzZ66hzBvQLjnnER4ZSElEN3VmjkOnGZnBnj
         okhrMwUusa1mRBAvRED3Bk6roT5doS/2SMYJuLOR6LI9nN1f72DfH/JlKTCN567B1zEe
         bTyOeuq5jEhfYkoQU/bLmvCvQYmGN6xP9mEZ7ASBcXYojIbpI4EAS4yU56jsgQ1QJFEI
         klLnpTKaxfjTFbiikaSH01z19mKL1oFKzhNKOY9zG0I5MCj5QXrA6BMiGPi9oVyxR8RC
         vc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861264; x=1775466064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQXmel9kln/Jv9GA25WCyxahtbgW6KGTrH3uVBAsT2E=;
        b=I6C8T6qFFZv7cIFLJvEuzTOI0ScMdyFSQnK+kI196taH+XiNEHPFqUK1znD/v37vV0
         EWwEJOnrQr5jmFd+4OqncFGZ1NvDarzx2o/rePrUmVBU/zAZvL4DV/HbW2LWY9PuUZWf
         KRt+cN3gCJrWgzhGpZvCgaY87e4afMk+2fgNslMgGb/72IbuEoF44eWmYF4T0nqK9r3e
         NHAhEjWP1vLO9d/N0DXCBdQKxcDSbrDmN4TcpXEQGsY+mKyzQcU1VRPtJSpmu9mB/asY
         Chij3eGJEAEuGD8ImqH9TrsnqsSKtAS04xgCr+FM+ZMiSr8350fo40CvFJA0z+ygOvUH
         Wy6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoelh1q+RToRHjbCUmk1xBxh3bm6ns5t16YccOcU9A+30FC1R7ugUi2q6wY3f3QBkQwzS+2g/n9lpnexWh@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0TzQKl2x+QiZG1vwWXVDeJzDrKz9jfndhz6bM+TUaP9I9bd0
	KeK3hHC8LSN2JTrUPnRZl0GpimzjT/BP6tww+QghVUDXqcaDZ8OqiJTtWCAbYFEluah8CMq47vQ
	OKbER6WlirxgDL3INKNEutV0Yx2MCfQskA96YM/iYPXeFqx0YVl191YnEdb18hANW1xKf
X-Gm-Gg: ATEYQzzFFMlit6BLGl8sEs2bzjx+kWSB78fGeEyQTi6kdmA/QskYdOEyXNz8hzZQzTT
	Qep9TfLWQ9O73wYjciFsXE0jZCkgBWkwqsC/9TrD4RINxw/FvH2LuNYW2haOYFaMwo8OmOO/EqU
	DH2T0kZHlEJQ1ylt/Mhsw4pdfCsYlvqUt38+wBAirOBh70Un1ywkwQ5QPJvV5UjRsneRkuiiOpS
	dUif6eJZFT0ZzJ50+X02FCSb20tBz3BD8L24tHnOKs2XW06jGsBk55vbBeylXB5hjwtgcRnmeDk
	aUAoF3khYICYfWwEYt3tUg5qw3LhSJc7kipoGPimDjw3MKhzLUx1Z+BHz/Fqp15Ce8ZnVhce5Yl
	iycvCuOn2pjkxmalhNQUJqGDYr5mEYFHHvtiXmXsImfOCvrid
X-Received: by 2002:a17:903:1af0:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b0cdbeb434mr136509415ad.5.1774861263914;
        Mon, 30 Mar 2026 02:01:03 -0700 (PDT)
X-Received: by 2002:a17:903:1af0:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b0cdbeb434mr136508645ad.5.1774861263321;
        Mon, 30 Mar 2026 02:01:03 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427658e4sm87552095ad.48.2026.03.30.02.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:01:02 -0700 (PDT)
Message-ID: <e9d15987-7c8a-4ec6-8c65-a882139ba0cb@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:00:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
 <vvemyg2t3ycjwb3uhwua7ow6yjvo2mnu5tdrqc3ed3iuj5ue3v@bfvgfhcxbgke>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vvemyg2t3ycjwb3uhwua7ow6yjvo2mnu5tdrqc3ed3iuj5ue3v@bfvgfhcxbgke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca3bd0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=e15bYA7AIXbTdG7xHUkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: iW5uIVYqFLgczVquyO5AUr-4qA7y_bTL
X-Proofpoint-ORIG-GUID: iW5uIVYqFLgczVquyO5AUr-4qA7y_bTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX76ypT4fVyeRI
 7BjkGJtgSbnGUKzNlqXujgG78XLdeiNU+ExWTTxnOROxpDBUD4utfQcqhTTkB6+URNlCQiAkxMl
 NrqDYoGKROLmgulHyo4lV0dzls5Q8ediVWHpmNtqoVtkDqiIJFVBH/4eo3kd7Hh5CYU/768pDdP
 iVv6kBOZ1vmej9uDppUcjkpTDtgCeOQ+geXbaCIvffPmYr+JUEBKTEhE/ADiuQ2o3qGeKjQvS9V
 RJmpYQ0fNdz8UmzR56wx8529eyJfEMjyHfG0jmbX3ZZZW/HyvBzmUz6P46wUimqgvbYOEopWLAX
 5xbz4BXt7XxICPAVEgbLAJQjkkErwlTEEE+FFqC7P+qHQX6dq1JEhS+DSxxA2mjbRcbIPS/6KHI
 Hi+yvdVA0vGVPDPx/C76IixhVz7fjbZDl8fwYNFHyM5mbcWdqSRaJPnRc2hjs1q3d/k094W4mdk
 0FhUtzsU7Tst5qMUaDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E850357B7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 1:28 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:51PM +0800, Yongxing Mou wrote:
>> The DP_CONFIGURATION_CTRL register contains both link-level and
>> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
>> all of them together, which makes it harder to support MST.
>>
>> This patch separates the configuration into two functions:
> 
> git grep "This patch" Documentation/process
> Got it. Will fix it next patch.
>> - msm_dp_ctrl_config_ctrl_link(): handles link-related fields
>> - msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields
>>
>> It also moves the link-related configuration out of
>> msm_dp_ctrl_configure_source_params().
> 
> Why? And it looks like a separate patch...
> 
Because the patches following msm_dp_ctrl_configure_source_params() will 
take a panel parameter, and lane_mapping and peripheral_flush seem to be 
more closely related to the link, they have been moved out.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
>>   1 file changed, 31 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb..45d6c9a7f7ddaa049443253cbf4c6fc5feda3177 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -380,26 +380,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>>   }
>>   
>> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>> +					    struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 config = 0, tbd;
>> +
>> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>> +
>> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> +
>> +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>> +			msm_dp_panel->msm_dp_mode.bpp);
>> +
>> +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>> +
>> +	if (msm_dp_panel->psr_cap.version)
>> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>> +
>> +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>> +}
>> +
>> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>> +{
>> +	u32 config = 0;
>>   	const u8 *dpcd = ctrl->panel->dpcd;
>>   
>>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>   
>> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> -
>>   	/* Scrambler reset enable */
>>   	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>>   		config |= DP_CONFIGURATION_CTRL_ASSR;
>>   
>> -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>> -			ctrl->panel->msm_dp_mode.bpp);
>> -
>> -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>> -
>>   	/* Num of Lanes */
>>   	config |= ((ctrl->link->link_params.num_lanes - 1)
>>   			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
>> @@ -413,10 +428,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>   	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>>   	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>>   
>> -	if (ctrl->panel->psr_cap.version)
>> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>> -
>> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
>> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>>   	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>   }
>> @@ -439,10 +451,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>>   {
>>   	u32 colorimetry_cfg, test_bits_depth, misc_val;
>>   
>> -	msm_dp_ctrl_lane_mapping(ctrl);
>> -	msm_dp_setup_peripheral_flush(ctrl);
>> -
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>>   
>>   	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
>>   	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
>> @@ -1614,7 +1623,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>   	u8 assr;
>>   	struct msm_dp_link_info link_info = {0};
>>   
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>>   
>>   	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>>   	link_info.rate = ctrl->link->link_params.rate;
>> @@ -2524,6 +2533,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	 */
>>   	reinit_completion(&ctrl->video_comp);
>>   
>> +	msm_dp_ctrl_lane_mapping(ctrl);
>> +	msm_dp_setup_peripheral_flush(ctrl);
>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>> +
>>   	msm_dp_ctrl_configure_source_params(ctrl);
>>   
>>   	msm_dp_ctrl_config_msa(ctrl,
>>
>> -- 
>> 2.34.1
>>
> 


