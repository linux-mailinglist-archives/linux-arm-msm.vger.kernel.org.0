Return-Path: <linux-arm-msm+bounces-113126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u/iBMNG8L2qiFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:50:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F5684BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:50:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L3rR3dIO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NN9nxHHo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113126-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113126-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375A330342B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C136938424D;
	Mon, 15 Jun 2026 08:45:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF383845C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513122; cv=none; b=kttKcB2lZliW7v9EQv659GKt4PG2mP83YpR1UHK4fheqNNGCEkZWlzffvoRAenN+++vZlFpbwKag/9+e+hlOFCCRveZGWs+Y32GbQlQ7oBhENYX520KQMDrzL87kYhe6pzwhqIp9gpXkmAS/QbSH53JVd/d9xIXmQP2ztHQd0fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513122; c=relaxed/simple;
	bh=oeyFp/rLjtgwy3CCUHUOw3xMPq9muEEBuCjM9V9OkJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fT8HOobg1xXlgDhnvk9afivHNSHuld+oUz7LQWCaWzgqTBWdUoZcoMxMIVdsvI9Tb0DMBEJhmGoev9u5DtAcrIvbD1P42/PjA56HnVDx2ROqmCTwoNO0tpm48ZV71e0LPRMFBXBIod9GAk4wDe8lGy7KWROd5cs5AIqgJ0q/4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3rR3dIO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NN9nxHHo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J8s33250401
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7p1TqGbxKOzqKvuGX8oUhCBkSlMWPS5HXB/aBjrvlQ=; b=L3rR3dIOdeyvn4/F
	6QQU8XUmCp2kYAKNzSw2T6jK/FyUmfHH6xKUStHQi0vIqdPRTGi8yIVQUplNuzT6
	ouM1tZh6OHHcbNM0SI99oIL7cq+kjhAbCG5w8RddS6nAj+BDb+e2hLUik19JM0SM
	iDPmKbEsItYz8rWe2kR/cbQbTy3EjRsTHwlxGAWJVNO5L0hFcp3YRESZWrVmtkf5
	naooRkIya17UHgpkXbZKJZMneywFugiatbAnh4TvU65QYMxrW0xYgBz4wwdWjOZ/
	/qD5LjjUALSyAbz5Wu6+iZbau1GiAajIHRV81L7S7eQlKzgCbJmM/jOlNzKuyTsg
	9RCKeg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybxcnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:45:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso1705185a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513120; x=1782117920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7p1TqGbxKOzqKvuGX8oUhCBkSlMWPS5HXB/aBjrvlQ=;
        b=NN9nxHHopCq1Z2O67KGb9MyGAptJaZ/DylBP0POTvYNL4DHqeeFj0KMareZ2fx/e7V
         m/HXm+59OO6hhSp5avC9pAXcur8dGXjVHLges/3TeXsoU4ZDiKckA6vUDkNLnoUDlDt/
         CZd2OY3M1wMBNwDcLzdAiJAMpr9DSmxGtU8KWptfbK1XjdujjWAfba3tLS7HFWikwO+B
         mB0mtj6j+90QBr9RAqwhuQw48hWYK7aFlcW03jRU29KMRSzDbdfsT4cyG4SRs9Pet0qZ
         N8x0vbbkB1hngGtYBCZsPkv/9Ly+yg6tPWv8jB/rDLcVWHdUg7xn+Q0zGJDEEPbtoyMs
         Afpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513120; x=1782117920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7p1TqGbxKOzqKvuGX8oUhCBkSlMWPS5HXB/aBjrvlQ=;
        b=BVqWukAwO6G2UHtP+tWQ+JqxQHyo/YgxQ6TaA8Wzr0mp99lDi3UGuYxAJ4obuifA+e
         RyldWXHU0WPBRyy/+LKwK91ZgKP0iWDWlrCdBahk08XV+PWfeDF6DIT7dpIDUOaQEtl2
         lQxL3pdj0eZq6CbiT59PuQ6JSkfDYPwqaFzBOQ448my+yCRjbamxMDnbXJ9c8X75JQ8h
         2gzcBOujMNJL225Xs7MAg+2edcRIyoj2yIn+CQL7hk64ezJFRoUHJk7W+doj/1KYjVa5
         ygLjHAOiVYLmGVApSShXz6dNjqG2BvMZaGOqXvQ+r0NB8jWibDJYgSZtRL7mtFqj4e5B
         wPDw==
X-Forwarded-Encrypted: i=1; AFNElJ/P8qqhHMeLx143Raw+6NZ5TuIDTxd6ciq7NQ4nnC144AI9BbRGztQi9xYAFGgS+GuiPek4w5z7asFBNLRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0dhiAlKQivFyqTKCM8bsLd7irHYJeFm5lNi09Wn1Tkyl5r+n/
	rAWwNuAHZpZTQAjD30wNwv61rofa/91eCgV9BVE/M26LhS5dQRmp+S0z9NfoRFdEH7PEoKIaUKH
	8LvABFOda8FEqw2rg08bNnzkkJrpcN4VEYImjf4BBhcQjfdmVMIm0I4vI/SgBXHoXR9pjf7Jj04
	bgRLk=
X-Gm-Gg: Acq92OGT/UI75o6m5EhRlUYQ76GQCi7JsrHlPOwmZDDyN+A1Z1Aca20qEwwU+tZPcyU
	pDop4uC+i350H/QxEdAwjq8Sfg6IAYkQT4Qs8O8rMZh+eB4JPkIK8CPV3AdigDSO1pMs72hpq7S
	63oKh5UqUsckKT05yAZTBxQBXNxX0rJBiUsjHTGlKvEdzdmvEd4OXABeoctdnbB1vdrz0q6r0kh
	xvl1/B/Fw0DHBlH+6qR9WbyB7rz0oNOrEOrgCqIabFSv70ht97k9DyZ6bXhz8EGODFcaXBNEVrA
	1+3HU2cBrknpHijCv9VSl277GX4O4x9+7FQ4PQDBodcOy6ta8CdYBVaRxEymk3PSDtQCfNXkFLj
	+B3NAJFqOTI4g3ngbf1OWrtkMjkEtR9Xjx9y45l24druWbxWmf3gHR4PM5noUIh2wVTnev+h71w
	zcVaMlDkOzxcrwLH9Hag==
X-Received: by 2002:a05:6a21:458b:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b78588b46fmr11370743637.22.1781513119951;
        Mon, 15 Jun 2026 01:45:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:458b:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b78588b46fmr11370715637.22.1781513119450;
        Mon, 15 Jun 2026 01:45:19 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651aef27sm8248972a12.30.2026.06.15.01.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:45:19 -0700 (PDT)
Message-ID: <9219adc5-e394-4d70-a580-f85bf860e566@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:45:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 27/39] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
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
 <20260410-msm-dp-mst-v4-27-b20518dea8de@oss.qualcomm.com>
 <ezm6cz4lfzrh2a7ohwdc73qbn7gblqjhwtwcp72ds7u6cmizrx@qvh7vu6kis2k>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ezm6cz4lfzrh2a7ohwdc73qbn7gblqjhwtwcp72ds7u6cmizrx@qvh7vu6kis2k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 952Krx9zpnkDq9Xo4LR--EqkBQxvmUaa
X-Proofpoint-ORIG-GUID: 952Krx9zpnkDq9Xo4LR--EqkBQxvmUaa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX3HuJBfeMFCcO
 b6k+Vr0KhFbAPf4bfyK2WpOQo+/SjtXPE8BlnV3fFIkgU3Y+v2UeL4u9Uc6lchrAumw5+OTMl2f
 PqnT4mH3dQv5oURu3zcL0/oO5uqXwvo=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2fbba0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1XwNoAEaEPKn6H4yol4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX00lOBa3cd0nV
 TZabqErL1jpl/VDWxJE6QweAinPQSXAuZ1Uveg5XXbX7s+uNYNo0jfn4znI4mH3/JYgQj04hRVt
 8wiX5fdU29TeJ078h9PiYxIl2qm1vL8iU+xrVvu9cf4Jc/GA8DUdLCso4pn1K6/flnayqVuT66b
 DQeEAmpLG4YcEjDibXg/h39O5PeorFagRID9ohIEo1REkK1xqVEM5M8KtSbNMq/+C3Cc57W+BIY
 LjeNefNoyR6bTxK0596deV2EE8ac1Na7gVhwAy9MNKnpfPAbmzoS64WqPmkoYYfq8es+hdHWXhg
 sadBxMztDHtP7FSKws+QgxI+Mukk7k3Ijhq0cm7Pt7tWHouVfBnemi+unM7SpS67vJJL/fBrbr8
 1n81SMDx3uoC0ZMKt1NrsLV+3BEV6Ne0SDAf/RBAlXylC2FFBG24IlPu/EPwEv6igjpnYhJng0I
 eAR2vrf9auCAcPocmzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113126-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 3E6F5684BA2



On 4/12/2026 8:11 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:34:02PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> For DP MST, the link clock and power domain resources stay on until
>> both streams have been disabled OR we receive hotplug. Introduce an
>> active_stream_cnt to track the number of active streams and necessary
>> state handling. Replace the power_on variable with active_stream_cnt
>> as power_on boolean works only for a single stream.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++------------------
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>>   3 files changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
>> index 41018e82efa1..035e230201fd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>> @@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
>>   	 * such cases check for connection status and bail out if not
>>   	 * connected.
>>   	 */
>> -	if (!msm_dp_display->power_on) {
>> +	if (!msm_dp_display->active_stream_cnt) {
>>   		rc = -EINVAL;
>>   		goto end;
>>   	}
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 33d8539afee7..e6ecbb3a688e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -657,15 +657,15 @@ int msm_dp_display_prepare(struct msm_dp *msm_dp_display)
>>   	if (dp->link->sink_count == 0)
>>   		return rc;
>>   
>> -	if (!msm_dp_display->power_on) {
>> +	if (!msm_dp_display->active_stream_cnt) {
> 
> Okay, I'm now being lost between the names. When is prepare being
> called? Is it still part of the atomic_enable()? Or atomic_pre_enable()?
>
I’ve renamed the function to msm_dp_display_prepare_link, which looks 
better. We’re still in atomic_enable().
>>   		msm_dp_display_host_phy_init(dp);
>>   		force_link_train = true;
>> -	}
>>   
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>> -	if (rc)
>> -		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> -	// TODO: schedule drm_connector_set_link_status_property()
>> +		rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>> +		if (rc)
>> +			DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +		// TODO: schedule drm_connector_set_link_status_property()
>> +	}
> 
> Again, this more than the scope of the commit message.
> 
Got it..I will update the commit message to explain why this change is 
needed. Under MST, preparing the link only needs to be done once by the 
first stream.
>>   
>>   	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
>>   }
>> @@ -674,18 +674,12 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>>   				 struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	int rc = 0;
>> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>>   	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>> -	if (msm_dp_display->power_on) {
>> -		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
>> -		return 0;
>> -	}
>>   
>>   	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
>> -	if (!rc)
>> -		msm_dp_display->power_on = true;
>>   
>> +	dp->msm_dp_display.active_stream_cnt++;
>>   	return rc;
>>   }
>>   
>> @@ -731,16 +725,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>>   static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>>   				  struct msm_dp_panel *msm_dp_panel)
>>   {
>> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> -
>> -	if (!msm_dp_display->power_on)
>> +	if (!dp->msm_dp_display.active_stream_cnt)
>>   		return 0;
>>   
>>   	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>>   
>>   	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>>   
>> -	msm_dp_display->power_on = false;
>> +	dp->msm_dp_display.active_stream_cnt--;
>>   
>>   	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>>   	return 0;
>> @@ -876,7 +868,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   	 * power_on status before dumping DP registers to avoid crash due
>>   	 * to unclocked access
>>   	 */
>> -	if (!dp->power_on)
>> +	if (!dp->active_stream_cnt)
>>   		return;
>>   
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
>> @@ -1559,6 +1551,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	if (!msm_dp_display->active_stream_cnt) {
>> +		drm_dbg_dp(dp->drm_dev, "no active streams\n");
>> +		return;
>> +	}
>> +
>>   	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
>>   	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>>   	msm_dp_ctrl_mst_send_act(dp->ctrl);
>> @@ -1579,6 +1576,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	if (msm_dp_display->active_stream_cnt) {
>> +		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
>> +		return;
>> +	}
>> +
>>   	/* dongle is still connected but sinks are disconnected */
>>   	if (dp->link->sink_count == 0)
>>   		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 0ede5505be58..2548f67cd441 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -18,7 +18,7 @@ struct msm_dp {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_bridge *bridge;
>>   	bool audio_enabled;
>> -	bool power_on;
>> +	u32 active_stream_cnt;
>>   	bool mst_active;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>
>> -- 
>> 2.43.0
>>
> 


