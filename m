Return-Path: <linux-arm-msm+bounces-108404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RDzFEUQhDGrjWwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:37:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E70EC57A3DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C42E53010519
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E23E2AC8;
	Tue, 19 May 2026 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zzohe6gS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivgYfFmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD53E16A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179192; cv=none; b=fiqiX2ZX2+q6oz5sH/2sWngayFkDG6B1Ia0wJg7X84VolfRSFy4ZBtto4dwnmoj6gboQlk81LwsYM4K7XbUt0uiMPJtX2qx01C59xS3yrPiiwOJP6iX9tKdh0wNgRIG/YCXGuTkDlEVaW10sIcUrPj+IFT50IVnPVZ5jOfW6rgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179192; c=relaxed/simple;
	bh=K/rZ9G21A41jiPV+DQW8vghQFKHjLiJAg9JcC7dCsRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMlnj8oj6Fxze248BR6PEQ21Cu/Nmst70UiosWfjKAzVYf/O0XzXn5n+pzD7p+hhHB7AeA/zVN5RsRzquY/UUKv/pQmMhTC+xpMwCg1k0dLj3vvc2BtIqYWPLwxRPXTgvSxbY3qT2LbkIyx/OwRjefI85X8X3PMH+2KLFG0JhVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zzohe6gS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivgYfFmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EX253612662
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Mgh8JuVhRr3riiz8W4XnG4JVay72UklEOMvws9zH60=; b=Zzohe6gS8o3RKQV8
	c+/cOjOCfz5t5l6tEtQYizNMOdG35s/HpU76+dG7tf/nqIbUTEhYr1MY28O41wBi
	hbDBzb4barIfE51g1VCc7F5Fc8ntwdTiKRo1u+MXOcnaRdozULG7BZR9Ib1r/iBE
	xHHCp4bC9EWF1xIwzxcoMtYdl4bk6Qe0yBVkfWl9xFQPDV9Dbja+JTG8h7QgCt91
	Vh1nG0qUlN5WBs+QN0XNQu8afqSmJ6D1kr7+Rk8tEXOUqEgvNUJrCKKS/EMP+qiN
	ZzWAHrELpw6xG8xwMc3SzNY04ss7xPOmLNFkJL29r3qSCbyeRUb/+K8Hp2MuMBfh
	keGcaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64r1s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:26:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so5533706b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779179188; x=1779783988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Mgh8JuVhRr3riiz8W4XnG4JVay72UklEOMvws9zH60=;
        b=ivgYfFmz4vZieOpZFBBHDPHaZllvPmaRIyNDr1N4DFDWafpaSKvxJ3+FXHjKatqLRn
         4CVbGH1AHrltGTwlrEluGv9yz2ebIWhkpVO+uT1mDi+bQRCSDGW8Vl0qGq9cGnqKnzCY
         f+XywuqEF0LbFX15oV+m8QZPg3cxDCvtscicbRqNVKz4QAPIPRP6U9yY1Jby29pESWaf
         ROFzV1kYS/+DgrJ6qfOgXuPyQA5iwD6U4Gt9w08l8sY5/Mb035pGx6ga33+RT1zYX0F2
         U9tYuWuS2ySvGPeF1uAy4djBLQBFsi/QHRu4oPtXausmgDLhmpJm7yKW+IIKKF6J2aDF
         woRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179188; x=1779783988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Mgh8JuVhRr3riiz8W4XnG4JVay72UklEOMvws9zH60=;
        b=kfd5TjKRH/p89pe5to0cTK7Z2V3nciCsJ7cNSdHeDdjCk6lHIcM++FvRpioPb5UrHY
         ywhRnyGRKYvhE+r5jTU5lz6y7gEE148iIX33L1nvzxyznGXv8ld9r6UqmQAXdfVfOXTv
         YZievwMoy1xE9u9L31tNgyVZotmu/cRJ/zLvpEiyoMX2+96wrnt0KTnP0oIB5kyOb+ec
         G3ev+r/4GFGd4VLBqXoIKOBh6+aASayZ6Mx02aq7/bUVywGHKurOBRLIjOM/8Abwbojk
         QUiZq9vPCp8QHJ+X+U40XYFFKv8fdpw70wnzDlb0rcctQzvsduJZ3Z/6Z7d0/YRZMUug
         bhYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/51K1SreQN7kpn4O+DBzWHw+m1N6ZTO4QSeyyVQtJakpmzSGDBFzfiufKK+iI6i4qPK+/EiKE7M8r9xA6X@vger.kernel.org
X-Gm-Message-State: AOJu0YytQ+db0fRBf7rTHxnlX3VCbQfFEalel4+/yQhzSvwz0d2vJrwy
	3ceZsqODFdAlk1yfD7SLFD/o4Z48r0RGIP2jcezdJsF2xCO6Nr0jxDCDh5K6nS6nD0OVkQiYltP
	d7TfsHTt5yylFbtUcpn7OH3G8/hPyADQD/WY4F9Pe4N/lVQRe4NuuR6vlnm0yLMmUPCWW
X-Gm-Gg: Acq92OESOmccRyJWxjE/j5WMqfl/DekKrpGOl+MjQr2+xinKoCSSkiYDi06XS1N2mbn
	Yes+6UykbookbeCQ6tTw9E63OIHAv9liR/GCoSseoqIpIXWMg3pEDkTe7RSk09qrVTSCgUzgFy9
	nrtB8pyWIzxMrXAmhSZrWBPgeP4ry2K37DXyXmPj0d7xzmObLwojVAUHXCnnDrUAGEmMjgLdgSa
	KOmNW59zIgQ+zdAsPr+t7yvB0h7SlJC+/w4uz2MwPgOdMz4FrtSy1vobIgKyGn5+7mxjmy8vmtW
	mZt+4EKOCN2gwlFF08OUdYNCYk3eOmo7eQKzIe0wlT9+wnYDX2hYAMeD31arUe+vNy9N58D8SNN
	IhUu6NqNxzmjOLZwvKROIMa71lA8GGrVYvkGMfAt4LtBWxvSE+6+sen1Q0d8xi94XpQ7Ic1exxR
	P8jUOWNL47xHlzza11Dg==
X-Received: by 2002:a05:6a00:2d19:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-83f33b2f58fmr19216062b3a.14.1779179188124;
        Tue, 19 May 2026 01:26:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d19:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-83f33b2f58fmr19216012b3a.14.1779179187505;
        Tue, 19 May 2026 01:26:27 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1966471dsm17467943b3a.6.2026.05.19.01.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:26:27 -0700 (PDT)
Message-ID: <a018705f-13c9-4e96-995e-b358778b0996@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:26:21 +0800
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
 <nzouhzeoimf32nwbm2qjecopildvmlay4t4xxshufsjaydmwlc@bnfom377r5b2>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nzouhzeoimf32nwbm2qjecopildvmlay4t4xxshufsjaydmwlc@bnfom377r5b2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MiBTYWx0ZWRfX2ZpIZPe6LGcN
 dbOjcaYnvDA1LkDSOHm4BaNaV2q2ZAqGHbwPWGgF8GdEqZMPh8ZKebEqcmftgowQp7yblIGrB4s
 ZVVUb0vhpttGDfmo7u3Q+YpKAdQ5ksdHwboaN7YnkgBc0xS1YlUqC+/436HOAqjDcvEqtZRAyku
 Mg2yfeFFrp7Efv9o+16AFoF+g3Yto9uqLoF1+M/qGpyUrcot+H43p4JirwGmd2IUScmgxvG6tHY
 tJRo5sDg6R/rEqGwc/n3FaOIL5MkwGUU9yzdq54asNeFgMTmayAWftGUHHoGt3lqwayOrEQWao/
 HkChYjIZd2Nzl33kNSNLMRySjujRQDAxretTIPf+4CXR+SLRczWbg+fGpueCnnWZxrPgqGeLdrX
 ez5+Y4UTzGhg5ZaSuNJcODCP5tz7SAcsOWW5ujCnibxBNg1OR5jcz2gmTOnQ5kB9Aq1esaoCKes
 A1k2IXmd68eKjGkAneQ==
X-Proofpoint-GUID: EGZr1gZwxqBV5DeXMd5ymxiqWU91z6Dy
X-Proofpoint-ORIG-GUID: EGZr1gZwxqBV5DeXMd5ymxiqWU91z6Dy
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c1eb5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5QDKDTwAGq_DmF9AEKQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108404-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E70EC57A3DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 1:55 AM, Dmitry Baryshkov wrote:
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
> 
> Please mention that panels are going to be dynamically assigned to
> actual stream IDs.
> 
Got it. will update next patch.
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
>>   };
>>   
>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
>> @@ -2176,39 +2176,40 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	return success;
>>   }
>>   
>> -static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
>> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
>> +				    enum msm_dp_stream_id stream_id)
>>   {
>>   	int ret;
>>   
>> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> +	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>>   		return ret;
>>   	}
>>   
>> -	if (ctrl->stream_clks_on) {
>> +	if (ctrl->stream_clks_on[stream_id]) {
>>   		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>>   	} else {
>> -		ret = clk_prepare_enable(ctrl->pixel_clk);
>> +		ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
>>   		if (ret) {
>>   			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>>   			return ret;
>>   		}
>> -		ctrl->stream_clks_on = true;
>> +		ctrl->stream_clks_on[stream_id] = true;
>>   	}
>>   
>>   	return ret;
>>   }
>>   
>> -void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
>> +void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> -	if (ctrl->stream_clks_on) {
>> -		clk_disable_unprepare(ctrl->pixel_clk);
>> -		ctrl->stream_clks_on = false;
>> +	if (ctrl->stream_clks_on[stream_id]) {
>> +		clk_disable_unprepare(ctrl->pixel_clk[stream_id]);
>> +		ctrl->stream_clks_on[stream_id] = false;
>>   	}
>>   }
>>   
>> @@ -2228,7 +2229,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	 * running. Add the global reset just before disabling the
>>   	 * link clocks and core clocks.
>>   	 */
>> -	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
>> +	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
> 
> Why are we using ctrl->panel again here for the stream-related
> functions? Didn't you got rid of its usage few patches ago?
> 
For MST path, we pass panel to the func. For SST case, we still need to 
pass the sst panel to func, in here it is ctrl->panel.. in dp_display, 
it is dp_display->panel.
>>   	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>>   
>>   	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
>> @@ -2238,7 +2239,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	}
>>   
>>   	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> -	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, ctrl->panel->stream_id);
> 
> And here...
> 
>>   
>>   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>>   
>> @@ -1451,6 +1469,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0);
> 
> DP_STREAM_0
> 
>> +
>>   	rc = msm_dp_display_enable(dp);
>>   	if (rc)
>>   		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
> 


