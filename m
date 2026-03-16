Return-Path: <linux-arm-msm+bounces-97893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOT3JlzYt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:15:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E318297C51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D5663012C61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F838F228;
	Mon, 16 Mar 2026 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nw85Bzj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbC7a0iX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC2F37C916
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656127; cv=none; b=TlHya4QXr/xCpEWnmSxjeRgcV42yZIsC6sokCmZWDY9KkSHyg1fczEL7KMX+vOLa02lbFRjK4Qea/Z61KPJYOv44qhQ2HBjREBzPKdaKw87vQObE9ivkdoNE32STme1tyD8p2HVObz0eOoT/Es2jHzB1ajiv8/dpkGEPGZPdDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656127; c=relaxed/simple;
	bh=W+GzarTkZQxf5Cs3/AqSFUh9TwFieU/YTGKXpRhcQeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqF1uNn+zxEiE1VYKGNtubQYZsFfbrWixVvraDMrpyPGfZtiNu3nlHQ56JvX2xNnvH82EX6Xt1UqJT2Up8Ai7nUadUwVq2lvo8Cgg7CoaAwPVfYcUZj2vxyel+nKM0+YEgAqyvQZfLPQAi/D4ZiUZ02H23qkglMFPOiYj6ZHe0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nw85Bzj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbC7a0iX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fVt1282110
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5f29stZvo4x02UtMHbpPEOGs9TVIEI7ZNuzFrcPIeM=; b=Nw85Bzj2Rm7nuYYM
	2eLkK7xgtLzbo8IuEQ2P8TtO+QbjNEt5FvmRXa4e/eK6WN8Wte0SdRhlmk1XtT7i
	MJcTQTlGDrl91Qa4PlW0WwniBCt4aXtZ29ukpObJeY1Ec37lqR5DOV3hVTf/mDjp
	Ng+dVHsygNfjOJn0XgGaHT4NBmQrwox7vEBm0ItDelQLB631ny82KgEudblhIuj0
	e+VCt31EuOnmNUGeBVEiRz3G7hfPUC8NKVjqpMlHNiMnf9oP9cBUwmC+tNj1AKGf
	EIKsNMfUcoCXZ/ioirrA9413MAj3VigkXDudSroo9O/C1F7NvEN9UOsYfGRfeHKF
	/qLU/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5407-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:15:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50dfd542so309706685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656125; x=1774260925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5f29stZvo4x02UtMHbpPEOGs9TVIEI7ZNuzFrcPIeM=;
        b=HbC7a0iXOwdUDkOobA3WSXVMwxgGEbEAT/loHehr6/oD48dgeG4LSxWkUbRE+vUyWH
         U8E8BtyOnyYjKMX+5MLBPzahp/nP7tD6lbM6e9LuOpesc4X0bQUpoTA3eoebCRlLnnq3
         sHYg2XKvp0O3BRFVbPOIldYXZoiXWLKsXBBriQZlBF1kXF0jZ4h32XradtseEUkt6LnB
         eX9D0lu0ceXSXGwym+IVKDXMCp2Q1f6ugW7Ozll9rbkvJOtgM74cT4HcxI9Nw/QG0cFO
         BJUaFmFqhdsKpxvxsqQqsRJxIGoWS12r6hBBrGMsvLbglkSFU30NoJWVKqUnsMoW6Kq4
         tZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656125; x=1774260925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5f29stZvo4x02UtMHbpPEOGs9TVIEI7ZNuzFrcPIeM=;
        b=PaajcjNjNcpkO6RR4mH67TUv3eGKNA6aUtidsDZClWuTYJWsUL7xGuXty/PtAInzX4
         8QoJ3nDUpdYfE0Zfcy/eWW8gdkDyW/L80MR/8HVYaBTpsUKAi9OxcASJmMfanMsBzne3
         i3Xn9tvnZoX4BVJMaOGqy6h+8TcIEg6JMVRKz072Krsq1x7FeY0Uj96pxn8HRfsDR+n3
         e3/WatMj5GCOyhF9uVcsSf5QsnWXBY3dO3FaJ14ubb5dG+mIyMjhDKoDxJxibd0btEnS
         AIQNz2t9clrgrmxWGCZslut5FyuMTVP3DKfW8T6fSX1JxbTwlgGK16MS0xV6rgdKjPcK
         m/2Q==
X-Gm-Message-State: AOJu0YyNGC5yaDGZsSnugYgwdzg+gb52jQO+1Qt/h+YXADznRiaMkqT1
	jpp7mLm7T2yol2SxVTF6S7nQQ+IT/ElkJOgXvDBIx6lbdVKvEKlqge6CTUm7ID4Ic0WRtO2/TEA
	/fP9XN808RiAiRAUQlek4MQp4ROvl4qnLCddE+Os7LFcQhk17UMhXUaiebl9NJCJ61XKY
X-Gm-Gg: ATEYQzzYWvYSxXsQ1FmAWRna9IgXJsXfGQBuA1IEwZaXVrw79nLMcnLIr/GmopFU94D
	oDrRteNa6aVWYIv8VZ+Uw4Wq3xnc95L2jQKxZDLl5XXEZhXVbdUobHWp3KwwoUaduwL3SED5VRt
	IGMiIWN86TTJlnwFJXwoallw4YzHHr69tJTt7SRgaGqvNZA4VSf0tHb693UTqqE9HgFaO2B2Mtg
	b/mydA8axbErPhtklefYBP8NfUPExEFfu5HDzzUsPl3rjE2HgaHeCIXJ/K2XcKslMnwmwchW+lc
	K6RQ2/Y+Gf4L5WsoCo05Szeohw4DF8gtF5hotb480crjWpWpb9JWG3vJcaq87WxXCUYqshel8NW
	IXxGNRWSzFAnySwq9oDIPo4z0aeBKYvx8AK6ClvYMep8n/vWeGudb3wRqef49le179rr41jF+8R
	rfNWo=
X-Received: by 2002:a05:620a:198a:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cdb5b43ac9mr1237624085a.5.1773656125030;
        Mon, 16 Mar 2026 03:15:25 -0700 (PDT)
X-Received: by 2002:a05:620a:198a:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cdb5b43ac9mr1237622285a.5.1773656124572;
        Mon, 16 Mar 2026 03:15:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978eb9d5c4sm429242466b.48.2026.03.16.03.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:15:23 -0700 (PDT)
Message-ID: <89d1b384-7a93-461b-8ecd-00eae1da58fd@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:15:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document
 vbus-detect-gpios property
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
 <d6d859a3-4137-4fb8-8b04-40abc86f4e33@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d6d859a3-4137-4fb8-8b04-40abc86f4e33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7d83d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cXWI3QU9x2L6Cd98jxUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vB2rvYuQ56uFUUDDshizbYI3sQop2iyo
X-Proofpoint-ORIG-GUID: vB2rvYuQ56uFUUDDshizbYI3sQop2iyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3OCBTYWx0ZWRfX91TW+AEgRT32
 LK8BLCA2PAxxSIsn721T3Pgbb0S6FcoAU24w+o4ywk7Zn34J+ieVQyTaQtee0gHqO85L/b2VuvW
 vLxQdPSGru+O1yr/PA6Tr1R0z+YdhhXzJoQxXc0jg2oSp4UJxnHTkqFP5ay5zCcejmL0qGcwL4g
 6tKfs+s4F3sRCsEo2+XD/CYOPm9DEKvxe1Ph/UouaeQp/irbbQFhR15AOIcm86AdNzrESJe73OO
 vB9++gbqaSjUmYuQ/Rw2tCB5sA67hQcxhBYXgP+0gy8GwlA3aD8nwT1p3KQhqMPKwkYFfaGlQ5e
 ZzVAgyFLHxMr3qz5j1jsboBI4EKX62L0yz+rEgekQLoTohODgqlIt03+QvsRxlo8l1nJ3PK5Yh9
 pc93fyWyxRRvuY2JRpe9PwUSFZQLldAnKeD+I/FfVnSXdQMLXI3ofuc5hittdU5DR0/5SSVcFOD
 GB10u7imkFAJ48G/AKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160078
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97893-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E318297C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:02 AM, Bryan O'Donoghue wrote:
> On 08/03/2026 23:20, Alexander Koskovich wrote:
>> +  vbus-detect-gpios:
> 
> Should this be plural ?

Yes

e.g.

Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml

Konrad

