Return-Path: <linux-arm-msm+bounces-97153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODyXA2lfsmlmMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:38:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16A26DF6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC722300F2BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CDA39F174;
	Thu, 12 Mar 2026 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJUnzsgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6P/DtdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E138643F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297297; cv=none; b=FKEg3/k1CsqKwxDOCojkFwHJIWf8OoxHmThXyLJFRxZ8I1xAJulCGUCSJiql1C/2tXU+SXEBHeGL90jHoef/SNzPwTWKU0XlweKiuoMnBg0rZtoO3Fid6sm7aghEPwo8fEJE7I+NeBDuP02NdTyd1D2hmYr+XDXLbbNWGwDCYAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297297; c=relaxed/simple;
	bh=FUxUDh7qrm0oeEUmw+VjOZXnXxJtzKNzhMYElE8ggBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qo2EJwzgwcCCsohCzyVzvP+nHuzKoEEO14eMuS4ElYNLzvl1ZpydpWDOKyXseqLfse2FvlVmlBhePKPhyHvD8xuQYGGVW+MnKCNLUBTmRqoUPirg92u/pCjTQiPj+JUrJrB/FQEKyvcGZdXjEGlkv88OQiCsTes7pOujMer8SBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJUnzsgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6P/DtdB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMk2f4132443
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gx9so5/H9hADS1SBta9ddxnmlLWWD5M+F9fr6sL/dgI=; b=fJUnzsgTR1TwQO7b
	fRFP7fvPGypOcU9Mps1AUjaykGTNGki9KobVoX09LAwwxETI08UCbhhWDiwdYVeQ
	U2NC+PwBhb66oMxrq6yTraQ91XQee4vmEuj66eB8Bhjt8PoR93CJynkuGdTqag24
	flrQsP94HIA572XJR+kQ2Il1wk9vjM+GqpMPTLNsCkvMWnuSBHsyWwrhFqcBCFfU
	qiXBWDYQgQNjTeSJ9IEJZgtyLEdDRdWh24QTZuKZkJUdgW3bniqwpcU4KFOOECbf
	7Rsw77LKDF0T4DsFhawV2dDR0IIrZd1SCT+931qJGYo//rFLnK358aDdU0W2Pq9i
	qaRLhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w1436-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:34:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829ad81b132so2449753b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773297295; x=1773902095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gx9so5/H9hADS1SBta9ddxnmlLWWD5M+F9fr6sL/dgI=;
        b=U6P/DtdB08TBVG+0qap4aKucdjVuGRa1dDzMx7flcKNQvze0jkoY9OP+vvWW3J5JzX
         Sn/ERjwUHSu36uacF1w4SqFCI9HcYwowaJRs693/alshyNnQnJjGBumS1weixLwaVbyK
         cUrbiBKojpxW5SWlP6PP/cpF3P+ZkeLN7xns5SZZrt0chKheCv+wM3hPOuFiM4uQ09cH
         OVtGZfbjQ+VYIwAjXfWRWGExOEmPb/ba+ofNJwitpS7FkI9Ad9U3+HSfVg1oqvHgHICO
         W4em+fXTja2lHb7eTWfzkEnI1EMEiZYCRMHH0Yep0mYDn0vbNIlEqS2F+52ZYWbzQBsI
         7L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773297295; x=1773902095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx9so5/H9hADS1SBta9ddxnmlLWWD5M+F9fr6sL/dgI=;
        b=Q90K3zASDpiNxfK3QmfzAvjlRyCrHYwtSx3H5mwH7iwoKDi03L8oCVlOvgQp5vFLyE
         /Md9/F2weWbWjADP8cdCsNziL9k2YLRK51zxKTnN7wYqVJI9hrYSrbGhFPrYg/vRokU+
         6hUUsJW+KRCz9ZXzDCFvIAXWlBi3snlL3RTDswh4pBu9xAFmyNf6L9gO3M4vc2eWlLIe
         fRh2IgB/N/+C6JzKtJKoXvsL9Jw2jLNr2+RkUPvRCfRdqAq94UmzYmtheEJiqqszuTV4
         yOiRiiJNp/eE3qoab25mlvgSX4CH2fGc3Y2EcuIOGMpud8YmniBgkHa/A9KOkvNT2k22
         1fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqPcQy4knVJJnFPnmYekEJ1T2xb7we1ivCSxZaQYKHtb4SDEa4PEvz00XIf6rCxIdts/seUWd5TiyejN0X@vger.kernel.org
X-Gm-Message-State: AOJu0YzWRXyYUs2QVRA44utlRFEyYjOQUHLSsTaZWyoYd7JKFNg03/UF
	agY3cB/PAMA5ZIq0pDGEQ03kN/4vvXeDOGfojWbp7xs/mbKdOIE4VoTKsHmC64TuCD2uFVEP8Pl
	qx8APwr04+O423rPsxc0c56YFwMsy3VolhisMur+Q2ONVbZW0vvbyw75CtCxcHgQIN6x3
X-Gm-Gg: ATEYQzzYUx1Il0Y/JXN/KN8hitf0t0bIdtKimX4DY2c7LK9orzA7+qUmbaY+jrrXvlU
	HNQ4/WuiUObCMH4JOMFdZGSW9+FMA9YxkeXNWa7i+H5oq4mF2arlalcJbFVJdSnUN5Dqb8mN1HO
	YLZABsNOR+5q1vqBK65i/+AuXlrtiefZ59ACe4Y9cLElH8PeCsnkIjKD84LTHYzigotZmezMsST
	37GQHGh8+z69NCl/+Bvu0jonkcriqKPPjnR+gfRzJoT0BrfNw5CMeORbLL5Cp0MjCV0dReAASz7
	d13GtDOhTPpd7Ag/rCElQdnTErjDSgxRdJd5K7tUc+hHnSzVpLxyrsJdnyE49W5NUdU63KzikFQ
	p2/PgqVINSwijn6FPhpA6V3x2vm6RL8KQ+ORAQF9C1AX8hPbQIY7rV2Y=
X-Received: by 2002:a05:6a00:1912:b0:81e:c5a:8c25 with SMTP id d2e1a72fcca58-829f7150647mr4231809b3a.44.1773297295225;
        Wed, 11 Mar 2026 23:34:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1912:b0:81e:c5a:8c25 with SMTP id d2e1a72fcca58-829f7150647mr4231790b3a.44.1773297294709;
        Wed, 11 Mar 2026 23:34:54 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072612e2sm2132526b3a.21.2026.03.11.23.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 23:34:54 -0700 (PDT)
Message-ID: <0bf0a64c-0f05-49ea-b7a2-e1b1345a3d7f@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 12:04:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
 <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
 <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
 <316fa702-6cd8-4842-aecf-c176a5a53e2e@oss.qualcomm.com>
 <qvuokwiqllm6zmlzj3pfvziylrr5krjya5rnf3ojeycdoutlro@fl5qukh4vorm>
 <5486697e-d02e-4b12-9a60-99d0de343515@oss.qualcomm.com>
 <2ho25tzct6t7gsuyufyg7m4a2ikmblhukb4uddwc7p35wd6yne@heippz3lh4kj>
 <465ab63f-3d0c-46f7-a08e-cdc5fc26b600@oss.qualcomm.com>
 <73nfsa3r3isf2shizemroctjpleya4wnnel634g7b5qyvvmze5@vre6wrdxxpet>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <73nfsa3r3isf2shizemroctjpleya4wnnel634g7b5qyvvmze5@vre6wrdxxpet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6913j-1vNaThWqaGQbm7Re9VV-S0259I
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b25e90 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Kc38NYG6zNWDZ5XZA/lzmQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GPwEFdiLN6RVZEhl-y8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6913j-1vNaThWqaGQbm7Re9VV-S0259I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA1MCBTYWx0ZWRfX2tqgUj/GH9Y/
 4iDu/5tOxQv5XGoV8nhXz/gmvEdN3JnwfdusywJhtzUfpj5/ma17qMSa7Tkp2loOncakCAIWXPt
 LjWqYcmcf8KQtH0Q7gj0t+cVCW8QkQDyM5705qrcw68yjJja0UO68P3Jc5X5rzAxOpd3HzbmpwO
 5mT7BE8BlZBM8ZcWwn9YpYSg5EIdqGejEMSSDsnEgTk9zLVLYL0quWHQOAz6IU9i/kPJwuuLMT4
 3dcFaSRsen7g5Z6h+N1mj2+Y147gMViKxyZv1+q9C7MPnOplmgEgInnnbVnqPagwIvw5iQeEr47
 H2Wd0Uve0wWVCMQY3eDqqmpx1w4KAj3W3f3dckvqY4FlWu7EEj1ILYZBQOQBeIcuB0DAMiEynTt
 3U9R71MOXWxbZ6mbrOREki3eqL/4RjuGyvpPypP4XbmxBh/H4UITAN+ImwAjGh1wOzxWLtJTpy9
 a7I2Ur54qDhOkDXX39A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120050
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97153-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B16A26DF6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/18/2026 5:49 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 12:15:12PM +0100, Konrad Dybcio wrote:
>> On 2/4/26 2:09 AM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 03, 2026 at 05:07:11PM +0530, Viken Dadhaniya wrote:
>>>>
>>>>
>>>> On 1/19/2026 11:59 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 19, 2026 at 10:21:37AM +0530, Viken Dadhaniya wrote:
>>>>>>
>>>>>>
>>>>>> On 1/9/2026 7:35 PM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jan 09, 2026 at 06:23:39PM +0530, Viken Dadhaniya wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
>>>>>>>>>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>>>>>>>>>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>>>>>>>>>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>>>>>>>>>> Normal mode during boot.
>>>>>>>>>
>>>>>>>>> The main question is: what is so different between RB3 Gen2 and previous
>>>>>>>>> RB boards which also incorporated this CAN controller? Are there any
>>>>>>>>> board differences or is it that nobody tested the CAN beforehand?
>>>>>>>>>
>>>>>>>>
>>>>>>>> The behavior is consistent across platforms, but I do not have details on
>>>>>>>> how other platforms were tested.
>>>>>>>>
>>>>>>>> On the RB3Gen2 board, communication with the PCAN interface requires the
>>>>>>>> CAN transceiver to be in normal mode. Since the GPIO-controller support
>>>>>>>> was recently integrated into the driver, I configured the transceiver using a
>>>>>>>> GPIO hog property. Without this configuration, the transceiver is not set
>>>>>>>> to normal mode, and CAN communication does not work.
>>>>>>>
>>>>>>> How do we verify the mode on a running system? I have the boards, but I
>>>>>>> don't have anything connected to them over the CAN bus.
>>>>>>>
>>>>>>> BTW: can you recommend any simple setup to actually test the CAN bus on
>>>>>>> those devices?
>>>>>>>
>>>>>>
>>>>>> I tested the CAN controller using the following commands:
>>>>>>
>>>>>> 1. Loopback Mode Testing (GPIO hog not required)
>>>>>>
>>>>>> ip link set can0 down
>>>>>> ip link set can0 type can bitrate 500000 loopback on
>>>>>> ip link set can0 up
>>>>>> cansend can0 12345678#1122334455667788_B
>>>>>> candump can0
>>>>>>
>>>>>> 2. Testing with External CAN FD Adapter (PCAN-USB FD)
>>>>>
>>>>> Thanks! It's price doesn't make it esily available, but it answers the
>>>>> most imporant question: by the USB CAN adapter.
>>>>>
>>>>> Did you add
>>>>>
>>>>>> A GPIO hog was required to configure the transceiver in normal mode.
>>>>>
>>>>> I'd phrase it differently: to pull the transceiver out of standby mode.
>>>>> By using the GPIO pin you make it always stay in the normal mode. It is
>>>>> fine, but it is not optimal. Instead a proper solution would be to use
>>>>> the MCP251XFD_REG_IOCON_XSTBYEN bit. Could you please instead implement
>>>>> support for setting that bit, based on the DT property.
>>>>
>>>> Thanks for the suggestion.
>>>>
>>>> I tested enabling IOCON.XSTBYEN, but on this hardware it doesn’t bring
>>>> the transceiver out of standby by itself. With only XSTBYEN set, the bus
>>>> remains inactive and no frames reach the CAN adapter. Clearing LAT0
>>>> (driving GPIO0 low) is required to put the transceiver into normal mode;
>>>> data transfer works only after LAT0 is cleared.
>>>
>>> Why? It should be doing exactly what is required. Could you please check
>>> the voltage on the pin with the XSTBYEN bit set?
>>
>> If I'm interpreting the datasheet correctly, XSTBYEN only muxes the pin
>> into its function and does *not* actually impact the operating mode,
>> which would match what Viken is observing
> 
> See the "Family Reference Manual":
> 
> Setting the XSTBYEN bit configures the INT0/GPIO0/XSTBY pin to
> automatically control the standby pin of an external CAN transceiver.
> The pin is driven high when the MCP25XXFD enters Sleep mode and driven
> low when it exits Sleep mode. Standby pin control is not available in
> LPM.  IOCON is reset in LPM and GPIO0 will be configured as an input.

I measured the standby pin voltage with only XSTBYEN=1 set
(TRIS0 left at reset default of 1 = input): the pin is HIGH
(~3.3V), meaning the transceiver remains in standby.

The root cause is that after reset TRIS0=1 (input direction),
so the pin is not driven. XSTBYEN=1 alone has no effect while
the pin is configured as input.

Clearing TRIS0=0 (output) atomically with XSTBYEN=1 fixes this:

  regmap_update_bits(priv->map_reg, MCP251XFD_REG_IOCON,
                     MCP251XFD_REG_IOCON_XSTBYEN |
                     MCP251XFD_REG_IOCON_TRIS0   |
                     MCP251XFD_REG_IOCON_LAT0,
                     MCP251XFD_REG_IOCON_XSTBYEN);

After the above change: pin is LOW (~0V), IOCON = 0x03020042,
transceiver active, CAN communication works. Verified on RB3
Gen2 with PCAN-USB FD.

Should I send a patch implementing this, gated on a DT property
such as "microchip,xstbyen"?

> 
>>
>> Konrad
> 

