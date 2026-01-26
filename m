Return-Path: <linux-arm-msm+bounces-90524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCnaLIxCd2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:31:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518B86F90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59C0B303130B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA92733066B;
	Mon, 26 Jan 2026 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDgPQV+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWSENu5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972B330676
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423373; cv=none; b=K9/5h+s5ufKrj6VWNow41v1p5qzsddt9FrIwtk3EU8AQEnMAY/W3UbhsDcuH5A/mF5bVmAVsTE/2xqqTu2oNCHxeb4SJ6+OiMHohnWgzUtX4J2MhdtmjZykzso7Hi3e/pxZHIyxmWMLHSaZ1FYwBsFN6hF1m968pn7xP9bBER5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423373; c=relaxed/simple;
	bh=4FhbNxBE+2dR/8Ipn1dfar4orfhP1st9tPee/VuPyJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqW8WUGxsI+8ZVkv1ZHJ2akXcwcJoVWvTpo6/wA8wjzetXe9rdQRd4V65ol1hl81kuA93xvpgYdGknUh+cTVrOe/zKMAeCq14E5gCny2XlyuCiBVrMJRndNcQLYgsCvcH8i+LIgN3JWYfoRQLVsRxMnbrRWHHJW3wdrY/xrwAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDgPQV+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWSENu5t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q4p9NR3057008
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgVTddFUCs+RlMNWUCuNviaUI6E4wDbSvZqfGD79Q+M=; b=NDgPQV+ql4RJ4zoi
	PHde4W5EGExhTXdhMdZICB0OcyIi7mNuN2KluyafXLngJgC6t07+23FYovEfHs2V
	Dt5hkoQzNVsZBXM3F5v/W+6pFNdWLh+IcyKCI58L1tIQ1WrlV+2lths9IeF6hVz/
	CLGUY35p/gMcCLpOeiTIp0CFLFtULAMYSppIgEObRIRSEJIqkrzpE8/zUPAKa6kW
	XRNU7aU7BIFf3gPMOVwAJmoLySw3YAHLgoLIRcDyQURQrBAL+aSx9ggdAhhyH4kN
	zYqa70DlaP+uluEh/C5LQQ0tkvKz84rLcmMVyuNcd51aLatcGfwe8warvrKq7Dcb
	PkGI1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qm7hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:29:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5029a8193c0so10006841cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423370; x=1770028170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgVTddFUCs+RlMNWUCuNviaUI6E4wDbSvZqfGD79Q+M=;
        b=EWSENu5tqcQM1s62AmwP0mgBkDzsixAQ3rIX9mzcksubquB4MqI/FuTWHJKhORiqCe
         a0TnsyiY9VO/aTtbK5X+NN81arAkfeCfXgoMLaKpfAtukaJHN/Ly/Xh46ZcJ2zUonb4B
         pA2C6JKdAMSNQT3CP3XrnMcNWoAY/giiG4e1rezr8T5wuIzwUf7jPFdSXJcy3H6QQ5ID
         4cudz5+HKf+frfzFBV84wOlD5aa3q2B6NpoYxffasbkP/gnY9uEsrGAQRgqS4jiRm2JL
         m6OkSOGpDuz9QC7oUmuBYjsYp2aMpxfaj1B6mdXWOERRUq+jsm21ktmgrf+2vSHX2fRC
         gJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423370; x=1770028170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgVTddFUCs+RlMNWUCuNviaUI6E4wDbSvZqfGD79Q+M=;
        b=Y9eUw27atf9YkvzPmpAgrRaN82eU+m4vMNAkJ8rIHCdRtY87W6GUnDucQcRkZ3KYND
         l6fRD/uwZz0ieNIaX77c5pTJb/fge4/EheTjBBSmZuhlTUJq1Wqzel4aRkct/KT3Kd3v
         lmBaIwMF4dmm4vOrPs7XnGrGvDwR0UyfD9zem7mHmzZu6XKNHJgVKTE776mDqlXZhzWK
         9ySZ5a79q8tHwzCtlL6+ggeypBdnFJOILpbSPzD38yUDvmlfCe6I6lokUj8Wmjrl65Mp
         CnjcruYZ0OB1uYEssVJlyv4Ssh/Aw34629ibNGAzbD6VDTq/N2+iyr6vSaqaPJrNcobR
         jUuA==
X-Forwarded-Encrypted: i=1; AJvYcCXB1nieo3UxOQpE4UDqsO814kU4l2KovretxiFjOCVWmJ5ub/MFmeKCFLEWE6wdvEcf2Ct7FT+aXBz2izEN@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmoWVe06EjDr7ElRDYRbYkOguld6wpZxhNKLUgUXqecB+qOW7
	/cNpDdrQQ1UnED2GPnpBj0fy27VHs3KcivE3c5FuvyBXUr0R2DFFQZBvFYAxED6sY6AkEilyinT
	oj3aCFINR5lq3ap9NuBOtLBdemzfLvSBVgnMr7DsljDPUcHcPWBpBnmHXOSISXY4Ibz6g
X-Gm-Gg: AZuq6aKmZ+8yQZKawkxWG09BIY1kUBQinga2nFO5QKi73/xOfOnrXFuh3iQ1y6WMMVP
	KGl4OHoYWdIr1PEhUlw+W7fTFExZ7Njj42I/joyn+QW3bs6yG0wZ5v0ZnyWhEUD0Gb/F8bKF5bP
	waJxgLQpvOEizRRzjofbjIuAphI0sLbLtcMZh8KVj4GKps2rdE9Pvdyf3LXBwhHO9xEFr/f4frD
	SMedqf5xWUpOSV53/wpc/sJco++ZhCLCrw7O/xhf4nAt/a41nfK8EYK6RtB4goqbeSHgtjEjmv1
	oNYeuJxkkbKOMsupQn9vDE3hsX5q1IubSZyhcJgp9fLMJ8wMFwLwEuffxdjg+IRSdwuItRy0pQ3
	wHmbnlpRLYKRkZ6lX/JTSuwWgv0mYE65XojaBbkHVzyWNYIkyUsBmcgStyg+eNcsRRjY=
X-Received: by 2002:ac8:5aca:0:b0:501:46db:6b2b with SMTP id d75a77b69052e-50314c89aa7mr36420971cf.9.1769423365415;
        Mon, 26 Jan 2026 02:29:25 -0800 (PST)
X-Received: by 2002:ac8:5aca:0:b0:501:46db:6b2b with SMTP id d75a77b69052e-50314c89aa7mr36420901cf.9.1769423365000;
        Mon, 26 Jan 2026 02:29:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b96cae0sm4770473a12.33.2026.01.26.02.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:29:24 -0800 (PST)
Message-ID: <7216c86d-2b87-496c-9548-ccdcb3c98b6b@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:29:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: crypto: qcom,ice: Require power-domain
 and iface clk
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com>
 <14a71b33-4c10-41b0-a6cb-585a38e05f56@kernel.org>
 <06160c6c-a945-467a-be82-7b33c5285d0f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <06160c6c-a945-467a-be82-7b33c5285d0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4wUW58xmC6ryNUHvhafS7mNaAUaaIXdV
X-Proofpoint-GUID: 4wUW58xmC6ryNUHvhafS7mNaAUaaIXdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OSBTYWx0ZWRfX3CpoRs1oNIey
 CR40W2JJZpb/xxf3fScrrWvhvh+DN7ugqrijrS/Hxuvfjpsrl2UbmjpIqzAIx72H04+OB5c1kRK
 b0FUydo2ZNJ5xzuXTl1mhi4EY9kcso0jekjLF5q9S4Dy0oRr8+3jp8fPwTWQ0E+sqD3x+RFCi7y
 Vaw+l5vfE+3qhsT1h+r9C/SeYDOS5pCZCkuC79S9AlFzYNEVOrn0VrIWFFY2UnI3f6t5/2I12Y+
 dGxe9hbueLO5rLSf/HbSPjzWgGTd7adqKp6UAPZGG4jbID++Q1NdqGUCrfgcMacEFylrxk09JAL
 SwYoTof+Bth4mJB0qZWBrs6Qgnfj94WQ+Wxr79wZY2Tq8qnlF5LwIal8oFEZd4GRnVC3wD80TiW
 Q4O+7EB8lnD0uSfzE0tux5UoOqJsChLBJVtpshlD9E220o/4IKfU92NsMHzkRVZipVKZ8RxCbwS
 GxlrTVZmK6xSHPZCb7Q==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6977420a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8ImHDfJAwSrsxWKzuGcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90524-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2518B86F90
X-Rspamd-Action: no action

On 1/23/26 12:04 PM, Harshal Dev wrote:
> Hi Krzysztof,
> 
> On 1/23/2026 2:27 PM, Krzysztof Kozlowski wrote:
>> On 23/01/2026 08:11, Harshal Dev wrote:
>>> Update the inline-crypto engine DT binding to reflect that power-domain and
>>> clock-names are now mandatory. Also update the maximum number of clocks
>>> that can be specified to two. These new fields are mandatory because ICE
>>> needs to vote on the power domain before it attempts to vote on the core
>>> and iface clocks to avoid clock 'stuck' issues.
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> index c3408dcf5d20..1c2416117d4c 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> @@ -28,12 +28,20 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> +    maxItems: 2
>>
>> This is ABI break and your commit msg suggests things were not perfect,
>> but it is not explicit - was this working or not? How is it that ICE was
>> never tested?
>>
> 
> I took some time to educate myself on the point of DT bindings stability being a
> strict requirement now, so I understand how these changes are breaking ABI, I'll
> send a better version of this again.
> 
> As for your question of how it was working till now, it seems that
> things were tested with the 'clk_ignore_unused' flag, or with CONFIG_SCSI_UFS_QCOM
> flag being override set to 'y'. When this is done, QCOM-ICE (on which QCOM-UFS
> depends) initiates probe _before_ the unused clocks and power-domains are
> disabled by the kernel. And so, the un-clocked register access or clock 'stuck'
> isn't observed (since the clocks and power domains are already enabled).
> Perhaps I should write this scenario explicitly in the commit message?
> 
> To maintain backward compatibility, let me introduce minItems and maxItems for clocks.
> When the Linux distro uses CONFIG_SCSI_UFS_QCOM=y, we can do with just 1 clock as
> before.

You must not assume any particular kernel configuration

clk_ignore_unused is a hack which leads to situations like this, since
the bootloader doesn't clean up clocks it turned on, which leads to
situations like this where someone who previously wrote this binding
didn't care enough to **actually** test whether this device can operate
with only the set of clocks it requires

I believe in this case it absolutely makes sense to break things, but
you must put the backstory in writing, in the commit message

Konrad

