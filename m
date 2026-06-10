Return-Path: <linux-arm-msm+bounces-112395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RLegFvY+KWrFSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:39:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A44746685DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:39:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pR/iW+jS";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MABQi2Ki;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112395-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112395-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 747DD30E812F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6D3EAC61;
	Wed, 10 Jun 2026 10:32:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045F3F0A96
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:32:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087569; cv=none; b=BIGSG/RUh5VUnM1xN0bQcT0wFrNxjTeQNw4ZRQXE0B+OOd1mCoCdRAfaO+OuQxRWkVV3Rww4jy+wuXgLhBlINtssl0qEZuIo6rDNjdqjKwcpiBsEHHuii4GPp+EgvHWCL30gSz1Ka8r4G7C6RdgELty5C19VyKjionRpHGgvg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087569; c=relaxed/simple;
	bh=wvlrq004J8XGxRTgYoOIMmtlpqVWK4U8EGi7tNg8gJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIjDAGxa5KjaCq3jyBmtY62A/UbVk66LM2hUzjKSp282l+6FhpFdKJMtND3FXH9PNSMx+wdYbtIOBquP8/STA/+SfiQa0nvS9RM/a75xXXm8odwTuSa6LaQaTt6zuIqQ4RU+K1v2JePrb4VNdURzKSpp6AZypLJCa+opvPqET5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR/iW+jS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MABQi2Ki; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7j18e947217
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1nO9gqkxcj5rweYoRc+yQuw1eVsJM6rSLrpMjihH/s=; b=pR/iW+jSYxIxDITG
	HIm+oeecOo3E1tCNzj2y9WMNcXOSzhzDpdpJd1ma4MM8xSCm0tSa+ApG6hGlZwP9
	7SRmpR5q0CscMkeZaK4IesngH+0m6hgnuwj/d1qiB7BAJMr9LKRi6ASj3LcTN1Gt
	7L9ltIFFTimg71VOq73Oxa0b1536UptgdJ9p+aygBHqoz1nlJShIqlpLNa4FogNk
	z926OGg0zpGWsmEObHnD7bEW3ElyAZvD6mlv+35DVXKpEj1JjILdcCFEqBm6e/l3
	4GRc8G7xxLHUAZzDhDpm8PjizufIDwrJRN/3+KWQ1Zcl2aLuGbVkhUP/5Ut6/+rd
	OaZThA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnt158-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:32:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156dc90fdaso172038285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781087566; x=1781692366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1nO9gqkxcj5rweYoRc+yQuw1eVsJM6rSLrpMjihH/s=;
        b=MABQi2Ki2xHC07yfWpzj91/pWRcaZwZ6ZIUq9lDgMawEfAwQ1r0SF6nX3vqlB+36yA
         IlJarkqIizpEq8k5XMuSykHuUuLejDyOQ7O5605SJgZYCH1PvXw8mBa9nc5mq/5CvOPW
         aQj9XDDCu1xlO2tptgNy7QfgtCGz5fUiDfwJIqRsitP5wK2twXjfumm97Igfk/Vuy7fe
         uem08BL0w84h6GWz8jjWp0ZuXrr4VMR87oYXjzrCMWqp4kedQS9BDgCMSHvZcendYp7s
         zWhF8VHsyBSarkYqMl6PR2CZr7Hl0js69hZVQWxHwcZd38TzZ6EEBJICcgIGtGIObZ99
         8YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781087566; x=1781692366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1nO9gqkxcj5rweYoRc+yQuw1eVsJM6rSLrpMjihH/s=;
        b=lNJqLool0CoZ5VLfZ1zDJVQdX2MyWvKKs7MChzlPt3l5GQCoZsUjeH1GvAh3Mh6blC
         oiLcKjt4mRBT4p8u6dHqBc6tAeDI5Sakluh+9utgaxPF9laNeVzxOogKEkewKwKM2z1M
         3/CpWe+ZoO9+pmI+u7VhDJ2p/ZgIgxoy1Gf+Xj9PFzzG1Wc1LdxryFWDpM8V8B55j38Y
         iptGn4Mv1zeHJ7EX7GNuqqBRxy1XinNhRb/0yH9z9YnUOuk632aaWi+iV35/grIzYDbN
         Zmskp4dTaWXLG6FHuJe2Fjfhmp8Lkl0HmILwjbkZ32+0PUTZc7ucSjYfoyV2W1ORhunF
         SRbA==
X-Forwarded-Encrypted: i=1; AFNElJ9gWLn9j/6vyISaNA7oIW8+aGED7285f3pbUlCwDuhB1d7A6rf4C8VBY/bTyyMi3yDRBZKvHY/dFT3gri2I@vger.kernel.org
X-Gm-Message-State: AOJu0YzGhL+hka3EX00S5hItOj4NvTiNQEm1Cqc4CrljrBayKd8h41SY
	45H8s3VNA7L7/chBOeHgw8f7M0HMfPWYqQ5M+kyL4Lpi7RfO66sHQ0tRH9yAAWHvCIam/Rd16Sl
	34TfG3+BEaKWYARnF2xRZpEwguGcVUZr8LU/Q4mM7tw4H0ifslm9ASsr201YRj1nwBznSvFbgxo
	4U
X-Gm-Gg: Acq92OG6L96zxiYqxHbEY42vjdIOtsS4JLprYRp5FpjcB1eKEIOHIal7lDU3HT9GuV6
	G/EcJVlQlTLknAagV6QfIaztP2z+IX6AKkJ7bdSkRgmRGXTG8nPWh3dBLMRA5IDRUmtP/+72ukM
	L/vnvUHSZFtGxIBzi6d3Yl71KD3WkoXJU4So8HV/1Gp6sQ4QSdDNxJKcDTWLm/LTnSSDc+h+eTN
	nnSxOF7WGyqtX5dzQfWinMp0SHENU4JRNAYJyL7j9XRkzJkhf+kiGam5REjQB7qRU3TedVEPp3F
	KtQ2uE4XHwXXaTItnih3H3Wf4nOF95VUT+oWI1jzsRD7SVMQLPwnhgWK1L60AwWaBxbaw8aEngz
	C0TssBPOzkISDoWFXaptqFSTL5SvKwfLPNUL1HQpPZ7rGBKruhee5pne5
X-Received: by 2002:a05:620a:6288:b0:915:4ca0:11f9 with SMTP id af79cd13be357-915a9df818amr2285212485a.7.1781087566331;
        Wed, 10 Jun 2026 03:32:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6288:b0:915:4ca0:11f9 with SMTP id af79cd13be357-915a9df818amr2285210485a.7.1781087565913;
        Wed, 10 Jun 2026 03:32:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm6191618a12.5.2026.06.10.03.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:32:45 -0700 (PDT)
Message-ID: <0a578098-7003-4048-9c29-affb632c44c9@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 12:32:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alsa-devel] [BUG] Lenovo ThinkBook 16 G7 QOY (Snapdragon X) - No
 soundcards detected
To: "thomas.kuang" <ks002278@163.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
 <3c28dd62-223c-4447-8cec-c7c527aa49e3@oss.qualcomm.com>
 <5c57153a.79.19eae7e2814.Coremail.ks002278@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c57153a.79.19eae7e2814.Coremail.ks002278@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zexxIVq1UR3cFYSVyAaZM64Z505xFMhr
X-Proofpoint-ORIG-GUID: zexxIVq1UR3cFYSVyAaZM64Z505xFMhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5OSBTYWx0ZWRfXwPIigfnz2gbY
 3iVP6CIm52qYRavYjKtdmFft8pTVGO1dVIIpooUYhCrj9Ubne1HM3HDphMpYt6z3g7fPC3kSmIj
 jU6ZP3O6P5FHY59IvHZoJHTqw5Cj6YtK9lqGrAXummZycwMvuT9R0HnalQ55hgfcQUPeSjUYVHB
 ypBoNtynfEisp1I+C7fKhqk8Gn7oe7Jb4kj+70Im90v85STta0QT/X5r4Jqz9V14VUb8384o4cf
 fggvQph8IOm5wwbhIz7HQ50bYPaSfxOBwCAVsMzKLLgolt6BQ5BirK92dn3920l1jP7nlYrqrCy
 UeWkk6aGgn07O6bSA9q/FQIGVNV3Lzk7YHergEAYc1aWxPjY1o8MJppiYlntIwiDEBkjuBv47sC
 IN7vwLsKBMwJEzR6aT5pO5GZqggL6XEZQHvt1umDdQUfLF+wBJdMAxBLi9hjtR1M9NflshOUsbS
 wAzs1Ib5NjCdxNEZ+CA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a293d4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=onwFKEomLvbxLXU0c08A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112395-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ks002278@163.com,m:alsa-devel@alsa-project.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A44746685DE

On 6/10/26 12:26 AM, thomas.kuang wrote:
> 
> 
> grep ^ /sys/class/remoteproc/*/state
> /sys/class/remoteproc/remoteproc0/state:offline
> /sys/class/remoteproc/remoteproc1/state:offline
> 
> 
> grep ^ /sys/class/remoteproc/*/name
> /sys/class/remoteproc/remoteproc0/name:adsp
> /sys/class/remoteproc/remoteproc1/name:cdsp

Try writing start into > /state

This will attempt to power on the DSPs, most importantly the A(udio)DSP
which is necessary for audio to work. If that fails, check dmesg as you
may be missing some firmware files.

Konrad

