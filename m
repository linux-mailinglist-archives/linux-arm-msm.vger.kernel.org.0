Return-Path: <linux-arm-msm+bounces-106474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL4EBbS4/GlNTAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:07:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 658124EBD3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AFB630B8BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120F43E9FF;
	Thu,  7 May 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LATo3EpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewo0zEQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4306244D00A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169583; cv=none; b=GQ9Jo8Yu6aOjJFLA7RpK0fogU/RnPlygMs+BLzgo1xEJ55BgbAvgtEIlusCInJ8edYJ0OrnWodwxY1bYLhvrJJ5j6gMc5YRqFD+nYF0TXFl94EPEkHE8vbgrTOjRyqTUSY2ufsFeGrrTABzbVnsWvoJf4sQ4PMFTsIsr+d+1Na0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169583; c=relaxed/simple;
	bh=9+S2zxMvCv67KnGXE8yesBqn08LbdyThK/csdr0U9FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXZuMcJnwXejWPx6//qrt1OfdSR2xQa0PdXNUZnq2N+9VjxMRahdSInGZMRjujWk9G5mLjyQea5L44LlwgAb6DjmnNlpzYzsMkSmcWe+b0lY6IsgMPwrKeaxmvhkdyarXCD+n191VMM8p+X5pS5JlhkJcePK7KiPXCqxRU9KbV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LATo3EpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewo0zEQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647B0l0J682775
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGu2wFTIajaPBghQ0FihXQpYUWio1degOPuerHJdNKs=; b=LATo3EpI9rT6o28r
	KCoPbI3+MQtZievPhb720w5ihgtyGXjJZKsB69pAmEbfuCcRR8V+7lLuUTZZo99q
	lsRjkZmMwSxGPNcNZb8QJ/h/bM/DGv4/26XhxIxFvf1mi4/ep/5/xDGhe5mEvxat
	WsF8q0rOfUc9eaY+UXkzfbdtSYhjXWwjoxcym5g0nQwIzuuQicoGDzONhVtndOjM
	Y89yNz6vhdtitpewPXX3ZiudNR1QY9rb3VGesJm6SNyeXWj+WLZJWPkb1IOTm5UY
	rNmIRkOEA2rszmMvaE5MHz84IG3o2832IOAIzTckyjRuOMLnzoyllHVlQo8HYrRW
	8uNfuA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhatej5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:59:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso10847575ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778169581; x=1778774381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGu2wFTIajaPBghQ0FihXQpYUWio1degOPuerHJdNKs=;
        b=ewo0zEQrU/EbXZ4MTy5/lW8inso1w3s1Lg0P0Pfx/uKLR/dX23w3zhJlBc2cKVpHXa
         EfQ+/ek3z66Io9UCRg/b8BnQh/a9yQYKfRt08oTuOTNlg5fx5AEFGieQkU8PUr7XX6dF
         BjH1w6qr72KzjzGLnVVSSRRP2MKlH7+WIYuFtWaFEiDL/FuoWXjbIWgqfOSEL4z0Q85V
         v4eq8nuznRshmZP1O5Er4bcWUkJCjPDSknkw0IcDgnUu213yOw3VGQYl3M1XTywXfMIn
         JFycgb8L5rFJScB5WprB83An4+ZYDMS3gFbG00e0p7k9aCSK1al2AxBklmECvNgKAP9A
         LoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169581; x=1778774381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGu2wFTIajaPBghQ0FihXQpYUWio1degOPuerHJdNKs=;
        b=KPgI/FAhfn6EEoOT6887FGmZUWKVsTRAZ0N1v3Unog6Y1iNfCW+M3XQvaDxWPvoo9J
         Q7CopcaLao3JLOyQ1iRyRi/o9qzn1hcUKvUF7NakqpW1ni+QqbL/B0oIsXN4PAo+giMW
         n1HHjWOaxmI6FiS33ovIZKg5aZXydn2fWjxCzrDExG+TlOEsm4j0Hrnq3GDEQSUcx6WZ
         Wv7/Q7DSNORkD+TrLIUymkLsr6iFrDfLQxJZD51fXRPjQTXmyOsBnm2pnwlfW08N36hR
         dbrhhXB0iyWgjI9ymPlOy0nioS7OBEedM57hCnBp5WoMJ/yzn98akchOfizz4grAEeEv
         oujA==
X-Forwarded-Encrypted: i=1; AFNElJ9nU6wo100tyAFiN91FOIKwon4rCzVmByYtAv/UcZ7MH4VJzUf3ng0u/U5PUeygMcKO1EA6lXtUBgBEfriC@vger.kernel.org
X-Gm-Message-State: AOJu0YxUa7qQ2ArC9R8/blGWxpeQw5k4RvlZ39bgnZsyUYr1ZeDZjQeg
	FlLa7xXS6fLDCpZdXopdNb/QHz5TQ8aVsrHze1S3nZXay3E5HwfDPLVPhUF6K7neygvOA/EuxX6
	Bxi7jlhaq+rE1Jn4PFttn9zc4s1vbxEdDPL/BivYXX7hGFPwqxU0jK0oVCEFyaZB9OcyJ
X-Gm-Gg: Acq92OFeGPDlik7yPuBGeq1WxUuQ4XsIlKZ/FWbgmgXnvlFKVsLHUPQoFP+Fg0rqP3f
	+6lYAzjWXrYrK0ECwlLUIKKkxNp5EGmYdaxuBuE43A5/6YSaCe9Yuxz2DSLi7uw7WxIdQgnSajh
	fMErhgm3ABDEd9e7YsP4593QCUzJVNt3Ln8o3Tp+TAzZcvpAvhl5B5JYOHFScRPdXxn9fF2h6Sh
	VJbJnqFIj0ES/n0w1PfOpoPSNBh4ow5qyBR+fMQXSeu8oOsKYm7vfJkjPLE5Sg4PN4KMbeBlTKG
	qbHTu4Y5M069amjNFQbI6IJoCX4itUFW7UnOnsEUfphqHXsYBA8UXwO8G8zUpbxaC5Uja9LM+8P
	/AdwTJKQRLeEdr8C0ebHAeixFKRPAwX4X3BK19p6Vb3hoCUw9E5/nR4k=
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cabc with SMTP id d9443c01a7336-2babe5fcdd5mr36392195ad.32.1778169580366;
        Thu, 07 May 2026 08:59:40 -0700 (PDT)
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cabc with SMTP id d9443c01a7336-2babe5fcdd5mr36391845ad.32.1778169579854;
        Thu, 07 May 2026 08:59:39 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7854891sm1194865ad.57.2026.05.07.08.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:59:39 -0700 (PDT)
Message-ID: <2efe667a-c3fa-45de-88fc-ecded1f34543@oss.qualcomm.com>
Date: Thu, 7 May 2026 21:29:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
 <20260501-glymur-gpu-dt-v2-1-2f128b5596bb@oss.qualcomm.com>
 <20260503-resourceful-walrus-of-bloom-3ec6f4@quoll>
 <1136c1e1-749d-455b-9176-5e71fc1fe18c@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1136c1e1-749d-455b-9176-5e71fc1fe18c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE2MCBTYWx0ZWRfX3U7CzZCbV6ZE
 2UZ+JZJfrJ0Vmx0LgG+vO6Ef8GteJIn7owBP6G7eBRX+yC62XFjtijpFZ//2q02Hzzx0ZfN6OTo
 pu1YY6PIoGFLymiiOYizFdrWIEyzWGV5Kwt65/adoXnevkXTcAR4dirF8jyjkUDAEty7rHq2vrT
 IxXWSoepRxCNDWdlYU06hs5VtTiVRz0TTkYmnbKq8jHfqlEgXDt04XutZArewl034SjOMtHdEbd
 3+MyEmVNTde/KV2nQgDQ5aeTVKwhSSwO6lolYpgx5MOJ+3mUQUhLHb1BQ/zn1KHhNe9pkEKO0Jt
 6FLo6a/i68npSHYLYmvcdAGa5oPilkUS9yYjwwO4dMm+xcR5ohEWQexLxbCzcVj+dRv7zdOQ1gN
 RA7ntCkmMe67Rwh+gz7Y50Pp6RtS6BbeSZAUL0ZJy/6+g/ujx88XZ+Bv4JFTW+WUe8Zo8p/+pe9
 nulhzUBEsFoCGGql/Rw==
X-Proofpoint-ORIG-GUID: AO1Jz9UwBDQOQqcREwNJX0ModsxJ5ko5
X-Proofpoint-GUID: AO1Jz9UwBDQOQqcREwNJX0ModsxJ5ko5
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fcb6ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i7vGOPbq9zpShFDyuUEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070160
X-Rspamd-Queue-Id: 658124EBD3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-106474-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/3/2026 7:43 PM, Krzysztof Kozlowski wrote:
> On 03/05/2026 16:10, Krzysztof Kozlowski wrote:
>> On Fri, May 01, 2026 at 10:40:37PM +0530, Akhil P Oommen wrote:
>>> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
>>> It features a new slice architecture with 4 slices, significantly higher
>>> bandwidth throughput compared to mobile counterparts, raytracing support,
>>> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
>>> other improvements. Update the dt bindings documentation to describe this
>>> GPU.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> I was a bit too fast and did not notice that this is only one if out of
> two required. Where are the constraints for the rest of flexible properties?
> 

I will add a new entry under 'allOf' for Glymur to describe a constraint
for the 'reg' property.

-Akhil


> Best regards,
> Krzysztof


