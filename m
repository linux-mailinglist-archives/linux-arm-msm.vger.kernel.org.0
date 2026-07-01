Return-Path: <linux-arm-msm+bounces-115680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JYKDJBj2RGpK4AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:12:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D06EC99C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bF1dlqWy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hQ3c8Z+A;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115680-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115680-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F3B9303A8F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754B5426EC9;
	Wed,  1 Jul 2026 11:12:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6923B8413
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:12:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904333; cv=none; b=lqAohUkJUsOrJ/VG4FOSFgXBWx+6U6yN99eegnR6UIwkkD2B8rW/v6wWsBsWzSXvb0j4e8hLj66jyLZM7rNao3OhvkaqNoJUi13qY6Gz9IymEdVU5v9BeAl8G/y9CC8GMWX7dIAtALn0umwnok4dVqBWk57DDsMrVwwbdNB8lns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904333; c=relaxed/simple;
	bh=sHKyxBAXP+64IaiR9M93nhNYksJ/qP+JBSbX6tLP3sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FudAwtmN0Ri3g6Ny+V7oo2+PrWKZ7FP+w+uPag/CCyHbgRE6wg0pClgsN5RNtuKVSkUb+dLNfkJ8lFIMG9heC3Fo70oYr2kDEV3f8E9xZ15mS/mL6ShxbQtBQ0O87Jm0hzhMzMeLQEv+k9DytXBBlweQHm3H1vsuHxBwQPt0fh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bF1dlqWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ3c8Z+A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8nUB683610
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VX0pngcjZ1Ha/IfFO5ZSf47UTey90yV9N2eI2uJkFb8=; b=bF1dlqWyy7jetzrs
	lApLdtyT1LjJnNRxOXwdRjZpol1XeO4NzKWuRaPsX1XQ1MqAnC2V1+pg/jZ6mw1B
	WJ4ZMNyLzYfbEkzgXKXn/SIHbIC0I7MjN/Cd1+3lPut2e4ojPEhgI+CH1u4Zww0t
	aUntANuozYhY9xqfj5DSc7dFOdB99e+52WnoFhMEKeL2gsw4O4Wuit1tsADC9Qjd
	ufPTWMO0n6cse++z9yqef3vGY8vIBbxfCmR7xgmWtVVBXKeHcJASQNmn4iVtPImo
	Q34IjSAINE2b8ExJ3ous5JgC7y5U1ANCydSVGgaIU9Zfv7TMf7BpSNkAXDfW/czw
	kz9jBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqkwpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:12:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f150e7d40eso1409696d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904330; x=1783509130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX0pngcjZ1Ha/IfFO5ZSf47UTey90yV9N2eI2uJkFb8=;
        b=hQ3c8Z+AvMr+opJ+MzQMYybEygZJWOdjY9E1BzZm8OY/K3zDqOGdEoCPGwlSUBcYub
         Bis2jKkNAaBQhX8+p8jHP7Dzf5dRNe++rNNTxYGvqqx5aukkJKjQwPuthPSaDQ2A+AJ4
         gAgslGL1BfpRDUpPFEiau7u7VKrriT88MufYzIaMONW+dbAiQlq/1Y8IZQo8ylM6LT1j
         thJvQIjULYxy0gV4u8TDI9anXllTkR+luBCwCFJY3gupnRY3oJZT9f6GNt0fJqtG04kn
         RoJO0j1mR+fMKGXyEHq1WAJEOnUYxSH3Rq3fquKyfo9rwigpHlD0yTuQwPVGLIdRH9Pk
         BlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904330; x=1783509130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX0pngcjZ1Ha/IfFO5ZSf47UTey90yV9N2eI2uJkFb8=;
        b=ZVov0gA37KuyXjQ2UFwAvbEXfak73BaFZ0R8xs8HDevKgDo3DOeZQ37QqtDO/VuwVD
         4UlqTVDXt9xt9zpkf6WGd0ANiJsLIqszmCkO+u/wc2L/xHyUlQjf+Jlabi+KXKh/COTv
         44kZUW/Gt2U455rkYorp8IfxZdEYDWtry+M2x5P/uFnkI0d/tLoQru4kla6axBKDZuaa
         l3ub6D2XpYFBHpRCMqorsJ0xg4pSN8qFrC53NEByK/Vz3eGvEAMMdjdaNjYEsSPqCjR4
         yCDhBwrBK8DnnQH2XVNjhLNadVkXRzKrEYKeWhGyqB0FQa/zfIH+q99mmkxus8ww1W9z
         dkbw==
X-Gm-Message-State: AOJu0YynN0kWCy7FTp/KWoZ3djdMSuGbgU43GBe2p9FS/kSRHsRqc51S
	VmEa3898jeB94prP9dbu0q/j4LyUkscAr1WC4qGDnpqQatOA75rEDnAwVRJUif72bUYyqV+7Wkr
	0UUAWJ8Ih7Wg4CXcncikw+QoH/bFdNR3Rko1z7Vxj8wPgDq4BmPrt3QCCAsLPdHKDkkE3
X-Gm-Gg: AfdE7cmzUx6DBPrYoE2Lr2CGKU3IOQDpfbE0isUXpgsqVX3lMXliFwahVyl5ekrrziW
	0Mh26+7AN3Td03dMkhfoNyf+dyqPwKAy+CIA4S8IWA7lg9O6R592RP4/5LLmi0n1MKlm8M2Rmdb
	GsMlLHM35zL0snIrlbAuI3JU0phIoJx6sLH/8FiWzAm52xZRMOYYBBradI5FOnPcZFXnGilXX2K
	0GpUjJEHmJ1nG/+YTHY0MQ4VdPTQpLyDYzys40Li9L6SK+Hbnw2nSvvPQoXVYlH/DKhrtogwqL8
	Pi+SIasUiel6HKzJDQnKs3NgyAxlca1nnvBEVOA1Ok2FC9Wict3E3FefVVe5Py5Ou9QvmmgeWJn
	gMaKrQhUo1pwVbaupf8aVJs23kgmIgRaCLfU=
X-Received: by 2002:a05:620a:4143:b0:92e:519a:7c06 with SMTP id af79cd13be357-92e785379femr93365285a.8.1782904329425;
        Wed, 01 Jul 2026 04:12:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4143:b0:92e:519a:7c06 with SMTP id af79cd13be357-92e785379femr93359885a.8.1782904328767;
        Wed, 01 Jul 2026 04:12:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm257626966b.61.2026.07.01.04.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:12:08 -0700 (PDT)
Message-ID: <75858d5f-edb9-40a8-a4c7-a40cec09b6a7@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate
 firmware size
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260701-qup-se-increase-ram-cnt-v2-1-0618a19f26c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-qup-se-increase-ram-cnt-v2-1-0618a19f26c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TUXsXQP_D3LbWKUsr87yBCMdNMHOFjMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNyBTYWx0ZWRfX39AkLjMq3QD8
 sZPm+E8deII9gnu6NBN40KsybAkdSRNecQnbCsoFATMu3nK4yG6k8XtdWRj7lZpHX+9rK5vITHJ
 HSYm/3Px3cgKlg1PQHm0gi3+9wr4CYdXTfdkNyHe3EjBUW5Nzk5tYg8GbmdK3A8+chglqgqjhCc
 UqbqqI0Dm041XYlIIzpMry4ZaUHPYk/y75RUqnITN+R6fmdaraQ1SwZfWizn1qfVx8kiplHxTeD
 MheVM0B86a+Rl7Cn3U5txiUBc2GfVnmQwxva2HlK5KMyuoUPbO+kDMRr4qjSWyGbLlvEK7y59iw
 qE6rmK330ZU2Axq63muTtm23ZjwKArWaYlcUSKIXmy31R5J+USGNeklhyLhK3JiDygJ3tD9POJW
 50GE9xMkJzifRcGPJIxi32CUVEnM708j2MPK5ZwGLd7nDDjVMVLfOy5a4UmMmn3E48/bvSlV74I
 8QuLCc1fw4bLucKiGiA==
X-Proofpoint-GUID: TUXsXQP_D3LbWKUsr87yBCMdNMHOFjMG
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44f60a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q7hu8fOgrWGrelQ5SqEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNyBTYWx0ZWRfX0zp5TFCALpfY
 cLIVjxgOfnYek7wRvClhVmbGBglDYn4Y371bgvg3JFMHvZiTOBiss+YLRHGxUTroiA6JVOAan3F
 i2xxpThuwtaNoXA+2RnU1pmx22clZ8k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115680-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C39D06EC99C

On 7/1/26 6:21 AM, Viken Dadhaniya wrote:
> The hardcoded MAX_GENI_CFG_RAMn_CNT limit is not accurate for all SoCs:
> some targets have less CFG RAM than the constant implies, while others
> like QCS615 need more entries than the old limit of 455 allowed, causing
> valid firmware to be rejected at load time.
> 
> Rather than hardcoding a constant, read PROG_RAM_DEPTH from SE_HW_PARAM_2
> at runtime to get the actual CFG RAM depth of the hardware instance and
> use that as the upper bound for firmware size validation.
> 
> Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

[...]

>  			dev_err(dev,
> -				"Firmware size (%u) exceeds max allowed RAMn count (%u)\n",
> -				fw_size, MAX_GENI_CFG_RAMn_CNT);
> +				"Firmware size (%u) exceeds HW PROG_RAM_DEPTH (%u)\n",

I would just say 'exceeds RAM size (%u)'

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

