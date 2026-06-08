Return-Path: <linux-arm-msm+bounces-111783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PFndEiGPJmrqYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:45:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB769654B3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:45:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k++ZXwGu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="i46kvl/A";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 595203008D51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD143B635F;
	Mon,  8 Jun 2026 09:45:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25D3B6C1E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:45:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911903; cv=none; b=UKC70GNiHb6lI8UwsGrmd1I0DYZexBHQjnXnMn6kbUGgpK9LPfiiBgMjpt3bKktKm+PzGeVmQh1GMPz5C/KEVKA9sK8Ur7stnOGUQd0TQpqadDlvxIqfHPful2YPAAiTjnES0K5htcpDaY8h/cZe/OzqGC21pe0BhuEl1tUzmpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911903; c=relaxed/simple;
	bh=Vmr+hFusuYAL3gRCxgWvVJ/q4PobECw1SQhrGuoxjwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQeGb7GKvZ20jerwnV93FvhOPVe/1qTjhci4V77EjNY8FhPU4cwbZSMk1muNE5r4tmyalV8jqWjV9K7QhLi8+6NB8ULIPHDdCApyN6jVoTUdq6aRQAJNUsALdLIyl77t71ne6Aq1btQjQ8OrOmikrTBYjVcgB9L5cRLzhDjckQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k++ZXwGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i46kvl/A; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Pkmn2733104
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Tzt3nk2yUkhDZipgo0L0eDdUW2ER5Qt+0SMe1w2hT4=; b=k++ZXwGuExiMngbv
	5eCp4gwEWx17XykpFT6ox05ja+dLT1GGNO2FdEdgO5HCk8dpTmyLAlGWd0KSYCby
	q4+ErgVOsLdFvtFzgi8+aZefsVYdjHvLFvvebeyi3L6Qq6yU/bX0sNiR/ZrMdTjJ
	f3QWiGmOmMAQcUnp/4JsvypxEJ2UA25Er9m0y69WCteH+KxPFlCsrd8auwDLLVEF
	mXrEyzEj48AhsHIXa3QsmB2ZAc+QmYNP0l+dcBfOB3H5LA20juozrFrvYaChA3I3
	IwFAddWNOzNGHQIxyOz8UcfTyGa/sa9gfXAfFA1k+4S395vWcyEU8itHNtkhvSpH
	Ld08qw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf794j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:44:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51757324dcdso8102781cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911899; x=1781516699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Tzt3nk2yUkhDZipgo0L0eDdUW2ER5Qt+0SMe1w2hT4=;
        b=i46kvl/A0fK+YiHst2YWqRKd47oyc3R/P+ML+r/CUu6LwUiD6AYlrVKOK5Kc/rcZZy
         /YNFeU6mQRmUWJwtbCILZEd0cINgffUoQ5lF8NiuSEKCmYDIucQsf6ZTUd43Hx6YHlRw
         5bfBjtGzEmUckzKEbv07BDNx8PICfTtgOo80EP0Scezi//Pk8gJRGuN3tS38nCOAPYkt
         997+7YLSmdNnOkUTVtyN0CLDCRneCly6yx5AM42kmZ+Pspim3aLyXarX6T24jDxy06ba
         rEEv2XO2CHNTs4+gzIv7DdEFh2qHuDqYPTSnqGAch4LZu0fUQ1OVOj+XkUA5BxZsgnQB
         QB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911899; x=1781516699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Tzt3nk2yUkhDZipgo0L0eDdUW2ER5Qt+0SMe1w2hT4=;
        b=Jmji2k9sv3TszQXgTPcKfGl5CIIvIUVSUG366kTwcVnYPcxFnIRIjUnEma7AqYl99X
         WKJj9Hwl1WKR5afI9v29aUWR3b5fEwMiz5KiP92tMfgbt39hReVfY56goujwx2tusxOD
         hJHf18uL2H9BtSxL2SmyGJPTi9YzJkHzn+wMfrqkn0r1UnshYRjvQ0x0T6oNm76nTZJM
         Lo6vq27hi03dxhHIhjirH6+b4jJnRFHGYG/rDPzaue2VsOPRDp+zFgjxK/1c4VsbW8T6
         lJivinCQwDRkYdlgETVJwmBO+Ulpt+q+/lsznlmLtsMvQkwO0f5tZ+lCM8+2wOuVeOym
         Y5dA==
X-Forwarded-Encrypted: i=1; AFNElJ8opqGS+d7ZzZI3OSyZziLV1byHfZcxG/odRdfa6+M/sMNNmQy1ln+5sWCLRTGqsEz4OwsPDVyTV4pJAveT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzc1DGmjoWDXgifG0S3dOOsZd7inZRiNA+rKQwFj/JEa8hN371
	6x53g7qAim5kE0Vg/iFHoUuDHErlJe0FPF8RdeKFlh6sZfXWJvpxygKyv63fYOSvxD9tantzzJF
	99wX23C92Z2SfKy6JXyYHYNrV9zBLqtnwfxN0iqfebsETdCQFLP2oVfpiOPekFm3B/qC1
X-Gm-Gg: Acq92OFGc1/fcO8aNgBcSgGS9+qlX+uhILy16vztmpVeuXLrmhShUcSBA1CEGJKDHqr
	BTKU09ji3RU8KKghM7jjXxI+Vx+5wbViTD8MT2U+lSfDJaafrjo7RGSqYCjVksCWvDjFsSTPl5i
	6/9Uq6QM4LbRfXAyhMSFqzVWdvrYKSKxAyufPuF+8ZoVBYuvnZsgVmrS+Tjj5w1hngeUB/h2nPZ
	a29VGUYqmq055WiXnvmtqDRn0Q1R+htOM9T2C0tmUa7unTlURUkomAudLJSwYI8hdLbTZgOARzA
	Hg977WApYlL4apA9iqFaMQ5UOPr8dBeDzACJGfPiMwG9M3oL4A6duQU1u8RBaZ/YvqwIq73/9uc
	52J/B8FW9yd0sGY2ONLhsvFPdC8uMwphoPLRCnPJpQ5Z4VFR87ZQDwnXW
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr123731911cf.8.1780911898630;
        Mon, 08 Jun 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr123731671cf.8.1780911898263;
        Mon, 08 Jun 2026 02:44:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-691afe82416sm1478693a12.13.2026.06.08.02.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:44:57 -0700 (PDT)
Message-ID: <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
 <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a268f1b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4c8ik4K-SmYL0_MpgcAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: IirNkpkZFb_AN7JLIuUS4gI-co80U6lH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MCBTYWx0ZWRfX1fnfJ8r3SrqU
 jf4bulYVZUisfUm9maQlkAphEIK+rjJsNkb2T5NtLmOhfwCCGseWlvv/fJcRWnA1VDPfEXm9guh
 cT5LTAHazPob2z/I46Y4MkGtTwf9VvpidFFMM+qywIjhl2N/mLd+97xHXYmN2y6yV4eI0fGl+Tk
 v2uuDheiyoi51XbgtrRIbc34fKuv2mxqvEQvmumtd9QlixGo04PJLTm+FlsGQatqdFEzXXdW5fV
 Ab7cmdGJ3/ZklsQQFT4rLfQX38GqqPxdqsS30iaxQwTvytaZE/43/TPpuYDUDghawk2g+ediu/w
 2Sa+DV8Gi424F1Qok6dbMtJo7JaIUAlK7PkigFCatMK3Kvs6sZpNBGUx0PcfRsqXZUpzr0/MO7f
 my/1gD95smVc35PlOa7iNUgH2fvmOhNv5L2Z19ZBlnb7rLWsyIwod4uhyhj/lUcQBWpVZ8WfqGq
 9whxGMkUipawuxIHlvQ==
X-Proofpoint-GUID: IirNkpkZFb_AN7JLIuUS4gI-co80U6lH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111783-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: DB769654B3E

On 6/4/26 1:28 PM, Varadarajan Narayanan wrote:
> On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
>> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
>>> Add DT entries to enable the PCIe controllers found in ipq5210.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---

[...]

>>> +
>>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
>>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
>>> +			reset-names = "phy", "common";
>>> +
>>> +			#clock-cells = <0>;
>>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>>
>> Having a gcc_ prefix here smells fishy..
> 
> Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.

What is the name of the PHY's output in the clock plan? I would assume
it doesn't have gcc_, but it may end in _src..

Konrad

