Return-Path: <linux-arm-msm+bounces-104723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBD8LZpb72mWAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:50:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5DF472C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EE15304F239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC853B9DAD;
	Mon, 27 Apr 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk+T+Hb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0KBxGkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F933BE144
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294014; cv=none; b=NnYHZNAtMYQjsd5LpSR1WJkHxnO7BW6ZCrEdKHDbPQpLdc7NncJE3Bv+23HVpUNrwUPtLKx4nU1TLzpgG+DQNREu+VfLrCcnfMbDCwbkb5njTCG7cdPfU0va34juvP07VRa/fOnKpePZOHHEJEPcwnOEjq896beTZWGHTze2iCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294014; c=relaxed/simple;
	bh=0M5kAzVXT4cXQhL9fA119smW1UaNkZkaabBAO8U7pt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J15Ac+8MWo+swYq4F9eGRFAH2KprFclsi4eSx2zNe7kDZuD7d78vsk2in39+8YFj/kRA/9LxryFMKL/p0xvZ/0daW9hj01NpFvsdVpPFfrQbFd7BlAOEpLzfk6wbD5E2w+aMrm+JB7Zt4LvGTd5ddcv+qM8iALdoHolx2VtiBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk+T+Hb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0KBxGkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kO5u3962048
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9R/1sqwPTPa7QpYLCHOouFuYbh+Qk6HeP8hwDT56f0=; b=lk+T+Hb6rEVklkMS
	5QM9TFj3g/cV9HlUFQKTmOSqsV+7ynVbe6K0gVxmCD74P8BTkPa8Y8P+HybWzprE
	HeBj/HTKuMKP5GTyQ9C4GejKsDID8HIgrmbZOIbH2hIU/i3vZS98hJzf+OWz7/c8
	J0oMPDMPevJHNIJt88w8mGpDhdpq7Pb1eifnRTtZuQsKPmulgp9SpFZEQKdFaY2t
	O4/P2mw197r/+gt843cToM2vAkk62vkeaeoKCyJfWTbdMJ0ZbAABl6jsm+osqSWW
	5taV1r+c0TEEeebGlq2NXfhbhrr0wHthfIZ/SRbrz6qMzaUvvp8w0pbf6mJhx2Bc
	z0E7rA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k313p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56eec094291so643300e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294010; x=1777898810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9R/1sqwPTPa7QpYLCHOouFuYbh+Qk6HeP8hwDT56f0=;
        b=R0KBxGkIFMq0UXu16KP6SzxngYhl0NZ6e50bEZvxN4uRZFQ2Fqem2icHaD3GUjB1FX
         FbDSyf+78ab3/SuHrU42IkFuDJhkA21tetakEefTmJYrHPVYkm0OLHNWuTA2so2WvWyl
         IebmEHpnRIGBUi5EInnJqKb1z12pMjloNR1dbvmSsz/y5NKliEeHtOJ6kGyK0ZzjKkw3
         jSJfFIlh9awKICupx31l2C0xIGSltWmBZKWIuRmWjtenDtU8FcaQvoJcNHK8QkD3GRCb
         mRuF1gvndKkHsElCL8vXlpBDX4MbIe2lFSF6UUTWw6akIOOZw/M9hku1MGUbERSU7x0P
         uZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294010; x=1777898810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9R/1sqwPTPa7QpYLCHOouFuYbh+Qk6HeP8hwDT56f0=;
        b=SBDvhVUrtam4T3c/TO9mHjz61VzNA/MuH15GpKUzJg2acJm2uMCY6vZRRMG87Jk/R3
         0L0WSyJR4HrtEfF/6fS6FJWmdlG4vN7yAeTAh6CodoVRvrAipgUEjgRfeyGNUF9vTO12
         NiElOQ2STHl1pI6TewYcZogcoKF36Y1s6b2wzU++HxythLHlCnxvq2B0VC3/E4pdP7kN
         1JWv/rHN+GrpNucb6DolljNINvS6I88i6iJTgUmruOrocN3CpXgP0+trXeiEYAOGEU9O
         Z7VULCglpxrco3aDSaueiuflegjrmpR+ePnC1r5E7OJYkL6dOISkwEQLuJGEkk30hW67
         V+ZA==
X-Gm-Message-State: AOJu0YzFYjQ32zJAmenylHmPi2orU/dTRGzEsdGY/+QepZwaLUbFJmOR
	kimk4gkPfkqHeIgiv9zHEcL7YF93AzuYfU37GFF0VHzToDwpXsWO9ZDHt5ezHgDCVnvmz5kDuRC
	MciIJHTNU6PXAaO3PALuUjqm6oI8uY55zQW5xYnPjuSb63pMCv9Xfat3q6I8f46kfvOc3
X-Gm-Gg: AeBDietNeuQGVn+DVN5vfcKsUza3wO/NOkRhrZW3TDI4eA9GGKiTiaxRpXMxi367Nq8
	BpopWXfrHULLsZbMafYOLp2ogmexZno2U9fdt+A9+Ud+kNkubpKsmy/CnVKJl/UqNSLdmpyvYl/
	z4DjgXCteVI8putmd+jMNcJoQZLRX8vdAh/RiNIPvMYMt5m+FTdkJR1l6YEBRaz7QB+jONH3OPB
	ya08cvvJFZ8C+T039SQe1FLBy3tz/3OzEk1ji9YMC+iZKLLBdtFw+9DZqDgw83Y3avTugsrsF/B
	ZBRUbCn+WwiR5vNdKH4CkgXElv7D6JEarnwd0uG4c6xRyumzkWu0Qfch7JeEXiNaZnWiCmCut9K
	b7SG01x2apdyTCd5cKVqubIaTl5mg+4/2gi7NWsxxl/ftv4stFBsrIfcIKU4rLttW4W0dAXckjr
	JFcTVJePHyj2HhLA==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8096968137.2.1777294010071;
        Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8096955137.2.1777294009600;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm1115321166b.42.2026.04.27.05.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
Message-ID: <b9f69293-1071-498a-8f8b-3abe323d66cf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:46:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb2210-arduino-imola: Drop modem
 support
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        bsatish@qti.qualcomm.com, akhiverm@qti.qualcomm.com,
        nicolas.dechesne@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
 <20260427112833.1160332-2-sumit.garg@kernel.org>
 <c037803d-d33f-47a6-8db2-736c7b49092b@oss.qualcomm.com>
 <ae9OfsQI6FUvQX_o@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ae9OfsQI6FUvQX_o@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX4pvzDYSkQoA2
 Q49Bw/G21Uv1ciYiyyczfky3tgabPw1ECJC+YKvvPTRlJ9xvavbiQSIUi5YLA2raUkbcPZFXEGu
 4g6jxBZNKfxMy2pQCAxXpPRqX/xN1wh2+3AHRveUkbGeZoyCj1vH6ZrRWueD57qt5/aBYGEuoqy
 0a9T2LS5m5Ga+pGqNyk2pTTCKSX+dbCJiEBSW/xsj4MekB/YiutJL9y9hbSimB5yFl5unwGXuPK
 iQ3/is8t3yVqUqoc2NCW0ohKoabnNXUtTLWd2VPUlt+/B6cQ/zVs84XmkXKoLnlbXjdiTVngIQd
 BEi2j5DSVKwi12ybzWVwm2Pr6aFUe+i81PAYeO8qmYaMQyCz8t/gCi2L/r6tcdfK4ILX/5JOOF7
 VCehChzFOIPposs4j7twwf+NPW55wPO0Uk9wfqw/Nfby1pvJDdkmQ7o7k51CfQBGGVHx22ZtzoR
 rhRwOznkoxwhOrpX2uA==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef5abc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3UFkKYCo_pPH7Sg1ncQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: AdtfEMdZhxLrm-9CTck0-_VT-WvnBbqI
X-Proofpoint-ORIG-GUID: AdtfEMdZhxLrm-9CTck0-_VT-WvnBbqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 7D5DF472C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104723-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 1:54 PM, Sumit Garg wrote:
> On Mon, Apr 27, 2026 at 01:43:08PM +0200, Konrad Dybcio wrote:
>> On 4/27/26 1:28 PM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> QRB2210 has modem fused out as it's only available on the mobile variant
>>> which is QCM2290. So let's disable modem support from Arduino Imola/UNO-Q.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>
>> On previous APQ-y SoCs, the remoteproc was still physically present and
>> served various functions (among others, GPS, IIRC). Is that not the case?
> 
> That isn't the case as we hear that modem is fused out on QRB2210. Even
> the marketing page here [1] suggests to use add-on chip WGR7640 for
> GNSS.
> 
> [1] https://www.qualcomm.com/internet-of-things/products/q2-series/qrb2210

I would like you to provide a better source than a marketing page which
does not necessarily use 'modem' in the context of 'mpss remoteproc'

The easiest test to conduct is to boot up the device and run qrtr-lookup
with and without the rproc.

Or actually, if the rproc succeeds to start up, that's proof enough that
it's actually there..

Konrad

