Return-Path: <linux-arm-msm+bounces-92223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PsMKsKaiWkv/gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:28:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F910CF45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E225300D9FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403C4309F08;
	Mon,  9 Feb 2026 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd+cXXlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeAhUZ6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9743090FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625711; cv=none; b=TMOm9AZtVOA5l0QT+XAlmLB8mxi0VG8Hoa/DfSaYs7xmHA+FNRvBCBRw0fnfKwtFmgSYKXRRxHk7wEhpa7CfDGzDip3vB4obdZezExQLgQyhkoYhvNuCEfWO8fp47JUdNfJwgcyRET4WGoKS55U4R1UB1xjHnDFBoBhcxjCHx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625711; c=relaxed/simple;
	bh=BkI3l0nh0UiTnME17fihmo4Jvy1q/3Qwyo8KCCWvClw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDIf16TbJzFcAQG9+txFKAcFtyExSg+nC11KFyz2Ec7cWJuvcmBUb8J1/D1qUefZ2ML/RoBKpl9g1t1XADsC85y7tYNox4nZAIT0iOwT4b6JVxoppwAVSJxSyD3ObnuoXWtBIendMohRmnZTsnmoo9mLsk92ThOY2b1lFfeTt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd+cXXlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeAhUZ6m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194TR7W2600446
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSTng/cs6c95cVizWIkJzmj41GBBd9IVw6pXtCrOD+g=; b=Kd+cXXlNergRcSUg
	wUsdANhXGSo/9T7B3C8xYrfqTxPja8S857kzHUzGH3mnhijJP+wIP0YpL8pgHsb5
	Ze1ybcDprMEIp2E11mQt0rcewDSz3BLbYrYWjEl0ZCxZMkkYoQFzCtKP7i2zB8v3
	YOuX2eEuv/BSdxyYqCNe+AklkrIm4fXy9em3ranB9cNKh5J3FDa+12BkCwsgPec/
	Tdkk8VBC9wzp0K2Q5zRpBvIQ4lJxraGBVVoXky3JN177S7KTKCoZ5fTH8tf+v9xk
	zAsoTnP+CgqazS98roehjqhBQBoheebA9XOrJMQJFcsHjS17GzCMnBmgGo/A6C8e
	z83XYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78kh0r5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:28:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8966be97747so7319596d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770625709; x=1771230509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSTng/cs6c95cVizWIkJzmj41GBBd9IVw6pXtCrOD+g=;
        b=MeAhUZ6mJST01YQrrdHBmlWBs9XRCiMqPlGIigjAh/EWYJzGF+9v84j+mDDTT4gjFA
         g5GldI5jl9NGm37RVSXUYE38REnhCRA4oMXQ/PZqN3mG4gHmNXxoxdx2cOFIV0+IGHNN
         5yzQejEYeDp7BrVG6L7dD9CHu3rbmVkPS1XNWov+lSaS7yPDgLwn9DX0VMijdjhUlFp3
         wbN4Pj5nM8W41HXgedF9Qd+8sKWPgecKE3/DWJT2y0VbBub9NWn07kr+Teyxntm1grJZ
         3TlczLcOXdr5BW+FmB9qo18gNWz9fzBC5gAJG2AnM94gSKfrVhYmAIxEhV8hscrYqmch
         EkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770625709; x=1771230509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSTng/cs6c95cVizWIkJzmj41GBBd9IVw6pXtCrOD+g=;
        b=eWCFX7ErVTaFFkfCkIpCvr+DTNpeYWDcmYLe4ZToCCluYKaLB/wtsJ9SnLOLeixksQ
         bSt4X9VlJg1V8zIpETbUrxaqUGVE+2j7vV5suAuIKeA13nBIvr09g0yIES07snferT9A
         7tkOnhnfX8ojJ9ki/6Gqfbu3lLcvlAYV0+UvFrUfYjzq2mwhbHWoxEzNq+FNLaAh5DuL
         Fsz9mB4+TJQYoVmPyJjLb72uFwB9k7QEKfLO1Z9nhVTQUmfjbICB607ohzOIUG5O+uyP
         MBgVTHd8p2KWReF4Uab7Ln7jPJEJ1jkl7ZyuihtT/qAZNs9QTD62i5zlhASB4qCm9OwP
         QVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW75XgtjdQQ6hSC4jTJDzlMOfZH282cinOVYy8gNyjuQ005jm0HNQFd4yB3ocrB2mvaSDdKi7HWJflTTfDe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4EoBMRmpgAxU6i4XJNJuAQ0T4tDXSp1ZK5/CF2sSFoZuPvFDv
	X4pUqRAW+DosKzD8hAhQMiO9F8aWqPpVmMHyFBwMbefb1EbBpYvA7P95cXMvG3sEtL8nu7GV2pT
	ZWbrU5LpnSchc+hrnydLslx0M8WmVZlLgksrc5OjOBIYDrR0JWQD/iQ4DKG/9UrPO5sP5
X-Gm-Gg: AZuq6aLWisMijjVA4rGMbdvT4pHbBPtHDU2CZpztnQfgnSneHjisjQZ3XI4xcBthhy/
	MoGFsepLgNhIaZNaUZ4o5/CetZdUGKVt3TqDDcLasvyUMfl6iLMyI2jnue4jKPJhPt34NA+d9Ou
	RA1xPyp0sr6C0MVb35dFbUgaGepgARU+Zsjel+n5jIQ5E/XxThKqUJeeVSEJ9sBdJG76mZp6CxP
	RIrPVgnQjXYdp0a6g3JbQmQrOeyW8y7z+5ZOaonW87is/jC8XQdZqxCYFMYSU1S9RoOxDlTMTzG
	P84py64XzmhM7mZilogdmFJoLe/F6G3/b2fjj0yXtk49/mQ/UPjV3xKHK5PNzYTtqhz9yih/Ny4
	hv2148Gy7E4tLzpyh5BHz4ROH00rTEFphugeDKBGi8jEMvllcjUxKnEu12LIeNALhpPs=
X-Received: by 2002:a05:620a:2953:b0:8b9:fa81:527b with SMTP id af79cd13be357-8caef6e95fbmr1084475585a.5.1770625709366;
        Mon, 09 Feb 2026 00:28:29 -0800 (PST)
X-Received: by 2002:a05:620a:2953:b0:8b9:fa81:527b with SMTP id af79cd13be357-8caef6e95fbmr1084473485a.5.1770625708900;
        Mon, 09 Feb 2026 00:28:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1540sm356073666b.56.2026.02.09.00.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:28:28 -0800 (PST)
Message-ID: <cdc9fb39-3966-46eb-9182-fcb2c3c56dde@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
 <jloqgua3e2lub2daplqlie6fhrsxntwepfwoa5csxdababstib@lp7b2uy3jqos>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jloqgua3e2lub2daplqlie6fhrsxntwepfwoa5csxdababstib@lp7b2uy3jqos>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=69899aad cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=iexO-N7_dcyycZ0WZvUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2OSBTYWx0ZWRfX2uFvxoCv5fty
 yTkrw78+0FAMa8gussaTypDZ6vVMId2pVyyAhsOIvG3LWqMt6+TRQ7/922JNYI7UqCL7FdC+7M8
 0yi5M6TlUvGMnzlvPygi9vLjC37kfKwsL7DSTpgjU4wbrKorq+Kr+x9hwiDpb0PQUOkIRVb4X28
 yk7/aYCmqKplczakwDFPpq+cylgUzReBK8ISDfS5tvKRYGQGL7zxFBVQ5OdcAurBPsSfL2PG4gC
 tdJs/onjHeuplRRBkXHFr2Tf7UM5bL8fyEcWmMjnkaFiBAD0PnsYSs8MLOpmSM0i3i92RG8LXEf
 iHb9Zdvhu24XhTY6eiZE8vM9vWMeexttqiOsEC3Xmv4XXBvN8SFyCDU/2qwenk2EBEdZEwwo+6n
 WqU1FZYHlW4HD7zhaCPvveEdCVA84YS1RfgaCeF+tL1BEV+rKMaFGh/WkhRqbEoX9og2RX41a4w
 4ECezeE+GbPqnJ18iOQ==
X-Proofpoint-GUID: -qEIztF53jx5HRNE4WzBwTke8MYJYgkJ
X-Proofpoint-ORIG-GUID: -qEIztF53jx5HRNE4WzBwTke8MYJYgkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,tor.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92223-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 278F910CF45
X-Rspamd-Action: no action

On 2/7/26 10:19 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 05, 2026 at 12:14:07PM -0500, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Qualcomm platforms support the Senary MI2S interface for audio playback
> 
> What is Senary MI2S?

primary
secondary
tertiary
quaternary
quinary
senary

Konrad

