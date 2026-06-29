Return-Path: <linux-arm-msm+bounces-114930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eH6aBMo5Qmr02AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:24:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7576D821E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:24:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="R6Uu/ihY";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kjvLAzQr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114930-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114930-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B906D301F5CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855ED3FADF7;
	Mon, 29 Jun 2026 09:20:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F233F88A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:20:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724847; cv=none; b=qh3fgkVMnYzO6W1W+c/+jyWLoMqzEqgr4RlmiFjPOvIzsg0Al4kmNnpzTmcC32wyYO1SOUrydTDjZl2naYFkOx1Fnxf66DiM4hopyFE8nZoqCNPpojRO2zMxOijrgW9yUKXCwXR+4p4eieVP8esaIuFp9rJp6/DTzWaKc1Tmros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724847; c=relaxed/simple;
	bh=OIklkIjBVMa6cf0EzpmdVSuCxpIJOL6sd+Y1gHkOElU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdC8GnCOg0kNPM5s1FzGW0C5kNYh2rkqQUzspGOEms6JU7XV/YqLhreVId9X3M828/jhL8/9lxuEOjp86vFlLXV94GYDdzJOuGr/As9eigM/yvNnzsA8GTfvI+09ta+oEv/o2Wyqxj1Q8RND/plVy7k0SCcsGjt4RBA2fJtBAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6Uu/ihY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjvLAzQr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r1rH2076291
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yPzczu+eMoK+AhKFw+6RWhjrnWJ3cdjMxPb/PrzxOiQ=; b=R6Uu/ihY3Y7pCEUg
	KNxOH4hXyZTmMaHQ0QofRm1CzoHB15YAgv1DEVn5BG23o34L3UmRnJFshdDsnyWm
	HgECAljnuSImwfRW4qZcWxsiqJ91wEXCoc3o9oyk3ueJo/RW9cwf+H6Op7V2C49e
	pWiq3FnyjtPckDje+Fr+KJg+e7KdBLEzH3BwDtcNbIKnIVaSyh88N8S3DA7rD71i
	Ay8mdPFuZZHIx7gBa9pf85UdOVVhl22vHZljQRR52RA9nnJKzaPAd4/d0pdwLiEk
	ZkT/AkLH8VqrAElG9Ysg5hz+O0pTmqMXzmFZCJnj/zuBamI+nmVGE+s0wkqytAgQ
	dXw1RA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gmsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:20:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a89451078so2718421cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724845; x=1783329645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPzczu+eMoK+AhKFw+6RWhjrnWJ3cdjMxPb/PrzxOiQ=;
        b=kjvLAzQrjnn3yQ21DzxcMpPvS1RxoxR5hY0g8GrgV9PitdAA4vFSVSFtWEQsiRjrkV
         wWeDsmtFaNRqStZvJk6zsUhW4o1jfmwxjSfGljT6G7saszG3eb56AupwBtu5AwHTS9Gb
         3dJdeizu1NdRVwYmoHpXSfeMp3vmBHr+m643Lce9M583DvRFCPXByqlbggtzbtzm2oZ7
         DKEvWEcnwoVYd/PuN+ppxly9uI+CpxAbXtlb4c1R6gGb8WYPepMnqYvjFnrLaGpvrjfB
         SBRo6fUhzoDC5PkWkcRLWVvGpXrmpIqq/7f7Kv3xf3ysl0KEB2GDFOGwtj3YjhNI+r0n
         V3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724845; x=1783329645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPzczu+eMoK+AhKFw+6RWhjrnWJ3cdjMxPb/PrzxOiQ=;
        b=X0Fe2X4nugaZOZXuJUAZ6SzWDsfvdt7DlpNMmI9b1rVCc1UwAdgHfHuTH/RZlBK5/B
         YS+z3WXg6IgRz3E0iUrQT3BVnewzRE8Mz4JXHeWjEFoa9X2x9qRTY1tQBMOdyLQVipVH
         VmCSpXOoenYZ6qVJfxmZh5HKdkZn931KVc7mM+V2PCTJ02duBryaNdvno8txBiA7Mah6
         SsMlr+rTZRen5glKN868Vkuxb7YRx7hz8rU657rzt3j+2HsYarygoWfS49uwJGyLW+tn
         J/w3E/zSXO3Rc34lQxOAWqDaaMqgyO/Cy8W8ovOF6eiCKPYL6C5pysGmZc5z9cSCokdg
         HUBg==
X-Forwarded-Encrypted: i=1; AFNElJ9F118UcFntyPr2CFT6SU0tP6lzZ6jVt8Ta06MrRYRwXrihVroWMFHO2gXf3JDv0qJ/gIy4GKHKHme0D+XY@vger.kernel.org
X-Gm-Message-State: AOJu0YyNt0gHC9nm9uFjXuk7ZCI2I6PsfLnNeAt0WwxjS0VFWUj5jbqi
	ZhMsCkAHLAvALaLpKd6qS7pAApowRVKzuokBaztrhl3skMIi+lJIqyT3+T/RMd7GXFu4AL20qjT
	uM5sqVTc/RsPP8U2FjHfKLBNHmKRJ7x2A8qRP1Kv8vBZKa44h6NqwnspR6TFIQVSoYj4k
X-Gm-Gg: AfdE7cmQigKou2v6Co/+AFfjnHibDnpkSaWID1ZaBe1sqod+K2loOTfZ+O6wbRwU0be
	ov7D14y1msigYGVAsK0vipkkB0TR6mbkO2wIZ0bxuCT1I20857fBiuTfuuJFeCEDnDxI+5y4b2e
	zcwNPXKzQZUdI8CF3edZAIfuMP1EQ0W2abrtiO4m0AVu10xqMbNWQvrULLheesNJXoJ+z0JPZs7
	BBDU6gHpkB1QG+Ksj/44TH5XpqXTj/u6aL1u+fC9sgVt4Z8D74MG2QnWc4KONRphkNaAg8CNt5F
	MbLM/OevGVB4LHKj5XGOZ8jqE4UU7At3YJ+Z034t5BwbjTpdQlBJC1h4jm6SWrMmwTXPzrKfTeC
	Lg+VsJCRumxxGSfYS5m4Y9lNJovkKL2l4mzA=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr87799241cf.9.1782724844514;
        Mon, 29 Jun 2026 02:20:44 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr87798951cf.9.1782724843963;
        Mon, 29 Jun 2026 02:20:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa46asm745789766b.10.2026.06.29.02.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:20:43 -0700 (PDT)
Message-ID: <c2f16272-94c2-4c28-85da-f9e8ca7027fe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:20:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Add glymur-qmp-gen5x8-pcie-phy compatible
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
 <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
 <5dffdbe0-cbb9-429e-ba15-0afdf6f20fba@oss.qualcomm.com>
 <akH/N/ZwnSD5BkIj@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akH/N/ZwnSD5BkIj@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/a52obdOD7kl
 hJ63R6fQ4Esai2q25bfDWBsKwjB2zApLWyRSEtgyi54ppDZMFeQptu1HSiLOziOWwM/c0TFeOta
 +9ovoB2X/b7hijHW4hA/2/4ZLXGvSc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5hEpQq1eYH1z
 Xb1g5eScQIX1c1Qp1FZLF/gYmfj2vVNzWsN7MCE4/loCCzmSpQYwY3G9pyzQjM4F8e+01XW7aHd
 uW3+2KcCnwhoHlp0OcC1wpRzyETEPUz4fSHeJ00C0eT3imxYdzQCu05sxtQRkS/RJqDJqtwSx6n
 q7hhTqz9T21wJNq6X4Y2V3RJuCQytx0aHRT/rMaAb7z5aL6S2C2M2dQ+ds5BAOZLB73RyKhbZ6j
 w4oQJW0O12X93OnOIxFfMSwayd51QpF5W8WhwOynPCozoGX4nNZltLCNhbL6/PFiqxthom8zK53
 14NEuCn6Vba7U+/JZTIQiFy0h3WKoKorg0qghT/k8gFNigGdRBEVqWSTBGrEE5Igqmu4MKtGz/t
 zRr3wEsNbs+zp6yIKI2ePwDpwaJwkuuRVPRW8Gn3U4AwOr+6AluzIfomeQ3C7lykrUriyTfL+bV
 UNddjrM/2irz2e0cvow==
X-Proofpoint-ORIG-GUID: tTC8hU6exQX1t9uA544wmv0laXDwf1xV
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4238ed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p_8c1NbHuTntNjfAQcgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tTC8hU6exQX1t9uA544wmv0laXDwf1xV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-114930-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5B7576D821E

On 6/29/26 7:14 AM, Qiang Yu wrote:
> On Tue, Jun 16, 2026 at 04:03:39PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>> The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
>>> PCIe3a/PCIe3b controllers. This block supports two link modes:
>>>
>>> 1. x4+x4: two 4-lane PHY instances are exposed
>>> 2. x8: one 8-lane PHY instance is exposed
>>>
>>> Add qcom,glymur-qmp-gen5x8-pcie-phy as a multi-mode PHY compatible and
>>> document the new link-mode property, which selects the active link mode
>>> via a TCSR syscon register.
>>>
>>> Document the required clocks, resets, and power-domains for both PHY
>>> instances active in x8 mode. Use #phy-cells = <1> for this compatible,
>>> where the cell value is the PHY index within the active link mode.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> @@ -68,20 +69,29 @@ properties:
>>>        - const: ref
>>>        - enum: [rchng, refgen]
>>>        - const: pipe
>>> -      - const: pipediv2
>>> +      - enum: [pipediv2, phy_b_aux]
>>
>> I'm surprised to learn 3A doesnm'doesn't have a PIPE_DIV2 clk.. it does have
>> a non-div2 one though.
>>
>> Seems like it's specifically not the case on Hamoa and Makena, so perhaps
>> it's better for maintainability if the Glymur list was separate
>>
> Do you mean splitting Glymur out into a separate YAML file for the PCIe3
> PHY? I'll add a new file if that's preferred and Krzysztof is on board.

I believe that may be the better approach since Glymur seems to be an
outlier with the clocks I mentioned above.  Krzysztof?

Konrad

