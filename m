Return-Path: <linux-arm-msm+bounces-116039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MAyMKoJsRmojUQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:49:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3A6F8839
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:49:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qq6Iz3PC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TIoZTsge;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116039-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116039-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF71830265C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 13:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C90A3F23CF;
	Thu,  2 Jul 2026 13:43:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B54A2E1D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 13:43:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999819; cv=none; b=SdXP+Dh6n1w4l1l5kviAPBUKW4ObSM2mX93+4RXH+/AIXHG7ziK+qaX63graa4H8jhu4bz0I6dJ1hxOk+/zQBpOaeh8Z/MyncyvKQ5r4l4r1hUIkXe7vDcOiSX1/7iAixjKb6+5pHYABKoSN/MPcZLBXHrtLKolOebga+rA4yeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999819; c=relaxed/simple;
	bh=pUmuoOmlSi59+bO8E19LC+9eEoQhwUMNW6nLeMGPsDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3JL7/map8cECuOGFLTIDpKzEuWkcYWps3uhUOQWKmFD0j1B6/lvlUPQF8YK+uf5GxQgcH9wR32g4omgyDKm8ef548/rry41MyyCJ0DOoe+fO5DkZ0acJF4dnjH7PXks5hrCyoJcEQw57Ja5hqxu4dDSyOIg1KJOdGHE2ozfYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq6Iz3PC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIoZTsge; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0anc374234
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 13:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYdCLALUzA6mvHi6fp8BSqBzgrgOzPZPKPwE47MB0oQ=; b=Qq6Iz3PC6DCeF6ih
	714mf6XHQhWAY2MCskzGvaFKilTXy4abI5zGcrBVBbWhQ2bNTN+Goc6V0uy0BB9K
	HCp7WjpJF9de5ux0PEDQly7zNKYU8kJ5W/UFB840ZWQIq8hyQNRD2VjsrYrDFOla
	BTLgfBzJsWwmp1tBNnTjAkGT3+FC1SG84Flh6lQXB1DUHcJG9+Y9GGYT1S2NrZ5h
	yGnQ8TbfkYXUXCIjO7ZB4tpzeWuSCBuUEd5jYnNRtOAIrQNmCWACyiGop4y24d+/
	YjCyIhY28MHSiFMb7NfHDfSod0CSHRYQQC++XPtjRVAI5btyz8y4kiZaLd9Xvj/H
	ox266Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8vsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 13:43:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so2802436a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782999816; x=1783604616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYdCLALUzA6mvHi6fp8BSqBzgrgOzPZPKPwE47MB0oQ=;
        b=TIoZTsgeWqNNvguUqAvN9DX0/F5QDBKorQoJYx/zhmoUiq4cPJtgM81QRHKGB+EIu0
         w20QbuYD3ks7o7uHGk+zWZJlv1QBOPpeHcdSkvBzfPA0w7vB5H2bkVMPM8I0r9Pm1WpY
         Ps3MTbW2LRf15/TS+RbMW9jG7KzGUoFqTQLTjxG8W+FRkm1RN5zpD3xKy1+noxKnyiS2
         +msce1R8sbeDUl0GYYRkMPW4M88rqRGncmx6KGY1rr2XRZLlTXLl/sUGpOyl2x7oMgx3
         uwzQi3JqRAlPMHlB7uqQU/qUCTqh3Qy6cISh2bhYr9xGUbOrzuy7BJSn156qQ/9ZdBbE
         LPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999816; x=1783604616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYdCLALUzA6mvHi6fp8BSqBzgrgOzPZPKPwE47MB0oQ=;
        b=REFHCIsqHRXvSRFqZSrHvjeZM2IHHmWxNg+N2ix5dLtYWhiIB2SXwzFKEn7Vu9c8I3
         M413AcHpJ1lG7LvIr3vuYDdfeC1/CW2o4153keM+MOjap7OdDoUsAgBC01MXFLBaXMdb
         0HuURpyH2p6pkwPFNmU3VDDXws9Ludow2n8+RyEfrbrAyLgO9iaZPHuHtMAhO66JYUXD
         e9xMrMezB8ADI0Hhj620dN4cUbI5kLKTOdOYLNwq1VbncGTd+DlJ+sSWM6gOLiOTh6Ol
         OWm1OWc9kEZy/H+ScLHLbmS5qxX8an++WmyJlfC8+xXI4y8CQZfPGaujVuHXOqGiPWgD
         pFRA==
X-Forwarded-Encrypted: i=1; AHgh+RqFE6J/J5Lt5sPCN7qtTmGzhr3Y6OZSnqus6oaPoMJc6R+DMrQtucQUhkGDq9drGzzIyqXvXplbLTSMpWH9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqy9dgRums/85QEhbCmvHah0UeuRodBaS/UJ21tNKjzOolmGJD
	YqRDYXZax8lipcDELHyKAwQNR/lcTSrAmpfLSuIMRUx23CL9GgRWym+Iyyx2bdZmmCQiXIbFpJd
	KmirpGwfEfQVisyoLtTXIlB+cWQ02epKYE+L+BCKFs7UKu69Rwe//85KBElJCEM5S8QS3
X-Gm-Gg: AfdE7clnyTh8XNZ4YucTL39Bi1XLadQ4hF9SPWRpV7yvg1dSqNpww0hxfD/owwnr4kg
	ipqJClbeWAUHIv+st6O/soIgOT1NxPK5eYlYUuO9Mdx3zBaelEGFbOhC4v1T+7Wa/T56bqOrgI+
	SRCtlxi4TX2xeXyXSCg4r4o74LwUxO5VZ29gFz9vpPpsmcDOoIfQjDozhBs8UAOzbikHEw5pRVq
	UC+xV9luWJ4wnPgF2S9p1Xo0zugMv22RwMCBPN0ah2oSVOSPIS5SHuYPSa2icEIEa5Gy8H4ivwE
	tpBPlA2TTyGZnDIGPF2Yj1HPP2Sn8FYe+UGTRZ8Sw6XzxY+mcKKzjDP7V6x/GrA86dEXomiSCB3
	kxWElb0d9S9ka/Dc+9irdoOalUK/WUl8iXdkLzrHDw2/IRZQBVsd2b9KvLkxLGSJXag6FLEmhxg
	aasds=
X-Received: by 2002:a17:90a:d44b:b0:37c:7090:821b with SMTP id 98e67ed59e1d1-380aa0f436amr5638744a91.10.1782999816533;
        Thu, 02 Jul 2026 06:43:36 -0700 (PDT)
X-Received: by 2002:a17:90a:d44b:b0:37c:7090:821b with SMTP id 98e67ed59e1d1-380aa0f436amr5638703a91.10.1782999816037;
        Thu, 02 Jul 2026 06:43:36 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.243.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e1636a03sm1154162a91.1.2026.07.02.06.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:43:35 -0700 (PDT)
Message-ID: <e39c9092-30f3-4c04-8bdc-c6400871cecf@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 19:13:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: don't unrelated bits if autoresume
 is not used
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
 <64f7efcc-1cd6-40f5-80c0-ab5f882854a3@oss.qualcomm.com>
 <3goo36jai5g2v24ijlf7g4gehq5zdlk7uwizya7dimqtm5pmrs@norf4xbqdlw5>
 <3c533783-e2a5-48f3-8275-4cef5651938b@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <3c533783-e2a5-48f3-8275-4cef5651938b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ozwgka9sOq9VopVi1SkNxypmL-LTlLWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0MyBTYWx0ZWRfX8OXNSazmaJZ1
 ETKQvrT3s3SCxWINcqAAXpFtMdoLQ2OEQCBLcEarSbJO8x8JBpsZ5J8m+bpbjR3SWU3ZnkQwvst
 JdO1zfm56FMVjhtteMhk6C608Lyf/v0=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a466b09 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=OtbC+xJwP8rERjI3u+ECAg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=OgPk0aSyYpcDEwaxJaMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ozwgka9sOq9VopVi1SkNxypmL-LTlLWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0MyBTYWx0ZWRfX37W84MXM6jL7
 Ye3SD+rjP6EQnrblMGZfK29xudu5gSkyhHxfQh5MGLSyKzLRMKxNgxHJgRNvUQNAp5dfxSjq1Ug
 aNYWcbmnabx81ENqkJ7jPBflOW5FekcKyqVK9uDmSfXOBM3dwH8Pb2eyW91w+SN35JUhq6f6NDw
 DT1yPZQFxdFPAQYtnD8PjIxi/sgFAIlOYU9/5MiYO4jTxeY/WMWppe95n1UjOKmeIN80flmwx2h
 fWboEpWGCf4raTFF741hH53/px+CYplVTFO2IseT0X2zgRYNBtHWC2xEkGB1QFyFy7zz8UnOESG
 w8Xj2rnFtJCVUVWbO0NyhjGm5SsYtkWRzhTpP+H8WHKoZ3niRWpPJklK2ciNx3qrxF2yHHfz3N6
 sOCALzyKtJD3HKwnkYSGWWDyfBGMfcIR7G+VuxQ174afi1leF3R0SdqJG1ozMOIyydnYLJdNrwJ
 Nw8dB5me6aozgJd2ibw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABC3A6F8839



On 7/2/2026 5:54 PM, Konrad Dybcio wrote:
> On 7/2/26 2:21 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 02, 2026 at 02:00:06PM +0200, Konrad Dybcio wrote:
>>> On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
>>>> The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
>>>> bit.
>>>
>>> why?
>>
>> Here I have no idea, the HPG is unspecific, exact details are to be
>> defined somewhere else. The platforms, when they were added, just stated
>> that autoresume is to be skipped. Maybe original developers (in cc) can
>> answer this question. Anyway, if autoresume is to be toggled, it should
>> be coming as a separate fixup. I can reorder the patches though, so that
>> at least register layout is correct.
> 
> +Krishna, Wesley?
> 
I checked downstream driver code and I see this:

1. If the phy is qusb2 v2, then we are setting and clearing BIT(0) of 
TEST1 register.
2. If the phy is qusb2, then we are setting and clearing BIT(3) of 
TEST_CTRL register.

For both IPQ6018 and QCS615, I checked and its BIT(3) of TEST_CTRL 
register to be set.

For msm8998 it is BIT(0) of TEST1 register.

Also for qcs615, in downstream code, I see that auto-resume is being 
set. Its a mistake from my end when I added [1].

[1]: 
https://lore.kernel.org/all/20241014084432.3310114-5-quic_kriskura@quicinc.com/

Regards,
Krishna,

