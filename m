Return-Path: <linux-arm-msm+bounces-73720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5168B598DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E32345212AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ADF3375B5;
	Tue, 16 Sep 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZKh2TdbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C1321F3F;
	Tue, 16 Sep 2025 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031386; cv=none; b=rAirzRjtxgTl95cMuN0K40tVEuPC6S5QC/iY7fv1kk47OghpHnPo+wOMDbf2OOAX2Iuu4qRgWxiO4BEBwjh1mjEgAxWRrDjtwKiFB+Q3qmiChuY2LR/oz3pgtZuo6RKEqRaabkFgdlzPsbMcIJYWNGwE+c8GGdAwcwrBagK8J7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031386; c=relaxed/simple;
	bh=+yRQ9oonAF8T7vZkFL2jQ52Qo7+EmpAEbpXPQLkSqCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oE3qUcuiHdsnsRVVQ60QA/UwKmS93DvK8bBevoeDMU9c3G/9zHNbyLSKwlQksN2spcvg7zKMirbzkiZ2LYhL7fmrZDU0QsgspHzfyz/sCqVa1YN/FD0gRRW/fPUyBdI8Xl1wOpPenVorB8iOpjHcUSa3M5zEeFfNJUtGqqovzKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZKh2TdbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAGQxn012287;
	Tue, 16 Sep 2025 14:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QW0FlAn8J5dMbTfSiA/mX2MJhAU8mCp/skcnKKG70UQ=; b=ZKh2TdbBzhFReJ9C
	dttgqL9Z05dh8Qb/0ixuQxUotK76GShwZMjjqtLc79u+dXEOeq/ZM6JjHIOH0QDI
	5H6dASBA+dluoVQgj2KHF+C1EjhenjxlFdN3Y2PoTuSL2GNB/melqIAZ0crzwwG+
	tHzUTlH0KQ4W8vbTeRRkjCMo8GGdY9R7EZ5tWawkfRBDYmMwwT1MypBW5W42TkRr
	xCCbdELvoKv4SXR8plqtsPqoap4NT3uRYpseVHQiXNvjCURBG12Z+8Vm5/VJ7fGR
	SRU7eZHWtHVnfufRbi0ug+1Umtg5enmpqB6lx8CBUVkt+DkCTtTVB/n6AfXp64JB
	TNZ72Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12mqy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:02:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58GE2tvu016238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:02:55 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 16 Sep
 2025 07:02:53 -0700
Message-ID: <0b1f0a51-3bed-4e66-9285-61f110707ebf@quicinc.com>
Date: Tue, 16 Sep 2025 22:02:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marcel@holtmann.org>, <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_chejiang@quicinc.com>
References: <20250827102519.195439-1-quic_shuaz@quicinc.com>
 <5kjgeb2a2sugm34io7ikws7xy4jroc7g2jxlrydfc4ipvdpl5z@ckbdxxnjoh2d>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <5kjgeb2a2sugm34io7ikws7xy4jroc7g2jxlrydfc4ipvdpl5z@ckbdxxnjoh2d>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Kga5QlJPLMzF_8yv4TGOaeTQlIThXTjU
X-Proofpoint-GUID: Kga5QlJPLMzF_8yv4TGOaeTQlIThXTjU
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c96e11 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=zbsBYyxTTkarEyjW37MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfXy75IZJHjhB56
 ENTxSN9nE55ujvYM/+Lka6YPcZM76+Osh78I5ZZgEHZ5eySsDIwvlKQqaRXLu8xycemPIMDck92
 M4opZSVxBDjOVTdNGJknv+/1fIuyZK5yscwvOZjCLIREGziIilRpwnZrdHscqyWGImMvxiZAOTY
 SWgOf8CMkdz9cJcUlFnO91ypw9FzEf3Ch8LSBVSbRownfZ5Dlm0R4qFHxu92gmzM3IhFrNrh4GI
 ySAIgLVmna5tm20wDoSdOcUmW9M/D+z03UwzCNr9N9kB2/XamCizOrn3WRack61+Al4ZyMiaylw
 hkCnmH3D85+BqYdxy3lOLaiKxNfBnvmyCUjFTIf+G89SuXfRik64axW6eahW+aFbLeKQXcPbMVz
 /RAS8oUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

Hi Dmitry

On 9/15/2025 8:45 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 27, 2025 at 06:25:19PM +0800, Shuai Zhang wrote:
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However, due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
> 
> Why? Does it apply to all platforms (as it seems from your text)?
> 
> Please write the commit message in the form that is easy to
> udnerstand for somebody who doesn't know Qualcomm _specifics_.
> 
> - Decribe the issue first. The actual issue, not just the symtoms.
>   Provide enough details to understand whether the issue applies to one
>   platform, to a set of platforms or to all platforms.
> 
> - Describe what needs to be done. Use imperative language (see
>   Documentation/process/submitting-patches.rst). Don't use phrases like
>   'This patch does' or 'This change does'.
> 
>>
>> To address this, this patch clears the QCA_SSR_TRIGGERED and
>> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
>> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
>> completes the SSR process when BT_EN is always high due to hardware.
>>
>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>> the comment in `include/net/bluetooth/hci.h`.
> 
> Which comment?
> 
>>
>> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
>> and its presence can be used to determine whether BT_EN is defined in DTS.
>>
>> After SSR, host will not download the firmware, causing
>> controller to remain in the IBS_WAKE state. Host needs
>> to synchronize with the controller to maintain proper operation.
>>
>> Multiple triggers of SSR only first generate coredump file,
>> due to memcoredump_flag no clear.
>>
>> add clear coredump flag when ssr completed.
>>
>> When the SSR duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.
> 
> The whole commit message can be formulated as:
> 
> On XYZ there is no way to control BT_EN pin and as such trigger a cold
> reset in case of firmware crash. The BT chip performs a warm restart on
> its own (without reloading the firmware, foo, bar baz). This triggers
> bar baz foo in the driver. Tell the driver that the BT controller has
> undergone a proper restart sequence:
> 
> - Foo
> 
> - Bar
> 
> - Baz
> 
Appreciate your patient guidance. I have implemented and integrated
the proposed changes into v12, and it awaits your review.

BR,
Shuai


