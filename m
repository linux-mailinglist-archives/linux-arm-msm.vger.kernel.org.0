Return-Path: <linux-arm-msm+bounces-115398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zsEbNb6vQ2pufAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2D6E3EA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:59:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EZDaydgr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KTWPrOTP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115398-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115398-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1F5C301DC2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070A240862E;
	Tue, 30 Jun 2026 11:57:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C040803F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:57:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820677; cv=none; b=jZ61BI2v125q+9yImJbCnEodHdlR2E++qo99PQNB+JnxKdj+SHLpmz3ChOkBx5UDXwAwlrQXCVVVzTGrIlc3N54fI2WewKoLx1wKBWn4NVG8T8GNwph1qfswV8OoLQxhaVEP8iSGYzcDOqTtB0B0DQI4GKnNJeDMp16xHv2fc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820677; c=relaxed/simple;
	bh=yRLwbmZehOFQbJdCz/SPTD5FHiCCv8g1D/InIpDlBlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgizcA3e6SuWncVArCj4SKq/ybUxfZ6ROs5yC/fl+StQMa4UKvR0QOQxNrodXv3eGpxCgLM9uDvrgadxfq6YG4/SWrHrHm7cDW00ecS27o5CvHbotAMNszk9W349qYUXDIn7oW7aCSfmU/3t9i/o2pY9UHRRJVMsT2sKScQW/tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZDaydgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTWPrOTP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nC7o1590625
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHC2Rgq/cf45xzQp1L/2Fd/3fsuR1ecn+pwz/JQ+FLc=; b=EZDaydgrj/oZl7jO
	7pgkx864g3sxB4SbG9D4WWfOKy0H+mxmVtQ2JxnHlv1j5lYg0XOSC0nCyJAyIN1z
	ThwirOWEYIn7jQ6s0UOmH3mQ96XZSa5xO0+EBNS+p9u45mx1y7QChlekmNXYV8MC
	rBspFsSwOC7xwwxa3gdgZ00NkL7sZnawPm1NZJcCk+Y3AkETkdUywFOx5tR/h7jl
	4jxfOT8A2RfbwJ3lxFia9Pdj/1bnqJT7+xn9huipNIs5YLJ9hZPatZPxTYz9Jcr5
	dGyWgNu5sNDrNFVmpfsJ8dY77wkKnYdtMUKFlxGXvSIYG7/3z0MuiLlJYiPiwdGI
	k8biPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3cvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:57:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so4210021cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820674; x=1783425474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHC2Rgq/cf45xzQp1L/2Fd/3fsuR1ecn+pwz/JQ+FLc=;
        b=KTWPrOTPCjL0RY4eAlfuW3iMDGyCNniShrqTyXiQudzSVDjTtWcsSRyUysts3c3g/G
         +EIopceymEPhxVbIrkzSstcjPFuOJ9aBCS0YDZn/b66VOk2qheudDRI5qZlyDsqQEDkh
         Dtd5zp71usiR/dNL+/AARKCc4855d4Qj4jb/NXXnMhHHBy9cVmnErUqX6enHwo8s08tr
         lGq/qjemJuuIWy7wPsNUJ8FgFQztSfydPQzTRrIEmOpceET4ZegpqC97TSJtlSJMZvGE
         SJK5nesmEsp6NwEyxlfzAezDhWbHPg+Kq4Mi0aonUvyy9wzJGAvVyhfE/BpflWFPOI0A
         HU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820674; x=1783425474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHC2Rgq/cf45xzQp1L/2Fd/3fsuR1ecn+pwz/JQ+FLc=;
        b=kHN87CzdYZ4cY3QefTLz6KBSX6fihSv00tvPJi9TL8jd1Hz78OLKBPPePyXqRwicpR
         ckufN58X2LATU8MHJVLxwlJTUgDDdWjC0Sl/KI0eng28dig085ci7wxr0XqY84aF6FN3
         4ha4OIVnSM5ofm/d52x1SMo2HmFYKVihR4esoUp/LSjrUwYZHnW0VhHzDLPjkeHdDo9/
         gRCxug+EWAFRduHroIe6Nh05zhPifVDY/yeJNTzBjx8FCovO2kI99oFwaevfmFi0tf9J
         l52A+r3bd8TQ3pY+fvpdTO/mi+YZHz41/Xv3UwMm7VpkiUkNMrIz7a9/DIlUQd78A3q0
         HC4Q==
X-Gm-Message-State: AOJu0YyS/U8ZjHEU7l7gVLGwbR3Ie2I301ZIHkJsY+Vq9Y+s31M5uAvV
	KEwZMfFgl0K40SvSjnNkshi3OyWs4EfKI+IR/IZ0yWGWfEmz7tRc6etaFLkv65wluF0DLpb10mj
	baB5iSjfod8qVUtBSUBbqGnTm5m+pZkVoqJRYnZvnUcGVx/WfBQWrbhFiY0EBvY11KA9o
X-Gm-Gg: AfdE7cncJbYgsFd0WqA5OkzJ5wP42IdQJWWJB3Ph1RQbh/ueQc4BlVjaK8y5A1qIq2k
	ijk7zYNbKW8bJuDrmGu2vL6nLX051xazYFnBTQ+lzQhyYdAyKRPrkV/rVDpbvl1rz7BZKuTVBuB
	oaR6kH4zsRAJVMs8p/7PnUnEpttkwX5/Jh++uD3wbEfpckIuRIMSlr3rPDQCp0TJI7omRwiml4j
	jTKeNCDJpNLuGDCvzunaL2Y8iwtUuGg/eLWwqo63oMi1lXHRNfvflUOISnwtRdW+Dq73nWH33V2
	Njy4xbKB4aiGFRGYNetaIequw3Ei5Ad4D6UQRVbe4luOsGy7zH+cPYVVBBt7Q7ELSPfIIpW5Lty
	6QaeiaqM/TSZeMdmDFLNhcf1g9WmA5mmo6bc=
X-Received: by 2002:a05:622a:112:b0:517:6162:daf5 with SMTP id d75a77b69052e-51c107273f0mr30701271cf.3.1782820674215;
        Tue, 30 Jun 2026 04:57:54 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:517:6162:daf5 with SMTP id d75a77b69052e-51c107273f0mr30701081cf.3.1782820673689;
        Tue, 30 Jun 2026 04:57:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm112558966b.61.2026.06.30.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:57:52 -0700 (PDT)
Message-ID: <3ae18832-4eea-4f99-91a6-17d250dbf917@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:57:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
 <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
 <5941078e-2376-46a4-b9e2-9686de1ca991@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5941078e-2376-46a4-b9e2-9686de1ca991@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX18i7Pw2zWfFq
 FKRoTN/KldFAWCaPr7+gXq5TRpftNnSRAewptcsU4EQsjwPEvGctYWvpvSeO8wWsnQQfcGo8Y2R
 Dps8abHiRBuuEtsyrOqyaahaDEzYcZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX2wr2Fmy2f0Np
 zfbUNAusD/swakDKqUrcKhENWkuVY5i9qeLY+1w8kfxXIdzgnsyomFnQJiy1GONoBztzAbRlzNU
 yeHxJ2U5BJnmOLOfHkdtHFkBglVE8KFCrF9dc6PRPYMiWFLybsiO9kFUKsM7XqM02GFShYJStdn
 psgbmcZH6bp/FGCs+d16Vj8hVjjnfM8+UFMq+kCa8zaSqsOJAQ9F1vTk/2guONekwKgEL5aU8T1
 /M9jwYXn8Z+3Qa7HqVVnOIJueZXZzfZezRxLGVBwgeso0IMZ+fXh4q2zEh48TSY2Na8RN9+gCuC
 Sq9qiNkZ7VIOruNpCLpTgR2L5ZAgmRm3b9BJzthzG+oyZFjme370vpd4U1umC+egnbvCJ7k2Qv0
 ecsVvq2/AXezIUetQHAWgfI3XP8yxHc70+b+8XTYoXgV/asKRWRGYwNAw9gjaCxQ8LTQYf5TMJt
 lhd5OtFGRrw1Ri7MfIw==
X-Proofpoint-ORIG-GUID: ip27kRnSqlY7uFmGON9deccr2nmqKsWM
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43af42 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YLglQ_YvAg-cOnyBpDUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ip27kRnSqlY7uFmGON9deccr2nmqKsWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115398-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46E2D6E3EA8

On 6/18/26 12:21 PM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 6/15/2026 9:26 PM, Konrad Dybcio wrote:
>> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>>
>>> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
>>> pmm8654au_3) on the Lemans platform.

[...]

>>> +		pmm8654au_0_adc: adc@8000 {
>>> +			compatible = "qcom,spmi-adc5-gen3";
>>> +			reg = <0x8000>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
>>> +			#io-channel-cells = <1>;
>>> +
>>> +			channel@3 {
>>> +				reg = <ADC5_GEN3_DIE_TEMP(0)>;
>>> +				label = "pmm8654au_0_die_temp";
>>
>> Are these labels namespaced, i.e. can the label be just "pm8654au_die_temp"
>> or "die_temp"?
> 
> From what I see, there's no functional issue with updating the label to either
> of the names you suggested. We made it this way at first as we thought it would
> be useful to have the exact PMIC instance name in the label of each channel.
> 
> Do you want any changes in the labels? If yes, which convention do you prefer?

I poked around sysfs - let's stick with the existing ones, since
all we get is this label, without a "nice" way to identify which is
which

Konrad

