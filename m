Return-Path: <linux-arm-msm+bounces-93083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNNYO+wklGnXAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:21:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F4149DE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1231303D2C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B1C2E040E;
	Tue, 17 Feb 2026 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S96N/B1P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XO/rEkT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94E2DB78B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316404; cv=none; b=F0r5t7NWMED0HYsX7ydReXrBUZD8AzayOJVc47CydlAGzEdaGPK9aFmSbkDmWYTmlXsjS4Q/fGYbRimQaEqnFT+BPOhdhUVOpha12NIOEaQ4AZWNLPVsYJkkK6XYhUpaLdHTDYAnef9LNLmBJM2K6M2y/b8ozc8Yi4EshwQnV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316404; c=relaxed/simple;
	bh=5NHCoY3t5gF4SkQd1kPK6aR1jzzVmLT3HKJTcPpHFa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFWh0syi2M0P0Kv8oi7gUkSraJKPD6VBAQxeR0J5fidHz2E2w9yNdaftKMXJpTDGrCQEWQztI2hGnE854kga3bCAhRO6vvvGRo4EDdHBpLtM9+vDTuR2GZTGcHIopwNaw2fg1gDSTqKjDKRVLSNNLWQOs0QKIWHcwMdhQm7N03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S96N/B1P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XO/rEkT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7njn125908
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TxhKo+tFn4A50MPPxOkkZg79rFGGqBbGidUFVQXhvY=; b=S96N/B1PBteijTTO
	dqwzELyyvsAXBM/kRqd8rYz7VrEwX+xnlxu1zV4SRuzpMA2UzDH3TLCFmYxn59xE
	qH6gNx8Bewl49Emc98BsIwRyAjWHBz3bWN+0NwF4q6GlObj7g/z87LG/VDzmnqEx
	Kv3ahMVu4UCp/VoGRBpD2xVIwOYFQD0XiPP9R92N+iw006dmDv351ZP+c67Qcy9z
	crAy3zZO9Q2cABAb/Ygn1Vono+uPn/5kA1oGfOqNAOm2Hv/GgK7WgeMrs/AAavJt
	+t54L3tr/J8LWH3FXMxL0rdqk4meM+V4LCJvjD6ECse5o2+efXRvVR1B3mTIorVH
	Uza+ig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujq96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:20:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824a3ebfdfeso1875740b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771316400; x=1771921200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TxhKo+tFn4A50MPPxOkkZg79rFGGqBbGidUFVQXhvY=;
        b=XO/rEkT3Jub1XNd9xZ00dUSt2ice+E+hUJ3jvL6JXGIs1MjVjQF+2FUwYv1u+YBF3F
         kDcqx/d4umoXdWvozIbzFIkQqzjpqsuKKE2sKCgoKoy5Yy4veNqH8OoqHJ51y2l7cgek
         N6Q5G0V0lSmU21DjyUQEt57mXKyQXDLQmcpCb1DV5+j0sjsHaBo6+1zDLDIRm4SibiJl
         TMTF0aiRFOeu6xnOXRqrNBpGb9ViilLROXPEQgByUQf/hMNbt2KbAHbIwWek6z1aqKMN
         0PMsUbs+y9f8R0+iXN8HXPFvpIAixi9hC5hbvUkBlUIMcOwI1ZtES45VREymFsSUp/bN
         Qo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771316401; x=1771921201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TxhKo+tFn4A50MPPxOkkZg79rFGGqBbGidUFVQXhvY=;
        b=rjeKAJ1Evd2ra/MP+lxiRWzL0x3Db17pBA872f0RGPprRsjzcuuto4sqOVzkV2iJlx
         KrvbDWhkLKj7dKLQtdR21vm7rp/5IMUODTFVnjMlGamNb2V7g/U2uo2ZMEy1D4T+Umd5
         V3pXMZxQ5QHl2l13VqEHfPsKyGe834BL6OSctk7w1a2dguj2K6IaoP6dDy7AbTLDKYse
         n6y0cnpXy8A7xn+Mwe+L6nwnO0PE/VcSw7WsEuXh4hkiTS4L6AxftJRXnI7hZfJQHdFj
         UgeZrh1tlwy6thnRaBokpjFrAiTCMAkv7SrSStDdfqrLAr8Mqh0ANR9jzsMCXSNmEglC
         Ns/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdYAKGWs4all63Wrw3kS35Q/BPACV74nLy3kG4QU/lAB6jogkPqjyu6PWzymMBiUhPa74trGzlvBnitJo/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+TceRZuR1vhgS47p6yj/B0NLXwjGnHuOPTRKUjcdBKvNXS5Lz
	pgqFHcPAyrdDi9A7MoMN7RcCzGgpbMGeqFcu8MmMUdieWDS8ECJF+1x5yJ64/HPWu68pVh/GSQt
	IiWxDs8gIoJTzGdt4L0nERpAcf/YngJNEYUoinyty7uBEL9xw7dY/DfdXaU5BElLgmOzt
X-Gm-Gg: AZuq6aKx0l3WajW4HRFFV8cLXZSAoQaYqxSkSGRbbfP/nM5vs7Tc/2JhCihlzaQuYG/
	gcO6F0GVca0jvCBAx9b8IW6kwrLJD5RzswdZbAGJn5yS5d2Hpqx3EoFnoHTSLyugybaCmHkO7Sw
	1WXHqU+C8EFQrYZXNzlV4SdTornjS5aMVWpQ1MPv51GPU+bdygOHaMkL0pOyfFrfJKY+1j8AqRK
	JJXPZmwBIkI4Ci3lxT8yufOq5Jk2K9Bhl7n1C1xGGNfhiUMcsfBpMqI1G5vqZWxQQxpxyv3bK9U
	kN5VM/tqFfKf6Hmt/U12ATYfN5yfik5+Ex/gGWHA3GMNSi9lmNmmw3pxFB/sR+w690RjnXa9k8t
	rdWUjPnCjgYic8ePeIaNfhyqLMzxuikGKkFbqPNmQbkmrvRke
X-Received: by 2002:a05:6a00:2383:b0:81f:3f03:6832 with SMTP id d2e1a72fcca58-824d95f3794mr10542844b3a.44.1771316400523;
        Tue, 17 Feb 2026 00:20:00 -0800 (PST)
X-Received: by 2002:a05:6a00:2383:b0:81f:3f03:6832 with SMTP id d2e1a72fcca58-824d95f3794mr10542827b3a.44.1771316400048;
        Tue, 17 Feb 2026 00:20:00 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9084asm16005229b3a.43.2026.02.17.00.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 00:19:59 -0800 (PST)
Message-ID: <ae347961-4ad4-4772-bae4-7b698a05ac8b@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:49:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: Split to
 separate schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, janaki.thota@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
 <xai73ei5ixb3qpp53cjvk2h4adlfo2zl7qglshup4pbeyh4fpi@ihdos4z6vsoo>
 <3f59dbaf-1270-42bc-a21c-210c92b398ac@oss.qualcomm.com>
 <vdxktsvqwgmwi5wuaiktjstzkosvrjkkzkisnv2k2ffyehmh2w@yleoccukebbu>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <vdxktsvqwgmwi5wuaiktjstzkosvrjkkzkisnv2k2ffyehmh2w@yleoccukebbu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fz6g0YQwPsENUceSye2v0hb5jMtCp3YO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2OCBTYWx0ZWRfXxkh99hyfeYAY
 n8H+RUuSZh1QUb3Vt789Ig2V8YsxnUbVatP2N5R7dFb9VR1xewk7XJdhVKZRAB3HpYfhPFc5eeo
 RIAtqWlFvrqsGbsT+osYVElJkTmE068U/b7/S4qEwIk6l2O8Rz1J9ARzSGZLieRxUp+hn03WDj3
 AQ5PF55F0/ST9uLeMnmnBKcAVhbTplJfxZwnp4TyDxeGaRzSoZ4DhDcSJYLSq5rMm42OMOIPQKA
 yGLWQnX0gtOighqBcgw+nOstWUUd5E2EfPcQ7+UAxqd4+m5g5GIu+vgv8DCK21uZlBM8fCMftrG
 t5S0U7/wXEjf0ZWZzFsJ57z2vWiH3lZLlb9qJHWJSo+IgAwVTmi7Yt7xgdhlU93it5oMP/Q9Bzb
 nC8hMmuYZ0SApQUaTQym9TSmLjd0teMMqro/2UcbtdWw3f0G+Y+YkQ/40tuAa++VWigdF5eTjB9
 pRRds3FmYiuO88WFKdg==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=699424b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Sxt5uGroJ81OMFZ79MMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: fz6g0YQwPsENUceSye2v0hb5jMtCp3YO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93083-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 568F4149DE4
X-Rspamd-Action: no action



On 2/17/2026 1:43 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 01:11:05PM +0530, Vivek Sahu wrote:
>>
>>
>> On 2/17/2026 12:04 PM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 17, 2026 at 11:17:30AM +0530, Vivek Sahu wrote:
>>>> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
>>>> possible properties (19 supplies).  Split qcom,qcc2072-bt to separate
>>>> bindings, so device schema will be easier to read/maintain and list only
>>>> relevant properties.
>>>
>>> How is it relevant to the commit? You are not splitting anything. You
>>> are adding bindings for the new hardware.
>> This commit is added on top of split schema where for each chip set there is
>> separate binding yaml file instead of following up traditional
>> method of updating qualcomm-bluetooth.yaml
> 
> What does your commit message describe? What are you splitting?
> 
The commit is about adding a binding for new chipset QCC2072 which is a 
WiFi/BT connectivity chip. It requires different firmware, so document 
it as a new compatible string.
Seems like slit to separate schema is confusing sentence for this 
commit. I'll correct it in new patch set.

>>>
>>>>
>>>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
>>>> ---
>>>>    .../net/bluetooth/qcom,qcc2072-bt.yaml        | 48 +++++++++++++++++++
>>>>    1 file changed, 48 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>>>
>>>
>>
> 


