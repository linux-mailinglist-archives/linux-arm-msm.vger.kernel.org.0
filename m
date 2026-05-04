Return-Path: <linux-arm-msm+bounces-105693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MvGNil0+Gk9vgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:25:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 760F04BBAFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EEB7300611C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ACC1519B4;
	Mon,  4 May 2026 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppJ8KDuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aK/mu13q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E8329373
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890342; cv=none; b=ABtzXQrQNa/Syf2eQxj5bzXjOhVw5NkVlKkQQy984okSXPsVFVcBtP0sa2mrAulwp5rKDHy6glloqL+RZmLqUKa+Fi+ptde0d07cN/wpxDHVYJNhodhexFdIIB6FT6EQ50yKz8VTYDH5TMvr1NwRFm13x04rfOVmU76SbvXgWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890342; c=relaxed/simple;
	bh=y49o7DeojfuLSBezhwQtjispmHZyMLjjIdGNlAYxTHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4RFxurJAnT/Fko5A8yjtc0EYugwiMN84C5XKcYt/O0lExk9XYabqcKYJLfdDayLGOgjs8M4uzIZb/w/XOHZau/oNVKbX1m0eeezQ3GwXzH8OMxe8FyB0VjGh5KatjXDMAASQdOK8hCAtl/IjT4d+Vtd+rxlNj0fZrEezDEwc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppJ8KDuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aK/mu13q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fNFg3894052
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLTCHUInosdJqg1JmnAJTJ+SACGyARICDEI0odRneMU=; b=ppJ8KDuUEpYqKquV
	s8TScIC9Mgu1E9gbTwGBBwEYwgRY1HfMsfOsbx05uAExHgaLcKcp3041MNR59DMR
	zIf2kPDbbOrDbujCqMiH6H5zKcSVy7OjVZiPc+mnZF/6UHWIpVWgxTaqgzbVW2l6
	DcIqjxqldgHVsxjVf+BlOCXl5G5ve9M2iKofikfTAqPXwFzjkKlVoILHyWQZU2eo
	XuhGbJxd0YK+71rAOE+KfKMiCjVGykTR3af4ZVuzMZVQ8ck1Jz8/co1kEWUafmXP
	XaqxepAYOvlxoFRhYjDkSspOWv10yRax5F+bNgtwtIRfKDagNztgNYAkWeNvMQ+o
	bX2FPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdhpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:25:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50de6db1eabso10664971cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777890339; x=1778495139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLTCHUInosdJqg1JmnAJTJ+SACGyARICDEI0odRneMU=;
        b=aK/mu13qwNUzQRzE/CkECZDn8vPn24ulqyMbGvmLumHnsiqGHuetZb68thRSUrNEMq
         xqbjUO+2XaGQ+5gx/4jQxJxj2KC/r9/O5E9/uF8qMbofxlp02jw0duhly58+NyT35U5E
         mG6/IbnAZ2yaKGA7P8evSt3b10I3yHRnqkMzfE9NKVAIWl+oEBLMf4vP8NFzoaGmn3OO
         pBbfdTeeL/vpY3UtloyILMlmM8ecRYe8wVXfCrzoNGQAXEH+yI4R7NkTviwjP0jS7ndE
         OUzLvBZ45wIEho4aRxgxPtJWuJvFiFpf8cppPD1pUYrHUVcYHyV/On1W8Pp5NYfvrQnz
         0OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890339; x=1778495139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLTCHUInosdJqg1JmnAJTJ+SACGyARICDEI0odRneMU=;
        b=LUsETUxfNNle6XcOApotgPA4rR9eaS0m7PIMih0VnFyVhfI1skhipZOa4KoTPUE7ru
         Eo97V+BGHJaKH66EZiFATe5ScFx+MtKL+VC3mxSRku9WLDQjd614rgWdLOuK8DaHrQmy
         Ac6bJJpf+HZhMJ4/PASVdMVV0G06h0sPjyhPfMqSAA/3+36KuLaafKtLynJdS2vZ0cjz
         vrBwIvyjHtbjMZVLxvvjVU+Qb6NJC6pBOB3oBgX0LN8x3AxBUlbvPFBRuoRZbQ3Dhhwg
         NFKYt/E7jmX/DJQv+lv17/dPfbia0QA1FjnD5Hpba2ETHKtPV/rJvoft65voZjmsrsDH
         N2jg==
X-Forwarded-Encrypted: i=1; AFNElJ8m5lJ1ZxVULpSBJGU3G7Ny5sB+IuDpO1KKMBCR5eY2n1e92HPY9vV/R/mzL0s75nuFt3Chc5DpkVJ7vGsf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BSLuTCxsPRfveYmffRy1BuCRYkRPjY+cCUG1zndRlRh1P5u8
	EqDYg9AM1ryGMzdFXfPX8WfaybUSbK4FbpUT+vuGdEqNwxsuVO7NFuh6w5gon/qJvSLNY75he2K
	yghgyBFuR8rTscwsxDKncOg1P/SnuG5jDEr6rYM7ipIGz/gJ7PpNQxc7l+ygWd8pNmRTN
X-Gm-Gg: AeBDietMdaTAWcegjWLQUpVaJc3OIiawAj6sIzQ96QVKgHWrJZyyhXwkgWsUQRsvpoz
	+j9jVjPrEA5w75DIHN7lMJOq2PjS39cXGjzsjtTmk0m6SWPbBp6pvFZhep83sm9x5rh+aaubVjD
	0IiMT+laK1ZM6HyU9e3NTEsNN/6dUVHALQre7qKdnBTdNAW7oEx8vXC6XSJYXIk/nOPG2GcRP/8
	Yyht5ogc2bsRdGAsXts2MGUFHpulDTD8bXVG5IvxhRZ1QGyQUTLX7QJNbWdx/kv8kvxIDjMQf5Q
	6vbRP/66KPb9kH4HxEjxl7oWaSDAsoYYpMZcnHTXTNcE2/OYLbLX4Ip1YsX/oF0xpXznRBOlNS5
	H0VH4SvkwtCvA9HqEtD2bzPvoXWlLvrLeCTjxibTyIcr2o3WXUgc72GkyKEGt4I8VUzcTifLCuD
	VRQvQS5tVIUvOMbw==
X-Received: by 2002:ac8:5788:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-5104bdf3305mr89676221cf.2.1777890339311;
        Mon, 04 May 2026 03:25:39 -0700 (PDT)
X-Received: by 2002:ac8:5788:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-5104bdf3305mr89676061cf.2.1777890338851;
        Mon, 04 May 2026 03:25:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d5978sm3149441a12.17.2026.05.04.03.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:25:38 -0700 (PDT)
Message-ID: <364faec0-7d71-49e6-b214-ac59785bb25c@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:25:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
 <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
 <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
 <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
 <duuley53qaykn3m7nb3k7mfnwsmdzfq6qs6zkek4iyymil55dp@azjudm4quspv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <duuley53qaykn3m7nb3k7mfnwsmdzfq6qs6zkek4iyymil55dp@azjudm4quspv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f87424 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dSS0pgqizFdtzYdKFxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMCBTYWx0ZWRfX7uQF+v4OYPJ+
 hHyPJKVwWUTlqfjXNffNYr2q+oyzEOofFgBR7R7LHD394k/QB9Kr8vilJKhywdGVBTHaLQwjzkp
 Z8/8Xh3CPLzoPfQqhOMimfymk+tTSaMSRbsN7UX63Qn0XH2b+gHIPfWcYslVLTA7q8YJF9J4qyJ
 eBuQVUKBoskTI0wCMXSJ2HuYzdy8AiETD0YhKBj71HeRlHIxzG1mdbVrSZ3AMVIc6cj2tVOy3Ve
 DT0+hGLNS+w75zmQPYTSFF1JyNp7YXeey7d67aRgvUoab+1/tyOnVNXBrb2BM5ccQgVQYgPmldD
 N4dW8y+B8dv6KofXvROvJoTzOD9k8zq0FWZCYi6q6GItdEFQWZ+V98VHtRapsbAixBWYCquJnZJ
 BfkfvYnuTdOCTt6m6FoVJIoHFTxdfe9Ju/a7Rx0MtaSCbH6K8ZNN+0i47rlpq/piDGBg2d1AwQv
 ZQZFvZCPboHM75j5HuA==
X-Proofpoint-GUID: p-79Ivdr5JHbLVh1j_kKXGCCXGTV798K
X-Proofpoint-ORIG-GUID: p-79Ivdr5JHbLVh1j_kKXGCCXGTV798K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040110
X-Rspamd-Queue-Id: 760F04BBAFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,a600000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88e3000:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105693-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 12:06 PM, Abel Vesa wrote:
> On 26-04-29 11:45:10, Konrad Dybcio wrote:
>> On 4/29/26 3:57 AM, Krishna Kurapati PSSNV wrote:
>>> On Tue, Apr 28, 2026 at 2:54 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
>>>>> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
>>>>>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
>>>>>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
>>>>>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
>>>>>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
>>>>>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
>>>>>>>>>>
>>>>>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
>>>>>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>> +         usb_hsphy: phy@88e3000 {
>>>>>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
>>>>>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
>>>>>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
>>>>>>>>>> +                 #phy-cells = <0>;
>>>>>>>>>> +
>>>>>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
>>>>>>>>>
>>>>>>>>> This is TCSR_USB2_CLKREF_EN
>>>>>>>>
>>>>>>>> Good point. Will fix.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +         usb: usb@a600000 {
>>>>>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
>>>>>>>>>
>>>>>>>>> Does the device suspend and resume successfully?
>>>>>>>>
>>>>>>>> Well, tested with pm_test devices and it does suspend and resume
>>>>>>>> successfully, but there is this:
>>>>>>>>
>>>>>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
>>>>>>>>
>>>>>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
>>>>>>>> all platforms that have them.
>>>>>>>
>>>>>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
>>>>>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
>>>>>>> Wesley would know more.
>>>>>>
>>>>>> + Wesley
>>>>>>
>>>>>
>>>>> As per HPG and downstream, this is what needs to be done while entering suspend:
>>>>>
>>>>> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
>>>>> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
>>>>> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
>>>>>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
>>>>
>>>> In case that's related, most platforms (including this one), set
>>>> snps,dis_enblslpm_quirk which prevents the first bit from being set
>>>>
>>>> Likewise, snps,dis_u2_susphy_quirk for the second one
>>>>
>>>> (although it looks like setting these bits is currently
>>>> unconditional upon suspend in HOST mode?)
>>>>
>>>>
>>>> As for the sequence you mentioned, I believe the diff below should be
>>>> OK - although it _really_ just adds some delay vs the current state,
>>>> since the bits are cleared in the resume call
>>>>
>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>> index f43f73ac36ff..e7b1775b7207 100644
>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>> @@ -12,6 +12,7 @@
>>>>  #include <linux/module.h>
>>>>  #include <linux/kernel.h>
>>>>  #include <linux/interconnect.h>
>>>> +#include <linux/iopoll.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/phy/phy.h>
>>>>  #include <linux/usb/of.h>
>>>> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>>>>                 return 0;
>>>>
>>>>         for (i = 0; i < qcom->num_ports; i++) {
>>>> -               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
>>>> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>>>> +               /* Wait for the PHYs to go into L2 */
>>>> +               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
>>>> +                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
>>>> +                                        10, 3 * USEC_PER_MSEC);
>>>> +
>>>> +               if (ret == -ETIMEDOUT)
>>>>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>>>>         }
>>>> +
>>>
>>>
>>> I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
>>> DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
>>> for the irq_stat register.
>>
>> Hm, it seems like the dwc3 core layer only does so in the suspend
>> path if dr_mode = "host"?
> 
> OK, so I guess the quirk list is complete then, right ?

Yeah, seems that way

Konrad

