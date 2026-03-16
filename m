Return-Path: <linux-arm-msm+bounces-97886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJKoI5rTt2n0VgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:55:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AC2977B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A24093090095
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4666C39023B;
	Mon, 16 Mar 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMNRTUwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlL2B0Ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD1F38F64E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654416; cv=none; b=LU9tV4r7Hd5FcdY7P6YCuU5+n39tx9BsPwVR7tOHM7mhIuReycA3XOJXUr9qAyKhaIpLr//zQSlPwqiHxHXc916mqChLIP9m4C5TD6SZgojEY4e20mAuP4UikaUPBVb/XaFx14H3de1Qm+PkPSeWkZ7mopttXUbKF89RKcpS+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654416; c=relaxed/simple;
	bh=5GAIeFCS0uUPv2PKBNS/6Rzen3mfcjnDIRp5SqOEd4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksI4Ga+GC53yy8vpoWg3hFl9XmQEnDOFAHxqxDCkbSrgQ56SmpfGDDML6Jg0msVVlEe64SD2IXotqPcXwNTAY9aUkzNed+Fb4lPF9Xnv0vZ1zOCMFwv4lZugQuckmnf7SkQFyrfkzYAtQWkqSKVTD+jX07iaep7Dd2HiwUwhUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMNRTUwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlL2B0Ol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7n27S041951
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=; b=AMNRTUwma2/9IaeH
	bhQbeiAOg6wVPg+ZoBY3OsJG18ZcZBfk7PTWVMNihK04XX8qfQ9e/1UGleaTNLVu
	PFVSxBTBwPXD1vu8TzOSue0qk3xB/egG3rvTqE6C9+0sTixg6dgloz9+aU5fga7r
	zIO2TCs7GJohbO/gFOWsiges1KCkuVy7etOnDAPMcrulHg63jpSl8Bs+SaSA9eCQ
	ZK0O63a9WuSEhBBSEMR3Oz2hl7g/kT0epWeU50EPS59X5uO7/vcmR0zmOX75NWEc
	cP7V3bc8DcQcEKLkA2g3A5RoET2BmGQC0MrvHu40CwekY2tR4pd7br6chi9O3xUB
	TZxJVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt80dsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:46:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a04e9d4faso35460426d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654413; x=1774259213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=;
        b=VlL2B0Ol3dngjeW5xO3YCotO9cWt3Z7eVQ1jFabFA9ihS+ihCcS+lwrYJO7dzKtt5w
         b3qaqVf6X/v13B7M8y8/zpyC0PJQ2mW/MtuHjYOA8cS3Lt0VzT7eXMtTB7V0TZvFJDoD
         qg0ajbAGype4P5LJY7pASOvE8n6ll0YS7u8tG6MzS2o4dhWaPGznAVSctTTNpfuW9bwv
         DGV/pmkdwPhOCgCiqt6p/abEtI9RElMgnyewRjifJoMjuPABtbRl4RtLp+8d9Jby3Sfq
         NrBP0Nbcw0Ovt2UwVnGMmpI7jLHBi/MIJwOuyUizd0D2ihZRMwjKddCcdS8N4YqtQ1we
         MlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654413; x=1774259213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=;
        b=Yc36WtRkoM/B/oQW7PHcSCShs33mXKVEEaG++FgK2xKaE/6MadL7NQwNvS3bjJOWNI
         V/Aoy332h7+/T/QbjUHrvNKjwgfnuUZ3ADcwwqchJHRKQf/zESizQWpI+LltNaDiey0c
         6MtBdNzwLwVGYahSxjZCS4SIqab9wLQcaEwM/K+8Wm+rqkkgl3stF2etjsWDTNiN8GXP
         Ii0729Gab6eGmEGbVZ1HmvXgt71ieikUodCytTsD4an2HwNXnQ1vwLeSSanqvM2N3Nhx
         fboyUnU3snBdFh3Z6TF/HyPw0Udafc6WL8xdkOYmpEB7aITnRp8YSm0ZmiVZ7BeiQveb
         lIvw==
X-Gm-Message-State: AOJu0YwpneBJW6g5n4rd6TjlzfbgAGidjzMJ1khZC/DOnF86kDHw2Tz1
	EvQ99w6bTfFXKxNrtJaU63rJO7wGd6L7yvwHXJwwfuCTDuwSwz2SBjizVJZ8Xanj1+qhammcl/s
	M0aNEX70Llr+STP8ckyD81u3BYOZBlm/kkZ7ph15I+/oEbxlSM/Lbp6V/k16JZXr6Ju9T
X-Gm-Gg: ATEYQzx84Miv/hY1DxnAI+uN0qVq3P98wYvMOTNflgNA4yMYQt3Bi8PyzqJgU/lpWTN
	6laIU9N3NljvD5dJikiNff2crNNw+WdgL11od83YjULVaz9arV4Lbo+K/2xVCswyy5Wepauqu65
	iFKQ1nAZvrQ0yvZC1FnbDzLBkKT2WNCAls45BfjrtksWn/w83S2jLh2L886LRWnuc1S1743F6hn
	xypeJgVqrE/rfLIBkFGSRYpaY88OWyuXh2OTa769uIvQA5m1Bc5SLb6oWKxGwplaIheqHz33rSx
	5g3XVyFBVG8l0nN0x5/cCTS3RZKwwv9YhOo/QAWC6CprfYCHet3OpEJwBMp53Q75BU3oqRNHJ1Z
	Y5iRHtTDGohjZV+5RUQd0HRa7Mj7pB7lADDvMSVcP9uii0gLSzZgK2q8edLJseb4Xj6YHmm/c7N
	KS/ZU=
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121904536d6.2.1773654413458;
        Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121904266d6.2.1773654413056;
        Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97ae89ebc4sm237981866b.34.2026.03.16.02.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:46:52 -0700 (PDT)
Message-ID: <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:46:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
 <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 681uRFjfuGCTxeXLcP3qxOl3im04lMgT
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7d18e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-I31x9S0JgnQQLvGL8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 681uRFjfuGCTxeXLcP3qxOl3im04lMgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXx9WBiugNcbAQ
 2FighMdOEnUhZhsU7CrmRfVy4yqqPmUZCVVyAIadCXVMYZhTK9XGzITIKvERZSpRhHarea+DQPv
 R2HKgw7eng8CicuBsjYrhCaDvXb/kP9JiKv5jxsk27S8izITNfJdVHPye2YJ3JFn+lCZDYMc2Eq
 JTqSXJt9h3zc7soJUHhDFIac+MGpDt39JCrOCWYNW2e4Ljk1vziTvSSvUy3WsurRbtbMqWtIyUb
 Y8M3XvLyfINEq8XDMrk5hRUhekJxBxBD/m1EhtnINAs9oxTfXU0P3/AgWXLnkfCOM8I5LbzSC/h
 WLeH1xhikmrvegBHN8fPFR2ztb6DdILkht6pCn1MQRDBWg9fHEJtLJV84BWE6F4OHjs+KAUHVPf
 DUxS8Us3C0U2fqdEJbKBbG0G3bdRmhXuB9+/FlOEQOInRmV84GPav1yB+V3hrIPbl/RCLrH0Ov9
 Knxa1enH/BKIfmmZJow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97886-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 0F1AC2977B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 9:58 AM, Kathiravan Thirumoorthy wrote:
> 
> On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>>> so add a driver for it.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +static const char *const Led00_groups[] = {
>> odd uppercase
> 
> 
> Yeah,  in HW document also only this name has the uppercase. So I just left it to align with the HW document. Do you prefer to change it to lower case to maintain consistency?

Yes, please - I would assume the original author had made a typo and
didn't really intend to have a single random occurrence of an uppercase
letter

> 
> 
>>
>>> +    "gpio23",
>>> +};
>>> +
>>> +static const char *const led01_groups[] = {
>>> +    "gpio39",
>>> +};
>>> +
>>> +static const char *const led02_groups[] = {
>>> +    "gpio6",
>>> +};
>> What do these 'ledN[012]' functions represent? Are they muxes for
>> getting activity/status signals for eth/wlan ports?
> 
> 
> Yes, that's right. These LED functions used for the eth/wlan status.

Can we better group them, e.g. into threes in 'led[012]' functions?
(or whichever way they're coupled?)

Konrad

