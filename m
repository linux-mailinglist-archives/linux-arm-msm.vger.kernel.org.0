Return-Path: <linux-arm-msm+bounces-92720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGIkFbXzjWlw8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:37:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A501212F056
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE403052B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB12E75809;
	Thu, 12 Feb 2026 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdrtaShZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXddX8lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A42DC35A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770910524; cv=none; b=hQigRfw/8ljaV7xCotBiCUVAvVpjNuSt6xrQkPHgJ3g4x+w80R6aGNorRS6q1JRSSe48QdlFXT3p/U9lsLwS2poTY4XP+sdXTYp/+K8cRdwHxcNzpztd6QgU8peMpiolUmVexIcCqjO8XHlZ5UkjhQ1WIJx66ynGKVSaM5fTCb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770910524; c=relaxed/simple;
	bh=PaajSZAcHG8YrKsiSlwMJ7V1l7MuY9nmIuw4Tz2PzKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQbHEN/+RgMhY+bqAF1x7aC1NZoCNY/Q4SjxIaImCpVWZd6YQk3a5cMdaZmx5zzy7MblocWv0pHFNIAEz9i/SsPDlD6EyWwbpMlsQhJHNcyfPCYUkeeTMqnEciy3TsDXiMHFMlvz6j8HEFgnjEmO7RcUoBtHhkOgFbjkjNpqCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdrtaShZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXddX8lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRf571074234
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovuZlQ5aegWRU1a7TGzMk/uQFq+34ul1GUETb3/z07k=; b=FdrtaShZTJu6XlgS
	9u4zSpkorb/4Cr2UhvrpXvE+CtFI+MkxWcs9v7Cz0AJhaO5tR8GlcttO+ZnwoegQ
	rF6iEPmDpUhCqf8b14Gk0KJrpAveWd2MS/frVPLB0TdqooSpm0xvIGF7uY5tb4n/
	dLzjpGdSTkdeKkEhCPzX0JaUtAZP9GScFW9e4sICT6zrBicM/voBQ66b/pOjokn3
	ZwqSSr4T0ylNulivoHtCTBB4qJJPDFS8vkMnkj13RoK5s+TKTkiMyFVS5dpwtJWH
	VEb9JDL/hX4/XmnJ3iArKPjCTo+pyBNp20Np+lNV8ICr9Tt4X2lub7ZMOYvu+udQ
	qgq0WA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8nujaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:35:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38346fdbso279985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770910522; x=1771515322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ovuZlQ5aegWRU1a7TGzMk/uQFq+34ul1GUETb3/z07k=;
        b=SXddX8lvYzQrPmuKzXJnmtavWUMJL+DcOir+oLbqh+8S1DZz1z8R45x2WsWXN9Q4fQ
         I3tyTPrvRUjERtKwwS8LVhnbBKh7xUyVwJxdCy17YTwvoQDdudPV9AEp75osiBIWxYXG
         ozcaNtoZV5q/BvAVFbX307K+oUUmfA8fu36HcXMoB2wugUrbwKdS7JCGT1L7P0OcpHi3
         VKYRnS83R+zBlPMYrOx5dbjecWsw4aQOetsmVlZDLLzlBM8aBs2OFun/q6hrBwJ3949z
         sFWYnTg3P0lR9g8MXalaVFke9f+5kT5nwwDUW7tibuieieFpfObEIkv9Wd7Y/i7wtNk1
         m0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910522; x=1771515322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovuZlQ5aegWRU1a7TGzMk/uQFq+34ul1GUETb3/z07k=;
        b=F5Clb1EEiciHAHP1z7/d177NbqnIL69X+yux0mSzdxwfrSU8vjMP3AagnmYxE8fCn/
         F1sxFF/8EALO7qox5hpNcjMhMynLDm6qaUSETTDHGVqRhdO8jeWUPPHTc+sPwIQtBt2Z
         5R7gysxBti7lRLgyyI+8xpWiCUJl1VK4QXjD8NsTPWlQeysQdl6vCCGxXWNp+uvBLhXZ
         n3UNZU+2vSd5aHuFiZJtbO7Rh0mnxxD6rlm5zWWORKGFUg/MmCfI7Mr09aR/8XknkeeS
         qhdvVLMQYb7yCJrMHMlZAES3WwYtMX7gYtXABv+17//bOlKJdn78Z3L58dLmyG5QQ4VY
         Bc8Q==
X-Gm-Message-State: AOJu0YwfRDeEMDNVY5a8A5gwoyOMbHadvEqArMAr3WG6+81SLWF/myIz
	OBFe/jaEshs8AUejmOLpyV2fFykCllbjCsWSCIgdgoBdwQL3H9IARi/qF9xX83wOuUcWq3PlN3W
	YxJgr2a2N9LNNDeTypk6qiTSjQyYHa+YnuqvzwKxzsKVFaT+NclEuTH9bfVao2GxP7/ih
X-Gm-Gg: AZuq6aJ/UjwMnvg8z90O7oF9ZBfKkH/A7zeBVxSDqVeKR6Qh8rXLK2gP/eU+CyUZlCY
	Nl1tsq37U1uFhWZcSgYuE0LDvCKOHCNeD8HKmRvjOr5WceeiixNnYPm7SO1Zkp/or2mGYFPtMn7
	B0hBswhE+JJ3CqTNyhmiR++45DlycSVRiiZ4nwS8C4mqhyfpBQBTuWfXhh9b3ez+jth3PpZCAR1
	POJskh0KHsr3o5iLNH7eymmk366+K1h2gjYjbfs6qttHrWi8bk0HnqiLlYUAWb7GxBSAQR2MOOZ
	/A9Vz6ii5N/sw33npQtYqYv041hrwLGMA+R88L9YRCUORCdc82eGUREcu+VrS7jgptKspJsavrm
	T4RW8nAQiUOV4gN0G5DxvV9kJZiaonHTJaHyqFcZUJTDYGoNnpaCPUbHXEt9xcaJSymY0fAF2Yc
	LPTQQ=
X-Received: by 2002:a05:620a:31a4:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb33094356mr308001685a.4.1770910521695;
        Thu, 12 Feb 2026 07:35:21 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb33094356mr307998385a.4.1770910521257;
        Thu, 12 Feb 2026 07:35:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9b3e67sm175292566b.21.2026.02.12.07.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:35:20 -0800 (PST)
Message-ID: <aeab66a7-aab1-4f5e-814f-7cd6dd6e4674@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:35:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-dell-thena: Move PERST and Wake
 GPIOs to PCIe port nodes
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260210175001.7691-1-val@packett.cool>
 <2b1b38ef-3097-45c4-835d-d7e367f235b0@oss.qualcomm.com>
 <a5ec9742-e16d-4177-8250-46678fa19b98@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a5ec9742-e16d-4177-8250-46678fa19b98@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExOSBTYWx0ZWRfX8DKZkri8Cg75
 do22uAyatqA0VRukzOC6YoUiPZeM38RiZGnFbuOOoUgznSZrfMLvNcSykmmzJTRWN6RIJxvyn0V
 TIXXtDnz2TRaEvTLHJdk5dticcM/DkdWgnCZzdle+K/SZuSicZY93d/V8slIiM8SE9Q0mk+z1Cv
 OkjbonqXCnqqswYH/jOsW37bA1/eQ1lSe6z8ur741eaHAlwz0/gAYl1zC2U58+qAOSq1Gz86pvb
 pvGxAFa5vJGrkK/cpfLs3dloFy68jezcHAAtFxKEp9P25PjoGIGjr4g8QYADl+oTGX8Sy5S5lbN
 2ju0mUvnDv5+qlJ4JN/6MOK1DkGeVO1rOu0je1HAVtneUKFGFRw2w6Tgu3Rb8P5WtTf0cvNGS3K
 15muBnNQjzXegqbghdhfJaGz62obLE8ARUkPo3ru6efOn2lPa84FEtu6atsJEkO3BKyCGGzsFNe
 4KcQ423yPq5lTnl6rmw==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698df33a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ig9SaPibExrtgy8WP68A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zqdnHtBq1m5kyFOiqHjIkBNBXoS4ipSC
X-Proofpoint-ORIG-GUID: zqdnHtBq1m5kyFOiqHjIkBNBXoS4ipSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92720-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: A501212F056
X-Rspamd-Action: no action

On 2/12/26 4:31 PM, Val Packett wrote:
> 
> On 2/12/26 9:06 AM, Konrad Dybcio wrote:
>> On 2/10/26 6:45 PM, Val Packett wrote:
>>> Recently the DTs for most Hamoa-based devices received this change, but
>>> the Thena dtsi (common for Dell Latitude and Inspiron SKUs) was skipped.
>>> Apply the change to it.
>>>
>>> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> huh?
>>
>> Konrad
> 
> Oops! Sorry, I *completely* forgot the entire concept of versions somehow..
> 
> This was a v2: pull R-b and Fixes tags,
> 
> v1: https://lore.kernel.org/all/20260114203600.5617-1-val@packett.cool/

happens to the best of us

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

