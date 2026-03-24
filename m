Return-Path: <linux-arm-msm+bounces-99596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM30I4BcwmlKcAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:42:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D816305C50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F8063014FCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2898E3DBD4E;
	Tue, 24 Mar 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoLQpVIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmp2Vhak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A822C0299
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345341; cv=none; b=ZWv2GtKb3paX8KIpOXEvI/tCwdTQLnuHBxtkosk61sGViz+DQrRgbqo8BmeMjJZiDiGd4HVLw2rGzsNQjGZVsAOUh38DWILF+C1OM8Fg+bv2x3VHZL1JGdDUJaeGFHELjaYrfZFTLCaFgQyb42AhUxeMhnxWeDXmCThRQJtCGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345341; c=relaxed/simple;
	bh=od4x9CkAgwPG4jvGtgffyhwBA9v5TLV/vaYUX4T9nvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVyBUaR1hKVBuGfkzydOhcNWV0lt5OYOKLtrgLAV2f8HHPCCZlmRasRMWcnrhaj0YWIvDOI04nUeZiA5AbzqrVE4PlBHBY/oQ0j9+I1OlbWFBIXQEe6Rpd9nHLNe45cSf2IJMxImvHv0Bdag//rqZv+BUIhkC1wI+Xm1LwYanys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoLQpVIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmp2Vhak; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3pDR11908895
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=; b=XoLQpVIu2JFCkpgk
	Bv6CmHskqbaYyr6p/lVsi1q1mMc8fQQyn1t+vfskkNYxxgMIKsganbv8riY2Ga9S
	auO/Ni555lvw7C9C5TNKWvf19XMRJFsP5Aw5mzjUrC0d5zXq88ZxGwFrx0XFmx+H
	pGb+d9PZVNujRcd9nIwzNcTrbNQ4udWpjlnKuAxau8G+DK10nnfr8c0h2mCfaxX1
	ZHydj2YmqDQq7+kkpEkq6zjzp+q2KXGFERctuNYO9YwkVBRHSXkjaCr/xB7NZsVh
	+4IaJYSXEVMxjZXH4EFHbuxB1G3z79OVUfABdNP+jdR41xKBi1oNbPxTTC9xyJfD
	ijPAhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytt3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b33a19837so48740321cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345338; x=1774950138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=;
        b=hmp2VhakTusdz2/o1mT+QwqJOboFmITYFVHzUP95w+HIT33IE9nGf0oixKzkRURNYz
         +QrKFk723sAzV6MUi/9VpUYTYxZVF2nREME+qm+NWsffoapcpb93YaZh2mgAAyDYNwPb
         jj7NZOR8uhNioWi2h/OrVGA9VTWqu+LgPkuIpYcIJhodcEEjkP6oowKUr5+pv0Rc3XOc
         2hxGfxZ2zcUmqfCdkLNr9UaYICg//pvPjjnQr9L+M8dwAT2GwMV+XVzpJucSzeRkC73O
         0AmtLK2xyu+lUQYoNKgSfp5pk2v1Y8TXfV6yftj0uy5iwMv3h6iKKWbeoFJfX09hCjpC
         2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345338; x=1774950138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=;
        b=pk0pVu81wYOLydHqddpxvv/HRJ6k7CfN3mznRnyrfp7q+KK4yNN9qZIya0fJc94Iin
         u2YhuQ0tU0kL527Iq3OwC1G6ABKMc93hukGgbYyJArh+8HKtqQv2iFfZSw+Y+Yl0EQOU
         1OXbLqpE6mBJm4CMTEXgUh/YS7/LfQiRv1s1CEenHDSAH/Aeis2NvjiwEt3SElLkyjOC
         Zi94qmhbgVipZhZ8azYQH6LYWwt1jIEturU8L7J3Czj4Su9HWNwdzaEilOircjr1m2A3
         pjtHcN3ojFzZg3GYCkHnNkE00S6e8RV+z0Zk4ds3QhM9Qsv3nBFzM+EGg/Y8ney2raum
         gXAQ==
X-Gm-Message-State: AOJu0Yy+vmA6hrJLdkT5iG2T0j5KCoX8yf5LVtdP4HdQF5L0TJ5i/hid
	l1darr08iETuUZPebH/JMzQ0Br/xkpeF1O3CCLah8Z9LK92rr78XGnT+pQGS965VA0Rlf9YC6bL
	+vfFWZG9J7tlrIWZEeOT/3d321IZDQfIleeqMgr9d+jK/sp1mZbjMqnY7EL+aUe0yd+m9
X-Gm-Gg: ATEYQzzyvMrYGVOLm52lBisLhjJXeUwDQ0X4f3hNVmwhIgmbjv+fBHB6T5KiddwRBtO
	QRpZJF5skYmrtWbWNIAe/vKnRW8+O0Sjkv7rMUXBhVNlh5AYjZpTbEFwzBdJIrzJoDirbz4ha/L
	YVehdLBgbRzUWvUWjfxwkAROsH53cwKGL2PaTrFJFjvS7umI81GVhFlpz/DBpGAGSyr4HG+SVpc
	CDBIhn8LzfyWV/j3FaidaYYSQPP/p07kUsRLYr7OEsCZXS5y0DYlVnuoBvUGPnE/LPg2SU7aQAs
	r1tZXn0xN/tR3QJ2E6Vsp2t09sKsa3PP1LYWyPOs5LCRbZ5M8ukKliT5siB546EVDLW+h9yxF5P
	8V1lTes6+1k2Z9LcGOmJHAzwAD05Fk7WxbbwLSZSyqMCJ54/EKsWFrUnXu9PkeuKmZNgAYpNWFB
	7psEU=
X-Received: by 2002:a05:622a:5912:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b3721a55cmr160227711cf.0.1774345338230;
        Tue, 24 Mar 2026 02:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b3721a55cmr160227581cf.0.1774345337776;
        Tue, 24 Mar 2026 02:42:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3e6sm620451066b.20.2026.03.24.02.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:42:16 -0700 (PDT)
Message-ID: <195b2ec2-d51a-42b2-8221-2a60823f8ea6@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:42:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
 <182a6226-bb23-4ad6-b454-4913ab461264@oss.qualcomm.com>
 <d51b237c-8079-4398-8b8b-ec6a6876b173@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d51b237c-8079-4398-8b8b-ec6a6876b173@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX7jXqnHR5St/G
 dtLKAKKu0WXfgz1IKRkfAufybSMXEzLLO7FfwqSR6XIg7drDtDtztzaBTnGc4/q10klD4YRVtN8
 TptYyuUAvfgWbVIeO4kgNKaQUdB9lFcDlP4/wVfRCLUHYlZ/6EcDeEEQXNHl+X+mYkU1j7b+6EZ
 nsuNY7LvKCFGjG9XXa1Vxnfu6iLgfLGPlOfjiT9DiH4xgOEVsBRKV2iNg1Eka3lmPIC0SOcVcqb
 fwueFiWuZxLsZ3C7cMUvTFNmU/zqRH/veyn58qyfBTK8z0eLfOWmF1ZNwX/yYJlu/pjwq6yYWl6
 FSzMq9t/lsjHapTM2G7ndBhuHEUrmjsrbtCUoTMtOQ6JQXKfWdc4HcbilLQUP5EtxkkkgaMC9de
 wSs3wHVzNVEoqlHvZPOrCM5JjMvMLxu886dkq4nFAolMYMI2lqhPf+frGu5oAjUbSorzcHevdWE
 yZh5guUBfCe6uGROIHQ==
X-Proofpoint-ORIG-GUID: M-Dnm8J6sfn5RbF_UIBecuyzB89EHZNp
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25c7b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dZw9lnDFAAAA:20 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oSXFT4061vmgito90VsA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: M-Dnm8J6sfn5RbF_UIBecuyzB89EHZNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-99596-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D816305C50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 12:15 AM, David Heidelberg wrote:
> 
> 
> On 23/03/2026 10:56, Konrad Dybcio wrote:
>> On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> Sets a higher rate than the default for good responsiveness of
>>> touchscreen.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> I assume this is in line with downstream (i.e. you're not trying to make
>> the panel IC work too hard?)
> 
> When bus frequency is not specified in DTS (which isn't in this case), downstream set i2c bus to 400 kHz.
> 
> See
> https://github.com/SHIFTPHONES/android_kernel_shift_sdm845/blob/lineage/lineage-20/drivers/i2c/busses/i2c-qcom-geni.c#L894

OK

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

