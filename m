Return-Path: <linux-arm-msm+bounces-104220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE1WE0fT6WmmlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED444E544
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CC60300FA07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDDC364942;
	Thu, 23 Apr 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogLZ41lT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y814IOjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723DC364036
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931635; cv=none; b=SWAwChf6gQ6WMAoRs5lmgbOM8wDE3XE1xKcoKZsfa4XpcDHE88XhkbV80ynfWIMK7rSQwUnNliIHET1PEN2PXs91pKNwyDu5ZoYmNguOCapkEPwCa0g40FKEZ2/44rPpAxKcd14FBldXDsRsSgvgMUuVNXNQ/EesU8Aus7uz2DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931635; c=relaxed/simple;
	bh=9+0W2VWdwc2cB9MzpKPzLqvQtBRd88DboztIZvW7wcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yeduxn/Trk9IXrK5eU5witfUtizILmvCN1wSwxVeOaca77sbkNl4Fg+w5iptlYatmz7fWN2ncjJR+b1ECU6hVljE5A2ITGwj7SjK6npwMai1iCdB37Fp4UebWvVSVzHS4yjQCNOcWozhHryaBEPQleLaCgbXmMidBjF0sIO+DDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogLZ41lT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y814IOjt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3A04f2012125
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cA4KLyFriM7ec4/EYZtlcwbpyBshVV3+QDW2hRa3qk=; b=ogLZ41lTaJKrurR0
	LMjZ7doJ63U2gowFEBxYYJC1DtJphoGHOdgmLh7yyncX41fP374tLPyAfH+el4JK
	WtSzbM/mGa5NRX/dE28zlfqPupu62h2WvBa0SxpDqtHnriwrTJWsDEijVCWINHGR
	WWCRiq/V0wHBnuD1wMhOdekBOZ1ebglFSkgPNYRoPiw84FzHHiCChdcR26NYud4s
	GvG8aGEHxRYhVum8JYomLllzOlNCVxi4AznlEj7xjz2DHn9mZswI+pKu4/kxqhir
	ypuXg0RU6hWfQ8cSxy7FL6Ysh9A7GjSP2RQpx6jvyLc1aWLH4DDPc/hxI+se2ICv
	dQ6TaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h7auhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:07:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so116295175ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776931631; x=1777536431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cA4KLyFriM7ec4/EYZtlcwbpyBshVV3+QDW2hRa3qk=;
        b=Y814IOjtf9ZS9ObWnNThH/Lsxn0Mem+6vKAmqQlwa6+Xl7M9tc1Cbg+uuHobkYUqe+
         ApHNcFnCQkpK5iK9sPfjTcGBbUR0gk+VvuwXvpVOoWIsRKcaPzIVnQTQoxeqEJjiHLwI
         61IbD0rOEB03KciccjwxxiZlXosoiFmh4Ns2XDP5Q2s+xA7WV/A3QTPHKIzoFAgSoz+f
         RpVnVt5DnL/ms6Vvav2LrHcMVsy7NQxSu2L39ht1UvXZWFbSKmTxzcV5pHkCzHz90RSX
         m6OhzMA4AcBP08lPRhnZnG1K7D4ifyWu019rKkZTzEDI/22U5NVVYEwli3OXYS/vXMRH
         aF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931631; x=1777536431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cA4KLyFriM7ec4/EYZtlcwbpyBshVV3+QDW2hRa3qk=;
        b=SPKUp8XiqQK6hHVnSbO3idgred1e5Yo694JVeK/8gyoZH5FGVJ7NZszGa7DvY2Gk/N
         KyuCXP872rPtkT2Ux/80BSURCsJdXzOzyqh5n1aiuAFugEpcBsz7iJOCgWVh98yOMXK+
         15faAamK9puBnz4KGNo9iIFo2azvIkF/8+iG8Wbgk1DMdNmP1jmLOK6Xy6/8p9NKHiFQ
         BR5tvjKoaFBVgEH/E980K8i6L4kJgR53CCFoF/LLv2sMVq7nLBpZS9cU8We1rc0rPfKg
         czl0X4y6txO9B+oRVWMe0gjsUAlfxdvZZKs++V02MA7A7jnoZo+5CPpUWdTAdjtyKCo2
         enCw==
X-Forwarded-Encrypted: i=1; AFNElJ+Q+XyVgJ/q8qJiVekbo/F/efnwc4btWIxEAVFfBGCXUZxxyCf1EifUWOH9EMvTEeh9Zv2xVE0fPECsnCVb@vger.kernel.org
X-Gm-Message-State: AOJu0YxJB8UZPyp83C0cNm8/F4lCy5sEbbUmzJCXS0uE2nn5mS8g/nFW
	Kycjc9fKjeeTk6rmxfRV30Q90zAz4hJVnDxutFF3oE753IE68PFqRNSNQPNimhhGWPpD4auHJry
	wPjLREROB0zhKxYQoE3xC5ca52jIABH3hsseXyT1fnKypfZYYMAaTPMPtz5saTy3Bia/B
X-Gm-Gg: AeBDietl8KofBESEb5ZjCTB1Sfc1l5bshuVPslYllV44ggIIU/o4FVjx4gSOWydZRwO
	oqAeZFpMdQ+0OonlJba2xosmPjjyJwBUKiMQEE+1SIEQit26VAcM0IVuFrgqXZ7+XVr2sCZ/P/Q
	F3c2j6RtKE4xT+imQ8Kt2RoX46FJcd9KcPGnsGWYL5fQrgLhMDFfNSpySKLtDkThuDDbhAo2YEF
	vnKzQsrl9E4PEcOVFEPQY5M3jYW20n65tyfSu2BR3Ye9oriSBoPrM5KE7JPQ/Uc6TPc6NxtUTAq
	k75DTpphUMQYHkZ9J770WMJvDwKTYQP2ILn+PGG+KOQTkjNWjZ5+l69rUxPGC2AgUsbFJW8V4EI
	CDldGv6SmDqIsn7UF/OwitTUvepXHUioiV9RStzZ83+k8+QTK1EvGiIUjLmJH
X-Received: by 2002:a17:902:9a4a:b0:2b2:4eec:9806 with SMTP id d9443c01a7336-2b5f9e78234mr194281285ad.8.1776931631555;
        Thu, 23 Apr 2026 01:07:11 -0700 (PDT)
X-Received: by 2002:a17:902:9a4a:b0:2b2:4eec:9806 with SMTP id d9443c01a7336-2b5f9e78234mr194281025ad.8.1776931631021;
        Thu, 23 Apr 2026 01:07:11 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm185133235ad.68.2026.04.23.01.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:07:10 -0700 (PDT)
Message-ID: <6e8f523f-7ad4-4472-aca8-118de81223e7@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:37:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
 <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
 <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
 <efa2da27-79d3-4cbe-ba3c-2446c6252058@oss.qualcomm.com>
 <hctf2vexnfd2lbnggvoanm424rmpzadg6daqq4477audy6mu2e@nwyp3ijbhay3>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <hctf2vexnfd2lbnggvoanm424rmpzadg6daqq4477audy6mu2e@nwyp3ijbhay3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BamvvqzLfrf5SOeC0o1-MSUo-CV0PY_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA3NyBTYWx0ZWRfXzf2QHunRpKml
 H+9gUbsIAQ6ZS2ZsKgCdv5iPy6iLvdUgikVBMGWSBqVI/BOuJ+fHn0Z5rbtJELedbRB2VEF9Bvl
 DKtepQRki5c7Bu8GpFBVW3rvLwoWNXHmcd0zi/74oaFZkeyElKt5yDOLRspJbwRd37eyhLoYF2b
 6/pkOaP+GuGEXw0u7spUpKm0LAc1NRJVorD0YwOaznJF1tZLnMqb3zyvqCNs4jsRAb/M22fBuxw
 7RAGcAEGX0uue08NhseO1pzOABTtbvwQJWgWxp0rcCU9WXyW1JEzJ4qR4yHwUlD0wDC2uv9aavh
 LBR6+iZ931kgia9CxOKcLxlmxKliGcwhrVnIkwibveuqeDQGneqZt+A1vww482eYLPdoPlcXj+i
 mvACly71lVKbjsmU/YKMSXG/CCiPN/btxaHejB6Giu3n7yrH27vLW1ieSEDuD1sET2WdLpRCfa0
 GsAnfGNm3Z3W0x7GZQg==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9d330 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=BqLQL_UPtuLX997o1IYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: BamvvqzLfrf5SOeC0o1-MSUo-CV0PY_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230077
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TAGGED_FROM(0.00)[bounces-104220-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	PRECEDENCE_BULK(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01ED444E544
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/2026 5:22 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 22, 2026 at 01:09:22PM +0200, Konrad Dybcio wrote:
>> On 4/22/26 1:04 PM, Prashanth K wrote:
>>>
>>>
>>> On 4/22/2026 4:13 PM, Konrad Dybcio wrote:
>>>> On 4/22/26 12:32 PM, Prashanth K wrote:
>>>>>
>>>>>
>>>>> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>>>>>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>>>>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>>>>>> super-speed enumeration on that port.
>>>>>>>
>>>>>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>>>>>> Cc: stable@vger.kernel.org
>>>>>>
>>>>>> This is a feature addition, not a fix
>>>>>>
>>>>>> [...]
>>>>>>
>>>>> Sure.
>>>>>>> +		ports {
>>>>>>> +			#address-cells = <1>;
>>>>>>> +			#size-cells = <0>;
>>>>>>> +
>>>>>>> +			port@0 {
>>>>>>> +				reg = <0>;
>>>>>>> +
>>>>>>> +				retimer_ss0_ss_out: endpoint {
>>>>>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>>>>>> +				};
>>>>>>> +			};
>>>>>>> +
>>>>>>> +			port@1 {
>>>>>>> +				reg = <1>;
>>>>>>> +
>>>>>>> +				retimer_ss0_ss_in: endpoint {
>>>>>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>>>>> +				};
>>>>>>> +			};
>>>>>>> +
>>>>>>
>>>>>> Stray \n, but you should really have a @2 port here as well.
>>>>>>
>>>>>> Konrad
>>>>> Can we ad port@2 and leave it empty?
>>>>
>>>> Why would you? Just connect it to port2 of the connector under pmic-glink
>>>>
>>>> Konrad
>>>
>>> Because the port@2 of pmic-glink (pmic_glink_ss0_sbu) is already
>>> connected to usb-1-ss0-sbu-mux (onn,fsusb42). This is different compared
>>> to other connectors.
>>
>> Are both the SBU mux and the Parade retimer present on board?
>>
>> The former is redundant since the retimer already has a superset of its
>> functionality, so that sounds rather odd.
> 
> fsusb42 might be also used to switch SBU lines for other purposes (e.g.
> for the debug).
> 
I just checked, fsusb42 is not present in evk, not sure why it was added
in the first place. Will link the retimer port@2 with pmic-glink.

Regards,
Prashanth K

