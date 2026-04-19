Return-Path: <linux-arm-msm+bounces-103618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA+rOUV65GkQVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 08:46:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E833423437
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 08:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF12D301456A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 06:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2789372B56;
	Sun, 19 Apr 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fS4RfbI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="felgypiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C67014BF97
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776581175; cv=none; b=IKZZamV80zIOj05vdr2vRNGQnOutxS8W9wgzAnWLdwbhA7pu+3v3ql55xKpOnAbMwQW7tO6GxOfgsEyew+mio5DN1MOd97o1TMPKeasL+RD0Igzi4FHLLaW0j/37Lp8OR/0JATIY/p/JnrZ2MOLzZARxVIYo5AWqZsA+h0wvRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776581175; c=relaxed/simple;
	bh=MKhme6VGRdMs8WoQPIQpd9M2Kb8PpwgUu12R0n5gMi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TK6CLbdXP7MBIizuXKH6rpi9tYvfNe822Q899ZhxJ9D4Klnp+XO/P74vX7Syxgc6Za1fcUf4fk8QZdTAuq8GrbIY73bZ5wakHjeaERonVOLIdecqPrjn6kW9aIcltmY0izPm0FIgGmB+ej9CONb8KLiWWtiAVwgvKNUly+iu/xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fS4RfbI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=felgypiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J2pfCr2991617
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 06:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUEaDP0CTk7F4TTEkQxPhlhAjl2H/Y16v//c4Ml/85I=; b=fS4RfbI56eOILrpQ
	tlhGoNrL1QdEMwSQzin0V0fVBv21aqpe9bmWSwLv8cKXMgSApE6o2CvgmVkpDLUu
	Bdr77rUHuOSXY1YIkgUR01yWo7vgZlp0wvUpSleDnt2qiTvHnivJUE98t3bXpte/
	L9b99adzjs9X8AgRHNwm4kVu3J/shEUbleL2YQoafvlLws/I/42T4gizrcTS18Fm
	jaIy8VAMhhoFozGb7w2tsFWsgKJvp5DjmiyC5ssugtGFXQ3JEphWLR+dNUhBRbcm
	ll5QI5XplE0KwscmBIyl5YGad5Xg6CIt+6yY6KwQ27GVyC0gkVp31UzR5poN1Ie9
	y6s2bw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34ha15x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 06:46:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e6ee9444so20311345ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 23:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776581172; x=1777185972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUEaDP0CTk7F4TTEkQxPhlhAjl2H/Y16v//c4Ml/85I=;
        b=felgypiF0ERXEkmwcu50IdiJhWD5FRjNw5o6nBw/46YhLG7oSJt1pcTOCX+QBpmnR5
         gthX1szY+YnpF8Lzub4zrhIoUnlviv/GhUa/LonVR8KPiabpe0Bh2qg8pUpl22CyVFjc
         CIpPFPwvYT4UbAdpp18+LoamVETYdTqk7splBlWf93BHawWXsvYnsSziHVGXxhBJHOFs
         I4x1oqy1N09AzwHkzeTO16jtUFl0Fs64rXNIzKy3B2C1acpxrqtffEBfk29etffkQzb7
         RMqtXpahm5V6XTGV/sUk+M+lr+NURhkUxzQO5I0BlWU29sSeF4yf8f23w/I0eLUuSVo9
         uAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776581172; x=1777185972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUEaDP0CTk7F4TTEkQxPhlhAjl2H/Y16v//c4Ml/85I=;
        b=oMNBu73CIiypFqSVSaH9/YfUJCVQ64wcpab4X6XCVic4SkN496nljrMzaLmZEOv9Hb
         O2B2t1AYDxBd84Z25aszEKuBqlgCOXiY+FLaAx5iS4fCjt5TOefQOa6D7xZZ3DNDrjlu
         6l/Ysu1BX8rvs4lZIQ/qy3GGk7S033r8Zs4IKtnKIm0tqrFeer72hgAVjtsdyfMBnn6S
         v7g9w8FBtFEbeqmjYwRZ3vntCV8C+1gUwq8hZ80Bb6TIYhX5TgwvmiCAxXO3n2THuvbC
         IZfCclS7c8XbwfjqXng6jZ9TZqAY3JfdisdsbXrcs9PrmVOKLTLF97/C9b72s3lr5AWz
         4+YQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xTBEmLzcGr8KA/ayX+HyE0/44xFTMAXsQMa7OfewAwJrybXPFS8U83m/IWjzwr4laZsF9dLTTNjDXp48u@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOB5JqZhGCW6+7y0aefQLguVdMQE00yF0teuie0RwqA1q2Z21
	P09sfw71nfAseYvVcQTTC+q7PMGws81wFKWSoL4gbFf/BUYk3HzChYpCBJQE6JA1hx17YGlHX0C
	DGs0Krvf9w1YS3NXb0sMRPLOAv2PXFwX6mecp0SI7fK2DsiTfMdxsIBLn+pPwr5v8SALt
X-Gm-Gg: AeBDievR+pc+SszWGSkyo5lNdm4CU5AhoYvUNMq6RP+Ya8Cxw5WKifYPbczTt613EDZ
	++XE4eyhlOGIwn+YCWkE8GpWS8+kMW7AFk4voox4QEMPkaJu9soIDEsYC92KIe+MJF2X+k2UpeY
	ZaLWxhlKhh3K/z8DChtkxK3U+DOm6LQUKh2ao+rLB/Pc2gzbMnCOxzp+mqVh+jaO4veqdyODDWU
	y9OmWXFQHdz5hqHWEgLaY9DKved60RiO1V7hUBp2r3ocRY9yqoDE/UH+Pd8yDdyQqhl1TR05q5n
	fJ4KN/dW+1hvBGePjpg6E0Qfy9LTTLzvQv/wgYQGjxp2zed1S8gjcQ0ZXeP8gCMEqMN/uwo4/dC
	Y8wmqUrXBPCfNLK0c6QXjm9UODLUxckasFGgA6TSPlmhd/YdWc7QdHy+9Q0Hx7M8M
X-Received: by 2002:a17:903:166e:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b5f9dbcd22mr86504915ad.2.1776581171605;
        Sat, 18 Apr 2026 23:46:11 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b5f9dbcd22mr86504685ad.2.1776581171128;
        Sat, 18 Apr 2026 23:46:11 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.229.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0dafcsm68959845ad.52.2026.04.18.23.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 23:46:10 -0700 (PDT)
Message-ID: <bee49f32-cf46-4cb5-9d84-0a813b64bd6f@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 12:16:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
 <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e47a34 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=wZmMAJJy4pskoH2Iw57Smg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P-Qu3AS46n603wzIVHIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uWMiPXCEnip4gmX1EpDaV-gFKcDykgjx
X-Proofpoint-ORIG-GUID: uWMiPXCEnip4gmX1EpDaV-gFKcDykgjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDA2NiBTYWx0ZWRfX286FiA8OuSum
 1nmeCwZqlhoXdfAH/d7HgaMw7fKuS4d/cSCYmz1UGG3+lXIGkuQx/vUmQC0r+TXL4FJ+e3WyowW
 UjU293nscaLBvR2K7ao2lK+o27gtLH+GA8Iir/aABLq6GRewagobZQQfJ+knpnIX4flckmkAahW
 +OaNc1jf5atToByRJeSCTpwfWxOQC5EFw0f7jKVhQcnIMWNb/HZYqnHsBHWQxtprf5bxy7tfu/f
 /y2BwITuqr10qwXRTr6aNJ6fkZPFmXOLY0cWAtK86AYYVRgGz3I9cU4X9FdifetKYhtlpO3cZl/
 Wi9EEym5xPeVmtWHFIah3r4nHJZ/uuOKxubUwRoLcN7ebWeBGX32tvcWsTMwjx+nl/2dUFMUeFy
 ycpVqWb+8lE6NndtpSrPLLgBwht+aOZLa4CJt+wvG8Rwp12qFtJxIXsBNDOFDkIxY4SnyAqgsCh
 sJlhpb0lpASf3HLLnzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103618-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E833423437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/18/2026 11:26 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 05:04:48PM +0530, Gaurav Kohli wrote:
>> Purwa IOT boards support a different thermal junction temperature
>> specification compared to the base Purwa platform due to package
>> level differences.
>>
>> Update the passive trip thresholds to 105°C to align with the higher
>> temperature specification.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index ad503beec1d3..261d1e85651d 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> 
> Is it a property of the SKU used in the EVK or a property of the overall
> form factor, cooling, etc.? In the former case it should go to
> purwa-iot-som.dtsi.
>

thanks Dmitry for review.
it is applicable for overall form factor, 2nd one is applicable here.

thanks
Gaurav




