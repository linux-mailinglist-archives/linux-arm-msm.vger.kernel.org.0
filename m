Return-Path: <linux-arm-msm+bounces-111795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hqv7NQCWJmqcZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:14:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478B654EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:14:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JqF5HFC0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FmTguH66;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111795-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111795-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A592E3035A90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D439E3BC68E;
	Mon,  8 Jun 2026 10:06:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC9F3BB9F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:06:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913209; cv=none; b=h4nB1kF4e7ShstwpnhIc9mgY40qA1s1JE4xtK7svZEUWOIFKBJ3dWqujgd0arUohBGNu0F7cXNbRkTTFw9w622sSs0O2YVmbEVIaLoEI9nL8nhk2waaa3tuEN5xWywahSeIwNuz1LG0yqEhlO6kXFC8YE4rn7vGs2SPEEjxK1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913209; c=relaxed/simple;
	bh=KI6uYiXA5Djw9SkNazf/BdY1/8gBsUt21OljjUxNkX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaMnVJuHTjkmz1nbxd0V04oWr57JoOu8xxVGV5rMRY+zS4279Na5opq2zMilJ09jXVe8xLngQMYl0fzZq68/8ZOFj+h0EiwCQ0uzIJ8KwMoRKvd+KPOvSI+yxFybaAALCWKtG3eUz4ynjDY4yIlOxlKJsMttECgeWc8acxSWtXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqF5HFC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmTguH66; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65890poc3163838
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spxpQghrem8Y0gqdfZEhfncpVw0aY3EvdsS4NM86pGk=; b=JqF5HFC0HioFAen9
	Z/nA5RHfjDUFFhAasdxHhH5IGKsbcOJ277ku8oIMC5SbgRpUC/w3xhT/U/M+QrkP
	gBRbhQz8/mKwAxjjHjXqnq2bHvRHL+etDueqv8lSyV8BBRRD7tKr6mXaOW4gJfTn
	B9nT6ts5rLNJr4AoOmKcDYJ9w7L48slyIHpknGAOI0yp7J85vsDwUzcYLCR+/lqu
	MqGgwb2iHsdMiIG76omlRujOYLApKaNgqiVaBMtcTEmi5RdaofNpvMGNBX0ZQWiK
	3+elRrH7tQtkc4sEjT7jI4bwPz6W0E9WYC3JMV6/AYX30dAPSztmXwSwbtSL85Lt
	iisjfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0g99r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:06:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so1323821cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913207; x=1781518007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spxpQghrem8Y0gqdfZEhfncpVw0aY3EvdsS4NM86pGk=;
        b=FmTguH664Rh/ywCf6kaMWAEPrMdUFzs39TmIn+befX/szGa5hox7XRRf62geot0nUb
         5Ys57F6TqFMEE2AGKtYUc7u0rvRzcc6dFFSCdCpAjp+WvJjW7XbsNHioNk/Ulp9L/WP2
         /sqqDo1atJgn1kjcZRrQCfPgYL52pLqfu2nWU49eUlrbLDvjJTU6tlGg75c12dU+7wXT
         7k1tQHFRJPyVQQidj08CZzluutGxMp7zFcCictgOFqJlfHfksEbvPFO1XIVfwoiAr2dd
         WxaD6Es6/Z7E5VXnLdRZt0tsbAHTPrxmDCjHBEOtaK0p9735dCXA0SIwksO4OzlMMmaR
         9n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913207; x=1781518007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spxpQghrem8Y0gqdfZEhfncpVw0aY3EvdsS4NM86pGk=;
        b=f0fJsfgWGLrzf4g/UpeGwY0eK2d6Atj09oJ4d128JNbmaCPtLRWwleufDVVAJF29Dj
         yUyeKth2oDfGY0lAHC5sEAnYS8iPPD6+NvfwndTecPqQO5ZKyQXRiVdTdxM9r9WXcUlT
         0iUV3ymYYU+cXr0zwKL3Qtxd3CA7FS7N4HPEosvBqXbeoK/tuv1nftqy/Jn+rnyqnXdw
         xCaBt9Ho4UVpVMaOV3gR3lpbdr/BxwIKMMteeWQpiJ5D1G4Oqkg5QwpOnT2O3y5qWCvr
         2STOBr3vD9EuvHTgvWh9RKiSby3zafylznI/A9Z3iXuwOdyQx3iw0+WVR94ynVCqDUOB
         zmaw==
X-Forwarded-Encrypted: i=1; AFNElJ83CdFd6C0ncxeS5XmsQ8kWNHCFdfa7g19vcRaks0y1I0iVTxwhg3l7tVBY28PiFZk+yUxIBTP1IpFjPaHR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFB7+ksLk1S6+dN3Ka6aT8SN8YXAm5c7kRIglVcDkhSwiOIMs
	M3sKPTJgwkgmvA/P6nGlMb3T6TSEln4jfDB981Pa6VKDpc5P/TomooN6N8dExZWnjaAvsm5QnpX
	t+BX2/7y5PPMhG4vuIFSN1C3pvQVsnlQNKAOfkZryHRXP3UnIr91kyBQqYOhcAqNZoQp3
X-Gm-Gg: Acq92OEq6hYbT4mY5Tac04XjLWV2ZCChr14lnJB+KTpj1OBwfBosDcBJLvhD/MOmyEV
	rdXQLiKJK9m8HxBA9HjNT+0+GUUrZsX43WV+i2K1QRv1laadJL2bNfC+Y14px78qTAeXUpsIwPF
	syVqoNLAbPBXNfTXa2f1vxUCRTH2immverwlb8eBCgb8TgALcY6CHuNI+fWYlQyDe1KVeHszSav
	mX3ql4uDphuORH2Gwj6qkPQQwePDX24xEIFsb6BNItChpI+5AzfLS1mDWS1wm2H3uQzoaMtK6vc
	3AB9ZV7PDSkVXc/OW+vtB8v7+GeuGkg7rLXU8r47Cd8CxgL5XjygAg8+s0XdH2P0sPNzMymNnEq
	911gO8jXHsCHBbvXkmgIco8Ncn0drajltqU8svmo0fluXjWUROIG1Dq81
X-Received: by 2002:a05:622a:58cf:b0:50f:bea5:52a with SMTP id d75a77b69052e-517958e7faemr125717551cf.0.1780913207066;
        Mon, 08 Jun 2026 03:06:47 -0700 (PDT)
X-Received: by 2002:a05:622a:58cf:b0:50f:bea5:52a with SMTP id d75a77b69052e-517958e7faemr125717381cf.0.1780913206659;
        Mon, 08 Jun 2026 03:06:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553060dasm848324066b.44.2026.06.08.03.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:06:45 -0700 (PDT)
Message-ID: <bfe4049e-d84e-4359-81b9-a4e68851b32d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:06:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function
 slot
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
 <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
 <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NCBTYWx0ZWRfXyh3mhNVESO2L
 IKtnTajDmXZZaQL1XhIUyU21FXrY2mq92t4wFP8W8IjhHufyGyiNFlbaAM+a8M9D9wzzjHNI88A
 oJmnCbsQ8fhT/INEIYSWi9iP9HZSmd45P73lte3ZdmQLH20ClLduHdcAuWg88vZBglgv7OORgkU
 d5UgGaYi5UiBcMXVRUNR65KbuEB8TP9qB3gHB7nodIIGaHU8DwoxKvlKfYbeikzjtnlJu+Cb5en
 Ucth8CQzEXjV+lswuMB/DkhFx0PZAbK1ywSdE6O4ifJJi5FKhwXeWesWRgx/EE8MSptwMY2ZIeM
 igdKKzmN2pbcp58nJj3mkJKTLh5MlltCQxknH+kcwEiqKcSb1T4Sg02h76Ku1a2c4MJBeBuM4+N
 i4KLTfk0RxQBJlQhh9WZdYuR/BC3/pai5JUQ6Ew5M2pKLELFQxiXX3Cmxq97O7FTfaBkblAOuCg
 QfiI4IX7VHyN98TQ6zA==
X-Proofpoint-ORIG-GUID: UzWThXCHS4AsBCW9s_tJY4FZfxj9i8LT
X-Proofpoint-GUID: UzWThXCHS4AsBCW9s_tJY4FZfxj9i8LT
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a269437 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=I_GUxYuSRt8l7ccQOTUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111795-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5478B654EBD

On 5/28/26 7:24 PM, Alexander Koskovich wrote:
> On Thursday, April 23rd, 2026 at 7:08 PM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/23/26 6:51 AM, Alexander Koskovich wrote:
>>> The hdmi_rcv_det function was placed at alt function slot 2, but the
>>> correct mux value for this function on GPIO 19 is slot 3. Move it
>>> accordingly and leave slot 2 unassigned.
>>
>> No, 2 is the desired one per docs
>>
>> 0 -> GPIO
>> 1 -> QUP2_SE5_L3
>> 2 -> HDMI_RCV_DET
> 
> Is it possible that CQ7790S is a special case? The pin assignment I have for it
> here is:
> 
> 0 -> GPIO
> 1 -> QUP2_SE5_L3
> 2 -> N/A
> 3 -> GP_PDM_MIRA[0]/HDMI_RCV_DET

I'll try to find an answer, even though I doubt it

Konrad

