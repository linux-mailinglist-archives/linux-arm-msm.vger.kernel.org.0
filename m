Return-Path: <linux-arm-msm+bounces-95121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIrMAefNpmntWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:02:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 735911EEE5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E30730804C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C20337B8F;
	Tue,  3 Mar 2026 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WREJv8gG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj/A4JHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C796425CD7
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538111; cv=none; b=dAkvQWUU/d33duf0uAjqXg+9MQwX7nGzrC/Id3roY4jRtyDRRmrIT5+PY41OO1yGCCe5daubRDQF5VjiRCoXVU5j9lZ2l9tYGGfR6dCFmcWBo+12U8521ALtxPUik5QRBKeI5sZ2Tc4V3B/gtrpyEkR0H4tnfZ8wAcn2hGQkICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538111; c=relaxed/simple;
	bh=44fcpOWYOj4FnsEC+MKniDNEyf0PATusYI8QPwDh9hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDOmBlPKAnLnCORMT9Os6yCszjhHzM/8W99taTCB/jDAEnz9gm9PvN8JC59KCkx18v4cgI+SUgJRrlBCy9Fw5nBo8MulxEBFlj1Gb+kCchrB2pS5fWKV9qTPhfRmzo2TRQZ7MG9AgV1N0WhTdzb9hD63tYqnd9oq76KK91PkQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WREJv8gG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj/A4JHS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n7xR2630006
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKRyKAlkLeLrmqMC+IV1+vMx/meYXsEvtAI+ChByOqM=; b=WREJv8gGN+ODwKr/
	bJ/o/6BJ87+TzCTObakAfGcsFjfuwbdUCRRtt+LeEcPFmzT8obHU96CF7ktJlCNu
	akmmLUbNhj4hjbbzRD4McNAvS9A7rvijPwZvF9qSW27T1KUAVQLH2MhD4DJ9QJOZ
	6+azjct+6k79p0heu//vJ7qzMA7aHXys3zrNgoPKnHgAixQrY5ldxFOp243yeaqV
	xUVOvpPCx48IsQ3c4ledQNvTV9lnU+m078H/B22cTd/DhggDVZ9kST00LUDXjbOl
	P2EAUPciX7emBTUqVq2Y7bVu8WbQ7gItRdKbEUByJrqLYwHbEOyrFLoAG9PCvIVv
	dLnQuA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5anbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:41:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso49537916d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772538108; x=1773142908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKRyKAlkLeLrmqMC+IV1+vMx/meYXsEvtAI+ChByOqM=;
        b=dj/A4JHSisWQePe4141GguSxw1ladKCM953FzXQN8f/trfTIN2+TwY5hSoTO+j7B4X
         hxYEsCcj4rT4pyVBfx6sA692J8Ou8AemrssPPkbioucYcn31RdNQ7E7nklNA7NHaQ+wq
         Wvq9q47upzm6JD3IpgybOLTKi49B6pMFojWDubMaLKPjwrJJhEQZnoIlxYrQfzcU9gTG
         NB+rwgxiCDHRJXeu/3rItJxy1up1B70WtwVOE8WjFDFRtm3Qs0Ko0F6+tl1nCL6tAYAO
         IO4944vlrlpqnIZSu4K7L4gBqwcEIkpy33Zq3oyBn/OAFAWDhQPgKjommrFJoPxYAsk1
         ZygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772538108; x=1773142908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKRyKAlkLeLrmqMC+IV1+vMx/meYXsEvtAI+ChByOqM=;
        b=wcQi8ZT5w1Yh/AFUnwpj1o4MperDEXjTlESE2332bkmcA7n/1n1ilPsI27ac84UUWZ
         gQwLv34Emhk4pIvcbJhPXR0ALpLKNI0r8XjdsU3L7fMU7BTWeLm87IN9AXuBMN/pCl33
         wKYI4iNQlft5l4hQpEPqmYfSkl9Yuoy+MypNnNGuIOtgJn92yjwDHOiX8xy+9K3RE2oc
         Ql5pjC1VCOeRn7rv+7wGbpeVD7lGScFR7V1gOUnq8eCGYf//C+oHpO/3/Bjrmg8vAbvS
         eueHoh2xUYo7kmkEhSD0SCjCIHf0OtyJXqWCPVr2kp2HQpeQRUX7rYUNteAxcJjGzFG6
         URVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgZpZDxZLzuPR2jMJLMuC0Y+LYSxhxo60YbLBIsxTuGAwFT1DHF2sQ95i9k4fmp7Y3lgcPtSFIplfgt1o1@vger.kernel.org
X-Gm-Message-State: AOJu0YxipZcSmz+kIPF6vD6N5Z6XLz7MDfdtT5O/okz+d5Ge3nETANBA
	/YMLy218hmqHol/BP9f4Zm80hsxPIZTywh/0C6GtVDoSJsHUMRsk0AcqfhDtXolOwQXSYFpwx45
	b8plJTVFSEORMXTWFE8PfJyBoXqbtCBh0yMymTSWlKRuA8nactvmbrsrgSc+hHFw9WOx/
X-Gm-Gg: ATEYQzxRHoX39mnh6iPwMj8YS/q9tgWQass8tMTP0kLNKpWqf1r2ahT7zKQueeL3Z1R
	ZxifgTbWRwL1gSbJ+hxu9WxL8Cyk6Ln8c0HNiYvaxiOIlRFsnH+AY71Ar9dv+vLqo6lFg+lwyWV
	dcB3v/cndZNR8by9nyxxT8QYq6Tn5ZoAolGxL87ZsVPLbZ3OcNS1div/TYAg/5F8lfvAuzE2uTG
	jus8HaWKIdb673sgHTmbBENelYeCrcfmNVg7HFCEbnGJusAgXkYIi1Wh78qjRx5zSfL+sCE+KWY
	h57JpX2o+cSPQ+2T0Q2nQWWs9nTseK3wuGFwEEjMK+mOgzp82ZL6LSJrTFnsU5AUhWCMsesfx56
	mb/9z9btN7sQxMFvxKCrX0O907LeTOrOuV9xWoTC31/pkbbHov3kpjpvKfV7DRbBWcrTLe8sH4m
	P3ZYY=
X-Received: by 2002:a05:6214:4f07:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a0ebe1e5bmr8817596d6.6.1772538108252;
        Tue, 03 Mar 2026 03:41:48 -0800 (PST)
X-Received: by 2002:a05:6214:4f07:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a0ebe1e5bmr8817246d6.6.1772538107791;
        Tue, 03 Mar 2026 03:41:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c9fc1808sm113845866b.62.2026.03.03.03.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:41:47 -0800 (PST)
Message-ID: <0b95b756-eb56-4b45-9c43-21379f1bdb58@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 12:41:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine
To: Brian Norris <briannorris@chromium.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
 <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
 <90b13660-1844-4701-8e63-7fde2f093db0@oss.qualcomm.com>
 <aMMcNn82AmSavJYf@google.com>
 <b51e1230-d366-4d0f-adc8-fac01b5de655@oss.qualcomm.com>
 <aMR2diG8zwvPRSXR@google.com> <aWBM5zl1kgvCZdnV@google.com>
 <8d334226-b8a3-4e22-9257-e6aa60fe2d47@oss.qualcomm.com>
 <aaYBrQlaSSf4aWpz@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaYBrQlaSSf4aWpz@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5MCBTYWx0ZWRfX2P4TgbBIm+Fe
 218et22Q/QTskpFnpaF7LRJofQOrk1GJXBMgm/pLoX6hwXxh/AYyrcdz7/etUBgxXMgjb3lvqxD
 /R/dXRiqMDwejNLvxiikeYTZvCnY+cZSimGufZsWSncL4O0n/gtQKbMowqdxSCjNGX+jDpT26NX
 moK0bcRNryhphGOqHJf/DVk6/fHy+X1Pgw6lUGCaqisT6Qp1RgJF48ZudeZQlCJEx7W47hAP4Gd
 4KLjz0CpD+YIYz+zezNSzyvYkMhnytp4bTAxvP4GUNcKqUyHYAdC5gQrxRI/rh7n+e6yGFDc+UV
 cMd0kc4hjIaiMeHKipzjr19yZjI3cc7bnY125n7hU5YruKWJI7p8wiiSTn7F9BGNAnxyqUVenA4
 gvqEOu2idnrZl9Lh3y4pSsbi5iP3KjGVg0115x8sHVHv1eNYjG5UeVEOUAXMFnxGptVleUNfBud
 OhRrqP6JmBPV1HrZykw==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6c8fc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=rqkR2MkYeUT9DoRLdnMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Rx4BedBTmS-GzPjJP6QoonhN9MXDNG8q
X-Proofpoint-ORIG-GUID: Rx4BedBTmS-GzPjJP6QoonhN9MXDNG8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030090
X-Rspamd-Queue-Id: 735911EEE5B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-95121-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 10:31 PM, Brian Norris wrote:
> Hi Konrad,
> 
> On Tue, Feb 17, 2026 at 11:46:19AM +0100, Konrad Dybcio wrote:
>> On 1/9/26 1:33 AM, Brian Norris wrote:
>>> Hi Konrad,
>>>
>>> On Fri, Sep 12, 2025 at 12:37:29PM -0700, Brian Norris wrote:
>>>> On Fri, Sep 12, 2025 at 03:10:16PM +0200, Konrad Dybcio wrote:
>>>>> As I attempt to find a board that would boot with your sw stack,
>>>>> could I ask you to check if commenting any of the three writes in
>>>>>
>>>>> drivers/interconnect/qcom/icc-rpmh.c : qcom_icc_set_qos()
>>>>>
>>>>> specifically causes the crash?
>>>>>
>>>>> FWIW they're supposed to be independent so you don't have to test
>>>>> all possible combinations
>>>>
>>>> It seems as if any one of them will cause the crash. I had to comment
>>>> out all 3 to avoid crashing.
>>>
>>> I'm curious if you had any follow-up here. Are you still looking for an
>>> alternative to this patch?
>>
>> Sorry Brian, it seems like all the "ready to grab" firmware image links
>> for this platform are dead where I would normally look, which prevented
>> me from being able to poke at this..
> 
> I'll say, I'm not really surprised. The firmware here is probably not in
> any maintained nor widely used state.
> 
>> Would there happen to be another place where I can grab them from,
>> perhaps some CrOS CI?
> 
> I don't really know of one right now. I expect the CI is not active.
> 
> To speak practically here: there are likely no real users of this
> development board, and if I'm the only one actively trying to use it
> with upstream Linux as a development vehicle, I can simply carry this
> change locally. It's probably not worth a lot of people bending over
> backward for it, unless I'm wrong and there are more people using it. I
> was just hopeful that I could reduce some friction for myself, and the
> limited (possibly zero) population who might also run into problems
> here.
> 
> Unless you really want to move forward, I'll move this from my mental
> back burner to cold storage :)

I'd really like to get to the bottom of this, especially since TF-A
support for this SoC lives on.. +Jorge & Sumit who are working on this
maybe you can repro/find the culprit

Konrad

