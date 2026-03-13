Return-Path: <linux-arm-msm+bounces-97479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLNkB24FtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:39:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FDB283252
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2940A300D749
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C22394797;
	Fri, 13 Mar 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sjj9HY5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="il2f3WcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D711362125
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405544; cv=none; b=OoJcUb2RYgDuO2R82vN8mL67Y3RrncdrI8asjw05LrndC5ryoBlfAd4MOfiVvOP96YvupuwT5CeVUTp6yE3acfyMIH4YnWA56yj07len2UodtoTFYEJ4VyprADSRMv/ViWMrGC1+Pk57JhdWGcFQMfSu0tzQ6UWWUkC++2zcCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405544; c=relaxed/simple;
	bh=/v3O5LIsNdvmyFQOs3alTi+oDxl57BxySdABAtEvKys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCIypFLPCKcBm6Tu/xW9/bCnNOAEoTfpaDNOixHJrAT0v3cMiDp4PEM5C+sWI+rBgvGn3+ziN/Cg4ops/HxvV/zJ5J18QWnBewlXnD1uvhKgmXkMw+S5Fn4OZ222w3RTCPx81YfSPrWl5BKiTivKV0L2oi3RAsvcsc7mkMbK1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sjj9HY5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=il2f3WcC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v9cQ481510
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI9pyZxfoB137M+5pKNn/B7T09Jp1/+FGf1CCvYzDl4=; b=Sjj9HY5Q9yto9xT3
	2yfPBbeoUJz42lyWsgvUjl6WxZszoQGWJO3G4eO8S6ZSRyTnHVFYGMEaWreaKFwz
	EDWU1pILBaS12+krgGoY9VbNJaLsuImFKdSa1V64AC/YI75IhnX3H0VtuwbmhIYA
	/eJCwY2TwrrdKFos7TeloQIgVvMN+xSmuXVXBnHB6N+vkvlDtwqHLx3y/7DD9aVc
	MynnrGgLnFIiFNEvJaBAErG5n1LQD+HXzee4N7wh0FkKAg8HdBPuRqwMndRV6d3D
	X0mPmjQRrmtMBrvmCZNS1d0r4cX1xkmYbZFggoZcyzVQztppycM+a14GnQfMURRU
	ehP7xA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rpue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:39:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so117044285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405541; x=1774010341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI9pyZxfoB137M+5pKNn/B7T09Jp1/+FGf1CCvYzDl4=;
        b=il2f3WcCvz3KFIBfDUhMnRNPQK7DfQbEv4XC5c17Zm6ofCSH79ybl08qQQl4xfIO8C
         fn80DWcAlAv5jko9Eh6wxgMfdhVDXoF46ITINPJ/LcDRg/UiCMciTia8/qfYN9rCnxB5
         hna3rTPLuk12u1ZW7Hewk+jVUVCiHdFrqfPwdfOApi3EhiyF/e4GzVzARMm6eKww1e5y
         MCuthEyeEk0Ynhp2HxtyUxVwJCa9eizgwJdzFV+ecOOeegTLjiLcf/J0xpvhgppv6CCb
         febwuy+TU3AE43TSlFYa4szRGR+3KRvU6YVg6eASVNoaz3pLPpAfYrHHFgGVAHNkrvWu
         /MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405541; x=1774010341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI9pyZxfoB137M+5pKNn/B7T09Jp1/+FGf1CCvYzDl4=;
        b=UUewJ3z5WK57WRGMr622TgL/jlh4GeSLyKJsmiVi8x6mhjst/3JKKBtf7m5+O2WmgT
         j0jmsTagKHi657CHQIEOMoUOT6GukecTn1XpZq1KFVJ3LJDURDeFpEH3AO0U8tUgb49a
         BlBAZa4OjsUXhcL8K3Oa9BS9Q44EdrRIOiXR2uI8La2wcif5MH7XFe2KL3dU7f8ZnUwX
         5PIjF072vR+GMfr87QNGKAC0Oo1f1iK+YjzPVckJqrTCiuP5CS+GdoBKntGr9iO/Z9LC
         DmD/cgF6JIxUAALNKJ9FVBtXgNm994RYn72KG6m30ln2g2wzFlVFt137g6Zd66+aV91X
         l5fA==
X-Forwarded-Encrypted: i=1; AJvYcCVcKwUB14rKp/gQjtORvjB8iMmUx+XvQ9jTnL70S38UYwM5yJjOGqKh0DXCt8bXhNmxAzTK6+w7YADSws5R@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCKfHByYGMP5NDMsjIu/iCp6STKhZFrhx5o2nx/LrnDhlRgS7
	vJmX3H9PGauzHJo1y5wvPQwXycE9M/oRRcB3bWxnU1dB4EwV9aLUFQN+rYEHlYQaoQmO0O8+mLC
	CTo5MjWOVJmU8D2aM3iyYOIsj4dlV/lwELURpT1+bEhr7oHbaI+vWivR/Abqx/ybtbvcC
X-Gm-Gg: ATEYQzx8KTO6g1en8d103DSLYdd++dotEAh634gloWl06zJ2I6XrdxklFOUv+dj6xQo
	YGQ7kZ8mrzz+NUMT2DUBvX7iLE+fmbnJU7GpR5OGK9aYEMiEDgcfQE1F8bDMoI0xVsAZ8ptMCC3
	h1OI3zsWjo79gJNeMZ1Ord8d2cJZhA9jZP2xorh7C843zrQV38OUWPW/KWq9HG3F0QRaK+RRkH3
	li3ky1nxAWm9he6twcTvWlRoselJdq7NTOyQ+ELcxJGv5xHirqe5r26HMiLf+6b1H5hK6kFqBMt
	pVpCDCYRfH6k2QwH/2cunVnGcWWT1RLQdFc/271gELrzbrixZnA0/aiuxT4vhwdZIxfD6bFMArx
	Q2XCdCZXlciPO16MsHqJGgRywncO5HcxlViSbh7IUvDZWdd+fZ3PN/NEM1R7PT1pw8CJyfXVD6D
	QW+94=
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr309515685a.3.1773405541602;
        Fri, 13 Mar 2026 05:39:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr309512585a.3.1773405541090;
        Fri, 13 Mar 2026 05:39:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d6ec93sm1270516a12.27.2026.03.13.05.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:39:00 -0700 (PDT)
Message-ID: <e65ebd79-9edb-4001-a5c1-c4b6a67d5234@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:38:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
 <t4uhjpxdvjxda4dxkoxktv6xlxg3xvzyslgerluu3t2dzxv33v@k46gvwv4uf22>
 <137c19a3-136a-4e0e-b4ea-8cc474172d81@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <137c19a3-136a-4e0e-b4ea-8cc474172d81@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dnk29QZCxToHg89Rb7UTVH1YjXikzN7d
X-Proofpoint-GUID: Dnk29QZCxToHg89Rb7UTVH1YjXikzN7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMCBTYWx0ZWRfXwkGZmMJ0nET5
 tYZcZJidWkoyetextdq7ajUBrE7XzonLYSSoSiSy8iCMzjx1m95roHJUNS58gBaFRG1aCXpCliK
 FsP1Dt33rN9Qm4DwOBi1KXRVkXlG37+1NGDIjrzQFLQySQTbCH3eFSE4uRZ3mJRoNt0elzXUIaG
 Cg2DXvXjnyxrIq1XTz05YQnmZW/Mu3IiLyZc8IQ6nNnSE5dEE78hFFrXVx2RUoQ4LGX647ImwNL
 2FYEtolflxLmJTGbAhXCvM+gObFCibSAZAXIJawOyXFhLi6MzC0BvVNbfmHWXcbOzKag+FiJ68E
 oSSpFVDnLBav9bK/2HYQpqbCCzBkgBUFPNXUhxu8MF3CkrEtC+bMPIVHUAbjWqo0S8x9xHbvAAV
 i2pVw42+OFu/9GIOknzChWoGgxozFV7AW97LbSAQVSyqat0NVVLhWCAuLUCqKUAfG3yfv4wCETw
 PRx8GoJlVwS9+3pjGZA==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40566 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=jvAo0GstzFGwFXuFv2AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,protonmail.com];
	TAGGED_FROM(0.00)[bounces-97479-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,protonmail.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 17FDB283252
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:25 PM, David Heidelberg wrote:
> On 12/03/2026 03:46, Dmitry Baryshkov wrote:
>> On Wed, Mar 11, 2026 at 07:44:30PM +0100, David Heidelberg via B4 Relay wrote:
>>> From: Petr Hodina <petr.hodina@protonmail.com>
>>>
>>> Currently the panel driver for tianma is broken.
>>
>> How broken? Can it be fixed instead?
> 
> No output to the panel. Definitely can be fixed, but current situation is that we don't have anyone who has available time or device to tackle the problem.
> 
> I know it's not optimal, but on a way to achieve working mainline phones, my thinking is better to mark it as broken in mainline until someone fixes (assuming Fixes tag and backport) then just going black display (when we have at least framebuffer now).

If you have a person with limited time, would simply copying this:

2b973ca48ff3 ("drm/panel: sony-td4353-jdi: Enable prepare_prev_first")

fix it?

Konrad

