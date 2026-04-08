Return-Path: <linux-arm-msm+bounces-102282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILzPEi4b1mkxBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:09:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F853B99CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4AC8300C5A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E9F38AC95;
	Wed,  8 Apr 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="br9uzubD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEawwizv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A835346FCF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639076; cv=none; b=e3ptudfFhesNA/8ifwqAW1AlqFBu++fGAqXGZQxTJZuQFCYJHnyMK8AXvqNg1GDkEKO52EnCmCmHq0uTF3RupVH8S/h1WNKQwZSHqnGhM+5yMGjS9jmhy+pbwr6sKLxmoLFzMPZpJfyYgJ55SywoP26NxiYK35RxW8p70P0Iyv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639076; c=relaxed/simple;
	bh=HUed/dhaydIvnnUHj7ypIcRoZk4roX0S5GhB3x9jLL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAXvCx85uUXDgk82QGTDn5a3mtE2k/GppWmC8omU4z2axkAJTrBd44A5gz6caiJBTjczJMlC6eFIDm651TFEJVRlnhtogjFxXDfl1nYW749vSIq4CCRrBaMUN8rd1W8az56lnymfeWNV0qDu3CEksNszTlUhbywUQu5YJPfwp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=br9uzubD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEawwizv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6383LafU2412322
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AeKL/p9nb3rN/38p3OZFH/nGNxNec/v4xjSMhP9RvA=; b=br9uzubDSgwF/TTg
	ZCKSAoCO7vPC2/iFMmIZVXFcsew+G39sNG3A2pLnDyiRLSLT3cR9T7pfX3wOecaD
	fG/ApIqGkYBMbZd21YAvmZzZhkkMIOF2cgOo4ZH15SBLSu5m2VMAYp8rnzzUuktU
	QIgnhE6PQbBPy1mcmdHbHEzvg+OP48SK9jUIuGZcSxm1CzSYuYN33z4hr0BSBmgb
	S01HNQ/5jBkaNe7+5cz6C6uM1BVRTJdaMEqlmZQ9lhcm2HnXTCiItm4zNeZKKPRz
	zgRCYpYuVffTe5qIvNyt8vmkDctE1rFHRNM+GRkLLSeezNlRPijd+yaPNquXALhJ
	9BC7kA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaym7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:04:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b9074bd42so19023451cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639073; x=1776243873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AeKL/p9nb3rN/38p3OZFH/nGNxNec/v4xjSMhP9RvA=;
        b=DEawwizv9TcwYxCVCMePj7cixCs1bkGa4B3tBmrBg8B1Hp4fyv833e7rsSnaWl7H/3
         O8+q/MIO+lZTRKX+VpjH3CPuQaLKUfEu3merGeRyhAnHOp5N4CDPDivNCk1ynxGgmK94
         C4Wc5rQtJ8YMtHX0c6mKx6e8Q7NELhD5TemRKsriM3kMRDdearBaRZPIpi0bNRnroDV9
         NotwDyQYrd6VBUw2/MdbqRKQeRNQ+LGo5sJf3cuy0YPPGQ9JJeh0yAN9Y8yf6xmRhHFE
         mYzl+P4wAs8QxC14cmvZ4BBEuBFuSJ1fLOsUiYe7d17HgF3r9kdiC1fgtluLTRMqV6qd
         lzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639073; x=1776243873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AeKL/p9nb3rN/38p3OZFH/nGNxNec/v4xjSMhP9RvA=;
        b=h79bPhGMUaH/mw4pE9tD1y4KrCV9U9e/D73wvXqmTp95tCMsX+7AzjtSQKa+l93I+Q
         tMW4Gvm2JKpD+Osj9dRZNIR6On65GCzyrsBYnIoZ2+GQ5uLrt4XadNi3cT7RCz75azDy
         w39vskRt3XI36fISK2fDLvOl8HKaHBsqK5X9pvKVEuriKAyeZRJs4n0d70yfFCQuXgo4
         dJ+4seOp8pOhEb+Ok/tJYX31ihbIhE243Kc0t48++Zvy4PMtfsH9QKv0Z2QavTj+Auof
         0Dj/LeIH4iWjB/g74Zl2+ZCXeHSfrhqlJxLQxaQIWcb+UFxsatcyZjFuCzC+03MwnVPb
         mVOQ==
X-Gm-Message-State: AOJu0YwoVxu5gA9sQFDER2/rqTQ90UFGGtLp51SCIGgLpRQ55VN0rtCv
	ZHig7w0HYepCs8NQQabCqLHTPpcl9lFNSVQHboUWmNLAH0oZcGpG0DsYFIb+lpx9Hh8tBsfY/bS
	8kuQyy3L8HvoW3sAVipIFAHETTFogatv1o3viB186e6FuxpWmTH3EXXJkt0T1FG3B9Zl5
X-Gm-Gg: AeBDietkHVimfKAXe3J2TilwFEeSBfyG6FvsW7OdPHs5YPKfjAERZHWu5UK4kYG6jna
	7rc4ZEgDVtd0mL0cD46Kg+awy+lJK1xQtjUnPN3dW0h3uPAJ1Chn+Jssa2szPrfBWUYcqiVwKFj
	L7GA1ALPXMFF4//4DmdVFzxE2U6w/kYxTAF5SfIpBlhTHCPHdjZSDAAmQYsn7wYduPqjmdQ+6hL
	kzI/mcLW5qFOGqxIP0Zsr6f68nDk51ttBAMWP1ifezUenNMaa4kbd/n9HiiR5oMkO3E31TJEvTC
	Ac3TOuKQiqFRiARqKl0iuLpQmtKUnG0ltBGcLbe/1yvt1GhbEU1X3739poVxR4vHp6VcQTse28C
	D09MOjABmkd4XPJKQ1dEektJcZb8pxris2lCtDxO455GhhyW+2Xk/sLvVxsQxKhAZ1+oUBeR7gT
	2WUCI=
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr47480981cf.1.1775639073154;
        Wed, 08 Apr 2026 02:04:33 -0700 (PDT)
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr47480651cf.1.1775639072712;
        Wed, 08 Apr 2026 02:04:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm4910134a12.14.2026.04.08.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:31 -0700 (PDT)
Message-ID: <eacef785-dd08-4eb6-8c96-4b7b2be0caee@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Correct
 GPIO_27 label
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-7-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-7-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX+GsdSQqsa14Z
 UBUiWFCcE3JdTG7C68N2fVZoQZWZAc9p3ryhI6NV44pL22jfuBy1IwsyiRRI/0JuXENYWpCY/Pe
 BkJRx2t8951ptKa1Ef5x0+y7kn7HRCKALjxi/d4jwu1xJBcNf1SQlY2DwHq4gBKZfFgVTLdvm2S
 dERoHsnl6PtGHnZscuhJkF15rqOMXIwy5Ar9uMDauRlSqhFEOBhAZyYk3zgA4+CqIvjBpPBOL3i
 Fe9Xvn0b+1ZUoOFTSJA0h42JS2VeT/s6Z435NRgFzGhQgL2c+/L+rauCxW8h50lkzpiXS4CKRV0
 IYYEAe40VG0hTOZGRRQwH0/w/4vDJ2Vz/RSHYgRrEFLsUqAM3BRetlUhFkuGHjj1rbF16y2vQXa
 ya70GCXIhsRGNwDiSzk9I0X8rXmbmuUO6yJlVHf5r8pIwlOyjdRvSLD8bRGnaIr6DHkFVPS3Y5v
 lrg3OHz/Jvhr3/yHxgA==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d61a21 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=EKIyG-Q6h_8_r0hVQdIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: tQ7DpnLa57d6jO5QQCTGK8kPmBryCDL3
X-Proofpoint-GUID: tQ7DpnLa57d6jO5QQCTGK8kPmBryCDL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102282-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1F853B99CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:19 PM, Xilin Wu wrote:
> From: Stephen Chen <stephen@radxa.com>
> 
> The label of GPIO_27 is wrong. Fix it.
> 
> Fixes: ef254b12ec60 ("arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A")
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

