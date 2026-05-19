Return-Path: <linux-arm-msm+bounces-108385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM/dGdMQDGr6VQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:27:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC40579084
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C44763007BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4AF3CF025;
	Tue, 19 May 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RERe0nhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2RB1BT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA0F3C872A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175629; cv=none; b=Xo/udhnvsI2J/SCeleRfb3fkAVUO+/bN1fm8LyXlB5jB68/bJcZr5MPZLdbwUxbicUOXYB69H/698g67O6TYCH7ufDjJcBTqjqHN4yBwzcfH9sDQPa6+hS9HYwNH+p8jkfbdvSQlk7K18dKo777MWgPA6XD+uyLz79q6Y4zW2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175629; c=relaxed/simple;
	bh=v+IdkKQNQEB4PKIbUhLb3vJHN6L0jkaJPJKTaR8XEVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3YgZ853dvdSAA0VXyB0JJ7cQ57ZdE4CvubkYM/OMx8pLsdqNhS/aKqCJ8UZqopy9r460jveGamqVDPSUdTOuiEngsXRRNpHC0GaKQ54eQcrh60WoJSqpiCu0PgfnWaFOFKi/ZX37MsQbcik9EUuPf8bBL8EpYqXsWV0wqAW+WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RERe0nhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2RB1BT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J3TMe82091139
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utMyKzcFS3nlxzF6C6V7bnijzPGvaVgfCyXA1B5b1iU=; b=RERe0nhLWi4CRDxh
	g2MAN7OG8I3bFpm7BKfHKN1bSo6r4WioWuKjw0hYomEzET0+WMKnkwd31Bz9YjtF
	nG5y2E43D2CHO9V6tmMnsqd2ktDcKFxSMqU62jtP0AlY75pHAWmYpe+679LMWxnh
	CzWvJALzJTnNclcaQtQNXbXz8sQkvTE745L3WuCTNxEijECJAdD9OsRIQpNvAiLK
	wmQNqAov4VBQwMQoD2+JCwpOyryLYTo+H6NrVIgC0uyQfQLUv4eafXaQnTH1j+/y
	KMm6ic4P32jVbW2HNJWpDpGlvQzj0WrI+fMWsDVQfSZhOWmP6bTuQzhXYxFOzHDh
	RcRHlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpmaxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:27:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so34685255ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175626; x=1779780426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utMyKzcFS3nlxzF6C6V7bnijzPGvaVgfCyXA1B5b1iU=;
        b=H2RB1BT2fLVBEa2x7i7PnZPSyrTE6B381ryCu+SCNuVMnFhtyPcL+5A7DPMbgfcpL0
         2YERY62ut0kW+KsbCD6gHrzaJzKqiAYxjpx3qOG/OsejDNo1Iq1/GJw7tZ45y0pY+2aY
         qJMQo4uVPzOa0cGeCSk4kGPmbmti83DpxYIw89VLrqLGV2XZqksjBUYTcnVgy5/bcwMl
         BH1E4YJJwQNMMJtDqNXaS2pHnPBQMjVgfy8EB7U8bgnmQa4Aws3hgRTNuIe981P1pVc4
         StpLWSgNNLmsoOz8WVYQdsSj0MoJ6nNThLZcF+KaYItuLXoyfBEboxYZ5ZXrv87c4tjM
         XnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175626; x=1779780426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utMyKzcFS3nlxzF6C6V7bnijzPGvaVgfCyXA1B5b1iU=;
        b=pUMCXzGUzVL0b833/JWDKVMXxhxPWkfJOb6/8khlc4khi1/Ati8iZWN4KSNwPBNkPB
         XXgVEN7suKEzk1FdrHvk5KeCu2K56qcwI4Qi6DTy+GTfZDZzho/lLj/ousdTPELBWA76
         D35sGyqCB+OAQm2LrRZhp+UlD9H6QnxyfjUi+JM0lfFGszhJDuKi7YoBKJbI8vpH9lT4
         bmKZg6VmxaqU9UkuH9DkRTtSXTMFml+T90d5Ov/pSW1pNF9sKe2KjCEZ600HD9qWn9KI
         uTkjSjupQELbW0qix3p4HFYDsfQ4yFOtL0iJ3cXH7gypWUE9L/xCBGuxhoPXrm+e4K9R
         ZyzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OxBOwlatb/aPrMbcwFDBm9D72azvWQH8em/DZj58yvgqp5EK+6fr+XPErk9SKc8WlNvHTJ4U/9vrxNSLo@vger.kernel.org
X-Gm-Message-State: AOJu0YxrNJviKvDVrof/wX/ENcxMMI+pXGQvH55JiH8YUbcYtKYqv3Qh
	IEiKfaQAMZP6QbsAaY7+H+UFA8jhuwCB6c/HOL1uYHuQhBGzGHVx+3tKu7QtDu96kcGW64sMK6g
	DcagPF7z8imog+pZk2NwlvU28r8B7Sj8P7k945lv1eHNebtSCSbemUeAuevM6PwPYLMwM
X-Gm-Gg: Acq92OHPN028SdIKQjgWcTDL/v89HPXB1nYUi1KirlA5VWppncVPfgiw4Q39d+Q8cES
	f0mW/TebL1SlHjZUwtKP82dJhn7bORrPqpZBu/6cHN/UG0DtGqPxOe3J3d6l3QyrHwlQ+9LDLwx
	IdZ3dczKbvkQwjSFCA9hVMccynzVfVt2IEHMgF7KtLPyhVQqCAIp1Hc+1rnEZHIuJ1FC6KhuWHr
	3uWQH9IiZER4D3Bx7ROE5fW2kEt9BXxrio5oNy2uEPfbKPQDfJ5r6a42UL0giU/uOWR6XikCrmS
	hRbIpNQ4AskdhPdTDrVSGkn3+JFBrrEGBRkhJkXRL7L6jrKx1iE4h5WsE+V8qFiL9LezR8XmkSi
	OhTIZSomBYyLp8s45I4qb0Br36OMZu2WbUNUXy2LjWOIICttJEJWiSPcChxvC6SxuHIlhpE6I94
	LAt/7NydWTsc3THtqd0A==
X-Received: by 2002:a17:903:950:b0:2bd:a3c5:6d96 with SMTP id d9443c01a7336-2bda3c56ef9mr137131295ad.14.1779175626142;
        Tue, 19 May 2026 00:27:06 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2bd:a3c5:6d96 with SMTP id d9443c01a7336-2bda3c56ef9mr137131115ad.14.1779175625661;
        Tue, 19 May 2026 00:27:05 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0605ddsm168210415ad.32.2026.05.19.00.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:27:05 -0700 (PDT)
Message-ID: <b02965b1-3805-4ac0-8772-aa832f192756@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:27:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/39] drm/msm/dp: remove cached drm_edid from panel
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
 <20260410-msm-dp-mst-v4-1-b20518dea8de@oss.qualcomm.com>
 <7cnjdge435t55s5vf66fkjfmkz7jvcbbax2uuismyc74mv4eia@toe2vu2folqa>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <7cnjdge435t55s5vf66fkjfmkz7jvcbbax2uuismyc74mv4eia@toe2vu2folqa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AquDkkSx7n5P0wVPCsfMtubS9BywMJHw
X-Proofpoint-ORIG-GUID: AquDkkSx7n5P0wVPCsfMtubS9BywMJHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX1oChT4wLox4h
 5snph+IS+j0wuEAI2QshTFFTotjU7mzeNVBF5xEtgclQmH1CZAQCNBhwYYA6uhJ6FfJjGxkIwTT
 ePXjMeNRLqgdLtLaRzCSvCTQZSxKm9lkE7HgNwxIZrjpIaHjHDJykts9DLnq6IFsC5gpo2cMw9E
 GFFzzVp/cGV6md5gXixLdIf+d4/96ELWr+RQ4rfJh1ejGZVT7FngipjCJfmGTTAGoxGuytqyUwq
 rYgAoDKnMFekC7aB57VtI5hMYJQPBKbqRef/5y1E33j8x78ZeDqvP0EEUNVUQstiKtc2hnoePsf
 Axd0EU/1HmPinaGXhynwTz+DA9bAvPstKIJP/VC9BN1O87deyi5wxemyla4TGxunsiye+lc26Oe
 m4smso2Ksy7LCNtVBOsHykXAK5JAOb8GkMu18HZNYoEWs2V1NcaU9lGFtT6qCyyXP2C86WsGPfQ
 NAs0KHdURXsa3jvf6HA==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c10cb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kvofMlIKq05Gu29qcYUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108385-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DC40579084
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 9:52 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:36PM +0800, Yongxing Mou wrote:
>> The cached drm_edid seems unnecessary here. Use the drm_edid pointer
>> directly in the plug stage instead of caching it. Remove the cached
>> drm_edid and the corresponding oneliner to simplify the code.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 57 ++++---------------------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++------
>>   3 files changed, 26 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 5c6a24ec140d..e28cc1bbb5b1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -268,6 +268,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	const struct drm_display_info *info = &connector->display_info;
>>   	int rc = 0;
>>   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>> +	const struct drm_edid *drm_edid;
>>   
>>   	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
>>   	if (rc)
>> @@ -275,10 +276,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   
>>   	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>>   
>> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>> +	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
>>   	if (rc)
>>   		goto end;
>>   
>> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> 
> Where is it free?
> 
Ohh, i miss it, will update next version
>> +	drm_edid_connector_update(connector, drm_edid);
>> +
>> +	if (!drm_edid) {
>> +		DRM_ERROR("panel edid read failed\n");
>> +		/* check edid read fail is due to unplug */
>> +		if (!msm_dp_aux_is_link_connected(dp->aux))
> 
> Does this work for USB-C AltMode usecase?
> 
For USB-C DP, i think it always TRUE, here should already existed before 
this patch..
>> +			return -ETIMEDOUT;
>> +	}
>> +
>>   	msm_dp_link_process_request(dp->link);
>>   
>>   	if (!dp->msm_dp_display.is_edp)
> 


