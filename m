Return-Path: <linux-arm-msm+bounces-59508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B228EAC4C71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8205A17D510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9002A257430;
	Tue, 27 May 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLwVmvyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CB3C30
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343063; cv=none; b=AN9Qd6RJCt/izeWKm+makuLUepbQoROslesaMx48uYJaNrQkITxc+ARM3nnd9fC9oQ7JSibKDCZUhSFSRH+nFOkB3ydliMbut18HyGWQnDN6tvVXE6NGOr+2JqhYLGZPHISCcxIBI8ABVClUpAmbCtSeaYhLN7E4dxzGuygnQwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343063; c=relaxed/simple;
	bh=Sr2kjoe9CHUb8wBN17DkAoRrIuXe/6ngTnlp+O6o0nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mykiSTv6JtF5QlYKtxw66Xmn4wDsLaDlOFf78TV7fuGP5OSUzp/k0MseFFJM8/bmVvHT4v9uUoN45OwENDRfxIUZ+B3XdYSkkMLSKZpCqb9jSOafS9exDp1GwvMPy85fwiDvTUVux97mDd4UqptbHPDfUN9QdD3F0XFl6gLu2/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLwVmvyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAOm6F002523
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRBqOzOrv28UUdHO/wXjqy1ptt8k/i+66lCaL24WiV4=; b=LLwVmvylktZaxbAL
	uY5c3TpJQTil6NocAMmhUskKEkl6TdqPZ1GuvtZROG9KAY4fnA3oT1B7zn8BdJAY
	Xvgh638EFk3D5WX100J0Jb6c1+OYXdPIPFD6Pc7tzQLaGATmjblCKtudbWy2aPHp
	nYHNrHfmha5+qjXdHREnXQ6qqMuYJKNIfXkUK+hW3+524wPzYf0zu3qSmQbf0JGB
	JkpmzYm6ErmZZpMw+eXjrlrYmgP1VUTmzhbmKmGpMfUodVtf44dHYofQSt9r+/zv
	NyhLY+4TGJQzZyjjKig1i60m4fyzfE0JmBGfg3wVKnAzvHCNRY8W1n7VFtQTYplK
	t8rHSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjpjh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:50:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-48f812db91aso11024671cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343026; x=1748947826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRBqOzOrv28UUdHO/wXjqy1ptt8k/i+66lCaL24WiV4=;
        b=KtNYm8NblKxpZEqlSpYpnM3lnUouM2uH19F7hUFLZqKY8RlnbOAcc3wL0HJcR5qnUg
         SshaqsBi/IjKySFgZvPhwbwAltqzuqtI9fLcp4ExRtaT+wNCr6zSxjhVDwf2IeEJFBH5
         np5lxTHE1XinR7VWjSGIlOrsHmkAyLtBAeiiYbX5wpFPUlzQ3MdG4ra5H4cmUBvpwVCX
         HBVkSJ6a4QYCvxUqO/jQRu6CmNcWVYJGDCP/C+6pccj9kUpJ0OrT5bnLMaM/O8/8j+ZE
         PgaTabMl1n6+jbdyICAV2VuzNu6Kqm821/V/LmZPgH63Wd4DAMgy7JPpyu9EDBwqFLvi
         citQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUks4FJRqJuyroCIJ4owsDY+6erGoXoANsODvFrSoxbMt2yualL7IJgH2jWt530oK5b8RoVhztEmAbBQEn@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9l/LhSHFBpYb/fjUoNgjHIlMTngWShggIuSuFeeKVSDo9olW
	ysmU2/9PHIl32a4GjzwZ7aw/qg9jMGP1M/ilfActNUCSzvnx4620IQjAs09MCdsqKKg21gpIRvi
	mWTag2KvhPD+zH735SxUjq5n3UW2aKazSlc0L29I7HnIAlfvbHCc90g1r0ZKtApqmFWDC
X-Gm-Gg: ASbGncvKjUE09vB5alHGOVQ5MM9KYYJQmr7G5otQnEFTvsPrI8JpxJ5RrDoPcSkcxkg
	CJtTrSIZXdDUy38U516W245EfcP1bLyY4htfTuaOBPoLTDty6cs1xcLuYtYs8Nkbj8XdbwfmGfw
	vqJB+Xlpe+XJqr+lFIo9XqW+eQySSkMEdMt2g21JsOEGqz5xz5d1KOhxgkOSoej64C0wdgtZMpj
	+lad+bjAWgvr2tUVcUX4bK0xmPk/9JstgYXjGT5LQJ8bQrsNIQSbLV/47l1uT9a0kLXhPNi7fJB
	HndDsfvIfowFkBxFcYd2UHxaPAYN16tFpIPAoPpYSloxWkE9ZBikAZc3ZeK9AmxE/Q==
X-Received: by 2002:a05:622a:204:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49f437e5af0mr68352891cf.0.1748343025894;
        Tue, 27 May 2025 03:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WSrw2nabesb+cdYzp0oNZGTkIWjS90wW23jZaW3xkQFZgwFkrJkpnTlVmdSvDu2G4AMqLw==
X-Received: by 2002:a05:622a:204:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49f437e5af0mr68352701cf.0.1748343025468;
        Tue, 27 May 2025 03:50:25 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af2asm1832533966b.4.2025.05.27.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:50:24 -0700 (PDT)
Message-ID: <7f525932-570e-4c81-a3f2-6d2e26b02233@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, Wenbin Yao
 <quic_wenbyao@quicinc.com>,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
 <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
 <aDRw2rJ39t9W10YG@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aDRw2rJ39t9W10YG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68359915 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=4PHQb4W1jccdVsicM3wA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-ORIG-GUID: Hs-unkAPu0S-JYUmjuurp9uGXWq-rruQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4OSBTYWx0ZWRfX6TONyupCf0vL
 9cBaoMC2k9NQ5UecNLE1yy/rdsTf42u0Yi1ZMD7kY0awvO59WEWiIdnLSSv5iL2+N0xTHkcDy0m
 9ElQ4+xMcLMJa1v3ja4exP2FcCD0bvPv/faBPv+Q++H0CIXFE39y+U6wC4HFV4JFUxnbzGyICHP
 vGA5mU2+i5V5566M3S8IJdx4jaqX41YqCO3E/HjwV4dLzkiWuaG21NYGbWbV3hn4VCSjZnngIst
 r8cipPLxyT/dKH/w4MCJpCRYxoiN6TylEopNVMzNa+mpiBiz4enNp8vtF69bss4lpALHgTG40po
 yalgKk/goUa4m4s/EKbB/0bV+wzjvrBBVD6VEO/ZoTZj8y16U9U/dbB+N+9IMdRuMrew1BCSaEI
 Mm9/qLnZePEocNG2ZNuzt9y7GCSLZN6zDglnqDS8z5HZIUhjkpEBNjDAByoRcyJ0/Mn+/kaG
X-Proofpoint-GUID: Hs-unkAPu0S-JYUmjuurp9uGXWq-rruQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270089

On 5/26/25 3:47 PM, Johan Hovold wrote:
> On Thu, May 22, 2025 at 10:03:18PM +0200, Konrad Dybcio wrote:
>> On 5/8/25 11:45 AM, Johan Hovold wrote:
>>> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
>>>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
> 
>>>>> This still looks wrong and you never replied to why these supplies
>>>>> shouldn't be handled by the tcsr clock driver that supplies these
>>>>> clocks:
>>>>>
>>>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
>>>
>>>> Sorry, I thought Konrad had convinced you.
>>>
>>> IIRC, he just said you guys were told to add the QREF supply to the PHY.
>>> That's not an argument.
>>>
>>>> If the TCSR driver manages these supplies, would it be possible for tscr
>>>> driver to recognize when it needs to turn vdda-qref on or off for a
>>>> specific PCIe port?
>>>
>>> Sure, just add a lookup table to the driver and enable the required
>>> supplies when a ref clock is enabled.
>>>
>>> As I mentioned in the other thread, the T14s has the following QREF
>>> supplies:
>>>
>>> 	
>>> 	VDD_A_QREFS_1P2_A
>>> 	VDD_A_QREFS_1P2_B
>>>
>>> 	VDD_A_QREFS_0P875_A
>>> 	VDD_A_QREFS_0P875_B
>>> 	VDD_A_QREFS_0P875_0
>>> 	VDD_A_QREFS_0P875_2
>>> 	VDD_A_QREFS_0P875_3
>>>
>>> and it's not clear how these maps to the various consumer ref clocks,
>>> including the PCIe ones:
>>>
>>> 	#define TCSR_PCIE_2L_4_CLKREF_EN
>>> 	#define TCSR_PCIE_2L_5_CLKREF_EN
>>> 	#define TCSR_PCIE_8L_CLKREF_EN
>>> 	#define TCSR_PCIE_4L_CLKREF_EN
>>>
>>> That mapping can be done by the TCSR clock driver (which would also take
>>> care of the 1.2 V supplies).
>>
>> So we had an internal discussion about this and while it may work, it
>> would only do so for some SoCs, and maybe only on the surface, as the
>> wiring behind it is rather peculiar..
> 
> Care to expand on why it cannot be made to work generally?

"-ENODATA".. many connections are difficult to unambiguously decipher

> 
> Also, what would the mapping of the above QREF supplies to PCIe PHYs
> even look like?

I'm not sure I have a clear answer..

> 
>> Plus, not all QREF consumers have a clock expressed in TCSR as of
>> right now.
> 
> Is that because there is no corresponding bit in the TCSR or simply
> because it has not been described yet?

Unfortunately, the former.. Some IPs have a non-TCSR ref clock and
some are presumably implicitly fed by BI_TCXO

Konrad

