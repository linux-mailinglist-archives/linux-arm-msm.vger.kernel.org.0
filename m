Return-Path: <linux-arm-msm+bounces-114979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gDSPKTdKQmpt4AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:34:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF886D8F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:34:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T9DISo9J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="h/qlPO38";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114979-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114979-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E2333001399
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095EC3B95F2;
	Mon, 29 Jun 2026 10:34:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130A35A393
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:34:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729259; cv=none; b=jWeOCPcx282qM2Ud6I+xBG62CPnBkvhulbIn/cAUbM1yMgOXJZ2t0SVJHI5sQEm+JXwhjCzi8iRmPSM+irMAYCQjlFroatY2o/XjOgyuUGS4qMvH57VHOtQvMVjGfGPWKwfogJWkRKK/kLitN4EAyyxzPWIGiTmupyKx8maYfh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729259; c=relaxed/simple;
	bh=O7k+YKlCUgne8sQca2M+WCEzkz5Cqo5yJXcu0TM/sGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzTRxc7Rt6tRKcILoIBBAMbAAfnBum/4enjT2LFNpIdA4l9zoQUEltkb64nUrrh8VPpRfNCwVvUU89W9NktuuWSKIp8XvPpMjfV1LLKHHVK2rBLen2zdc2/u8I4TANK1hsaUpUn2807TUAhg0+WC0AOOpEJZ7cfWY+KBz0LOAT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9DISo9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/qlPO38; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATJQH2656106
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	We8IfLXw172gbAFTQlf72mWB2mC4Z1ZwwihA6fagoqk=; b=T9DISo9J7j6psLNv
	9DiNxp8vZleQfl3RhHDR60iFKwo45IIdPImrtT4bK9GpYfGsZ8u2EsybeHTD/GvE
	bHDoD5g8hHCwUDhu98o7J5vh86Ge45FPbJY0+p9vwJH7SuY+yOm3krw1O4ncgoJ4
	/og6Gj6WJ3cLm2Mc7SBCyA7wqtDxX72X9iUZ8Qxs9jyjFywBID2v47xNfnO4TNd3
	75hCcxyqd3mkICakMK/kpM28A3j2FgTctGuh+RMQjoeK+Mstkl5x6EfL6R0eVGvB
	T4vNXIJaWigJ86LWKBRUUKMejzVvXlfx1UeupSLAR+XYfhDZfh4dKNrTB1xMiItB
	ERyEyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gcc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:34:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7359eba94f2so123575137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729256; x=1783334056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=We8IfLXw172gbAFTQlf72mWB2mC4Z1ZwwihA6fagoqk=;
        b=h/qlPO38fVN7pZGU12/Z8pH6nbt8pWthZfyWeijTwt6cw3xywYJ1SahGCYr1aAuKpm
         BsJhlHCp/n4ZT38TW3P1XFocvuPvPzoU566cEzOuoKHMDjv6nMailUOG6hslIOpWafW1
         RSqNxBqvCd56tRVbbg/00JvEMCBNnt64ebtmqvySoABCokMFzvHvUGnoCa2nRJG5tigg
         II15I8rTY3Zfm6SVDJ/aWypeoSH87YRKSP+A3XDwg6/z3sOLJ0sfPMAKL61ksFlL3K5o
         tnXq2ePWuGPczDv6kXIqu9Cx3QNwC2Vf/IJow5zPQeK1jEx26rbwfZ8ppxEPgIYvVemE
         iF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729256; x=1783334056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=We8IfLXw172gbAFTQlf72mWB2mC4Z1ZwwihA6fagoqk=;
        b=MAUZXfpD8NLl0flou5YXfnnXyahTxjE8TDufgzMde6Y+mvLxGOf0x7vGWFINK7U+/0
         2Rvv3hNAmEI0siXtxf0yfD4R00QMhx2z8qZHxdSLRaDDR8IeTdXoCAT/mkbYx0T+EH13
         47OZ6Y8pTVWqKFJ2OLawtAUU+PBb+ZrSV/sU/D8F4YcMukMh+jBa2dvTuvPN78kvM7db
         PgfTSH/XUveSPYDaqgfQtwquMOs0zw857z1mjErjKRAe/scWTpvt32xbQEswkpOHPvqJ
         6K08QD7wVOVBCHtZK25k8J0vuVwpNLsSLOCPjQxXPIvk3DaOiYBLgB30g9SKNswMmnLi
         Wb7w==
X-Forwarded-Encrypted: i=1; AHgh+RrsR7PBBQA/jyCPlUx2Vn/bj0kDptxQ/QKo1uQkltWXR5D0YzSU8sksHVbi0RJi7iHzmlJEoTXpHl30c/gk@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZFB+gSe7iZqTMaWromzpMm89aavM/qgBXQm/VktLZX0B3lEb
	kf5OAQCT3XxYSYpllgqp2TOUeZRpyvRM5fgcxAHhc/tfmF0lUkK1bsJQLgurhT+ubQ+2Tm6WLqL
	nYsm9J0OHKfhlIw0vaKqZ86i0FlvxMKXc3pBY76oNUlUmy8AouzhLb5pPc6nN/LJD99fQ
X-Gm-Gg: AfdE7ckrjVVZaV4a8PjK10OUXzm3nw7+HcP/sUCjsCD1f5mvjFwhs+3zaog/9p0Wse7
	IX0N6rehj2MAXdWveN3tlS7+J94qJnR2jQ7QASewXdhIbB30L140sJijDpBwBTBmJdikAApIM6K
	hctFCdihHO13/Y69wOVpX8dQU9ifq5z9X15QV+B9HO6kDXNluIvGoGjp+im2A1kNIkVBdrso4WV
	7QaHPyy/OA8l617I/CTsb4AbfiKb20ToxXb+JDaoeMMOXjI/Mu/AfDeSsu292A9qYjREO1NsrKI
	OH+aqfnSoKaVas6rcDY/sUAQ4BHQrfEuTnqxlRTNquK2CT2cytbG42vHoD8acBizfRzkOkGtMbG
	W2WnArYq1gfljG7fRGuGhSFM7TMMARuDDjF4=
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr2311951137.5.1782729255767;
        Mon, 29 Jun 2026 03:34:15 -0700 (PDT)
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr2311943137.5.1782729255151;
        Mon, 29 Jun 2026 03:34:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aeb509sm6698546a12.10.2026.06.29.03.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:34:14 -0700 (PDT)
Message-ID: <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:34:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
 <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX5/em5zTbjquD
 MaS/61el4akXXzBntEr8uY5r+FL036YBK0jPpYXu1fyR3EZ7r9MASbfXjgsE/jARg5Ft68De6eM
 MbmsdvWZG4LQylmJmcpnmde6d00yNQ6R1dNzS7N9JLKH7tChNTk3vb6CaQ3YuH47SfhJ/S/ZK+j
 NLEwRdrVhsBwoFAp+Qj+syiZfm6go20Ch4lviI3uJNjII14VSorwaHbltG1VEgwsXrosO0Fr4WP
 wpOHJh7OK0jW8iwlap8V51EVv6TeTk4dRHwurrLrlTj4Gre/Hk2a94wTpL/Vwqn0zwbk/1pf1aK
 M1rqI4DZK4hZdmZ9dC4NR9XYjMrKRsCsynKXL4b9ebYzbm5nprzIqp9/ciPmaFN+1Pe6XJN7e/A
 T3fXRE536FPxw2geS5nunI9HPyxt2sZfQU2O2Vd1eLzLqi5E3EjKdzXiZLzyZ9PxFGVBOuDy0JQ
 BrWxbcwpg/eCBKxveVQ==
X-Proofpoint-GUID: 0sQ089FqtFA9IjMDoSreY61aKTPfNovS
X-Proofpoint-ORIG-GUID: 0sQ089FqtFA9IjMDoSreY61aKTPfNovS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX+weJRxcGqKIA
 6+MXgF0AIOMmgm7eGfjIcw1BJm6p53oJ9zQbIKF2buoUTJ5TUaXbc22WHutwJSDa+x8bkeq++aS
 6ZtcSSZnjOa25NrOGlDRwQVrebGgjas=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a424a28 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h4iy993FS52baA_BjO4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BF886D8F2D

On 6/22/26 3:31 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
>>> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
>>> LDO supplies for the PCIe clkref paths on the CRD board.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
>>>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
>>>  2 files changed, 19 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>> index 9c8244e892dd..8b42f5174b31 100644
>>> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>> @@ -19,3 +19,18 @@ / {
>>>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
>>>  	compatible = "qcom,mahua-crd", "qcom,mahua";
>>>  };
>>> +
>>> +&tcsr {
>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
>>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
>>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
>>> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
>>
>> The supplies are correct, but QREF uses refgen4 on Mahua
>>
> 
> The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
> think rename the supplies as vdda-refgen4-0p9-supply is better?

Ah, I overlooked this. Maybe 4 could be better here, since the supplies
that end up being assigned there match what we call refgen4 on Glymur.

But there's no good answer, both options are terrible. Let's add a
comment somewhere (in bindings?) describing this mess, perhaps like:

# On Mahua, the REFGEN4 block is supplied through pads named REFGEN3

Konrad

