Return-Path: <linux-arm-msm+bounces-94884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJfqBPxvpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:09:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 715391D73BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28C263040217
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C27735F60A;
	Mon,  2 Mar 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+EaCYB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWaLd7o1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2832C3768
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449689; cv=none; b=VWHdj/O0iysiDOEB5gp3QO5XEsE1G2mc28z3J4mAEeJ+RYMsptYtcV6ezChWFSsbEDQzP0hJjXcrzoFTILzGe7PrxrK19C5J7huwlTA62O1lBr/5ZCYjKXdzJDQJ3nU8dzq6CtXG65eZiPC9KwP2OBIRWxud8yWXfkVUeEdB24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449689; c=relaxed/simple;
	bh=ohirexlvJUGgcHbY4zgWG+elD++b58Hf0P7LJUQ8Y54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlN30julKBCsB/Kh56NELUUGweGHXm1NAUy8KokngUF7soLCuz+gBdDZAx67lDwga+qrFf8TIKeY8RVaBAWuGMuwFQ4+MHwnDzVklKk8WxUJ4CrRc2eqMryYibwVUCR51QltZDLKXi68pmfMqIwoQTtR91zRxLFvNPVq22vCtfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+EaCYB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWaLd7o1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kIR3753339
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WMaQAPAGqlWRuoGlxHXE/B8+bDqLpmyBPFeYmr+uyw=; b=i+EaCYB+r8cTGvGz
	oe8BN0j7x/YK9dVjVyAMDTUE8Rf6crtaaENULqbA0k5zR6+W8Iu/NIdwqj7cP5/O
	PXC2dxSt7ySvpg+wO7M0PVFhVc/mJZaaBcyyJRnyzXGKnlbLC63HniEhRZNsEibM
	gof/b6125DJxJGviQfiMdYXJyj6Pp+5GRGyis5/yEgbCw1Ms3W+9fkrMhXpHIll9
	w8uRUoXdAnAAopASoEW3gU2HZOxyjYIQZZunb1nqtb5UVXw+C7d/0ZvhqqFkTlqk
	1MnFSWK7zUCwIcWRRMBPbZT6t1sj/O2fN3xZCdxhG2zXZt+oEL4mwUrmTT0iAde2
	pRsWJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8ev9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:08:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso387085585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449687; x=1773054487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WMaQAPAGqlWRuoGlxHXE/B8+bDqLpmyBPFeYmr+uyw=;
        b=KWaLd7o1QenpJfAdXlfKGJBFV5j5e/Ki/m1b4uCLLr2aiNf+bmGGFHE5ggG8XLI4iz
         MC34LHKdlTebrf7vpIW1IcCvgXt/mTz3Na+zwPIuWkkCdNdN4foDr1m3+VBDXleSB/yV
         j1fbPQuS9dvPHJQ4SydDfFeI81OeU/hsevzaC2Wfl2euE2sagYxfyZtErmRWYXw1gIku
         Rresg19/Sy4jhUohB9bxAuNsWRKiAJul5guNCMapfUt7JIEVwgFPTSFs3nTZjIMOGPDT
         qbRC5ThDUtnF27fOcjTqHoix7E7YQ5F8lTGXCH50Yj7Herd3GMMSwbEMljiZgJRzOnF8
         RQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449687; x=1773054487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WMaQAPAGqlWRuoGlxHXE/B8+bDqLpmyBPFeYmr+uyw=;
        b=Ou1HET4oqS254vxJ0n8KOBY105rZcW9DkfntZO2m4uRnJvNXcjasTbSC0a1vAv2XwT
         FthVSnL6KPtko2xvXDrivFHm0jWSCn8YAQjWv1q9FGhZayeJQxWO8CDu2qMUnGe6vcSU
         pi2ocIUUHmpg5kFEgpbJE8IHY6SFgM1yy0/OSToqYjBEI16azfYx3GD4UaET4TPiiEup
         2E2qhi9pztHLTDpOiPV9ZpUysFHI+tOxOqyBwoRdsfM9Ku/+ROUxOM+d0a2r3ab/m6ZB
         Uw9S5vqZ22HTl3IU2gC3NRWr/jRlRSM3rk4nU5OWPGP2Z1uvYbIR8p6OuI92TSPRtMZC
         7L0w==
X-Forwarded-Encrypted: i=1; AJvYcCW9gU77tgoHjv/lrRDXO1eDk6v2EVPQBTrz2fCv3KhqjSsx8P4C68f35mP6lX2h8m7cupM3pEvz2JOjjpuh@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+nrUrAONGIWFZGYOOg780UjtYqAt5nUi6mcp22B8UE9N21Lz
	gexQOmCt0CPuQqYrD7Y+xko7dUTo3o7xxxYVIHhLxuVryPxp2k+cI+eW5OTgG5EOKmue5f1B5XA
	7a8b/M7aX6Pe4GGguY4ZeWr2N6HkSaMhyLQFqP4Vpia69ODQQcc0lsrjWDxHlB1HtvQen
X-Gm-Gg: ATEYQzxcUFEeDmgDfEnp2Yi0K4YyO7uPUs10Ffyt9ySMut4E8ZGA8HHJ5NybOrqOAGl
	W4BMHOeiQimLaz/HKfqPU1kHDjONwsda39sEc2jabV3tkG0CFwojA/770LjlujAy3gfZ+APNv8h
	cHmDGPPzUvMhm3ufzs9Y1T1BQ3dFNRUObkMM979MGdNoCDG51nLV7sNNJ5PyCcL8ZaTUxM2K1j9
	fnq+Ehhq3be359dMMfiL/uiQe2Bkd7bMhD3KI2xuxqq8qJVgAJjdO/7/BnXDep2NLwuXmRe9AAf
	mvxmR8Wzc069I71y6ltR1lwjpVGRUIe8Bn/6ZQ8gHAYfrNdM2TwtOf1r+fz2QjmEDao9G+xeLkt
	tXCdoDdZg1CeyKM6ijXBz7KZU75Yg+dhl2dvEf9EovFEKGnVtEnrCX66YH43sUEJd1oeUKBX+KH
	pb3P4=
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cbc8e44e19mr1221647085a.2.1772449686827;
        Mon, 02 Mar 2026 03:08:06 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cbc8e44e19mr1221644985a.2.1772449686402;
        Mon, 02 Mar 2026 03:08:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd4695bsm3425919a12.12.2026.03.02.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:08:05 -0800 (PST)
Message-ID: <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:08:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tgNMW8zbLt2d8jSCIC7mtAtRsfGu97Ez
X-Proofpoint-GUID: tgNMW8zbLt2d8jSCIC7mtAtRsfGu97Ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MiBTYWx0ZWRfX5Pe3C8lD1oHb
 hCxxiZDawwZHxIMMsi8o7mFJafM2T2UhTFSY+TTwUJIePrReWBuZ8JEAFl4XSepJ99xts5a8Kxd
 r5R8oQrzVpHp/gXlx68OrueE9MiB94pTBoajbsqyDCzaPMDjDYmkqYLhyc5FkCNnoO3hewXIyov
 qlKtDEjYJ1C74TNNRYeEPYjpYnw4xpiPXEdBPjx7/kADociVx8mUH/sVItg3+8DVx9uy/Y/UCzn
 UNTDq2o1iUXQtDMkubiqZX90BJ9Qi6JOk9q+lNe7vvhwIPxptoSRL34ljBdLvloE1vF6MrMj1ku
 RAWkK8X8MBaQLIpIPlfuhixgoYP/Tf0JDLbBIGgCZittnMRq6sQEtPXkMN27hhklkscegILgwyU
 5gUfCVspApqImoSClmUqaHnRGJVD04wFsROlLEpF+7xpNmr2qsBA2/2csb361uD6lAiF1kcCA9Y
 gcWqlXl/4D/RjYAIxZw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a56f97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KWnYlBp6PD3PWr4rMV8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94884-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 715391D73BC
X-Rspamd-Action: no action

On 3/1/26 11:29 PM, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

