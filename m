Return-Path: <linux-arm-msm+bounces-92649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNyfHbKXjWkt5AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:04:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434112BB11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE4D6302C921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0896F27B359;
	Thu, 12 Feb 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUUVgpnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egpJ56gV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC306221577
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887021; cv=none; b=B2qiI6nJAmeWKJhQKa8/G33cdzBvYnpvNnjMeC++G3ZCUkyiq8k8gk5jIEFVKPcxYmSfwPHmCz1kXEAg6v26NcR1RrTG62ELIxWI5SVrO4AWefqRD0+U/3O/mgt0AfU0M6OdGwA0wmj26AszG9WjBPOT9DeolJGw7bbbwxG5eLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887021; c=relaxed/simple;
	bh=VkZTrjlZGqC0+D6fCVol/C5hmVUHnOPeg9sKhKYXebc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFaVD30vwcmZqfiF1i9wbTI40HERZnDxka93Cy5Y9j7zsP5sjRZhK0lbYvysyMdMs++LZuubT2WKxyJ7M/wYYva40rgvKaitGSZa3Vxf8DIlZ2zefAJr1JJYIlTFTnfp/lQCAAYtFj6XLjpzqsHcXo+gt1os+5kcB95HX/1Dzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUUVgpnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egpJ56gV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RiDp3887834
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB9mMoVzXKveTMP7EAiIbt97bVJpR/rFHiD/WeguGIM=; b=pUUVgpnLap6wIi1u
	6SILcBVfc81o4U1Orem84TIJ4gAocp0nAYvmBAmuLyJny5rT5mxCOqXT89L5q7eV
	q7WU3N7ffdEnoD4EcrePe/vxz+fYeftNdNe63jmLQaZ94ROdUKcBJOFZmFveoUha
	Cro9oNU5zsF3/SG3cCk10/YyAW+j7Hn8A1Pb9d2aMuRuo/IpPzRkwxK4aW7NGcx8
	eALfejUBJ4UNs7bsUoT4sebvseEEaixpjTcPTzGxrvieHa8qx7e7N5IzaHioFQM9
	sA27eXpZYohPWaIZwy2/JttihFE1fkH8+DX0WwdschmR8eNB1DscS5YS4WzxBIk0
	MED8eQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wj9w95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:03:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7177d4ab4so186434585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770887019; x=1771491819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LB9mMoVzXKveTMP7EAiIbt97bVJpR/rFHiD/WeguGIM=;
        b=egpJ56gVnoGl1Dq3vluLiaVRpMpHQrDB9ziQ/KiP5QJdZuP8+oCMMTxyjVVe0pIfVf
         VvPg3KyS6+mNcA3PE7WeHIFUCXR+CYA82cX1jXWft87jFZzd0WFobjbRa+SKB6vtKjUg
         6+IDu+aKfNMKihNupjqzcxqtdzqUnS8pdj06RSgayMdp8qfyc4X22ZSsjt+tgOVPDiWG
         SqDQS8yA+Gpy4lrAAdUH/oa05cCQKis9W6B04fTgM6TWjt/DiW6l6K7WAMw74RiQrFID
         8XVmooTY1CjU4FV13mJ32hP2HXc1Z5xyDUTJMZbC+/XNZA1PSgDDyh0sgClh2WwZsx9+
         Lqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887019; x=1771491819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB9mMoVzXKveTMP7EAiIbt97bVJpR/rFHiD/WeguGIM=;
        b=o+FNAS7zRUwiq5hTYwQtnvlEHYTHQS8ryuLvs0NLnbyqsI0J1keQV28c8RPmqv88IT
         KfkcuRJbhQ0he3S4OPE1I9hQzoJnYFieVBrEnnN/mDVvO7eB4Gw7FqK1yU6tYuoEOfDc
         T4a+m1ZZ6kSNpnmRv5xudTwGGI4lEVrdqk4xxQO/P3Cn1SeFgE6CHYP/+KUZg9B9gGns
         n7qyW4joDj/cJeXjLnSMmkOS1E116rDYbJJsGzjtcVWPinlPSbEBNgcU4rBcrtXKanar
         BYYq2sBPechMvDYAzGTrK0HzYnt6eXYEkr6Zgo131xUNAl5tn1jwYs2UWWISpu4vh0xe
         zHXw==
X-Forwarded-Encrypted: i=1; AJvYcCWP7RF2jJq+W8du36+5W0eY1TfWMDHLDPEEZspsGZmEvSLeKLYiYYJ/qhy4lEB7yC6hT7CT7nqwoBchvnqt@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKuu9bZaPB7f3L4unUKfvN/Ojr0rxM2RuRk3COdKNN6F5xoYv
	vPeeBAEQacbzJcb+5iE4W+Ec4Y2dytmx6m0oaiG8AJhEl/qAJck2G/PDxjpiBBepMkHgnWend6r
	Xw7cqLM+iJA1LStgXJaLsqvaZzBvbQ6uUFrhpi1jOEx+s86rXlAqMvP+TS5TSEXDjzb7R9rd2rj
	mA
X-Gm-Gg: AZuq6aIX5bjc0Gp/go9gKcYJ5BcSJ5uZzv4itJnMUxS/aGnWXLbNKgbdyppPm8vvhB6
	9cGRHqFIT9FqMDVGARwvVQox5/zUMnGeqmD1TvY6BsqufiAce3wunUk090FvYEXV31nXSz/Vz7P
	xTqpqyXTnRQf6I7viC/ZOyTj/zg4YxUk6xN+nLtdhnsGswnnI3OsNWSbuz4lHN0YxvhnTbqqnA2
	o2uw3fRHG+99vPNq6KO/7xAPNvv9BaPMmlzX6+q5sSVlq7GQDRbxwvl86uHuvGl4gCMWFkxJVSG
	rmbBbTVLADSu+f/N+bObMuNvaBzk3dZJaTV0xLrw9ktZlU/cOUDT8ed7LjwYmxsMH7QhotVLsAg
	zouH8ZHmH9DH4U/eNEqYTpeC8XZYIZvYc2EQ1sypQnEluH/UY1CZ8EG9fftuld3B0RvWBzRfoqw
	2dUgk=
X-Received: by 2002:a05:620a:191c:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb3311c213mr203995585a.6.1770887018959;
        Thu, 12 Feb 2026 01:03:38 -0800 (PST)
X-Received: by 2002:a05:620a:191c:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb3311c213mr203993685a.6.1770887018538;
        Thu, 12 Feb 2026 01:03:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf4ccd0sm1526530a12.27.2026.02.12.01.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:03:35 -0800 (PST)
Message-ID: <0d707127-4f86-4e53-ac6f-a5c85c531e08@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:03:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698d976c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mYmVozO8WKkDhUnJKfgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfX0RFeP7KjPC8r
 81g0TL0m7r4Z00fgpdSgfNUknT+G1DBVi/hHzgohQB5orhKcCkV73FM2d5NzSgNNpYkkXvUPBRA
 nwWxRyXaHpvmVs80/8lNDaVmudHsf7WnGLqUvL181Zgl+BGwosiNuPvTDayzxMeoPYAKwNVg5tA
 tCWMYsf9+SSjfbRtDAf7Zq8+bsiha3u0l+UElK5Ij4+rFsVpDJ7geqBVwkwVfSrtZfyBOOkznte
 Ocf702ah0nQfKOaDkeSOQkST8TbhpsjKxfCv6m6T4Eyr8M6aXH7vFDlGzKrByvNzP2aCzFC/vlg
 WpOKMe3C3FLKauuEJy9g6sLinBSV6pF9mu3g/aQUO8RGcdnjJqr7cDgnUf8VxYV+Ad3XBiZFfvq
 C7GftqZKEr6BQEcTbiawUrSNEHtHFXzE6T63cu+64JOjHXDIiDwUBQfZkmsCTWbuScQ90AlLvLQ
 j11U6FWX/eT2SebIopw==
X-Proofpoint-ORIG-GUID: s9uVNH4VKIgzpD3dUt3YRkxjmDfQd2Pj
X-Proofpoint-GUID: s9uVNH4VKIgzpD3dUt3YRkxjmDfQd2Pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92649-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0434112BB11
X-Rspamd-Action: no action

On 2/11/26 6:18 AM, Akash Kumar wrote:
> Enable the secondary USB controller (USB2) and its High-Speed PHY to
> support OTG functionality via a Micro-USB connector.
> 
> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
> compatible to handle ID and VBUS detection. Link this connector to the
> DWC3 controller via OF graph ports to satisfy schema requirements and
> enable role switching.
> 
> Specific hardware configuration:
> - ID pin: TLMM 61
> - VBUS detection: PM7325 GPIO 9
> - VBUS supply: Fixed regulator controlled by TLMM 63
> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>   supply VBUS to the connector.
> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>   detection.
> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>   VDDA 1.8V, VDDA 3.3V).
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
> v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

