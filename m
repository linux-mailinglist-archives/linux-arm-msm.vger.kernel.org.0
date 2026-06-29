Return-Path: <linux-arm-msm+bounces-114991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bb4jHytSQmoL4wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:08:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE3C6D9319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=piX7RmSp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OLs1ccOx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA96830250BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E2936CE10;
	Mon, 29 Jun 2026 11:08:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A545366DA5
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:08:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731299; cv=none; b=j7ubdn7hcvD2Ao7FrJ2FwVk/PMxvgQQjlZsdOHWS9lrfkyyyrVwWe2Zl2gmcKrM4uzIKKHPdrpNH+5aq3TFO7kMU4rhL69HXcIcqm61QVkKsbA3Arjnzri+eEXOredsoI5mb0nq5pm7/s7tgL8LbUTjNJxhkFRLSGtj/wwr5p3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731299; c=relaxed/simple;
	bh=p5oeSozrPpVmGY6T9fydOAx3xRD71h2scVUiMjk8UZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIhcqYns1YdU+l91+Dxj8D+ky6MgsC4B0Ec+esiornxKQaaJDT2zjWV6LrsFDnhDgPIBuASI2BzArcN+89pkEo80P57idwnyQrx9YH1H71g0p+ER2RrtZuagGyOtX4DmLU1Of4cR2rP2+KbiszNZCo5RB/8AaZ1SZaKEBtF/keE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piX7RmSp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLs1ccOx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASqHa2601127
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fn5b8KchpWy8FyyHPcxO27rsnTJuShm2MrGXkaTyXWs=; b=piX7RmSpG530hazT
	Lyl4SB23dacMbmR9OW+0Jtjm0A2hj3jmr2LM9IsfVQmEFHFfRQhSDVnXqicrOz2t
	UMtpV+c7KML71+jW8KL23mV9KQ5QAy5v/F8yZxzkp7PjJTdCrjL+3LfNsE/Eylcz
	s++Y2lXgIm07nPBMQbidh/Mf6VrwMZfPL6KUQMQUOC0h8/2GooZRrCC9YMog5mxO
	aB9q61txPYcp6AdcG9+d8xPe6wnq2wuOm6aY7xdvqDi62+irCcYjWUeJ1R2hGI+a
	kU5E5hvQvp1TU31uCxPiVRtgxXA5RkEbQGd4cGtTVfWnZRN3xNS4o6jB6hko/gXX
	csVqDw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8g9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:08:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so167787e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782731295; x=1783336095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fn5b8KchpWy8FyyHPcxO27rsnTJuShm2MrGXkaTyXWs=;
        b=OLs1ccOxZTcVgaFv0p/+hLKSdE06m8YArsy52QAdGTKK7Vdxpa9kwU6URC3jJmjWz+
         x3oKNssjwK4+ZlgKAx43MKsJCY+o2Mk/49oYiRmxMVMbE/RgtzNA7o0mPqBXQc9LDJ1i
         Q86I1uQSmL04wj2hP0fxMXHLdkXISCuAH7gHknwgruQXrWOJDN0L8El9IOml/pIwS0jX
         7shhotTPqFARNN0JfoeJBQ7lLMcgX4WYINszBQiqFFDfH23QGlzyTnKroGfzl6SV0RZB
         YuwO+uOeFwUSCZbgvZCb87WOOp0gJXr3yjl7o549Ac1bei4tAnswsRuepsZi0536Xlo4
         NnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731295; x=1783336095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fn5b8KchpWy8FyyHPcxO27rsnTJuShm2MrGXkaTyXWs=;
        b=XbzkVpZaTlClxYri+cTl/7QdRS52owx38nZIk7W9LaTVIOoASKuGb3/bseGUtGFAHv
         YWccbEMMZHu+Lm5ooXz1buwr0seoL1V6Q+CQ1t3o/ydoF9MrJV/K5X0sjwsj+ec9CjQm
         jHYHYBuURaKN6o6d7IBvFgpYqapBPdAkbzUamcMu+gPaUr359g1ADL71PoxU+bbEqLwB
         Ex5hwi6I0xQYZRet0cRV0bDIyxbJc/yBWdKCQrVPmx1r5pJzwhUOz1QPRPzljCGR3Z9u
         Rt343lCnHfo/Uf7qeAF7AzwayGJyubSJaNOli0c96eM/LtC3OP19D1k4v2swi1AY9Mnj
         oC9A==
X-Forwarded-Encrypted: i=1; AHgh+RpmG1QuW1VXn9pdGH1d9MSoDrHUaNRqn4try0xYkRwwr4PWG7Xz9uAkYO2DLZSIJqf06aLOiutu+7gkKFBN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkjr8JgIcclUy8Vu4ppDVDFF5Uv49rTh1Z8aXbVakYwu8v+hkP
	y6qF0uPBCVUc6OnMQtAxtm58tkNwP8qKdRmmSJNtllHW+1OYsBBJeQAk73tGbCX+6iOEbw3blPZ
	1qCCQgxUSRJGfArD1thfT/+v3E97WFYRvmZNBC510N4EdGqfsa0w15kNdNrO/5n9NOf2s
X-Gm-Gg: AfdE7clrh41oEQfoVVNVeWXB40jUDAwX4Cni4vNDMKiAzA98zaNZHUncm9phIGjgjvd
	Axl4/PDattIzzmFcsz1ssdRrLl/2liSIUZBBMQDwvPKrU1vljY+aDy1N7prjxvJQBqzItc6r6/6
	eluUe2nE8qN/kwZyyFu97HUhtlBcl5us+lyxSkgZsYyB2BnmVEjZ1q+CADkn00kJalZn3Qpi3RH
	As5uyP1i0kqo1cxK0z6PpxjRYRidgeXpfZr3PWFCrbLYWTeSFEO9mfWeeCnSsaFpggIpLB64EKy
	XpjFS3iZtV67z3GyQGRml0aeNtesiMNXsWvsSYZXFFRBgNxqILQOPykLIQPYO8bTyXujoZdmmo4
	BM/64vK4qUTJ8YZup8dhgdG43JORo0u5cJ7M=
X-Received: by 2002:a05:6102:8017:b0:738:a78f:5483 with SMTP id ada2fe7eead31-738a78f5743mr462610137.2.1782731295150;
        Mon, 29 Jun 2026 04:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8017:b0:738:a78f:5483 with SMTP id ada2fe7eead31-738a78f5743mr462596137.2.1782731294673;
        Mon, 29 Jun 2026 04:08:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd36adsm6984719a12.27.2026.06.29.04.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:08:13 -0700 (PDT)
Message-ID: <cc8678f2-49ab-4754-8102-d567b94e52e9@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:08:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
 <d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com>
 <ajjloqm9eOkrr5W9@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajjloqm9eOkrr5W9@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfXw4HJUoS7NJTp
 yg1lwZ1yofYiDDCvUdyeTyIfiRi6ib3s3PEQUrbU0414eXDbj4pq9G0BrVKsgDEoDIqW3oxoa50
 pBL5dQJ40NdWHhGH0yLxDFv9suoBKZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX32l0fOeyQZCd
 lnpZaWQRnJYmP5CGX8KgI21yCbp5uhgH/QvZGl9efuR/o1eOxYHsoxdFluYcKfrf8xG/vvxamFT
 lLqRmne+679E35UxqWtDmq1DBDslc78BZWuOOMeRxN+KbEQrUnr75oCQIxXNMJlKXFx9kSqHSs6
 TQvNPQtTwI2fUuYt1mtA9IlI6cUirD2wiDZ65cmfWC02QVqvE5H8wkD+PaOV60jR840xAdBo8f6
 KMHnz08L9xtOqRP8P/cTqI3fdLkUWOL3ZCviGOH5PpRxEKJ6Nc8pPymwC1+GjnltjuOPrzVYJOK
 naCHXyAbelZec6L07eDlwbaJKbOCbu4gLjBsSW8yL+P8tJYzgK+ouMhY1ad7Dit7ilpp5TWjlv8
 9X3ZneGejsHs4xqH0lUndPC7RQp+xfdJw6RAqMg4nd2o9JxRITYt0NJ5wuQ33SdhUVFmW3osVri
 u92Q/WPZer/kd7eZksQ==
X-Proofpoint-GUID: OmsaX__4vuZwgyyl7VKNvM6uiI80aS3I
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a425220 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y01jbQKe1eecyiKPCdgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: OmsaX__4vuZwgyyl7VKNvM6uiI80aS3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFE3C6D9319

On 6/22/26 9:34 AM, Abhinaba Rakshit wrote:
> On Thu, Jun 18, 2026 at 03:01:54PM +0200, Konrad Dybcio wrote:
>> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
>>> Register optional operation-points-v2 table for ICE device
>>> during device probe. Attach the OPP-table with only the ICE
>>> core clock. Since, dtbinding is on a transition phase to include
>>> iface clock and clock-names, attaching the opp-table to core clock
>>> remains optional such that it does not cause probe failures.
>>>
>>> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
>>> core clock based on the target frequency provided and if a valid
>>> OPP-table is registered. Use round_ceil passed to decide on the
>>> rounding of the clock freq against OPP-table. Clock scaling is
>>> disabled when a valid OPP-table is not registered.
>>>
>>> This ensures when an ICE-device specific OPP table is available,
>>> use the PM OPP framework to manage frequency scaling and maintain
>>> proper power-domain constraints.
>>>
>>> Also, ensure to drop the votes in suspend to prevent power/thermal
>>> retention. Subsequently restore the frequency in resume from
>>> core_clk_freq which stores the last ICE core clock operating frequency.
>>>
>>> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> @@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
>>>  {
>>>  	clk_disable_unprepare(ice->iface_clk);
>>>  	clk_disable_unprepare(ice->core_clk);
>>> +
>>> +	/* Drop the clock votes while suspend */
>>> +	if (ice->has_opp)
>>> +		dev_pm_opp_set_rate(ice->dev, 0);
>>
>> The PM core will quiesce the vote as the device suspends, this is
>> unnecessary. Similarly, the rate restore logic will become unnecessary.
>> Especially since dev_pm_opp_set_rate(0) does not actually do any rate
>> setting.
> 
> This section was earlier discussed in the patchset v4:
> https://lore.kernel.org/all/7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com/
> The intention here was to drop the RPMh votes once the device goes to suspend same
> as the storage drivers such as mmc drivers does:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mmc/host/sdhci-msm.c#n2946
> This was done to leave the hanging votes *on* for unused clocks.
> 
> However, I get your point, due to mean to say that once device goes to suspend
> and GDSC power-domain will be turned OFF, it will automatically quiesce the
> performance votes?

When the device's runtime state goes to 'suspended', all votes are
dropped (which then propagates up the power domain tree, effectively
lowering the vote which passes through the GDSC to the parent CX domain)

i.e. "yes"

Konrad

