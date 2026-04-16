Return-Path: <linux-arm-msm+bounces-103415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAbiITzl4GlhnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:33:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F045E40EDF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF8F43014854
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75463329C48;
	Thu, 16 Apr 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iis2lPNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1jnQudL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF643C4542
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346369; cv=none; b=uLQzmhE9D7CDEBomX5pfmSA+hOmT3LfpkTbiblbQywrHnuyzduwAhze5mUVlzgaSPieeYwZ/wd2Ki9yR5ExQ3mJj95D8s+HRoVVtZDXGj+RhHX1cVSNZbGbYkvpjZlaaz+PwBjBbGqVaBY6wsKUiqjNIxIEE5+4aYkWAu45NpvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346369; c=relaxed/simple;
	bh=YbI6rFfjkWl+Mm3gmZK5bZa2Hn3p2AU9i9zKbtIaCt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb1xWOwaP5ftXBj8bw4zu8zQHKUC+KdxVqxBRaZzIoOCCnbZnw1+0UpRpIVc7C/0rEIJAAXd5Mig38l7AGk4czayUkgbBWvcEAdMM/ij8hiW0ATBuLTFknwU2Ho+wjRtTbESM0Q6TBALqcWrZroeBoaZv1ahjXAezm38N+toCNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iis2lPNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1jnQudL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GD44oG218865
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=; b=iis2lPNox+J4svGE
	TKUT6l+aX0J8F74bLMHNsAsxplhyroH9vRnS/Q9s/lckQjzUU8FmJTwMEL3gC/i7
	/KmrNfRAi12t0x6EuenQCoA9r7mg/sYv/aKQP412GyBHVFRhHNY77MpHXBT6oQpk
	L38vZP44eVqS9sj9guqTNeVMmHmiJYqrHqIutAB7+yBhk/ecY4KzLXyjvsmCxtNU
	oxC3cdJvkJcEdY3uenuHu4hCbrnHqgCABYNd4XMp0xkggGTK6RGS9NvTPAc7M6p8
	PCLjqyBZ5Lvk00rzhGl4grZVEUn3/iN79ZUtt5NZSz2SDvZj6THacV9CWFhit0Fr
	woaHIg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyhckv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:32:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-610b3dc3fe8so314619137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346364; x=1776951164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=;
        b=i1jnQudL6yfQ3VapA0KtZtPS87mV7sR6koeNVStGuTKEQolRDux/A/FrOOlcJCxcmO
         mTrupm4k/odurZ9HzusRiG8TesFcUWxtZceN65uZH/rjs07qq1hQtwYGFejCcsy9Vt0e
         KAxVVlkt5Kakj9f5nenBHtL8xfUhwYuekav0AsEDe+b/lcfV/HIX5T1sbt7SrzQeOYCV
         XZF7S3WKEowd3sNBaj6eJ1bRKoFOvgr5qPQS8t+OjZpcE/f4Vlzkt0PR2riJbjDXGWVP
         hWUWnY7w2SrPbgvMUaNitzJxxfpoGybL/cff+ILFDmxGUa5e/GKb4bnIIGcfXneYuz3/
         65Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346364; x=1776951164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=;
        b=DQ8gjeWp808DJ5lM607SjieHuChupBMPx4QP3kKJJE5PYYw98PPZELuuqtWaxVC4Df
         KH6bYiQvXAkHOCOJ6xtmfWmJEgRRlkZC6ksP20Lii7KC/GI3fVwHf7lkzW5DKibJv4a0
         Hz6Li/A9W29kNG5AyNUuuptPQUh+lyJT9gJy8GCKMva//mhxLdMOGY04pOr0JpqNqW13
         2tSjRCXL9iLP4xYwN4WH0QvGSA0X469lKexm4euH7N0kVFipES2HUAxF8xkLyLdejyy8
         RQNAALXrSlXcCni5GRMSA6Wg+Jz3xankihMseQ8hgEYCXFGwMvpNOzkkeRg56vU19D+/
         eGiA==
X-Gm-Message-State: AOJu0YxrO/dyUJHtOPaxRs6iTjBHcypBGx4qUgHFwWuaUsgI8bZcqpa+
	PSxq0aAfjabqzS4ASusE4oN2RxpaBar3n56uiviHXg6xV+2FxT2xKygJdj0O3Ec+hUo2wDxC9cA
	Vh2UILWwQnZ1HqOvHoYZ0LDzqhVLUsSmMxROJBzHCxlH5l0Q+TttraNd3APi2RJB5iJaf
X-Gm-Gg: AeBDietm6QDw9VqoqNoPpiJYR8svZfjgvujpWZWxaCrPCwjBEGr4cl70Rpzy3BNqyJe
	XsatHmy3rF9/KaGMRb3GSA71u7v8p9crf1pJk0wWYVZizapIrmjc6HSDVDn1vnb/PpwcOMfe2Nu
	W5M9h1eJN0nEuYR1FRoM4Wq8iuXpNegZ/LOZakVSVWIwWawjLeOZL2ltVzOhKF0A8N1zvlsNp3M
	ZGud8oTYq+W3BCDGCNk2UDr3SbzafTilF/jUFbdGaaRMS/+rN0st62/dNXG5xqrrahkUlqDOwQs
	28WkwOwX5iw47ElbshWT/opmYe5jtQt12c/P68Tfumg7bIOyw44Q/JeSOgajX3gshgUm+fghxOP
	CyRTic53wxQ3LNtAKCI+oz2medabAHjRK2TOUvl+d31NSfr6XBhMy70oEKq/yUu4gjMhmHJd7ho
	1JoSps7Z1+AJ4LOA==
X-Received: by 2002:a05:6102:224d:b0:604:f07b:efbd with SMTP id ada2fe7eead31-6141b35663emr353121137.2.1776346363839;
        Thu, 16 Apr 2026 06:32:43 -0700 (PDT)
X-Received: by 2002:a05:6102:224d:b0:604:f07b:efbd with SMTP id ada2fe7eead31-6141b35663emr353095137.2.1776346363330;
        Thu, 16 Apr 2026 06:32:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a309429sm1306333e87.84.2026.04.16.06.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:32:42 -0700 (PDT)
Message-ID: <7022fd85-5d8d-4835-9d7b-995583f2f8a1@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:32:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_mss: Add SDM632 MSS
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-6-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-6-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX1QXs1+XQ/L3B
 mp0UW6Wwp8W+Me0Y76XnFUOVUQH1D0SXcxJgmLO8euAAmCH9Z9TTzoGyUq69ksoe/+Dx+tgnFHQ
 SdpbPA3BXRt1h7t2mSM9dmEsJ7Jrjt4D1eDzlcfXcp3ZBGgwhFBhdxGdhU7yFQUvdaRyfwAjNrm
 9jsmWbklRhDyY0oyo8kXSwoXCEK1dXyVdQ3bOZKbqqPfbv1EJqehFS9m90dlp1khBYi1+jG8yhn
 qYhSJwh7sk8wqEiPDH1SqVmQesHHoSvTde/ChSDrZScVyVB9mH3MlMLeH/UUxoH/wcKi+FeSOaG
 0GXwtVaHjV96NvsHf+44cFrWtB5A3QyfiLR+ZvEGWkUFuyiPSLCFmF7N5tBmCSoWL7qtfuME5yp
 fe/MglMtIq/8dVy6aj2how5yuFMPS3SAXOTbpHBE7kUK1IeIolarjMcZ+DVKbmypQvJ7u9wRf8B
 ueI3ULXEN1RtLDRUfQA==
X-Proofpoint-ORIG-GUID: xk-UJEBhbHz3MYXXGrG2848ye1T4KrSf
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0e4fc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: xk-UJEBhbHz3MYXXGrG2848ye1T4KrSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160129
X-Spamd-Result: default: False [0.05 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103415-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F045E40EDF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> Add support for SDM632 mss, it is very similar to MSM8953 mss only
> difference SDM632 is using mss-supply as pm domain.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

