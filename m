Return-Path: <linux-arm-msm+bounces-93477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJz8DassmGmzCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:43:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A634C1665E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E87F301CD97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F9E3246E4;
	Fri, 20 Feb 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SigV1Ufs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRrDifmY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFB3242AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580584; cv=none; b=DlqSKepPBV82hVA6uuUe3gKpI3MSMoOFMKDxSPMwO3PxayOTOIQkQiPZWZONDxo80QMVvI4VoVfeQwudI2xGaIJxMvIwqXfQmvCpLY0sNO7VFkwycH5U301P36Rk1d4uq03NqVg+p7IQAxF0jpJD0fvCyQtjS70IzjxqjnOZsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580584; c=relaxed/simple;
	bh=CiWq+Xs4vmJh57HSDRnCX837eKkd1jg+USAW7LmCI34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7e4cbwUrR430aKjN9F+C9WmQgYC+qt+a6O9GK1/KtCzxlUNZzllVj8tuNdX5H0hLlXnRNrQ4W8pgms0wiOzt0PQMK1da4Io/yPzND8VGFwKiEeEi7gQte2KgitHvm0VCBEfqOEQbTP1WC5dK7Yf14TZQPCYCDYWcGyYZ+vXc8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SigV1Ufs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRrDifmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K9KpCa152763
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yq1Y/8D7dzvVWIg3adPvOmmq+xjHtt7YPV2lZuHm6v4=; b=SigV1UfsG8k21zWZ
	/++sdX/4++YVit6xZK1BheTCMXHzNp2CG3RyP6/BIplNRTUcEzTpxRWX7klVcJeF
	y9sMsznn/5KK5p9uLcxScVq9j7MivdK4gCJ9PsIZfw1jXKlJlPMEFYcn//GMGbGN
	oNfOF6xCfAB7N/cgLvY7brbgjpZTeMWpVKTz+4zuezbjjKs2xt0xi6AUG825rddn
	g9/QOEt772XFRPo0n0MslBOt1IsVF9HxxpyvJLGNLRF7UhWVn2P77f29H3zIz6BI
	1nSDTOE8XmieNAurj2Qh55hft3NXxun+J8yUnPXmtFWHAOJ7/85Qm0EUDxkcoZcp
	g7/+dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2ghubf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:43:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso192100885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771580582; x=1772185382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yq1Y/8D7dzvVWIg3adPvOmmq+xjHtt7YPV2lZuHm6v4=;
        b=iRrDifmYJ7xGqXAyT21BpE8q9uwu2Yc8i85fmKJ1t7yfIJQPiyhy321N+4plpSOGaw
         fa0dxq8eYugtVN45ha2Jm0NJLeGlXIyzQ71HFFEx57L2Mkl+V5xMEfcTJ33XIMgLYwSt
         DsZJCRilvQghrLyWQC5Oo6Iv2yMtG93Z9oyG3xvcbje5e9N/D9Py/GUmhufP7T08/+lJ
         3Ik1v/41X+8Fhsfv3gF4ESwoYTob5Slaes1oJvFymq5usztK5e+Xqr1sWGHZFcrXWw0f
         5DQaiG6054VjCAnsB3LvkouBFD6c/oSOE3UfHvuOD/IJtUXNIva1S5hIAbCMazr+PdPa
         oKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580582; x=1772185382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yq1Y/8D7dzvVWIg3adPvOmmq+xjHtt7YPV2lZuHm6v4=;
        b=riqU2c3RmOAAsjN1eekl3eScHfTaAY15mPIXXkdh4DKH9HkFvXwyb3x+yqvSUkrr6y
         hgH1U8TPcBiwMii7EEe1nZX7Xw5OFT0rsoiKItApaeGzbo9rIugLvHJ6su/YiRUBGaBc
         CaX9TwbNjJhgejIJpA+n2MAVwazomuAPSPEg3bMVnydOxIHfBdwWUgVkLZWHZSPpsg/0
         zKCYdfBkrgHGvvLOGV7dBc85l+73X+Tny85c9WedTeARVhNTXDWqtQvF58ED5NSqNs06
         s7csY6JamdgNeW5FKnqwP1AlhltLDeXQG2Fy5ucrHIaIpm2Y3M0pWfo0hC4qHfRQMbrZ
         EeHw==
X-Forwarded-Encrypted: i=1; AJvYcCUU4jFxOdciT+6YOtlgiRam/RvIaDrlrFqlXXP7Bs/1KeNof9o+NTCCF7sVRhO4AsQmk6J6e63/Eo5cqjLb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxKNyd9f9Pv9Pq8bgeC7mtIZDz8eOeGa+1NWd3XmQk2vUCgTx
	kQ/A3fh72aFY+G4w3/aPwHFwnrBcBkMTD3gJWo55Mjec2N4msJLwXK3f1v4Oa3DE6SxrD45q3BJ
	6SN5Lw7SBEMdPwVLdzumjRT7Gvo2BzI+JiK9w5aVZ4Uy2VZpWiPZ4otb6pbV9+zCf9hF1
X-Gm-Gg: AZuq6aLOYWtWEipaX75kOYekNhitqd4sKRR55ARduHC1Jf9sk4cEKdk3XAYXn+FQQ/K
	pwP1kIB3jUaDGImLhhHjpUFZnBOnL606f8Bikau7guzIgA0nPzivhX2axUQqDhStfoVqfvpwR7O
	8U5/hfSB5aLRCU/vuB+O7XJXpuBT988sPW3oQXFX1YuUv9zEh5oBDkhvm5MnkmmlDMzqJlgehjO
	jkthhIHWT986z0TZTr9we1gyuCdNsS2uuRqg5ZyhPcYffiPDCVYflFCM0u2dUq8y5B/ZpE0UxhL
	lhEQkI5zUXfJjE4EjHO9A2DHswp9/Q3xu0NQ8yPRCfSFrN1YepC/MVSHoPm0DRHUr5rmgo444hy
	E3UNVyzt6QVIrm9xX+D1Hc11+jJbVXmbxEehCGMQNDnuzY0A4nIaqWMQi/nf2LzWHigrFYMcsZ8
	d5EmY=
X-Received: by 2002:a05:620a:5dd1:b0:8cb:47cc:2dc8 with SMTP id af79cd13be357-8cb47cc3ad5mr1716686885a.3.1771580581635;
        Fri, 20 Feb 2026 01:43:01 -0800 (PST)
X-Received: by 2002:a05:620a:5dd1:b0:8cb:47cc:2dc8 with SMTP id af79cd13be357-8cb47cc3ad5mr1716684785a.3.1771580581218;
        Fri, 20 Feb 2026 01:43:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4fa7c7sm4793620a12.31.2026.02.20.01.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:43:00 -0800 (PST)
Message-ID: <5bf31bf9-835b-4b87-a4d0-8452d516f13c@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:42:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
 <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
 <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
 <6d2c99c4-3fe0-4e79-94e8-98b752158bd6@oss.qualcomm.com>
 <aZgOUv+QweA7vE1W@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aZgOUv+QweA7vE1W@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jyWKDlZ32M6eDfU8opIUCsrGA_Sg6b7t
X-Authority-Analysis: v=2.4 cv=dqzWylg4 c=1 sm=1 tr=0 ts=69982ca6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=A-1GGxaxaoYmO2IoDNcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NCBTYWx0ZWRfX0fFo5E3DK8e6
 ZtR1ggAy8+RkwhY8UVxE06MLiLpueC5empRtQVyTDdiOg/B7NKMWF1tc4a6ji5aLUimy/NGQo53
 vsrjHGG3pd49g1WWE7JBY91WUiYI6NOF4KPUEpT151DzttqV173Ez7q5V5YL5ob9nVBmQZNTp2Y
 je+q9tmxCpcDMlNjhulcLRGret3ejn8zQcTUtLLdsurzDMRtoEu8xV93SKaNZ0cwTWm9XlIOWAL
 WMm3v5NvXmPNBd0cblkopei5iHQa7Rj+yOIH9Pr8ncY0/xNb3aco58aF37okltTXGp5YUQZKUXf
 O/Xfb3agDiejiv5h4JCLl1a7j8vrTN9TBdzRq0JkpXkx8pMMDSQNfWIMma8St7JoOBnTLnCv9wi
 ZcnLNS5xt1pRK3B3LwkXDLsk9MrvrMn7eR7b8eadHQ47I0INXYrYNORS1LY8YRk3fbVhBgnw2CC
 nH4FJVdS1Ak/m5XD7wQ==
X-Proofpoint-GUID: jyWKDlZ32M6eDfU8opIUCsrGA_Sg6b7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200084
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93477-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A634C1665E0
X-Rspamd-Action: no action

On 2/20/26 8:33 AM, Abhinaba Rakshit wrote:
> On Thu, Feb 19, 2026 at 03:20:31PM +0100, Konrad Dybcio wrote:
>> On 2/18/26 8:02 PM, Abhinaba Rakshit wrote:
>>> On Mon, Feb 16, 2026 at 01:18:57PM +0100, Konrad Dybcio wrote:
>>>> On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
>>>>> On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
>>>>>> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
>>>>>>> Register optional operation-points-v2 table for ICE device
>>>>>>> and aquire its minimum and maximum frequency during ICE
>>>>>>> device probe.
>>
>> [...]
>>
>>>>> However, my main concern was for the corner cases, where:
>>>>> (target_freq > max && ROUND_CEIL)
>>>>> and
>>>>> (target_freq < min && ROUND_FLOOR)
>>>>> In both the cases, the OPP APIs will fail and the clock remains unchanged.
>>>>
>>>> I would argue that's expected behavior, if the requested rate can not
>>>> be achieved, the "set_rate"-like function should fail
>>>>
>>>>> Hence, I added the checks to make the API as generic/robust as possible.
>>>>
>>>> AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
>>>> play, but the latter never goes above the FMAX of the former
>>>>
>>>> For the second case, I'm not sure it's valid. For "find lowest rate" I would
>>>> expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
>>>> that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
>>>> so I'm not sure _floor() is useful
>>>
>>> Clear, I guess, the idea is to ensure ice-clk <= storage-clk in case of scale_up
>>> and ice-clk >= storage-clk in case of scale_down.
>>
>> I don't quite understand the first case (ice <= storage for scale_up), could you
>> please elaborate?
> 
> Here I basically mean to say is that, as you mentioned "we generally set
> storage_ctrl_rate == ice_clk_rate, but latter never goes above the FMAX of the former".
> I guess, the ideal way to handle this is to ensure using _floor when we want to scale_up.
> This ensures the ice_clk does not vote for more that what storage_ctrl is running on.

Right, but what I was asking specifically is why we don't want that to happen

> Also, this avoids the corner case, where target_freq provided is higher that the supporter
> rates (descriped in ICE OPP-table) for ICE, using _ceil makes no sense.

This is potentially a valid concern, do we have cases of storage_clk > ice_clk?

Konrad

