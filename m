Return-Path: <linux-arm-msm+bounces-112232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WpOjAp02KGoRAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:51:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFC66200E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:51:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D39SZ7a8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HZhSzPiF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112232-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112232-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3123830054D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B85E48C8D5;
	Tue,  9 Jun 2026 15:42:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647348A2A1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:42:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019776; cv=none; b=OzNCorgt1rRh8oIGj0QdRLkBjgvKWA2GDYOPsfq2t4P6UobMvlPRxGkAsrZuuqx7IAsiaa2p5ibTsFzlPwNGWfLBI21JAQgyN2f/VnW8SLiDOtYrd99TokocboxsFTfyS794cMfL69ZWMlRagbhwu1pzCe3B9Rl1uiusnigFZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019776; c=relaxed/simple;
	bh=gqr5ohazsZyTasddooxt15i9sIDUHi6ZxT2bvwDtjME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jV5Jta6Vra9/mjf1H0AiXXXTFcgJpWdoXbm9nTWpjW74ldhD2q5jm9jvKRxlL9/PanOWDxPaR5+0FUIQu4f4uow/EmIpMHO3c11Q7eowOySfKT2brdtwuiiIwangdazUN7WD46bxmZul1TBDJqO9IuWcKHXGZ0h9LfscYHu3L8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D39SZ7a8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZhSzPiF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaNT2247973
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=; b=D39SZ7a8IjOskgri
	S9RCiOP/R1kujtUpFKg2zm/nyS6LoKlIHQVf7mDN332toLJm+U40U6uK/R143VBD
	3eBsqTnEIkyiIPv6pZ6j46q4N53+1pQdxLAxDKdou4ShDBg+UF1M+ljfxSS0BwF3
	Lol4Le8d1s4KEX1PKIFizOZPDlgBetoRyQ7u10R6u+V/TF1RF35G4bNDeKAQ5n70
	1Egg+LIt68GjvbjWtmQP1OD12cUm7KDcX8kB+HzsjUdM243t6NtJAT0q9WjgkkIn
	x4TD+IPgtYzob9ZMs0w9VdfYJnI+/qJae1HtNtnv39HO9vmrv+RcR60iGbB/p5WD
	v4H/9A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetkug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:42:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1365060ac82so4535051c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019773; x=1781624573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=;
        b=HZhSzPiF03w+nzTTaTezEPcoJGYJUadkrbMLbG0PIWF55fSbnFxtnGVyaTia1ngXWp
         /i7fZlCrfo5XnNHR3kTN7RQnq7NT5JAisCFTMMCOH2C+7uBFjpxE0DOCYH/QXp2cfpbw
         fxvFEfZ36fFE3iugRTaESfFaAnR62CmwtG1aB1rRjYsBs24XPS+Rvf/pfP5hzuxaqqZV
         /dEbcFxntfmVVdkeM5jZO+GN6VNzgTiYI4jJpPadjIBxyfDB5l/4exeYJbhFKv2E0d/B
         3T4JL9DJaeHjz0QNx6ZbpdAdRrO2lWO9XD0rA83Rl4DRMOfGUh0OzcaCq5F9q9lYDtNL
         Etfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019773; x=1781624573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=;
        b=lvt9BBo5upT6t1FdESZiDoVH4PCbwHe+VB16bUbIIBqE1fu/8CzgqrGC/qS8Y6fjiA
         11o2xygDlN01DYelQp9Ygx5zKDBM2LCOFyaExfrtUUykqy2hxHr1q/kvHrLKwa1Kwefa
         MVZLldw/9XQhwnaYZbabkqgbWaOVLiTVrz1+jLV8ntdestieHeNyts1ac2O2viwhn4A8
         is+EVxf75XQJ2C6OXX/Pd7ziv/9DCY9kUM2ez7XA5HD2WQdTAUTLQ/6c4Mt6U5UkjkgB
         dqlSHiqRl8LCJC+mn7oMVdg4m9nO2YHZ1Kr6XBQz4OgUQNp+TcmJ8EJeuZ0iOdHd1krE
         h7Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8kmADf/zCkZxKRI4oYe3J8GQJ/doZg78FQVYGESW+2hVfKrCSpUXBxZMCSi/7bWu87bukYw5cbBLl10eio@vger.kernel.org
X-Gm-Message-State: AOJu0YzTEwdqB1edAqOX5B3lGXm7ykQAQJFnnetXk5gfuYruQH2Yxdqt
	6sEWGWBl3coH2ZUN4ix+/l4dMT2QmI/dbClF2fNxThNTy85hrtKTHkkCGRCHt7Ti2pM4DTFmsAE
	+z8pUQLEo6/Zoucu0IQkmt00+Dqa3qPX98Cl7ZW7eZTYwMkpa2aZwPR22KY9Jyk48dTCG
X-Gm-Gg: Acq92OFMzNpBwJY8EFZpmVlQaaIAaA3lBvdBoP+NJHu/LSJArulY7yh/2SfUKtI3hi3
	FKwDe1DFphSdnQ41C6igEvkES3aIvDkNMarqGFch9AXlV4iiOlBWZPaLP5ZgWU0yS/MN1bhSkKh
	fKFSHWjMSumc6epZp415Hm+af2xS8m5kKvGzM/KEbHspdGqVXuteYFefbNu7q8DEb/5hbhtTk+Q
	3xNtcCgYI+un2dwB6QnkRfhAGasETZIc/brefUY7gMv03r6dLWxl/R/Mo6z/Yzng1tpWeSia9d5
	fVH++f8u/F+KqA0VXQUp7IFMIO9405IbxA8eCYe/Yr0qZtd9qja6AqrgqhNcqJRsbXURzR1NcKX
	1LIoUBLahXEqNzvv5ngrINF3/3unr8iwtt1N1SCJPKl0nmOzQeNiphWrLR7e6b99vD927Ol0uc5
	rk6v1acXlhPHc3am+H
X-Received: by 2002:a05:7022:3d03:b0:123:3c24:b15 with SMTP id a92af1059eb24-13807d94f3bmr9505294c88.19.1781019772995;
        Tue, 09 Jun 2026 08:42:52 -0700 (PDT)
X-Received: by 2002:a05:7022:3d03:b0:123:3c24:b15 with SMTP id a92af1059eb24-13807d94f3bmr9505263c88.19.1781019772510;
        Tue, 09 Jun 2026 08:42:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm26793961eec.8.2026.06.09.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:42:51 -0700 (PDT)
Message-ID: <dc655263-99d1-4dc5-a5b8-f2d64af36421@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 08:42:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for
 WCN3610
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        wcn36xx@lists.infradead.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
 <20260306004344.10968-3-kerigancreighton@gmail.com>
 <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
 <ecad737b-ea4c-4f32-b519-f338cfd6d48e@oss.qualcomm.com>
 <aieCcYXkmDqfb0Bj@baldur>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aieCcYXkmDqfb0Bj@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a28347d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=kV-QE96C91QsJRX880IA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfX9BQtXzh+1TBG
 uF7om7VuCldHYexQc9oyqE2d+QhYTHfgceECNKYziv7iowml6KNy2CpXM69PWsXQ7md9o3KTedM
 8vd/u9LomuSR4t7keuKlwnT6VO3CpZhwxnfZDcHhpCh1g0wSVGTsxa+l9yvAw/gcfSwrGa/gReO
 Q3pzT2V0qJxUuyO1M5P+PdSupLPAGfHIdzlLMPXbsVqRSt0irPAESpMshOQeAiCtovPtI8uaSBo
 h1NYrrMEK8kUH9XfgOouJ6OOOd+pnZwu/sNG0615QvLZqKTe+bE3ffQkAG3gFR3LIxWBt7kIwJ/
 r4pIXWhW50PudY5xITx6MCAD4ric6oSPw9Yr4om+Uvbi8AFFD3Q/SvAXohRl64K5CBhEZP1W/7S
 uC8rtDuQ48YmbdipGBpxZYBwQkPLtL8SqI4MWZ1ltYgaW1asJpzvR0/mNlEd7bKMPe5CXz9hRrw
 oveyLc45UkHFUSovPCw==
X-Proofpoint-ORIG-GUID: dnIGAWe1K3vXP4CwPQNnnw2nQ62-ljE3
X-Proofpoint-GUID: dnIGAWe1K3vXP4CwPQNnnw2nQ62-ljE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-112232-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:krzk@kernel.org,m:kerigancreighton@gmail.com,m:linux-wireless@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:wcn36xx@lists.infradead.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,lists.infradead.org,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,bootlin.com:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BCFC66200E

On 6/8/2026 8:04 PM, Bjorn Andersson wrote:
> On Fri, Jun 05, 2026 at 05:33:22PM -0700, Jeff Johnson wrote:
>> On 3/5/2026 11:25 PM, Krzysztof Kozlowski wrote:
>>> On 06/03/2026 01:43, Kerigan Creighton wrote:
>>>> WCN3610 has the same regulator requirements as
>>>> WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.
>>>>
>>>> A separate compatible is needed for WCN3610 because the
>>>> wcn36xx driver uses it for chip-specific configuration.
>>>> Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
>>>> disables ENABLE_DYNAMIC_RA_START_RATE, and disables
>>>> STA_POWERSAVE for this specific chip for stable
>>>> functionality.
>>>
>>> This goes to the binding description where you describe the hardware,
>>> how I asked.
>>>
>>> Please wrap commit message according to Linux coding style / submission
>>> process (neither too early nor over the limit):
>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>> This series is sitting in my patchwork queue.
>> Based upon Krzysztof's comments there should be a v4 that moves some
>> descriptive text from 2/3 to 1/3.
>>
>> Bjorn: Once v4 lands, do you want to take this series or should I?
>> (Need to know if I should wait for ACK of 2/3 or give ACK for 3/3).
>>
> 
> I don't see any build-time dependencies between patch {1,2} and {3}. So
> I'd suggest that I pick the two remoteproc patches and you pick the WiFi
> patch.
ACK

