Return-Path: <linux-arm-msm+bounces-109577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFmPFQgDFGoGIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:06:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC55C770A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB3A330013BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE6B3D1AB5;
	Mon, 25 May 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4D4rjpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3C+1qUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F179347516
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696386; cv=none; b=BQ6IVwgVPQDVqf2XJgp4Z5VEaGkkitSMSKZ7Oc+1Bxj2vkkAcEAwRT6lLee7FBHKf6CNqzy7+3ftV5k8pnbMmDnD0huzcD9wOIDN4/XHCX0NRFxdwYBy0iiigv74hLYSYq2pEpqNX75ZRPwuvyJBYnAdZyJRa0dXty9tpiT9IHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696386; c=relaxed/simple;
	bh=gdq3JYZxhQjvvxT5Ebp676SV1+h97yH0xzHdsYOt6LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfXbpX9rmiljr4a6ypK9QIjBQhcBh3WfHNM0G+6VI9tdRsdkM9KXuGjmMeHEjhomJph1NSb4vvLvjsXMth6UBPPXmoPVCowqxtYqqoRRmi2pv+E3RTAwVJZV3EKNceBigf1d7WdbRBO372on0UhN3tfBpzjkttnPn11lIVS8fKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4D4rjpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3C+1qUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P82VLU899413
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbYo1gXCAOGPeRIAAJWiUtSg5ubmEpRxwiGoiJ5Trj4=; b=H4D4rjpqqp649oUy
	Mxxb2y+uFAFERSLtcffmnsbfvzsVSDxHY0VyB6E8tKLbJIHm9Z3m+hFV3kU9waTk
	2BQkwoToKDnMyG+P9zSSlv5mCOda1EyNpsc9QSkHlWiCkPU2Gy3htw9HJv2UyiMb
	dHJDVv+fbF5UxR5/7Mzrylw7l2uAVOD8iFHb9p2CdFvZoHgxcRdnObnBtQGI2PAk
	upLk14GfMArA2rmz3p7RqQTdusHNbnsVh6WTqKfZQX2VvajP+bejbQHT2J+tldsu
	lIewASXYkr5gqSwKiOWKLDHcRGvaQ3KdAO6WKt1XTC3JEKct7D/bwQ1oybhG8SFc
	R6VSzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9nhpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:06:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso4737801a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779696382; x=1780301182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbYo1gXCAOGPeRIAAJWiUtSg5ubmEpRxwiGoiJ5Trj4=;
        b=J3C+1qUYGlEyxi9ngZvxXlwSaTCWLkKzYyvN0cua7fsUk2WFZltlkv6cWkWalWnc5G
         xbkJfD1qIP3Kn58II105KAOpGC1QBCC7YUbv05KJkx5xAS6HzOTOjofi8jJe1cRaodgG
         wfJQ8bCb83dAWCcLQkFtRqvBhQlRYunB5fZDitrkL/m/dWqPCDCnxSL9UkSDiQR05El3
         SAb1p6UhQD5f23mWwbKl7dVF1feRAdOD2dI8GHXqiMST3H4ysiFcF84LcXI3HsSfwM8m
         6axx5okvZrWnetpQQFB8Bjv67olk+qvw030tKJDUoJ4c7/a+3c3DTLVC9JjRbLIg5YP8
         ZZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696382; x=1780301182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbYo1gXCAOGPeRIAAJWiUtSg5ubmEpRxwiGoiJ5Trj4=;
        b=Vwc2r8IzUzTGGEiBfjGoewaAWmcUIimJiAgZF0vt3VkOhXhAjhE7mfi3m3AH6ObLGa
         qlFwFOY3oZCTzk6mAZmmx8RWWbQjAXnhKyM/CZNY2nOgSfFOs95iPsS4wotsZxTOkw/v
         yGxPLDlxL0RUjUSL5GncPb6J4pkjKRQEgb6HpxCylZTNBdkff5DGaGYuG9Wwpu7DFydF
         tLAle1bQd3EtOn0qc6egMVbre8GmJf9etfr9tx7Rftyr1cjmyRMFmYuVaNEZOZrPnOzH
         c4W4ZHDbTVBN33ZD5J4wBaNIwEgYLzfe18tnbWRRTaN6J01NjJVrD5uhA/keBzqkR78C
         T7Tg==
X-Forwarded-Encrypted: i=1; AFNElJ/J7naHg0ZMBRY9RPLl4K407SttPRBtLeA+ZVx7F+CXkUZLCQqu5BJnt9N91L9MdOz+Ov7XcpOElzwh4nrU@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6dUixpIyCflK9IP52YtI9sq9nf75pFdhNdX9AoVyfPdxBP2W
	CkalyPAZ6d3NCVoLdweP4nhkkXNxBDjV1MsGGmg1kgSVSSYhV2M648hc6jt6Od2vXVn+baGHa8V
	B0SvuUBETeCg0ie9JakAWvIt2SDR0rL63346cd6kZlQn1tMIe+VDnpKrP7gSiZ5PdFBse
X-Gm-Gg: Acq92OGPJP2CedBxmXRyMygbxibxjDHb4ZM1sEgrHqFSbKhW3MrTS0tS68pZSVzuCfU
	jzroDpI7z80aFShsOB6zd7nRqm7tI2sJckSmOUNtl4r1beuYI6z/BQI6MaXrvJowCMSaFuDn1VB
	ALUWOddiQo60A1E6/EFTyoQJURjFtqQjwBj/N8h9K8p2jCxFGJFSfx98wJtrKtN/nHg7QDY92Iq
	wAjwugCNUKlGC9/ntHrwrTRsdtMz7zBtRtVn1AQ9PBpmiKP+kYXqAkPOJEkdacBfNRd/QDE+3Pc
	jekBKpFf7V0TOACx+Rk0pxslqYwAgU58U1KEhSjuVRA/s6TEf9vI/1EuDq95TSOoVLF66gPPDJQ
	flhE2xhbwPAi8jATCcqLUJswWALIybOkgGM9umXQZsklWF4SVRRrnMeeAPdOrJkJXfOqeLdVHL9
	AD/F9+ML+UM77mozVPSw==
X-Received: by 2002:a05:6a00:ac8a:b0:838:3404:c2b1 with SMTP id d2e1a72fcca58-8415f3304famr12824395b3a.18.1779696382228;
        Mon, 25 May 2026 01:06:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:838:3404:c2b1 with SMTP id d2e1a72fcca58-8415f3304famr12824345b3a.18.1779696381517;
        Mon, 25 May 2026 01:06:21 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm8347373b3a.15.2026.05.25.01.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 01:06:20 -0700 (PDT)
Message-ID: <2ef51545-e3e9-446b-a97e-a01d02fc4863@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:06:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/39] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-17-b20518dea8de@oss.qualcomm.com>
 <roqivmstbvdd7mhyyljhmzxv5njvuqqgjdn5gkekzrclhveozx@fougiain3kfh>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <roqivmstbvdd7mhyyljhmzxv5njvuqqgjdn5gkekzrclhveozx@fougiain3kfh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yjuCvU2AP4jI1b5QIWJ0tbGht9oAOIPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MCBTYWx0ZWRfXwdrAb2krnWTy
 i9JPx/e4V5IfAzLMcl8v24Oc++juf3YlBdZ2D5uF5XfGzPHI2czDr+RbfoN2tSUXVM/QL53Yr9a
 9S0MZ5wzKA0HPdWHtUZhNDybAtZN8YBQ2O0UmeleRn+W2O9MC9YWqhsd5scZ3KQ5zrC+pUGLwQc
 GwDH2XAnoCpmoe0xK1c4Blbl+ikjCePJOWYvKAjlF0S10W6t6O8c6c23TjfK8MW0CeIlagLauyg
 pd2Uapwm/LW9MEuidKns0ZrPlKKeak2NSATQ9IxEE7Uv+MKz9/k0itfhcbcm+8gGVymbOs98p/L
 SM5fCDewgqsyzB26mkaFyeRawh93oESjqo1XFD/NigUoHbLzKHj3OV1UfaTwAF+K8UqsM8NlGkh
 09b198MWZrmauJN1XcBxXT3fr1pw5sovrz4g9gaj+8ekmBS3yyqR6ePtp3zQX3GIhKexzqtRzqF
 QzwSjSi7roCfiEvBvBg==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a1402ff cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JTuvh-fcbtNOvO6VuqcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: yjuCvU2AP4jI1b5QIWJ0tbGht9oAOIPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04BC55C770A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 2:24 AM, Dmitry Baryshkov wrote:
> Nit, there is no catalog anymore, please fix the subject line.
> 
> On Fri, Apr 10, 2026 at 05:33:52PM +0800, Yongxing Mou wrote:
>> To support 4-stream MST, the link clocks for stream 3 and stream 4 are
>> controlled by MST_2_LCLK and MST_3_LCLK which share the same register
>> definitions but use different base addresses.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 225 ++++++++++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  24 +++-
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 135 +++++++++++++++++-----
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  16 ++-
>>   6 files changed, 283 insertions(+), 123 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index a52bcd9ea2a3..1109b2df21be 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
>>   	struct msm_dp_link *link;
>>   	void __iomem *ahb_base;
>>   	void __iomem *link_base;
>> +	void __iomem *mst2link_base;
>> +	void __iomem *mst3link_base;
>>   
>>   	struct phy *phy;
>>   
>> @@ -158,19 +160,45 @@ static inline void msm_dp_write_ahb(struct msm_dp_ctrl_private *ctrl,
>>   	writel(data, ctrl->ahb_base + offset);
>>   }
>>   
>> -static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl, u32 offset)
>> +static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl,
>> +				   enum msm_dp_stream_id stream_id, u32 offset)
>>   {
>> -	return readl_relaxed(ctrl->link_base + offset);
>> +	switch (stream_id) {
>> +	case DP_STREAM_0:
>> +	case DP_STREAM_1:
> 
> Continuing the comment from the previous patch:
> 
> Or, can we remap all offsets here? It would be much, much easier to
> always pass REG_DP_foo and then here, in the link reading code, remap
> the offsets for DP_STREAM_1.
> 
The stream 1 offsets relative to stream 0 are not uniform:
     REG_DP_CONFIGURATION_CTRL  0x008 -> 0x400  (diff 0x3F8)
     REG_DP_MISC1_MISC0         0x02C -> 0x42C  (diff 0x400)
  So remapping inside msm_dp_read/write_link would require a full lookup
  table, which seems not help for current status.

Can we introduce a small helper msm_dp_stream_reg() that selects the 
correct register address at the call site:
//dp_panel.h
static inline u32 msm_dp_stream_reg(enum msm_dp_stream_id id,
				     u32 reg_s0, u32 reg_s1, u32 reg_mst)
{
	if (id > DP_STREAM_1)
		return reg_mst;
	return id == DP_STREAM_1 ? reg_s1 : reg_s0;
}

//dp_panel.c and dp_ctrl.c
       u32 reg = msm_dp_stream_reg(stream_id,
                                   REG_DP_MISC1_MISC0,
                                   REG_DP1_MISC1_MISC0,
                                   REG_DP_MSTLINK_MISC1_MISC0);
       msm_dp_read_link(ctrl, stream_id, reg);
>> +		return readl_relaxed(ctrl->link_base + offset);
>> +	case DP_STREAM_2:
>> +		return readl_relaxed(ctrl->mst2link_base + offset);
>> +	case DP_STREAM_3:
>> +		return readl_relaxed(ctrl->mst3link_base + offset);
>> +	default:
>> +		DRM_ERROR("error stream_id\n");
>> +		return 0;
>> +	}
>>   }
>>   
>>   static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
>> -			       u32 offset, u32 data)
>> +				     enum msm_dp_stream_id stream_id, u32 offset, u32 data)
>>   {
>>   	/*
>>   	 * To make sure link reg writes happens before any other operation,
>>   	 * this function uses writel() instread of writel_relaxed()
>>   	 */
>> -	writel(data, ctrl->link_base + offset);
>> +	switch (stream_id) {
>> +	case DP_STREAM_0:
>> +	case DP_STREAM_1:
>> +		writel(data, ctrl->link_base + offset);
>> +		break;
>> +	case DP_STREAM_2:
>> +		writel(data, ctrl->mst2link_base + offset);
>> +		break;
>> +	case DP_STREAM_3:
>> +		writel(data, ctrl->mst3link_base + offset);
>> +		break;
>> +	default:
>> +		DRM_ERROR("error stream_id\n");
>> +		break;
>> +	}
>>   }
>>   
>>   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>> @@ -294,18 +322,18 @@ static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	u32 val;
>>   
>> -	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +	val = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   	val |= DP_MAINLINK_CTRL_ENABLE;
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, val);
> 
> Are those always using the link0 base? If so, can we keep the existing
> API for the stream-independent registers and introduce a separate API
> call for the stream-dependent calls? Generally, if you keep the existing
> function, I think, it becomes easier to squash this and the previous
> patches.
> 
Here will always using the link0 base. After introducing the helper 
func, will squash this patch into the previous one.
>>   }
>>   
>>   static void msm_dp_ctrl_psr_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	u32 val;
>>   
>> -	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +	val = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   	val &= ~DP_MAINLINK_CTRL_ENABLE;
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, val);
>>   }
>>   
>>   static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>> @@ -314,21 +342,21 @@ static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "enable\n");
>>   
>> -	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   
>>   	mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
>>   					DP_MAINLINK_CTRL_ENABLE);
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   
>>   	mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   
>>   	mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   
>>   	mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
>>   				DP_MAINLINK_FB_BOUNDARY_SEL);
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   }
>>   
>>   static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
>> @@ -337,23 +365,23 @@ static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "disable\n");
>>   
>> -	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   }
>>   
>>   static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	u32 mainlink_ctrl;
>>   
>> -	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   
>>   	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
>>   		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
>>   	else
>>   		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   }
>>   
>>   static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
>> @@ -380,7 +408,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>>   	reinit_completion(&ctrl->idle_comp);
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
>>   
>>   	if (!wait_for_completion_timeout(&ctrl->idle_comp,
>>   			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
>> @@ -395,7 +423,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>   	u32 config = 0, tbd;
>>   	u32 reg_offset = 0;
>>   
>> -	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>> +	if (msm_dp_panel->stream_id == DP_STREAM_0)
>> +		config = msm_dp_read_link(ctrl, 0, REG_DP_CONFIGURATION_CTRL);
>> +
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>>   
>>   	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> @@ -410,8 +442,10 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> -		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id, msm_dp_panel->stream_id > 1 ?
>> +			  REG_DP_MSTLINK_CONFIGURATION_CTRL :
>> +			  REG_DP_CONFIGURATION_CTRL + reg_offset, config);
>> +
> 
> Yep, it would definitely help to handle these differences in the link
> writing code.
> 
>>   }
>>   
>>   static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>> @@ -441,7 +475,7 @@ static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_CONFIGURATION_CTRL, config);
>>   }
>>   
>>   static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>> @@ -454,8 +488,8 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>>   	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
>>   	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>> -			ln_mapping);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>> +			  ln_mapping);
>>   }
>>   
>>   static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>> @@ -471,7 +505,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>>   	if (msm_dp_panel->stream_id == DP_STREAM_1)
>>   		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>>   
>> -	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
>> +	misc_val = msm_dp_read_link(ctrl, msm_dp_panel->stream_id, msm_dp_panel->stream_id > 1 ?
>> +				    REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + reg_offset);
>>   
>>   	/* clear bpp bits */
>>   	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
>> @@ -481,7 +516,10 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>>   	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
>> -	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
>> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
>> +			  msm_dp_panel->stream_id > 1 ?
>> +			  REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + reg_offset,
>> +			  misc_val);
>>   }
>>   
>>   static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
>> @@ -1307,9 +1345,9 @@ static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
>>   	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
>>   			msm_dp_tu, valid_boundary, valid_boundary2);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY, valid_boundary);
>> -	msm_dp_write_link(ctrl, REG_DP_TU, msm_dp_tu);
>> -	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_VALID_BOUNDARY, valid_boundary);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_TU, msm_dp_tu);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
>>   }
>>   
>>   static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
>> @@ -1426,7 +1464,7 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
>>   
>>   	bit = BIT(state_bit - 1);
>>   	drm_dbg_dp(ctrl->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, bit);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, bit);
>>   
>>   	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
>>   
>> @@ -1453,7 +1491,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>>   	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
>>   						    ctrl->panel->dpcd, dp_phy, false);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>>   
>>   	*training_step = DP_TRAINING_1;
>>   
>> @@ -1577,7 +1615,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>>   	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
>>   						ctrl->panel->dpcd, dp_phy, false);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>>   
>>   	*training_step = DP_TRAINING_2;
>>   
>> @@ -1694,7 +1732,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>   	}
>>   
>>   end:
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>>   
>>   	return ret;
>>   }
>> @@ -1840,34 +1878,34 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
>>   static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	/* trigger sdp */
>> -	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, UPDATE_SDP);
>> -	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, 0x0);
>> +	msm_dp_write_link(ctrl, 0, MMSS_DP_SDP_CFG3, UPDATE_SDP);
>> +	msm_dp_write_link(ctrl, 0, MMSS_DP_SDP_CFG3, 0x0);
>>   }
>>   
>>   static void msm_dp_ctrl_psr_enter(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	u32 cmd;
>>   
>> -	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
>> +	cmd = msm_dp_read_link(ctrl, 0, REG_PSR_CMD);
>>   
>>   	cmd &= ~(PSR_ENTER | PSR_EXIT);
>>   	cmd |= PSR_ENTER;
>>   
>>   	msm_dp_ctrl_enable_sdp(ctrl);
>> -	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
>> +	msm_dp_write_link(ctrl, 0, REG_PSR_CMD, cmd);
>>   }
>>   
>>   static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	u32 cmd;
>>   
>> -	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
>> +	cmd = msm_dp_read_link(ctrl, 0, REG_PSR_CMD);
>>   
>>   	cmd &= ~(PSR_ENTER | PSR_EXIT);
>>   	cmd |= PSR_EXIT;
>>   
>>   	msm_dp_ctrl_enable_sdp(ctrl);
>> -	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
>> +	msm_dp_write_link(ctrl, 0, REG_PSR_CMD, cmd);
>>   }
>>   
>>   void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
>> @@ -1880,9 +1918,9 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
>>   		return;
>>   
>>   	/* enable PSR1 function */
>> -	cfg = msm_dp_read_link(ctrl, REG_PSR_CONFIG);
>> +	cfg = msm_dp_read_link(ctrl, 0, REG_PSR_CONFIG);
>>   	cfg |= PSR1_SUPPORTED;
>> -	msm_dp_write_link(ctrl, REG_PSR_CONFIG, cfg);
>> +	msm_dp_write_link(ctrl, 0, REG_PSR_CONFIG, cfg);
>>   
>>   	msm_dp_ctrl_config_psr_interrupt(ctrl);
>>   	msm_dp_ctrl_enable_sdp(ctrl);
>> @@ -1921,16 +1959,16 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
>>   		}
>>   
>>   		msm_dp_ctrl_push_idle(msm_dp_ctrl);
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>>   
>>   		msm_dp_ctrl_psr_mainlink_disable(ctrl);
>>   	} else {
>>   		msm_dp_ctrl_psr_mainlink_enable(ctrl);
>>   
>>   		msm_dp_ctrl_psr_exit(ctrl);
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   		msm_dp_ctrl_wait4video_ready(ctrl);
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>>   	}
>>   }
>>   
>> @@ -2041,7 +2079,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>>   
>>   	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   end:
>> @@ -2056,72 +2094,72 @@ static void msm_dp_ctrl_send_phy_pattern(struct msm_dp_ctrl_private *ctrl,
>>   	u32 value = 0x0;
>>   
>>   	/* Make sure to clear the current pattern before starting a new one */
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0x0);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0x0);
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "pattern: %#x\n", pattern);
>>   	switch (pattern) {
>>   	case DP_PHY_TEST_PATTERN_D10_2:
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
>> -			      DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
>> +				  DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
>>   		break;
>>   
>>   	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
>>   		value &= ~(1 << 16);
>> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> -			      value);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> +				  value);
>>   		value |= SCRAMBLER_RESET_COUNT_VALUE;
>> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> -			      value);
>> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
>> -			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
>> -			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> +				  value);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_LEVELS,
>> +				  DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
>> +				  DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
>>   		break;
>>   
>>   	case DP_PHY_TEST_PATTERN_PRBS7:
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
>> -			      DP_STATE_CTRL_LINK_PRBS7);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
>> +				  DP_STATE_CTRL_LINK_PRBS7);
>>   		break;
>>   
>>   	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
>> -			      DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
>> +				  DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
>>   		/* 00111110000011111000001111100000 */
>> -		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
>> -			      0x3E0F83E0);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
>> +				  0x3E0F83E0);
>>   		/* 00001111100000111110000011111000 */
>> -		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
>> -			      0x0F83E0F8);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
>> +				  0x0F83E0F8);
>>   		/* 1111100000111110 */
>> -		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
>> -			      0x0000F83E);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
>> +				  0x0000F83E);
>>   		break;
>>   
>>   	case DP_PHY_TEST_PATTERN_CP2520:
>> -		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +		value = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
>> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, value);
>>   
>>   		value = DP_HBR2_ERM_PATTERN;
>> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> -			      value);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> +				  value);
>>   		value |= SCRAMBLER_RESET_COUNT_VALUE;
>> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> -			      value);
>> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
>> -			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
>> -			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
>> -		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
>> +				  value);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_LEVELS,
>> +				  DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
>> +				  DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
>> +		value = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>>   		value |= DP_MAINLINK_CTRL_ENABLE;
>> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, value);
>>   		break;
>>   
>>   	case DP_PHY_TEST_PATTERN_SEL_MASK:
>> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL,
>> -			      DP_MAINLINK_CTRL_ENABLE);
>> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
>> -			      DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL,
>> +				  DP_MAINLINK_CTRL_ENABLE);
>> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
>> +				  DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
>>   		break;
>>   
>>   	default:
>> @@ -2149,7 +2187,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
>>   	msm_dp_link_send_test_response(ctrl->link);
>>   
>> -	pattern_sent = msm_dp_read_link(ctrl, REG_DP_MAINLINK_READY);
>> +	pattern_sent = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_READY);
>>   
>>   	switch (pattern_sent) {
>>   	case MR_LINK_TRAINING1:
>> @@ -2522,8 +2560,14 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>   		nvid *= 3;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
>> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
>> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
>> +			  msm_dp_panel->stream_id > 1 ?
>> +			  REG_MSTLINK_SOFTWARE_MVID : REG_DP_SOFTWARE_MVID + mvid_reg_off,
>> +			  mvid);
>> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
>> +			  msm_dp_panel->stream_id > 1 ?
>> +			  REG_MSTLINK_SOFTWARE_NVID : REG_DP_SOFTWARE_NVID + nvid_reg_off,
>> +			  nvid);
>>   }
>>   
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>> @@ -2593,7 +2637,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	msm_dp_ctrl_lane_mapping(ctrl);
>>   	msm_dp_setup_peripheral_flush(ctrl);
>> -	msm_dp_ctrl_config_ctrl_link(ctrl);
>> +	if (msm_dp_panel->stream_id == DP_STREAM_0)
>> +		msm_dp_ctrl_config_ctrl_link(ctrl);
>>   
>>   	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>>   
>> @@ -2607,7 +2652,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	msm_dp_ctrl_setup_tr_unit(ctrl);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   	if (ret)
>> @@ -2787,7 +2832,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>>   			struct phy *phy,
>>   			int max_stream,
>>   			void __iomem *ahb_base,
>> -			void __iomem *link_base)
>> +			void __iomem *link_base,
>> +			void __iomem *mst2link_base,
>> +			void __iomem *mst3link_base)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>>   	int ret;
>> @@ -2827,6 +2874,8 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>>   	ctrl->phy      = phy;
>>   	ctrl->ahb_base = ahb_base;
>>   	ctrl->link_base = link_base;
>> +	ctrl->mst2link_base = mst2link_base;
>> +	ctrl->mst3link_base = mst3link_base;
>>   
>>   	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>>   	if (ret) {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 6fed3ff3a72d..e72d501ac1ce 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -31,7 +31,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
>>   				    struct phy *phy,
>>   				    int max_stream,
>>   				    void __iomem *ahb_base,
>> -				    void __iomem *link_base);
>> +				    void __iomem *link_base,
>> +				    void __iomem *mst2link_base,
>> +				    void __iomem *mst3link_base);
>>   
>>   void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index ff506064a3fa..a924fbd825f7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -85,6 +85,12 @@ struct msm_dp_display_private {
>>   	void __iomem *link_base;
>>   	size_t link_len;
>>   
>> +	void __iomem *mst2link_base;
>> +	size_t mst2link_len;
>> +
>> +	void __iomem *mst3link_base;
>> +	size_t mst3link_len;
>> +
>>   	void __iomem *pixel_base[DP_STREAM_MAX];
>>   	size_t pixel_len;
>>   
>> @@ -561,7 +567,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		goto error_link;
>>   	}
>>   
>> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
>> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base,
>> +				     dp->mst2link_base, dp->mst3link_base, dp->pixel_base[0]);
>>   	if (IS_ERR(dp->panel)) {
>>   		rc = PTR_ERR(dp->panel);
>>   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
>> @@ -570,7 +577,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   	}
>>   
>>   	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
>> -			       phy, dp->max_stream, dp->ahb_base, dp->link_base);
>> +			       phy, dp->max_stream, dp->ahb_base,
>> +			       dp->link_base, dp->mst2link_base, dp->mst3link_base);
>>   	if (IS_ERR(dp->ctrl)) {
>>   		rc = PTR_ERR(dp->ctrl);
>>   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>> @@ -883,6 +891,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   				    msm_dp_display->aux_base, "dp_aux");
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
>>   				    msm_dp_display->link_base, "dp_link");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst2link_len,
>> +				    msm_dp_display->mst2link_base, "dp_mst2link");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst3link_len,
>> +				    msm_dp_display->mst3link_base, "dp_mst3link");
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>>   				    msm_dp_display->pixel_base[0], "dp_p0");
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> @@ -1228,6 +1240,14 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		}
>>   	}
>>   
>> +	display->mst2link_base = msm_dp_ioremap(pdev, 7, &display->mst2link_len);
>> +	if (IS_ERR(display->mst2link_base))
>> +		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst2link_base);
>> +
>> +	display->mst3link_base = msm_dp_ioremap(pdev, 8, &display->mst3link_len);
>> +	if (IS_ERR(display->mst3link_base))
>> +		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst3link_base);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 6c88cc7e3037..a8a6297b37e3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -25,23 +25,50 @@ struct msm_dp_panel_private {
>>   	struct drm_dp_aux *aux;
>>   	struct msm_dp_link *link;
>>   	void __iomem *link_base;
>> +	void __iomem *mst2link_base;
>> +	void __iomem *mst3link_base;
>>   	void __iomem *pixel_base;
>>   	bool panel_on;
>>   };
>>   
>>   static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
>>   {
>> -	return readl_relaxed(panel->link_base + offset);
>> +	switch (panel->msm_dp_panel.stream_id) {
>> +	case DP_STREAM_0:
>> +	case DP_STREAM_1:
>> +		return readl_relaxed(panel->link_base + offset);
>> +	case DP_STREAM_2:
>> +		return readl_relaxed(panel->mst2link_base + offset);
>> +	case DP_STREAM_3:
>> +		return readl_relaxed(panel->mst3link_base + offset);
>> +	default:
>> +		DRM_ERROR("error stream_id\n");
>> +		return 0;
>> +	}
>>   }
>>   
>>   static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
>> -			       u32 offset, u32 data)
>> +					u32 offset, u32 data)
>>   {
>>   	/*
>>   	 * To make sure link reg writes happens before any other operation,
>>   	 * this function uses writel() instread of writel_relaxed()
>>   	 */
>> -	writel(data, panel->link_base + offset);
>> +	switch (panel->msm_dp_panel.stream_id) {
>> +	case DP_STREAM_0:
>> +	case DP_STREAM_1:
>> +		writel(data, panel->link_base + offset);
>> +		break;
>> +	case DP_STREAM_2:
>> +		writel(data, panel->mst2link_base + offset);
>> +		break;
>> +	case DP_STREAM_3:
>> +		writel(data, panel->mst3link_base + offset);
>> +		break;
>> +	default:
>> +		DRM_ERROR("error stream_id\n");
>> +		break;
>> +	}
>>   }
>>   
>>   static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
>> @@ -444,38 +471,51 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
>>   
>>   static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
>>   {
>> +	u32 id = panel->msm_dp_panel.stream_id;
>>   	u32 header[2];
>>   	u32 val;
>>   	int i;
>>   	u32 offset = 0;
>>   
>> -	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
>> +	if (id == DP_STREAM_1)
>>   		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
>>   
>>   	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>>   
>> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
>> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  MMSS_DP_MSTLINK_GENERIC0_0 : MMSS_DP_GENERIC0_0 + offset,
>> +			  header[0]);
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  MMSS_DP_MSTLINK_GENERIC0_1 : MMSS_DP_GENERIC0_1 + offset,
>> +			  header[1]);
>>   
>>   	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>>   		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>>   		       (vsc_sdp->db[i + 3] << 24));
>> -		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
>> +
>> +		msm_dp_write_link(panel, id > 1 ?
>> +				  MMSS_DP_MSTLINK_GENERIC0_2 + i : MMSS_DP_GENERIC0_2 + i + offset,
>> +				  val);
>>   	}
>>   }
>>   
>>   static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
>>   {
>> +	u32 id = panel->msm_dp_panel.stream_id;
>>   	u32 hw_revision = panel->msm_dp_panel.hw_revision;
>>   	u32 offset = 0;
>>   
>> -	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
>> +	if (id == DP_STREAM_1)
>>   		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
>>   
>>   	if (hw_revision >= DP_HW_VERSION_1_0 &&
>>   	    hw_revision < DP_HW_VERSION_1_2) {
>> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
>> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
>> +		msm_dp_write_link(panel, id > 1 ?
>> +				  MMSS_DP_MSTLINK_SDP_CFG3 : MMSS_DP_SDP_CFG3 + offset,
>> +				  UPDATE_SDP);
>> +		msm_dp_write_link(panel, id > 1 ?
>> +				  MMSS_DP_MSTLINK_SDP_CFG3 : MMSS_DP_SDP_CFG3 + offset,
>> +				  0x0);
>>   	}
>>   }
>>   
>> @@ -483,26 +523,34 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>>   {
>>   	struct msm_dp_panel_private *panel =
>>   		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>> +	u32 id = msm_dp_panel->stream_id;
>>   	u32 cfg, cfg2, misc;
>>   	u32 misc_reg_offset = 0;
>>   	u32 sdp_cfg_offset = 0;
>>   	u32 sdp_cfg2_offset = 0;
>>   
>> -	if (msm_dp_panel->stream_id == DP_STREAM_1) {
>> +	if (id == DP_STREAM_1) {
>>   		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>>   		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>>   		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>>   	}
>>   
>> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>> +	cfg = msm_dp_read_link(panel, id > 1 ?
>> +			       MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> +	cfg2 = msm_dp_read_link(panel, id > 1 ?
>> +				MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> +	misc = msm_dp_read_link(panel, id > 1 ?
>> +				REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset);
>>   
>>   	cfg |= GEN0_SDP_EN;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>> -
>>   	cfg2 |= GENERIC0_SDPSIZE_VALID;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>> +
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset,
>> +			  cfg);
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset,
>> +			  cfg2);
>>   
>>   	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
>>   
>> @@ -512,7 +560,9 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>>   	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
>>   
>>   	pr_debug("misc settings = 0x%x\n", misc);
>> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset,
>> +			  misc);
>>   
>>   	msm_dp_panel_update_sdp(panel);
>>   }
>> @@ -521,26 +571,34 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	struct msm_dp_panel_private *panel =
>>   		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>> +	u32 id = msm_dp_panel->stream_id;
>>   	u32 cfg, cfg2, misc;
>>   	u32 misc_reg_offset = 0;
>>   	u32 sdp_cfg_offset = 0;
>>   	u32 sdp_cfg2_offset = 0;
>>   
>> -	if (msm_dp_panel->stream_id == DP_STREAM_1) {
>> +	if (id == DP_STREAM_1) {
>>   		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>>   		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>>   		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>>   	}
>>   
>> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>> +	cfg = msm_dp_read_link(panel, id > 1 ?
>> +			       MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> +	cfg2 = msm_dp_read_link(panel, id > 1 ?
>> +				MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> +	misc = msm_dp_read_link(panel, id > 1 ?
>> +				REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset);
>>   
>>   	cfg &= ~GEN0_SDP_EN;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>> -
>>   	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>> +
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset,
>> +			  cfg);
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset,
>> +			  cfg2);
>>   
>>   	/* switch back to MSA */
>>   	misc &= ~DP_MISC1_VSC_SDP;
>> @@ -548,7 +606,9 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>>   	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
>>   
>>   	pr_debug("misc settings = 0x%x\n", misc);
>> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>> +	msm_dp_write_link(panel, id > 1 ?
>> +			  REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset,
>> +			  misc);
>>   
>>   	msm_dp_panel_update_sdp(panel);
>>   }
>> @@ -598,6 +658,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
>>   
>>   int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   {
>> +	u32 id = msm_dp_panel->stream_id;
>>   	u32 data, total_ver, total_hor;
>>   	struct msm_dp_panel_private *panel;
>>   	struct drm_display_mode *drm_mode;
>> @@ -621,7 +682,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   		drm_mode->vsync_start - drm_mode->vdisplay,
>>   		drm_mode->vsync_end - drm_mode->vsync_start);
>>   
>> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +	if (id == DP_STREAM_1)
>>   		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
>>   
>>   	total_hor = drm_mode->htotal;
>> @@ -654,10 +715,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   
>>   	msm_dp_active = data;
>>   
>> -	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
>> -	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
>> -	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
>> -	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
>> +	msm_dp_write_link(panel,
>> +			  id > 1 ? REG_DP_MSTLINK_TOTAL_HOR_VER :
>> +			  REG_DP_TOTAL_HOR_VER + offset, total);
>> +	msm_dp_write_link(panel,
>> +			  id > 1 ? REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC :
>> +			  REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
>> +	msm_dp_write_link(panel,
>> +			  id > 1 ? REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY :
>> +			  REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
>> +	msm_dp_write_link(panel,
>> +			  id > 1 ? REG_DP_MSTLINK_ACTIVE_HOR_VER :
>> +			  REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
>>   
>>   	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
>>   	if (wide_bus_en)
>> @@ -726,6 +795,8 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
>>   struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>>   			      struct msm_dp_link *link,
>>   			      void __iomem *link_base,
>> +			      void __iomem *mst2link_base,
>> +			      void __iomem *mst3link_base,
>>   			      void __iomem *pixel_base)
>>   {
>>   	struct msm_dp_panel_private *panel;
>> @@ -745,6 +816,8 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
>>   	panel->link = link;
>>   	panel->link_base = link_base;
>>   	panel->pixel_base = pixel_base;
>> +	panel->mst2link_base = mst2link_base;
>> +	panel->mst3link_base = mst3link_base;
>>   
>>   	msm_dp_panel = &panel->msm_dp_panel;
>>   	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index fe4ac3e47e17..4873c55bd693 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -101,5 +101,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
>>   struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>>   			      struct msm_dp_link *link,
>>   			      void __iomem *link_base,
>> +			      void __iomem *mst2link_base,
>> +			      void __iomem *mst3link_base,
>>   			      void __iomem *pixel_base);
>>   #endif /* _DP_PANEL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 295c1161e6b7..1c2d3d8d029d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -162,7 +162,6 @@
>>   #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
>>   #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
>>   #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
>> -
>>   #define REG_DP_MISC1_MISC0			(0x0000002C)
>>   #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>> @@ -343,6 +342,21 @@
>>   #define MMSS_DP1_SDP_CFG2			(0x000004E4)
>>   #define MMSS_DP1_SDP_CFG3			(0x000004E8)
>>   
>> +#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
>> +#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
>> +#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
>> +#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
>> +#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
>> +#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
>> +#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
>> +#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
>> +#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
>> +#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
>> +#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
>> +#define MMSS_DP_MSTLINK_SDP_CFG			(0x0000010c)
>> +#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
>> +#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
>> +
>>   #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
>>   
>>   #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
>>
>> -- 
>> 2.43.0
>>
> 


