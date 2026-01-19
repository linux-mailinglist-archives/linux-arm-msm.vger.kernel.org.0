Return-Path: <linux-arm-msm+bounces-89683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90374D3AABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 795AC3036AE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C1436CE0E;
	Mon, 19 Jan 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYM8fCY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJk5qAit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E736A01D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830782; cv=none; b=vFbS/IV/SFAX8nnfc7IrbhtKxlAN2j8h1dOMQE6A4AiNf9EE9VaL44MCUs9BA+p9rRIad8zU0e2sPxPzoZber5GJdUGXzH10g4zmTbFvHiSdJzcGHNJntxTJWBAgUfILJTpYN4/8z2UNPHkSEFhQMrABFsiNzxriXkrPwfc/cx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830782; c=relaxed/simple;
	bh=a6wusx/FIuEUCbEVh+KlxcthvRM1OHSO9YfMwdCrP3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPpztZ12lOkvVa8f9dVcR8pqHCZMZbCDLDdKil3urUL4c0bbuFbTQzeS/6MA1Yh1K/y328eLWSXiHV//1yPSbGBrxnlbRcoBTgMwArOqXrWM8A/Ep23MawLUbq0PH1YmTSMjuwdV6RudjaQE3GJt0uGo4urd1COerE2RldJkBIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYM8fCY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJk5qAit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90wmN1044117
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2yYABefcl8Y6c9tMuTMnVakh8IZZwvg1AtZkXNN2OSI=; b=OYM8fCY1SeMPelMR
	J7mB1b8vKNcbQ3dCJtVAlmaMtqTGMhy8E3aQVvk1pCSVJ1hKlaEpnaljnZDXSeB0
	iQESoDtUotXGZu41TrtprNxqfbHdHZF0V+Dxraqadd8KLTH/WlcrAdvd8XH98lNL
	LQCkk5a5BluNU3Z7e5SvQehI9UHpuPkxfeM7JIkhXaRF5+G3gh8tvyT4PFo3Wv/f
	ELR+JsTod3rht9WCSM6AFo1pMR9dW2Md9r+sWbZC4H2EqsSs3Rd8b0eDzk6h2ZXf
	950XW5YG4cnmuslIhnkEwvtci08wVYwntHeL+r8YW5Xo9Gj9heDR8bJcOTUPkmOM
	g7Kxcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79eja3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:53:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a182d4e1so108174585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 05:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768830779; x=1769435579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yYABefcl8Y6c9tMuTMnVakh8IZZwvg1AtZkXNN2OSI=;
        b=jJk5qAit+vExwSVtkUPjywMq+HRrJcISP7Y0IxghaeFmoNqAD62BSdHSfV3J7Bcv0t
         2hggn3L2f0zXR6yh1nJvs7MEA5uvLMGl9bgDNNRtennUU8YcXbkeJHm71vW6gwRwnedy
         5ODIK5LA4e2fzvZQ63077nimDuc06wP62DrMpiwtiueCMvEsiZEr4xVNxm0GdcuCLBR0
         hX8pX+KIg2mco8/f9Y2Ikkr4nGdRG+veA/1yzmwHDjoKCAVvLFoIFkX5HQ6HacCZaMYA
         vmFbCFbZBUBuzYEBQnGE5LslX4pQhxfxzxXQAdOn8HBPtSU65SD1WGc+bWvDQURwMMya
         pmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830779; x=1769435579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yYABefcl8Y6c9tMuTMnVakh8IZZwvg1AtZkXNN2OSI=;
        b=WBrfIFzE6gdbg+gMeM0ABZFu9Ohp1degid5cYcN5qUm7hWZf4nJTCvaU42tihmu7A4
         C178TEMgnp36S9VRuh03HdgK6fLt/fiA9CyRmBUgvjJlL0gKvHqvOSAYOXW2OpT0TJBi
         Yv0BR/4HYLmh2uxecnmJUrRLevWY5WcNKb7FU9A/KfqODJ+FmR8Z4bm8gFYyRwXMQAvp
         NoF7Lxh+i6v8eiu/06+EyNZXkPcaYZjC485am6qluIGE9xilu1TZZTG4/yqVKedtm13U
         LLg5250z97md1JRZ5V2j1Z60TLbNNptCqLPjN0yaJ53L3dahi0SRLYUGQ5rsv1CycHS4
         A8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXsrK05iv581kGzSEdTOTqo24s1q7NACqHSk1anP6eaEclaiSbfh5X8/f2JM5reyV6lOdzfkvT/DmAtS5Ep@vger.kernel.org
X-Gm-Message-State: AOJu0YwSW969ewbRuKMR2Dsm9IQY9QvLwAIjh5ZxQP37smTk1IHZkrFQ
	6YaDQXbx7r8n7b9lT0bxuDlP4Q1Vnmhkjhot0GNsy4yA0RIf2OMdo6szSp3urmo7lPSbrpsYpqi
	4DyVa/pWsK46KMwa46b8soVbYorbvcPp/CmGOfrAE1ErWuTkK4eUXbhuQWCRLKiRFjOPQ
X-Gm-Gg: AY/fxX7V+H9ue+VftV7khuZS5wtz1sXIMGmWrOTrqotrJwp7QUvowg6tDyRHPo0Nrlr
	XEa3lFPhY8R8pn94FbXJ8LHsC1Aa5j7qPzlb5SBCfa1su+iZK840MNONIRaz3iOVTk01+wRgJOQ
	mh0oNJ0fHnMiBm8V8Os7O2LED/DzyCxqSFqTp+Ts/oPo6j3JGK8b0NrlXqWCx14DVSuB+/8UWmv
	bIHXAdjQ6/oA2WjB6/z3k3zX9Bb4Sm6jdTkPDw+0oqAf7EllVYKhgXEkO88azZa2hQ6WPKGmtbd
	Jd7P7eubby8dBbNQPydmgmsAsAZgIkHhFEAcvyIGvPwfeaGXS002KyX7faO12/0lOI3kk/bltW6
	iyRwUetx6ZKXoiPTAbMXFz2NJRmtlm/JRdIeJ6ww8fZC+h4bBHfz28Je7d5Va1qqH2fE=
X-Received: by 2002:a05:620a:4111:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8c6a670cca8mr1156541985a.3.1768830779004;
        Mon, 19 Jan 2026 05:52:59 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8c6a670cca8mr1156539885a.3.1768830778538;
        Mon, 19 Jan 2026 05:52:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8c82sm10495719a12.29.2026.01.19.05.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:52:57 -0800 (PST)
Message-ID: <8cea513d-c1b5-41b0-9455-abff0aec3c36@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
 <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
 <b3p5yhstng6nbrrdavx67vlv62hqqlnms7742txbimpeswqklv@eomkmkkearwp>
 <e2dfb857-1fd1-4d29-b04b-6dec0b7563d5@oss.qualcomm.com>
 <45f650d7-7369-4a0d-b931-3ba9ac998f75@oss.qualcomm.com>
 <f54f4eda-5776-4a68-a661-b66619ef9041@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f54f4eda-5776-4a68-a661-b66619ef9041@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNiBTYWx0ZWRfXyyPmZ/NxoxjX
 5aEP7HXhy6kMXTBIFDMyG2tTFtYQL15ghcZGsHkPqv54q93SPuZfsFZiVghpWR0b0FSDO8m9/3x
 w5vRp0P6vO2r8X1VpTMy05gfay4tnFxr8nCgRj3+8fid6GHWobKBpxqMv6mBuWoGlVSfAh6/fcg
 E7PMi0ys6LyuVoelqlHX41jG8I9GRE7Cu2uUJ4FHvf+PClzWGkZRJh3m2ihm7wkar92ImdfTuwq
 l3x2W9/pVZ4xFg80heQ7KmYEFcG+P/G1GIayww2lyhF8V4VYCZrnEjLyXYN9kPXdTVhM89lqMCV
 o4EcNwcVZrpqimf9Hj6PW4dg0tKnhEo/Y7ANdk4mBhgNV+E/vYlu7t00PvU6zs1ObXFnUHynbAp
 ZX5OwpG2ZZKOtORFF+gZ8aXwkh2FISQALNQbcmfxn+RRjXNCoAmfH357fMtXi7gMsE6T72xv6Jx
 9JiFF4lCPjvL9u+WKuA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e373c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2uW2TaI4kDKh1eIlhbcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ryXpSGrBlVNuSuEBZ-3ZDfv_TiQMlPcm
X-Proofpoint-GUID: ryXpSGrBlVNuSuEBZ-3ZDfv_TiQMlPcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190116

On 1/19/26 2:51 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 14:35, Konrad Dybcio wrote:
>> On 1/19/26 7:54 AM, Yijie Yang wrote:
>>>
>>>
>>> On 1/19/2026 2:34 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Jan 19, 2026 at 10:39:04AM +0800, Yijie Yang wrote:
>>
>> [...]
>>
>>>>>>> Changes in v4:
>>>>>>> - EDITME: describe what is new in this series revision.
>>>>>>> - EDITME: use bulletpoints and terse descriptions.
>>>>>>
>>>>>> Oh no. B4 probably even warned you about not sending it out.
>>>>>>
>>>>>>   From this changelog I can assume that nothing has changed. Is it
>>>>>> correct?
>>>>>
>>>>> This section was generated automatically by b4 and was not reviewed
>>>>> carefully. The actual list of changes is in the section below.
>>>>
>>>> But why????? Why do you ignore what was done for you and write it on
>>>> your own, reversing the order, etc? And even if you decided to ignore it
>>>> for any reason, why didn't you delete it?
>>>
>>> The confusion was caused by mixing b4 and git format-patch to handle fine‑grained patch formatting. The Git configuration Konrad suggested did not work for me. I ran b4 prep --manual-reroll <msg-id> to allow b4 to track the upstream thread, which caused this section to be generated automatically. I did not notice this and mistakenly re‑wrote it myself.
>>
>> I found that I have additional options set in my *local* gitconfig:
>>
>> [diff]
>>         renameLimit = 999999
>>         rename = true
> 
> This one does not exist. You wanted "renames" but you set it two lines
> below.

thanks

Konrad

