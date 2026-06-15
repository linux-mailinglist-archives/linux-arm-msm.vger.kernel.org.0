Return-Path: <linux-arm-msm+bounces-113152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hh9ZLHzOL2rdGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9156853FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:05:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aHHdewTV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AXjn6af1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113152-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113152-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61A923003356
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69FD3DBD57;
	Mon, 15 Jun 2026 10:05:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94D3DB33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:05:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517916; cv=none; b=G5uZIv3Zb/9HnpQfWxxR4aLo6bHLQ6bKP+GHeLQ8oBM2igBGABRoCIS/2ar1NU1jTNfzoPVlvuKDLpnwRthrAu28ERKf0kWLtA2WnJ0wiZrPMCKncUCOLOZ7AIxjMlUOLiKYUmR7wvnAARBcUW6+5QCgTyJZQOKrB3nYJokBb6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517916; c=relaxed/simple;
	bh=IoK+K0FKi8f9J60s+84h7lsbpI9MYDaWp8bElnoGJBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch4MMhhx3ZMBuh/fLKZJEBvAmTU4w2R1YgPjkWR9VizL0VO/WzY4SO8sVYjPS9/x2gOFB5u1iVoqVvZefheQSAT23DuK2OGrNHLTxIRbSC6PP9cMThomA/94NZNMPV0xgMCUGNo0qHcrbsRYTO2cPitP82Q+nRZGpEJ4jw+aQaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHHdewTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXjn6af1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F99A2L035303
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t4X6WGiq4FPEq0dd0u+pxDxc4ERsQrYiJnopRFePXIs=; b=aHHdewTVMpBZivXU
	fn/VX6pRmultlnOvxG63Ju6yQO1ca285YR1TNQSMLzRdAkdhWLTmR+R/lljr3D19
	5qr6ByBCKfsyGikQO/1tXJy6FgMpyL5hBlEZEaSVztLPq03Z8q+QR9mCxfjMYfFr
	uz66vpwbbTV4QI2fegMlxW7+k1RAVHHvj1VHDBdi7J9JWSRQ/OpxZ7kHMqpo3JZC
	+wOfOA2OinRMXP+ubmfA5v/Myn7oMYABH65KcH9HAwcYWnQbFVuZdTR77sct1+T9
	nQy2lsl/pQf6Ib5AaEY/i51RRW8br3+PwBvt6GmRRa2HKQ1gagKpBhfwpHW5X0Y4
	3r9vAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegur7gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:05:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso32070725ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781517913; x=1782122713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4X6WGiq4FPEq0dd0u+pxDxc4ERsQrYiJnopRFePXIs=;
        b=AXjn6af1dwE2u5qqdzb4WoPPS4BkialjTnxJyIX+1bnS/1K/DDBllmZs+YOhNlBU9j
         KGaYso2EtpaetKrpRawT1vTPleTK32MbiDMmGxKIJiKEh2GrZV4Aqy6fivdOlOCCAgMn
         bnpPD7uMxIX+cDsUQ1TT7kof8vrBmhbMuRGEr3cFD5+5vds8aoZ58DkQfq5AXlUfrPJQ
         WRiTrXHquWxR5ZT/Mz3vHHVeT0p+ASvztzRuJSwBBlPjGTCWOMzEjDaQaRGnAr9QBE40
         4ubyIRmb9OiC1BjGMk+2x/y6noni9jeP//JXMxF8CfmRGOixLCb9UpheheWieumQjnd6
         zikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517913; x=1782122713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4X6WGiq4FPEq0dd0u+pxDxc4ERsQrYiJnopRFePXIs=;
        b=WwWwNmn9ZyPYv53KwikE5bqy59AROYKDy0cKQt9VnWfTZ6aukDY6/t7hh+SuVtLAhN
         FYgsL29EJQAiWXBb7Gu/cykY9FODqSDpGUdj/QRNAhYm4Uz3m9eFzyWERB/NtxNGUOvJ
         BTjqBnNGFTLDzfOaNe7nA+PRZ0r5LvMm0HfayihVSMD0CqEnLSFm2vrZ89JkmuMjQ6Om
         PPvJk9vmXPkspNC7IbmDeOq/xkC9BbShd97NYd+hXmUKB0AkU4uGiHPrl1j2moeUmERa
         M4jyRwQBY8XMfFYW4QEDOGKPmcxPNSJggkbBKWEYSTZa84CtrbQla1y7CHx0wgkgYGqo
         H2LA==
X-Forwarded-Encrypted: i=1; AFNElJ87lE/qqIlBnDecedPhJt10lu6IwbX8ElfQsS6DcVQsOTM5oadtFTQePe4nMtNL1iDCu0eCUoA9/ONwY2K+@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFSg6g3WuquuX3sTuHu4+dNXmh4ZRe5mLyshByGNwH4AgqZjG
	dgcQvDk1xgTahJ5OCbYlTJBEdFxurb9WgN6p7JPQnamLijFpXen4dJdt9ryolvQqsKXTvEwDMon
	UZ/Aocno048otavSepCcrdd239KOjUN5hwfNs+kk3NdXPcK7C0kg6ymhc1COkV5wd8dCD
X-Gm-Gg: Acq92OHZe71DibQafCnZ3GepLf6CK5uDBA87PkdFvTT+POQu9E2Gcer+GT2bEFVHn7p
	qwq4ATA8N2+Z8yiNBUPX0ngVLTZBQMq/RCRdzxWCfJ6y3eD3wY0cqm0fj18eh5twdtBa8E+/Qk6
	QQvItxoapBrpV3y2jwnPHeNT50BnxbI/Bm+hziI2xj+D1c9h6DIi41J+rli0n6Jf4tB7gLA/1pw
	xpMfwS6ncuUpOs7lmvqlRoG9tbyGo9Bz2ndxo+jceoPoFOjUavHhf4TCPP2rVGL0ZC3oNrlTV8g
	kqSUmgeXrUHP0ytMAybPiC4laKJXMv21l2cDyu1GK4tZ9P+hend4tQOI9VSsSesG1iwwgDWeBue
	WV15qQwGA4I2BT84BshuaG3w8z1wq1RbaNS+wQ6PeA4NjREzhz+0dO5ud2M+RRHo4nwqBebeCxo
	HbBhz1sd7MqoUGaQkN2Q==
X-Received: by 2002:a17:903:2f04:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c6641488d3mr116824485ad.6.1781517913008;
        Mon, 15 Jun 2026 03:05:13 -0700 (PDT)
X-Received: by 2002:a17:903:2f04:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c6641488d3mr116823835ad.6.1781517912493;
        Mon, 15 Jun 2026 03:05:12 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb50bfsm96866885ad.33.2026.06.15.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:05:12 -0700 (PDT)
Message-ID: <42c2bbab-dd86-4ba8-94f6-a6f377425be9@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:05:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 37/39] drm/msm/dp: add HPD callback for dp MST
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
 <20260410-msm-dp-mst-v4-37-b20518dea8de@oss.qualcomm.com>
 <ml35zldwr6f7euzmw6noy7j5mufyhfhmwoigkwq5ykyyl3amgb@5eo63mfnd4tg>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ml35zldwr6f7euzmw6noy7j5mufyhfhmwoigkwq5ykyyl3amgb@5eo63mfnd4tg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNiBTYWx0ZWRfX0Ebm+37kz5EK
 6znTuqJVE2rA9VvdGe0eF9aan1xY5r0zgAWRbVridO3du3xiY1LMq/DqTN0Qd368EEahDbSWfuE
 5yOYkSsLnEpjBAP2UACU97oh2xtPXNvec8yQhZnpOchGZFsdXuVrvumyOo8F7ljZFojFIV2E5I+
 IDUCEJrEgcpSOw9V6ejvRFPdFgHdRcQhp7W3jSA+asWU/fEEfQCyn0PzAvtW6XiJKJBS2PY+9Ir
 /jQtBQC6PMU3FAqXdJzsIqR/hWes+Vkgd7sm750ck4fHiGZgegGsbICR3uqaKkbO0ncVBdWXZaK
 Bo21o5EL5aKMb54oOvc1cf3hE8Ca0TdMxFWNw52jjg8zFtNa7+mlEyL1ptitfpWa21/1gAaFla1
 s5i8DkjenEE7GESOcedIlLqspMYjGKTglhgHmg3GkFmFwGwLYKJLfjQRsVq1/E4zq0qHrK+luST
 xnqSIVB5iUmwtkG61ig==
X-Proofpoint-ORIG-GUID: oNmTvL0E1vOMw97Y2TN_9BlYGG9jhWFu
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2fce5a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=99inU4qtSHyG9fJ7QXwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNiBTYWx0ZWRfX2oWMuZZHECT+
 sLPKlcfjC0RbghRfaKr/Ahp5F7fbr0zsX2iQHq5abSnBNv0Et9tJWwSAMiNmDUgjb+yfIWlHk2q
 dmGUEhl3zvLoWQufiT3K9cChoLKiA3U=
X-Proofpoint-GUID: oNmTvL0E1vOMw97Y2TN_9BlYGG9jhWFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113152-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,patchwork.freedesktop.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F9156853FC



On 4/12/2026 6:00 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:34:12PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add HPD callback for the MST module which shall be invoked from the
>> dp_display's HPD handler to perform MST specific operations in case
>> of HPD. In MST case, route the HPD messages to MST module.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>>   3 files changed, 54 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 919767945ba5..ca89e20b7563 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -454,6 +454,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>>   			dp->msm_dp_display.connector_type,
>>   			dp->link->sink_count);
>>   
>> +	if (dp->plugged)
>> +		return 0;
>> +
>>   	mutex_lock(&dp->plugged_lock);
>>   
>>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>> @@ -556,12 +559,19 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>>   {
>>   	u32 sink_request;
>>   	int rc = 0;
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>>   	/* irq_hpd can happen at either connected or disconnected state */
>>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
>>   			dp->msm_dp_display.connector_type,
>>   			dp->link->sink_count);
>>   
>> +	if (msm_dp_display->mst_active) {
>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> 
> Will this work for USB-C?
> 
Hmm not work for USB-C. We can remove this check here, as the IRQ thread 
can handle the disconnect case itself.
>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>> +		return 0;
>> +	}
>> +
>>   	/* check for any test request issued by sink */
>>   	rc = msm_dp_link_process_request(dp->link);
>>   	if (!rc) {
>> @@ -1125,9 +1135,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>   				      connector_status_connected);
>>   
>>   	/* Send HPD as connected and distinguish it in the notifier */
>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>> -		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>> -				      connector_status_connected);
>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>> +		if (dp->msm_dp_display.mst_active)
>> +			msm_dp_irq_hpd_handle(dp);
> 
> No, don't touch this code. HPD notifications might be coming from the
> other entities. This IRQ thread can only send the HPD notification.
> There rest should be handled in the notifier.
> 
Ok. From my understanding, after this series 
(https://patchwork.freedesktop.org/series/164954/#rev5) is rebased, we 
should use drm_aux_hpd_bridge_notify_extra() here to notify the IRQ?
>> +		else
>> +			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>> +					      connector_status_connected);
>> +	}
>>   
>>   	ret = IRQ_HANDLED;
>>   
>> @@ -1793,7 +1807,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   			msm_dp_hpd_plug_handle(dp);
>>   		}
>>   	} else {
>> -		msm_dp_hpd_unplug_handle(dp);
>> +		if (hpd_link_status == ISR_DISCONNECTED)
> 
> Why?
> 
Let me explain this in more detail here.
Currently, MST hotplug and IRQ events are handled through the SST bridge.
This guards against spurious unplug handling caused by 
msm_dp_bridge_hpd_notify() being invoked from non-HPD contexts where 
status == connector_status_disconnected does not actually mean the cable 
is gone.

In addition to the real HPD IRQ path, drm_bridge_connector_detect() also 
calls drm_bridge_connector_hpd_notify() to broadcast the detect result 
to all bridges in the chain. So a single physical plug-in produces 
multiple msm_dp_bridge_hpd_notify() calls — one from the real IRQ, then 
several more from various probe/poll paths. Stack traces from a single 
insertion on QCS8300:

   1. msm_dp_display_irq_thread → real HPD plug, status=connected
   2. fbdev probe triggered by (1) → drm_bridge_connector_detect → 
status=disconnected (link not ready yet)
   3. output_poll_execute worker → same path → status=disconnected
   4. drm_dp_mst_link_probe_work → same path → status=disconnected
   5. output_poll_execute again → status=disconnected

Here not work for USB-C case yet, I’d like to switch to using 
drm_dp_read_sink_count to detect whether the sink is actually 
disconnected or no sink devices.

>> +			msm_dp_hpd_unplug_handle(dp);
>>   	}
>>   
>>   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> index bb3898b1f6b1..71d3f63973e6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> @@ -490,6 +490,40 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
>>   	return rc;
>>   }
>>   
>> +/* DP MST HPD IRQ callback */
> 
> Useless comment.
> 
Got it.
>> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
>> +{
>> +	int rc;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>> +	u8 ack[8] = {};
>> +	u8 esi[4];
>> +	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
>> +	bool handled;
>> +
>> +	rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
>> +	if (rc < 0) {
>> +		DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
>> +		return;
>> +	}
>> +
>> +	drm_dbg_dp(dp_display->drm_dev, "MST irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
>> +		   esi[1], esi[2], esi[3]);
>> +
>> +	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
>> +
>> +	/* ack the request */
>> +	if (handled) {
>> +		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
>> +		if (rc < 0) {
>> +			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
>> +			return;
>> +		}
>> +
>> +		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
>> +	}
>> +	drm_dbg_dp(dp_display->drm_dev, "MST display hpd_irq handled:%d rc:%d\n", handled, rc);
>> +}
>> +
>>   /* DP MST Connector OPs */
>>   static int
>>   msm_dp_mst_connector_detect(struct drm_connector *connector,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> index 5d411529f681..08e145399cfc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> @@ -9,5 +9,6 @@
>>   
>>   int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>>   int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
>> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
>>   
>>   #endif /* _DP_MST_DRM_H_ */
>>
>> -- 
>> 2.43.0
>>
> 


