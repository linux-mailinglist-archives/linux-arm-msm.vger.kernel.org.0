Return-Path: <linux-arm-msm+bounces-112852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id edQLIteqK2qVBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:44:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D2677004
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:44:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XtH2M7oW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aAJhW3KD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112852-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112852-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3726E31E7C28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126E63D891D;
	Fri, 12 Jun 2026 06:43:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10A43D6683
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:43:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246595; cv=none; b=ueqQn6NhrdtO0P4iwYHIzqnhJCbCcfrY/Gi/+/h4bBygjVqnn+71SsZE+QCXEf8/eOtY2sRvhlvWQqNBIFKrCsMHLJXZ0mERWm/9HLXIP73x65SLm5bYmSd2RIxGWTi4WTi5zOUkdJuG5NtrehTWvrVbgHUXhhuc7fxM6vgl0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246595; c=relaxed/simple;
	bh=fj2BDTolpIHjrNcpJ4WVAWJObJAgy1V02X3sJ8SSQQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAwtOtQ8hpqYGwrh9uxQGnDjuOQ1w6u3aSeExRY3C69BBWG0IMGwu4jf6P/YFhokt9Iu/z8J7p1cfoRKp9gCV6sT19tEFNxzDne5OEFdKGxFEgEcL8i7Mx5wn1CXMI2ODCvgxvIy3ty6KeSXjWGpEH8vHTMXqbJpgiwE3tmw3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtH2M7oW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAJhW3KD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C3e52506361
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhRQQ0HqfVlogSV46vuX6Ct/PmcPgUZ4ULZ4DIlTmCI=; b=XtH2M7oW9JPOsZWJ
	iHfSpi9vnqUy5YGyEGCXw3UU6IzJljTcb4CeJSnQmLl1IYfbE9sCanXF0/bxt/lE
	QZbEuCUXXxPCwUO2Tf1d/1moLY0MqDS/eGOOmSZvEehMkX526kmyZFIKOqeFor0J
	kyvyH/6THMVBvBbVwqc7uXNDY89ULDzrS69jE2eu8DDiUunX56UiChP3S/2MJrfd
	IQxMIwZHyH2D01w9b2S/c16DreByhIGSlTHnwf0OUbm8fHKxrwsEKrGOay0CGvSu
	oqHcJTDteHCzvQBYWD/a/ZAloBPiw0hateVQxEjzK3xx5yGRw5lhX8oz7qWnl1wa
	KRY/BA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjd3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:43:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c20f7581so7424985ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781246592; x=1781851392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhRQQ0HqfVlogSV46vuX6Ct/PmcPgUZ4ULZ4DIlTmCI=;
        b=aAJhW3KDulO3rQsYsa9fvw6c0kXxAbXCizjHJfLqgfkZjZixgfvL9+ckZEVkswK5Oh
         EAKeXMWwX87Zv0TqOW335ayribprOazJ0n23/FqmrRuhiD5oYduS4qJDj7IirDIsBgiJ
         jUEGci3bGjwM/jppHRZtvcAR9805XQcGrkcS0PadoR6tY+uarvUZwSAMQBoU5sVCFGwK
         TYh4hQBcVQBjnx3Qk1yy6g3/VN3DCm2nr0Fjr7CC8ywXXyALMLPzkTNoKRSVkqt7S0y4
         iawjmvIT7zPDp89aAamWDq7LLDJEywJ1cFkOO/5ffjjD9pctOFX6+Jw3TrE7m2ab6g4z
         Dm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781246592; x=1781851392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhRQQ0HqfVlogSV46vuX6Ct/PmcPgUZ4ULZ4DIlTmCI=;
        b=cUd22LsXv08nlMcAlm96gHT12f3bJEA+V444c8BXUAj3sg5I8HZMC/+I9nA27DFexT
         +17FuZ/9jMvlrvLfNki31O9e+vATbdYLHlXuib5C9vuR9OAhfNSw5BrWLkjOaSoUmupr
         FSoMCcgJ6bAL9yzL3EbH0BM4QQNJxOY1rdMgMVUAUfusemPlp3yDRCtGfLKclMyJfgzB
         cff5TCL/6Aa/jOCfwvtolY1UVCBrXNMfFe8SoLW+MgxTY+EAJJ+8r5AG/IaodCk7cMs+
         K5R2/LH4nxO19sMM27RkNAapKAGVAanzIF7Dxfev/6K5GbPzsnFt94IU3OFRcfQUApxT
         6i/g==
X-Forwarded-Encrypted: i=1; AFNElJ/hWmAra9zF0QdiXMOaUUFCcbYa7MshdlCCRiPN5a9z0BwXzY/bGoYYirCjxAF4iJS6YwM5RrQekU2TFBY6@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLKVk01WY90dKPeYhwI29GhnbIa7ybufcUrVF1cAxmVc8bx+v
	9Aszsoil9sPvBjagTa07INw6poF91HPGWVvOKNJ+FY78T/PRuBVoK++3htVBUUHCMNqJN4w+gAb
	eNtsqesAPkAS6Vpi8kVJ0ztOA4/xgYt+ZoSzs44UfzOwloo8BUpWOXNSMtS+S79RCOd7G
X-Gm-Gg: Acq92OGRlPC9CyfaBiLy4o/yLWnPVtp14oPJS5wZwT3ZIZPrQz43yHTI6eajBXWlaSn
	XzHC5Xkzu8nU/BbLFP+W1ZjpwpKO5Oprx58Vdv2hcCBufsgANdQiCcXbI9wL6YDksj6z7p3zoIE
	eulhS0mK4QroLqS8+T6xpcWd+sb0pg8sAoYLB/Y+etjN6t/2ZRhMP9x382XRC5VySAHL+iV4GBK
	+nvWIIC7m1lZqIhKVq+s2BYRpADyvvpfCK+0VQfnxJSvMensLCMrkKEqy+MRMvSjL8ILPfB/dC/
	6bglZR5wkr+GRmzLhaSqZJislB4hmxOOf2lBJMQKazkV/NG4aHxTVjmJ2ouOJyDC9YIskMe/Zjj
	X1dq3ibLWAx/wrzMWbC00ePMQ3xwb7M/vOLxKS1iKE9kk6/1tJOxaDqz994DP1Bk=
X-Received: by 2002:a17:903:32c6:b0:2bf:1486:e6ca with SMTP id d9443c01a7336-2c41050947bmr19439325ad.12.1781246591663;
        Thu, 11 Jun 2026 23:43:11 -0700 (PDT)
X-Received: by 2002:a17:903:32c6:b0:2bf:1486:e6ca with SMTP id d9443c01a7336-2c41050947bmr19439015ad.12.1781246591074;
        Thu, 11 Jun 2026 23:43:11 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm9266445ad.21.2026.06.11.23.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 23:43:09 -0700 (PDT)
Message-ID: <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:13:04 +0530
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
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SNh3agBDH8QF5kZ1Ut8Mb13kBnEjh6aU
X-Proofpoint-ORIG-GUID: SNh3agBDH8QF5kZ1Ut8Mb13kBnEjh6aU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1OSBTYWx0ZWRfXxHJPi+1tV0g0
 zuFjt78GUSUzlrAmeRC7TCXIJYffFo83iJkMzW41IO0lv2LcpNUfIHP73FjySCg+l8YrqJaSSYf
 UqYnaI9ZShJ+WvqxUCPMw2OHd6BuYEk=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2baa80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=hfAPQjwllD3DkVB7DTwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1OSBTYWx0ZWRfX4wWSFyaq60eh
 lyfcib92sY3xVkokzzei7R73oNAfOk8QAqRBZ/z5nnLFXGm1VnCDmtCKAO5Au6WCZt5sYEN4mrv
 jJs1Xb4bd2M8jK1m0KB/Xn5T4J++jkOvzn5Tu0Df0xO62sSkboEoXX2AkgHjzs0heVNY50s7ZqN
 WM2JLmK1hyvNoWw9zVu7BW5K/aQx70quMieV4g0ARLBEsqWvF9H8nlhk47i34bMOD81L6Fd37+F
 T4/cn32wusSYDtQiEOni+JjqvLKU5ZIU+XPe58F3K68HnHA934lvi+IMPo3qBQ6D3d4a7v0puf5
 5b8Cco6v0dKLNs70XgfiqKzpvm9loyZT0IwVsPFzKWLYBJYXTMKqs4qBBDrNO6Gsfn/CYIWodL8
 ++aTV5pAoOMy9VO+1gV7bbbovkfF06xgTbp2sbCfqq6zBKkif471ahctXsQ1je8y3fWwHEEzbQW
 8OIbbDtsWfSg4hLmf9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112852-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D62D2677004


On 6/12/2026 11:44 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
>>>> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>>>>>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>>>>>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>>>>>> supply.
>>>>>>
>>>>>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>>>>>> refgen regulator supply.
>>>>>>
>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 220 insertions(+)
>>>>>>
>>>>>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>>>>     	"vdda-phy", "vdda-pll",
>>>>>>     };
>>>>>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>>>>>> +	"refgen",
>>>>>> +};
>>>>> Now vdda-phy / vdda-pll supplies?
>>>> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
>>>> which supplies fixed voltage to the PHYs. It is enabled upon system power on
>>>> and no SW intervention is required.
>>> What is it being powered by? MX? CX?
>> It is driven by CX.
> I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
> this chip. Please provide some details on the commit message.

That's right. No CX collapse on IPQ9650. Let me rewrite the commit 
message as below. Hope its okay.

--

Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe 
controllers and two Gen3 x1 PCIe controllers. The PHY instances require 
the on-chip refgen supply.

Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with 
the refgen regulator supply. Note that an on-chip LDO, driven by the SoC 
CX, supplies the PHY voltages without requiring software control. Note 
that CX power collapse is not supported on IPQ9650.

--

>
>>>> regulator-fixed doesn't take the resource 'reg'. May be should I create
>>>> another regulator driver which accepts 'reg', something similar to the
>>>> qcom-refgen-regulator? Please advise.
>>> If it doesn't require control, there is no need for a separate driver or
>>> separate supply. For example, the refgen is being references only by
>>> those devices which require software votes.
>> Thanks. Then let me respin this series on top of phy-next so that Vinod can
>> pick it up.
>>
>>>>>> +
>>>>>>     static const char * const sm8550_qmp_phy_vreg_l[] = {
>>>>>>     	"vdda-phy", "vdda-pll", "vdda-qref",
>>>>>>     };
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy

