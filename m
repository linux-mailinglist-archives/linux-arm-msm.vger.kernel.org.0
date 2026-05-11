Return-Path: <linux-arm-msm+bounces-106912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I020L/DCAWpwjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:52:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E75E50D130
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30E1A30329A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2FB377EA2;
	Mon, 11 May 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjGecIuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ6LplzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6C37649A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499983; cv=none; b=Rb7CAls2GaDp82xOK++q0wqY0AQVVby6dzjbfK0vEL+XYNTeaS8TBJcZ84T6PX0ZgKkqcrweu5p4fPW/RZt6YWLZZ3XzJv/HUJu9VXAU9LqFdEb5XErVPRRe9yKtbeaXC0EFG9EnoNV28fh8rcOXzc1JEEi92c1K6sUrsX66EIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499983; c=relaxed/simple;
	bh=noclX/RymRW2NkxukjcocB9/8FFYFplVWyQzzJOzt1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fN5CNyJWp+3YpyVuOM65VyZevM21t60XZgqkuSp4CEQSXLcKuyG45vgNhPg/U8Tl3UcaddOwgHNpLqUGDMQUqO50rpM/0aMit71XmgS5HGGGmqCegFtyv0gh7Lp5rmMa6QZypzAGirdY/iaXcWhr+LfOUNqVgECUYtPW4RzNSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjGecIuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ6LplzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FSwV3333473
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XQLblkDWAWxW/czf9my+DUwdl3Nm8gQabtsWaYe3ZA=; b=QjGecIujEqxvh13V
	7uYpTKxcWv5Okyh65JE3wnjewqEaWohzf6zq+8aZcHlwnvjuiOyJsd84cNBYd20/
	iBIQ4Sg+rlj3Unmvl1bP0fJ6HencNR+aRlW8N2BsbHsMXuPDFOSt43NgQRKT3DBt
	kTv17shPaGoPR7mShiC6bRJRGNeJDuIUv02LNAm1CxPkHwMfFbq0ApcjTf/w8Eoe
	lNKM43QVOIGHYsDi8LBwJ5Jyy8RvMBoaLnfeMTNMMXhbCN1G2BaWJ9Ay0pyj5G94
	T8cajFjMqFinu7M/joWDqXIlK2AqZTHCBX9ehBh5mg/d73QNt/7+b0dMbyY1PKIQ
	GvqHJA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgryta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:46:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751eff95d6so263286e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778499978; x=1779104778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XQLblkDWAWxW/czf9my+DUwdl3Nm8gQabtsWaYe3ZA=;
        b=UZ6LplzX9mRVZNemrQ/9ZguqrjQ3sRGYW+DYQpecUC+SCoAiRbZK2GLHTTqBKGc03P
         RCTLZ/i5YzwB/VsXsIrDNMWlFff5fWdSwD2eMLFCC4Mgv6ngIXfNMSnmId/Ceu7YvSMz
         zTkl232irHfhq3Ft9yyXXo7jPZ85wm4Hk3jLsoLRJ8P680mlDJDpVLOrsrRaNFbuxKb5
         CEnw4jaFlAqwoYIqKJNgRPL+svQi4B3SWga1jLpsQt1PvMZG1MDm6RIozzWfn8zZFl2/
         KBDfa+b+qTgo/JEtbH+hxdhAXVjaxZomGhYZsH7Y9fJEASqJzKOcT5xUz9CB6/01nZbf
         /GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499978; x=1779104778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XQLblkDWAWxW/czf9my+DUwdl3Nm8gQabtsWaYe3ZA=;
        b=sM75Zk0JoSjxbCIPpLwIQjiYd88gvc04N3mGcsIeZ+hQYvNtsDXQfNAGts4Stz9iJf
         9BKLP+lTbypB+C2Cm/RFzJm72iDwbS/VXvJaJt3cnNKzQ46M4XHYmJjAd9GeOPzV3tZ6
         jGvxe8kpOgcsNhicIZjMUJ2nkNS0e/XsADNfP2VaPv14hOxtG3hpJupBvVjs+TdhZ78n
         G9Nk1F3dFkqLpqogZ8XnKQbLkjcAZi+M47zFh0ZWtKZhlZF2Byxj6XQ4m9mQ5yZmvGHf
         LSbif/yXZN8dmy0Vvt6Brl3Qtj3cA9rhSf7NYGk2x7WEuue+OFkSnXqc4wwhRvTXjQ97
         63pA==
X-Forwarded-Encrypted: i=1; AFNElJ/MFudJtKakgFBV+qgzOCXP/pVyNIb/IjojNsQVhptExMPnvucuexcWf956oVmTXidCuLwwSmvWjzXo2Mab@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dpYGcdV934tcmW4gDkznmxNX+6PAigCjsOvHaAb5RClfUvBi
	GwFrMZeKq/iXpMn1fbaYU0QBntizhKCjAVzfbxXQx14ADDbh1oXmEcaWtpMsgWr7fbhB0K92t02
	HvTzXmyp/Kc8R5KWp/B6TK3GjbX9aYTKCETswmy3kJWrWYniWlKgovjhhy6yiI4OQwYnw
X-Gm-Gg: Acq92OGA8H2+eVlYG/j6I4xmIdn6F0CguRh3X6zwXlJoydRG6iB/by3+OnohJKAAlp/
	b8c9+pBrbuscIcIB4zMCAmM+1ydX+t4DipLE8CtqteCUE6OGK6SK+GeqxLKUY9p7KZaJoT45d1g
	P/wqmg1Cau03EB6zsitzqMk3Cor4hl04RjveCQ5QvpN4F8q5Nf6gEROwBgu1vbTY/HpwfyU4CQ/
	1XhjoJ+Gxjiy3dC+vOXPrzpvcHEjYeF5aS2/siY8NZvVqYZzOVVJ0OOGQ+ree6KH242nWrP+ydx
	eGXecSYLZRjJn382T0mHiQWjd/qG5JWJYdjDrr9hfag5HSJRbfX4UxX0NcJm3E7Fj7h1kBK3iVb
	nSnw29R/oasE1cDAUkXhXZXZieC0Q1ffFA8hI9/AYZGgvDXqRjtcl7zPzaDchopvEkQyVutDs7W
	KH9CY=
X-Received: by 2002:ac5:cd48:0:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-5755b4af80emr3913507e0c.3.1778499978121;
        Mon, 11 May 2026 04:46:18 -0700 (PDT)
X-Received: by 2002:ac5:cd48:0:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-5755b4af80emr3913486e0c.3.1778499977719;
        Mon, 11 May 2026 04:46:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd026b13c3esm125481566b.27.2026.05.11.04.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:46:17 -0700 (PDT)
Message-ID: <80632a9e-1d78-4805-bc36-19616ec1e185@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:46:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: milos-fairphone-fp6: add supply
 for Hall Effect sensor
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
 <20260508-gpiokeys-vdd-supply-v1-4-0bb32e8e6428@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-4-0bb32e8e6428@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01c18a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=OHetYUf0uXX_Db3cnu4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: eSnoCKhC5kAh-pjVQmAnsrXCv2uOiR85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzMCBTYWx0ZWRfX6hcTdhfhvXtQ
 9Q4tAqmn8fXzYiZgSNw5f0KSEBbgIvFdt7j6RiuM7rVVH8ODKRWt8oDql1zHQbi8A6sqUugIIZG
 1BK+7Fzbg+sxDLniEXzclIImaWLcSgYzesRTB3xd9HS7gJv6Yr/BU2QGWa0bZlHgLh1TzdyT7du
 kL2qJq0f3KuTd6K3UKycv66jxY5H+lOnZUsg/+hIzr/Bn3UrcvQ7KpKLGqBXjIWSCr3GYGmc58I
 K814Psy3nQcGTyXg8kue/n4VRTil6mz5DqCvtuhboxgsqAJXZBuAQOLOhrstSwqbJKoDaxn5ABh
 6Xc7l8mU1qjcqhKS8FLdpz+BDVZHYl6ZRwKKV3aQf39eSYLa68bg+guucd16GDKLvrRvebd2KEu
 qNxrbTBAKEpGeixeRdEp3pMG2gGZrC5dXeewwTn3ZpMW0R84jmXvtncRHgu6p+Vrykpz9nVzEeg
 DPjwnjpXW8XDN7KMraA==
X-Proofpoint-ORIG-GUID: eSnoCKhC5kAh-pjVQmAnsrXCv2uOiR85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110130
X-Rspamd-Queue-Id: 1E75E50D130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 2:53 PM, Griffin Kroah-Hartman wrote:
> Add vdd-supply for the Hall Effect sensor in gpio-keys so that power for
> the sensor will be enabled when it's in use.
> 
> With this, we can drop the regulator-always-on for vreg_l10b.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Modulo whatever the supply name ends up being:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for shaving this yak!

Konrad

