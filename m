Return-Path: <linux-arm-msm+bounces-103174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLsfIq9q3mmxDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64E3FC8BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00EA130D61F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7363ED12C;
	Tue, 14 Apr 2026 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kq5tuOoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAWEz7PL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347953ED128
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183624; cv=none; b=ma684owXkY/8On04zjHVPqgnjZIQX8RQWpEp+iPf/7g806QFpRo0UocfDKYuzKPy+yW/cI0VS5MzuG9FcYuQMV89Q+2/fPKF5UAtQEXkHOWv5u+JmWU5yF0q4g73AdXCQL52JPJN5UtRRBZiFi24ayMYtXbSO/dhoJ1tIIDmj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183624; c=relaxed/simple;
	bh=VLOrh/DAaupCMyxhjajp1MBq9fo1bIYtFDSr1tCSkgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2F6JEo//lCvqoCc7M0sOpyTw6TulXavaauG3Z+W8lANy7I2/gYCGq/daFuf9foo4D33Dx6T28rJ0agBz7jznI4np4HiIY03QcbsgTuf7XRSyiT07G3qdmRUf+Oq8/ztz7a0NsCoox2IgMNV8m7Kxc5ETtkXlaoUYrWGYoiH1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kq5tuOoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAWEz7PL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBJ2Ap395284
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTILk0FYpIrSpU3X5uT0eqdKq1WJuA5TdSAFh73KXVY=; b=kq5tuOoLQCcA+hVI
	64/KBWDulDLg21o/D8HD099MeyyVsAmviYCTrzjwAep+QRDpyv40ERJtmKWEiGPg
	UrAeDdosmgnjmGL4svF1LT55q/uS2loQO72l2RrRh2Cwbpp79TjzL40yrhlQo+8H
	WldnqFMK+cKbrjYpBNff78IV0cpm8aSiSCyxKJsuacJJ+vM5EJY5pavpNUBdG0r7
	FYN1+8Gwk7cD6U2/Xo/JnSlhF4h0GZiIe0p75VMN5GKCyyL+g9zVManPD7TGYfA8
	MJZl8HQzAJ1QuQzAW3mF7SNmcEH3WUu9f6EYDl8lv2DzS3YCrNKlbLKz2okwK4FB
	35FZvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870uhcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:20:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d4c66096e5so63196485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776183620; x=1776788420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTILk0FYpIrSpU3X5uT0eqdKq1WJuA5TdSAFh73KXVY=;
        b=VAWEz7PLyvMGYCjSmJjp6UlrsCCJ8j4K7K9rhlNvVprOwXEO94g2QhJpJvggssG+AN
         0rDp6ZXis0uvSoBNGSHy/7vegbU/jWH/e003tsH6EVnNIYTF1qlWlwrt95T17uuFHjxs
         0eHHDgF17CjCY02Q8k8JZylaa47SpOaES83g6LIaqgIeID8rgg6C1YYf+E1u0UtJmz/O
         vBDLrsDN7FYTVuZetyyK/+6sZ8I2J2EkjNFhVnY0N/j4CtWPEf1ZcLyjwAoVH4r49kMu
         P3TGBUa2kG/4Eq1ZlpuCn/zBjCd2hlCQF1EaeSwehrQ1Ff4yBMbK157dQV7niNMiSdeC
         u/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183620; x=1776788420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTILk0FYpIrSpU3X5uT0eqdKq1WJuA5TdSAFh73KXVY=;
        b=WRqjWWlORmKG7LwHsIVXIpD5CxUQyRNDs6kMflS4/3KA+g2gFahqFx1Fay2OEg3/mL
         s5bjNtZIFqk/PcLYP/QLq3PeqyKdXeAnOOFbqO9Xq1/nJkhM9dfS9bqNCquN1gfakuhU
         J5T8EXXcLEx9t+4YvyvZ3gB2GWKQiAaWDIyHqi54f1Usda6umOMNfZ5tAfBXNoSUPyXD
         peqEalqoQpYerccfYQBa28YOKmOfUgnIpWONXx37Io4IdkwUy3+qtwmHyWeu2uutCJTF
         F9iChil82P7D1uJSU7+qr5/Y3IPfwE8BTVRBs4aw1SGmty2z/R59j4t8tAu1NZfsMGtt
         yF5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+NG3fVukKemxn12pf0DXVMLuHeTWqDX9BtD85bGUsbSN/wcF5WgCyxXs1dbp2jVo0nJgn+zNfiUADI3OIE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rKPltAgFYho60AbcZmjrdlnFfpdUnBnvXoBUVz+USIVj80gJ
	EtjJGlc7WC7xxQAIaTto5JfDWrU336M+JwYc9GeUMRoB6VsFTemhH3PthM3oeCY7lCqiOXyBUKw
	0lQU5QtEqTKP6y4MaYd5OceC+2QJmqkEAvhz0pPLuRnWB8GPqHVfXHmVCNxYX5uNqCIof
X-Gm-Gg: AeBDievcmyalG2Bon1+MpeV1pTlKtt9YEhWmSP7ZJZJeGZxDEAQbSJko7d6Og0u1S/e
	GjyRULbqaNYAzwn3wG7dSLD3fntbMrOWYo+ZdUiI8ChbhPBc4oE8i1DX0yrrE5k2fTZoQkDkpyZ
	SYPL0SyWOzJEnYbHrmjsfi/JLu8K0fwr2lfKA385Q3+FGB2MDe0RPARroXCF1XMTm1RIi9DPffG
	VM8N/B4BE45vxu5yY5Apnh3lqC0pdYgTGFff068D55kHv3rwlEta01D+rDwAiF+Olh/fdPc+/Vv
	/nwypfbc+DL1C2N92jA6aTJsOvxuJkw5mfWLUjNvmy0ly63gEPZFPTZTZu3vHVAKLpCs2Y6yMci
	qt33/qQgpK8o+6uVBwiIGJ5fYmLauUNh5P/FqKAZnWLNl+8cPuQCIutIcrqfybpY/rs6iIN8iA0
	afMEZn1AIfdAWHRA==
X-Received: by 2002:a05:620a:471f:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8ddcffa143amr1838826785a.8.1776183620268;
        Tue, 14 Apr 2026 09:20:20 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8ddcffa143amr1838820385a.8.1776183619621;
        Tue, 14 Apr 2026 09:20:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec2bsm3136532a12.5.2026.04.14.09.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 09:20:17 -0700 (PDT)
Message-ID: <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 18:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U48UQbnKg4GtL8hP4JdOXNJrfV4HrpHZ
X-Proofpoint-GUID: U48UQbnKg4GtL8hP4JdOXNJrfV4HrpHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MiBTYWx0ZWRfXzOf4uvF59e0I
 cDT6ARcqfs649ugGWxLSGPNgMvmCSd7NEcAmOSZFTm1GDXr37XQ0K08OGRdHI8NA3N4g5QLLANH
 Ev7sNqpCxJiVNlTySEno8hf2ZQLzwK9k9CiDhwv2WYB9vJQDHsaNyf34b51/b1aeeR/UeAtMHWs
 VGRCvUzGkJqIcSsZ/oTKtppqjaxd1j7JRnXkiFgDEj/aUsO2qGImibZuxyUZ6mm6iuROH5yAh0g
 fgy0TP9M2Pk3nRffGVwyPRHsrHUnVC9vUGGnIFxSaBkflH4xrdv3KVy+iWaHhtIZa3nWJppKDwa
 iV/zlNoJh96I3AFZnU9Z3+3lXZx+1pmIYf7AgUiyVMOMYGYYwTMTVVLczHSkUwDCOEEn2T2Z52u
 fnsOFnuYjZDgAGOMR/jHJELQRk8dSyczbwPmg1jeG57gD8fPs1Wi2kHSV+ld4g2Kg+CVHFdCWsv
 aS0P//fPmjO4UV0c51Q==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de6944 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=u2dJk7Tg5QFwAKt5hE8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103174-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3b:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF64E3FC8BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
>> Few CAN controllers, part of RTSS sub-system on LeMans, route
>> their RX signal through a I2C GPIO expander at address 0x3b.
>> RTSS subsystem is an MCU like sub-system on LeMans with independent
>> booting capability through OSPI interface and supports peripherals like
>> RGMII, CAN-FD, UART, I2C, SPI etc.
>>
>> Describe this hardware wiring by configuring the expander GPIO 4 pin as
>> hog with output-high, asserting the selected line during boot.
> 
> Missing platform name in the subject.
> 
>>
>> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index a1ef4eba2a20..b8371bdf9933 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>>  		pinctrl-0 = <&expander3_int>;
>>  		pinctrl-names = "default";
>> +
>> +		rtss-can-sel-hog {
> 
> Why is it being described as a hog rather than a pinctrl used by the
> CAN device?

My understanding is that the CAN bus is managed by SAIL ("RTSS")

Konrad

