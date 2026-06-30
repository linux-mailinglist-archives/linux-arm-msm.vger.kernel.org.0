Return-Path: <linux-arm-msm+bounces-115435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T9E9H2HAQ2pIggoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:10:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 210396E4A7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:10:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J+k4zO3D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QB5FMT+/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115435-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115435-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1E4F314B599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C9341168E;
	Tue, 30 Jun 2026 12:59:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8424410D34
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:59:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824380; cv=none; b=ft74bF57MGL1MlmPLfDbSkfOI6+JmM9w20OVn8dMwW9vqRTAcMIDwT/Z8iTRF/rLJHvdcuwSTrx2WklSIQMbpF7D94fSVsPkuqL+sDpbRiFYU6rgNkSeZ40/Z03pwqVGJ2ChvMNMsgc2xa3dsLwCPSI5ttl0WsJ6QsvFCcIY60U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824380; c=relaxed/simple;
	bh=dFKj7OXQ0zQrD5vQZr5mW8dOzbMKpyu6PQoCEKaFsO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d34989C7uMmLNF8VsmJNbHX/AHPY6JutDtYygAp0bT4c4wUvQ1R6f6IcUNYxoqTAzecmWQj1PPdwSf1hHrlDXwEFVDXfZOiMLLSlw+/jdmVpo3xtenCTMv5PJY/LYs+ibf9sOjRW0bLkfQ45yCshTZFAbiA8yc+At2/ClJbFk6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+k4zO3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QB5FMT+/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCga1590615
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+jw6agAVMfXrVb944GCduKScckC8PemaDQU7rdZ3eY=; b=J+k4zO3DgOGWcfPo
	xsBUuofmwuGmcWBjG/991G4glIdHakl3CIgT/rLmzaUD3FWoAMiYtyw25FXXJltw
	89PpnUBfuAOCZP+wxfNK5CdYFpSVaTka8pZP/Pv4j0bISREG8oIBox1H7AHY0KzP
	T8UmwPxyYdiUY7SrMjWO6AWS/PFgnqccDvkDOdEgWh+Bosg4Oc9ckWqCDxIMJ/Aq
	s++ils1j3KD+cngPT9kjOzzTUeB4eM67qU1IZNcsyCrGka+H7klLWSpgoYSTt6GG
	nHceUHwiywxHbtVYNPrChRm8dNOsYmUZteYYvg4TxHBk0lyWdENkLObSaWpPdKr2
	gw27BQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3mnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:59:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so1685461cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824377; x=1783429177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+jw6agAVMfXrVb944GCduKScckC8PemaDQU7rdZ3eY=;
        b=QB5FMT+/k5y1McDyTjmLgD8PUzuFTkAU2zrmxodlH7X8+06prfBMqpAj3RkJJ2AAr3
         Hv341aR+d8MBlQlMvYqxsbRUFi9SvVqTsRp3D9fBvqY8keeSbxECD+Lbh8ch1pKEkYp5
         ap4ARJ0e9UrCUCyw5uZzJ1+zDTmIdaIE88B1X2GXsOigOonRArT2yysxi8cIwZ01BWKl
         zFAKzKiBt/tayMDx3NURbd092slyNcyZQK5uV7RF2/39rGxu5BirG4lJsZ76SwBI6ijA
         PUK1JfNOXb9mlAV/QBqgR7R1fmtvgxJcXuSSYdncU0ra8J47nTrG/K4YNbm9wGX419Ai
         MFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824377; x=1783429177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+jw6agAVMfXrVb944GCduKScckC8PemaDQU7rdZ3eY=;
        b=ezCO5zrBomT10zQDeaqM8c4l7pxJH6xZAKwl/D5toGsvwDMZxr1JcRj/NrNErpGyX1
         u/D5BUxIHpddL8V50dxQcm2yVMdmR3O+YFXT2unHsCx0Q5ui7hgYamwS9RljyJjLFN5f
         2IOZVONTkPPsO2k7iTVNJuVRoSpRIOgKa16EIo72xlZJTdDD8zS0rAp4WSh8SdbSdjoI
         C8WoqNmoAR1CKjd+fWOMrgB+jE0cYQ0x9krPonwu2SsPLLqYMuHqliGsBh/xA29NCUpc
         ngPUXa5LFgxFdaNoMtJQncW6G6i8wjfIHchw1yVft8FbK3B0LuQK9uNZl8Ef37NqYUNH
         cFJg==
X-Gm-Message-State: AOJu0YygoraZVXM4VA9ew15s/2vne0rO/UIetZmj4YnYTg3U75JcSZ71
	VMxppUvATwH0VKS00JV4dZHCRFemY88pLlsX1Cxl7DiIAbyQ0rLn/TqElS70VHV8rqNrpbjRJ4X
	jrgn5s9EOodVDNjZ5Vz8KeVLHLJ6H3pZFWGuPVO0c6Ak4CWBXtV/gjd3qhmXRy9OSCP4E
X-Gm-Gg: AfdE7clahCGrt6n2ys6xFgPv2uQBX9LcwZlzANZSVj5M8bMUjtQtDTa3dhi3UbAhWpW
	rEgpji185RS1wvSS/hAFiUOiUtqVr78FexR7RMtFMDWJiEKB9eOJ3CmgypmKz20jCKAQ7PH8bH5
	BsstYDKDhTjhf4Q1Vg9OQ3Oa+CE/AlxbcWO70MpWgPY3sSuEClMTzLtP5G2MA6cZLAGa5dYXciD
	DDePdbFKCzlAhKiATOgwQgqEWI8nm3fYYQ7Htlfri6XmTKx/H0ASVYdXiQCexrXMzmxsR4Fqqrf
	hykuyw4iCe2pLueuc1FFByxH/3H0eQ6EUq+gRF1XhRgnEpea3hvdMdlIPm9GMGDR97j+LRr1rrR
	3/L/xXjRvqI+depbOX4VvIChjXn/MarGNCo8=
X-Received: by 2002:ac8:59d4:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c108ea935mr31465641cf.9.1782824376968;
        Tue, 30 Jun 2026 05:59:36 -0700 (PDT)
X-Received: by 2002:ac8:59d4:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c108ea935mr31465301cf.9.1782824376338;
        Tue, 30 Jun 2026 05:59:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm120373866b.31.2026.06.30.05.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:59:35 -0700 (PDT)
Message-ID: <e0ce4c68-4cc3-4484-bb23-5221acf08b1a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:59:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
 <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
 <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
 <5363525f-9440-49bd-83db-242a7ed4e15d@oss.qualcomm.com>
 <9e57f91b-8f80-41d4-b50f-31c900cb0fd0@oss.qualcomm.com>
 <79520895-f584-47e1-8206-3b7c06b759d4@oss.qualcomm.com>
 <d35d0475-89b8-43f5-b91c-4187e9e6c145@oss.qualcomm.com>
 <dbfbea2a-ee64-490c-944c-623aea2081bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dbfbea2a-ee64-490c-944c-623aea2081bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfXyXQdi9F9M92x
 wgx7uKnB4XiFi9mjRJWi+xoLwUGCNKvIcJr/YZRJI5D11ODhDbSJl6WO5Dlzrqg10kxCf+EU1ho
 cB+UL2XHZumPrw0d6uV7M+iS6zOSQtU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX1A6UWtJT3ULX
 wFbyxNpJQbz51OFx/w7gQ4dYsKEctWP8M2EBJiyubQrcY6h4gzjRwAb6FHNzsC+rg7fOjoPx0zk
 GwAhkS/Hekr8O5mnCGxbSFsXaKH+Ztw9X0sb8jBBDnKGgG0Eokf9mVeSFZvFy+xaMbfwJQcxpi+
 n6fRvELsnTKS10vf64OHglSROSZbEjhPVsuYp++X6cqYV/88+6FPIqzD9M/j64VXTUcRCH1Ewma
 ZmFZnTnnFnIPsRc9hRA49yagJy53DuCYUuQ+NGu9+w/bSGEFVIXo4OeqA8muJUIBdRBXg2kTHW/
 r5NSqbLsL0PiOp7VcY7yIwPblv9pCgaqPYNPK65Kemsoo+XHALNfItlNwL+Cd5QdWf8YaiYl93M
 nkN+acpf4d1cyZHg/610+waxbU4dp0b4oa1LVxS0XJXzWzEO6oo8KrSgi8Zn8jgLWU3+qPH9ucS
 SzilvcEU9Iwy/lz/CQQ==
X-Proofpoint-ORIG-GUID: 6xiVyWv_C-41U4eqbzJn_-3RG_KaA97x
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43bdb9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zJm8CUoxnjNxqJeWGtEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6xiVyWv_C-41U4eqbzJn_-3RG_KaA97x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115435-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 210396E4A7B

On 6/30/26 2:22 PM, Viken Dadhaniya wrote:
> 
> 
> On 6/23/2026 12:20 PM, Konrad Dybcio wrote:
>> On 6/22/26 7:15 PM, Viken Dadhaniya wrote:
>>>
>>>
>>> On 6/15/2026 5:30 PM, Konrad Dybcio wrote:
>>>> On 6/15/26 2:00 PM, Konrad Dybcio wrote:
>>>>> On 6/15/26 7:28 AM, Viken Dadhaniya wrote:
>>>>>>
>>>>>>
>>>>>> On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
>>>>>>> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>>>>>>>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>>>>>>>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>>>>>>>> entries, causing incorrect bounds checking and preventing firmware
>>>>>>>> loading on those targets.
>>>>>>>>
>>>>>>>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>>>>>>>> limit and ensure correct handling of configuration RAM regions across
>>>>>>>> GENI-based SE blocks.
>>>>>>>>
>>>>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>>>>>>> index cd1779b6a91a..d0810960f3da 100644
>>>>>>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>>>>>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>>>>>>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>>>>>>>  /*Magic numbers*/
>>>>>>>>  #define SE_MAGIC_NUM			0x57464553
>>>>>>>>  
>>>>>>>> -#define MAX_GENI_CFG_RAMn_CNT		455
>>>>>>>> +#define MAX_GENI_CFG_RAMn_CNT		1020
>>>>>>>
>>>>>>> Is there any SoC where this could overflow the register space
>>>>>>> (you say "certain Qualcomm SoCs")?
>>>>>>
>>>>>> Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
>>>>>> entries, so the previous limit could overflow.
>>>>>
>>>>> What I'm asking is whether the size of the RAM on any of the SoCs
>>>>> is less than 455 (the previous limit)
>>>>
>>>> *Less than 1020 (the new limit), of course..
>>>>
>>>> Konrad
>>>
>>> Yes, some SoCs like kodiak, monaco and lemans have CFG RAM smaller than
>>> 455. But MAX_GENI_CFG_RAMn_CNT is only a firmware ceiling; the actual
>>> programmed size comes from the firmware header. Talos needs ~650 items,
>>> so the old 455 limit rejects valid firmware. Raising it to 1020 fixes
>>> that without changing programming behavior.
>>
>> OK
>>
>> I tried to find whether there's a "ram size" register to limit it further
>> (i.e. have a different upper bound for different platforms), but there
>> doesn't seem to be one.. unless we can deduce it from the version
>> register?
>>
>> Konrad
> 
> Actually, there is: SE_HW_PARAM_2 has a PROG_RAM_DEPTH field that gives the
> exact CFG RAM depth for the instance. We can read it at runtime and use it
> as the upper bound directly, which makes the check accurate for all SoCs
> without hard-coding any constant.

Amazing, nice find!

Konrad

