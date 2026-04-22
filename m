Return-Path: <linux-arm-msm+bounces-104080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G3nKmys6GnjOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:09:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23581445215
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFAD43016482
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAC03CAE9A;
	Wed, 22 Apr 2026 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu7XJdGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKpA2hfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729661E5724
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856169; cv=none; b=Ea3C5LMtKCqcm1lsy7o//kVjAS5bmQU4ANJAS4NiX6Wfh9F0s2GyJk87vF2KnfRztyDaXD4M0/FJ4dBqjHlWLomkeJb0mQaUaSfJ+d/BwuR5wWBrAITb9FrW2ao96+N5YqkvOLl6RPJXldMimk4pH7Zz1ZUmJutQ+8ku8Q9gh6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856169; c=relaxed/simple;
	bh=72JoqMwsltRpT3zFcFSpN5Ws5LAlNF76SrnTFwccfOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh4kv7lhmhAYYimXOVVfzqU0xF9rtIPQi2vM3DBvG/Jsr9iyoElnP7iZmAexj/mlfL4VhiCdaaMgVZezy4DD0T3G0iXxPYEsLcupo6ictEgR5vAoihvp+v3434zmWKhG7gCH6jjL/QI+HMBPhGrSVHIMuAJfjuk/IJteQunbls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu7XJdGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKpA2hfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M997qM2064802
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSwLOQXLC2qJRoN4Zidcq5xOfdg4BnE9srb5BQnSaBo=; b=bu7XJdGQ9XAvJMev
	xqha4Ro8U66PLjoQKupSdHTSGoPB2NT0LIuh/vH1Azha3SfmBSU+nfpRvlW3GfeI
	9+bLcrEeGSZd1HupMaLPWrguUPe0/8RPQVYmDgN5hvxu7CMDxHOOOTqvb/n75HtX
	rZnoXvyXnRRGHOAxvavMNCar59U7vLyS40WYjB7q6NFZhR2KVVXW8mFvY5NIoJPZ
	VQLGO6dfA57xZY82oupWlD9NqbdVLr3FrzQoJ9oc7N4pK5TzxFp5Qd+iOkDt+4yu
	pAiqD5jCYmPIXW5bMERmEMXbd7OIPSVP0jZLBHFdkasou2jR6TJSWL6Bdj8lGpl5
	yEZbJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhk47y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:09:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so11317141cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856167; x=1777460967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSwLOQXLC2qJRoN4Zidcq5xOfdg4BnE9srb5BQnSaBo=;
        b=CKpA2hfrQaaNav4AoNsUFfbBPbAj6kRteJQNv/Sjf4yWTxAGNb0oAV7SOcmxRSZCLi
         qaceuo/pJkbqgRr7cel2uSQ4F/9SaCqaGvLHiDcaEGrQwKKcnWTBRgelfb6Tp6S9LNlD
         7dkJ0RyUVrE0nkC/iAkHZC+f/snpkjeZH8MFRu9yJ1pILx1aBjPnHNUwydg5EpZfgoio
         mM84Pa3dN411GOU2Md4eILRHOFmh+yIOiHT8YMwZOEpeli7xYpYXkqI04XOGS7puveqd
         sorUmNmJjPA/DIxtxAC5vzVcMl54N+bGqjnG2lxTTw1A0jjZdwIQ6tVYxi28VE3qu2Lq
         eYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856167; x=1777460967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSwLOQXLC2qJRoN4Zidcq5xOfdg4BnE9srb5BQnSaBo=;
        b=Vrxi98CamdusYSvU+1GiiGUimtWWkvF1xK51tHnGZut9esYl3cV9Rgv+MvrhQlIYHj
         w6myinwa2mm4RkEwWi1z7Y0FHLy2JwibZMDbMc6ayJixxQRQmqy/sxL2pRLBv+B/t9Pf
         4Td0+NX8q1zTrMdgBgkA4ZjQoTUuDvfKzAdlxtAVeD008egcseP7sE/19YfGaVusKlG7
         75kBypDlKi/C6ucTwK+goch536viEvyzs5Qvu6dV0c34J5yzs2TajhGANic/juz5wo9A
         qRWpE0Max8ahIF3yELEXsUFsjMrPupSJ+HK+9iUh6s50/NLK4IRR9FbehqL+JW/IGTNS
         BcMw==
X-Gm-Message-State: AOJu0YxZfVjj9ZXB8uFsGfEqaP60pL5WOXyTU3JVqs/T+RIRwbkaBfXk
	iwY+hMuQ9Df7Hjf2KjPcq0j3ijuSEnqliPnGfBm2RgIMff4Hz5XU83KeMjlEfdTBeC3UufAcb5h
	smoQUqyUtQ5UE6qr54IkoFMuhyFSROpOcHjjAJe6eqjn5w2MyYwg8h7dHvVLEb88PraNE
X-Gm-Gg: AeBDieuSULPbL6JCbZUMtVAlji6aeH9ojyrKh9yRuMfcFqY8EaIJsDc2LhrLOfNHwsu
	2H6HkmwkfJlhl2CTfcWWVE3D9QsHnpj1Ege5/iU2yZWIOF/9eyB1BzeN9jlrPlfc7TH34ckaaU0
	di69pKnJmjmFOMJmh+y1dwaBZQS+rDa4X43yeGw20bYP0lWc01pq6Q6xPcz1tHMiE2JYZuX0CrL
	zZqHMoW64unmeb4V6dDr8hPP1UhTDEJ/oOuQGJoFlW8YscLVJstRt+uKJ7J01CYCQ2nOCHmj1sX
	1VZHSwhVLgGBjHCqb1mTbQZtTKqB5O7+stNV0fdAQHeV6MZb2Ul6tgnYJqXRRztemxtdedl5MhU
	gZ4Itul+jiYNV/x82Xwjsx+7p1ZlNOGs6P31PTD1iRdiY6ns3MdxT/uawKOfitJ45tjdgZXt5Y+
	aLGloTDS+h8DSfwA==
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr204989621cf.6.1776856166791;
        Wed, 22 Apr 2026 04:09:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr204989231cf.6.1776856166307;
        Wed, 22 Apr 2026 04:09:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm526045966b.42.2026.04.22.04.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:09:24 -0700 (PDT)
Message-ID: <efa2da27-79d3-4cbe-ba3c-2446c6252058@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
 <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
 <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: be2XFU83KUWrJoHrKfuPXVLe1zAtLHy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNiBTYWx0ZWRfX0dwCTcHhbjNf
 gwevwd7gHRPxNKRWNeuzyJjIRKRE+iahBFlK2VFwcCuMl6a+VTYEt25T7hIE3REy9LpXJnQ6I1/
 0TpUoCUSfZuqLZf68mwf3C9xhSy0QxpdD+PZaGG6LFv/sJTpGXfvYkDOeBS+hT7AA4Y3KfoyOB9
 1sR+EGr3Pss0KPE48QwD8T/mkfJBJkb01IUvbfJM1OPDBwj8FPvffe8t1S6p/qCrfDoLwr26MSS
 257XQ42WjH8EaZQf+bPXbssbIxd7EAEcqWmEno3uX93DgBAERhW+6wUqWAHvVph6qneYwK2D+Q7
 p6fNrfPCOn8eJAfroGkf8vq934za0xi8YrpmE9v7he5YIGa/gCqmdxuEKt+dl6hMH7fp8AByZSi
 /EshEKPnv0K1GVdoQlpi4iLb65ofxRiJix/3F0W1RicThLui2V8SqCYag3K6vrs+BKk6TsnPum0
 xFnWhVL4rRB5vSWhe3w==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8ac67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=4kRxOmAj_iLeT8xqhkkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: be2XFU83KUWrJoHrKfuPXVLe1zAtLHy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220106
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104080-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23581445215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:04 PM, Prashanth K wrote:
> 
> 
> On 4/22/2026 4:13 PM, Konrad Dybcio wrote:
>> On 4/22/26 12:32 PM, Prashanth K wrote:
>>>
>>>
>>> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>>>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>>>> super-speed enumeration on that port.
>>>>>
>>>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>>>> Cc: stable@vger.kernel.org
>>>>
>>>> This is a feature addition, not a fix
>>>>
>>>> [...]
>>>>
>>> Sure.
>>>>> +		ports {
>>>>> +			#address-cells = <1>;
>>>>> +			#size-cells = <0>;
>>>>> +
>>>>> +			port@0 {
>>>>> +				reg = <0>;
>>>>> +
>>>>> +				retimer_ss0_ss_out: endpoint {
>>>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>>>> +				};
>>>>> +			};
>>>>> +
>>>>> +			port@1 {
>>>>> +				reg = <1>;
>>>>> +
>>>>> +				retimer_ss0_ss_in: endpoint {
>>>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>>> +				};
>>>>> +			};
>>>>> +
>>>>
>>>> Stray \n, but you should really have a @2 port here as well.
>>>>
>>>> Konrad
>>> Can we ad port@2 and leave it empty?
>>
>> Why would you? Just connect it to port2 of the connector under pmic-glink
>>
>> Konrad
> 
> Because the port@2 of pmic-glink (pmic_glink_ss0_sbu) is already
> connected to usb-1-ss0-sbu-mux (onn,fsusb42). This is different compared
> to other connectors.

Are both the SBU mux and the Parade retimer present on board?

The former is redundant since the retimer already has a superset of its
functionality, so that sounds rather odd.

Konrad

