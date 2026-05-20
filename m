Return-Path: <linux-arm-msm+bounces-108750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAzeIH+wDWpy1gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:00:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4058E641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BAC1303353B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844CE3DE435;
	Wed, 20 May 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLRhJku1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXBR1HEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312833438BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281670; cv=none; b=raufcYzajVswMxVSvJy0WHjvJTFI/baPhlX/QF6nypzRf9gLeKFUvDYRkdszjp+kOeXlHjelyCA69ib4PKFGd2RPuWScLiyJ34iK6DL+kJe/Zi/1dw63yS9wGKyLOMSBlSHiYHzl8VXCn57yFW3cQQiBVjpl/fl6P1GM/PPj9Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281670; c=relaxed/simple;
	bh=JMOHCzSskxk9SodFi+k5hXlCfeh6kYZnY4uBi7QGsPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlJsEpLtnujV54rIUh34EdUaugs1wHVfkqGopnApdOXXdXMt4VQmWLtptvFAuEdSxbLJ3ZyP/uvaWysdizBGgPT8nK2hOonuL5Ue8lffPAdkBg1woKjSfzmA4rWo+0sKveYkhI65Ka7Wwk0UfLuWQnlRSb/PhX891yk4JDKPZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLRhJku1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXBR1HEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCpDa92983956
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Dzs5PVghvmsHfh8+8zkBuOfRJJDmi8DS3v15nIcsg0=; b=MLRhJku1aJ3gq/oY
	mweYadyyR9zL/KTChTJ8P4QqqYv26Lvy6gpYAsML+RcW07POBE5pf9v/FQ7+cP4d
	SRn1BTNRxQy/GqsprlElfn7YLXhsuO+seP0KVIqMQ1kp2CmCibVQc3VGm37oYuny
	TSkE45EUT3FqKaUXS9zHTgLRORRipipk+S14Tz/hRhxcX5+A5yNLhc41J5ovh99g
	haXOKi4LGf9I2db+OpMES+nrRpQ5jpS9/ONAP0289OaLuaKzFyruUM0YGlrbWT9N
	Ji40TEFn1jIvxs5yOrs6mXyt2tihN567lTPiSH0wFOJqm/DN4yUh+X1tbQlXvpUC
	aCn9xw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4v31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:54:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827c880e39so2385507a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281668; x=1779886468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Dzs5PVghvmsHfh8+8zkBuOfRJJDmi8DS3v15nIcsg0=;
        b=GXBR1HEKONU+opCwizLLgNCh/ggG04MxUv860CWZYtrP0DW6oxXoNNQXhUxM3Qee29
         lEWxk+wTiiwyGrF7MoFaRZem38N0s8IT7srsCgGK1KO4AqPImf1BziaTSR7+hRDGvMKl
         GBJla0BomnmEm2FeDG+Yjyk5LQ+uRACWuMy5kkuPF6WoiQF9O0jBBR75j89Hjck0U7jn
         0xLdvVbf5X5lgjLOdlH6/L+BEqCCx6EKubocn0kqBrVsVLQcmKcVwu+GjoPEknJ1wWLl
         woeQQcSaM6ByvuaH0tZN5m4BpRTC+Mmr5T4Qs5E7EPPS3LJiCX4JbyqGiZ7L0oViuFja
         OyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281668; x=1779886468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Dzs5PVghvmsHfh8+8zkBuOfRJJDmi8DS3v15nIcsg0=;
        b=YFTuSvxSVBHqFcQzFoGE1qnwXFzvgx0w8yf1njUzVfbcDqIJ2mdBImzNgFO5GLnXJs
         qzFB3OeWe2TR4V3zhKwcXUY0MeMWK9J0rB9qATGwabN/leENxx8WVAoRIVL/yvlGOLUH
         UCGuUZXDEkAF0Mpcskc+KWMJe4BP/0YMrhGvER9j4SjbvMqHJHsYyj7tD+ipQJWiel6/
         LdwwZyn4F3P7wQi7gnaT8mq8a1GW0Vorr5djN5wsK34jO8OpsiQfArgWLIFQDewOjelB
         ho2HNOESx+5pQrj2JjSpxOfNdN/ZnKZf/Z1ZFCPIT6GAetI0o85OYkpOhwzCgXAZx6eM
         pm3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9yEI7YT5tyOIOm9WswO5n1XB6oLMVtcmUZBd41mqrdKJ8WEliWwVfLxJ4ilBqNKu/lL0Nlu7w3/JTpLERw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5F2ZJKBxvbODvYZFUCNCcxFn5GUPFl3LQmIZ2VoqvU5ia9p9r
	DPrjfD9GEibTuE9/cxpz32lps0U9uX8ckWWWFnIm96UTTCL53opFlzOFEIEd3Ck/WWxGF/V3eek
	JXT4iW9TI8tC6BNQNNo0VWOWB1xXxfjshd8dqyEsXlaShTy+9PaDFYiVrTN507kIPNGHg
X-Gm-Gg: Acq92OEERrKKWymZuLGl6y7E2eULxhHQdNvJSTy+LKtl39nUyTR7bTJtIs3NDH0nXx4
	Hbp6gPq2nRnqSXLvLCOY+N41wS1/O9MwI0E48jC+zwCa6XUQHAmtfMQr3wMrrXNHtA4Ky46dMYi
	hHM5ddZ9RuMLat8TK6EU3mjBnDRRMmldokh/60pDw4LUKa1LrrJO3mm1/2jXVW3YEF0u4p+S11J
	KbL1kVSA1mSPdYfRTi7OjL6j/vW/P5JbAVQtxH3Aui9H0V32IVIrj4UGiIJQSQ0gdEEB0BQSYxY
	x/bB+61S7QqmAsxNwo3JIo1k7nWSvSF5yJQmKvzrrU8dNX6etT+7TsMb1AFhcQIs9PlAAm9LhN9
	AK7e21OmCf+tErAr+dFSQPJ13DDeH+wxTTX0ygfBJQkf1Z/5AFog=
X-Received: by 2002:a05:6a00:4508:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-83f33bcc799mr24430006b3a.2.1779281667714;
        Wed, 20 May 2026 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4508:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-83f33bcc799mr24429973b3a.2.1779281667121;
        Wed, 20 May 2026 05:54:27 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm21472794b3a.1.2026.05.20.05.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:54:26 -0700 (PDT)
Message-ID: <1ebc7c8a-b0de-4f25-b4dd-571909f9c67b@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:24:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0daf04 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6rjBTs_pIWsmsDHkzHgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: PXRfuGez2aRlFtrM1k1sGKyIANOmL7L1
X-Proofpoint-GUID: PXRfuGez2aRlFtrM1k1sGKyIANOmL7L1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyNSBTYWx0ZWRfXzbAA2sMos3ck
 5MOUCxEA2p/d4+imAd32gurqEZ7HSRLrZDYL/eBUuARszzcsHjC14rCFLhFfbT8GieU/O6FRkpv
 vLV5Ffwg9Bm7gNtC0tzAUQ8APUJqyrccQLr576e00Ey3/yKLw2HyKvwH6PI9fi5+3pNOmtDgT/w
 +KcQtwoNG6IxJRHPV39JfQDhASlWObQ5Lr45osZobBP1Lt5xZwk0+TPsSnX3A3JqPevOSIymjT2
 TBMe5QJH21ctjfxMeD9hsZwoChcjTqcjdVo9WHJ4S2dIVD1/tdAiB8l83koNPWz+7DGDzXUrEpV
 go7vrOGW1gYVdlMcGVEsglCknRDkVwhRMcPoOl9Iuj5Q9xee4q6QWN12FmXZLMFOgVj+6ZMUXDU
 nOueVeMKuRK7horavbDoDGE67jxgYLaDgBfQEribGGsz0sFzsMWLcRHmQRvswDHqQ4CCp8LxAS0
 Ui1QBJpL4tsuhCmFZPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108750-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[devicetree.org:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18C4058E641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 5/18/2026 9:53 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
>>
>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
>> supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
>> supply (avee). The panel operates in video burst mode with four data
>> lanes using RGB888 pixel format.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> ---
>>   .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  7 ++
>>   2 files changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
>> new file mode 100644
>> index 000000000000..93c511d03c00
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ilitek ILI7807S-based DSI panels
>> +
>> +maintainers:
>> +  - Arpit Saini <arpit.saini@oss.qualcomm.com>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - dlc,dlc0697
>> +      - const: ilitek,ili7807s
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  reset-gpios: true
>> +
>> +  backlight-en-gpios:
>> +    description: Backlight enable GPIO (active high)
> 
> Is this actual GPIO or the GPIO-controlled supply?
> 
Addressed here 
https://lore.kernel.org/all/dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com/

Thanks
Arpit



