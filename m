Return-Path: <linux-arm-msm+bounces-107860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHqaIf4HB2qcqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:48:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE754EBE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FE5301AA8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9804C18B0F;
	Fri, 15 May 2026 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nx4t/S9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ba8EHuD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CF478851
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844950; cv=none; b=WtnUEqx5HRQvgphWvYSEacLY85cVm9te84VpQwTDetVBT/lmR9KHy2qv6EwBL9zf6w5mZYCSNriTkiJ54qwt/w3Vj7qAn9jHT8T1BH3aIxdLtZkFWlk2G/C2y1SKK1LlNLCv5jHY/QiqYbynVaZ05CXYltuPP/nDi4FqwPvZylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844950; c=relaxed/simple;
	bh=DF56Or+6+RLdECYW3dkiXXchWwtgQ1WNe5+FUOsyPTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpqyKuTT55qMmeGZAyJCvm2ndXpTsCtjdRWnNjXzAqdXREUESqtNObFJ1J0U5fPhJRsfH87iHJx0O0msXln6R4/Btnd+Njgye82nNhhnYzB5Lq6ZWj+O0b1IOa8FXwXMsCrWlH0uq5nK9aTOUN5HPe8QY/ucZq+cVvbbSCGzYNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nx4t/S9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ba8EHuD/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5X5bN3514759
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=; b=Nx4t/S9pQwuenA3U
	RlxD0W0Z4YV/A+0ijB+p0RX07CsFvk7o7cuXa7udWA6TruXz8MCnTwpRUIFfMQ0L
	Od5kjttnzniccEMGw9pLxNmQN+YNZROdZTYfk+FkjxVcO4znZue6FB0BhYTm07KW
	aPDTi3BI8CAMHapzADl0Kov4hkHzeJAUtT4hfdn16arBAuP2ZZUNupVmEK285Nwx
	iQWnU2tYj/5xZp8Nv0E4Zy4l4Z4huK67r1g+dpEiET1piT4TgSqJV33jdQxvQwLr
	NjeRWVzhksbuQ8KsnMR0dfJ/CvgNzHqLAX4XX3aHuyG0m77EIjT5Y9j7h9SPZhM0
	sVcCYQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb2gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:35:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5751990b248so794294e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844948; x=1779449748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=;
        b=ba8EHuD/qX4Ax824gbFz1xsQpwSxXUKOLA5XrlqQgTDuJTfVxI3DwNHA2/V3bvN44n
         JpvSCbnMhd4hRpI8S+6UMhv1Mv8KLF23r58nBo5ME5pH6He40CWd0gkiqAFfkQtl0K21
         15dYOx0mtVsQ6U0Ey4BGBqaVz34FGOkv3wRPjT/Dk6yXt4ry2iKO/eoo6YVLRFkaZDpE
         3x3bFLXV9gFFdfMoJOSuNdSx5STF8/+uXuWKTysXQhE/axMpuaLC/zFmQjzvrKzO/0l5
         iJ4YZ1QzWGGxyWlJLKakn8W0BMYbicE0wF4WLh5NWs73RRmomoW3Pn7RT6jj9Kt8yp0H
         30XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844948; x=1779449748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=;
        b=qFV1KWluJzWT9PCjOPKq3IKYgJp2WMK0YiJ5rSOMMR6Pq+FeJdH46gbPQQTkqij7U8
         n+Rwk6b6nM0UgFZpJRJz/WME25gtbjGgQPnKzgatwKzqj+AjJMMrPKcfYauOVCt630+0
         BSe98mfvAMo5rRvv4bK1ZwQ+gIwGFsbnwyZqsgJem1WXj+mm6cApCz3DarxkqDmTea2+
         yboFMPuoMh16WG1Z3rBfGewc2YsxzzmC3Lmo/21s25UrgL/tzbbUgbTpVCUlBcFyJqc9
         hFkaPb6zKxCkdSXbXgDXsgJCoR2nccsLYMrpV1HSbmoMgjVE7adVsms4s96iJ0ArYxxy
         jzXQ==
X-Gm-Message-State: AOJu0Yy0ftc/RD8fcN/ALlT4aXbY0xlJirl2G+bxKWzOiOtdh6f7lBce
	oqNZrepWgErzfu9BB2Caa5N8zxza7c4VdzT2wW1flqTzs9ijNeGc8zECmUGd89cbDHJWiUNsRvx
	rsJeTIltNaRnNjhmK7TuR4qiSCojWTpmTG+/NiZ+EKLlcl4SfUSQdRLGnHIxSZJZtpoGG
X-Gm-Gg: Acq92OGL9VMAS1JNUF5MBe61MLMlxw6PSXEcM1yLTUz+aazKsqjxju+1Udn0IROcXS5
	xqSOGAXWYLmReBYx+/nhr6to1SUJCluxZIpnTBLsWF7jzyuIKCyuIX7+7rt5/WjMsVycM7jGJen
	VjsV6a91ZBLqrWjo6a8NbW1436lSI8UP2DRWeSQ3/ga1ezxZKCVVo7iA+mf0H1QNTPSPbUUPnnn
	oyzxXya5r4gs5vb47BJT3oFpzfwwTt/PH+MGWwOR8fTP0zyno5b8C17emj1j+FF0ENod3DY2wUQ
	W+jgG57QPQATR8ayvIW9G5FSAw7c3WINcP1KM0SbHyLOB9Pj/p8mxm0nnJW4WjQ+WNftzMOJGEn
	MBWISpDHkGi8OlcfCqnt1hBeVREfrHHAfvlONQhzIblXP3OmvNI7drbjxr2fcPyHnk8/7HM6A4h
	VtkCE=
X-Received: by 2002:a05:6102:3f14:b0:632:c8af:8a89 with SMTP id ada2fe7eead31-63a3f9a3a08mr733502137.4.1778844947560;
        Fri, 15 May 2026 04:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f14:b0:632:c8af:8a89 with SMTP id ada2fe7eead31-63a3f9a3a08mr733493137.4.1778844947212;
        Fri, 15 May 2026 04:35:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21b1esm213939866b.44.2026.05.15.04.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:35:46 -0700 (PDT)
Message-ID: <5d68c5ed-f777-45d0-b955-571fc192f1c5@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:35:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
 <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
 <daaf1ad5-5ba7-4978-9758-18caf829def7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <daaf1ad5-5ba7-4978-9758-18caf829def7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX4Sqdu6OaqGr8
 zM4KOuth0WrQ+gNHtcNPx7hL1c3yjA9mk8NorVF8eUqxE4WOryWXAAHA5YdSemdMFd0BF0GNxbx
 yxjZFi4ThSRLXYeGSUg4oRZwmSabhl3ebRFNZeMpR5nD9TZgvM5Xj62Bn+no6g9WhfF/6nXSPjc
 98/JUyrrjhAkobL10eWRSEyuD9p2n/0eUK22A8GBw7gtwsbaM3SzDKX//nEmEYSsD6Yf9q93JBF
 lUpzu966UMhAkFtRlCY55wfsnBbebFcqqCxr0B9asHQ+UWWDenNgggL3E9+ysa0FSWD4yyp9HxL
 heGyelNaTXY26vtrlsEHM6CkUanqcPlT6cUCFV3F1N5lBdqUkD+tErN2Cl6wjPIThL/1+Hv5zaB
 CmLrAyVY/sN+QnE4LEC4ehEgRSqYG9s+Dgn3/tWxVjoq6Rtf/nTx1eEI6S7A9RVbceXDdFlNexM
 KT4bv6hSAgSkrBmJlUg==
X-Proofpoint-GUID: gedKr0j52W5308PW7QlO3oNB22P_cD5T
X-Proofpoint-ORIG-GUID: gedKr0j52W5308PW7QlO3oNB22P_cD5T
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a070514 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=heyWJjdQ2MjHc7PzJnwA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-Rspamd-Queue-Id: 0ABE754EBE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107860-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/26 5:30 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 11:28, Konrad Dybcio wrote:
>>> +config QCOM_PDR_HELPERS
>>> +	tristate
>>> +	select QCOM_QMI_HELPERS
>>> +	select QCOM_PDR_MSG
>>> +	depends on NET
>>> +
>>> +config QCOM_QMI_HELPERS
>>> +	tristate
>>> +	depends on NET
>>
>> also:
>>
>> QCOM_KRYO_L2_ACCESSORS -> drivers/perf/Kconfig
> 
> Ack
> 
>> QCOM_SPM -> drivers/cpuidle/Kconfig.arm
> 
> Heh, that's user-selectable driver, so I think we should change the
> select into dependency. It will make choice a bit more complex for arm32
> - the SPM cpuidle driver will be hidden if this is not selected. But
> alternative is that this driver will be outside of entire menuconfig.
> 
> Does changing to "depends" feel right?

Yeah

Konrad

