Return-Path: <linux-arm-msm+bounces-92436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA47Gm/ximmwOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:50:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0111865B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 202933004F2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021D81CEAC2;
	Tue, 10 Feb 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ej6eOebH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFoCtRMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F933555B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713450; cv=none; b=raq3AtckWRMEKS6DxJl3GKSz2Cv1nBwB633xzVn+1jtb+lLVDnN3cStMpW3dBEMqsffRI48qFi+ut0wfUKlS6dLnUeuYfIFjyn2rVeutgj5UWXpFhhKplw/caqDQMydLJX2D77wA3+E2bqMp/wKeLPelwS2r+5P9hIxI/2SKyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713450; c=relaxed/simple;
	bh=4WjXZMiHTnVMkQXgkBZ1mAa1eCYmZSPkXFVid+2ZXcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gY2hoDbfbsF/XM9gitqcrRfGAVrFAssTkeLKf/W2Fqz9BOYfiLl/VTrwzFIaDwXoLCNRdvWnIgTJcx+ya1GA0BVcADWhduwsf4OWEsRh0P+UmS5MgI2KdX+PFHRmJTwyUVg7LOm7LNlDYjz8l55eoUe7yTOTtlBCzZ3uSbwx2ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ej6eOebH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFoCtRMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6ebMY442300
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjJsMTqeLmT7yOVgT+k+iOAaAjGP97Qosgb57h/83MY=; b=ej6eOebHBehMnL+O
	tRSqgZpp5slX52wC2Bwe59eGM/RqtJ4wmx6/k0E4Kboz+XhzWg7If0MggxAqG1JC
	cx8dcRf1qPeDy7zSdB6DiJm2zhr9iQtIAJKwS+G6F79YcEjFFii0U98tCi5PZ3gs
	+6E+oSBLB6E8OLRRaFK4YYahON6d2RoZ0LEx8UakunX51/khI1AOLjGgMTq6OhgD
	Wk4UbzkFNwIi0H8IV9TequRsKCyq8yTA6udSFvcasV+ZtF2mZMORutjaAW2k/C+O
	OZTubJcj8KGPaPFlsw5eDc0LUJwUIWNbvhFsT+SmRMJV2Ofvw1KVizWyyVG5Pvb8
	WaB3Sg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7qp9hvsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:50:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89547ddf32bso9746316d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 00:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770713447; x=1771318247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjJsMTqeLmT7yOVgT+k+iOAaAjGP97Qosgb57h/83MY=;
        b=FFoCtRMaQHPgKSHGkHGs6s8ALcnDJq+etdnO8jzzRLIMu7jCJ6AmteOosp07AtuaNS
         6nRbZ2iXsnFb6X4bMj21a9IeTct1p452tIbPhkw0FGM52McIw8xX6o7q510yRj6C8knP
         KLb2f/WSKaO2Jl7B6SJUVKoQCng6tCFe20L+MOWOWsDp9Gn4O1di1shC0ifSmYzYcP5O
         KxA2aip7g2zOTdRi0DHa+KyUI+LqUnB6hGdpyHIi3TRrh41r979EAA+fMFUEkoWpxySH
         RXS3c48MGWErA5AR1D/i2txCoPQHTYpZFWjpXwyXW7QEbd8vv3K6OusBBOhyPeOUAC87
         UCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713447; x=1771318247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjJsMTqeLmT7yOVgT+k+iOAaAjGP97Qosgb57h/83MY=;
        b=Ybt0fo8q2Y8GDrrnKcJg7xWY9PWKURPtoS7oID7Z3bSuQJZ/l9Gq0mzXFHHX0A5VJm
         quHYV4Y9YoOTlR4WqXQZJZhysysS4thskTB+YepIRdTwR+JffSecssoq1JMZNWqm4//l
         CKOy18TBKEyz5rDC3LKD+wg40kijlyYLXW8R7zXs+c8AK6Eq4pf4v4IFqolXihmOcBCG
         C8K0i/ccffsorAZDpfmKFUH8CAjzJoQRS4StT+Wccin72HBTMzEdh8nCHUlHHoeEMSug
         kks2XiMhbH0AKTb3D+5SoPX44wgSCGFFALKz5xCamLijJSI6qGaghx0nRZno/XlDBSEM
         y7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUm9x6tKM/WaSw7jFphR0UEWh00sFafWBa1aKAg/LaUxw3215Nt8awKmmUFNP5HnCKbcHzw9F/kS8uOobUv@vger.kernel.org
X-Gm-Message-State: AOJu0YzXOD5TFKZ9zVaUP25UWmtFKnmUYBqcAjccdOfSazsiSFnNWYgl
	2bBYjGDTb/tyOET/tN0ECOp4mr6FKD+dLBB2maH8U947kg8oeJWK/NqxsS+EGnkMFw0EzFRjK3t
	bCzKzs3EZstakCLNQC8WDz9Mr2QbEzRDTMItlts6si1NCMdi6lmyJNzqpLZLPZp1S+cKtVoDzjX
	D2
X-Gm-Gg: AZuq6aJA3vAVjhy8CJ/t31vZD9tQ530zQFVbgq2IGTToei2CnICcDrSmAt1ewCPYKnr
	7xNpDWfATPAZ1msBTZ/K2f71kkdPzZwtHIiOBAz0UkCokT0PGparvXojKDhf3R2nTX4aEjpUqUV
	RX9aj6ipazggymk6yquPEm3pEKc/j7xWZZ0gU4Ly/NhiMhtZx1HbgupuDKDylIbpuTCTDcYcR+F
	B+jRuFyelkCizK6d/hL/J37u3W6QoWY97ug/P+Hbcr/2XVlLaN+mnoZjCgML+Xy2FwMU+/4DEng
	uhm4qHhWUAnZQKHDexCTwzXU24DS6vXNbB2lcA3bBNN2K4qSM06SnvmS6tX4/zDYt/Dzn8EJ/Ys
	nX9lSLNeBnMX5Ekr4xvHr6ja16je36J0oxnr3LSkPLHTJ6p4OK0+ubP93q/DW+Vu9EfpXit45fO
	i7JRQ=
X-Received: by 2002:a05:6214:800c:b0:897:1e9:578c with SMTP id 6a1803df08f44-8970fe8c040mr7321036d6.4.1770713447504;
        Tue, 10 Feb 2026 00:50:47 -0800 (PST)
X-Received: by 2002:a05:6214:800c:b0:897:1e9:578c with SMTP id 6a1803df08f44-8970fe8c040mr7320966d6.4.1770713447197;
        Tue, 10 Feb 2026 00:50:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983ec70fdsm3520525a12.15.2026.02.10.00.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 00:50:46 -0800 (PST)
Message-ID: <0003915e-26ee-4f8c-bb5d-f4823b88a2aa@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 09:50:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
To: Rob Herring <robh@kernel.org>
Cc: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Sharma <quic_vksharma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lei Chen <quic_chenlei@quicinc.com>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com>
 <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
 <20260209170714.GB1401643-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209170714.GB1401643-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DJFPkJidaymoj1SE3cLwJeO2BFbJ5nz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3MyBTYWx0ZWRfX2qRcxZfL6l5V
 bSya1Fb9sS+j0gWaVdJHOR8admAW1MQHYjZ+BLDY1ovh7ox3xM21xeeMfHHHIow7YAhTc7SRJSb
 X7oQ79Vz0XPGXL2Apn0TVOelS3sQdGYa08Z7WsMEUI+74v8hesWendbjnxHDNWIVqNwfwRxMqCH
 VKxd+D9u+qXbo3NQbMtAO7aCCdnSin/7yV6DJAMspDMnb4CL5FWRbCLoJkwxQmUvC+bSmvC1JJC
 qJY6ASvTAXkfThhvf46DMtZyP9O0sFth8uN4FDyOaCtOfMJO0rJ6KDjOYMEu2+Q+50f3g8A/2hj
 4CgtuNQSJRfcURFPIzlotWC6/SPkeexBT5jCn0nPohdOEdM3Bfu6GPqne8oom6bWzmDnB6ccS3m
 7RfNUjDg2DOyQdH3OsmuBPtIbZePMMc9KGyx2eviV95yFbBBDrZgGCz2+M45RVVqG26I5KRw1a7
 pMprwJGoUS9os7bPAqA==
X-Authority-Analysis: v=2.4 cv=dP2rWeZb c=1 sm=1 tr=0 ts=698af168 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=CXT_SgqONjOjVZ5XLaYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DJFPkJidaymoj1SE3cLwJeO2BFbJ5nz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92436-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1A0111865B
X-Rspamd-Action: no action

On 2/9/26 6:07 PM, Rob Herring wrote:
> On Fri, Jan 30, 2026 at 11:59:15AM +0100, Konrad Dybcio wrote:
>> On 1/29/26 8:46 AM, Aaron Kling via B4 Relay wrote:
>>> From: Lei Chen <quic_chenlei@quicinc.com>
>>>
>>> Add DT node to enable tz-log driver.
>>>
>>> Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>
>> It's nice that you preserved the original authorship.
>>
>> Please extend the rather lackluster commit message to explain the
>> "why", which is notably different from the original downstream
>> addition, since your goal here is to mainly appease a grumpy
>> bootloader.
> 
> Humm, that's certainly good to know. Though I don't think it will help 
> the case for this binding.

FYI I'm not really interested in having *that* binding upstream, the
patch contributor first believed that it'd be necessary for the
bootloader to consume it (refusing to boot otherwise), but as we figured
out in another branch of this(?) thread, simply a label was enough

Konrad

