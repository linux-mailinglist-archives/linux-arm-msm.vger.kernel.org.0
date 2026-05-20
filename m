Return-Path: <linux-arm-msm+bounces-108681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDhOLaiJDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:15:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67F58B848
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCE430226AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB8B3D348C;
	Wed, 20 May 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NP9aFQw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3v2GhNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788EC25742F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271757; cv=none; b=cEGEiTeQtMhqIPDDZfNcfG5D9sIrevQZp9F3I8UP/s01XhDmds3JQkPSXbdDZaqI6IsQDvVMJUqiX0mNJay82IhFyY8YcOF5zRgnhHJw9vfFrpmmgc3DAjI1EQu/mFujCoQJ46dROakYD0S/CLA6Kqp5bqwkMxuGknW3nTmsv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271757; c=relaxed/simple;
	bh=B9I2PYfFIw8vVvTlnWFte3i2pKBUtm1OmE0IIWmSrgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kY5JnqCBVvLFrgO+Iqr/UiKUsfh19pOWEKoeuoNr4LlfcEDluZnU4UyUdqpOcS3ZScts5UbGUE147t7UaT1Gpf5vdQ8oUIMPCODNTegi8IItTxGS2naZq66VdnJ2Q9gK6t9VhUnB5MjGcEvQXh49Q94URTL4OpVAFiPJBirVa3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NP9aFQw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3v2GhNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6sv7C1237939
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHGk75E7eLjI45U2CcQdvR/hLoIhsg/8fuLIwG1HhaA=; b=NP9aFQw4fm7IcsSa
	7k1Isziv6H8wTtRzJXcuXUraxzQO1VdOLxkI0UQ5TU/SfGRBiUPFtqFLJyWZXRYZ
	CJc2BlyunsZIRto49X/TBtv+rpgpdy7EckCK7QXGWxuGEwlL+DW1l7QrsvB2lKUR
	ED2A7gWTr1bFSYTmxmRG+ijju0qhJc6MS6IAnQhAY/E7mwwj6G7yjrOF6cFRaqv/
	GwKGrSc3wnkB0AckkKZ66KpTx1OdiCivqDWZ+0toBNuYjf9+J+fWuyoX8TJZhb43
	7JeW/fgg1u56BsZfc5o6Ijko2HTlyMdhGt82ALB9Fc3IwAiJQrOfmaGmp/il91kd
	JYzsyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sv9fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:09:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835423c69ffso2510500b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271755; x=1779876555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHGk75E7eLjI45U2CcQdvR/hLoIhsg/8fuLIwG1HhaA=;
        b=F3v2GhNT3Rh7Ji+kTKptM3FvnGKl/fMEdgukRjNRXGroWwnt9qZu+e6jPM00VG5ULu
         U2rnAVbYpq5oIvDDtO5WujIMKiYrKZbOUEIThn2hoUX8G8ygm1eIWDP0+iK71ttjW9y9
         JmTuRYBH9p3AN+c9j2SuPFcs+bFQOKF4W6EqcaFlK1vesaPftWlTZ9+iFLptIKng3fkH
         4KEszd5M2rtBxtBUrT0OSaPqZMFJF5ipTMoPOqH6EhzjDyvPYLFRiPT0rWN8RXaO1ptX
         rXOezt0BRmuOwDMUElEM0UioQzrvybkHscia65wxOiU8naxh1gqx5YdmpRD/BKbb6l0M
         IIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271755; x=1779876555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHGk75E7eLjI45U2CcQdvR/hLoIhsg/8fuLIwG1HhaA=;
        b=NA/z89C0hCkgnly2U7LXN2570R9GVxq5pVplq+n5ex30gger+KT3iNrp/FURmQqzc2
         xJdxRm1117UKDJlFyae8IUiyFfAFuOOsCovWPIfkyiMGAhKG9lfKgQynZ93AU8+giYq8
         cMppDRzT2Fd/wbeR2+rLmz4054JUkcVXHFl8zbHostHnrgEsAmTdmX9V37KZ6gZxnr24
         ef/nD/qVdyWZtqiiq/K4yQyIXbKEBtcJyD3SMGIEgKLt5Ge/R6R3wXJ90DCERWIbqcgi
         BsjK1gL4M9HlQ40Ensva7ICst4rtMjJ3zyieeJYKC6BE8zrZQmZEpabp84NcNFamdNYJ
         dyYg==
X-Forwarded-Encrypted: i=1; AFNElJ9wdp7vM/wp0IhXefLlrXVLTx5dhUFqEF03YlTBiZjadXr1rsktHTMxcr4SdkZ6De982lb6aTqOzveGLIsU@vger.kernel.org
X-Gm-Message-State: AOJu0YzoD1bEReGhidrQjw6E9M8CbkDuKS1YOcUV4sPKuzhBDRM+gVbK
	6e2MGOFQfzHgRrjJrBDoZfPZcUQhRS0ROef0Yh8GjosEZTkWQ3jdX9DwyRy1Q4WCrKkQP2Xmofj
	98L+H1x39jOtQ2MkLZxNDldcunO7jTmKasHLcCowvVp+UCyOy9SpmDfVA4xVe1U5V5PYr
X-Gm-Gg: Acq92OEvjjMBgob/XkxdhsTNU3D80WA9ZgKb7ckldO+qKl813umixYd9H9DdE2lgBGJ
	8G/jPgqJSI6h5UcXB8b8rcxGCmJt2D88QKAbuCTAOUqlAoPxn8EsZsk04aItbUrTMFHGBKcyNlm
	GsxecVYdsec5OBivPsesBTZDIDTjUOqI4XSjYACPVJI1pfp2HvJAEA4Sa3L7euXF/84FvMIJVNf
	o6d6M16X9gBg8DsFADNor0W2hcoyCAytT9WthsPKKzJYs+y+IzSWRdgPuaHDDOdfpAMUW/xfIYr
	CZki0Ry3jy3whdSBte6tXp4ALuCQi5WzKq7AaZVQygzueLuxYI/XrVMeHfnmCQvraT2MvrAUwFp
	V4krmmJhoR8ceISiS7fm4RZ2EWzmaxS9lMCREW00Rp3f3TxRKzsj8xXWCJSR6yFBxSs8ruZn15g
	O8hVT45GKtYJvlFe2Qtg==
X-Received: by 2002:a05:6a00:12cf:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-83f33d20555mr24402847b3a.44.1779271754716;
        Wed, 20 May 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cf:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-83f33d20555mr24402810b3a.44.1779271754119;
        Wed, 20 May 2026 03:09:14 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b296sm19190671b3a.32.2026.05.20.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:09:13 -0700 (PDT)
Message-ID: <06243b67-27a0-4ab0-ab31-8d4d6a555a57@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:09:08 +0800
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
 <b02965b1-3805-4ac0-8772-aa832f192756@oss.qualcomm.com>
 <k477w6qrrqugfjnnzj4h7f54ahehgpws2xfjgcyewqsakplnzl@e5wj4aqwax7g>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <k477w6qrrqugfjnnzj4h7f54ahehgpws2xfjgcyewqsakplnzl@e5wj4aqwax7g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9pfn9Ynm-EocmcKi7XW0KmQSMoM8v7VG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX1azVfNkNBfqr
 dvZlX4xkJ7LdeFAl7cY6Ey6IPpUyGbZFwYw+mQruBpZGrSyeL4ywWKX+fI6sckoK0LVOc2Hf106
 O/U2Ep4MwBfNPkqhZ26BoF+vYoChI5fufZKFBMRfiEeQ6lQwpkzVJ+NFFFluGkYqRxFrD/20qE+
 +kv0xdzUv6J3O7wwmNs7xSQyf9okNwuhmIqfo7MFVzyQzzXhDhhvN6iLsvGnSqqeYmZsLEZaqbb
 0JjTvmi6Ujvv5v17CgIDufBEmBpFpU4NJU43TpN0Y4cB0HQIWIASIM5vv30lyCv9p2K5/QP1Od4
 +USz0F7pR0OtyP1sF9LmWBFg7DzjxdR+z0iR6eZKt9rx0FYuSqSnTAXuQp+lyX3ECatPj6qpizQ
 rdh0ORCAOntmrn936ca4J50bibiIjH77LuhIaIRXzv2LSKMuBe8w2CvcD6UCGnMJpFqLVmkbVY5
 Td+thtXE9E3E7W6MUXQ==
X-Proofpoint-ORIG-GUID: 9pfn9Ynm-EocmcKi7XW0KmQSMoM8v7VG
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d884b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=i31FdzyQ29aSgmU6y3EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108681-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A67F58B848
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 5:22 PM, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 03:27:00PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/10/2026 9:52 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:36PM +0800, Yongxing Mou wrote:
>>>> The cached drm_edid seems unnecessary here. Use the drm_edid pointer
>>>> directly in the plug stage instead of caching it. Remove the cached
>>>> drm_edid and the corresponding oneliner to simplify the code.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++-------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 57 ++++---------------------------------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++------
>>>>    3 files changed, 26 insertions(+), 71 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 5c6a24ec140d..e28cc1bbb5b1 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -268,6 +268,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>>>    	const struct drm_display_info *info = &connector->display_info;
>>>>    	int rc = 0;
>>>>    	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>>>> +	const struct drm_edid *drm_edid;
>>>>    	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
>>>>    	if (rc)
>>>> @@ -275,10 +276,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>>>    	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>>>> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>>>> +	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
>>>>    	if (rc)
>>>>    		goto end;
>>>> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>>>
>>> Where is it free?
>>>
>> Ohh, i miss it, will update next version
>>>> +	drm_edid_connector_update(connector, drm_edid);
>>>> +
>>>> +	if (!drm_edid) {
>>>> +		DRM_ERROR("panel edid read failed\n");
>>>> +		/* check edid read fail is due to unplug */
>>>> +		if (!msm_dp_aux_is_link_connected(dp->aux))
>>>
>>> Does this work for USB-C AltMode usecase?
>>>
>> For USB-C DP, i think it always TRUE, here should already existed before
>> this patch..
> 
> I'd expect the answer without the 'i think' part.
> 
Sorry.Add log and tested.  For  USB-C AltMode usecase 
msm_dp_aux_is_link_connected() always return 0.
>>>> +			return -ETIMEDOUT;
>>>> +	}
>>>> +
>>>>    	msm_dp_link_process_request(dp->link);
>>>>    	if (!dp->msm_dp_display.is_edp)
>>>
>>
> 


