Return-Path: <linux-arm-msm+bounces-99850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBSMCF/Mw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:51:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1653243E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EFDF3034562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC763C944C;
	Wed, 25 Mar 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8h8iA06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrPWfT6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FD3CF048
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438751; cv=none; b=Hbo3YId/8rAjmOSgu3MRZV2dXS5gR1mstCl2psSopNegxdPRmhMoVTvGvEp2Il2xSWmfBlWSzOAZU7//InWUTGdBk9tQ+zLvzNsArFL+IEtz2dbtH9ugnVGaX1AgAYAPpZSrl6MEE6kKEdK0eAAy2g/fw7iriJLVVjJD72szap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438751; c=relaxed/simple;
	bh=HwbldYifOI1syh9jQF57vFS6uLXgc2AWeYBYJY+QJuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK0bIwM6Kv4zudEeYa4/j2dpZJF9owHCXGraP92EC04ToMFjFWaVoOv4KooOr2RIUsyQw/9L4u6YAU4F7SPQmzbs72itlBb+UpQnTOiiMNxpBc9iAQBS8k58NArZd/6wH+ukuIJIHHBoTkh69LUNapk1mlAT3PNio1gU1Ot0sOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8h8iA06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrPWfT6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGGPv2197416
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=; b=P8h8iA06d7Emd6TZ
	jaZbGOSeTprb8l7ZI4vBahVvzjyOWeP5c+QTb3BuD2+7VDhVWLlDMlvBrBaOYUPi
	UgU/WRY/OsW8uiAZB5AnlE3rEtF4jhpoFQ6O8wo4pdhC/rhKVdS9UCg6YknxyqBc
	lwBExw4g6Jcy+pV+C7rsuZ57cYkh/YQbMdzVxXZwCkm2cUvUY4jXBfuAGl9AGaig
	kPtnZJ8E4T+62TdK5yGPiwbON0LAtuCcYKkKJWEWaWRfOLDvsnSSqL5nFOGaDopj
	5DCsJoywmHFk60K1o2hzadprWg2xJxQ+FQjSNznt5C1aPOhcv2tbLESa1WH10Rdr
	yN9vCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48599kse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:39:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso56447601cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438747; x=1775043547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=;
        b=KrPWfT6qaFVBKUfAWxutkzbEYdllU8U+rquAJXazgXjj0bzfAprTd21q3QuJfipi/f
         N780OZ2GRWAB7vGOx9WkDv61kS7V58XFLJ5dsI9vxRor701gU2tx3aielJYtrDaWvUge
         6bBPFNG8KAMAFOhC41YK/YfbKyUR+NAowE/Jm0+pnpA1M7UZ8c3WPW4sMeIbtwA04gaG
         lSsbCXkPtMfbw+ROIrhc/n6CVSxYimib/Al1hDr+qmzfI0Aa89/7LPd/pxHIYPIR+cou
         Ofwl3Accu8GGgku9cmGQmXpvZfCLafT7vYSW/RwlFyqLu8DsVn7t6vWgM3Lr+EKKuhqZ
         xfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438747; x=1775043547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=;
        b=a088hfyy0Jbnl25rUVt0TxA2sdvtL/l/ass8S5U0morcJlD5sbNIQx3y4+pZYZM1ZS
         jaBRUq/s6kXfUBpyvj2rLumA0Y63j72XbEfjbbaZIIMQPAAAn858vWsCHs6K1ZBcLBX/
         8oIqDRWFYIEaPew1NhK3eY2qRDS+8ewdh9F37LBxtAfuEWIE+SQWbXM5MWpHr067UH4i
         Dl6qHYBBUrUs0bKjdX6OTczR7EB5hpJMDpRnH3Xa4bosspcBGTC/a8/zYJrsPEJIwq7X
         ul3MBUGJu9/eIaMTjSFk7osArSAAVLV7rIlq+VMVJeL4GIjF/qkk6iNPgFNgcwT7PXpj
         l9BA==
X-Forwarded-Encrypted: i=1; AJvYcCXc+N1/E2VE7xuRhJayzwKZ6TviObf7kHdjk42gRpOtAoIjtKYKvdgfFp97OaRBj1bi6rV1j2U5ir+JoiWy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jS+u0yUVsG6XogQ+Vs+Wh3egYy2yncoWYIjQrLalcXCDpRJ+
	If/lsEF9/DxjMYTogfLaqITCaGcu78vTAFw+jyeLycrOONOPiNVX0FT+d0ZaTsAdgKHZB/luXrA
	oNF3Nm4/aS9HGY7pMeaBCOioq6haRonB1utWfl++iwolirXZsEkm1l2y9tZyPelrn2OQ/
X-Gm-Gg: ATEYQzwPcGSyYmasBI9wvGGuxPy5363ACJWdHAM7xm0liZughJLr5Wyfp6UglAB5rxk
	kyIe8dUI/rNk+PFQQLxC/2SNKOzLh8y5Dv513mOCRLlN6W7u1ZQbd4d9DLIZqhDUgvqmY8vIGOi
	YWJZ3hO9QLpNCDMHRi+6gjzoTAOmqF4O5cQccOGHsBIf6lvnZOZbTlQ7d72lgmPKPMCioP82Ad2
	Bz/1NmOPvA9XLfvm77KFx9yLKNlpK59HwzaFABDVTXVg6YF6O7q9wble3nqteSYDHDD/eZUsj+i
	BlNMj2jlBPho0YWjwgvhOw6W/5ydb61UQLG9If/6U5escNuXLpCVtxX1br3sC7O+hGHHifyY1X3
	bx56TvB34+TcvFnkDmZtmBYnOKnVaGPe+3cZwj9dAin3IgDCJJA1FFWn3pcOVTJ2nNIWQbdvYt+
	O1gaw=
X-Received: by 2002:a05:622a:4086:b0:509:39b1:d4be with SMTP id d75a77b69052e-50b80e802e3mr33657601cf.5.1774438746753;
        Wed, 25 Mar 2026 04:39:06 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:509:39b1:d4be with SMTP id d75a77b69052e-50b80e802e3mr33657271cf.5.1774438746210;
        Wed, 25 Mar 2026 04:39:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387103asm779356066b.57.2026.03.25.04.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:39:05 -0700 (PDT)
Message-ID: <39da1661-bad5-47a0-b50a-52678e1766f9@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:39:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
 <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
 <c607e5e9-2e2c-450d-9ca2-5727ba99578c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c607e5e9-2e2c-450d-9ca2-5727ba99578c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfXwhW8mwWyUx7b
 mysq1NARejgUiVraj8OQc/18J3Arr4zcMf3qojKLWrt23KBeXvKmgw9OASlmx/r6tb3I38XuELa
 nbxl32GpwXPjsYWcqyEr4azM4rGxhdYiBnS13uxLlvyJDiWPAajfp/CcJCOVPSGW/N0GDnRQDRK
 NJlRrVSPruxjioxOog9IWYhgct8C0Ftq1D7pt7QmjdoJ7Hmupu/ctupi96PA0Xa1h747XXzTvSs
 Ms1WoBvt+Dw/CyZIkKrOSRpPTVpJhU4qaWfMTxfLVMdwzdtr7S4FzfWtBAWJP4kKJe4G7bfVCKE
 c80s+ouDsx+ojBnOdq9Uat9f5ZLc03W0r9A/gxFKNn1xhZIzcWD/IIAV4d2nMmBZulNMUZSayaK
 bWolxRqKE7bR62mr8jWb5aoFg+ULcJvKv4dywqimxvEW/4W4msbsJU/qr09pk7srjDqTz5v7BMI
 OrjqsyjViyzU3NKYtww==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3c95b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=nP0QM_pW1fVPP_CoLIUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wpc3tiE4r129X4QF_IlYOL5bbGfnJ2LY
X-Proofpoint-ORIG-GUID: wpc3tiE4r129X4QF_IlYOL5bbGfnJ2LY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-99850-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E1653243E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 12:31 PM, Krzysztof Kozlowski wrote:
> On 25/03/2026 12:20, Konrad Dybcio wrote:
>>>
>>>>
>>>> FWIW TLMM subnodes are best sorted by pin index (although the file
>>>> currently doesn't really do that) as per dts coding style
>>>
>>> I assume when I group the -pins into -state it doesn't apply anymore? As I don't feel having pins relevant to one device / subsystem all over the place is extra clean.
>>
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio12", "gpio62";
> 	};
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> Let's imagine future possible implementation of DTS coding style
> linter/checkpatch. How it would sort the nodes? Either by node name or
> the first value in "pins", this this would be:
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio12", "gpio62";
> 	};
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> So that's how you code. Less work for future linter/checkpatch.
> 
> The trouble is that "pins" property sorting can result in nodes being
> spread all over, imagine:
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio5", "gpio62";
> 			// ^^^^^ DIFFERENCE!
> 	};
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> That's why I would propose to keep everything sorted by node name, but I
> am fine with both choices. Qualcomm maintainers decide about such
> detailed style they want to impose.

At LPC we agreed that the last sentence should not be the case ;)

I think I'm fine with "children by name" then..

Konrad

