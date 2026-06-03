Return-Path: <linux-arm-msm+bounces-110987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CPJqHLw1IGqEygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:10:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B736386C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:10:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KQuj0fq/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=USyxEjPK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1474E308E2EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697DD480342;
	Wed,  3 Jun 2026 13:58:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA74480DC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495123; cv=none; b=tFg7IhVcahryw2YWQRKQHe9srCvBpsrx0nm3Xa3qoeMZQcpTIr04K+14K/zpU6D6S/A56S7Bsz9fMf3si/lvhvyXE+pXp7rGEHv5z63InZc47pwKNNj/rhX+d3/GVJlHRy9qJLvNFJpJFmIsQudhLS44jgOl4eEqlXRNUyDtK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495123; c=relaxed/simple;
	bh=x8J8/N+2R1uvmgb9p8RIKLrLL3NV4CkdX/BgzqZfPuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrAKucE+Mh6JiAWRpC4QzzTLURcnEbIQ8eCyfXsmt2MFmF1hNzgHf9qF/MSuIiNTQdk7enJ2x8dKWBtaWqiRYpMpH6uTrPpG3ggbTj7v1U/MGw5K3Ta9dG0SO5LsSyXZEO0NgHphOk6OwxfYz1WWuY1bxFB4eYyTbhrqFGL+v7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQuj0fq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USyxEjPK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653BvwgF1740442
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kfz6Dv68L4pwFmiCY3LaHQ0LYxLmU/e3hNomwI34hw=; b=KQuj0fq/FNlCX7s4
	0zVooYxNnJTlsmaulVFgXMdVtsEkF4D4a1mmEl4YkuBFHimPm00cO4Sp2x8uvd2M
	SzT0KOpHDmUgKEx+0fLs519VrHfVQ99D2BG4b7j7fT7HCjNs8717Xnkzd5nXBr6l
	CTFQZNZEUrUuxl7Jw4P61MfRgK+urr2hisbLmEAXf0eO5OCUxx3iltDcPKFmZGXl
	vFU3GDIz2ow/B/6VrWbRK2GxxIM7l84ZFb6McHdqS9s7kMEDPP0Hb0vGgBTqWdGV
	QhDD6qkPooZMdegS841a1YekNZNq+rB6Ect4skzIPIS0hdL+vSD4rDHnouDgFyQb
	XvGOow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7t416-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:58:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b8fd12aeso240001685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495114; x=1781099914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kfz6Dv68L4pwFmiCY3LaHQ0LYxLmU/e3hNomwI34hw=;
        b=USyxEjPKm+QdCXUe60YwTqErfYX98UxDa48f91HYpVRQ+oX6KFt+vfENggEPRZH6n7
         BrL/QaqF1ILfod1VyNuKqRQJf39ndHD1mJB9nSdFAl/0kHW+9frZ/DuBsFt9g4Mcz7oE
         +OOjwDsJTk2AcpnOUkBWOIeG6EGBXi9eul+XuFLvkd7drHOQ3Vnh7acY5R/X9kyACH3a
         xmz08Zu/U0/nGX8MPwfCLxmUOzIqcMLrRiv7KASxVMqMO8Na5/GkrRfXkCz6Sk2og51l
         JxJ394vwCbX56s4rlQRjvBfwizIOjoQZKW+cOk/nO1bFlen7MdIHUCEWHjbRoPNuYRyI
         UTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495114; x=1781099914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kfz6Dv68L4pwFmiCY3LaHQ0LYxLmU/e3hNomwI34hw=;
        b=iF1wtxd5xW6DuaNJJ1EV08E4xLhnNUMDodkDH0L3jb4YO2KxGjN/zlGr4ElQ+7xLGr
         x4kQ2ezoTUVdnPgosvFWQmgSP3YIVUjEX7QNFT+E5E8p4g4YwE2Mnvje+2t3ygtRvTwk
         7zrn3OK/RoJ4322G568s0xJ3aJLyHmfx8wUw95pPhnT3EZsG21YkgoXznDALzk2AOoLW
         rTxyzlhCqpFjWt2uo/1SynOgtLd5hXr97z3XEzw5Bu1FgSSCQWXWIzSREbcvU4DiqUyL
         wvjDV5u86yyA96rdK75n2nuoXRdTgnIPIxrztyqf++E5NpSnWALYa2Nrxp0ZC0Z5I/7L
         lyEA==
X-Gm-Message-State: AOJu0YxPECEDLj89auwPS8jYtReRhNAbG8wKdGbWr1U5h5zf0tjmjNSF
	ycJ47ONucxrtYwWv6zdqO8NxHivw51teIOne4incKTUFdKV+3fe2DJVR+65Y2lxzEx5SNqDofgT
	6LjhvqhIYE5WGiBOX/hZGRXMLzNx8UjOGm+QHCo3f483vOUAYvFG/i5e7SI0ueTg/HEZy
X-Gm-Gg: Acq92OHVd+wSfIkadn7CLNWfwYzxZNEelRbcV42J/Qo+4RghqNig3qdz6nUlWOG436Z
	HCtGVIiuYlJEew1+l15UfrhIG+Dfged0VjNogDhAfEXxm5LVEAGoCDRtJstQ7Se1hTgkaARaUcm
	l1Zu3dsJFiJQe15028mlBm6w8Yl/KLdp9fiW/ypWrGkObzm/r3ryYMUfxAJ7hAAHKZQgIQHEnpr
	48yLi8l1rqOSGbQSI5nv+QAChwP0qtz/g6gWRqJS8/uQBZXebUMn7Dfs2ibYR5fMUt1iu2Zr55t
	8vVBxio70488cVaZ1CSOjSlN4i0odW69FzVu80RBebw5dnEGiNlyP8EiEvaj64xNJ+cLVTuZavj
	OMdHDdUaSGdD6uZtMSsYdQLkQOHntsOyuX25rCgl8gLT1Ur5IrmeigFb+3QmldGYLLbntPhjRwe
	/JeusZwusChK4=
X-Received: by 2002:a05:620a:6ccc:b0:915:7c1a:1388 with SMTP id af79cd13be357-9158a3ab0bdmr408457685a.5.1780495113829;
        Wed, 03 Jun 2026 06:58:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:915:7c1a:1388 with SMTP id af79cd13be357-9158a3ab0bdmr408453685a.5.1780495113378;
        Wed, 03 Jun 2026 06:58:33 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2d2bcsm1227544a12.10.2026.06.03.06.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:58:32 -0700 (PDT)
Message-ID: <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX0YVb6wL346G7
 /1/EQk9PIOI8U8hx/I47e/0f188hOkpsAZv7x+hRH/yjnxXoIuJevUMPu6tA93J0g+/ppBGFz6a
 Vlof1T01Exbjww8p8vQsVCPttOQ7lKl7RBxdk2hMc++Fp+7zR29P5QjbUBezjlSmUjfyVrzl1Ql
 7+ogYueu5wpWPi1ZPOxkiOQ3psgq2ptZMiZOIyi24lKIeYF1HfN/dFTLNTC4dnZ9Qd/8RDwPCjA
 wSge53cOWB6EQl7dY8ro01wb35VPS62S9G6vM5N1kyezp22EpVfwmSf2OvF7V0eltxgljjzRbed
 4f6ejvnG0pseMnc/Kmr+3EatgqjCTz3Q2mQEMjJ327dUK/7xB1O9txlVBJt0ty654i1ROjHbGeR
 DO/nwqSFzbo3THVbjPjM8nVWwkkd+35inLNgWcxaSjxyS5hcMBUYGQrL0y3JGv8x6nGTmAvOC9N
 krTBTivq8CYunDCFVGA==
X-Proofpoint-ORIG-GUID: kKwZuVoY_9CF4sXOoIvkGJH6Z0whBcJZ
X-Proofpoint-GUID: kKwZuVoY_9CF4sXOoIvkGJH6Z0whBcJZ
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a20330a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B2h_tRwOUKtx79AgloMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030134
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
	TAGGED_FROM(0.00)[bounces-110987-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66B736386C6



On 29-May-26 14:55, Sneh Mankad wrote:
> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
> variable is only used by the threaded IRQ handler to control the number
> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
> register a threaded IRQ handler, the assignment is never used.
> 
> Remove the thread_op_remain assignment from
> tlmm_test_rising_while_disabled().
> 
> This does not cause any change in functionality.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
> index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
> --- a/drivers/pinctrl/qcom/tlmm-test.c
> +++ b/drivers/pinctrl/qcom/tlmm-test.c
> @@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
>  	unsigned int before_edge;
>  
>  	priv->intr_op = TLMM_TEST_COUNT;
> -	atomic_set(&priv->thread_op_remain, 10);

Should this be setting priv->intr_op_remain instead?

Konrad

