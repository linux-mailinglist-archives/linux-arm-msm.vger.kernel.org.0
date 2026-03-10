Return-Path: <linux-arm-msm+bounces-96670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDisK1QssGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:36:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4788D2521E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13DA232F61BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC093B388D;
	Tue, 10 Mar 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz/hlp8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcZ/WbWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05C3B27D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148958; cv=none; b=sRtGSCxhhYxBzwDUd9rbTooc3xcU3/jgf+OY8lHoFTgWN/ym/Hg0H5Un1K2UUW0MxtzkDItX2F0w4wjYRBpzwIlUZpcCdZ0NOU3kbIQiLrb8/pgQMNRn+ZcqTztxDorP1fGVfKq9miXfZNUC+iVAZ4EhwDjrFhSSmbIyqXtR0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148958; c=relaxed/simple;
	bh=aFXkttyidZ3E5rhvNe/MitI91YYrfWU30YdEHGUC4DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7O6grNVnH8pyvOyBRAeOrTPLZOUTxcu+QyHWKWeoeXkNvGYQiCp7Ne/EUZw/v97t9fFI+8S0MoHZ3XaeGWcutS20XeW3gnj+X5Z/CBAN9AENiOubvp+WJWTHwV6aHo/kPqUwk4sXTi52XTw6V85SjzUzL7HDs4DgCieHz/MSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz/hlp8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcZ/WbWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUt2963315
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSPtImOmRAQp7Kt62S2wn+SalsHspQ26Dxc4l6EJ8Wo=; b=bz/hlp8ydtixW8M9
	Dpx5pQnq/B6i5+v7eDqobQ1gnp6C3HUmgohDHRrlRFsG9ccTIHUZMNtTnIHjrOTN
	NuwZCGsqYMpxIPsD4BZQIYMKlI8imC0uLGlc/6Dc1dNwzr+49PH8UGXMRTiCU4UQ
	wL4IAsmkoul+a29xT4q+L21Wgncixjl+18F9V3VwdDRrcBq2RlV3hKS6aDFDafAo
	WuH262fgdFNr7OuoDfo5rm/lz4VszhC/nT5MLwmBo0K9ADrABTp1HW8kOaRcUfsG
	CeXbEyH0tNoTlLmCnppIwrvE5AIEaWdhubGhfUB/1btZVhNnqw7QHr6Gaz1phkDK
	1UJfOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477kbfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:22:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8198fe16so181705185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148956; x=1773753756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSPtImOmRAQp7Kt62S2wn+SalsHspQ26Dxc4l6EJ8Wo=;
        b=AcZ/WbWpj7PsbtsQlAQiXNOD1EUV5f4SJzD6EEheZg9w3CSzBgQJmrIjhryDBwHWeR
         aKC+1rOleY7YLn2b/UkZJWwUK1tJEtTW4uxP7lJ3eCLoQHSz226Rs9TCheVn6tF1Q8R0
         nBhOV2Bi5HENpRmGrPRt4SZ4oRLZuQjkZLPzYxBKbaXswG0Gy2rP75yg+pjN23vaJI7X
         MNViHb3kB72ybiD2sUFaDi2UFGaiILEn0t+6YqcW2tJs4ZK56Vly62v19NBByikRiH+x
         nTj15ckiAbEU2hUPgIZIit4Ofg5Mr3qH1ShX4cF/P5QgJwaVLEpZ5fkk8/1AryL9Ukpq
         5ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148956; x=1773753756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSPtImOmRAQp7Kt62S2wn+SalsHspQ26Dxc4l6EJ8Wo=;
        b=N1HDUyTATYTHR+mCvhrl3OtWjzSURPEaee+rG52aVmfRobTd1Ff4gZeUKGSUj7jpM0
         Ekf3PvdB8v5KJ5x/OllukeVv6yFf+lLRTC5wvlvge77ZtgbpF0L7UvF9N5zoHlf8h9JB
         J1fXC9GSI/dKzcYJ2IXhM3aPO/tXsPPXKjAKNSvQl/IvqmPZw9jo/DI6k+ooNfh8SUAk
         kmQRJAMLtA8my67a+JwT6DUKHDxLK1uWnOlRLQOgzAeChPms22NDMUDcfbRh6TFTba5w
         cH2S59U8VGQMXzAlBcovoFx536MMPkKkb2IwPKK0h5cXb1J0lUB5+0vjI1EMBV5VlT6i
         4URA==
X-Forwarded-Encrypted: i=1; AJvYcCVViNzqVTbsrpH+sQmqVFs25WmA70dHIxcYGQpMrE86hq9RI6+PrRB3M/BJZdPIquAnhuEatKhKsZsPeoa8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JICLHGbNZCEFN1EO8Nj48Ov/PkvHFJOch+5mxH8CGT0OEX7c
	gHOJfQAp5XT8ONPJEbzm2GIbW91fi8slTq1GRp27dJ4iCi54opZljzE5EO7/J7KA3Abc+kLWFAF
	3YUHPyF9kBffLg+xdtrwjeU5oJ0VtOd1VMLTtFucVbKGZQvOxjB3uBJN5nMfmDrpnboeO
X-Gm-Gg: ATEYQzzUSADz+6Crarj0y5nbjiap19/vw61ChqjXhO3UnRfRz9IEIK1IpZdiPtZPco3
	SDcUTYf90FEMAWO2lAGy6Iw68wHmCTg5l+MQU+hK63I0pvuRmYbZq8yW+vJ+ILwAVkMMTEzRIY2
	oTWrKz205pMqVL2v9+sfgaj4fVEdGM1jEuHig7OYAf0sJVArS5DZ/DQTxsTgFA4NQWd64Foser4
	wytApPal4oQZYIwwrk18/Or0yR5xS6RsLekoHtv/xfdEBr5ouDNcJnmNoe9f9jmwUBBsCrcSgSM
	xU1OSqBLXwmUPZYv+YwQY7DuUPI5lerf7RyIKE4r9KIN4xGWGad59VueDCzdeK8/VD7czUK0GwD
	Q77fjg7x6blG2tXziwzWlIW0mf+3VXdwGBlNAFaItFLEybTti9bvxhTtFGf+0sGwX1xtv5bBEOM
	YJGYE=
X-Received: by 2002:a05:620a:1903:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cd6d42cb58mr1412800085a.5.1773148955811;
        Tue, 10 Mar 2026 06:22:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1903:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cd6d42cb58mr1412794085a.5.1773148955295;
        Tue, 10 Mar 2026 06:22:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629f7cbc78sm1453211a12.17.2026.03.10.06.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:22:33 -0700 (PDT)
Message-ID: <5ce56237-1a57-4dc0-99f5-c6c813875e08@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:22:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: document the Fillmore
 Global Clock Controller
To: Aelin Reidel <aelin@mainlining.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@mainlining.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
 <20260309-quirky-heavy-armadillo-9f92bc@quoll>
 <386d5f66-1f22-42dc-9696-05b1e54d7577@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <386d5f66-1f22-42dc-9696-05b1e54d7577@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfXyJjjf7Xogs+w
 JRoz8RInfK3ni0ZrmY6OFrAMKTzfJs1lQCg/4XLYSgPVzMV1jMta9d+VWQBD4mEKLcQiLN//0Vn
 oe4i5WQ4vg25mWfriHL6cUpbTwS+qi4KFhItT9e075Hdr5nJkke4KFHhIRYNwm4tpjyF5kNQLKh
 yST9yTtb0sTmM5cdh0MsfF1QYkcSvcinteUrnzk/xg6YK+InwsS4N2iciILOKX8/9I3jCXMSSHr
 xB1uxFryX6z5mDST2EmCPMZPLBMDPKxIJTkRrdQw2h7hpsLr8jYe0+pWXs3wdFR3S6nqUS7mVQ9
 M2ttl9NNRspfzLcL9CJlAjMwrfQjd3RaXAVeMDj6tM0wJ4z1aYVtfX1pUGKHc+Ymr+2Yc2V/AtV
 AGygmUfF9c9LTLTDW6YT6Ypivjcvsu69rYgimKGQ0c4V+4nxKhlRFi5bRpSzsh6MVkG4XG+Sz5D
 /JoVR3vhboWCpsNPXsQ==
X-Proofpoint-GUID: BhOV0ciKQmzkO1IABAsJlaLYTI903B3P
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b01b1c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=OuZLqq7tAAAA:8 a=kGAoTktFa5V21D_EptYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: BhOV0ciKQmzkO1IABAsJlaLYTI903B3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117
X-Rspamd-Queue-Id: 4788D2521E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96670-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,mainlining.org:email,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 3:56 PM, Aelin Reidel wrote:
> On 3/9/26 8:38 AM, Krzysztof Kozlowski wrote:
>> On Sun, Mar 08, 2026 at 01:39:27AM +0100, Aelin Reidel wrote:
>>> Add bindings documentation for the Fillmore (e.g. SM7450) Global Clock
>>> Controller.
>>>
>>> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
>>> ---
>>>  .../bindings/clock/qcom,fillmore-gcc.yaml          |  60 +++++++
>>>  include/dt-bindings/clock/qcom,fillmore-gcc.h      | 195 +++++++++++++++++++++
>>>  2 files changed, 255 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..0eb12a52968edc7961681f0e965b4d6da0858b9c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,fillmore-gcc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller on Fillmore
>>> +
>>> +maintainers:
>>> +  - Aelin Reidel <aelin@mainlining.org>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module provides the clocks, resets and power
>>> +  domains on Fillmore.
>>> +
>>> +  See also: include/dt-bindings/clock/qcom,fillmore-gcc.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,fillmore-gcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 0 Pipe clock source
>>
>> Aer you sure there is no PCIE 1? Because I would be dissapointed if it
>> is being added later. With PCIE 1 clock this would be basically Milos
>> GCC.
>>
>> Best regards,
>> Krzysztof
> 
> Yes, there is no PCIE 1. Fillmore has only PCIE 0, which is used for WiFi/BT
> and is Gen 3 1-lane.

I concur

Konrad

