Return-Path: <linux-arm-msm+bounces-109273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLHdHMQ9EGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1365B2FD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 806AD3012BC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C552A3DDDBF;
	Fri, 22 May 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKi/Ac96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igWrWdGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9773CC7DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449271; cv=none; b=KYCpzMYE2A/NmFwxlffGtqG458uwh0jxlKvs77ByctIysPexIzBsfeLJBM85efsssgxLiaIitdiSfjmZtvscMYcKr5W82hDX/Qy2TIq+blQ/ccDa3NlVovW615otsIUzcPJp5Nr2oxeVVbPJ7HD7bFvXh3QjW4xkrR3jtnLhmjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449271; c=relaxed/simple;
	bh=Xn8yRD8T4xkt0RCkj/dW/P2fvEOV0FrojNAtNmGfCck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbR7hjExUXB5IrDPYKY35gEQiuhIfuG1XpKhNG3kXDZJugxKzcPa/2pqyoTPjjH0I1tzC+KEnpYzVFo3iTYXq64Vfy1sGQc6xf2YDYp5MCbIXyDh6IgqO4LuKRN1ziQIZX5Tz7yTtMkl98lP37DASNplPVxHIhgC1KTRoFYrDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKi/Ac96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igWrWdGX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4AQb3947413
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiKQgwyqjMIOIsH4BohlB3XwNGHNxNr62DhRiy8MIQU=; b=nKi/Ac967PmnJfD/
	4esqJ5yxp3wuRgcJYrZ2PyRP4lWDpg7BfIPrEIOPDmxL/y0P1KExvPLy6FRYcPrS
	C0e44V14quADEhWJGBTDDL13LP1mGh1y6TL0/2xhLOioLThj/goiKeHLq3jREEeK
	AgaiKFMNfUpSWbYne2hHo/wDuJC5zMS8NdSDa3zLgVjvZOfE9M0k9G+YP0KsEJYy
	A8oQ1JFuhOJCPmfEu5XQYlqYfvRiFTzfr0qSHJ/k4LmdfTS6JTMjMLi5VpygkyGy
	d816/U8vtwj7j3NH4hjzUId6wG3d+6+o0W+6R7y9QFaHh9IcHZmYzp3T25pNJYU5
	RHQhOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng8s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:27:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90f6e66879eso180503785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449265; x=1780054065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiKQgwyqjMIOIsH4BohlB3XwNGHNxNr62DhRiy8MIQU=;
        b=igWrWdGXSSCukKl6M2ESnE4gz+qIs8ULSL1u5isQp++ntWtx6vo92+R8yFvvwL8I+f
         5Q1xKV0/TgEfC26/v8GsjZX9Y8poCaVDznngiq7QoNdEp01JvIhg9QlKTFHLD2910wys
         0ogegqyBjO+Rsp5BCZns/Cp1Wo97nbft+HxOcWwF0qNt7e3+LM6ZPrazIgOXxYZmq03W
         qk9VuYJoDsaTGGdxNWABJJIs9q9bBXcHZ/8Fb1W18sVZzFLLUCy/ZjPVjFDogt6/XuNo
         P1pw04GQrzUixgE3juPYlfbDatw7J7Olf/QRIEZF+08WrMSHVafPXENFzj2Rt32OzpZU
         +tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449265; x=1780054065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiKQgwyqjMIOIsH4BohlB3XwNGHNxNr62DhRiy8MIQU=;
        b=qYcH8krWItge8liPcRr7S+6YdClI4CF+QBh0anicqBP1aK3eBdt8Dgq2zQi733oV9e
         bq+8BeP7lfbq6eSIHK41Vq/zOJSF0hDWLXnABPO0BNWSuGxgNay5VnfFS5w64OcT9iKL
         W66ZiowCkG1t4WwyKnZqXUMuasKsftFaT/b+f21vhYqLc6d1/E0Ua+ZQlUlc9ZBlse/c
         vithvA/9iKHkRedhdidFpmUlWn/Du1lSiW5RIKVIBJbMC9Myj0r82s3/HjyKeBn0X4VN
         0Es1ClRiML61EHmGYYllrAmRioiektBKTx75izP/EIIzwwg0yltL6SNRqJDnEo4aJt2y
         yZoQ==
X-Forwarded-Encrypted: i=1; AFNElJ81ufY26iguNsKb0AvssEvL6UPnh5d4/DW9ZVMRebzvgOpj9yX9SCXebJJxJrAkI38j/0NSYtKlrVlKy+tM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2NUKhVekrp7VWKKU8ev/ZTKWwQf56vUDgOaZvspBhd+4eecZE
	eleb/LHE+cubd043bQM19o6L7hgauZ7332bJ1ku5LEjQhbi5ZgTBxtv/EHHKDJ9v78YzV9+Bive
	KAovw0mzMoMAoWSiFB9Vg6OTy/sKdWFBqDoxpwiU7xQadwKArcRx5+95Afj1D1CMcGmGf
X-Gm-Gg: Acq92OHxNlqsW/SQyJSntkgR7IVLf+R0I4EyoiPsDX4k95e1bFKcp/flYOPNzyQVbyJ
	RgOQ4rZthDvDXJsAmTpPhY02QA5QB3LXrZEcpd4nhSn/hhsMAQmAdxTugn2KUjCMH7MdSurzJjy
	bpt/nOvmwrSMLaf+ueu0QvfjUlKDrtCUO1B2gy6GW03fVJPwfhPPEUGs17CbbwfP9UU1wOSmQJb
	lQCOUd7TKeDEBFhR6zKr22WHGhbqcGnzKYp5alSSEyoUUE6nnyxoU6qAcRH/cGrR4WKiAAsTswM
	64SxAk4y9wSCgMK8pbPfHphgoixpfg5PC0MohY41RM3Xe6dCXLScuoQD6EdkhxDWWg7uCXO7On+
	nZBFvIwgVPy7YUvhtSp4p2ougbtJ2pcF4m6OZJLGAeQAT0/suUsQF60ux
X-Received: by 2002:a05:620a:28c8:b0:8cf:d953:b4ec with SMTP id af79cd13be357-914b497c533mr312757185a.3.1779449265244;
        Fri, 22 May 2026 04:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:28c8:b0:8cf:d953:b4ec with SMTP id af79cd13be357-914b497c533mr312755185a.3.1779449264847;
        Fri, 22 May 2026 04:27:44 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb13312fsm560271a12.22.2026.05.22.04.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:27:44 -0700 (PDT)
Message-ID: <9b3c6567-a432-40e4-aca2-4ed92436dbe2@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
To: Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
 <a6190a6c-60ae-4d24-b396-089f3b42973f@packett.cool>
 <itszs6eu7l2zix4stdiokftgxjpqlfukbqbdg4u3sestln6pgl@yq3wud26vi25>
 <38e87937-194f-43ca-ab27-a3a9cf7267d4@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <38e87937-194f-43ca-ab27-a3a9cf7267d4@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a103db2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YME4jNqvwn4WW7v3Y9AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dL-Y6GvgrcLaMKz7CGrpOjo3vRd5466t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNCBTYWx0ZWRfXx/u0yDZhkVg5
 qz8OSM9pStnD31MBFERllF7QQ6XRJxojHuJcYr/j3tmPza1Jkh689gaR6XhmSZcVPtunDBBNuuc
 dJ5kLp75HAhZ5hqHw1xTlKP8kemMNk0pySw3ncaANRn/t0LQWi8MEjNycUC55cuw1DE7HS+lrSE
 cW/TzavOFnrf8SEOKxgosCy+uPZBZWMdhkTX9c71wueCbQKcxUv4VSjDQ5/UsGmIcW531JNwQDz
 gWmUbdHbAsOH5GMtIv6WNvcT1RuOAwrFIdCWmDkb//5aHmfCh2ZDV85Llvqeg/VgPbnx6R15dHf
 PtxmIPd7jZ3MPAFX6ZNExprSI0lYiZkTxiDAwQ/dsTVbHE1GWyzawIWXr+2aOzHrIuKptym59bn
 K4gyQIcbZ9zJ+1Xvxu0i/+M5D00x9bLkUjGi5EjHGQXOPTmqvUjx/PQAvd95EKWdTokL4m5zyX0
 THr9ajWKkANV8axhCeQ==
X-Proofpoint-ORIG-GUID: dL-Y6GvgrcLaMKz7CGrpOjo3vRd5466t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA1365B2FD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 12:15 AM, Val Packett wrote:
> 
> On 3/16/26 12:23 AM, Dmitry Baryshkov wrote:
>> On Sat, Mar 14, 2026 at 10:10:26PM -0300, Val Packett wrote:
>>> On 3/14/26 9:51 PM, Val Packett wrote:
>>>> On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
>>>>> Currently, all HPD interrupt handling must go through the HPD state
>>>>> machine.
>>>>>
>>>>> This has caused many issues where the DRM framework assumes that DP is
>>>>> in one state while the state machine is stuck in another state.
>>>>>
>>>>> As discussed here [1], this series:

[...]

> [ 3362.364893] typec_displayport port1-partner.1: failed to create symlinks
> [ 3362.364902] typec_displayport port1-partner.1: probe with driver typec_displayport failed with error -17

I believe this happens when the PAN_ACK doesn't arrive in time

i.e. if pmic_glink_altmode.c doesn't write ALTMODE_PAN_ACK to
the Type-C service, which is influenced by the time it takes
for all the typec_mux_set() and typec_retimer_set() callbacks in
the chain to complete (which are called by the various flavors of
pmic_glink_altmode_enable_xyz() in pmic_glink_altmode_worker()
right before the ack)

Konrad

