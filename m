Return-Path: <linux-arm-msm+bounces-113865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HwFeFPhpNWrdvgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:10:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B66826A6F85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BGoaJRl7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jos20ydg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BC4C30F0AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC3C3BB9F5;
	Fri, 19 Jun 2026 15:55:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659D3B38AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:55:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884536; cv=none; b=pQog+4TqhYWYfIXTJKCIfiiIGxwJ7bIwfcnbrcA335jd59gyib+1pDroqo54DBgKhilEc8BNTLeKukcFjbLZGBYb9VAJj8L4ndJRN2y7xKGfy0B4lY3qybVs6qf480VlSUBzs4pZU1pdX2ri05/RGTDjIfWnY4YVJLFU8574Ufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884536; c=relaxed/simple;
	bh=pMJmYZOBYDwHbV4Ahh/bicD3csdehJvP1uBJ0kfk6D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCFntJAsC4XlIAk4QgCdxRW0FUfLyt6D6GBqXtSI8NOvmpTSmeIvpsJ8NWAyjBM/LX5UMXk4VSVyjlKe0cGewy1dJdVhTznANbV9lVCTXIsCsUletcQctlEWDg/E9LLMShJyl0lnj0tVLF8HR7o7ikjVPxY2yTU8LfwGr8WxEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGoaJRl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jos20ydg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9tcd209736
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1g1S23ckjhJexyxYQNd3mkt0SDMM3VWiwpZ+c8Q7f8=; b=BGoaJRl7RwvGxuvH
	g5rZG45SDJGCrlRiUQ7UaQ0qhijQMwv9lEvEfRpXfZveOfpI17olI4seCqkfQB5H
	0kPlr+FPr6ah+shD6I/snb/2i5652pQeZ1vhnyXbCtrjAImoeu/CpTSBySuWtvPs
	JdIFx1eoVuR0BfRiOmtKAnpO/XQzL7wg182Hb/i7AObm1sVvnnYIkgIi4VafhKex
	Y9PXCgxAVt14vy4pC9IhuHzCulgY9a+xfRgoS4zTh3TWWs+RLV+46m0pweZNlHtN
	PBl7dwlnr/hvo8nl8dwBIL1naFps85k52DnufUB77J2N/wyfQXU1Z+6cUYrgbgr6
	IsM3pQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evy72hvqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:55:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517796be724so3172991cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781884526; x=1782489326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1g1S23ckjhJexyxYQNd3mkt0SDMM3VWiwpZ+c8Q7f8=;
        b=jos20ydgJCKqq9wHwWn4Os1nfQkx2+bzYE1mtpyVBktkCnemGm+ypt6V9BSs9qstp7
         pHks9fBC5Uc/LPeyBEFTGYdGOZdrMWifjhp9zWpjmIXJ1jnxNzipS6qPb3fl1vHG0VjL
         MxlUsOgyq6Vxm8TceANUrZRR94aJ8kc3dOi0uJWQ5rl5b3blLdHQBv4T4upC75af176I
         MUCgjjdgpUdFiVeXWvBbofY2TH5AMSrpQR2NPI+MGC2FeepmQ3zdm8cloZ8N5Ft+BENC
         HpDuFfzeb3frtdbD/Ii32gv0/Nq8Zs7o1972JQbvG1mR14k+dWFZY7EpBk71sKbsu18N
         MQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781884526; x=1782489326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1g1S23ckjhJexyxYQNd3mkt0SDMM3VWiwpZ+c8Q7f8=;
        b=Yi17AclialWEq0eJB9ABPlYuwpTyC8gmsQcs49NmAgeksO4BDevbJkzugLfP3niwB/
         WLQalL7ktQb64lF+PEtrYhIpd9W2BVhCoqJWRF72O82tdI5YWVdOQLpsQozPTHx4Xc4W
         ebiHvo8I/vrg6g0TgHwD7xM8WvE6oK5rCVc0YcsWso1o+z8QxzuO+Va3H/kIMfc6dBPs
         gAB+QgRdLEGV2VDWI3ztYfkLwplI4DFr/pzZ74j0mIcX213KgMx7Z0VeFN8j39Hcya2t
         YnBTmhHzAQRwmmLljBMJqHTkGV/UfNQ6+nFyYagRzfaEZTWPwHaiwBXXwhB/kApgJnFZ
         v33w==
X-Forwarded-Encrypted: i=1; AFNElJ9WYpQg3cbD8XzUvOCu3YjiNCD3Tr4QC+lDL8H06prHuCN05x/3l4wjSj9jxp7TsQOUOW3Kh94CWHRmfE/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1sP+irx9g+mFZKGYgXozdSe1jtPacpoHx5+Faw2gfREdewD5
	7zd+2jv5EUmXKJQ3gbcYP2k2ooU/pqcMIeG2gzPHWouYCr5vXtBrAQLD1DrMaXuJGRYByQbwpIN
	dv5xVN7XjoqTbMiYMInf2wjgBJDpfdVaF7v0XsJx/0YqVq6pfeybeS6Wl26rPxyNunLwGOD0I5F
	mf
X-Gm-Gg: AfdE7clyiZiIyX/FC61WIhAYEV/ojQ//Lgx/KRXbvmuEayIfYGTbNGBNdIHf3QIwom4
	uJdaCgRb0O2GNtdG4kOiamIk8D1YAbXwFQHoA4gJozNj0cNnyfeU+tWXtY5ZZg09/wRD2fVVSat
	cnhTb7EpITdzIKyy1eUgINhJ5ytTyPpy0R/Ry/csUOdVGopIc/xFc2eJE5FtfPJrASzwHfCX5UG
	O+g2+0S8OLy9mFCk4jBW7XgvdOKtmKGdxbsydmz/JWOKswjNFd7NysmMs8FIGkrxkOsBWHnsIuA
	R+nvXVl7IlUi/zirwSBPjuymqKhGD4i6NuCKGpdPOGlDqdvEFTPi41Xt+F8fyMQLt9rg6w9Wtyz
	k1zPHdYRUmYwFdUTc+HpCJS27LzFOBITpkTA=
X-Received: by 2002:ac8:5944:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-519e491df29mr34811811cf.2.1781884525955;
        Fri, 19 Jun 2026 08:55:25 -0700 (PDT)
X-Received: by 2002:ac8:5944:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-519e491df29mr34811281cf.2.1781884525338;
        Fri, 19 Jun 2026 08:55:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f5ecdcsm980224a12.31.2026.06.19.08.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:55:24 -0700 (PDT)
Message-ID: <3ca4718b-ee62-4c55-b593-4d6ba543d5b0@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
 <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
 <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
 <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE1MSBTYWx0ZWRfX/zedJgl+XTTM
 83sBWiejv2XNTdY+XsNHx1ryk2sURC+vRB4HIxlhu89U1seW8x9VCJICXTXPZGbEXWuON3uxPHV
 3rrPYZfbS9BLwMOhdt/L/DpNaMlV9TAw79dRjmezLorqcEpYreN0q4tFDb5z6zos+ZOxh8ZVZRy
 dF6qMXfZJ9iEZGISd9WlPq84yj+3r2hm+gud/A8nOU2aLF/eeeNu9/eKq304uVfiloYBbr2lok1
 vgX1c96c0c7CZi45KfrKU2DxhoUfbMV/Mjm/gXHPvCpzrZlTSaFPxn+e6wNVbR9wZsJ/3ars4R/
 /b33LRlRMyFfNP0CBnrTb4hReUHAWO117LzPereTkP5extkCivHN5ydK33KHCZifvTXuW/+OLKd
 hSS/OKY88yycZul4q8sw3TIELk4kgPdykZDxgpsPU12IxYsalwSUdw5OypbvR7KbMS9viqAEkzm
 vgA/gYsR9lL96iFfbXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE1MSBTYWx0ZWRfX1aHUerm9SQbF
 hcghnKTsHUH2ALMf9d5SUNoL3oqBJ0Ktgmz/LncWQ4pwdxwuUBYTqnY/XJLsbmbwd2gwWQzdLtt
 VSPqNvSpn+vaEWbnNbV6KSw/IMKdkGU=
X-Authority-Analysis: v=2.4 cv=I75Vgtgg c=1 sm=1 tr=0 ts=6a35666f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=4zvQkOs8SCLzoOI4eBsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ysLof__p_AHkdbc-X1rIwQmCorU7wPOu
X-Proofpoint-GUID: ysLof__p_AHkdbc-X1rIwQmCorU7wPOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190151
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113865-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:martink@posteo.de,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:martin.kepplinger@puri.sm,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B66826A6F85

On 5/5/26 8:55 PM, Vladimir Zapolskiy wrote:
> On 5/2/26 15:55, Pengyu Luo wrote:
>> On Thu, Apr 30, 2026 at 7:00 PM Vladimir Zapolskiy
>> <vladimir.zapolskiy@linaro.org> wrote:
>>>
>>> On 4/25/26 13:53, Pengyu Luo wrote:
>>>> The rear sensor is S5K3L6, describing it but dropping compatible
>>>> string, since there is no upstream driver. A funcitonal downstream
>>>> driver is in comment.
>>>>
>>>> The VCM is dw9714, describe it.
>>>>
>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>> ---
>>>> Please take this patch as a RFC, I am not sure, how much I am allowed
>>>> to add without a sensor driver.
>>>> ---
>>>>    .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>>>>    1 file changed, 123 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>>> index 39e559e91289..76b1ecb3819d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>>> @@ -22,12 +22,18 @@
>>>>    #include "sc8280xp.dtsi"
>>>>    #include "sc8280xp-pmics.dtsi"
>>>>
>>>> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
>>>> +/delete-node/ &cci1_i2c1;
>>>> +/delete-node/ &cci1_i2c1_default;
>>>> +/delete-node/ &cci1_i2c1_sleep;
>>>
>>> Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
>>> by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.
>>>
>>
>> Should we register an unused node?
>>
> 
> I believe unused nodes are found everywhere marked by status = "disabled"
> or if they do not produce a conflict for resources. I understand that a CCI
> IP with two ports are special, but likely (not always though) it should be
> acceptable to keep its device tree node as is.

I wanted the pins to move to the sub-buses as well, but that doesn't seem
trivial - we would either have to alter some obscure core code, or manage
the pinctrl states manually from within the CCI driver

(contributions welcome)

Konrad

