Return-Path: <linux-arm-msm+bounces-85869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92CCCFB67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FE30305A634
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B666D337BA6;
	Fri, 19 Dec 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXYPeD/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUtbl2k9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454D12459E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146226; cv=none; b=JttC2igxf9tAhIgPJz2mN0mji5Srz2ybhQziG9HvAxh6n06xBllVSfCCYO/likoPdZ1l4o2EbPQPN9A6ogo/Zf+AMyGjnf2xgloVrnfn6CQnQhFTUKZFVfpJsU110DKFWuOn3ClLuXnajIpbH6XsvSLJDljiAvGp6kwGhcw2OU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146226; c=relaxed/simple;
	bh=70L2YXjuaacwvEy8Al02xuF9o9mP13L9w0t+IjhRb5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aExhNeuf6auOZkVqRg3k/71+h8iqx+TxMyG/Yl/5nfu5aKhf7UHZNV1sj8F5wbfGGEdIPrU82r9eExax+EHpX/seKAd8vysYRP8kctnGrbPXQ2FrSnrNXOfGyWnzVLxIc9uBk6xKO53zWLQ3IYlo92Am/e1zE0h7WngfPk2xhiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXYPeD/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUtbl2k9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB41Jp3939222
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1E0j2WrLuJ6HNvcM8VvC8PrOpJ89a077gsH6b1pbzI=; b=kXYPeD/TS1bfPcXu
	zYhzIMjSknQwYH9JWoO0oQvkDsTudOq8n3InwieNSoVB9w/NE4FKvRWKi88ghCSP
	BdgBDE9eluZuMs3LXHoZv/ydDwisv/wXegYpdESN3MaLfgGEB41Prurpaabyuem/
	b6c9ty2rzF32JEJUCryDFUvB9M9gCc1YnPPkQ05YG4qRJsj+MMj+ICWxjD3iuG1G
	cib6S+XM7yi2Va+CwVMdaomiKnrCR9WtrXRILukicJCNm/znnp8cu5V8g+PjEMxq
	FGh98EqAezm5seq50AXVQjkIwQSmoZqodGKB8r6FKoSVJUpvlxzTUJrICZDhKdTd
	Q60Vgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2kb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:10:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34b9ab702so2921851cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146223; x=1766751023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1E0j2WrLuJ6HNvcM8VvC8PrOpJ89a077gsH6b1pbzI=;
        b=kUtbl2k9SGwab7vDE7aP8sRe2rToemoenmWe4OK20B+T3Preiaff1lwgReUfgTMjGi
         V0SOm4XIxAzplb9VJdNxIHC/PbNwk+z+xMKwW4CcbHJnTsMm38QE7w2+93nd4ARoUrBd
         nKzpvLzQPxdVLpOIwoijABCYpbk2J4rcPDdQXpvSEvwEhDmRnoXQBmYel+GPibNPQ2HY
         yHAUHXM7HR8IBoVSb2m0FYg9e5s0JfJqgisyIBAXwYwfvw26/zKeKB90yKWAJYXz9OjF
         x8kKXMC1UQARNhbmlsKwEu8ktUYFAl4UYRUvd6/n8UZ0vudP8nP1k7j6Bhr7KyfFw7jU
         R+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146223; x=1766751023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1E0j2WrLuJ6HNvcM8VvC8PrOpJ89a077gsH6b1pbzI=;
        b=fRJyEDmjOtNesSkfJ0JQtpD76OOi8mnCV+snfLFRbKwOXhft9dQxzyt+bJPAny1l89
         EfvKIu8nXLmmXjJHqnkpMmPvIJ6HVJLU1xl6AgCyfXJbo1pQ1xAOzlhYer6qOb4+TKmQ
         aAzKpBW+0sG4PfPKu0iZvrw8H2u9/+WorBFlvJYKSN69LRycLJsdaztMJ4XqU8yME5Hf
         eeeMDtcoo+kHlQwJ45fkl3lbta5yUnagtyIpTXDP+HbRLXdSC9iwlygyYbHytMlJAmcn
         j3eeCfYw2nur8gEPX823zGswKnZ1v2Qx5YXXNOnjveCuCbJeZSTjgypfqJE/ajHxvWYV
         Lu8A==
X-Forwarded-Encrypted: i=1; AJvYcCXYSLj3LMdmRAe8iaYBlGKgD8Q7jdkSw32NtxjvxEAEsNdeWqfRz/U6ZitA04cdQ7qrx+wtF2n7n+nPZKWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrx7DJPJjX20gJ6vnrd4zbEK563L6PqzVH87fDM9PohGaUgG7
	80RWgpxLdqmkGgBHKOhIFMDhrZ2AVBNj20Xy78fyl2sr1SSRL52UAF8TlvXCMlAlzy99MfZzQXl
	ZjgWquKhkvFcK3yhsLefwkvIjdHCxwI6EPL+6fDyyIyh965i7VsPzGfHrlEEInDn2hqHESh6uNa
	GU
X-Gm-Gg: AY/fxX7kNdTQXyknqhux/YmG4dqq+EDsxJkcYQew9a3kVvdfpoiJL4xYzgCLdRRUO1q
	NUe+IJZobd1Y3k5XMJd4WYTqzzXn5zVgmWQ6pIRzhizPfZs6LWeeGJ6Fk7k+hlQU0oScNO89Kn4
	EpsgEwAWaDfaMT9su4kO4euTBDfA6VW08GFJ9C6/cIpEN86vCFu2Pk6vZX3+KHceWxy7LlZ4hBi
	VveYQd8R8sftL+vw2/iqbSgmRSblEpqze6dCfLsjgc9GqhBzflhCj3/Cx0kraGAsUqQn6cOHVM4
	5dOISwVHtXPVjRQZ2jhqySwz7Kpw2ByLjUMyiIoV231FnWxzL3XAYo1CbzFbeEG5nUOB4ELbndg
	27dpGc9KgvgSIUAOiEXohPTesOt8Pt9x/KU+9esvss6HLFc1NZ5g6ANY+4CLcnPZzHw==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr27037681cf.7.1766146223321;
        Fri, 19 Dec 2025 04:10:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3J+40imZBXI40AG63cuh9IorOWKmfWvGmKndpChasYbSfFq1aRyi7tEaLSb1vEUOyTogApA==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr27037251cf.7.1766146222785;
        Fri, 19 Dec 2025 04:10:22 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm215165066b.64.2025.12.19.04.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:10:22 -0800 (PST)
Message-ID: <4112ba0b-6feb-4e30-a57e-50ef9e3d6b5e@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:10:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
 <7d31f45b-1062-4118-8769-49209908f2ef@oss.qualcomm.com>
 <aUU05P+xP1XdwihO@hu-vishsain-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aUU05P+xP1XdwihO@hu-vishsain-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KmXrVq4bdZnr24MdMhfVRcrsIHukvj7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX0JGKrrlEZ/fe
 KfuD3Y69bMpY1EEWRAisjl15O0g6ahn2WcAJRVIvTVIxykJnGDwp8dhv1ESwy8YdaZL+6/Aosmh
 TZdjNH6fKR8bYpGZewZT5AHTLrx4zP5c7kHXc6eYNKpDxjeKwAya15VW/AcMUUDESd3rQQAszyA
 GpsAgqafDq+XhztyC6aU+QzWRKN5mjGS97RwayBD3l/97xw0Dvj21GHASpGamvhV8r2KWArMuFG
 Orrl6XBVHuLcgTfo0bpXIu1jihZ5PjBaOhrFWoxXtqN0wSqsOFtKcp9tMVDpLLslOxssbnrWVSs
 YHiobNSbKn9+srNghwxvMnae4394RNNMn3Lk9ZkQxLhDmzw3/wRdTzYBZ7SVfim2OhlDEJy7jjS
 wmXn9p5tdfyMwN5iGb1ayT6YAYnyEA21FwI4RymtZvFyys1W99IURDx+jtJRezsQpXJocfDI/4L
 GFq3z6Kx+Oi+HAw5+nQ==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=694540b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zeNy_F3JxkFpdNDQXxAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KmXrVq4bdZnr24MdMhfVRcrsIHukvj7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100

On 12/19/25 12:20 PM, Vishnu Saini wrote:
> On Thu, Nov 20, 2025 at 01:11:00PM +0100, Konrad Dybcio wrote:
>> On 11/20/25 11:58 AM, Vishnu Saini wrote:
>>> Monaco-evk has LT8713sx which act as DP to 3 DP output
>>> converter. Edp PHY from monaco soc is connected to lt8713sx
>>> as input and output of lt8713sx is connected to 3 mini DP ports.
>>> Two of these ports are available in mainboard and one port
>>> is available on Mezz board. lt8713sx is connected to soc over
>>> i2c0 and with reset gpio connected to pin6 or ioexpander5.
>>>
>>> Enable the edp nodes from monaco and enable lontium lt8713sx
>>> bridge node.
>>>
>>> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
>>> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
>>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>>> ---

[...]

>>> +	qup_i2c0_default: qup-i2c0-state {
>>> +		pins = "gpio17", "gpio18";
>>> +		function = "qup0_se0";
>>> +		drive-strength = <2>;
>>> +		bias-pull-up;
>>
>> Similarly, you can move these settings to monaco.dtsi and keep them as
>> defaults since 99.99% of I2C users will share them
> Is it ok if i update this in a different series, similar other nodes like qup_i2c1_default
> added in monaco-evk.dts?

No, I don't want you to introduce something "wrong" only because you
don't want to run git commit --amend

I see you've now sent a v2 just 7 minutes after asking this question.
Should I interpret that as you expecting me to drop everything and rush
to respond to your queries immediately, or do you not care about my
feedback anyway?

Konrad

