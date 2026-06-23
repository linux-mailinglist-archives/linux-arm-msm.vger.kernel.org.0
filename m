Return-Path: <linux-arm-msm+bounces-114196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jz1aEGx0Omq59QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:56:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65D6B6E90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:56:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LjB3YbVL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NKsUOPLx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114196-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114196-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A131F30078B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE833D47DA;
	Tue, 23 Jun 2026 11:56:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E13CFF7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:56:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215784; cv=none; b=QtgDcqwAn/SVuTt70YvCdlE5SZpJSA/7qXIAhT6tJHPtjBk52Ozai+okM61JTGuKpQ5W+2zFBb3IqTK1/59qLfefLsGvDmIww5zRQ4FYiIXKYxF5fS1iujaKZUf6OE4uZMw+y6MTBs4ZbsIcFsiw3byn/ObZ0rFDjqQcGwRbSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215784; c=relaxed/simple;
	bh=mb0nV6kp27pZkbMkkeBIP49apYqPDzG2G+UJV1CUmO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GPEjNSg6JJkoI6MwBeaLQcJ/N3Y8INg5jUOJTnx0qweOtHp90DBrZBbMU9Swmd+5FpvoldkTlr4tXiE88NxyQ5k8mPeZL2MR9z03IT0K9v1qoy50vBDKCqkprnwaOe78LvijCd1ChIJl5+nFWjwJydYoWH5N8CnkBycM6UdfiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjB3YbVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKsUOPLx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZa7g134211
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAbdESblIDQ1bUfccDE2jT6dBESN/EkTJNYuuetVzfE=; b=LjB3YbVLlQAh7J7q
	g44YGFRiGbJjdpKDSJC964/JONqpLVeVE837rFCV4M545rcDHUzSxWJ/+kcn8DYx
	9QN4cxiOA2/hnLvCnQOYseWzEbGsbbBJfS4SG0a8KfPtzHWgHmltTWNcD8wkXSZi
	q09ZCEMoooHoOMev2K/5Lo6tI0W4vn65Zw49QlO4/uytpSTsr7MkZFYq4ETgBdEL
	lRI7OZJ9Jn10XnYCIVdQPEUyDDFt17ZcY3wYbOc9nmhAw/jxpkTbFKjuzABegLFS
	SFYC+Ykp23Ke9tE7XZDtmudr5Cb972TLalrg3DSAYlLhKQawG3HHdVt/jlogGLrY
	rel9wA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320cva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:56:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915767b341eso533595185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215782; x=1782820582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAbdESblIDQ1bUfccDE2jT6dBESN/EkTJNYuuetVzfE=;
        b=NKsUOPLxV7bUmK9Slmz8XJGj4erih3bYGlETEevMEINYwIsPIQEIDXby0h+fVt0DeM
         sCVDIZy7iNZLBHyc7JVeHc+WnL6quVFjQVsaVwwPdgx+XYIfsiF2zxxycyA0JPBxn5zE
         oeuxKr9w+fV0WysGyAHA2ezgdhPT4sLeZ30kithDYJUYksE2rYGkMfY9zHzEGGdUst/C
         kpi/WRbIi7I3jbZbEu/zF1TocY28RXXM5bOGZ83CNGdtobkOb2QVl3JTZ5W53PVdygGb
         Vs5V4J8/J8m4A6jGKv1XuWaDhD9HJcNTK50N41ltj0yhqf9PC3aJwahBSNgjbRGgyfn9
         afeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215782; x=1782820582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAbdESblIDQ1bUfccDE2jT6dBESN/EkTJNYuuetVzfE=;
        b=LctIJYizZtvefr0BmwJkmLz+7wy4Km/udg6NdL8ybiEr1ZMo7DmEie/gCNRaw04DZf
         DHHhK/bw5jTfOhqEJ+oe+wY0dUFUU+RhdwNLMwG7W75y+1m3NkPl5g8Wwpq8IVVIPYah
         VQsNKiUYc+xhqiCNiqGHdhpAChJt5StAPHR1lU17Ed6twaYogtqbsB547FPAlSLAJkQn
         JXxgCGGQYQXXFahgJri0QNm+T/bztBI10horjs+L6IUm2sqYU4e/gMV4tiIV6RWbLMfX
         h8wnK1Q0vYghZVo5Ns0o1+/JNDRb/TE/IAZeUHaVH+9e6qm94UsQCQ6+jS/5KgY0NjHw
         cm7w==
X-Forwarded-Encrypted: i=1; AFNElJ9B6s2BHf246xyDQ8ZQpz+9NmI818NCQgFN4NRWOuNwrVZjyNeQHPBx/otf2yRrjUGwYCEkxUGHEQUfgssd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/49fiJB94nhjBaiEwD17qioYPN6DlILrNZC34Bch04u1rq14
	8zmgvVI4xnVN5brRbIzfA3pNWk0evyW8ONzoYeHVE5VFeryqdrat6/d3WE7TL+u7O+MZnSgqz7i
	+3KQg1pDYuND77SxrgOjPJ/930krYMxz7eGv3GoG0iM7LAJ3SgFraOe/c7l+yMsf6xZq5
X-Gm-Gg: AfdE7cmg47XMdlHXgkGfgaeA90mnuFc5g0pt857ZmVcJhI9ID7YXGN/UJ1RhvPKN1+T
	yyzeg3l8lf2uvRQDFttXzttGFdyafU+dXV3Qooq1/rzGTpCLHTE+uVVUJw0S6AsHauCD11eKMUT
	sQHfaA1gdjy8c7elTzY3sRsPjQ11Ir4VIk0cDe90OhdqAqnFh3LqSLkvtM79J2UZh9Ru4PrHeQN
	PmzU2SX7jWhCSdP95YcNlGaXQox335P3I1Ze38+9S0fMt7KxhfaDX5R+Eo9KnAcDTAVzZu83R6P
	/3+65FIaaV3FDLY6R9fnCyBUcPbcETOXA7bYPheXQ9/HNj1a23A5SFbpeGsdvs5dGBAY5ZhrDbB
	2s3ytuNOLJRgbkZIylFwl/odv82ZxrpzxEld6uAqv
X-Received: by 2002:a05:620a:172b:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9208d0fb9c5mr3429998985a.41.1782215781733;
        Tue, 23 Jun 2026 04:56:21 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9208d0fb9c5mr3429993985a.41.1782215781285;
        Tue, 23 Jun 2026 04:56:21 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm37784220f8f.7.2026.06.23.04.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:56:20 -0700 (PDT)
Message-ID: <43e8f92a-06c0-49e3-b58e-63fcd0543ccf@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:56:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
 <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
 <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
 <3d24b1bc-baca-417a-8f60-a060cab5719a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3d24b1bc-baca-417a-8f60-a060cab5719a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX4v3+ydX7A6CV
 uZEadaV9XjqEJ0aLsW6qNKslud/yfIqx+cfPnHQne7X5ZHSE7TOhcQeoKdxaiQQAWZMkXm9drqD
 go/u/P93IxsGDlMZSerDis6ULwQbRnM=
X-Proofpoint-ORIG-GUID: xS1omYDvxGSUJPIBG1g6hUdVfqI_KmR9
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a7466 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=VKjXDLKRB0JyiGnRDKIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX98cZxCaomxP9
 k+dFMFnQChOb1fm86ANxe1Q/XQKJigeL9K/RoqDWdDHKZLB5PJmwXn4viFCu8cE5264zdWNTM4O
 3kY2ZsjA8VVIWV0x02LGB+Kgg5usYJ6/AEXQjKVP7bgsG934Ge0XlBOg5v6SQbfLXsjHk5h3QCt
 O6U1S1/12ICpx3/aorbOM2SLGKOGVgR8k9o4JKhYLliLHKInYG9iQtn5XZ0Z/f/1lkFeoBYyj0S
 uD5TkjlPsjZFs2/OvDNT7j9hjVZdqs0pFWMpoApUfGj9Js/Pap3P/aD6NyJ38UUMmv7LhIeFVtN
 6kFVZBcHmxmt/9NHrUEljc+huJqu+NPp49dHMSq2bG9SVDyXzvWTavmyuyw1kMrXf32ALdcf1ZY
 PIVrKQyMg+cPQS/1BUf0DuZg6qlmQNH0gjrt6LoALYAUVHOzJ5yJJABeU/F6saV5mUyCCT+bZJ+
 SnWplzFvwBDBboqJVSA==
X-Proofpoint-GUID: xS1omYDvxGSUJPIBG1g6hUdVfqI_KmR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D65D6B6E90

On 23/06/2026 13:43, Konrad Dybcio wrote:
> 
>> My warning probably can be fixed same way as:
>> https://lore.kernel.org/all/20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me/
> 
> Quite possibly. IIRC Mike Tipton wasn't a huge fan of park-at-init
> to begin with.
> 

I just checked and it helps here, so lets abandon this patch.

Best regards,
Krzysztof

