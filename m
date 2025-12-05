Return-Path: <linux-arm-msm+bounces-84484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1BCA8079
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16EBD324A6DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84B02E974D;
	Fri,  5 Dec 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNO5wwU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrHPDhlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C733254BC
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942118; cv=none; b=peresrItUacEynv7/aTlIXxz85xjwto0gsfXm5+W6QFtnaZlUYxRWhLUtzPQnq5xA6vqcH2oLAmz0PVXL4+b460Br1mMZpKzt2c01ANmylOVZ6qo36AJx3RNw7LWrVR+kY1jc9cU03qWOu3a2Fgt/sv10IkhlnNIB77e+N/KPAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942118; c=relaxed/simple;
	bh=WnfG4P6asrjkYgjJbPrvprJhZhIw2HsoyaoW/kVd1oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfFhluKNQi+yt8DN6ZV5pYyPH+UR7LkZVKWw09jq95h40ZANRDt1FMilC7HKK0P0oXZOWWJZzDy5cK8u/nVmEFg/3oB9KV0jxVL17jJ2l0A1/z9k3IYakll7OrwzfdQF1jU243xHIDB1pn9Jm6MMVw3naZgKUqNkpyW1RbuxQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNO5wwU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrHPDhlD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B580T2q2516907
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=; b=CNO5wwU9h2eskiEr
	vYWmoIAldICyZRL4DG/u3MZE5BGRA4jICxrdFat9ph96ZwMgxbM12v4gp/eELArN
	6v+XfzOkq3UnalVvZ8IcQqYWYeqreAYLhosJd3X75+nivy4KM3rsG5f4okUu0WBj
	HCrwrNdLol2bdS/ujyjdeNA2xgD1qJE0ed1F45mav+VJgoFan7MXz5SD1XVVAVOB
	H4/8/2xvJPzoYarf7Qh+5ImPxzHhp/3MvaLilU6yx3urj3CUHbt/z0PBaZVyZepW
	0AifDaNFRu4jP8bBA+I/KWPVeT2C2IlTUVRzfH6EMizfIF87FlzTh7WdirPl9zew
	PeG/Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n2apg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:41:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29809acd049so49332735ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764942112; x=1765546912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=;
        b=MrHPDhlDXZXuXzm0AMWONdS6xeE/ho6MsPzWLx82EQdBP+F4hgX9BppYOmNwadTV6J
         oATzsK4FCIg2Mr60bQSjUdTD0EtuUYIYV64+6bCDt8dFdHVl/mBsqACQXPJOQO5A4hII
         fkbQBx/9Vv+AoHLqnc4Aa9ycSLTYiPCXkNWGA/uq867ES/F3U718aguKm6fUHJf4nf9k
         SRUtbi33EjhJqbCJ2kY864xxIiLworTXGC/dyzTkLh6w1MwaRZr2UYQwRK1X+E9BIcH/
         lfwgbakQ0U5NvOrjCiTp2X2vEIbE4v5L5ruwEevI6f7uEGjvOhh9VvH2Ru1UlpDsCPF4
         B6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764942112; x=1765546912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=;
        b=i8Af1KE/PKGS6z+NRRwAoIwZeqhlNHIQBk4K9Bmwmg+tWOgZpk/qzAQHr+I/P5hQDu
         wePWD9+TAb96g4kT7fneuHVYQoLeZxnUau6AM20kYSPHcrhDe4SuAY/Qf2FyWkkpap6F
         0xBPKfrPBtgmXAV0HGrvi77DyzfA9eNZ088hgWbJjOBjGNPnby52fce+5IPs5tDWibuK
         PkY4fXyiSgBgGKPbKeD787Fj/YyBhxE8+8ynaSEFjlSSEXsCoFADv4D3uZT/DsBGkifV
         m0EfPqjSYVYC4TSZlOQQgYHxSHBLMrAYO35/EVFoiazDljEtg6GVQQ5BigQSI2VdgZkT
         BJAg==
X-Forwarded-Encrypted: i=1; AJvYcCWz/SkbOKFn0kNFUVnqpYkMt9eJRJPTIZ9cAPLHowIT1knAVNg3jgPcY7AEEajFgu0sI5nfp7r3vysTJAjy@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGG7yCJ+GMl2Ci8YuwTb/cN0P4EbMiRWTB5I+O7Ro0AQVgPNO
	Eqe7xmiu9uL52BNU9SlIf7wkWTKUhaebngHZeJgBgOEVpmRgvkE1RmMbuNzK2QtrwTAcfUn+JO9
	79xfPJoHK1rjpQxUWcrINFdDeyqO/xB3Hz2KJ/SXCqY7sbFL4v0BDw2HqrXq1fZGJ+X5I
X-Gm-Gg: ASbGncuSfqNJ6+TbdIpn34LIlFmHa7yLr01YbBAoz3taXT9GQ9QBvHn48eV1fyycu6+
	BRZPZUJaTzJ79Z1/e3jzZlyf7oYWNCjFrdIC/Xs7UcQf0VIHbDZgoNzhViKrUMGlP7AodxKSOtN
	UiZHbZ/6AnvDLrG17KXJqZzwILQJumVuiVsaszb2FafTwNI+pMQSoMoUGkvNuZaa+xABSAZ7yiS
	MRCyqjKPjBERhFzoUlG36Fd5mwV9j0a9+tcIPrFTI5fL8lhw/Bbnznd8yQ+VzcJ+XShxsXRSSF4
	jzRCZv7PEFHDuWIUbDQUOg0K2obyzZXf39jCZAREkZokPE+uXyK9mCa63XouiBynMJCO6zFdqR1
	B6mNOgqM2YupfEYbXTh/zE89NuRhAwUhDnw==
X-Received: by 2002:a17:903:3d0d:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-29d9755a07bmr74505145ad.22.1764942112411;
        Fri, 05 Dec 2025 05:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHshUqyeSZa92V5Aaq1utR9alONTZF9h0tJSM8m55U93erdoJiSrDaKE4FgBRRU6fmmE70fbg==
X-Received: by 2002:a17:903:3d0d:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-29d9755a07bmr74504875ad.22.1764942111841;
        Fri, 05 Dec 2025 05:41:51 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49cbdfsm49762375ad.1.2025.12.05.05.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:41:51 -0800 (PST)
Message-ID: <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:11:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932e121 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PFMJV2I6qJKDnvYOCoAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Pv6kCjnm_ZrUMdwUtZSHT52PRAvMXNde
X-Proofpoint-GUID: Pv6kCjnm_ZrUMdwUtZSHT52PRAvMXNde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OCBTYWx0ZWRfX+NDts/Osm60L
 +/p4glN7QOpo/L2QUlNuCkL4rfojnyhgFUpspBFSSSaK3NuMKRZL0IQQwvC9RKrGg3n2bZZHrOs
 pI30Bd6rruZhXho0gwlMOS8iCw65QBqJEkKXO8E3Gkpj7TkXX3ggh2nGHbFQzRmt/0rMzb5kcOp
 m4s4nXF9JePR308eXZkcW/5hYAlMZILJ+304aL9EcILl5Zn1jIS1SOwHL8anoe/F8K1FQSdEXDe
 FujH8aWvZqxgMcGocn64vsM4VQ6+9dLTYDp8xZYnRoVuTJewRyYsQYBwEDdhDx0bjWk8ljqKQAI
 gNxEGciAXy88aGgiolAcfAy3Ie2HniBGy7OpgmchDvzNtORkWO+0EBwSzhIwtVdWyWKEvyo0PSJ
 517WznkX1yZlKXOt+XoPIMS6AMkeSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050098

On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			gpu_opp_table: opp-table {
>>>>> +				compatible = "operating-points-v2";
>>>>> +
>>>>> +				opp-845000000 {
>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>> +					opp-peak-kBps = <7050000>;
>>>>> +				};
>>>>
>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>> or mobile parts specifically?
>>>
>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>> here.
>>
>> The IoT/Auto variants have a different frequency plan compared to the
>> mobile variant. I reviewed the downstream code and this aligns with that
>> except the 290Mhz corner. We can remove that one.
>>
>> Here we are describing the IoT variant of Talos. So we can ignore the
>> speedbins from the mobile variant until that is supported.
> 
> Writing this reply took probably only slightly less time than fixing
> the issue.. I really see no point in kicking the can down the road

We don't know the speedbin fuse register and the values applicable for
this IoT chipset. Currently, there is only a single variant and no SKUs
for this chipset. We can add them when those decisions are taken by the
relevant folks from Product team.

-Akhil.

> 
> Konrad


