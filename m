Return-Path: <linux-arm-msm+bounces-112874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6QHEZ27K2pvDgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A584867781B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:56:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N1hhYGfN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NpA2uVLO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E3ED3096ED6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ADA3D1AB7;
	Fri, 12 Jun 2026 07:52:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05F31F985
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:52:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250772; cv=none; b=uaLwfJOyLUZDCwwcqT/ovHoHwIi3BW9vYzlDdL3C/J8OPNIU5dESyQJ1K+rxkY9V17s09ju8ReGfnt/WjoI21l1R0JK0Q8FsPDlXVV2ZquqPk+lUhi8FBO3nXrfv2qAiuJndLiYu/e6JvjY08TmW0Kg45pu7IDmUC+2K3KAcEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250772; c=relaxed/simple;
	bh=faC12sv3c6kFcjuY77PQydFLEz1zEBfxyaEYpaOekkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1q8JLubilMeJanlTrPzgl+4AnMaT05OfXdBJiix5fx0WFdG6e0Dz8kd5WQq3D/oboMFmZkyJVdQFQYoA1P+KBztoDfRMS2dPj6LDI5qb6KzUZ7nXFX/ejIV3IGRBnalX1O2/2szf35R5snirUYK/UPtTAIGCjdL408+wid8PT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1hhYGfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpA2uVLO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3AMaO2498824
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a49osnQfcj9w4HVmREpyuKU5kKi7D4S5O5AvEnVyiYc=; b=N1hhYGfN087nnCv2
	g6jnyIm89Onb8pnui3FDoJwzyXV8i1yUTW2A+TIpu/JqbZzJr2Y2N4STUktdt7YB
	BcubpqAvkKHe1LeZLegVNM3iP8Maiwk4zLRQMQSlvX8S3OXfv5nkY9Govh16drzh
	BJwN16xnLKG7LkFDp0u+NTI3eiRhLIhYBXNJDCQ2aXJYncx+Vj48bS/XWBx9TPwR
	uwSSRiGo2JJ0+goixJIPCza7uTtBptCmygBk9NdhPB+qXt2pjgmHC/GZT4wQQ1Ue
	0JrX8Fk1LEFHfu0VqT4/WAh8j1jHao9u6cecBE7lEeRLCZ1s6MK7qVvKzGRZR+ro
	0x6PJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7jprg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:52:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423970cb30so560682b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250770; x=1781855570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a49osnQfcj9w4HVmREpyuKU5kKi7D4S5O5AvEnVyiYc=;
        b=NpA2uVLOmkAO/3nrBkyRly2jCsx9nObLiZkFjMAUUZjBHY7InlI63lzUDGJA9he/l2
         W4QCnfXpjUDqsnrRV9UerlyeqsVTMp3Vo4RAYkIG7kmruyq9dczItYVCwQsy1WWUzIMZ
         uWjEmJGK0dlcoAw+lfNEotXLU8gZr8DnNWIJC9L1uNAMctw+a+xXd7h7lTJtnuFvq/SN
         QMKKZMq0GLJC/7MzjwOmGnlt0ZNonB4Ubo08n9jEH05hHhW/SLH1eodHXmxcweKIrStU
         AO4W7rAVZdZbSy7JcKMYgbMB3G4mNj87AsYzbJS2Iy4lbLVGUaXB1Mb0yWueNikGBHro
         ZvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250770; x=1781855570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a49osnQfcj9w4HVmREpyuKU5kKi7D4S5O5AvEnVyiYc=;
        b=DZNSMXxqZyUSZvEoeb5HqPhTKYsY0SdvMssIH1xg+miXxeb8YbNjgxfRAM1ilcjlPf
         SWgbcIok4M0QdTsnly9/s0yR0v3aKBs0IzFbXmpAMIVi1bduV332lfFoeF4aR3wRBKSZ
         L97EeW3iLGMoHrxb+G9DikYRirfzBcTYks/3E94HqxOMa7WY5KfbM2M+HuhM5ahnRQlq
         H74qllkcfqQtsXxVnLhNGlj6eQlkL9IQCUM2drXEXQBatqpE7pIFlgwIljHhTBnVWwI8
         ovplT5elRnc8TINH2WO7+J2BUDmSTtGH7fklgdS15tX1SgzmS39xQ9VT9WWz1VuWnJif
         tJqw==
X-Forwarded-Encrypted: i=1; AFNElJ8PADtl2nTFc0+e9GDk/Vv0sAdeiDj2xDswtw61cL0hMfEkqpHnN7AAMIA/EzZRzyiNorKDnxHlqmOCocNN@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkBlnoMtmj7/yjN3ueHcxCQB1qJt+5omAnaA8mrAY1NoapAGo
	gp+iR1K3euxBR3LCcXyBAc4hx4pMrr8jRtB3JQONnF4ay0fzA8Cg+E0KPDBrRI2LiWl06y/6Ffs
	Tr5Ig/qgdSG382nzVUxz3uUapv8u3+iyx+X2DfRssNoYOY3nz64qu5qUa8CWEBIo3RI8a
X-Gm-Gg: Acq92OGe1ilXscLzffgBAtZhTFkkBqaXZ3pFETeYSUoI93KacbeyAIv98os72vBje83
	Po6/FFqPUB9AvWD108iV5MT+Vm0CoWLaEMJ6v25eKoGeRlcdQoEZRUGYJyYgET7OMWmhCE9LxSx
	ZtuzjT6jf/EaQqAJ1rsjZ2inrYc0WJ9/8+JN6qTpYvZ1qIgmwOyI6R64Osk/Ujp4TJzBcaDO6bN
	N8uvsPfo5652wthWjVylOKWkhzSmBRb5jCGPewTJ52jQ2ERDtZWsSnn5cy9qzoiP5PZWcl77tt2
	+KcyWsabqciusxcXEnfAuCE5YMBcilNLAVyKMwQ8E5hutlnkJ0XTCUszoXAfyQE4Wp5rDaFALeO
	cBg58X1vJsyW40o7mZEWI7/vMISB8HEum/5XUsae/yYM7RQjA2TaOL/U+QB+W0mo=
X-Received: by 2002:a05:6a00:35cc:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-8434cdac1dbmr2028641b3a.19.1781250770189;
        Fri, 12 Jun 2026 00:52:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:35cc:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-8434cdac1dbmr2028614b3a.19.1781250769717;
        Fri, 12 Jun 2026 00:52:49 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm1393519b3a.7.2026.06.12.00.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:52:49 -0700 (PDT)
Message-ID: <787c6ee5-e7e0-4884-9efc-b7b4692f1877@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 13:22:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
 <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
 <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
 <epxrpj52vst4zjigsn6ghaiajyzkwdtji2dvgrf7euag4indvf@wzhhy7wtuhhi>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <epxrpj52vst4zjigsn6ghaiajyzkwdtji2dvgrf7euag4indvf@wzhhy7wtuhhi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: svqLSJD-3VrU-Mujjz3oH0SQG_cFErg8
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2bbad2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xnaJPCCZ8mv5B4GoDGgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXyQ4atq3xu71Y
 xq2Cf1DtTuIowonPwQKnxJjVX8GYm8DhotqjGARD66v9wFI/NAf2IvSmIalYxx5ilE62QOm8GtI
 Fl4yfxSbO932nrxMiv32dgBd5bEng8c7mKr9UMFaNqOVb4vYN5+60zx787PtDMb6KwvX4dwrDrz
 FYbuBq3ZtScT8nhAYfAxIOqYEbQCBuT+r/fOCG2J0Gj5mY70pH+YZqYL6xHw+oWwpXBMSs2ythr
 SmGYc5sfQ/cUYFcu408nVNMehz7lN8AhsPN0Bk8vCDbdqqz6s19MK0ohpHFxbBNg2ruNeM5BbwD
 pYAng7r24X/tD0lgWDoOCjZtrhGG1ljdh21xew6PP4WQNV5kSCtNdJCA54tK+nDchb8WhUNpRro
 l4DeZLWB///4gRhkpsrCfVxMssx3/Fg8HA1mC9O8wZoPVMFk/j1Hnogu49vT9QA1ppIK16ffWh3
 d7RIEby5btsmhkEDtPw==
X-Proofpoint-ORIG-GUID: svqLSJD-3VrU-Mujjz3oH0SQG_cFErg8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX+xWec2YrwLNi
 Y3ooNApPjS4PJCN56AsLa6YwkAKTBI7cg3YOqVjA3BqrmKWy5f4pndn7wMsEwc08bjh8g0hj9Qu
 eyYv/Cg8o9IcjuUYV00GaNYxyqOvtuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112874-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A584867781B


On 6/12/2026 12:54 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 12:13:04PM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/12/2026 11:44 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
>>>> On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
>>>>>> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>>>>>>>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>>>>>>>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>>>>>>>> supply.
>>>>>>>>
>>>>>>>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>>>>>>>> refgen regulator supply.
>>>>>>>>
>>>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 220 insertions(+)
>>>>>>>>
>>>>>>>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>>>>>>      	"vdda-phy", "vdda-pll",
>>>>>>>>      };
>>>>>>>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>>>>>>>> +	"refgen",
>>>>>>>> +};
>>>>>>> Now vdda-phy / vdda-pll supplies?
>>>>>> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
>>>>>> which supplies fixed voltage to the PHYs. It is enabled upon system power on
>>>>>> and no SW intervention is required.
>>>>> What is it being powered by? MX? CX?
>>>> It is driven by CX.
>>> I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
>>> this chip. Please provide some details on the commit message.
>> That's right. No CX collapse on IPQ9650. Let me rewrite the commit message
>> as below. Hope its okay.
>>
>> --
>>
>> Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
>> controllers and two Gen3 x1 PCIe controllers. The PHY instances require the
>> on-chip refgen supply.
>>
>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with the
>> refgen regulator supply. Note that an on-chip LDO, driven by the SoC CX,
>> supplies the PHY voltages without requiring software control. Note that CX
>> power collapse is not supported on IPQ9650.
> ...neither CX power collapse nor rail scaling...
>
> LGTM.

Thanks much. Have sent V2. Please have a look.

>
>

