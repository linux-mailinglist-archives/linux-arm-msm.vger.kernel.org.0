Return-Path: <linux-arm-msm+bounces-107579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJbDHFa2BWpZaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:47:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 072EA541342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 749FA3081B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A3F3C3795;
	Thu, 14 May 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kj3aIRnE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ctms6EV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D93C063F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759106; cv=none; b=qqWpWv3w5rpg7KdAP3A8zy4YBng4fM9q6vFVHnaN3HzMHP5xfJuntRbt763ypkDbiYeiIRK/FvzFEM/JFgykEL6os/kGoM8PE6nuhrKuMbZMnQ0NvrPciUOljDuRbtwSTXarxDSDd/50mPyCJj34LFg4AwkQjO6ZG4cTJP+C5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759106; c=relaxed/simple;
	bh=9KhAlBIOB44DMlznaHsWijN42EN6qQuNmoZpXvryfMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ir98AGuTDFBv6PaxTSSgWU/KeJre1dz7dxZiVC3yRArMGrs14eiWVXwhco5JqnInXsPmzDtBzvsGSVEG/TwpxXEVCnxi5JFnHJQkJ+H7l8oIO8ch9PB47d95aju6mODwvX76vTxfV2pJZ/1OxpEyGD5VOW1jjAp8ryagki9d44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kj3aIRnE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ctms6EV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBescB2842121
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y753qtYW3bVQZ+qckZjvBQEwwv+vQsRM4SYrgC/lNxI=; b=Kj3aIRnEhEeWrpDS
	4OvvvYDAB5DmjsDsJb9zMho5PB0BO1WfE6edlBjMObrCDpSk7CS//vcpx3m1cHY+
	bq7dViH66LRXfV9xS18j/80lWcTnJUCm2qjk0VqAdR2808xPMt66MOSGQRfl+d2g
	hRmQfz0WPDi31sdP8vQKmRRQEB1Hzh411Umzk+SKFzhJU3SHYKEhxbi0wTEA7wpZ
	ez+0czLwTehy7IckVrTYqCoN2nqgGFjtn9c3UfJt4xIBLuOyyvQwLg+HZT9Rf8Kc
	MSwLOTd1twNFTnxY5+FpqlGATZtXr+tJ18Ji0bZJjES6fOIM1YHihQImSj+282J7
	b9LnOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899s7qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:45:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b673c8f1so75903141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778759103; x=1779363903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y753qtYW3bVQZ+qckZjvBQEwwv+vQsRM4SYrgC/lNxI=;
        b=Ctms6EV0MHHp1VfdgQbgInnuPezEKimbZlEk8NEFJPF0Mo65mY0sre8CVK4HS7G/Nb
         C/mY10GQuoERNnP9KqnBlbgEd1R7mceBwdFD/cX5UcJa1PGelW1TaJBNVzhQbwQtCKr/
         fnbFe9jzBzEXZUb6ZnooGsLjNl4Bz1pVCRvairg27ENuGpTlHs//CuyuAdd7ENVxoa5R
         EyT5w0cwHLGYJEmh/S/Wa+8apFc0yubkeuhHqalASyNOaiMYs3dF0Z1oLEZutnPi4hZv
         hjc5NaldTMmrxr5pVatuD9iicTTZQnuLrh4zKMR46RFHKpFp6OWrBA9/QrAszNEIP8gD
         RIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778759103; x=1779363903;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y753qtYW3bVQZ+qckZjvBQEwwv+vQsRM4SYrgC/lNxI=;
        b=YmOqB72uUACjJsNN15Wt0dx9vynG1EwOR1gDgAHWsfqXurSJBoqD20C006v6J0o3tx
         H1ZuDsveVEm+4SIe8r89fk2KkX/0RJP8rUZ7Tar1ql4Eigz3sR93xZF276D+MG4Czpwv
         9qd6Q3Fbmwa1dB5UerDl7Bf+S135klj0VFFEJDmpmYaR4vGomdlM1I5TCtCRdPtDAvo9
         4ldPJ1wOZJWNavU80vW/FuC/CpvkYz9x17Jit2OSJMVUW+c+Nv7fN6Fy1TA4Yb1Snupj
         gGjHazPXK/A+nP1WYiMOhOP1jAS+qEPV+CDKEvwOh4Btup3AQ9KIExkBtHsPbtwGWLwM
         leGA==
X-Forwarded-Encrypted: i=1; AFNElJ8+S4yhBfyzp9VH+ISwJE4dwVRkSdKzn7mUOhYXNmna+NsHXI9t3vmD00gvAlgTX16UDin2rQ8Yog1g8B96@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFIuq0dxMscEo/w4leAJkKYQnOuuwb+wFtgp5vpWf+vQXtyGA
	0CLvRxsddIpndBI1+epWSUQIJf//JmdWCjIXqsrGetH52LD3zUdU/sbGFwUOwFnEKiAYYG457kG
	cH2bt+28tgIKajf7tsCaNagHQ+XnY57xrIUSv557Yeq97J54wVVYfxs0eDKrQSnFfQl3L
X-Gm-Gg: Acq92OE9bRt3b/HqpgEadPlkGq5lEzJiahGoqJZS3dyLGXCaLqew87B89h0kXhyDmFq
	Vq3fkufShhf0oxALuOGRwCXKM7XtCBaOlwLJ7e2MUba6X+oo+/UmVbOn0oQ/H9Qy17jsLIZ5jRT
	7K+QBWggit6sJOJh0y57UuzovbM+iRaOqoskvyNYiYWGkQnLE1SGu53l3iqzCzg67+ip1JKvc+1
	13X/7tHaUJdD32G7rpOwrf3E6t9X6+h8xX57Qf95fWVu+5goWqtjCpUOKlIJuAl2g+pm1TraxSD
	EbIgxZos0q3qTB2YWUYjHex1RiZ2YZbfbQPpdXHEBk5tiLsEqRmKbI5ZwSwNF20JzTkkdLi5/QZ
	pY+LPgzJdUop0dxz3SJowLPVMTM+DpkftU5AzO++tLZyzVWaK
X-Received: by 2002:a05:622a:5c9:b0:50e:a1ab:67eb with SMTP id d75a77b69052e-5162f58fe1emr103521761cf.33.1778759102881;
        Thu, 14 May 2026 04:45:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50e:a1ab:67eb with SMTP id d75a77b69052e-5162f58fe1emr103521091cf.33.1778759102401;
        Thu, 14 May 2026 04:45:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd6498cdesm73519285e9.5.2026.05.14.04.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 04:45:00 -0700 (PDT)
Message-ID: <66b3840a-390e-4135-9118-b1ca52d40026@oss.qualcomm.com>
Date: Thu, 14 May 2026 13:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1
 slave
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
 <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
 <fnasmnyh7rf4wtyrv77lunx7spilgjxji3ejflvufouqrdep6n@uu7pkkfwkxyi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fnasmnyh7rf4wtyrv77lunx7spilgjxji3ejflvufouqrdep6n@uu7pkkfwkxyi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDExNiBTYWx0ZWRfX1nPhByFfKRax
 mLT42LXzqKB0+mKes38VmZCyC19jEA+BayF6r218Q56w4DE5quBWMSq+Y/a0ax4Ly3c4FPSG2fG
 YfmVCDQzq75pteE8XyUrUSQHYHM7h3nYrDfUZ26XhVZ9wUYQtmHcZlQF9k/gOpuOxSvHX4Qspws
 WtBeQOR/f3hyHhCU20mZigsztl3tE17ykjNzWi/ytGY9ejPq4TcrAfN1r6ih1yXEpm7WfhXnBKa
 +FbEe2cutH/TWQgJoLMmpat0jwOcjYs/8k47ahppJ38WlGBSiroCCg6dkIHMBHe8+VZr9v2km/A
 Z4R5AeYGaozqvxOwtT240cCye8trXwKaD1b2z5g926LXy8kf3nDzCWDTMr7xyjGbwx/OfLFfgfM
 fpgaqrH75rKlcFt3j7P59QHCXmYItczOuAgnuksx306l/eXoN5txe+pf3wqaoQ3Or/rq3gvc7na
 vXzO0hm+UQL0AbjeSnA==
X-Proofpoint-ORIG-GUID: pftQNTNvz4axBQ_ZD6bss4GfeXpWS9Z2
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05b5bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=79RcByrGND5wjnUeYAgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: pftQNTNvz4axBQ_ZD6bss4GfeXpWS9Z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140116
X-Rspamd-Queue-Id: 072EA541342
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107579-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 14/05/2026 12:46, Abel Vesa wrote:
> On 26-05-14 07:44:12, Krzysztof Kozlowski wrote:
>> On 12/05/2026 14:18, Abel Vesa wrote:
>>> The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
>>> slave ID. Add it so SDCC1 consumer can describe the corresponding
>>> interconnect path.
>>>
>>> Append the new ID to preserve the existing ABI values.
>>>
>>> Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")
>>
>> No bug here to be fixed. Incomplete first posting is not buggy just
>> because it is incomplete. Otherwise please provide more details about
>> the bug in commit msg - why initial posting could not even work
>> (although it did work...).
> 
> The reason the fixes tag is added is because we want this to be
> backported, as the id should've been there from the beginning.

We do not add Fixes or stable tags just because we want something to be
backported. We add them because something SHOULD be backported according
to stable kernel rules.

Best regards,
Krzysztof

