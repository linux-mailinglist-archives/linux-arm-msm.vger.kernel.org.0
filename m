Return-Path: <linux-arm-msm+bounces-103083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOe4BbEI3mlRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:28:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3C3F7E44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F7D1300989E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2218C3BD22E;
	Tue, 14 Apr 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaIu16jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8kkIH0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2934B697
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158894; cv=none; b=s/YRbIalH3M1dvKVzt2KI8z73SCko32RG06KFYYuYf7bR3lRr2QqTQTdkObbyuYXp1/BBG5ce6Jp0J7lduH7h5XEDNVYFNnGpXzu/uyCssw9tst9ZquYBDiNs4ZsNVHUcA7dp6Vo/UmH9eoChi2GDo3EpvDeru+aW/WpavU2XDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158894; c=relaxed/simple;
	bh=iZrJZpPtINLl1+luHqpDgYbeh+LfMD/d1VjoI+UmY1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfiHYcpFxZsm3Ytgc3Ybw4gvukJz41VRfPOWJ3ZHkfmd+vREtpRnaYnimcaqQ9ZeBWD5XWtfkIDuA4FSV7mVzjWKP2xcBDNHh7cKNnvU8AwabYFWWHEewFYbF0+VDxEPE6FI3NjKLKPmAJSG/yr3aX3o0cem8c8qwb/v/+9oxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaIu16jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8kkIH0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6NTnO2633313
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=; b=PaIu16jvI4eY6nNj
	gtcJ0rCxXZdrTIMciGXAddLHbSyjqOVBDSlnrJpyngGt8ieMty4j/G9uoYSU/Z9/
	vRBy3Ir7ot7z2vOFU5GYGWxZ8vAagQzlWwS9wepfMQPG3aH8KKwGsfYbKTkS2eBl
	p6hbuhwiac5HjK+vrOqwiyQLaoAtoYR382RBKUqJwrRqC1AUyJC7AOydSrOqPqe0
	1wLNmfbieNyFNAY1oAIy7/bTlXvl/4splut5XooIUHwhCKyycdwfagVR7B/wINYl
	FB6ezFKEmrZidMLMxjoW0f4ydR7MrDoyBfUNrRlloVvmx7Yi4tEt0XnRwXYxe8yE
	vgMMAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca30h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso50699341cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158891; x=1776763691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=;
        b=P8kkIH0T2zoWl2LUwuyeQVRkodEfKJFNuSb0TjjbfU5Dhsa9XspkuMAYRA8K0JK1Dh
         Jbd/0IRoyC3MMv9P6aoXhEADJslcQdQnBUK6eu9jQ+L6IQYyEYDgd0jFre2GAr4yB3S1
         0nH/kyfzhhyrK9JoaqhuP0D6yU3PJtl+1oiYqmKMP3QDy17x7eGh0KZwIviFamY6KS6W
         eqY/GYukEr7YubQTv9LFnvqhTXEF7SeROYc9VK13TdQfNybvo8kC/0BEfkrv0ZCzSigp
         Lg1Ku5UR8s420rGNcLRYo6xg5/fxXeoIQCdqqdE8TVVsrmW/w1jbvPUEE8so4lmjYxGY
         e/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158891; x=1776763691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=;
        b=ZnrLxJCMj094VoLV87/It6pUcDnAUr4pTdWjkgNVggf06I4uHRyJamyxo8zN+c/nUB
         kJC2sMrd+FW5pEjKWdfPmnpqF9IVqfZqIVdzUjEDU8eZnsNrErm+sl5Yxlfc0Cat5OkX
         3dU6zlHUc6rtBT99UrZaqdoE1Ym7XLmE/j6kC7jjTp5yykq4tr42TXF3qQr4DafYkHfu
         yrX7t15b6iO8lneiNY9GxqvjoLPhr+AejQjYnoPBOH/2oBEXvLgUqjkx4RYzCaek4PUf
         o9ylG7UYIbh5nvXFhhb8amgE8i16lWFkkiBgo9k847Q6V4f/XV+ebTERdkLel0lTHE87
         MTdA==
X-Gm-Message-State: AOJu0YxbrvGhcR+nWS/guJqO/PG3jxCZVqWPyyNFwb5gcayoyrGpcwfp
	FJMN6+6CABUWzAX0VR98Cuk99lgE2BwYGBNaECA+xFnAk3q6ejO7C7AiZfq4ixoDhmASvyPDWbF
	0aRVaDYW0G5qR44UN7EO8oxa8u9cNKYQxR0G0krMkP0SMe1FPecjA6XMSfjC31BFyFr2o
X-Gm-Gg: AeBDieujtaBNzpVWTQG0fcGJFoFqrCZO5QrQ4SqISysLvNNRwZnvsehs8JmLeuVlnHy
	RC9hZREZ5e3xG7t1kntFcNuI/DhyPtI0ez0oaRl0w5oBm+a6gdAXW/lWlkcgTLbngntBzDqinqW
	sqS2Y3D6tlRx/OoJceu25tRPa9w/uaq8kVUIITK55ihP4yW0jRJLpA/kfLhPWckpIzN8zsOze5y
	irecNbDNQlMpguYVFWQ7bI1NDWM7aYKhW7ptA/R5gtydP1cCoqurHY4qgncDPqQyA6bYgUQhO1E
	OfbS0lSsbyCyVDFSZ+9BELATDmNtraJuq06VEgzLPSzRD+ns01ERYg/nyfgeKB45/z/SFvGWWda
	KrisuFL7VbwOSgTqOXfNW+Lmh9cBf/Zg3XidJT7bT9hV76jLZD6Ajd7VqgsZfoOQf2afJEo48Hs
	qORZiMNbU++loo0A==
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr185509201cf.4.1776158891249;
        Tue, 14 Apr 2026 02:28:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr185508941cf.4.1776158890861;
        Tue, 14 Apr 2026 02:28:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a15577f9sm892094a12.17.2026.04.14.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:28:10 -0700 (PDT)
Message-ID: <150d2a51-9fc0-444f-8009-9b2401c5bc16@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:28:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: qcs6490: Enable DP audio
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TocCrMvinlS1dmbLPdBsZilFaOuG1_V6
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de08ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L-W2jZRBQ8sxs3TRFuwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX9whXUS8HP8eq
 tZS+B8ujrU3ZTD+/JAFzDuFJXgFIxqKtHj48ZPkeozrb/oVyJ9mg2CXI57ov5xomCiSIQmIY/pc
 NolVblBFZ/M7CL10CQpH2NeORbiu9Tsy0fFcFdXmCD09W7QkcTnYHktIpEmcyMKMV/gtn56MxW4
 srAhb57m0sj8TMNSDoaTOuIJurcxdlky031NqSYGw16lmaYB793YxuohfIwLZ3e8T7p3ZaaqmDM
 1YasMkE92qxqJ4VpVFdNztfBPEUvDx2aK8FIMd8iT5PWfbbz9r2aFuLhlvYUIq9/VbBXOt9GIia
 AYIyt2yVlH35i328Wm505r1AdKGNRGeVA2Nt+ZmbUJKCqNIaptAbhXswvoYofQCEVTiVz0r9Lz0
 cDLgdHjh3ISx4ca493Vfe97F1AiUici06vF0+HA8z7SqhIcK+QQuZPJLsrNT1cUvjzHmY5vmBAy
 wcE+FyPIGDevGoXZJnA==
X-Proofpoint-GUID: TocCrMvinlS1dmbLPdBsZilFaOuG1_V6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103083-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: AEB3C3F7E44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Add new dai link to enable DP audio.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

subject: qcs6490-rb3gen2

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

