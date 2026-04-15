Return-Path: <linux-arm-msm+bounces-103254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAyOGqhX32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B8402736
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17DAE30086DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E123A2BEC34;
	Wed, 15 Apr 2026 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+HsW7PF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/hQEGCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA58225397
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244427; cv=none; b=SDyASh0QE/zVjMJQexLhX8T85z+iMs8k5hwyYj4kol2Qm0ZitFqjWuJhyIW8NSpdd7Vz0LNH2fuUOLBYc7VXMXWwerWRpY5SDdLIkTrKVDxvC5wWUZ2WVdmR3nzVDFpw/JzGbfBQiJ+9akTG2IYyY+9tsc/0tj8DnwdmRdEqHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244427; c=relaxed/simple;
	bh=r/O7WDHu+7Hjf4sfTvFsqvfbkW2FkvzsSfUMz87BE/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G96hepSrfqc9ibAHkv/WhVa9ZSljIhQlyPV49ksRV5B66kNDZRo5VjgRrQClR/kRkjQmyTmeiSrs6cDqSfT/J3nuw7fhT9hRQnpg67cjqmZZ/snBO46vo2QCXmyEBKYccaqdUVMd2TsfUrRNffg1MGWo112tOFG7Rs7HWMDg+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+HsW7PF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/hQEGCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4CSQL3126617
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXOiB3jPp8yfWi2Yu2+DIylubqDPeEVQgwNRd85/Fmg=; b=T+HsW7PFSf31P7Kd
	7H5FxAZ4roJcrVTXuQQQUqR6gjGsS29xGNHjJWorGoVxRBF08JlAlWeoxkOhOSu0
	xw1XL28uBeyld5SNmo+YLwhgPCp1OnJkwmpHTrpuOrpHStXMkq9Re1z4V8LtiiUK
	epTLLTM3+FBi49ZNKGfU0wvNHfLiv5Srg90+RfV0vtE7xGM75hBvdiMdpa6UsY5a
	71WJRuw4eovFxOrugjQwzFESL2NwDG4ExeadCQ8ZwcZ1XOOJVoHkfj80onTQw22z
	R/1eAqRCDSfgDJ6HU4Wzi75h54sEnsGnGeUVQBu444uV9uNkq/5BZT4mOCRplW0g
	aoHuqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56tk7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:13:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso17243291cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244425; x=1776849225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXOiB3jPp8yfWi2Yu2+DIylubqDPeEVQgwNRd85/Fmg=;
        b=R/hQEGCeVAh88YplBBi+9mQtSakBGnHDW/AMiUkGJlLO1zhkat8FMasDmMtsTGsawn
         nIYsT0tnJfItzTB6vFIRZA6wdwMBU+olHXsc0rprS99sgNxJZD9Pm1fpEOLhdI8wRWvJ
         zoRWE+GXjjklqomNnauZy2/4SCQc+al39Jgtgvaoao2svrSIAzMdzPD0MTmtMz0DUXGX
         j6wwFZmBreOiiZXp2jjJ1JsWbY9irB4L5+spdCBFUFAqBArfkhIP2KhgwMArWuIFAu3v
         p3HrAyMaE8RFyZQMu3MHFX1TbHUByxrEAMP1qMjgx6KvGVEBY/wcgCanSOW/wkiS7rrh
         DlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244425; x=1776849225;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXOiB3jPp8yfWi2Yu2+DIylubqDPeEVQgwNRd85/Fmg=;
        b=YxXoNOFGZ8Y0IfaOm1nZzt4K7TUZPb9F8HNblSm0eBsDMWDAG2XE0gusw/H8DYuAzT
         nCUgOmg5Y8T059E6gsSZiAJGkLoU4XVA8LNVAk5LexKnvk24C9LAsmGD8FQ0IkZVvao1
         MkO4EEb6S0njWj6KAAiJFq6TIXHoUV0iE0dSx5fzYmRj/1sa4FhPlQCEfRlmoKk3+LST
         +KcClkxkKoKYHMsFMBw2NBRPGUCeRum64T8Iu2HlBq/jdsdimU1SbZXmQbwudAYUE8Mz
         dknVOQUfwd7SdtXpxYS7z5BKTO4dZMgMqG/uqHngeL2ETAjezdv8Wjk8pUJXepEgxf0Y
         xhtw==
X-Forwarded-Encrypted: i=1; AFNElJ9GkXSx5/tzcja/ghZ92jXXVMpmEyfj1AmPxzrbJR7+QL4zzuYcK+ykNVpjAn/RzmEZU3+r+aEB48fViEVx@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrrkkX0fpieayS3M1bf8xWH4OEaWHILDGr45BkgtoOkPW4UkE
	1AfCwMtBMxqqOHNi61AR7TO+mt28vjq3NV17RGRpComZ10y/yzIXt1O2qbGb4SwmjcRURZ91A8K
	HwyrmEbHT9hxRPpynUD6D5YzAos6/M8n8d3cOrT/dKuc9w8W9rmN6QmB6wCr7UE12cB3h
X-Gm-Gg: AeBDieuH5fjhoWI2tvno5TO3jPgqNsmuy/1PAuebxeBfAIFiCrZdTNR6eyB7ELOBEC4
	dVyIwEHERn6gkAwpStcFZRaD/Yz+Q5Vikshtmp+eZ5vaO3G0HjcCOK68hjfgFh5klP+GQT7mlj3
	wzX5jELMJZqN0ZZyU+XpnpAvJMrML2O8g+X6xSEL3338OCNc1jrL5jTArc/uWSObRnzAVbMUgDt
	kypeoiUcFRqsZw8IjNElQu3JuC5KZWWbfPlLcfjy6h461r5xkgZCrjrlNBIHTi8EkejCuSPOZJL
	XFwHWqOfIDeEyvKv5CxJfJEcr3NrIBFu3VVgdeOibVqIe+02RsN5hiH/UHzOtPuSm3Tw+esjoLb
	OIsBzZXbjjLLFbUwy1Eg4wf5YXWb55gH1SHkJDKZM7idFuw1A
X-Received: by 2002:ac8:5f51:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-50dd5b9aacdmr314899641cf.35.1776244424979;
        Wed, 15 Apr 2026 02:13:44 -0700 (PDT)
X-Received: by 2002:ac8:5f51:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-50dd5b9aacdmr314899341cf.35.1776244424483;
        Wed, 15 Apr 2026 02:13:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6e9sm3707325f8f.1.2026.04.15.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:13:43 -0700 (PDT)
Message-ID: <3edbf879-a202-4145-b1fc-1e34a5841839@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:13:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df56c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GxPRKtRK2lFiV6y-FhkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MyBTYWx0ZWRfX6/jf/0gaY2Ur
 +0W1ma9EHFjvtrM+mqetRnjl38xxcbVbetTEqv2YiNy4FF56pk9iBdBkeF7P6PkkAeLRedD4ega
 Y+EQEIIV0zbCAcUt984jzhW1smWdz/DYOFdyuC7hyJjhV9TDtOngkhBGTnZsktVreM/fPxFFTJd
 enBET8AHR9WeRyEUHvnPBIDRJEqjSWtVS0g1KZ+kkt+S9guh3xthzKhkK1YbEeQla8JUKY3CUYg
 1OautA+xBupDJQFCcB6ZB3IWxDYLgSv7qbdd3bx9h78/myUTjvOZtNGpJILbpq9RKKkITy3yOuY
 gq5UB7jEGTXQyYAalnONyHUZeA2ikkrZbMEnboVPBVNxSOtOU3+X9WKNVougTevINuSMVBwEeW4
 pHDMR7QN85FJkEAT2tGq0RbJzc/XpHIL7VJK6l+6QV+c+8lPRz+RohltwPJWLiSKXquETrCJ+Z+
 OtTA80IRf7EPghi9/rQ==
X-Proofpoint-ORIG-GUID: E0BlIj78Bp0T40cwlZdxy0dgov-VG3eq
X-Proofpoint-GUID: E0BlIj78Bp0T40cwlZdxy0dgov-VG3eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103254-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B39B8402736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/04/2026 19:05, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> This also fixes the devicetree schema validation, as the bindings do not
> allow a separate `clkref` clock.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/

Thanks for fixing this, appreciated.

Bjorn,
That's a fix for v7.1-rcX, so please consider it for the fixes for
current (v7.1) release.

Best regards,
Krzysztof

