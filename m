Return-Path: <linux-arm-msm+bounces-103274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLq4LUlp32nNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:32:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F454034C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F314130300C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A77333FE1F;
	Wed, 15 Apr 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNSkvZfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKG9oXTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4F330D2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776249159; cv=none; b=Js9ECkQo4HAUDISnMgLCq30hzPFaPHT+prSqC7fEzDs0MvCYT2zdwjFh+l5g0hkeJuU6P+9NimRkwZrm7BCIushfGWcf4zjCLBIZYhPJu1NWZ8yRdmAkHTyxTXHNFzdqbdnpcOFa2NVrQXDBdjAoNkapkslnZEWRhdM/kJ9VyrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776249159; c=relaxed/simple;
	bh=VrbY8IJ8qKrtxYPCAsMomdMj/1nnc7voyF0npuYzbCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjYk9zCSPnc6r+3wfSqZ24lddQRvdoMlF49CpWpUCgW+h+7ODX3wRYu57kYrEfpp3Z0PGhhSz51ork+/r0xj+K7qtJGCeO2n/gNoq2SLOib0yXlIVbI3aiPVmYaZfpZvUewv5PUuQ+AWrnEywd7b+Fwgp2at2XOz3BPb2n00udA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNSkvZfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKG9oXTe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9gOls3126648
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9jj7L8wvKQnNDkm+0wvgGPXEISw7cX3mQx1BrSdKfw=; b=VNSkvZfN5GzDa+ie
	/29MhpRMW8KOOCoAPd0Bbj640OBWloKVIYprqLzAP+rgAqOxKl9F0TvVtqIzrP4C
	LEuVsqBRW4b2aHsZcSQx3/Lmnct3hV9qpxMdft/9S7XwooE9MsJr+HsXwSTTMFf+
	vXiiJIqkuhOdVrYnE2bdmoxgySsH0qpQIh7eUK19jfKPcb8embP0YY5P7qAEZnRl
	Xr/yiC2bO48gjfv4zW9oDKQQoFwcBTh16DCODK1qXBNyHtXEJC9Z4rzoqEKvXKv1
	4MYpLF6BGIr/1ENkJpypfcod1U8+RDnysSJmH9mBAy5pPU4VmBfWobNdoWXFqyXk
	YaA16Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56tuh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:32:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso14100876a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776249156; x=1776853956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9jj7L8wvKQnNDkm+0wvgGPXEISw7cX3mQx1BrSdKfw=;
        b=UKG9oXTemYH6YdNpMOa1s8GWOiexzFyWlMGOuxYEs3v7K5pEPEzbWh0iClabGADZdh
         B1cMekLXipr5JhFIMO2QsXcYYnVdmA3M8Fd4poyLm+PCQgf9iiSOBGOfylMtcI3SPleJ
         aWMEE7vLvyTL9nZJ93assTAzw3JLTa1kUcD+KpeBg1wBEBa4yQfwTiQNFD77mMhJ89JN
         rFec4HzyfmZbDnrwpjgU1TxHqUqdT3Pi23mA6uCHxuJX9C9sG2WbC2JW6BBnhsmhvgl+
         UUUUsDmq2Y2B1znBfeQvwSrBMMo9xa28/PSfE5Q0w4VXi0A5FNNZSPI/uWJdZ1QFmpzL
         1QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776249156; x=1776853956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9jj7L8wvKQnNDkm+0wvgGPXEISw7cX3mQx1BrSdKfw=;
        b=RMH28q13hTj/U73JD0SWCUSAOQliwhbpIo3lvgr9uilRyRa/st+RuvZQyjdYeTr6gh
         goWxQEhUBPMGB5e8jxzn7/T6r8TJURqz856Be8m80nuRM/GdU9qi2/Pugdx+TIpdmQoG
         rOY9VJi/0xmB8CwDOHnS1m0IBuzrgwm+cgRon9WhsqfGRIAlnF6+Z2YeU1ntEg3O2lNq
         NWrUMcR2FEIUsyAYwQEfWimx++w9/jjw4/NHSgDK41BGRjzA7yGL+D0Bld6S67Dakmxy
         6srfjw4mHk9db5Xo0lTq3Zt/pvkRMbjSjYoghjaErYI2DevDbILRiF4lhGBm3rWyVeU+
         Eifw==
X-Forwarded-Encrypted: i=1; AFNElJ/QFrz5M5HEvp59m0aD4T3jd0uO5hchxD57mFVbNnXmdG09cqfRsZ5B+7wU9oadlTyg+rBfkqwDGi8V4Ta7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RYQfpUUB8bvbc7ad2G1UrX7QvyTLDN/zZ9x8HbNa65Cnurxg
	UgFKSiSTfwzs+Ws8cB+K4Yagl4mu1Kb83s+lihwoRoek8+laJm7YrGppRUXhIp6XnqI/fEev4HG
	xewNcFGC1rts7wz5QOuyTIN58Yi43fHVmz+Us7FkXDg2DHOIQSfsy/ooqpKIZXOZwPxwz
X-Gm-Gg: AeBDiet/bPdGpuXoU6g6ajHdzgQNnY1u7F9UCdrwLVI4kMgT32yqvtVV/D1ajLD4xMI
	/aumxrRZj0pWyS+HXeKXQ7zIagJJYxfVluDO2PDpBEGPqC7JmTZZcLtbw7B+JryX2NAqdXyUqVw
	VmzqXf1TYPyiQefk63nI06WoY/e50IP7t4aiwoN56raxe7mSMooTbMoJA+rHAsj0yv3dv8mw3Oh
	Ep7XX2C1IWcqCMo8U7nZP3MeXT+iWyMtQGLRzp3HutVxdGhEorOsaku8Gh913ml85EEn99FDu64
	0nbZITTIl6Kjp66hhbvDmbstA84BTZ6wpKMoBxS3pC6Jdtp11NEsLu8MFu5j2/77wUPIqTZ8KdR
	K/W3Rghvcdw4fgurwtOsADslHq1+26G3DeZTCJEOia3LxkFyodCXJWzjL7owE4GWvhG4OaI77mU
	3obIaxk1oxmAnQaV5MZxhhhfVEyOCA
X-Received: by 2002:a05:6a20:7345:b0:39f:ebf7:5ba6 with SMTP id adf61e73a8af0-39febf768e8mr22537042637.25.1776249155853;
        Wed, 15 Apr 2026 03:32:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:7345:b0:39f:ebf7:5ba6 with SMTP id adf61e73a8af0-39febf768e8mr22537004637.25.1776249155405;
        Wed, 15 Apr 2026 03:32:35 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957efce3asm1399524a12.14.2026.04.15.03.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 03:32:35 -0700 (PDT)
Message-ID: <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 18:32:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
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
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
 <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
 <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
 <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df6944 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lshNY4iLFTa4dCOtUIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5NiBTYWx0ZWRfX0JRHQS+cGE/N
 pt3fEKpRmbjcb3e3650I2Pv5Gh9U6sDlE4FafiyKNkOKWVmvjhI24QOXVBMEjjI9+axEoF5h5J3
 hcJ1ZLxWVFzwakl2sSUnyF7WAZsq9HZAeBtVxMSFKgaTwmtxNZOzvCoOxpuINF3PTilS+2XxSrl
 DydfipCcOt1Yk7nDP3uG6iaN4lcrKaOSQlJ2OuYo/zyZ6c6JR3LnvqnrV/lyKlwaCSnjXoMhkdy
 14p6n8GXzsLOweA0NS9tD85SlnbDlWBl+6hFMXpqBoRi4hx6IppqPgF1E9SshPFzxbykA6TNmJ5
 fRJznEfr3+gKE7MDV4ygWDHPADjReFyAbqT3P6bVKCJIPyF/H+WOpLzhYtYiXJRqCa/bGHd/oDX
 0sd2VMRx5/VmnaBCbDE5JqdupiAyBYt1RjZDNCerNwoRHgvBebPIy5XBaxrSZZ761O2q3kk66T9
 W6wfzuHKASsoT+GyNjw==
X-Proofpoint-ORIG-GUID: y2YdpVqhr1oXRP6NAzqmsjFS0I98Wc37
X-Proofpoint-GUID: y2YdpVqhr1oXRP6NAzqmsjFS0I98Wc37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77F454034C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/15/2026 2:43 AM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
>>
>>
>> On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> Add HPD callback for the MST module which shall be invoked from the
>>>>>> dp_display's HPD handler to perform MST specific operations in case
>>>>>> of HPD. In MST case, route the HPD messages to MST module.
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>>>>>>     drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>>>>>>     3 files changed, 48 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>>>>>>     static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>>>>>>     {
>>>>>> -	int rc = 0;
>>>>>> -	u32 sink_request;
>>>>>>     	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>>>>> +	u32 sink_request;
>>>>>> +	int rc = 0;
>>>>>> +
>>>>>> +	if (msm_dp_display->mst_active) {
>>>>>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
>>>>>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>>>>>> +		return 0;
>>>>>> +	}
>>>>>>     	/* check for any test request issued by sink */
>>>>>>     	rc = msm_dp_link_process_request(dp->link);
>>>>>> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>>>>>     	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>>>>>>     		msm_dp_display_send_hpd_notification(dp, false);
>>>>>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>>>>>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>>>>>>     		msm_dp_display_send_hpd_notification(dp, true);
>>>>>> +		msm_dp_irq_hpd_handle(dp, 0);
>>>>>
>>>>> Why is it a part of this patch?? It has nothing to do with MST.
>>>>>
>>>> Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
>>>> I tried an alternative approach by calling the MST IRQ handler from
>>>> msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
>>>> DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
>>>> msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
>>>> could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
>>>> However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
>>>> MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
>>>
>>> When are the link status bits updated? Please remember, we need to
>>> support all three cases:
>>>
>>> - Native DP, native DP HPD pin handling
>>> - Native DP, DP HPD pin not handled by the controller
>>> - DP AltMode, DP HPD pin not used at all
>>>
>>> In the second and the third cases we will not be getting the IRQs.
>>> Instead one of the next bridges (connector, EC, AltMode, etc.) will send
>>> the HPD event, which lands in the .hpd_notify() callback.
>>>
>> I added some logs and did some testing. I think
>> msm_dp_aux_is_link_connected() only shows the current HPD state. Since IRQ
>> HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_INT_STATUS
>> in the IRQ flow, the HPD state machine has usually already finished pulse
>> classification and returned to Connected.
> 
> But the IRQ should be sticky and it should be readable from the status
> bits.
> 
Yes... I’m not sure how this is handled on other platforms, but on 
LeMans can not get IRQ status from msm_dp_aux_is_link_connected().
> Note, in the USB-C AltMode case the HPD machine is not used at all.
> 
>>
>> Because of that, the condition hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT
>> will usually not be hit.
>>
>> do you have any suggestion that in how to distinguish between an IRQ event
>> and a plug event in .hpd_notify() better? We probably don’t want to
>> introduce another state machine.
> 
> Then, I assume, currently there is no way to actually distinguish those.
> The easiest way to handle the replug would be to store the current
> "connected" status and verify if we are receiving "connected" while
> being connected or if it is a disconnected -> connected change.
> 
Emm.. Currently, regardless of whether it is the native DP HPD (on 
LeMans) or DP over Type‑C Alt Mode(test on Hamoa), a single plug event 
always results in two or more identical .hpd_notify() callbacks.
In other words, after the transition from disconnected → connected is 
completed, there is still one more .hpd_notify() with connected → 
connected. So it still can store "connected" to distinguish between an 
IRQ event and a plug event from .hpd_notify()?
This is my current understanding. If this is incorrect, please feel free 
to correct me. Thanks.
As an additional note, msm_dp_hpd_plug_handle runs through its full flow 
twice for a single plug event. Also, the behavior I described above does 
not include any MST-specific filtering codes.
> For a longer term (and granted that HDMI also has a notion of HPD pulse
> events) we might want to extend the DRM HPD API to pass through the "IRQ
> pulse" events as is (instead of converting those to
> connected-whilec-connected events).
> 
> Let me sketch a draft for that.
> 


