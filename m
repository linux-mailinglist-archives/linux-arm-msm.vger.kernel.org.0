Return-Path: <linux-arm-msm+bounces-104210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPCxEWi+6WkXjQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:38:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9744DA5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CC0301A918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EC43909B1;
	Thu, 23 Apr 2026 06:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elGp1avN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qr5B5uc1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAD3264FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776926309; cv=none; b=JKaSE/cBeTVnfNch0CEqCxIJpYG68UbcxR3wGYMaWt7GJjg9bWvsc8IW7PSSxgoBUEWK7/YdScamUcS/kxK5EC/ymcZlFesW+Kg9OKG46Q7ykC1tyeIY08cYyaTbBfrwa80u+7uBDqQI2UZG1DOutcxHGNnRppGfsbS2PefnBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776926309; c=relaxed/simple;
	bh=f9bB+QCzyO4SPrZm1hCl+G5k5J3z0zeRKWEBzruI15s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIndg9TCH+54rpt6Q9talQaW3WOUtZ/jsng2j06+d5K2rgZsifg13JK4xkt7PGjfACfhxbuwrZdFRX9SpwC83V04zLzX2E9QsaPVp1mx5/ct1OQoJv0l7I92NJ6p61rCZ2WRf7XBeslOKAguNZdPglSZRpnSsEV7etzn8oAnZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elGp1avN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qr5B5uc1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N35d1t121891
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLGgXgdKNsiXpJ40Bw+Wx6qYrT09N0IAHqV9io35Jzo=; b=elGp1avNJTiNsW3s
	3fcfgJO9t4TwXaPXAcwz558CRkOUbF/p6+V05UE6/QrmEuqXddNB/jWCO0EwIODE
	uwZhWC4tfw9xRWWKbpGgKYarqfvR0n28STK6KdojyEQ4wtyA4+cZgpI6Zi/WYSN2
	U/msFi/Wy0ylYfI+okkTpun5qvbxP/8GC52BcwuLScthnD46oFUYIvVqBncHXIXq
	b4u6o+9zPmW9M2GeLVArhO91Hk4h5quqHGlQ3wTa0p/FDvM4llSqsewZLSDAKC1b
	J/D1ZY5k6c0LBzgMLzOswQl8A/B1fBUZ4F/nkazazWZu8lhGgxa9W6N9L5AGudnc
	r0toOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h82h6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:38:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso63881895ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776926307; x=1777531107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLGgXgdKNsiXpJ40Bw+Wx6qYrT09N0IAHqV9io35Jzo=;
        b=Qr5B5uc1U1BNhzRQhbGjkaFzBy1qOLiwYaeceriH6dLXB3LTTsKZ2/Jmq06yKS5w1l
         RzZWJJppTyBBHSBzB1BURqtKlyOJbqUbudS+Yd68YOs8GXtuEcZhjfLxOZRztdj9uugz
         1RtXx0Ud27KLSBVdytpoCvzyKwqLe6K05lKCR7CDtY6d/O0huZp5w4C+hev7u4DynD6S
         /LdbHRvmBWBtdtwI29AKxbENl60r5mQU0YpLt4DWeP16srcyXS1xfXDermYYn0udV/fY
         yKgQp6Ux9S86pZYX5NMV2BJaZqXbQz54b4caBxcb+z5mM2kCFShtQAAj626M8D70dNT0
         +5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776926307; x=1777531107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLGgXgdKNsiXpJ40Bw+Wx6qYrT09N0IAHqV9io35Jzo=;
        b=mKMYHXV0W/J+Rg/i3h9gh4bMCcjirghxN4asM2eGsYNpWrFi3ZC5ivStk1WK/dhKgI
         yl4pU5Y8p6CdqXvoUz4egpJFT5wt1TFtjs9KXaSW87UOmyT5NIV84J58dP25xGMrIZP/
         Yd8I0pzjqehi8tOdAgr162YKxXajbE3/BPf/du5jgaqCTiXK2e8GtBbV3F98aeM6/7gc
         nFgNGP5No/uaFV7DUvoTePlcPpsbUBhQ5ETKpPJT+zoHAO5/SICi5pYPYSoRXc7wuf74
         21QqvkVqCZU2z8/ecH0BhfKNzLBWRz7VwRzmhXYc1ub5njQeX0/6MRtOJOrMVrOfzpjQ
         +E4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2JR6pb1TgmwUAYI2cbWq4NHkCvHaxJS53gZ8vJ7LYq6/B/k5s1JtXi4sNeHDoig+qH0jrqETziHySznkO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XkaNoGBgYrtp9zp/7unlm1m68519y9Dkq6olkQ4fNtjMdEQM
	8SjITCf4xwxMBQbZmfme9qsiSZemM0QAlzdEmh6HN2UkeUEoV57cEvYx7ty1N8GTRBLgSjJY1Br
	iFxh3omWQxt4nqkFeTxSp7BcIixQYbkM/d1fCjSOqFCumjg6hjFd3dBe78gy3QKsTOaJ8
X-Gm-Gg: AeBDiev0jDUGGa+Gq8Z6giBaKVQ9PulDOSX7b+DfZh9rA6ZZDVrbsNrsNmjCKzUkWjv
	DYJj6imiQiTXKVhzKSFdCaNUE6/N7V4tgzqvO4hm4JOOAXEUpOLYs7CeQmen2lpiSpa20t7j24q
	+fBLWjK58C5Rkj0s/mjPwKptyhV8fRfOnwx7gcvSzi+8irYxHB/oY2LV8SS/HPhXYpIzROY+mnb
	HDW27yDxeMfWiO0NoDf7YEcBhGDSM+fwCgTbPaBWXFiV4hLN2VOJD3SF59DcE3zrfZOFilQaDAE
	XM0TzcbaDX0Nu43w31xyyTgeXCVAr0uQ5fFkSUIQ1LKoD702n9VbYh6YjzLRvQd6YiUyehfnzWg
	BAm7Vr7YpQ7Qv3CEkbpgOaRAD/PBMahaHAQ2xATqm7J5o5xhWYCeVdXRKAegMlLJPGss=
X-Received: by 2002:a05:6a20:258c:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3a2f75f7de6mr9430749637.37.1776926306600;
        Wed, 22 Apr 2026 23:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:258c:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3a2f75f7de6mr9430713637.37.1776926306134;
        Wed, 22 Apr 2026 23:38:26 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f0811fsm14309121a12.0.2026.04.22.23.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 23:38:25 -0700 (PDT)
Message-ID: <8b2c1131-c05e-4c6d-bb80-55b812b0d132@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:08:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linmq006@gmail.com, quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: krzysztof.kozlowski@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260331114742.2896317-1-mukesh.savaliya@oss.qualcomm.com>
 <20260331114742.2896317-4-mukesh.savaliya@oss.qualcomm.com>
 <ce5eb817-ce13-49c3-81f8-8e28c40632a1@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ce5eb817-ce13-49c3-81f8-8e28c40632a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MCBTYWx0ZWRfX8dECZnWVoOeM
 wd/ouORAESjdaZJ/e8QEyFi8KWjJcvzzjsBZOx/fzzpkzUteM7lXdXyEXICLrdPqyjc6oMJxT7T
 FupGGMKQ4I7remhFsmHsqi1cXxEqCCmKf44pFv4Z2/LrNfxwPYx1GeMRLEnZBz1ywU2wl2X4IM5
 dcE8RXLAshKGw2IhdIOrCbi137lxHqL7ChE/GETKDmSWCE50RcpsAdNpS2aXwN2z3ommzSN7HeL
 szmrnR6e8+nvhonCh+mUS1Fa6Npo/71sqto+j0QLatYWf5958L4Ph6rdnoWOQZxSOoVPN0BsHl+
 GsVCMH3BN2UVtl5Yhg06+Rsq+qYqBMpt5zqwTKVWXV39yV4fWNtDbrKBICfS4YKQuEC54aebDWZ
 70jmu8v+vBKKzDAwpsHITyJemIVpXg4YL64h5PSJEO/ScuV4C83i1aPHdlrPq6sBejdwH3Y/0v/
 MKBKHrFr6SoR867U4ew==
X-Proofpoint-GUID: JGCKKREkv2YwXEmM-FZQTivMvpn7jsNC
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e9be63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NEtnsU5enKSBwt4-RL0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JGCKKREkv2YwXEmM-FZQTivMvpn7jsNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104210-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BE9744DA5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks Konrad for the review !

On 4/1/2026 3:49 PM, Konrad Dybcio wrote:
> On 3/31/26 1:47 PM, Mukesh Kumar Savaliya wrote:
>> On platforms where a GENI Serial Engine is shared with another system
>> processor, selecting the "sleep" pinctrl state can disrupt ongoing
>> transfers initiated by the other processor.
>>
>> Teach geni_se_resources_off() to skip selecting the pinctrl sleep state
>> when the Serial Engine is marked as shared, while still allowing the
>> rest of the resource shutdown sequence to proceed.
>>
>> This is required for multi-owner configurations (described via DeviceTree
>> with qcom,qup-multi-owner on the protocol controller node).
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> + * @multi_owner:	True if SE is shared between multiprocessors.
> 
> 'between multiple owners'?
> 

yes, will update for next patch along with keeping below RB tag.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 


