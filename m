Return-Path: <linux-arm-msm+bounces-82062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32477C62E28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4DE33B0D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDFD317709;
	Mon, 17 Nov 2025 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHv2Tr/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VN7JzEue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022930EF68
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368015; cv=none; b=bDdg5RsmhjlkqFytp0wVTFGSdHE9UBXjIyXpO/OdfPluVJ/tPuv0APbzhwpclSWHPwqxuEqK+e61S/9vtUZPVpP2unTqBhBxZFPgC0Yh84cdeYtuNhfghtUH+RwMlmVx5KHn+sl7815D1wffcWr3J0qAEKRhrlVibio3bTd09Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368015; c=relaxed/simple;
	bh=e0u67h8c6X5Oufcm+F6KES5Q9Ho5t4kXs9hus9cYsMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPjeguTVVtnCvIKHRXcmZj3lfmlpikFFKCMe0WVVNqXa1G7GyOK7FjKn0yCFJWJv75wwNORG0UmuaDDusQ+FRau8ETuDCxVphfYErlLA8uEOAuttpdt0OjGmoQQroK/qGOC7FizEksivBTAXD4anHBuTUwH3ENFdV/2zJ/HL6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHv2Tr/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VN7JzEue; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4ndxJ2582066
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqY/mTbwRbbtUtoeLVGkT10SH32hcso7gcIJc0Xa8IM=; b=jHv2Tr/PnrHJGNXk
	OmzN+QIqTJCCbFnlawgb16rv8+vy90SH5IEOHH4CriTCl6ZNbeauw4bUbi5Af61I
	/FgTNm10vAkGk//Om/gHlkGeDoY2WwkPb59J4K26kN4Yz9uvgI6OeO8ELATiHOKS
	9HINnpiDits2RX6Dox5xw2gLFBv4SRLV6hwS+VojtK30uf1xXDb41NQREwWFdEci
	huwiVyT5IsveNHdn1OktZ3iHfNTv90tVTPiHtLLiXitNx+CRqXm+ueQyAfSb+xF1
	FsVP8F+cos2FfLWdU0DZicno2WJwwP8irN2gir4lqpcYnJUgETcbpjVF7cWv0o0n
	qRuv4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssf8yu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:26:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so3257490b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 00:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763368012; x=1763972812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqY/mTbwRbbtUtoeLVGkT10SH32hcso7gcIJc0Xa8IM=;
        b=VN7JzEueUii8hCPM8OyGlHmlbUUu1Qz6yaf464IiDNZWMC6B1R0coSSBvUO/kMrBlK
         s4d0K8RpB5XhfTgqaCY2cdgRsDwXMcFYWtg27YEC92NZOTJuIU+JC4BX/KA3UBYWlEAN
         OPy7fBe6CNI5yzpepkpMJQ5aq8j4xIvtFqBvLYNbBBmGpf7Wy2tyOp5U0ZIhMIIQ9Yfh
         vriadRrJ4/LXpmbOFmDRGJiwP1eXFUg0nb/zNxVhj1hZlJvbzIhjjKGujtkCgqp1m9ku
         jK3XRGh/ARNghysE3flyNHIpVwMI54ehFV2KxdEtoieOJ+dZoAneXhT3plk9oow1jEFD
         l97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763368012; x=1763972812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqY/mTbwRbbtUtoeLVGkT10SH32hcso7gcIJc0Xa8IM=;
        b=Ezrh7JCaLL71nbXCOwR/+hh4bgr12Zr0VNWWIlCCKn4Bu4rXx5wTKR5QXYKErfMe+w
         gX6/fVOM31+gonH8pWtfBmGqPOSMDCjFJjYYgKmKAJXFAE78sBXUiUGaPY7ZMU9OX2kf
         81T72oepzB7rDDysyeqDbROH1CDuc/v2FQ2ez7ThAiZxPOD99M7sBNJEjc2SjYgJGFe8
         TtMTHGdng+Gb9t+UTjsdDve73Fp7MyIvslPP0wLdMJ22f8CIrTr/PUr6mQvbImCTgwF4
         YT9Cl7Yei1PgdQAAvuRYGZy+sfMqeEYhxq32yhe0EKONI14p1GduUYPqBDJeLoTj6RMT
         sfAg==
X-Gm-Message-State: AOJu0YwJ/KDyLX4PQn8aUwCnr24l8NVenCsKIUsgEq2G3M+N+ZDnzoA7
	3cXntqmsF4pADTP5Am+yLvOWWJG49DmsagQwQGcsKlQnXpTOG2PoMKCbEmaCWrVZe4Y+KgXjBVn
	sDgWVvgc6gYI/amvmHrZgFi6Nr834HF1nLoDCjsQdtNmacJiZDUYPZnotQbn18Cc8y3ST
X-Gm-Gg: ASbGnctG1X+djsG6OnDttDZrE0fc84eEjHBS4wRQi/uf1+8J3fZnuzpx50+/Dj52JJl
	r+qb/V3U/z7oi39hpOece5hU5GyBi9OoLeka4lMffEOyZo6f624a/Ka8M5Tpfnbe0RAiNRxB6WT
	+WhAcSEp7Eq3cOcdPqEDDAewhfDPwscPTdKZwZzApA214wEHT3Wxx/uOfNhgBXtDfbCNVmyo+Jw
	zKi+EincCupPwRhN88WBi0Vqug9PKvF4HFPS44TOcqtg72q1F1S82WTZiBAnoV6PuYeo1dgDyCD
	Jv82z58JE56XxJ86y/Z5q0ote5rzZU26ewxqay12F6a/Y+auPW4SKoGoGN+hBzRNi6mOnQ+F0Vu
	iC+okwtjiN80wKYVGuqwfJ7SHVcs=
X-Received: by 2002:a05:6a00:3cc8:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ba39b79f58mr12947155b3a.4.1763368012127;
        Mon, 17 Nov 2025 00:26:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEpTUvvlvQ/gY1LvJSEYh8KPw1Xo9CAyCAYMvNk0llGfT+RuLXrP+uy5JL8RGjP++Xd4cfEw==
X-Received: by 2002:a05:6a00:3cc8:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ba39b79f58mr12947127b3a.4.1763368011662;
        Mon, 17 Nov 2025 00:26:51 -0800 (PST)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be37fbsm12515549b3a.1.2025.11.17.00.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:26:51 -0800 (PST)
Message-ID: <5029600e-a3b8-4aec-a374-526fb3f6417e@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:56:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <9e8b47d8-9a20-40da-a6eb-cdd167c108dd@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <9e8b47d8-9a20-40da-a6eb-cdd167c108dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 46d4LUybB-SXsDalHGz5_0KdJP7Y3jiq
X-Proofpoint-GUID: 46d4LUybB-SXsDalHGz5_0KdJP7Y3jiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3MCBTYWx0ZWRfXw43vucKOqGUi
 JnFvNpBpc/KBVh4fTKdFFYpjdSAFW4GzN0DtbdUmj2n2t8J9Cs59AZTBUwu9tfPTjfcw78iVFzX
 sc+fuGgjwSfDswJLtSj5/ZNR+6A/JL8jdR1EzCcxYWtmYdvNgCxNUiQB5UXYVGXfw+Ahss0fOAE
 7r1lcUJ6OmhoK4oapM9UXXGFX5yR4tchAeZefZPJWw9VqUXKUoYktFvoSZrXB11q8uGkX0Sg/4H
 oIspfttl227FjzlAX+ITzYhe3YVJT0/lB4FsS176jjUsRDksP060DY/SjpOwFPtlU7SCjugU+Fj
 Gw55giDCSb45wORNf7xJ0Vd7YTH6ZLPtliTCmgM/MyqzBcKP/3LPyi6DQ0HGIb4OT8huaDqfLvX
 OjBV04NzhvNMISh56ZWB7Rx5XaG9qw==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691adc4c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6vPrc6N6B8lL3SuiZ9oA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170070



On 11/12/2025 4:56 PM, Konrad Dybcio wrote:
> On 10/21/25 11:08 PM, Kamal Wadhwa wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> All rpmh_*() APIs so far have supported placing votes for various
>> resource settings but the H/W also have option to read resource
>> settings.
>>
>> This change adds a new rpmh_read() API to allow clients
>> to read back resource setting from H/W. This will be useful for
>> clients like regulators, which currently don't have a way to know
>> the settings applied during bootloader stage.
>>
>> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
>> +{
>> +	DECLARE_COMPLETION_ONSTACK(compl);
>> +	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
>> +	int ret;
>> +
>> +	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
> 
> Is there a reason for making this ACTIVE_ONLY?

Yes, using ACTIVE_ONLY makes the read request place immediately to read back the current resource setting.
Sleep/Wake are H/W based trigger and are not applicable for this API.

Thanks,
Maulik

