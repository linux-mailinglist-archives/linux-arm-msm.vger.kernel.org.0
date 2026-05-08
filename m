Return-Path: <linux-arm-msm+bounces-106655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCZbApPC/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:01:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C604F56D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18568300F285
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26D7352C54;
	Fri,  8 May 2026 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td5f4qlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqwGSfH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98731F981
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238066; cv=none; b=tcJKS6ve0XNH9Prva107LSTuJbeU+MAKnVMYX6zugEfR+l59H+Tx1vgfhBSdlpCV2iHQB+M6fyDI6VJzmsBveiNhpE9viGYLj+BXa/5dboKroNZoyf5/8zM2ybTBxTdVP/Kf00tX1p81180aE+nbZLQIUHBUK8aomkfTXiXLibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238066; c=relaxed/simple;
	bh=QofzOtqf/V4gHmLyAulEuCeCZ9j7pShktv4meKIv4BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRpRhvn/Liv46+0YgNEiY7ibc6CLz4PP6dvjoTMvHEjiCYGvcFCzs3rcEwe2oDLYQbP6Z2GQF1TWugZNM3fd1Vej4Wp+6PXR/qd6sPprLCCJawJHCS7WvzSrXOSinruZNafDgpFLsdp55VfMrq5/soYlkwI8GVfwYRSB1ctLqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td5f4qlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqwGSfH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGfN257891
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=; b=Td5f4qlWDdrmJkuV
	x4DYs5ge5ttIZZPnydPnMmnYuRFqiDv/WL0JZaatMacWzS9aW7cu7KcZsNjYCdek
	nLpLd9jApasEqf75FIokuOETZZHneesctNNrrDLK7+rUsFklnsG8Hf2Z0chH0vIe
	dyQ/ARysQ+kZGS6QrPLA2ZtN4l+v5txkT5ew28ANBEwUtMd6/jW4VJLYWbpnviuW
	d2R+AaVKY/Ze4NdxdPrOjyJyGsj8y1BuXy8B03lCHDCvZ5r0IsIP+n5o27h+NFKL
	5cV8eT8OBT57k3EW867vBGH3546i3HkMZomCg9DXrZ1l7EHuTHcACRn+I3u98sjn
	HKhHjQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegxre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:01:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6110e7e82b8so155541137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238064; x=1778842864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=;
        b=hqwGSfH4Ank2RjjMVVjsCrAOZc0MhGCEtDD9QnjjgFPwEkl1MF/THL4G3X8GbqCCAw
         h2/dFSw3nyV7iraaDVfgTIQze4eyQYH93fPyBT8I1Kn0lfpNvy2x5jl3sZNTguJ4XDQK
         79QcGGPYUfS+kwtK25kXw6Mdm9naCHXU9H5j2FqAQRnwPcI4dYe+xvFGCp/svy4G6MzI
         gO1J3FzdK0oaQVnThzMeWWpCvlMkOTVEQreZynrg3qugXIQrC9cQAMnG2nSixGVHHwH1
         tTJIKGYn/GOxlahp4sw/nxv+M5F5U45PtHqxQ6NRkmGJJwneH+O6wO6RAxbNA63+BKDU
         n7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238064; x=1778842864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=;
        b=iFfZ77VbnnkDwnsndTey61b1S8lAn7mk/aCYZbL2EqhMd+lDBahk+Q1sWpLshkbgIV
         n2q2osWK1Ltw1jE8MTBzJJVDIrEQCcBj80j1NJmU184XZLjoZ6ymLIzmNXEHJTZxx2x4
         tJ9LF76WUYhuLW5DLmNAMVcJqU5kUnCZR08qxRM8kwECSBMAayYRf27r8xSOnydF4kxi
         Kn579xwj5mZW0n4L2+6KYwUNNmB/U6g9aj/UB70dld4qCCiY3q6tQcq76x3J2LzHbRv4
         hY+6mXN3ND55bBFw+FX2pXpA2ei3e9qcOd/qvyaqXZn2XdAzhCqFKXi6nQt6YM53xroD
         uH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7lnDuOlU4Z8f9JsdFa5R3PDLCfH+yQNnmd7b87qBSwtcD6D/4lhj/AuetQSzIUVQV6w/RbfTQYU1DlCzz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyp5TnEqrIXK4wg6FS2zBZ8wQ2IL+WnkT/NRmhgcJ1VGvsmHNX
	6MwxyEklRb8B8cZba55Sqn0eI9GRElQwlY7P+5UYg+MdKF5HEgwY5QwegoUu1z1bs/ulTp7Iims
	LwIHxdB7CGVmPD0+HfAHjFakTcRIjhGGC63k7zj5vuIP0z9Hy/jhTjgTQw61FjkJG14kN
X-Gm-Gg: Acq92OHiOQzCacHDVe8mv3IqGA0g+Opp6AGLfvZiRLCGOnBdjtzKEBV9coc0/Kx9Qlv
	dW2xP4VrQFf4GZAe8oUeNKuXAcNxgi0H0aS8bO25KLORcZC3+Dv1QTDh5QYEsi3B/QPlkV/F8C8
	Iu4tKbHWn1JFbk9cCUgmqLClv0ZjgcGGVHi/oYB7q2sULU43bFyWDw0NGNcx/Imlo3FszovNLGM
	NsB+uUJkLxFgpYuzaCzQeBDUffGFVb730dUAQWbTavhB4ARGs230TcNkG+TLRspLWQEva22j+aa
	DfQyxM+9d/6poD94JSrGeVSngkbovWEgDAoI5MF2diPEcTzWtjPH+uau/MFY4bgjEmHgCH1Pcnr
	d6T1LzbNO/oz7fqsIWWGiInHpNNFH4p0eoLgLywRMQDif56e26NGn6susZeOzGc5uToywLdChsO
	H2dFgvKdw02T6ejg==
X-Received: by 2002:a05:6102:94b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-630faab2acbmr2426735137.1.1778238063706;
        Fri, 08 May 2026 04:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:94b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-630faab2acbmr2426711137.1.1778238063246;
        Fri, 08 May 2026 04:01:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac48381dcsm69256666b.54.2026.05.08.04.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:01:02 -0700 (PDT)
Message-ID: <790183c0-104e-462e-b107-748fefdb8a85@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add initial support for MSM8920
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Catherine A. Frederick" <serenity@floorchan.org>
Cc: andersson@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505203845.192140-1-serenity@floorchan.org>
 <20260505203845.192140-3-serenity@floorchan.org>
 <20260506-berserk-charming-tody-f9ecc6@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-berserk-charming-tody-f9ecc6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNCBTYWx0ZWRfXxjkyCcKCAO5M
 4o6lrA/dJi2VG0anCpVreNZekqVgAxwUyTwWXkXzV420jhVELpN4a/S/GEAMK7G9oHOcLWY2kQ3
 rmXmV+8tutzJw0omY3rMtvvytGL6EkX/fbi9CHMjaR5Hx092jObPOBNJQ1w3KQjE9/X4DIHDzcn
 HgjaVUSwldjrENdf1Tf80LROTaPrvUgBIk0ckYDDJZ9e+HbmMfIy7ql91tvbCigaQdXE9BleLwH
 vRRNO959csRxXaXo7mBhLPeF7B10wEz3q0cOLg/RWDSFnJskaNnr7vMV3zNx9zxRsRnUxxj7Nkt
 /s2iJgW/knaOHwhqnRoGTRs/32NWxUqA4JnmFj7FLGW9uEpiFg81eMHs+4aFRTZDk7NDkQKtDae
 S7WuQeoglArsCwrUiakbXmGh61eOfVURsvDKoP9g9cwQ4Dn1kNR9lCVZ5hGYs2fW6luOCwudaL1
 IpX0PAI2fLBKPEVt9XQ==
X-Proofpoint-GUID: aMjb_F-ejnUeD6jYk8skfLeajDKl6GaI
X-Proofpoint-ORIG-GUID: aMjb_F-ejnUeD6jYk8skfLeajDKl6GaI
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdc270 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DhTvykhhAAAA:8 a=N4otaSFRtcR4xJ013aIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080114
X-Rspamd-Queue-Id: D0C604F56D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,floorchan.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106655-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 11:49 AM, Krzysztof Kozlowski wrote:
> On Tue, May 05, 2026 at 04:38:41PM -0400, Catherine A. Frederick wrote:
>> Add initial support for MSM8920, which is essentially MSM8917 with
>> an MSM8953 modem glued onto it.
>>
>> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8920.dtsi | 55 +++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
>> new file mode 100644
>> index 000000000000..943cae72227a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
> 
> That's a dead code, unused. No need to add it.

If you have a device that will include this, please post it together

Konrad

