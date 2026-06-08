Return-Path: <linux-arm-msm+bounces-111729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlhTKpp4JmrlWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:08:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A9653D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cxeLn7Kt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rx4luj8K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111729-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111729-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E62D5302A6F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5D33955D3;
	Mon,  8 Jun 2026 07:59:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694C538F646
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:59:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905586; cv=none; b=bunYIkX8iPGivycEAHiY//vetZ+8z2kCk6WTJCrCv5F3AzItbYgb79+55s6ThbspgZI1UtifFOD1Pz1p3gukcMmJ0MnnRy1JF510PXxaIucI80/90ZlSDko2hECFf0exOKSoF0i91oOaKeULXeuUl/UkZTwYrrF7kHk/a0vG0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905586; c=relaxed/simple;
	bh=ylFpAwNTldix6A0s7dSe3/1hV/92cXXTUh5QCauqNT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLOr6meb43lj115faaMYBsbqdZi+YwWQZm4JLINHGpNO+CP5Z74zsTygXatry9S7A2U8aJTWiT2/dauI7JsLv8hQ8d+3obnBM2/xSfb4h6HoL+wFQvIcnPuGHw4BeIZAYTQiDnk2+BzfYViFwPJMC3875HXUGHuhtZv3mDQ2jd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxeLn7Kt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rx4luj8K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PkSA2733104
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsCO5uJLKaGY4bZNguhIL2FBFY5UouWblNWngdY3+Cg=; b=cxeLn7KtnvnsoZCJ
	2kZmbyjBzURJ3EjGqyCw4Ew2ghtrB+YwZM207uKNR/kafZTZJCe17DgOf6WRZa37
	3CZqschLBJj3jYGlIH+HHDykzrjdwc4PBwFfSZgeL79PBV//PnSjrvooDZ+TNi0l
	WsTltbzPOemwxQp8Zd4ZIYWqIsEaeZjR7ftMT5i5/wlJWfD7Z/wTdlBkPb/Yy5OV
	79FiJMyWXjB0rtjeqDmRjDPytwASKSsU12sK8sJ/ULvUose1fSxvHj+YnZFPbXbI
	tfWPEpSaqZb0oxstFRMS7Ri80byOAtD6OvWvPY2sVvZT2CrXT9mnL2JE4vIAgOHr
	6PL3cQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6s4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:59:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ce9ddfa7ccso8729476d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780905584; x=1781510384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsCO5uJLKaGY4bZNguhIL2FBFY5UouWblNWngdY3+Cg=;
        b=Rx4luj8KEgyPH1yciFHwxsuf12B2uF1i/uucl/VKOys4cKmlJR6n3KigBfSTIqVRON
         4AS9H5FcH0mOXTJpzMpT7i5MMV/lzdxf6JtR7U1DEUzSIicj9ytMsZmzTgdfDs6GQjnQ
         mD6n56kXHIY0TtthVZtPeDKFzQvqgCb/LR9U2ck8r9/r/QCBjaKAbe88/ThQaeFfKFdQ
         9IO+QYRZfeBZvkZnrf6YGpNnoeiS7+vTcBdWOR/hWvsMNF8Dngyy7g1AxQypHQRRuQ/K
         w/dJQEBVuAxCmQ5MFEE0DE8ciQbtzPqWfRr7jLl3PfVcscCfdfpUWG3ok0Dc1Gv5snVV
         1YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905584; x=1781510384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsCO5uJLKaGY4bZNguhIL2FBFY5UouWblNWngdY3+Cg=;
        b=SWn7Udw8CfJi6SCRyFFRPr71yedWtqckw8w+SIAv1bG7CrgPB6q2wO3H2BYbk6AR2A
         fGxlF8gV5ugSD2fB0tWIX0Faee+Ms8BBvLL5+E+aVoIy5k5SQ67+7LFoiAlT75GIdInY
         FkImiOcYKu9rfRySdRMNfIwyJu9tOlO/miuhUBW0Al6WywwZFdlUiyI1BcUXmhXyqRyA
         hM1NJostpFiuMy7ygKZoENL+8JIlMYa3bt5FBcjKDzR9WFhMk864zxbz9JCplAJEEuLL
         WS997gVXGlzAzAsBb/YeTwn+w6S27QVVhUCtwpRpzxnIFD1EK7t3JpeoF7xDBDpIYJWV
         mrQQ==
X-Forwarded-Encrypted: i=1; AFNElJ82vZjmGpaFLz9/o/XNrHrsQjUSjgKTlV1zYsdI27IXFTR+f8aeVpmSvYL0h4jP+6Dr8z/64wQfoL6cWPaw@vger.kernel.org
X-Gm-Message-State: AOJu0YwIVHyldcA20ckpHM5pL0UcGa3QGytknlewmYkp4juw+sPrxBgf
	OLkmTuZfKEmSkhrx8YeF9s0KmgMcVX2+3GPv5POXotEscFM+PTX03JfcX+q/vRqHMOJTmXgSvpY
	sMBkWx7iphGctMYdxfg6f88r/xsUEvPtPCa41ocDMR8Eh9u38g3PmBw1+YcFJQeQHy56M
X-Gm-Gg: Acq92OEx3DtMUwKVFEWhe9U5Cv+CSrkO99Ok0d6xHltpIgRTIzFqFYJE4nwD6gnEsN9
	K1hFEUGKRCN3FU/Dw2mdMPehXrc4+2QqQLR6++5cLHKN+WcV4na0dsLtudiNi/QyfiElTeNZw9X
	gnZlm11WrG036yV8KB/DwCjOVDbrUqrgQItaqzR00PB/U5ASgTqYt14/hovlVaECdviBRn3NAKG
	Oe813iivU5mA48AZd35J9gcSgp3TEEN6CKBOBtoA8adVMTJzKqKLu/o9jGRS1FBYdQVsRcTHiOE
	XCrLh5X5IcJlGvlp0xoBanm5KYXpbcvBpfFUNXkEKpBclV85gFz7rLFeL1QDbdoXpCLbPZTQMMS
	SAAkj53IX4HhYkvZLKFXxu4ZWtWmM88mhV0PD6TvilEQgeXpN5K769lpY
X-Received: by 2002:a05:620a:1a18:b0:90d:11b2:80f3 with SMTP id af79cd13be357-915a9e00484mr1423020785a.7.1780905583635;
        Mon, 08 Jun 2026 00:59:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:90d:11b2:80f3 with SMTP id af79cd13be357-915a9e00484mr1423019185a.7.1780905583190;
        Mon, 08 Jun 2026 00:59:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-691afe82416sm1306874a12.13.2026.06.08.00.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:59:41 -0700 (PDT)
Message-ID: <4a72fee8-8593-478d-abc4-b4105ef7751c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hwrng: qcom - Move qcom-rng.c into
 drivers/char/hw_random/
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Om Prakash Singh <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-5-ebiggers@kernel.org>
 <w3nvohaf7qvfwssggdhoqogwtcfmucfzqiuihbtwly6iqa2i46@3tybaiubfn4q>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w3nvohaf7qvfwssggdhoqogwtcfmucfzqiuihbtwly6iqa2i46@3tybaiubfn4q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a267670 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=rr1I_Jm5zLitNQkIIH0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Qx7UB1YCu486C5ByymdRhcm89uwYcCUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MyBTYWx0ZWRfX2KiEYcwMsChY
 3SunEAPT+nToy9GffGanj10P4HW8qe55GdJkPTM+lA3RlFMpsryHphYm7dFewAK0W+hPh9ehZCd
 Be4SGVfIePOLZaZmXqnlYWz2EucENg+CLH7o4w4ceJGfFkSqKM7sP+l9j2Gwu+ihgWLGYPw5u8P
 Mqn/Afuoa/nMvfZBpwt2jqLMOUfWT705Qt7ql4HBSHvC1YZngvIsyWor2jZcBUTGv4YhNb7g33o
 ghUk7+cupxdVKtm1shY5DuY3tSvLCUWsdiqptEiIaj7O0Qy8cX+p+7gM+pFA7BffWgU1gwZxGvJ
 LNpBmIfJ1f2duuLrHpyDyStCzTdDWyh7oyxrZQOoWzskorhLnP5giOMSSmJOodzxOVAJ+WImtUs
 k8ItQItQLFuz4AKKZjOM+4BHADGNNhi0aCKWnToBzf7Qycqdc6mLkJAe/yp7Xrfq14ZZLw0iboW
 6GH9bvuNY90bgTWlsgQ==
X-Proofpoint-GUID: Qx7UB1YCu486C5ByymdRhcm89uwYcCUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111729-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 383A9653D3B

On 6/7/26 11:04 PM, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 07:03:32PM -0700, Eric Biggers wrote:
>> Since this file just implements a hwrng driver, move it into
>> drivers/char/hw_random/.  Rename the kconfig option accordingly as well.
>>
>> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
>> ---
>>  arch/arm/configs/multi_v7_defconfig           |  2 +-
>>  arch/arm/configs/qcom_defconfig               |  2 +-
>>  arch/arm64/configs/defconfig                  |  2 +-
>>  drivers/char/hw_random/Kconfig                | 11 +++++++++++
>>  drivers/char/hw_random/Makefile               |  1 +
>>  drivers/{crypto => char/hw_random}/qcom-rng.c |  0
>>  drivers/crypto/Kconfig                        | 11 -----------
>>  drivers/crypto/Makefile                       |  1 -
>>  drivers/gpu/drm/ci/arm64.config               |  2 +-
>>  9 files changed, 16 insertions(+), 16 deletions(-)
>>  rename drivers/{crypto => char/hw_random}/qcom-rng.c (100%)
>>
> 

Seems you sent an empty reply, Dmitry

Konrad

