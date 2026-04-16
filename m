Return-Path: <linux-arm-msm+bounces-103353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AktInmh4GlukQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:44:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B340BBDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7D413058DD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668C8391855;
	Thu, 16 Apr 2026 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3Q6v8QL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekgQ56WC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE63264CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328817; cv=none; b=kKAnljjHaPqioB58D0qvivFTPuyLwY822x/V/gMmajTCzpC+fqLzEFjuVYKpQMUJgByCZhpuLkdOFEQu6dzhR+GI2CPiCVnZrYkU+21Sg3mlQlT+6uT08or+oVdtXabjD0EuReyOCoqI0l8VfUyVI4Ourt3gyCDo7bpu1lnwrJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328817; c=relaxed/simple;
	bh=+x+7yq9nUEdihY01hSNVJ+Ab8jDSwZh6LMbMIv9KZDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t08Ycen7emvHI0b5DeDHJuXGz8D4nJpcfWADlyvjdk73/m/OLYoWpaA/gDJ098+fiAEzVwWGaqUaMOv/J3tQ/sqqHchhGqgeB4WvZYWHNYXAaJmNHXWA/WN0aZUwkL4py5efHEyK8Zf5/wm678H4PLGMkQXSEIcB2RYOI1BVRMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3Q6v8QL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekgQ56WC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8YYOL1702831
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7OM9eUj2417K4VU8X90kQ7WswZMz1+7qaQFxDiPh/QI=; b=Z3Q6v8QLyRh+UcAk
	/mYBRfHcmPm9Ismh0H9kwD6pLaX6RNcRcMvZjXD7AxUDjWd+ioeTTCxFE98lESVw
	ewB/qDmm7Us1VOhT5whnpP0Bb6Mw/VBETroNjMDNkPuAif0Y7SiteTso5BU+e/Vm
	LyhzYPkDIMniaFC42ndDSL8KRm30yYlfzlM0VmbKz/ttZOryOJf6exBrUiJibIGr
	E2ujhvg4GgQtZLz/Ws012/3uDQ7CR8DGenJ2cQ0oGDs/RW1zj4ibCCFj4ie6L+Bz
	JtCnVaVcnVOosBl+cRiQJ5nH5wjG5XJOoCsoo/GSXgIb2tivAuuFcN0cW5jLlk9l
	HLMqtQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamk1qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:40:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c20d5d7f4so21190578c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328814; x=1776933614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7OM9eUj2417K4VU8X90kQ7WswZMz1+7qaQFxDiPh/QI=;
        b=ekgQ56WC8cZnxSxxP0HUY4vfqll3oFAKmExyHvay8e+n+YmQucLnnH/dXOZipIjlUL
         wo/fUrogEFhre9VW3AjfgzdoH4jECIQ6zOmk7m1gF2krKT8gOu55f4T0ZaNUh8m7YLEW
         sNQ+53pCVFz8ZEAtBmJfZX5eXS/II+OzLabfoog2dy4dwgaZvCDwQSEEufX7qx26Iide
         avDsz7DEQsRLmqhuwAlGh5pGFh+chA6nInPHt1yjPz7ozhcPvYhc/6KaMoonjXInYDtn
         kyHR32bkYzvt/m39nd3/XkExC2v8RInBe8x4EP7ITWY6Ii+dfIBlqTGKx8bHoylAiP4l
         1ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328814; x=1776933614;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OM9eUj2417K4VU8X90kQ7WswZMz1+7qaQFxDiPh/QI=;
        b=KW5aNPxdiYhn35yuSfH/PqnJ1AtJ6JpsFxECh8H+nc3RJKnBUVFdiv3M4rnSNgMdQe
         AvOhMV4IavUPXJeLFyFl5XTB8+5ohtvJMY6RPZQjdwB697KDri3/qEvbOexgxnXENU2P
         aindxGTIH16JByuviQYMEIIR9cYl/EXqCRiltq/qLTKsesb6bhd1wmchhsZ6wMME1x7g
         QdTsGXlgFbWRBBr0jK/Z3m6L1MPdubjdSgDiYV1sBMMATn0l0dXKYPf8xaOi/JKlQbu+
         ApAsVu3dXcTS2fea2aOL2qcFr/oxOEL7oyQpTlTpifQZaXSGeG8cuw/SHYsPHe4aK5iM
         g5gA==
X-Gm-Message-State: AOJu0YxsahPI3BNno/A8fJz1qY5TnblMYXmF6EDa7NhRZ21eiNPJ3++V
	Vp7+Xsxt5UbeeIWdzIrW+/Lqv5bq3jSvqde+7bnpFnNUm2x7BS2WrUCtv9mwZEGc3MMpH5Ndfr6
	MOivGIOb8JUZnUNPj/TUuV6YeenxryOqHPZx+mXhnkyUqbwuVnoEM4mNnWvgaB2GO4ohr
X-Gm-Gg: AeBDiesetAseUv/YFDA76nMx8RYlrLMU6FeKpsGw6PUqa5n+OtZaWPTdD1fNzmBKk0G
	ziIL6vn+bZWYIavQLjqqmxnpHee8HpwPPLCmB2t2f6LSms5O1rEGk7HRolSRqkoVjc5HiFrYhfQ
	77QAUqf9cMi6b12tpOQ6GHk6rspUVLZYNN9Pyx96VgBc1qVUAemc5baNgbYMw5J+xufd9qqyKjY
	xvOtLfH9CPbF8aDSp+c6MiPfV0Pl5SNbyPFfRum7JwSBnPVPdGNUqPqs28alA5NP8fboMhNrjjb
	BD6t9PqnZz9Jg60P/d/IJhABfrgnSYni3p5vs9ZscCAHS0p4f907F/RRvzu5DXVnvdsPmncFvf0
	F/kQLrCbhMxBoVQ/qiBg1BL3Gapv8Q+X6jbDiMoLdi9Tj/v9h
X-Received: by 2002:a05:622a:7287:b0:50d:69cb:d603 with SMTP id d75a77b69052e-50dd5bdb482mr255326111cf.47.1776328399643;
        Thu, 16 Apr 2026 01:33:19 -0700 (PDT)
X-Received: by 2002:a05:622a:7287:b0:50d:69cb:d603 with SMTP id d75a77b69052e-50dd5bdb482mr255325931cf.47.1776328399195;
        Thu, 16 Apr 2026 01:33:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5854097sm41130175e9.12.2026.04.16.01.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:33:18 -0700 (PDT)
Message-ID: <2e8f029f-0e70-4146-960a-bfb8b9d0f634@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: Make important arm64 drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
 <ce0ed808-facd-456d-b5a7-620dbad6465c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <ce0ed808-facd-456d-b5a7-620dbad6465c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mfmssag_PbYserqMnr7759qz-ttvDMK_
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0a06e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zaFJprUbLE3byhrQsaoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: mfmssag_PbYserqMnr7759qz-ttvDMK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA4MCBTYWx0ZWRfX7B8C4os/WCR0
 p7m4oWDiM/wjhYJ/geNnyWovpWi0pXjZSnu9o/j6QEdPyszfFejofmVk9+wdHOz4qm6QNbWFNo0
 vze0NBd8E3Hdc5nV8CGSYmQqEHufQ8nkStK5I9Mx2OHjnwffLcMTebs2Kppe91Ny7Pdp62vTu/e
 F9Thte7fqSKQtjNgYMN0Q5lTkKCKndlEMpUEe9OuQ8q3+MyS9d0+U5imsLkIG23xO7fG99vYoQg
 ppjvQDXIUv+hK5NLV3jis+r3S7e2JxKZrF9Vd3iB6/1WiPSqY4tG6RSx/gtgzcjhXPnIBQbu0rl
 vZahlpggbAvD5h+unLRCnHBzz1dbOg0br3AautkitroOTssFTjDQMkIszYvERVG/Bod3ti7NlOx
 dCzTqaCqBaZ2Mc7DfpsSt6PmIDjeXXqQHA2rwLsz4OKgr0gcLnN7w+9XJA0poORCuKulRZAIulp
 Y2AAHnrxyALaEksLjbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103353-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 425B340BBDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/04/2026 10:28, Konrad Dybcio wrote:
> On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
>> Clock controller drivers are essential for booting up SoCs and are not
>> really optional for a given platform.  Kernel should not ask users
>> choice of drivers when that choice is obvious and known to the
>> developers that answer should be 'yes' or 'module'.
>>
>> Switch all Qualcomm clock controller drivers which are chosen in
>> defconfig to respective default 'yes' or 'module'.
>>
>> This has no impact on arm64 defconfig include/generated/autoconf.h,
>> however changes few drivers for arm:
>>
>> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>>    (ARM 32-bit) uses it.
>>
>> 2. Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and MSM_GCC_8916 as
>>    built-in, because MSM8916 is also used ARM 32-bit.
> 
> Is that to say that the arm(non-64) defconfig should be updated
> too? I don't see a related change in the series

I was thinking to do it in separate series, but indeed maybe better
combine it.

> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> For the change here:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



Best regards,
Krzysztof

