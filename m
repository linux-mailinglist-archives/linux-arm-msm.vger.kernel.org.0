Return-Path: <linux-arm-msm+bounces-113107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r++4Lg22L2rYEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:21:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2D6847BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:21:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aRvS9J3o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RrJWpHWr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113107-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113107-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CD8F3008244
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AE53C2BAC;
	Mon, 15 Jun 2026 08:21:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0833BF699
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511686; cv=none; b=rokjL8KMKdw539Igfdccj7iKGukOVkvkA3HZFyQahFzSttk0mRsebJ91khKXxcKipWtInbmpu6VWYEvIK6H2mZt0jZFnWmtqpmges+KgJIhVr0O6Qaw9y4492z/hZ7BA9CgD9ux5JAkpFLT6f5WFsD/LT4iYI/ipvOiwVeuz7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511686; c=relaxed/simple;
	bh=SkRM64/PaCs2NMwLC44blmckDFHn8ppXw7hxikiu3z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgoBIg9qtAoLzQ8Q5v0uBqNhy/NYrTxM5JLNnz+ex0KxR6e4pswFBbSi97Fa8Vj8651XpiqiaMapLnDEcsCnvQT8cBR4n3gZhqvpuuBLkWPnKgm3wEQMax4u3g2+rdY/pyZdn1utQd95nr5w3FSjN1n9+Q7jhBEYP7AyYnWZ1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRvS9J3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrJWpHWr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7Ttnw4091183
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jh9qQ64vhdd+i5nKcCF5rY6x3m4t/2guKy8l59qHNtM=; b=aRvS9J3odn3Uqoyc
	kyPG9BbDc+rWDyNv8m3MxrYFLafuxqnDoVo2HQ9eEshNwO5ukk8O9kWJuV/P6YMt
	5tGf+Tg7HsI4LkIZU1eN7O4PiKFKrl1tfC157CMtW6voxPaYB4aQKlKZ/WcQZw0T
	nfYMbQTM3xJXHba3/adpXUkAbzrT1VO8icnoH8y/0di6u3AV5S1r+YzPvN3hCMlH
	5QGrcxI+Hq8OaVbuqwddCqsbLw897jjYU4XW+AngBHbfD0BdeFWHtna9Tt33rrwT
	zTHT5Bo66I7JusHqLUF1OU81ikxdXAlat6nomjfJ6CB1X61eCCsG8vLCF7ORMDIm
	I2jeCw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c8661-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:21:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423970cb30so2162711b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781511682; x=1782116482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jh9qQ64vhdd+i5nKcCF5rY6x3m4t/2guKy8l59qHNtM=;
        b=RrJWpHWrcv+WHKn9j2lCChGHQ7FG2pZD3NfO885HLr2dV7DHs5eNw7wmjT9+MPR6cf
         lAcCpHflVpuM2NECgI71NnDSF3MzqMLnwCXnEKk4woYm/ZT4oQFfr9FThBufCQnG6bMJ
         Y9hZzOAqA5heOg/Z12eFbYL/Vpz+9r3PDpgRGqgwakKmAYhyfnFwcUDfJsutxLAWcvP/
         0lJVc2xtNuPVKbwGw41EeU+SBaJ5gUFNLBKjgRbSviv+EmowiOFnwMMFt8T4VP6tAeWA
         G2cKWeK6GWiD+9qJRBtNsgm/C7fuh/A3X1HIG2nTFJd8U7iT5CUj6HqgeoV+cqOa+Ncm
         u1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511682; x=1782116482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jh9qQ64vhdd+i5nKcCF5rY6x3m4t/2guKy8l59qHNtM=;
        b=W8uCYx6FeA5whLo0d0G3Dx7qGqvsyYhy4SBXkdspNi5v3xSFVjPBhrnrevuZYLWojf
         g4o4XiwZnUR74fPEU7jtiQviz/WWl82TmHUUWGxjjy1Aok7fGY5cRVrDhz/3UFk1yKQh
         yCzCG2Y+s9mTIlMEHSTlrMqKpUi+7l8OLbFQ/m9d2wLYz+dy+V6loORKnklpLJjLfobD
         wyP38NnocY2095UvzJezDagX94+DTNSpx7/GUabRUflYDss3AoPpq7Qa6o+R7ewnj5uc
         s4b3KK5//mUDvwMibNpeFF4xZcCVh6AVj+sU4TeKZnvA+UTcMTRSq2xVcos5pGZmSnwz
         0NUA==
X-Forwarded-Encrypted: i=1; AFNElJ/wUBei0fdwd1j63d0sXldV7lASvP93xDMbCkneLBHTstDf2/YRUu0qzmlTNqQkBxrMvQkDe83Q2yfjEIcl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CiyVAKQgkVMWcraGIdpN35de7zAqrb+kqbBXNpJ3rFA84lTM
	6X5NOFdH3cJIjvBG1wCm/542akrDAcjKLBIg13NYNPv6xWdXQ6MbIoi8fDkz26oNJTAXP/Yf1pf
	N0hss1s++FnqsqW1+Yu++p8O/8YRfzUmqC4zHI2vFU4rXonjHSckDzuPzr98UK7LvWkh9
X-Gm-Gg: Acq92OF4LV9GvH2BBTSvuA1ifVMJ65jI3we9XT2VFnpz26LQFgDByha8N7bghSKYCmn
	Dcjuf42kiRt8azrHfqtyQX0isjJxTkE3p9ei6A1mVFwqT1Kqu1Yo1T0A5v1VfrCBeH5qWJWMmJ9
	emro0PrXqdOsg7jPei++yOxNVwqk3MEUe6ZspOIHBjUubXpXTpQzHW1wt7t47jS168Pp0pbI8ph
	BL1buFF3MX1XMSu+7aQkXm/0XNkNfYyhFyekDmdGqvCfvL9gyEE8ThlxUpfFhIQ9NwJnoWGRqz0
	GNFXJz5uyNzkALKlCoVC+WwEbe5yZiHNw1jQSBrL3H07Yzss8pZkY8smg0Lapd2bvIwd3Hj+gj7
	eautbWoTlgP1xLBHWy219P4a+WfVNDJ2v02DM1foPJYF0xUMQhFvnnh5M8D5uRaR9iCd2gvy/sn
	XjJnMX3dpVcrJp+bd3+g==
X-Received: by 2002:a05:6a00:3e0b:b0:842:6849:2180 with SMTP id d2e1a72fcca58-844e1a7f928mr10159625b3a.37.1781511681649;
        Mon, 15 Jun 2026 01:21:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e0b:b0:842:6849:2180 with SMTP id d2e1a72fcca58-844e1a7f928mr10159587b3a.37.1781511681154;
        Mon, 15 Jun 2026 01:21:21 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf4b5csm11376122b3a.23.2026.06.15.01.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:21:20 -0700 (PDT)
Message-ID: <49131a73-f60e-4296-a6d4-5ff59331a9dd@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:21:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/39] drm/msm/dp: add support to send ACT packets for
 MST
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
 <20260410-msm-dp-mst-v4-18-b20518dea8de@oss.qualcomm.com>
 <6jkqen322yklhb4zzoj2kcgwayhcqm3mhnbrkgimr7zubwewao@gmuopu6uxakq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <6jkqen322yklhb4zzoj2kcgwayhcqm3mhnbrkgimr7zubwewao@gmuopu6uxakq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4NiBTYWx0ZWRfX1oTeOVJHHB/Y
 aVYX4Q4SfT6bsh93tf0GnM7SfWA+BCVLr4QslRiLqDNqGP5VJR4WOZjW6VfQdHt78c056+gOhBE
 Ci0r4GL37Lz3CCVeE+aKy4owbFgcRhwhoBY0RKAmSkZUnN+LL29QeoXV7G/ffhUplpx1UQeGBeB
 NjtdLp9WrcN8qp25uVUiWrT/wKJ/c2P+d7t6vEG2GV0pp3kLnPDpYD6orkqsj19gBqeYOkcgMmg
 IZ3wq6ufIugXU/+SRRIeqe+CzfKvYkr0mNdC1WUnTxCQoBEDy/eUQDafrrOE0IM5Es0A+5luXbB
 orIcCRgCMhcafLuoiq+Pc7uTyMRnConnL3pg2E+1qCDM4todsRhlVJC2+gwvUmwMz3AsVhqzYJH
 UkIluGqykG+lJiHXnwPg7VDWqIAg1ZC/1cg1qAgR5gFv1pLVvgsl0n/S1y9p8HGTvmMQ8ZRegIK
 QRpVfFrdAwwmi/gWXag==
X-Proofpoint-ORIG-GUID: OTjs2pvLzqXHOuIOj6kIj2zoTiZeWPOW
X-Proofpoint-GUID: OTjs2pvLzqXHOuIOj6kIj2zoTiZeWPOW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4NiBTYWx0ZWRfX/jnixATTBQQv
 ALNObClflK0rgCV3KKgYcEcTRZczASjeWXIEYLCnso9MbgWWX2sSOaLdf1VWTa7shI3N889iwQi
 BJPvDpbvbshSnSzLQGpV/XA4LzR3W1Y=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fb602 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aNidHKw51tL1cJfPzJcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EB2D6847BE



On 4/12/2026 2:57 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:53PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Whenever virtual channel slot allocation changes, the DP
>> source must send the action control trigger sequence to notify
>> the sink about the same. This would be applicable during the
>> start and stop of the pixel stream. Add the infrastructure
>> to be able to send ACT packets for the DP controller when
>> operating in MST mode.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 43 +++++++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>   5 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 1109b2df21be..6f25145ef214 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -143,6 +143,7 @@ struct msm_dp_ctrl_private {
>>   	bool core_clks_on;
>>   	bool link_clks_on;
>>   	bool stream_clks_on[DP_STREAM_MAX];
>> +	bool mst_active;
>>   };
>>   
>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
>> @@ -228,6 +229,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>>   	return err;
>>   }
>>   
>> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +	bool act_complete;
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	if (!ctrl->mst_active)
>> +		return 0;
>> +
>> +	msm_dp_write_link(ctrl, 0, REG_DP_MST_ACT, 0x1);
>> +	/* make sure ACT signal is performed */
>> +	wmb();
>> +
>> +	msleep(20); /* needs 1 frame time */
> 
> 20 ms is 50fps. What if we have 30 or 25 fps?
> 
This hasn’t been considered yet. Do we need to change this to wait based 
on the per-frame duration of the mode?
>> +
>> +	act_complete = msm_dp_read_link(ctrl, 0, REG_DP_MST_ACT);
>> +
> 
> Nit: drop empty line.
> 
Got it.
>> +	if (!act_complete) {
>> +		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>>    */
>> @@ -2081,6 +2108,10 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>>   
>>   	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>> +	ret = msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   end:
>>   	return ret;
>> @@ -2277,7 +2308,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
>>   	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>>   
>> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
>> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
>>   	if (ret) {
>>   		DRM_ERROR("failed to enable DP link controller\n");
>>   		return ret;
>> @@ -2357,7 +2388,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>>   	return drm_dp_channel_eq_ok(link_status, num_lanes);
>>   }
>>   
>> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
>>   {
>>   	int rc = 0;
>>   	struct msm_dp_ctrl_private *ctrl;
>> @@ -2375,6 +2406,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	rate = ctrl->panel->link_info.rate;
>>   	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> +	ctrl->mst_active = mst_active;
> 
> Should it be set to active only when you actually activate the MST?
> 
This can be moved into on_stream.
>>   
>>   	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
>>   
>> @@ -2654,6 +2686,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
> 
> I'd rather have the `if mst_active` here rather than in the function.
> 
Got it.
>> +	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   	if (ret)
>>   		return ret;
>> @@ -2693,6 +2729,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
>>   
>> +	ctrl->mst_active = false;
>> +
>>   	dev_pm_opp_set_rate(ctrl->dev, 0);
>>   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>>   
>> @@ -2876,6 +2914,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>>   	ctrl->link_base = link_base;
>>   	ctrl->mst2link_base = mst2link_base;
>>   	ctrl->mst3link_base = mst3link_base;
>> +	ctrl->mst_active = false;
>>   
>>   	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>>   	if (ret) {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index e72d501ac1ce..f82fd96e412a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -16,7 +16,7 @@ struct msm_dp_ctrl {
>>   
>>   struct phy;
>>   
>> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
>>   int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> @@ -51,4 +51,5 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>>   
>>   void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>>   int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
>> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index a924fbd825f7..80bb5fc4003f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -660,7 +660,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>>   		force_link_train = true;
>>   	}
>>   
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
>> +	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>>   	if (rc)
>>   		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>>   	// TODO: schedule drm_connector_set_link_status_property()
>> @@ -1547,6 +1547,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   
>>   	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>> +	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
>>   }
>>   
>>   static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index b0cfdf215970..fdbe6e4871d9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -19,6 +19,7 @@ struct msm_dp {
>>   	struct drm_bridge *bridge;
>>   	bool audio_enabled;
>>   	bool power_on;
>> +	bool mst_active;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 1c2d3d8d029d..237325d52dbd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -156,6 +156,8 @@
>>   #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>>   #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>>   
>> +#define REG_DP_MST_ACT				(0x00000500)
>> +
>>   #define REG_DP_SOFTWARE_MVID			(0x00000010)
>>   #define REG_DP_SOFTWARE_NVID			(0x00000018)
>>   #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
>>
>> -- 
>> 2.43.0
>>
> 


