Return-Path: <linux-arm-msm+bounces-115386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ghzWAMGvQ2p0fAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:00:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D26E3EAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:00:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FCuqERbN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VUN9LkMC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115386-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115386-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5166C31413A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F53B35E1CD;
	Tue, 30 Jun 2026 11:30:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717B3E451A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:30:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819022; cv=none; b=jp7UQArK5Ur8a5TIi/crxJ7EeAjItk1EEqGShnA1H4PwrbuqnM2ULRNJqkupPpK7R5l5aglIe6elsk7dy0kMyUYV0EIWK5aJShz/8gTbkmB6jCGNBxSuvpiORN8ly40g41PBv8szyXJAm6JrXLEuq8ckxe02iGk9TA49cWNrSks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819022; c=relaxed/simple;
	bh=EwAiIGa5V5LfaXRgjYaxuPUJ+qoz+CiWNKPO3DOX2sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjXxn7ixyfkJhuEW6XgYFU89eoDLLeZGj9fyfiTbEq3AOIvjZQb/S+g8IIDhFmChowHAaZwY2HlU3Yh6J7+xbYZVpZ3j1sA4AjEUPeFy8V56vmRm4d41Zq2VHfYrmIs6iNz2OSYPa83pSCLO+hnvv1J4IM8ag3dEnr18F/nWf1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCuqERbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUN9LkMC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muld1604830
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxuf7nHCMmQB8RVfIW4EjJ6Gc6YS8vbqMU2TjN+Z8FA=; b=FCuqERbNxnT4KjtB
	MhUUyYQlAUeUCim8gETqZ/WBhgJsxN3zYuWqdktUu8aNWighfDNfckvnxphx7P6I
	luuMfpCqcJ5Kg6DZfW8F+V2f+YLI2ew1Vja/b7ESPBYF28jCX2LG5Qg1K7oCkPHE
	P5loEpmpUTDoTXFmXtMlmsLWx7j8jhD4x67m1Tb/Bq61IesRRhMO386pNfv7+q7g
	c7prZqpNaJXiMsyPOZLPmloUxHwupsEqa47vUDoRDuz70uKrSZubkBtXJGFW37ZY
	Yhe6WE8mbl9ScB1bxShQbI8uubHr4oh51Dlbq31Hxudl5k1vLg0GwVHhMDPmdh7J
	U0zBvQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjdf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:30:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso1671680b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819020; x=1783423820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jxuf7nHCMmQB8RVfIW4EjJ6Gc6YS8vbqMU2TjN+Z8FA=;
        b=VUN9LkMCadjpuUlTREgUEG69A5uJ7joC6WlPx8OVOvQNlsHkBfchtPWF1zbwjOhQou
         6s/G2lMg7gn1FRZr4cD7e8wWfxP99OL/LDFKqyUDLKtDL1vtm90+kbmlaY7aTbpues+5
         09PN4TWhF3docNA9r0t7RD/it5ufZTTMdzirmc9wHOydOiea4UnxzWRPvxjGIDGTX0PR
         DgQd/ZC9J6zw9qwuxIDPVfhsTURLqxtPSBrOddrT7FUYRE2IURxEKVie+gs4ZVbpPEcN
         9HhpvADy63rlejGXimtuN01fO02S2WiBnS/okuE6qXRiB0Swzhgi8hE50T6q5/sgCbtH
         XTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819020; x=1783423820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jxuf7nHCMmQB8RVfIW4EjJ6Gc6YS8vbqMU2TjN+Z8FA=;
        b=MdQig645Z1OHaCSWJMHJmiB0AJwVFNapokNxqZOvjmcyQCP5GaTDeAWLY8G9TlRFPx
         kr2a3+fD1YlpNMfzk/49hb4jger7enJZL/5pNPNzpzjuYnpqDg7qsH/308AnlsshSf1t
         hfjm498DiMnem2aufw1OzY993t7G/pm/xF+AMnQm5wk826jds3WNnIVDplRjWtFeD1cR
         w0jch4W27gQzCF/BrXDbQ7jpVcb7drWoDtD4gqEDopbeFHX/zA0cKLEUkfv/Phn/83bw
         a2rcTBGukpiD14Ikt3vcc8fWIS7oJ3Evr2nS0wvoqRS/90ylGYKxr0ivfAW9lNdC6aDY
         6yqg==
X-Forwarded-Encrypted: i=1; AFNElJ/ITIPAlMsbwvaghyUPDMv8gaLNuypzdD61nG1+4FdwRlKkbfgvrBq2wyPtpXeK7s9/fM262Vl8qbb4XGq/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8CMGf0hCwfOCCtd7FyZi1AQPg/Q0TRBdm9alOxAsyvm1LzSpr
	e3FSFA7VkJ0EAx8+zwaKBqy5t05LIcwyWN1enGs3XOnZSiddFszisj8nylvuavSBkX2v9c4x/A7
	3VvS9Y8R4oziyvF1xoYfQ8uQ8ouHxzaaOZFh28YsWoHscG2UpFnc11DiOdg0300C6mEnB
X-Gm-Gg: AfdE7clkPhKb8isi2mPkd2rave7S7Cg78dNtZ7+nKly+NgeKV8Iwtu4hzPXdi9afmiC
	wD+OLMKso7T/Q6OaQcR1woe3jgDen6/ffD+3KvrwoJB8i7p8SqR1kUeOA8qtUZpO0XgC275n+lD
	Hb+qAcDHujMHpAbEJ7PaGpd2AWcYe8sxTSh15ktl+pRwvGJdZ+Uv2/DRPyMeKfIaarUfEgxycMu
	X9lfqhf9V9XRTDBpEOcFjLUeI4w71a+bs1qgMwjQjCFWJM0EeUoyTfnu8fCvWyIX3LcNwPO8MPy
	dgqWIm9mlPKxnqt3sMuthdOnLPnifvC0FVBjk+vVuIhVaZ7WIzau6QWVOesUqB65Pat/9iWQ+1N
	DGcj8I8ck/GGTDfjLmFipXncYMDWNx7NVHFE/rTnKjEA8LRn+QnlfhaQxxiPC0cnRsCSHqlDome
	Pf0xzY
X-Received: by 2002:a05:6a00:22c7:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-847adea9b55mr270149b3a.37.1782819019938;
        Tue, 30 Jun 2026 04:30:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c7:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-847adea9b55mr270094b3a.37.1782819019374;
        Tue, 30 Jun 2026 04:30:19 -0700 (PDT)
Received: from [10.133.33.5] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a039f2c4sm1796908b3a.54.2026.06.30.04.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:30:18 -0700 (PDT)
Message-ID: <12f549f8-6365-47ed-9334-7cfdf201cc5a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 19:30:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Skip push_idle in atomic_disable if display
 is not powered on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260511-edp_suspend-v1-1-128555968d7c@oss.qualcomm.com>
 <mnpara7zwt6ahqkb44mxjtengjodutek35dzax72xuf5i4puzd@tvxhgefvpdqk>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <mnpara7zwt6ahqkb44mxjtengjodutek35dzax72xuf5i4puzd@tvxhgefvpdqk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d2BN0lKozA_SjFCzFMfikIcFA9ZpBjl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX73EHkBN3NS2k
 g2XcTT8z1Xaict6bDEd3sGBl4jbZj7v8F6kVWrtobuA5kw1iCyiUyjdqWO+F1Try0DhA/pqFrXI
 5qrf4YXntgZCopxmaQI+UBXiyD+kv37sF7fQwWhGbj+54uRbAjmyN9gulRsYQr1nl466gdneInX
 YG76Rd/tRTMXK9o4QK538EnwNIjE0pDikw5tN9h7QdjxnWHyHULTkkaoQJEWRIoHiecYYW3YNvA
 NRpjEis1iTtZonJ5i4v3ICCh1WYYvxzc37SrKY24pFFutikWCBP+WCYfn6j9Y+PIXZbOoDvmPSB
 0lqCImr7dk3Xjqtkb8XlcaLXANhO0hPPI9iQpK7NlJoJHN6j8klm0hxprOJ0LRA751tHxRl3Chm
 meUCYJAs5XsesxOOS727BYLaXj6aRBk+TG9HISx1JpDKHvkF5SVsQJMdoPB8fXAmDniE/KGl86t
 D9dBBDKwHoGfAKEIOmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX6nrKhICBGRNg
 dCsVF5Ty3qVaiHH6v98lENTgRGK/MSyKOvbhK+zw+bbGax7Eck5JpAEdPrzrLzClmAUX9O31nFy
 ufcYWNwl7DTa7totEEyIsNKTbubVgyY=
X-Proofpoint-GUID: d2BN0lKozA_SjFCzFMfikIcFA9ZpBjl0
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43a8cc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Fa2nlc_RI4ObidiIHNgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115386-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,chromium.org,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_sbillaka@quicinc.com,m:quic_vpolimer@quicinc.com,m:dianders@chromium.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 4D8D26E3EAB



On 5/13/2026 9:28 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 04:36:03PM +0800, Yongxing Mou wrote:
>> On eDP interfaces with no panel connected, panel-simple-dp-aux fails to
>> read DPCD over AUX during probe, leaving hpd_state at ST_DISCONNECTED.
>> msm_dp_bridge_atomic_enable() exits early as a result, so
> 
> Why is atomic_enable() called for disconnected bridge?
> 
Sorry, I wasn't very clear. What I meant is that the hpd_state is 
ST_DISCONNECTED when no eDP panel is connected. However, the eDP 
connector is always reported as connected because it does not implement 
a .detect() callback and assumes that the panel is always present.
>> msm_dp_display_enable() is never called and power_on remains false with
>> link clocks never enabled.
>>
>> During system suspend, drm_atomic_helper_suspend() still invokes
>> atomic_disable() for all registered bridges. The resulting write to
>> REG_DP_STATE_CTRL against an unpowered controller triggers a NoC slave
>> error, causing a fatal crash.
>>
>> Guard push_idle with a power_on check to skip the register access when the
>> display was never enabled.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> Fixes?
> 
Got it.
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1b3cbf4016ef..51b60eb9c2df 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1660,6 +1660,13 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>>   
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	/*
>> +	 * push_idle accesses link registers which require link clocks to be on.
>> +	 * Skip if the display was never powered on (e.g. eDP with no panel).
>> +	 */
>> +	if (!dp->power_on)
>> +		return;
>> +
>>   	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>>   }
>>   
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260511-edp_suspend-0e45d0110633
>>
>> Best regards,
>> -- 
>> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>
> 


