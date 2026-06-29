Return-Path: <linux-arm-msm+bounces-114931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jOe8Fgk6QmoD2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:25:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A96D8258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:25:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jGgCX84m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TqSBwr9B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314CC304D764
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3783F9F2E;
	Mon, 29 Jun 2026 09:21:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2963F8ECC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:21:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724892; cv=none; b=dQDtLOQeOTFT2/UDYEUwdM8kpA5bWrSJrj2//W0jeijn3OADzv75opIOHqXGvcLBKV5ur8+9enz3tgFQlgOtBT7Q265+rofdPY540tSO/czASN7ysvXStq3UQkAFpftWmvDDhBJY2fxfCOTD86tg7KU0jkc9DYj1PV9hcQLEegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724892; c=relaxed/simple;
	bh=a9y3F15qQHEHXUPzxiXduiUBycO7pm9GPUedTNjBY6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gjv4Kz4TVu09yGFcnXEVIF/dPeX49N2CZ9ZKNKiq0F9MgwKH6sbHeJgJegYGW+hcHcaZ35hnXFNIRLsGXNrUHwKxczRwp2PEdhrgGAPiyAiBRbM+4+nU95AZYhYaPEadDTNdaj/A/z39OxVF5emYOsE7B3Qsk5oU4d2oszvz7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGgCX84m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqSBwr9B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xKNw2447472
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvKRqFaZT4QsqNsCb/8RdQNtvL3NSF6wNCLnxFXtedc=; b=jGgCX84mP/oiSZuj
	NBKhXtU5BgjMAyv99z/W3utzl6ISi8Ka6HBf9ORy8gT2aTNwRsjMcOmWBUXJjcnu
	I3XrB7lqN12oQ4E2vO4uN8tO3VuBlmR+n/RlyGD/WE4l30GLyXUYC+lorbF6+QlG
	0LjW69AYt7jbq4LUdgjigPOAh4LrpQQLFw4RXGngH9dJyAplDQq9yFgbmuMtLaJc
	T5F6R7aVf7apNKQL7hPtozbz3XwsrRpMAyh8YhxNKXFj/Helbr7y2vXIGCbNCnm6
	Py8hVCH1YEAfFZydPDpUAiBGMweilh3fszzIHg2eTGWm1jIRLeXi6mkh5oAxZhDg
	Y4TZTw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7g33k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:21:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96927edf751so73653241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724890; x=1783329690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvKRqFaZT4QsqNsCb/8RdQNtvL3NSF6wNCLnxFXtedc=;
        b=TqSBwr9BRvlpTc3NS7IuxBC/JpAu9krlmuUpFEPeNFNzpBcQzCmBOIiTSf981QRuCU
         60Pr5FuUPGz1pUsG1720wbAxpwNhsKOUWO811+HzFm50WnS4GrvCOQqIIJVLeLyW6GqK
         22GUx3QBN2Jdea7LOKuImaXeFUwFO/aN4V45d6YErEj98e1aEJy9QyFzUeSFkEeWmRA7
         XypNsvnNA6f/UYwUzpWc9RSxUS118JmFT/2wkl+6Frb+suCq1LDlbpGd8+ze8JT62T0W
         Vxq+B8++J6sWfDInmzwqgFVYkF/gyRm88+k80Yll+EknU+rq9TdwaGGvpKjx/dmO1yKE
         q+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724890; x=1783329690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvKRqFaZT4QsqNsCb/8RdQNtvL3NSF6wNCLnxFXtedc=;
        b=cqimMSkTRwiwTXzyEm1HHAzWUvgOVaJcDQ/vjZaTOuYgPMNTbtGRqFlxhVeIDXyVP7
         OjAnhJ0iazE5HTtGk8ts23FA2nB3DvstAvaJ7epwT4IwbYtIHJ9NVJ+3QPMOkYZNXV2J
         pNc9+qKvgy2ti3Q4nJ1iz63QwAyL8zULzrr9pWe84sRTkriFgLEiCr8lwQ6vlsLz0vPf
         3eVEz4UwGbc/LShcKOHsbBmbowug9wR5vEwEZtjmCaTG7oA7ODxkKRPtSDF6UTuhD581
         Dy1E8v7hj9X6nXNyjG0fUSX04GozLi5HKHDRKrD11p33VgvmKWjUHHUWiXmujcixsR2r
         sm1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoEpBHKzL9XKKYJmcN8Pvo12gl6CON4c2NCcWWHAgWj7wfrv+sChZZYIdOUF/xyqwLTUt3NdPQZx+7Ed+dT@vger.kernel.org
X-Gm-Message-State: AOJu0YxyODIxQI5pjSDe5VM9CWwtAqe1UosD4Wdtm+Zlvi+uU6bj8VhQ
	hYVzOabslWlsgSIpWyLtOYm4AEsd5zyYhjJbi9K/4dwOXaSifsHO3hPV5oTpp9TpvVHvHnUvYBC
	4fvToMCnr+1snjYUjkoHkW/QTXvnY6sI6GrosfHoqEWQImWF7ISJfDP7Ot/T8u2b/MkWC
X-Gm-Gg: AfdE7cnFBTUDaBq5eEeXzcxLqj7LPJCVQYtkxP8GD9AV/7mdF8udJsH8XSTg4fN2PlZ
	cxjkYceAIAHIocMZkmXTKoUzt3uegwwngVRxUvqTyBh8KXExdqf+7jOBDWMIEnf26wUdBV2tZ1I
	A7MqltvBseHn8pFj4d8V6cF+rpuRyjvEzLz/DNMi9J9WafqyvyZc9u9xXztRUF1vdiavDv0WCog
	rrolhjgWNDxw/zG6dGovPLBwtf/ixl5Ht+fyS1mRom1xgKj0+SltpbNumpD1zw8u38sNTF0rdLE
	ocxkm/TKViWW/rP4H7xgEE/7Ecd/sTXVyepNO91O6OpXtWwKOKBAWwSKnP7l0U0fS+To+12/mgi
	s4GvdOOlPWe4oc73llgsKtHlhnPrjLNkK5yA=
X-Received: by 2002:a05:6102:a4a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-738b13af99bmr445049137.2.1782724889851;
        Mon, 29 Jun 2026 02:21:29 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-738b13af99bmr445045137.2.1782724889291;
        Mon, 29 Jun 2026 02:21:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6983a7f3989sm3836391a12.16.2026.06.29.02.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:21:28 -0700 (PDT)
Message-ID: <a99fb61e-b11a-4902-93f1-47c32c5f5b6f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:21:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
 <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
 <akIAPK7daXxPH5JO@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akIAPK7daXxPH5JO@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX1TNe14ASWLXv
 n8qIGLRnu+QhexVEpg/dSUmu33LP2XjnNdUltiAQuWTMRF6M4qNI0HzFFh2BT82QoRDHyQZKnYH
 JLYD/jTJ1VRG5QxdCHfXZvosBD05UPbBcWGkg9DeKIV2m5JO8Ag+5QH1BkfVtSQsBvu9t2/VC++
 eePjPxEWhyHeRuoP5VEquYvTD7QlwKEZb0JlQqqMXe27l9YQ24/IONfj40EjjJjEOxQ/n2xDP3W
 djdgF82OHEDFJ+BWsP7TfJ7EJucsZpCTorvB0rmqSOP1XgPDz2JaaM8KEek9bAAN8u/vL9VmIe0
 8geEPoBefFu6T2rLw8GbQ1T9ep5yxbWJyQHy0xzqB2B058ESWy4ONeB6ULu/m/zva2RhxU1FECa
 0+mmveMIYMoUz5klDdVDL2Y3iWRSC4frznWG0BFLVxno4LJuWt2SnYOam3oto5USo8df3Y9yk7G
 92YK1RIOUvoeseSQMsw==
X-Proofpoint-GUID: yB6WQHbeaMTN1oShnlo7SJPQ0QL46rN4
X-Proofpoint-ORIG-GUID: yB6WQHbeaMTN1oShnlo7SJPQ0QL46rN4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX1POKMuesksOV
 xAEv82bJOi625uk5JuBSDMXFF3N25EcAJkzJB4r3+fg+vDX4mSV4GxivC/h3P/2LD9VDapg7L6P
 YWBZO6dEgLPn197A9aRvaIjjW9g6SS8=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a42391a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=T8ljNkuw5NW2mJYCfz4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114931-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: AC2A96D8258

On 6/29/26 7:18 AM, Qiang Yu wrote:
> On Tue, Jun 16, 2026 at 04:07:27PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>> Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
>>> link mode QMP PHY:
>>>
>>> - QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
>>>   values for QMP providers that expose multiple PHY instances under a
>>>   single DT node (i.e. #phy-cells = <1>).
>>>
>>> - QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
>>>   values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
>>>   selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
>>> index 6b43ea9e0051..befa76f8392f 100644
>>> --- a/include/dt-bindings/phy/phy-qcom-qmp.h
>>> +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
>>> @@ -21,4 +21,12 @@
>>>  #define QMP_PCIE_PIPE_CLK		0
>>>  #define QMP_PCIE_PHY_AUX_CLK		1
>>>  
>>> +/* Generic QMP logical PHY selectors */
>>> +#define QMP_PHY_SELECTOR_0		0
>>> +#define QMP_PHY_SELECTOR_1		1
>>
>> Is this for the second phy cell? FWIW I think it's fine to use raw
>> numbers as they're just indices (i.e. "nth bifurcated phy") anyway
> 
> I can't use lane numbers. In x4+x4 case, I need to tell phy the first 4
> lanes or second 4 lanes are required.

I didn't mean lane indices, but instead the same numbers you defined,
without the name. It's a minor difference though, and ultimately both
work for me.

Konrad

