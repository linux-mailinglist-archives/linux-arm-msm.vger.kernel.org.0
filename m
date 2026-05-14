Return-Path: <linux-arm-msm+bounces-107541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDLuMd51BWrAXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:12:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2953EC34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4755300130A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6AE347505;
	Thu, 14 May 2026 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diIkAXFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWrvRTDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115F01C01
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742747; cv=none; b=maAibof0A0wNB+NBhnLS+2KSTo4wK1yYO7q5grB2l1/n7DY+sgBKeMaBPsxgfH7XVHJxLbba8QzwZlguzF6OOp1zgtQ+ogzP0HxvHpO5PBY3OsxuGt0sGdkNo5QLCWOO+4cHk2DL66+kJpVoFeGRS3TneRgeaEOTzRbBruh6xrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742747; c=relaxed/simple;
	bh=FJ88YJihjWPRcl2AdG6hdBMM5qHPXsw+so8RDODdxQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTGsIVX4Om7GEc906N6cVqz9S5DRhjC6jFlxyu86KHuMMduR76tHc/iW/UUDEvgLCrp6euq5NWYCGKe+/4PLKQx5fQpiYOjYfTYyUSHUkKsnGlwNpK1oTVRrkZUIXxUcxbdUO9S0Ttm/2HVhGhPcXn4eH0UGMsNttZo9ed1jVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diIkAXFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWrvRTDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E73TOS359467
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4A/3dwK+XbYKnmvRsDst5JWcZQlTSj0jgLv8jjjFtiU=; b=diIkAXFGS8Y+PwsG
	tMGNjPAZyVomq2b1ZvyCnzXS68XC4dHor+TW2lOxYv9ltLFdnJtiK3vQWAAnLd/R
	3RFJVz1GV0WihPFYXIWVcUVCVNGWSMsJ2n4PMFdNoRddIGhOVdeOssBQJYQH9hoX
	May/4GyRftzXpT7pWiSj6UTmaVXUMx9xwa3iIDzVuGH2hUDw64xr4/F3RjO3KJU/
	iHoKc1zqY4oSH27Z36aHB8pzYCvhgDqe/fE7ZvcmuKwkavze1K/ocfFWwaW20Bf4
	2SIYIOF7w5Y9necSC8F1JEbbetvNVxV0OtrhnKRSUWGNfFUhrUxB+4c2J5ffE7KR
	s5NpUA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513g9j69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:12:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366344513a3so14463819a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778742744; x=1779347544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4A/3dwK+XbYKnmvRsDst5JWcZQlTSj0jgLv8jjjFtiU=;
        b=cWrvRTDceahdOlJMaYDceWkUb5O9lNYnHT3tLdBukhvlEW1HStGYYEB9iypf1t/O47
         JDHYVs8DfdZxOdpjtD1MdWLmPEDlged2376tCIL120ZYHXnCbeQ5MWR+XaWEKVEh8qtg
         D1XfMZnO9OU2rWcG/buFu1jeen7Wkx0saTaEI7t/J5PZAcJid76BJ4dmfuUNd7uETLks
         RTHth7a9LpBnHRjrkTVkVJGnaet2+dkQ0+AJwzQzkShUT0jB1EK3tU5nfgk5VEM1Lg/w
         9fYlifXd0Ge0G6dBuDNJic9I42zwKHfDymrlMqx4LPpHjK+LZaftRGESDm3SJ7dQwi+Q
         NVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778742744; x=1779347544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A/3dwK+XbYKnmvRsDst5JWcZQlTSj0jgLv8jjjFtiU=;
        b=rqXlSnr1pv88YGNSzUnzh7hc1zSYV8+KV94AZHN8Xfz8Ec/xD6t8D2bFRXhtTysmsQ
         AUG4CuzoFZQIKg40/Zy7THjehz2kgakdu7NeHC/JD3QIVApRiQ+h71DJmHaVPUn0e4T8
         /77j/FRcXpqj0cJ1k5FwUnbyzrfBdQZE9ddvkxP2n7g/WIpe23G2FXzd6Yfd25v9NDbg
         dM10YZOlVC4x4NqpRuSys6Qg3C1v2RAT0OOzGUggFsIu/81BC8oa8+3G4zukTpj7hJ0W
         qnmLz4yfJmYNKNLorNWMqqtCx/ZHCcrx3j7O90/4yZjeRr+o+uwo4QB7L9Zrir5w7mBl
         PaOg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZyxBISFIkM2UaQz+7CdK6dq+M2KcxzVpikZzdIEz7mPJRejF8tSuwf7l8wEA1VyR3ai64D/yfF1ik8Xmj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyigl/sHC6yZaJmXcZmGwXhkyZ04WWGoVE/jsHkHWhL0au8Lu9G
	21tcchBeFF8aoyu3iLmf0F1vGF4fRXGfcz7px5w+zZXMY196IB9u+Y8vfjW2XVNx3nSn1ve/EGt
	qrTZnIWPgaowqqauEaK649Z6PNr5xJoMsukirSNLTDY7N2tkBw4MRh2Ow2oHHk9w6V49F
X-Gm-Gg: Acq92OFCHw8naXO59BCuMxGxtdYw3bRYdR2clsJ+3BI0RrmlKqGxKGnS0cBrPodoF01
	pqBfRbviOS5VdJBnftrDrBzS79EO995siDMe8cL/hKdl6XYtywgPzPLTYqb6WtXiv82Y23yIxIb
	pVHcwycg5qDjv4xZW/PwJGCcvFujMQ9eZkoHxCGoBuXArO9Aty+FJYBQCikYXffOFIu5DaxFpXM
	Ztnd4DwtV6/xk/HXDs6sgtcR5qm7QrB5ARxXj3kjkVY+J74eq54g/iRCL6ZtgrLn+vxnsdTYJ7H
	zG+1KFiz1mcXcvz59XTUvhwwLwu5jy1k4SonT7HkeitCSUeTqLcth6kQkRBqKQ7HDxda0QjHW5x
	iK8Q4uFDp2Aq58x5cs7g+Xhoey82A5Ttr229/bQsU06jnCiLeXGyCTKI4FphkDzGTFSgylvsPIJ
	PIJuK74BEh7IXj1jBaYmnEpAs6rNXh
X-Received: by 2002:a17:90a:dfc4:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-368f3ac4a7fmr7446789a91.12.1778742744202;
        Thu, 14 May 2026 00:12:24 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc4:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-368f3ac4a7fmr7446731a91.12.1778742743390;
        Thu, 14 May 2026 00:12:23 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05fcb3sm14931795ad.26.2026.05.14.00.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 00:12:22 -0700 (PDT)
Message-ID: <d4c5d26c-47f1-4e42-9852-d407982cb4f6@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:12:17 +0800
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
 <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com>
 <k6y3e4fqfwkevvvv3zmzmovsrz4i6qkxs3duhz7khsggxwwa77@uogtrpuaxhnc>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <k6y3e4fqfwkevvvv3zmzmovsrz4i6qkxs3duhz7khsggxwwa77@uogtrpuaxhnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2OSBTYWx0ZWRfX3hcV1LgWbc8O
 D0Chsr1UMk4dLoxwIiby4Vk1q4gbC5EQKNMnlB1kMzQjp1lrVlKw1A0P0jQas9AXZzUT6sRtKsJ
 fLd3LiNnPWGffQjg/v2BcWKwqWoLfK8UY6CWrRIw7XfRRr3vwR/mCaMUDLuH8kLK4N8wUmfGq3q
 u2wfyQ/Wt1otE0vQfGRiYusZloNzOjQCALV8zDrIu5f0ucj7rJ5LzwXKUwTHTFhnbhoG4cCXFKY
 gnkMv30qYeFe+CYX2NgQaVoVhrUFSulW8jk2jNAjfWh6Yf8ANrvNANgE1LD9G9F8xBJkJ9XIoGg
 6NYRn34d5yK+tlpUGC0tkJNQ89s8dxJGE2pmr3WolZqgA1MWbeFTQsO5Z6rH70eKNlDi/CLDukI
 FdrZfAKVWO7MPc9J1ArhfwW9kvfnEK4rG4dscEuaXr7xQfYbyvx29bTBI23Aqa6os+XTREVVw4d
 GSx0tBzGPCc4IJQU4ww==
X-Proofpoint-ORIG-GUID: I0RWCh4zWIEqSSV-O0pI4lOlSqvHC4Ph
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a0575d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TETkF4qc1S3FjmaiS5QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I0RWCh4zWIEqSSV-O0pI4lOlSqvHC4Ph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140069
X-Rspamd-Queue-Id: 6CF2953EC34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107541-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Action: no action



On 4/19/2026 8:29 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 15, 2026 at 06:32:29PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/15/2026 2:43 AM, Dmitry Baryshkov wrote:
>>> On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
>>>>>>
>>>>>>
>>>>>> On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
>>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>>
>>>>>>>> Add HPD callback for the MST module which shall be invoked from the
>>>>>>>> dp_display's HPD handler to perform MST specific operations in case
>>>>>>>> of HPD. In MST case, route the HPD messages to MST module.
>>>>>>>>
>>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>>>>>>>>      drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>>>>      drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>>>>>>>>      3 files changed, 48 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>>>>>>>>      static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>>>>>>>>      {
>>>>>>>> -	int rc = 0;
>>>>>>>> -	u32 sink_request;
>>>>>>>>      	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>>>>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>>>>>>> +	u32 sink_request;
>>>>>>>> +	int rc = 0;
>>>>>>>> +
>>>>>>>> +	if (msm_dp_display->mst_active) {
>>>>>>>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
>>>>>>>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>>>>>>>> +		return 0;
>>>>>>>> +	}
>>>>>>>>      	/* check for any test request issued by sink */
>>>>>>>>      	rc = msm_dp_link_process_request(dp->link);
>>>>>>>> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>>>>>>>      	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>>>>>>>>      		msm_dp_display_send_hpd_notification(dp, false);
>>>>>>>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>>>>>>>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>>>>>>>>      		msm_dp_display_send_hpd_notification(dp, true);
>>>>>>>> +		msm_dp_irq_hpd_handle(dp, 0);
>>>>>>>
>>>>>>> Why is it a part of this patch?? It has nothing to do with MST.
>>>>>>>
>>>>>> Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
>>>>>> I tried an alternative approach by calling the MST IRQ handler from
>>>>>> msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
>>>>>> DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
>>>>>> msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
>>>>>> could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
>>>>>> However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
>>>>>> MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
>>>>>
>>>>> When are the link status bits updated? Please remember, we need to
>>>>> support all three cases:
>>>>>
>>>>> - Native DP, native DP HPD pin handling
>>>>> - Native DP, DP HPD pin not handled by the controller
>>>>> - DP AltMode, DP HPD pin not used at all
>>>>>
>>>>> In the second and the third cases we will not be getting the IRQs.
>>>>> Instead one of the next bridges (connector, EC, AltMode, etc.) will send
>>>>> the HPD event, which lands in the .hpd_notify() callback.
>>>>>
>>>> I added some logs and did some testing. I think
>>>> msm_dp_aux_is_link_connected() only shows the current HPD state. Since IRQ
>>>> HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_INT_STATUS
>>>> in the IRQ flow, the HPD state machine has usually already finished pulse
>>>> classification and returned to Connected.
>>>
>>> But the IRQ should be sticky and it should be readable from the status
>>> bits.
>>>
>> Yes... I’m not sure how this is handled on other platforms, but on LeMans
>> can not get IRQ status from msm_dp_aux_is_link_connected().
> 
> Can we clarify that somehow? Maybe with the hardware team if it is
> uncear from the HPG?
> 
>>> Note, in the USB-C AltMode case the HPD machine is not used at all.
>>>
>>>>
>>>> Because of that, the condition hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT
>>>> will usually not be hit.
>>>>
>>>> do you have any suggestion that in how to distinguish between an IRQ event
>>>> and a plug event in .hpd_notify() better? We probably don’t want to
>>>> introduce another state machine.
>>>
>>> Then, I assume, currently there is no way to actually distinguish those.
>>> The easiest way to handle the replug would be to store the current
>>> "connected" status and verify if we are receiving "connected" while
>>> being connected or if it is a disconnected -> connected change.
>>>
>> Emm.. Currently, regardless of whether it is the native DP HPD (on LeMans)
>> or DP over Type‑C Alt Mode(test on Hamoa), a single plug event always
>> results in two or more identical .hpd_notify() callbacks.
> 
> Could you please check, why? On Hamoa it might be because of the LTTPRs.
> 
>> In other words, after the transition from disconnected → connected is
>> completed, there is still one more .hpd_notify() with connected → connected.
>> So it still can store "connected" to distinguish between an IRQ event and a
>> plug event from .hpd_notify()?
> 
> I've sent a series, which explicitly tracks the IRQ events. Hope that
> helps.
> 
Very thanks for sending the HPD IRQ series 
https://patchwork.freedesktop.org/series/151522/. it very helpful for 
TYPE-C MST.

I’ve been testing it locally based on HPD refator series, and TYPE-C 
basic plug case works on my side (although with some local modify, maybe 
now it is workaround). At least the IRQ is being delivered correctly now 
and the simplest case works. It still need to do some additional testing.

There is a small question:
When do you plan to merge the HPD refactor series? and could you please 
rebase the irq series patch to HPD refactor series ? so that i can keep 
MST  depend on those 2 series.
> Thoug storing of the "connected" state should help us to identify the
> long HPD pulse (wich should be treated as unplug & replug).
> 
>> This is my current understanding. If this is incorrect, please feel free to
>> correct me. Thanks.
>> As an additional note, msm_dp_hpd_plug_handle runs through its full flow
>> twice for a single plug event. Also, the behavior I described above does not
>> include any MST-specific filtering codes.
>>> For a longer term (and granted that HDMI also has a notion of HPD pulse
>>> events) we might want to extend the DRM HPD API to pass through the "IRQ
>>> pulse" events as is (instead of converting those to
>>> connected-whilec-connected events).
>>>
>>> Let me sketch a draft for that.
>>>
>>
> 


