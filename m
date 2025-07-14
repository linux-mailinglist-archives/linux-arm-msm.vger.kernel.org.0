Return-Path: <linux-arm-msm+bounces-64891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999CB04C6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 01:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52BF44A6875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 23:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02ABA279347;
	Mon, 14 Jul 2025 23:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4zaRps/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC0261574
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752536331; cv=none; b=sBBUbWWsqwDz/G8nYKN6zDRYKfjeIO8d5awV99i1otRY169qI5kMk5iUfgmLDtxm3/Oz61mf833cSs4H+hQuuStCoCQv1s4+PuF7wRqzSt2XCfv5XRBQmtT3NwGfcJs3H7ZY36kA95eSZHmzd6Uplk7VebhOQMnjt5bUnjrjphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752536331; c=relaxed/simple;
	bh=BLc/nG6tbTXqBWHXJq4nAE9fz1qrAgmKgywiVncJEsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbrYHdAl1X3MB5oPqj+jzGsRmLYBgsf/9RY8Rtz8KpvMjiAehL4WSvUchcvIbqW/Z6SnXS9oGDtUbocc5oyr5LJikZ29HHF5RTEPM1hwnYSEIFyCXnHdWk4ga/lm87/EpSv/mSD1twN5KHfKutzRk1yZkmbQ5M7Be6jl/cdWvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4zaRps/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRV6M029629
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wn0uaTpQJ5msTA4q2mSIBqQxq96F8xnwcsNT4npFJ10=; b=e4zaRps/oaXdJY+l
	UdQ8DEc0Nne1nK1lwtaLfJAWHqyiLQziUU3CzDFUCkUNeWV8JnAqLF4ZqflmU+qO
	IaCyiN56c5pDiAQOpJ9+b1AfDTRlfBvVfWpbwY4pCP7ODxRyQwipwVImtiZyO5Zq
	u1YEOXKa37KH6sh1j/GqAfCY8nztz+Om9WIHf6FDuC7FPCXsgZo6i3zcB6Z7X9e6
	T4s9AwHPkBTS9WDnUgqpGgWpprpKj9V+ypnQ0HV7+q4MgprRJMUwYBkd+zMuSwgG
	+3J1azNHufa9RQ/26fQCJmsfd6flX7m+fE3a6H1KmT5/jvGkrb+aWNHeMwONjcg8
	7N0xIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dq0x76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:38:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab77393308so4076041cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 16:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752536328; x=1753141128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wn0uaTpQJ5msTA4q2mSIBqQxq96F8xnwcsNT4npFJ10=;
        b=pxCgL6V6OdiYshJPthxEgEpgfRsfpE6n4KgB96a+GmMMkKsoTk1UiCz1H6oKo2BZL5
         oSRVRuTkuT/Vui6PstwlmpriJvRz7EEnz7Xd09UpZ4MszcidE9tE1J6Zdj7pca9uIMh3
         6SJCiJwBXbyS92rc9nv8y+vgakAmUzrXpdgRAj2arnJ9PmxiTnaQIK5OMFNPwOSPvS7u
         FF7FYf3M0vX5CecZ724XcYnsuBlzo4i3OuSiVchSh77Fv6kArIecldYoQqCdYpNPY577
         r8xYPKOGi7/RiMRzHL9nT6heksXpQsqDLILKd697bcLLw221lid0ebENvFlToz7dlsqv
         r70w==
X-Forwarded-Encrypted: i=1; AJvYcCWSifyLUvA6+rlWEC2Ym3+EOA6uedV3mo2a+LaL1YXOErjfQslyEzVu1ElxiU/egrFgmynJxJJinxxW3w8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzCOTFltzg+e1Fvd0KCSL3f4Wax1/ZndrLzEgnsVNiUd52EIl55
	BXqjXXdtCCsVXQb6O4ovIdsjziK8WdYo2cA+5RsSuT/9vSswS7tKQIZtoZzBJ1o3eQ7eIJ4VmYg
	6EdMBnYBATd1YnWV5Ro3n3SB4AE82gIBrqBXS/6YVXLEn3jh75P/dCuYjZZuCx/R34D7R
X-Gm-Gg: ASbGncsuGemCK0jtPgjb7E5QYJY9+VfvJoyR51gvzHupECSO0/5v0uOIFU1ie5m5rXw
	m5w3YyZmRUuaM2ZA1a0TIdUTdEbq/l9XQuU2bNyLs8a9n88JhM5lGzeKlpY7LSzHMhhFAguGN/s
	/d6zu3bINqSoWvLFlcvmxS+Ymookajr3MV9Jigp26X3yFt2JomzWKji6UG3Q2QezEWOYhvpEQt/
	6RMjY38LXiWypqCED1IbECuUk9BKVHuBG9oxRES8umd7lXqZlxXOzYKLpcqT7v/pb8s4DLjem4Z
	xgC+KdyHYB8byj4mH78J8ahEg4KmIDThtLsazztKP3w38e/TF4ZxAH3136PcyaDl6LpEwaxqUPW
	Q7NSiGWKx6zB4iH+oklCd
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr776223585a.0.1752536327964;
        Mon, 14 Jul 2025 16:38:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6vgTUK9cbHU9/fu7xu5UC9MgWnhvrvZKB6D6M0lFax9GG6pjPJlqFz9LcPg7nXnR+3oUNPg==
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr776220285a.0.1752536327341;
        Mon, 14 Jul 2025 16:38:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8316b60sm887600966b.184.2025.07.14.16.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 16:38:46 -0700 (PDT)
Message-ID: <c379aad4-96f6-4134-8b90-0f1eec8001a3@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
To: Artur Weber <aweber.kernel@gmail.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com>
 <ee0d148e-71cd-4136-b3cb-145566abdfbe@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee0d148e-71cd-4136-b3cb-145566abdfbe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2OCBTYWx0ZWRfX/OOzgAR2m5Xw
 4NBhRUpE+lITN2OzNV9/WJcJyANzd5G638zWihCCdK5o5BEVDid2k5IeKXhl5RxcLUfBn0ZWtUV
 JMTD3/lTg0jq2zp0hq9TzsS1brWhxJLbNhFE4XV1PhWCjZifpyOZ1h7xXqQyXmChe50PdoQVh/C
 V8ip2OsAWWzYUDv8ol28LfuMIT+Dij6SPAxqKo3YACoD0lJlaeTjuxrCz5m5Fyjqj/brIvoTY6L
 fI5M+DA8iV0YfykSD1GFsMfEKlOzGG0VAQQdeg7oxQbezV2GidQbGTq037B6/dkaPyFYrs2KsFp
 EfVfAzTGui4g7xe3NvAPOHSeEBodUR7TXiJvJzuZnCdss6q9CfBe+/BSKzLzpQ3Vl80gullVWIU
 bVGktMlUP6ELAO0ONWr3D74n1eh1MmFHOOJxBEN9Ojzj1o9ZkNOsFb3BvIzEXy2uZbBg2B/N
X-Proofpoint-ORIG-GUID: OzLQXC60zATpCNvSqL8ntXPLC3cdG2R5
X-Proofpoint-GUID: OzLQXC60zATpCNvSqL8ntXPLC3cdG2R5
X-Authority-Analysis: v=2.4 cv=MpZS63ae c=1 sm=1 tr=0 ts=68759509 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=ySytLBbe-S1-HUGBodAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140168

On 7/14/25 8:13 AM, Artur Weber wrote:
> On 6/30/25 23:59, Bjorn Andersson wrote:
>> On Wed, Jun 25, 2025 at 11:22:55AM +0200, Luca Weiss wrote:
>>> Document various bits of the SM7635 SoC in the dt-bindings, which don't
>>> really need any other changes.
>>>
>>> Then we can add the dtsi for the SM7635 SoC and finally add a dts for
>>> the newly announced The Fairphone (Gen. 6) smartphone.
>>>
>>> Dependencies:
>>> * The dt-bindings should not have any dependencies on any other patches.
>>> * The qcom dts bits depend on most other SM7635 patchsets I have sent in
>>>    conjuction with this one. The exact ones are specified in the b4 deps.
>>>
>>
>> Very nice to see the various patches for this platform on LKML!
>>
>>
>> Can you please use the name "milos" in compatibles and filenames instead
>> of sm7635.
> Hi, small half-related question - does this mean that future Qualcomm
> SoC additions should use the codename for compatibles instead of the
> model number as well?
> 
> I was working on SM7435 (parrot) patches a while back; when I get around
> to submitting those, will I have to use "parrot" or "sm7435" in the
> compatibles?

If possible, please rename it to "netrani".

Konrad

