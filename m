Return-Path: <linux-arm-msm+bounces-104273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHUHE1Dq6Wm2nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:45:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6444FF36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D87430166FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209413E3DB0;
	Thu, 23 Apr 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewGjCZaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K23NdgNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F873E4C84
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936741; cv=none; b=XUdoe6hi9PjChKL/e/Z4jtmtb6RAw4SWVH/RdRmc9W+TEnOG0VocVBXtL+M6lGVYKPcgn/RKAIvG7ksrNyL26AmWERj/cx3hMDqswU4tEsh4IqkFXP1Ui/gwwG2rlye2eiPx5IUlx7uvT+HNkCGM7h77EDQOwuMr7ZXIxSLujmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936741; c=relaxed/simple;
	bh=Krl0RYxK8i+6LppjhYOLg6KRF2G2sUhiGaAzc13ALEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=min26f0NMgSxIKxHW5tMYncSPRIBb5bEob8hsXeksKYp+0SQU0dJyWQFp1sQripmnbYWY3gaWwUfNrEGoxf2L0qVDzQxgdTaFJBfogNrA0hUTcPEBbFNzQCoDs6ZBgCCsGFruTaDKp6/gHTquJsVAdR1Mf1QSxvcqNew9WLBcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewGjCZaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K23NdgNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uE4F3044072
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zp9onLJtY/hsYEkNo1u0iGD47qM37NcirSxgBjEKwME=; b=ewGjCZaYx95sXa/T
	DbwtvjRuHcsPwPIe7ZQvgBku2QR/upIT5kMXr4quMVQxioq10fBIyhvLyQ71BRsB
	mFoBItVbcfxhRpN7MudgFBgfCp4E0lD5pl34tlj1b9EmRE/XpO5vhyGf4nFUmKBK
	ydbSbWkfEN9LSCmaE+zDbBl/OlhsXS+cLGMvPZDIpX+rMg7e0zx81wkto/yPgaCw
	qGTXYqLdv8E32OJ/Z2e7Wk5u3l4txc28dervxjOo7HlmUdG+EN5+mOOx5i4u17yh
	od/KW4PuCladRkjXpeuabVYv8nlcgjtDQRjEc5J3iCYNt36KNxWih2pakbTPPLB+
	8sZNBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh36nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faec938fcso9667961cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936738; x=1777541538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zp9onLJtY/hsYEkNo1u0iGD47qM37NcirSxgBjEKwME=;
        b=K23NdgNfcfa/ThN8pHIw274BPeYH2eXDecfh3gQ4mtqa07c65oVWz6w9r7AYQVhN8v
         Geg6ovBUf+xYmgn2h3lZlV65fy0xhIIKdHaBlFvBAV4E3NNdLy+1Uy6hzG6xVUqVwylx
         S+jLp0yfPBZSnu/XPMciRy1lQwYq0sdbsGEXWarjGS5DjqpkxTo1NlA0RSJ+cSvreRai
         4lo2J4xku/TezdFCB2JkyU4VpIYbHtYKWrFlOflglKjOkH5tQOHJNTP1i8DNgjNrPZF4
         x6+6mpBjwMulUeR+eeENH2LfWwNRtXDZ7xnT7WnEY7e7YXTrcak/koFqae+RaT2M6zPf
         Kc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936738; x=1777541538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp9onLJtY/hsYEkNo1u0iGD47qM37NcirSxgBjEKwME=;
        b=UchTYBoUx7lIJazJ7SVJEkLxLve+YleaMun4lZVODKNb6QwRKzuOD1tmMhOLzkhV5r
         ZbE4EiE6rXb9l4X8MTQF2S/vREt6vApotrgt9GL5P+9JakjpmKo35LQubp8L1GAMm1eq
         XfjS9Id5v/bS6YDp46jjFHHwvpW2jP+lCwzXjC3e1+7B2vHeHU3pJYxSxohkLa3AQ0bb
         2heegrYvZujs6VgXq8RVHoTTAhab8kCVYUJJZvPKs9EcRjzHu0MPClbSElVoqi0umwEY
         jOkYl4s9LvFNRwJ55Fbe14KlgUL9ygkKs+6vPm8fjkbj1Nz+FPN9ZPan8qZRZOMbCZDR
         6ISg==
X-Gm-Message-State: AOJu0YwqGvZDcdpV6mUydjh/IlJrf9tI/nQQ3UkBJ+07Zs4bWTfmDc6W
	TK4lfJX9vMCcr1DlXsGwsULpey25B+s4y0si0u9jg6jegawnxoe1zJXiLOqkTwfkXa0XRH6ISLy
	yfKxmQA/7b6lDaFkLqSxeYo9fY8rrRfeFJNY4BfoCvT+8RF0f/Eo8pbanK7IuNthQfVtc
X-Gm-Gg: AeBDievoKAfOxgF47QoLU9xIeiHHbLiPbrW2hWsM65RiSapXFXMpEFLACiS9lClUu7g
	MOBPewBY2n5Wo2zMJ1q6Kc0ITgUkvWoKqDYWMk2oeiAxG5F9+fypO4V0YzMrNBz/RfBHGLBfpmQ
	6wBN1AOjiw1fwJvWpsJTPFLyG+t2103komTI/bmi38qTe4s8GtZ/YJi5q3b/jP++YRjG4NP0Yyk
	Vj7IgtoruL20giP3GYpxWS96OhvJIxhLxmK9tYiMvnMpFaFkhocE3q407ul1prG2lP1N8SfD82l
	+0Ii9H+FrJhFELer82dF1eDqgkwDncyqdpQpyIf+AVFTf1DIsYWDfagfhxTV8v/KNeu5FHumYR2
	atWpn2PVg+wav/y0j8j4clp3pOeYltO3goP10FaasOuolSsHqaip7sya5l8QgkR378SIkO62njE
	ljOB0d9ZXaE/sSDg==
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr161096331cf.1.1776936737949;
        Thu, 23 Apr 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr161096101cf.1.1776936737526;
        Thu, 23 Apr 2026 02:32:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm641956566b.2.2026.04.23.02.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:32:16 -0700 (PDT)
Message-ID: <6a83b074-8a19-4148-a4df-bd11e27e7dce@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:32:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
 <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MiBTYWx0ZWRfX5ueT29QMlqXM
 eDcJNrVdA2fOd+VeEHs0JGW6v6QzLxmFSqpLwB6K3+rOWKWghwZma6mego0d928P5j7+Q3wTOTw
 fVfcHXfq1XysA+bFU5WzrtvnZz2EZjk8oWSbdOKjxpuOSj9tiGxeFeY5Z5D9CB/I7lF+UxloZoU
 dacynGm7a06v3KYAL3vH44ZtBpiBrvkGtXZ2Vw6AoxGV/6D8P/5R+UZfSA2hZbIfCAX+C2LdeKp
 gNbja5O7Xt9MueWfibBkEg3cKltjcD8ZCm3Nvhj4462QIrqda1Z4M8kbWxkSSPQ8WYFuOWmjL8+
 ncWxVYreJlnrnP2y7jDvTcqrsP9F6kYOdvKLuaQj7ILpN31D8ZrDODbSbUOtL79ijDL4YFfTe5p
 rd+F91OYxo70t3MZ2I0/Dq1gRJjSXAqZDuJw0xuJVcUn02Mf9xL6lh7wJZ62Jq24FMXl1/gW5pr
 ZH5wSJzcCI5Bu6iKxLQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9e722 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UMJivPYMbgTVa61FHsgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: akgS7glGIhsXssKuoT7bwNr_co01V-KQ
X-Proofpoint-ORIG-GUID: akgS7glGIhsXssKuoT7bwNr_co01V-KQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104273-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43A6444FF36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 5:28 AM, Yongxing Mou wrote:
> 
> 
> On 4/22/2026 6:42 PM, Konrad Dybcio wrote:
>> On 4/22/26 8:01 AM, Yongxing Mou wrote:
>>> SC7280 and SC8180X previously shared the same cfg because they did not use
>>> swing/pre-emphasis tables. Add the corresponding tables for these
>>> platforms. Since they have different PHY sub-versions, their eDP/DP mode
>>> tables also differ, so move SC8180X to its own cfg instead of reusing the
>>> SC7280 one.
>>>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>
>>
>>
>>> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
>>> +    .swing_hbr_rbr = &edp_swing_hbr_rbr,
>>
>> For eDP / low-Vdiff:
>>
>> I believe the RBR swing settings for 8180 should
>> instead be:
>>
>> 0x07 0x0f 0x17 0x1f (matches)
> Emm i see from ipcat eDP Low vdiff(Lower HBR)  swing settings is
> 0x07 0x0f 0x16 0x1f

Yes, you're right, I made a typo

[...]

>> .pre_emphasis_hbr3_hbr2 OK
>> .pre_emphasis_hbr_rbr same as above
>>
> Thanks for point this, so pre_emphasis_hbr_rbr same with pre_emphasis_hbr3_hbr2?  I also don't get it's RBR or HBR3 from phy HPG. But now i think only eDP will be used in upstreamed poipu boards. i check the dts and not find any poipu boards will use DP mode(or mini DP)..

Yeah let's not worry about it today..

Konrad

