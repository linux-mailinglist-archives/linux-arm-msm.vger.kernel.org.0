Return-Path: <linux-arm-msm+bounces-89301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE76D2A7F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 04:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C06F301C3ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D973396E0;
	Fri, 16 Jan 2026 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSCvGrzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFRILZ2f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB730FF27
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768532678; cv=none; b=Cw+vxUHOgpkEFFLHv3H2R+WN3XRpVSQXXpIzjS4BYdHbVd5CnlNSnxyWAGEmBnAIq+K39ZBjDLcqhM9vMreKWEG9Iki9rVhxefHPVQ5h0IUgMpMLapfnpdug3HJ6MhFxlT/m2FHPbpaX0xqbJrp29eIAY2uzf5yy+SKaoxKcBoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768532678; c=relaxed/simple;
	bh=MLxbdzuVZEyV9Ir9WV2aQ8nHA8b0w/q5Bo8LJKVp3Hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOwDcRuVO81IIKge4i8g7iO9gJtglXlGwpQINrLyKecKGUpIadFRHzysmMKZqfx6G5mckTNYA8QDeYuEpjepzyDaqpoxo+wuR7H/dvSQ+rCS/zoZmZvifyN3ouRdCWGT1/yKdX8nC4OejElo8ufBezhzHSV4TnidCSFtfym4HjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSCvGrzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFRILZ2f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMkgqt3892688
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FMSDKBTVmGzi9yfMRbM6duz34qzja1sR+1VPHow9JQ=; b=jSCvGrzEveT9ZF1o
	57kom8keBejxcfo7ezH7CRJ6vE3jrSkFTAgVtGWxRp3z70Z06mQlum65vLA5Yvpt
	TjapyyvRP1wuJJcgT6J47ez9RyEMGn+lJgugjboBKfxY0i7YK+ar1kSkfgufx7jP
	rAkmkDnzFJw7cdeXlKwy05T5op9XedEo54BOutRekYI0p+JRoumk4gyMMFltZcX+
	IKx2c9FPWRvll7dWhm+Ddwd1sd9QHFQ/4cvkOH4Oct/eX2GTKz6D/ef13Yi4HJ/m
	5tA21mCHZ5EZ6LqwKp/LFYlGClwHFaIBy9XajrqEkwY9KLt4ge9hesDZYcHVkofI
	5X+ZRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b08j1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:04:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a08cbeb87eso15502565ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768532675; x=1769137475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FMSDKBTVmGzi9yfMRbM6duz34qzja1sR+1VPHow9JQ=;
        b=RFRILZ2frWkR4sX/iLRT2x7xewFxYxZwgADJlc5XViMfdisXKAkbSLZaJ/3kQcw8/+
         m8I1YiNj415nAHsB/EmkL3iKTRwFXqGKSicQrUd5LaqPC31KUpNp420tdII8kTJQQHgE
         CoiR6MqRSWUeh/i7L6N/57rJ6TenrYEAeIU5qREC8Am/3zEemaXhXkboB6TU2PPIliwS
         fIYEZqmuM2YYexsS4L5xe92C7V3gDknjdeX3pIKbH6ZXZsYhWJjJ/dnSZs4tV3T1Y0l6
         /UwCbsbXouyg3e4bkdONY8WluB3r4ut1SqcNEiky9Ey81RKP1BWROat0oFo8eXtXdxyn
         m5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768532675; x=1769137475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FMSDKBTVmGzi9yfMRbM6duz34qzja1sR+1VPHow9JQ=;
        b=IxYBmYJx37qyL2HkswEdyK0IeT4GjU3QnkjVpAdEq7UsPWDVOPLewBuCNM4XYlcr8n
         nLaxh1zYuAi/qOpxbQ9Dhm5n5Ok/hNI6ki5px7IRzJqACCUogKJECp5vGV7fAKnlZuhG
         pm/TtRClbwLCH1+0JSJqtH7nGs7eYqpBZ50T0irVl0USfK7obLlCXvnyKrN2f03e4+Ku
         NKrnAidK0OtwPqHB6wwAW/LX15DPjFWP6o/xnzVLZ8eaTPcBONosdmpy7YASlzjy+HfB
         ugaR04TrWVAS8o+7rMKsTiSRZxVb1l+Zgx6jRj3XAU3MpYQmMMVoJZp71uPiNkJ0j0mo
         QUZw==
X-Forwarded-Encrypted: i=1; AJvYcCWEgkPuQ3S6Q+rUjqhUSX4A4N5rmvl+ZeVJEY+MvX40k0KSKeRQQ+SyYUI4gid1UHPtpX2b7CZyyeuPUtJa@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMQ+9RAHcllBVoTAonVUcTMkRiivsKXTEnlkb5IMmC9ApbVTf
	T74waUEx6E3VnVm5s1qVpq+fbQ7u5n/Mvhbr6U68qA/jH6i0D/brQGV4GZBLcwrqBX/0eJvGQsY
	kNbh9/fKhrM3KFFJIjmowlRw5pFX+dE0ESLU48deWzLSVlnE54pSfZPS8BxAHeTUL/PggbYdRm4
	SRFxIa4A==
X-Gm-Gg: AY/fxX5MIlWKS0bMwfjUkctcRscZmRhMW+WcwyVXAH0Q554vec9UW0lOE2wwtIDsPGD
	B1dPYZjZr8iqbZVSGEyX6P2R1eObXkkJjvMaeyaZTEPSQQ5aznxZZ8eLCv5ZmHAZAYgsdBuc9n8
	J0ApWV8NRgDl3isEOBmkVLHBETUKM+g1VSvQgtLuJeHVplpBAlEUUbXbSQlLMEyT20BIQ2VVVbD
	Y+Wi5WOV758+NHOhHN8TvDGs2gw8bwMqt47THkTiNZilw/dgfUUAhdbMALDpqy8ulk2V0LQSLhW
	cppR4rbuVN4X9I+b61V8TpKOs8PUdkJg1EECADM4ucTIsr/ZEtK3UXVezn+g0HAfwqchG3dC3Y2
	tbp7DPnhnHc+X49S4gH6pegNtoX8NF/M/TUPG/8PxYtbPQF8Nl8xmwXVh9WBFrZx88lNjrMerMv
	jpEok4
X-Received: by 2002:a17:903:2446:b0:295:5945:2930 with SMTP id d9443c01a7336-2a71885a38bmr13862675ad.2.1768532675163;
        Thu, 15 Jan 2026 19:04:35 -0800 (PST)
X-Received: by 2002:a17:903:2446:b0:295:5945:2930 with SMTP id d9443c01a7336-2a71885a38bmr13862315ad.2.1768532674685;
        Thu, 15 Jan 2026 19:04:34 -0800 (PST)
Received: from [10.133.33.232] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb239sm6135415ad.70.2026.01.15.19.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 19:04:34 -0800 (PST)
Message-ID: <3f286b17-f418-4abe-b18e-ebdce295dec8@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:04:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP
 for Kaanapali SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-4-a6cc9e45de93@oss.qualcomm.com>
 <jad4p5l6beny3uojc7lyjtku2c2i2ykple4lgikb7s5kfyfg5h@o6a3uqqkduww>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <jad4p5l6beny3uojc7lyjtku2c2i2ykple4lgikb7s5kfyfg5h@o6a3uqqkduww>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xWwGi2SyiUK52WSFgIc0mbth3fEcoVjx
X-Proofpoint-ORIG-GUID: xWwGi2SyiUK52WSFgIc0mbth3fEcoVjx
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969aac4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=42wAx0joryUND99bvuYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyNCBTYWx0ZWRfXwf2344fTPRef
 mJ7wf1zq/FCV6wi/GGTNI3/SRJorvdCKJQW9ZNPyxp1rKCAfouIfETt1doyRjQrkDhCNjvdVs9x
 eae6a81MCOmrqrd1tch/IujxJGBNGjj0bfE1AEojmmq0bAtm+Sw9Qu2O3ukYtxEYNYmBY09U1U2
 2XDQ5oQPLMOeXDTfwIoBYyw0UWj5JoEfcisn3ZSwAXFmZn9DE/95kIgNd6Wu5YAVXWmnbOgr/jB
 gwm05BePkCHE+0RLQ0Y26Hd0fH2KdQe1jg0YX1ECy3u2x95fyxaiR8SS8eKwnKI3Zco/SAAk5xP
 +4uaPx+Z18Z6Jk1S2wGxcZhJuwsO2NtVj7GbKxvgLl1Ndr2nwxRVmeJiipLVLxkG4eqTXTNzmQE
 kf389laoQd4d186Q9W2fH2AyUzouJYAuICkA25hgNQGBdIHwdzc5dt1Hawn9zKT/2okvXuhSEeJ
 YaZkaxhuJaRz2RutsiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160024



On 1/15/2026 3:10 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:49:06PM -0800, Jingyi Wang wrote:
>> Add remoteproc PAS loader for ADSP and CDSP with its SMP2P and fastrpc
>> nodes.
>>
>> Co-developed-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 351 ++++++++++++++++++++++++++++++++
>>  1 file changed, 351 insertions(+)
>>
>> +	smp2p-modem {
>> +		compatible = "qcom,smp2p";
> 
> Nit: and where is the modem?
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 
> 
modem is not enabled in this series, I will drop the smp2p-modem in next
version and send it with modem patch

Thanks,
Jingyi

