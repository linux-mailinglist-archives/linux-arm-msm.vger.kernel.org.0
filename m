Return-Path: <linux-arm-msm+bounces-105049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGLzA9/o8Gn2awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:05:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1E48991E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28F6930FF0C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCE8327C13;
	Tue, 28 Apr 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7SzQjo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYkd7M3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980863033F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394400; cv=none; b=j3ldd3on3GQmaJE+QvhCDGl2+NUiXyyF955ZhKxONDWPiqFxU25pI2k/WRhevqzx/58TZNabfO2WDjVlHXxIl7/zuhRm2v25NaFwxFLmlVH73u/Ay9UE2HROj5m2oBEmym7bUooZNwS0zXLZY/Wqg/89ESmSZJym6ArqwR22mfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394400; c=relaxed/simple;
	bh=qZzhuuormOf8Rul9WUs1IcMncFOwAXE+8P8hcP9siEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8i9BgoiYyteBeJG4VJUkE4VZgj4rOqLaM7fY3OTlRaVIU1s+nJuhaBC6Lg/OGJx4U3jCDSyMhCnwhm5Rx6fPbkrNZpFRb/3il1X7P2hxW2SIbeOGirswehN1imEErIYOQxeLGg7TmrlON9LRFfX1dAZaD9GnlNZ2bnQ+BWZJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7SzQjo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYkd7M3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsV5d1796854
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=f7SzQjo2A6gvPSWl
	4RSvhk1zwSXT5U1plZ2fJ5UTix3BYVLRUWvlmwud43vB0Z+JYf/OqNXL/5AbOrrG
	8mTZis37OGV2svwSeXhojxzhKhDvnGF3b0NiEXfvTbiVqOxmmpWe0YZeJUfcimO2
	n40R+UEiqXUZsBVkMiItGY+y6VBrQ/XMMw9sIwJ7f8R4Fx0xZhUcwQ9k0dURvFK0
	GOw8air9IRe8GaiBlW3fY3MeOVtlGFz5MVK/HPDRUIrGLlxSkYc/7l2YnYrMRUU2
	KF5YlhvY6ijYL26viLxaEbmRPQepuH9rTNJD1l7hW2aLWwIXa0ExsIIEXCCL58Lr
	gpo/pw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2sncn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:39:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2e60238adb1so29393048eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394396; x=1777999196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=PYkd7M3l2rol7qbMxfQktGLF9kkFmuNQpkXpinnffGbsC1qXZNJk7uSRfnxgQKPVfC
         rHq6CLx/9kkDCpOBNHoyu1q11eHWl9A2kVRampazY3cVLo1zowGy7HHGHAd4N4sbmJKX
         yquzHKnc/lYscara73DVETctt+Qq0J029iAplhnZ9jfIfE3GB8u3/4X1EmtvnrAPJQ4Y
         qPj7RjEph9ryUgsSAw+Ymu/t+fOPOMpFo1LewPm2fujRmtUfINf5bN34coUk/A5ubaFS
         TrjRy9vG4oxbYYtTa5uM42ArxgdWfC61tjcZQHDrz0b1W+wdwrOGWS2KPp29wFHwUP8M
         lVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394396; x=1777999196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=ciSd8WWVidM47qkKiJonYBtUivDMROlKTONVfT5FJEXQu8kkFpFQVOJJ7drKiv/Kc4
         roytP2UwNk1Sf9tK5JHrqsWWONnnP2oPPL6eq1xKCeh4fc7E8XApACYiGN5Vkp+ZT/Us
         lHNCaJOr1W8dx0Vh8FJ7j+/eBlm9jqKd99s7+L98nmBVNCjKBBdr3eqa+/Edlaf9/OX8
         rt/O3SWM1XjezSEj9HVJxYTg9RvyRzApawudi4AMdzWUQLwicD/QAhc6owWQBLjV56kv
         FitH3QFGQhOUWhQ0D2O5CcSQUJC2+fzPUcYwQ8tv60ENsDFoEHi/mS42+SXJTcK0k4zu
         eTdA==
X-Forwarded-Encrypted: i=1; AFNElJ8crgy69vZzk3n6Qxi/Obzrsfs6ayKNLpy84FL0cD509mJIlVCLEaRAA58bCCy6N9ZWDpH9umFaqFO0ZzjH@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSceVJ0QJ4t3KuqSY+/WuDpBkrrzR+a/Z1pAy5Kkqry3u0zea
	kVJfIssVctjuwBdPsPy6ijSd1CvkRN78/a38J09XO7BhcTIkQcbCT/rqXS3Dk3lb6cDEr1MNopZ
	hWVF9E+i309+MAr5QLNoi9L3luQl/z3UitsURT6aSURQqmNUdA21n3hyow3GVxmjzAPmr
X-Gm-Gg: AeBDiev8o4D/sOnoLxbtTOYjAWFVgwUxXj0QBf68r48eegmBOnyuL7Lyd36+5wNCSKs
	KwngXiwzEFks4mz3AMcnB3vuiAyPBxcU4pB+BnZWWywxg0XkI9CXTLqJmztAxRo+HVkp8VF7kGm
	22I5vjCGvGgr9e7ftDiA9CkTB0eAiZSBIg6WkPvY2wP1bQkeYz3CkOUnIkWGfXhul+4y8ntgNx3
	+BF1QNL61qLm+OmQ4rMVc5KgcdqwLGdVV4ZjVotrN1qwzsH0BnAKhf4TT8yrC/Rv3j/tLLWXqdk
	Vvt6E9y5ogd89bvwk/ZhMNCGggZ2SOFiG0ufmdlw7aChQL/OY86AYTNfGcBnkAxn//Rr+aB7wsH
	E99kQnaOdpg5iEdhN2ZGEnO3fGeTjWdKgj8nLEn1klX/phbRO6FrTx7cZUtLmv+o9ujN2V/JZoF
	fx+ccJCzVko8PKBLK5pPv8dZQN
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787687eec.4.1777394395778;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787668eec.4.1777394395038;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce878sm2622054eec.16.2026.04.28.09.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:39:54 -0700 (PDT)
Message-ID: <e8c37614-354f-40d3-be3c-983f45e5bb3f@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:39:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
 <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0e2dc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yneryZK0HH5dXzgVxAEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: YlyIfKsWJ3_aA503V7d1vGIMBaK1nF9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX1Q900StYqvCG
 BumXDq/MtfU28SXoHJULGYxiAT2QgQ4GoWNfrgdjo3JieemZ0r9YeAv0CM4hN+gkX96t3K1shhA
 2pfgXgREPkZoAubzbsCtV2BmbYyA4cYXIR8Rse36wROGjwBdNGKw1VtJhsNHHwYZWL6txXkHT5i
 f0WB2GNNcMUIbCZyJUd+cPElecWGkjDz9sLaQ78eVpk8clujIFYVyiz6/JnYJ01tfJ5eMn2tdt3
 FQM7s+tBOJ5UpdKUPfwcZmS2IdZ8uZ40P1fQWUi5y9+/fqXMy2ZY8y2e0mkhpQ6nVOUbwIgKYqx
 TI8rdwKVMORwlxDvxyXccFElPcrf5Fb055MQEuwr+9GDzQgaBBJXGnuA3ofEvRu/oBMFzYHYxGj
 lHSq0Wjm88eH+z3IOAGpEtxVRw65A+GZHa+3HET7NwXDV0JtX3Culs51LCLuigIaAFwRTibXG+v
 MsVIl0nvc/hAIM4gE5g==
X-Proofpoint-GUID: YlyIfKsWJ3_aA503V7d1vGIMBaK1nF9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280160
X-Rspamd-Queue-Id: 9CB1E48991E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105049-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 3/19/2026 7:26 AM, Jeff Johnson wrote:
> On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Bjorn,
> Feel free to take this through your tree since I don't think it will conflict
> with anything in mine and it will take time for the definition to propagate
> back to my tree via the normal workflow (which I would prefer over merging the
> immutable branch).
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Now NAK...

The definitions have now propagated back to my tree, so I'll now take this
patch through my tree.

/jeff

