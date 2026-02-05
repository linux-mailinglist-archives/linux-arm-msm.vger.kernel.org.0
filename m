Return-Path: <linux-arm-msm+bounces-91867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCBKDklbhGl92gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:56:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D533FF0200
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D933064025
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEA936C5B7;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYb72xJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUTR59fN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343736165B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281531; cv=none; b=mqf+l+iTBGK97uu+KVrfiEzKmGoGM8j9Ossqg+OZiBm/JKTmRg8XJ5btYIi9mdM6H+hTqZfoJzNmde4mDSgGj55ncGN7AvCbRoLbOUXo8ALAVGYYZH1Su6Np4aVY5G+pQoC6tZK/1xCDo39KYk+jr8pD1ZJPyIHFWWIlreAE6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281531; c=relaxed/simple;
	bh=MzHUBTrOm0xOLs4Wt2aeY5+7WG3Iv2ljfhgZcIajsfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZp9meXpk8Kpz2wDqYszz+YnbNAl73cvCY2SItNzujO5SIqUpDSS/DEcV+wA1NAAbB8QMK+UIgyJWWLhGr1SYv6aNyWn8FyTQ5zU01QKcAFvkQl0KE10wUVy1Id2NPUjmvhKoQhiKB28+wyArIe1087XTmWx/RHM4gMH8uZbnYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYb72xJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUTR59fN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155qMkt4166394
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxmtMQ/Xer1Woebrd8VxVxAvYRAf+XtB2W/IHEnNBPk=; b=WYb72xJNrkRI+r+z
	whXNNR37N31FJ86dsLUCNIfrFupGY03qKoREtYoHiJ+le/6xrzvjsxb3MErqDnaW
	T52ZuTtHCHo7tvLLhAcS6cMDi/sYoUhji4bfTy8PlyPy7pz65DTi5jJYCfk6u3ff
	bSn3iCV+nwfgNBDuej+n35MAUaPh5+B4xxJU962Wq+O9lvDXBVAVB4uQwnjPoGnA
	gMw7V9AgJZH7+mqP2EkR6clUn+VfdUrdsgbqVhx8aPxX7WhURH5lcECYBHsVo59b
	2ugUgYoIf3oxxO3GNj+efgRvPBAROZUiRfkZQjdFkqBXDZmyizsdNCBMUeqT2myv
	BNgykg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8h9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:52:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890072346c2so2291396d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281529; x=1770886329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxmtMQ/Xer1Woebrd8VxVxAvYRAf+XtB2W/IHEnNBPk=;
        b=gUTR59fNLuzvZuLSM/Uhjg33fyux1BW1/W36mQMsDdtz5//v+uu5Q/YR7SXwb5ZaKf
         2SJ2Wr0wnXmBeEWiQOBe/GRdECzH6Fu0KcQacaRcpDPqc87SIwsEx//1abpWIu4xPa3t
         fEe96R+CrVDksPnyzMtsCabyFf55Ol8fUR+o1V+VH0VoPr9+a/ESHXS60ExDthc+dPDj
         /yB4891VskhZ4z4zlao+mmnWEPasS1kbNq9QEMEhYiEBSGgK+pgIo1HAoEt5x7IDAFvW
         BfK7O6RuKMjXew9pymyx/0doRVCuBx5/l9MDORLksJ7wR/b460zp0RuPhKmuR3cYqLUM
         IzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281529; x=1770886329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxmtMQ/Xer1Woebrd8VxVxAvYRAf+XtB2W/IHEnNBPk=;
        b=CwzXoKTNLd4SlESkdIjdFS7X4x6Qv0Mu7TofppbKwwWpKa8Kp1TdrNNxpuWXL4/J1U
         yWuN4JXU5S6AMTPUFqpVAAvpPS7xSpt7FHv98wlMMkzfo4RCsphXWzxlhDo4cY7wqHbI
         GurhUk92clqeeSUlFKzxq9x82TgLFc6lQzMAjseaz9EtHIhngVCOVaGxabz5CyU26jV9
         TFGIIv80KYYPR2ZBKITdCyW5BzlxioCDdvjtSA9JRNso6ZsJpgC7E5JT69J+eTW91VvR
         WOvtu7wBRrgHLPT+NkLUSPvOqZI0gjVRLIgNZCg4N1ZigPSxkXtbtB1lxfvaMMyqU6WB
         B/BA==
X-Forwarded-Encrypted: i=1; AJvYcCUHMXJixnN0GZN/xZY04FFblM25CEuarCbR8Z9ML+oFi6PEL3TJORUBI8SF8FpJhXqcqgsaRqTUYnDTXDBv@vger.kernel.org
X-Gm-Message-State: AOJu0YxOsQbX6my7f0CZoFVmUEd/+IZJjVZd3RTVtBqrwum6PVwfhBvo
	B/dncg5vc6krFosZrXbCm7ROhg86QGwkmxRCGH8YvogYpitXjUrKnHR/0WiKfz6duYs65Fvl7eE
	JFnLb4a96ezuFqGz5kKESR65rcsN/a+3qYtOvxcwUkpwhXpxIiDZ3NOga4NZRclIMH1Sn
X-Gm-Gg: AZuq6aI/LSt7n4Bg99tZRlBRxlGG7mon1k0xiMV8FwKZF+d5jYcQKVE9lnYcQfwME3/
	b6ouChgZ7BoA2FuBXTZgsB3avtI7VxVqBfn9eJuD+5PkCzrZinvk+cGHNPruRNMEsJkSmhENUtr
	QRQJBMX46U1USNJAj2eWHCCXdAflEQAOggOHisUUUbUZy3JvGtdf32mrSxYJa2kZQWMDz9vm7ee
	ArpXFGsNIqziqFZu+BtFEfHAyf5z+LvaENpl018lfcq4JlZILx17ODrd4a9DOGEZC62BLbMMLyU
	HTIsvN9qyhEDfzfKX4yzdK8BK1lNOpyIVfs2L7PGdLyngL/3n9mfg5w81lRNr5DfGSuUpUv2hui
	A0Egm7dpiaZT5Ieo29/BCKDUj0OmXpO8FWu+NEMBh4OViEiEH5IJy7ExKclwnNleS9bU=
X-Received: by 2002:a05:620a:31a7:b0:8c5:33bf:524c with SMTP id af79cd13be357-8ca2f9bac66mr577880685a.6.1770281529440;
        Thu, 05 Feb 2026 00:52:09 -0800 (PST)
X-Received: by 2002:a05:620a:31a7:b0:8c5:33bf:524c with SMTP id af79cd13be357-8ca2f9bac66mr577879085a.6.1770281529024;
        Thu, 05 Feb 2026 00:52:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef001csm206756966b.44.2026.02.05.00.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:52:08 -0800 (PST)
Message-ID: <eefc4df5-78dc-4dbf-89f5-c255d3ae41a3@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 09:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1
 IoT
To: Roger Shimizu <rosh@debian.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com>
 <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <CAEQ9gEkH8mJu+kwghbFFwNi9RfbQ6CzykoYVJqa6YAL-74SaKQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEQ9gEkH8mJu+kwghbFFwNi9RfbQ6CzykoYVJqa6YAL-74SaKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfX+1VgQG/Apujb
 vgMfBFui+RLcH2YkaCQEbfX+Ln92QI/MysMO4kwfM0CmcPjvjU1mMFXy4RmQu2JE7FDJ0J5yvUB
 FRjpmt5089h0Gg+e4n+6obcFq1NcoMzo+ciDjuvPZQUYEYZA6s7luKkDB84te7HkQYVzVNydujp
 pAlNgQxs1xGMA7XV1wbOOUnHv2bfYHWfEP4D1wUZzTSDlspfvSBribWeg7FPEPh+nbNtGZc8pOs
 iouYUPQqIoRVHMUlfWlqhaMYK9IDJu3aD/1eVm8He/pzYpsNsXKQ7YWRYyBtGGQeb9VWwJSa4l6
 8b+jV4ua+Tr4KvocJRSVa9cIiQmo+GLxliL0b+QgbDhIJeRwUHLDr3XoFqnUXQgZVsJV1Zk/cdZ
 6BX8Rf5Ow9chsakhiHQed0Meg61ZwikGDRhORcOnJKrwcBljSU68P0wTgqG8ZQR0lrdn7AERDpL
 rmtS9Aj7VvVTG5Scl3w==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=69845a39 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xNf9USuDAAAA:8
 a=iwPp0qcm3xoi09PGkWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Q2LnWdD0PvmDi0bGwJp7dk1T2tBSMLgZ
X-Proofpoint-GUID: Q2LnWdD0PvmDi0bGwJp7dk1T2tBSMLgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91867-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D533FF0200
X-Rspamd-Action: no action

On 2/5/26 1:04 AM, Roger Shimizu wrote:
> Thanks Konrad for the review!
> 
> On Wed, Feb 4, 2026 at 1:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 1/31/26 11:31 AM, Roger Shimizu wrote:
>>> Thundercomm AI MiniPC G1 IoT is single board computer with
>>> AI capability based on Qualcomm QCS6490 platform.
>>>
>>> This device tree is confirmed to work as below:
>>> - GPU
>>> - HDMI output port
>>> - PCIe M.2 port (for external Wi-Fi or 5G connectivity)
>>> - UART / serial console port
>>> - UFS
>>> - USB Type-C port, with Display Port
>>>
>>> Signed-off-by: Roger Shimizu <rosh@debian.org>
>>> ---

[...]

>>> +             vreg_s1b_1p872: smps1 {
>>> +                     regulator-name = "vreg_s1b_1p872";
>>> +                     regulator-min-microvolt = <1840000>;
>>> +                     regulator-max-microvolt = <2040000>;
>>
>> Have you cross-checked the regulator settings against the original
>> vendor-provided sw?
> 
> No. Those are from RB3 Gen2. So far there's no issue.
> If there's an issue, we can fix it later.

The issue may be that once you enable one of these regulators, you'll
see magic smoke.. please cross-check it

>> [...]
>>
>>> +&pon_pwrkey {
>>> +     status = "okay";
>>> +};
>>
>> This one is already enabled
> 
> May I know where it's enabled?
> From my search, pon_pwrkey is defined in:
> arch/arm64/boot/dts/qcom/pmk8350.dtsi, which is disabled.

Right, I must have misread.

Konrad

