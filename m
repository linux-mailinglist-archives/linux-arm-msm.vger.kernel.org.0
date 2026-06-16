Return-Path: <linux-arm-msm+bounces-113328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qQCeDb7tMGpsYwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:31:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9E68C876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z4E1uGa9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AKGhLgXN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113328-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113328-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAA3B3005142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 06:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC4C3DD857;
	Tue, 16 Jun 2026 06:31:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B33DBD76
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:31:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591483; cv=none; b=m55Gubtz22Lhn4iLXnSCfNuRkdqmQrtwC4H+SLVRrsYBTbTEJ9TOp4lOHX+mRjj92fp6tLSykP8htogwpQygZG/ffK9dBbKGTJ/WHEqxIFq6TwFvjf4XMroxm9jELRzkl1QkBGQvb+apr8Kkgpb73uxak6V7P0akNd9RjV2dYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591483; c=relaxed/simple;
	bh=Z3e0bPPQznJKnX39huZA4pkckZ33HDN4xXmZ1W1+BLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQfCsE7y0kRuZjy3oXkAgj25OQXeoUSjvbQfqVuygIr+CL0wEB1pOieqcB6lB0fTGM8RhchERGSJ6nJFgE+vsYftw5VqkQxcLYUkqkZ+0PQNK9vqrquXqJXK+WUXPI29LC8cp8O7ef7vp1qMWDy6vd5S2JgBVFh8igdbTncCRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4E1uGa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKGhLgXN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G63wBr2238892
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=; b=Z4E1uGa9F5rkOQDC
	PQ3A8daXDvRcbnk8ALP/AnW7KuB9D0u9lo0WWSoDsPyPqJ/VLKlBWL/KtXbsXwrj
	Do/7IKI7mR5XtP7AUHUFn9yYNxvAg4fpFwWov3BzVzkxCUs4p7TffcB5oJPfgzYx
	VRhcdTXyQb0BKsx+lU3rh3rlNwVCFBgSFTCAvr0vTjKKZMoSJ1MfLHeqjyA0cx5y
	KjjNt29dEHF0oxNcMk/mVh/scMlBpNEY4O9nuzFFGfj5iqMYEeypID8gjrivYori
	HnOrmcJp3z+cxZtsMaKt1kAlibI25GC91boLFomCL1PhX/hOCGVNvMaFU20dYEaw
	5/+P1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7ra5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:31:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a20348ceso1088905ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591481; x=1782196281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=;
        b=AKGhLgXN44OSPXOvwTWKvlJXTO0CZm3ryOkjeR5qUEAx+fRXso5rufINxzUJUtKQ3S
         xnd7BAralz0Z6TJ+cnnS5w6/I7ew+QaNRBZNVMaL+zyMLH1HMF1f+VXZpRHwv+1lt8Cm
         boRsjjE9j+7eC1Dpcz74UTq/8ONoKm1FPpEP8TYWZ/meCoxTv71gCnj6H+x9qt6FL6Oe
         vyWe37lZ+SsYQ7NxxUwfmPedU/d4CW/+IfMzCsYPVc8Ap/X8X2RFYyuWtnbFkJBMOHLE
         pV9N+7XaC65BkdCVRDR493Xa6uWW700rTqdI+b/68wBSJCtD2i3ny0pMSswVfJ0x2UGj
         yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591481; x=1782196281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=;
        b=RUFQSiCCG/gAKt+krTISsdV5EkZw4iS8j6c/ffdpClYAc3AKrmCr6qq5DT5hfTMcaD
         Sa/z1+27URgUQXRxe6CF5EeCwzMy99F9+3VkI3tKOQmNtir7IGn1NvxwahSAJafgFgcQ
         tIB+NugVrQl0JYhEtfqb0ExWVYFuGzKCjIcvdXb+mL5i/o7kejiEmMn0TTtZJqYqJCpU
         2BN1fh1mMgJK8UHkS0vy/dcfusUZAW1Kal7BSiX4Tr9iqdExUWMZjl/v7SqTx157gRE/
         DZsaO+1iYxkQK8GIjrn4MTiu5JNp7JVZqtQqTZrA95xYt928v5LVDTyJNvRhUHe3vEu6
         uDXw==
X-Forwarded-Encrypted: i=1; AFNElJ/F1rReIX/egHhitphm/tBcV2eXpBvMxRno4sRlirKwtPlYEYBLcYeC05lCEV1gv9j/O9gY8JVPhHh8WyeJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMW5gGSY+1bjq86LadR6FeBsLKlDfy4AQIFnhQ0XnG939/AofY
	ZkG0+JBMaPNXTfm4zC+E6r9ouctttIx2IcThRxcT1ntzux88Ce6GgzHTtWk3xKs+7sNg4A4J1JY
	CYX8XXkXh7J9Ty3gKAJQw5cLochQL+3z4dcNxcA8UIHiTslwyl9DyH8GevKvIGSrehWQX
X-Gm-Gg: Acq92OE6Y1fzQPFk4w8PUAPjwX9i0FvqVS227jIsQfOAyT2m+9leQo26jyEJSnaaG3k
	rgROX9J3OMu5l02md8ZL7bj4djqbkgB6NVCxTURX+DHOQ1pVtPjojzTsND4mnRWsDOjJysxmjTh
	Tvl9rc9k4dhimGxb+gY8ssxKvpPqs926k9A2NQkJzR+nx5AiBmPS9ML7NoOTOhiTnPZv2EM7+Ar
	al3hXckHCI1VaUbXK5LWVmv1BmOlNcR0Q1McNzA+5wzL6fIOBsW+zWPx4yrkaxnH/e89RgtJsEk
	I+TUS1/hMicIcnVljxxp84tHbXToXzJm34AjWPAWEly0x3DlJACL9WSAveyp9KkgZZw81Yecma+
	fTv7JB4+k+NggzVTyAkGJtfgVQ7PCcukQmNYJ7jJAKJ+WusOyIw==
X-Received: by 2002:a17:903:15c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c69a186b0dmr24362385ad.21.1781591481030;
        Mon, 15 Jun 2026 23:31:21 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c69a186b0dmr24362035ad.21.1781591480606;
        Mon, 15 Jun 2026 23:31:20 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f896sm10860067a12.23.2026.06.15.23.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:31:20 -0700 (PDT)
Message-ID: <15d5bcf3-6b82-437a-beaf-7a392179c117@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:01:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
 <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX1LC0J37Ozozk
 IHF5qJZYaLAbTxtMO/kAqbY4H8QuaWNmjme3tlMDjf2YNgvgFv0QagTIEcyf/KxXso/kl/tDu5v
 Vh1pVLwxVAzGhd2ECe9ywb3oQgmF4pD1siqTsNfNGP3X4GpXyxbA+Aia41qVVeGnxH4EGhA6tYs
 pm3MIvX1crUkZCE6nMMcXx32avcWxX4rR0R8qFPAToGSSFX6Bd6ZRP02TaayLPWRogXMNKwCoCp
 B2nNWnbNYgkQcDMX69YNeLzZO+2MqBavaz3Gig66PdPtI/Sw3/qZe9EoH64At5iKtrzOG7d3Rpu
 TwhddS8ZV0M7UdZuv6hNPRkqNgeGcJA83Ow9cHNkhG6ZsOLD9eIg3qY2Oaqb3PjIDUsQAFhoXe7
 BznC+La+C0Chq9NzIzmv4yxOZhbk/BW/wsgGGO9czrw9gII2AeaeoJa24HrFpbcMexSKvvxX5xU
 wXm8HgRq7IA9HJ+cK3w==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a30edb9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WANKC8lrEroQgd0tMjcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hRK78NfUOtMtBM4bvs_sAKGK3rKv4UBM
X-Proofpoint-GUID: hRK78NfUOtMtBM4bvs_sAKGK3rKv4UBM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX3x7IpGLu+Swh
 +dxNidXTBzDOeMQUSDJZ0r6v+SG+c3xX53CMmtI0ouEPWLYJhSLP8Km6OqOBZGDbJHZ56rgMNQs
 THEDIqwXjUzOCEYGeLil+cg0r3RiRvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113328-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBF9E68C876



On 6/11/2026 5:30 PM, Konrad Dybcio wrote:
>>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
>> +#include <dt-bindings/clock/qcom,glymur-evacc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> @@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		evacc: clock-controller@abf0000 {
>> +			compatible = "qcom,glymur-evacc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_EVA_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> With the XO_A situation resolved:


Will remove in the next patch.

-- 
Thanks,
Taniya Das


