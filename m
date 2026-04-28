Return-Path: <linux-arm-msm+bounces-105046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFO0NFLt8Gn9bAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:24:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D8580489E16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8E0C357EFC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9C63033F5;
	Tue, 28 Apr 2026 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pf221uyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDb1nbNd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF42D97A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393731; cv=none; b=KWoq+L7NHp+kRoPMcGx8nqBSznRUj4B4m9oWLfhPhVTuk4vtxJn74Vn56BPauHlBlbI6fBDhW3nndslSMmzSZ0vYeUbxZgct9FHXSdEaS2NnKt4O7wwZqkTvuYjfI3GVw4T6oJjJkz3UaVPx/neLS/lgyOWUqbt76gSRfqgNais=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393731; c=relaxed/simple;
	bh=vHbVwyyhzL+WIyz6Ayj1Q0HvdUZKYPVlvgRmiUjHIQY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UhR8qcdlNxmPRUCjd6SRIKT1qlXC617D7eQHFJlENfJa7tnSbFAT1nUJw3KDQHHwjAOek3P1WzuxoVGJmN414zxZvRzysO+E3pAAJyL07z7+8qH3V8DELtni0BvqGwJUzs/9imxotp0jipC0wMUpvdoxr1948YZEUOZH2cgahZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pf221uyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDb1nbNd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsIn83713149
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=; b=Pf221uyLuPZpK6ep
	vGBz5U6reqNt6L54wSiRPN1rdkNdb6bzGCdMtrgoSNFnxOaBTZUKTkHhiblECSv0
	q7QklORkJ3xXbhoRVJzmKjQOuOUeqcs8GRE0SG7bQlrRRoug3zEiGfWtaXu84Eqb
	KfcZ2EElAZ1CBtp0FKCeudPh0Q3aAKSokoSdpTVEVdQsnPpWyITwxVy1pG7wQXpp
	fGu08dCQSbIuTZkc6yr++OLQtV6ADp+oqVRfAbUhhX+9Aa4jiIGMPGTTpKNE5hJO
	DxJ+z0CSK12No5nU0t8agAKmBvmbFwxFrokDOxUTEHIqO6mZAW9aKrGm5lw9PJmf
	GBRzjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtxb50msu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb04352972so793843585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777393728; x=1777998528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=;
        b=XDb1nbNds9Kk/8dmhj15NFyrj2b8GtAu1oVmjFNTzJdKDOUSCJsgyyuw/9tnnNvCa/
         LhviCP3LrPxlIuB7EoPPdsumq4ilSZCpdsvy35acgjEazSHyMqATY8p51orwv3ODYWLd
         CAbwuPNAMgrUkvyH8nWDo7cpxSi7YuoEZI3a71a0/GIrtRt83fsLOz2ZNL23xBXwjFoJ
         xJ7JsCdn+Otz8YJsR9m8Jmyvxqyz2ivJe1fa3XNgZeXl3NejGHuu0Y74b36cP9ixgTzd
         2AEHiaDIIi/pBZduj7J4YPGsZNqX5E5db8ZnJn7IJszIQGadk00d+dLYMgFk5yBfMj7x
         U2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393728; x=1777998528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=;
        b=bKKn1OosjIF59H05fzf9xn/csygb3HQ99dhNoRqHcCpN5L9DRUyRO2HXKfCeiFqSTS
         Zpne8wD/Nwtokn0QF0ZXuNn/rH0eUPvqT49c8j+GTDbyOpzYYoxYAo6L9H3JqaTdzzAh
         SbslhBzc8i6mRdAFBofAqM/0/siEtD/ejleJppNXVXnLhNx0QkXrzlMkZu+tR4jF0+dm
         1PNkV7jWmU26i5qImTWKN//UAPFqavV07Y0kNbtbgoD8Dy+ONQf6nTzhVhvIHWc2vZTL
         4w38tWYfU6Hn4SsN0Pw33lJWXPtnXxJTq4bseWR+WWzdfrBHAGrv/FMy/jHPRAUDCmi0
         Z7fA==
X-Forwarded-Encrypted: i=1; AFNElJ/ubgHYhkPmM6OmQLo4mlAFoMK04D6eOPijf2x2VjBh/HAhVxlcSmXeavoQgGfpgW8qY3Rn3SL/F3pgjMn4@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOMIBbOnQgEecsLkJINe+RIsl5cIpVl/027grA+gbpl/zC6+I
	IHN4ymiiYc6UBphZZhR0MVUZJI5NaC9+0/xLeEx9RM1b7ooS1f5sQf9i7VzP7q2GxljgvR/1/Tf
	k+30O7FGeWsqBHpa4ETLUbc6ntdU5vdy92ftvk1BdzqsCB7xoqpMMqgfHNVF2i81B69cw
X-Gm-Gg: AeBDiev80uCp9lkoeCPP706k9br1rjKSVyzhgDyP0vAWEraXNd4fgP6lx+UARseDwRt
	9906mgX2RCjQFKpsBnT3vfMNb5KtPMls3GDMUmqGy3lYRocZpkONvQg5NXDmmcIhnKS7ZAkXZsK
	s8tvcCRDojgBmcVe4zfMkOoBiQxJgaRNzSmO2XmCXJu2oE9ZMoMTFvKHo+Hz0AUciuqVT+KeOo+
	M14QBL7UNXfWZRdqqQCqD5jCIw1xLRoOW5uuggF9IlD6nA8I5jmdsuUaNYi2cQsTs2E7RDYXCIe
	XzQMYtztqWT2XN6LXFxAcPMx8sjYfxGJfeaHzVB11NxJ/ceSwM1/ScxV15FALVN/djax2S06pl0
	RL1q/kWBoGjIsWNWxz+P8WnhypKgTg0Bd8m4xPfPI/VuWX/PBWqTYjZIunGY=
X-Received: by 2002:a05:620a:1a1e:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8f7d9207991mr522153385a.39.1777393728280;
        Tue, 28 Apr 2026 09:28:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1e:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8f7d9207991mr522147985a.39.1777393727761;
        Tue, 28 Apr 2026 09:28:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c7dcf4f6sm234844885a.28.2026.04.28.09.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:28:47 -0700 (PDT)
Message-ID: <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
 <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1OCBTYWx0ZWRfX/iqSu8jWvTjT
 fW0zEIFHjge24iJb6n/BzVkRswlTJ3d5IVOBwCE25EezbYLReHdKjhoaE8nTyu3iJgTqSPsvIz8
 9Eic+Z/nktz7YYYJEFU39ThMKLRUsX21VptGV8T5CanDuTPSMP9VT1hS10Jbg/xmXF1w7c9UiCv
 L7LPot3qRANltWfGYgX4gOHzAjG4wscz7XgISs4wM5tI/LUpI6it1N+bxxKO/WM/6F+dquMH0D8
 tf8lE+7o7EyGUVNuVg5OlI0fT97Lp5NnlvguUx2dwhRbGeve/rQ3vrEsiF3ul6wLOPqEavWicxl
 TTGRbAh0zekLd5Ya5Dw0AuOxUi3inw1ZkDjm4nx5NceqIG03g7tACVmeK92MUzB0aidOHOlA1Ei
 TbcJFayMPY1pOe/TnHILkbvDUzOP0Ry/VZmhhFiU+dAM/8QC7XJIL7xaGuQil4qzWB1eodLaVRt
 d/1ycLq3dU20Cor4MLw==
X-Proofpoint-ORIG-GUID: z0eXd-jQSI9WD3Qnc0nZQi2cd3TsQqT5
X-Proofpoint-GUID: z0eXd-jQSI9WD3Qnc0nZQi2cd3TsQqT5
X-Authority-Analysis: v=2.4 cv=A45c+aWG c=1 sm=1 tr=0 ts=69f0e041 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2BwYiXoGMfxsfh9iLqoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280158
X-Rspamd-Queue-Id: D8580489E16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105046-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 28/04/2026 14:06, Krzysztof Kozlowski wrote:
> On 27/04/2026 22:18, Linus Walleij wrote:
>>>
>>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>>    platforms, which are already enabled on qcom_defconfig.
>>>
>>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>>    time and feels logical, because if one selects ARCH_QCOM then
>>>    probably by default wants to build test it entirely.  Kernels with
>>>    COMPILE_TEST are not supposed to be used for booting.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Way better like this.
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> I think this should rather go through your tree, because new drivers are
> coming and some other changes from me might be touching similar lines.
> Well, defconfig also might be changed in parallel, so obviously someone
> will need to handle conflicts.

I'll rebase on recent patches you applied.

Best regards,
Krzysztof

