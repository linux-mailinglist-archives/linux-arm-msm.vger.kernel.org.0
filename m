Return-Path: <linux-arm-msm+bounces-113861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iIwGFnphNWpxugYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E88476A6B9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DvGkeaJV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=axaCW0on;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF7FA301585A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7E53A05D7;
	Fri, 19 Jun 2026 15:34:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C7396B98
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:34:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883252; cv=none; b=nd+/wrqm1+O6KQTDHsNN5F140lEuxKfBEut8NFfxjghosTvzMtiTGex7eyW9Joki018WbzwBEMwSM8V2pP1XjXf1eqPOvwpIGMlOgHyegQfsy7JyoWnc8YUoNCK+kFerncU3KOOUS69gmRn2l4z0GQjZQ4HClrCIGssYwheNnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883252; c=relaxed/simple;
	bh=Aw8CQzLmxIquRNmWkUPs11YrpLF4MP5WQbcDEG9bDaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhQ8FB8c5oEW3eZ3x/jnITtHfUpd7fe+p/ndlLkjjpERg4yuhTFNNJbPJ1VT3lgNoMVY/LHkLF/wmFkQvpl7HV1F7KSB2xj0e/3naM729GPd6uG0OJjV3ekNVKeBXOfue202/HI2pIzk7o462wgsgj612+ecAhNhAd7h0+S/1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvGkeaJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axaCW0on; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC9nC556795
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFlLtab+77FS+ycmX0rT0Ax8oRIsV++t3wwXuk+Z/Yc=; b=DvGkeaJVRQ8WGpk6
	ItupFaN/am3GZueUSSVLxwoji/3HPQ6BTtcdMKLllRVQCe0tbNxpPT6B1/xSH7AV
	kWtK0GD75tW6qa9kv7PFvod6cJUpTvDBZdc/No1Dud0d7uVVRcfSks6b6jQV39zw
	hRXCmsdY25jT8FEL8lWgN7WbVfuVaMkl9NkTKkt3gAXxFU9rZR713xmJXNyIxHsr
	ytX7keG+0FRc4jRrHBsdiVbW4LrUsDlXzlT2VGFEOtiPzRrIyLfu5ZGUKPadc0QU
	FZfVziEUZ48R9O7kh0XCFCQyap4t45ylF9qwx+OiQIjAZIyawtTs8h6lTOn5E5tH
	8WyagQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuuhdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:34:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-729420bc3c5so134718137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883249; x=1782488049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFlLtab+77FS+ycmX0rT0Ax8oRIsV++t3wwXuk+Z/Yc=;
        b=axaCW0onmqEIm+FqBC8OJ9dnmB3wn+9+WKPv4mBn4kO6yfAagLG+AzdYYzhhmlZ2Yb
         6li5qP1VC/a+FYnDWumsmHGsNTl3AEhfGJsz3wfd8kg4pE1Q8Pejm/d9ilmxzuzSRAjh
         0YK7Op/bt5nTKgpeZ03LEBqHuWR8h0THWNl/XhAPWUEJQO4jYQCpdtv0DWJCqz43uCTp
         wP1nGkhoquoV6+somgUirkahBBxxXpcSvWn0uyDBAdLPrvCC9eXt53C4MSYu0mjOMc2+
         POL3QQtdc8eADnm+rMnYpeWt5haOPc2iihQUHtvB8CS345KPH0bnMM1fSFu25lkJFzH9
         BaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883249; x=1782488049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFlLtab+77FS+ycmX0rT0Ax8oRIsV++t3wwXuk+Z/Yc=;
        b=rLl3SQtAQOW1VB2WsM22Ey65EOg94dQNP+zHGsAXBFeojY9Jztld/jMl4FioNugIKw
         ztngfH0nvqJXp/oUFIiJBdyus4KkRVRkKjhkDK2ma3Qlf+NL0CwPxddZlxq4Ot+PetMe
         KAZQzYqmssVH8nPkLa7oz7pYsXD6cXaDEVd+NeVK3lwlSxj8HD3KfChKyl6bumpbclYf
         RUmqwr7brUr/vBQm7LlXlTehnfChC7JAvGoAard3ZXraODBC5R8n6UbzY5WYlVMnQfqf
         so7MFgvWo0QawTRRhyRgEMIscUawmge8ze5c7otjnbdr0ypyaNN53x6RYV8ZrjaRS36V
         qNgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zZM8MIDyhBMbD6OAgHWX6AKdWswHo584G/EUYSXIP998NWnE1+id8AN/S9s36/Nl6AZfb+SpVjj4fiXy1@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqREf/sYkgfQm37S5ef16tZ3EwtuU4lYwhLwcacQKNr4UcgBh
	vlAiYGEloUusN1Xl2qgRPNByUviyZHhGJiYVOn1vcJTp1iZLxGWqqT4IiTvF9wA5/pldpqZ/2qE
	qsExGqVbw8tB5ZNqq9dVJ3GeuJdc2um3Ka7/QKz46jwndAiOMQEiztc76QU+/FAQbOqyx
X-Gm-Gg: AfdE7cmGpnBz4X78bbLjpsLbyzi0z1jzeWMygFVWYMeo9Tn8cuKln+aJIa7twxiOwWb
	iE/EvY0383I+1nBsAbukIZOZ2m8LeLnRcYzJadb7RBT4D5tAHXFu9JT93rzBpOycx/58ftkTygK
	XJrsZ+62PMKWHAkT4kztuREEOT8VJqJ0Ou1nQ5fV6VobMy4mORePXPydWXdywDm8Sr/hMkgJjn4
	6nPIqtAArSCgq83Q8BczzpMn9/iHpKwwRIjbabhW4dmAyM4rwzdb8SSALAcdMO21emAtZFuVx9+
	TdIZmiGiGcs7hvDQc46deKqD1GX4IWlYbnVHD8c9zMENimbGLFNsBLhEXrFA46K2mFFAwNM2uiz
	WN7SiOOykyQPEw18vn6p+kXl6rDpz6KDfw70=
X-Received: by 2002:a05:6102:b0c:b0:727:36b9:dee with SMTP id ada2fe7eead31-72a05233a70mr1159172137.8.1781883249018;
        Fri, 19 Jun 2026 08:34:09 -0700 (PDT)
X-Received: by 2002:a05:6102:b0c:b0:727:36b9:dee with SMTP id ada2fe7eead31-72a05233a70mr1159160137.8.1781883248616;
        Fri, 19 Jun 2026 08:34:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cbfesm95830266b.21.2026.06.19.08.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:34:07 -0700 (PDT)
Message-ID: <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
To: Bjorn Andersson <andersson@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Douglas Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ag_QL5DIo7MxsdYU@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX7YXHE2WCd9R8
 UNg36W+kFDaBnHpYOlBW6oGXsLB5xhbN+u5sTSbUgR/PA0oDEDy0Qx8yVgkZYjRDAXtoCgibAbH
 19uEXoh8JmdgjFkTkvHWrARsVzqVR1s=
X-Proofpoint-GUID: kG23HwcyAJa89ARLHq0cRHdsI7pDmXc5
X-Proofpoint-ORIG-GUID: kG23HwcyAJa89ARLHq0cRHdsI7pDmXc5
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a356171 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3UH1jKWRaBeUPcqG0MQA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX3ahzgMH3xsnl
 Cj3yb3XW5uqYXsIYr9m/6XS3efqzcoISyvX687qTvqJybRbfQqo/K5RMTMtuycidvaNZEadnnvU
 RUmX+La9FsDZje/PTsJqT/jfLKNdN+t8tFCiwK1wt2/BtLMxw39IVVeHKOQMm0xC8LxEzVt/Dy7
 EFMkBkKaNBooYS/WxXwgVwGefoeXxhCAXnlshoRPCogvYHMQX0o1A4Lf7UvByp14uWtIGXRWKha
 +TxUcRste7WdyRO42fUbKa6KSrAYJiZ8ttFx/gDRLUpDHMNIYIa8GbAlJiNhZ0FFWcpb3QVVS8v
 857CKUpX+8Yrtok+X6UO5vYQOtwSBsbwl+4P/37MnuRitV1Sc7jyZs3s9CH+nv7JkwbHdtyOjwO
 D6tXFqY4MYyqYlsCK+6O3L4df6Hvy4gTClESR9Pd5C8ILhLMnSvsthuho9GhFXyY0JencZkKgTs
 Vi38VQB6ybcfSijbMrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:dianders@chromium.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E88476A6B9D

On 5/22/26 5:41 AM, Bjorn Andersson wrote:
> On Wed, Apr 29, 2026 at 12:10:39PM +0530, Mahadevan P wrote:
>> This series enables full 4-lane DisplayPort operation on SC7280/kodiak
>> platforms by wiring up the QMP Combo PHY correctly and consolidating
>> the DP endpoint configuration in the SoC dtsi.
>>
>> Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
>> which is required for the PHY to respond to USB-C Alternate Mode
>> negotiation and switch into 4-lane DP configuration.
>>
>> Patch 2 moves the data-lanes property from individual board files into
>> kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
>> It also removes redundant remote-endpoint and orientation-switch
>> overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
>> are already covered by the SoC dtsi.
>>
>> Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
>> that mode-switch is in place, enabling the full 4-lane DP link.
> 
> Are you sure that herobrine has 4 lanes routed on the PCB?

+Doug any chance you still have schematics for that old boy?

Bjorn, perhaps we could switch to a model where we define the max
capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
them as necessary? Not meeting these is borderline a board defect anyway

Konrad

