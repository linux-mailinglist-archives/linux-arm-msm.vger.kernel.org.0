Return-Path: <linux-arm-msm+bounces-82680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B6C73FA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6DED1346D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC44533711F;
	Thu, 20 Nov 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kj2q3rI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgdJIUd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E832D0EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642015; cv=none; b=uvrpdQI0ovrNv4FFVim79WhC1WU5QhyJlcpSMKrQ6sy+mCIFgta459+y/1E8WJDHZuYplkYLuUOCKZXSAjt3mrrnJT8OEVibbXZI0EzV8qomR76PCJuTOLY34kSnVanZLgLs+/sKlyYXSPSsWSuZ9lvIiU/9PdafMI+i+pTIgMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642015; c=relaxed/simple;
	bh=BA/Uh+Sk1e5czT6KkkxKbFqn2JkSgr8Ze+EOjUDAQPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TBpfxN0H34mYqQAajkiws0aIAaXP6mglCN6L8H9Sz5Y0Tr6Xz812F+Ak4ndZSLstnxU7n4PLCTKDKzmpj3pwHkT+w/dEpxdXJCBRPrYNJfkWsAzet0YnHHZMTwIqgnOeZXGL1PAGOf/dDdPAGhpshrSzU6b+ZPBk4gUg525mkXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kj2q3rI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgdJIUd5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKC2XN53407852
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=; b=kj2q3rI2u7XF/Mwt
	3leJFZCxjh7CA0q/0B52pC2W3yeHY5sohSl5w3kKbwX5e673UhWuJGwYzIwHkdne
	2g/29H5cNWtbpRtPGiB2w8mwy6OUBbHw2Bt8MjFwLE65x7Mk8Uk9c2MdmymBk50t
	bF45le5cHEZY3Bf+IlskJTl+AsQKoZRFn4HpQvnZoo8OAerrIhqMbiIBkt6xrwaB
	iEtm5N3RKZwVr22o2I69N0DO6gdES6tUPH9v1ZhBFH3KIjogOPVqt6AvBX6Jy9W0
	pAfGDS8FQqzgoR96XEIlzFpNS0pvKYGheO8egcO1bZekm1o+U/i/5g4ilFRcRaKN
	k9DNlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm812qxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:33:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b227a71fc6so23116285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763642012; x=1764246812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=;
        b=LgdJIUd5bEGdbRcb1O0818LpR7XWD3qvFwF0rpEmlGa0Dp0/uUG1T8Diir/aYdf47b
         D5/RcPHOUvgYW4DTSAvDjIjpg2WjuIPOEUqJz0QtVXMXGcwd36HKlEp3gWQMFeVyYfG2
         QvX8bkloZdLbZMED3ikhrBZHoY25+nq4ZmCUaUurxAy2i5kHvuBDcBeGndnYOyJnWSCv
         tWa6eCTD4APwBpgWwtd5UcWhhONsoBJHgVAr8hQ7oL7eserKNyjnq29W/1rhZaswY2Sv
         yIEjwXmQxAEABPDogjFATXLknsc0kvjUjU5LqTFL5HAPOVYMxv/f44Qxw97wGsGo/Qc6
         5ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642012; x=1764246812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=;
        b=JeVpDFDAgR2Lz2CZ8vK/5gx58DBZKFHNSggzy6h3DeJcNtkG0yJGxuTkZiaNWPgTEi
         4co67Z9etiAuXiH9mEijieIT2MXmOUmJy6EyIzvIsP/aT1FTd8DImQACtDL01XDp1ptN
         zLATtZ2FOTcsiS8W6Eh77wcKdsqQHEHCSiAmRfKWJ2og3RP0WVq+DFCou3D3nxfty9ay
         1j3SKJ40ALPu0tpIHTPfuDXYhLQDfkvd23Ousuza+sqHs7VJ6dIkUhqTw5Pt0bTVjxsg
         GRyc/lSEH5SZBAh7d7vKUykfEMBDS3eiTJ98SfdjskvRwdjSchAQOjDUf1OczxIG+qRH
         da8g==
X-Forwarded-Encrypted: i=1; AJvYcCUrN9FrZC4wyqMEOKRzGFGzJiJLubpqGgMRLLC96B+aN5GvT4J/FSxXguoVggQ/gf84JwUUcb8YJf4PDrWW@vger.kernel.org
X-Gm-Message-State: AOJu0YxEEKe7WesFH4n12TPRt5Ou0py+aX1y9IRrQ/lL9WBkDMtN9oiD
	G/oqQiasZOfF1T4XJULnPCse0joB/UrempCPKzRUDp80p7lQigYO0gSPHGybYFqnK6JebcA8b7F
	gtjtUz/4qFEXWxSHAU2LdRqvlSdrk7w7xueS2gg35XvSu+CxtYlrawPeRlN4Bn+hdv85S
X-Gm-Gg: ASbGncv6gUmB7xQP7Nq1Rbvn4Gdq/TfKqCKyT2tXVnRYv77EOaU8mnL0r571Fx7ttCn
	yb3/GvNjqmr664FctysSa4C/t2osEBrtQnPYgJbWTaFGAHtczrD0pigO8X2G3/ylV6mzg4XMJxJ
	aSF77PkmURDDBphKOQc1S1MhPVAQ5ZrjKV8dqoRJ0nE0IxNLD8hrorYhnwouhONY455jlJhlxmY
	I6MX/ruMrTLiusjykHGd6JXIBe+pp51qohR/22mC7es0dw47cM3Ckdq5Gm9y2rAzsSBkkDGDwtK
	cIYZ2OblEfaB7g1/qPYGOzMQconHZo1jpK/FTmBDDjtJzpjsFEExKQUOb9mI3+ZLX44xip/uomF
	XULOBCtaSXyYFh3AgAninezW+Un7WuUbNDwkf/aMoGLNJrjsLAjn0wAksGimn5W77rMI=
X-Received: by 2002:a05:620a:179f:b0:8b2:9aba:e884 with SMTP id af79cd13be357-8b32f384876mr126003685a.6.1763642012151;
        Thu, 20 Nov 2025 04:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH8PKV1YzPz57vibeVrtCc9zDlA5YXlsyN2nZn8xrRbGWLU4MA677i03AksflHjajS1E7evw==
X-Received: by 2002:a05:620a:179f:b0:8b2:9aba:e884 with SMTP id af79cd13be357-8b32f384876mr125998985a.6.1763642011516;
        Thu, 20 Nov 2025 04:33:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765503a990sm194688166b.63.2025.11.20.04.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:33:31 -0800 (PST)
Message-ID: <09b933ab-eba4-47c2-a667-370dbeda2749@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on sa8775p
 platform
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
 <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
 <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9EQuNsmuRxagfYieOwuPAJ_hdderm4qy
X-Proofpoint-GUID: 9EQuNsmuRxagfYieOwuPAJ_hdderm4qy
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691f0a9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Cn4BvpCIsXtoq-7YWPcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3OSBTYWx0ZWRfX6BzuCAIuf2mm
 Fh5KWn/w7Sd4V1ml9/dyhBEJlK++nkaYMslCblh+Cap8TnHnMo3hAbgVeWtGRVgtFHQZgRnIkv6
 R7FqAG9SEFZgpsz3il1T8FZ65DbXLAUJTnDVItx0UVPs9gZ9GQm7Di+W3VCe8uOmuVOFkZqi3oM
 jSsG2QPo+iySZNrmtke2CYr9id7On2W8w8qA0Fk6Qe35PbLk0HUpx9QuoIticFPoale8AF0dAIe
 BW8pRV2YkAhgmkdsfXnvXaqODFn8zgOnAHi+SS+FTlPj2dTFtwzq1vN3qBhDpuXZ7E4rnw7PjVb
 /2cKXvsC9TLV/yBEYAQtNSbcPmI4+Nx9bIYNbmddlgnSdwiP0thhPkjFRzTGSB0rP4sslcmwLKw
 S7pasMbJl/XtyY6Pm0TPGdFa2jPJRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200079

On 11/19/25 7:06 PM, Charan Teja Kalla wrote:
> 
> 
> On 11/18/2025 11:33 PM, Dmitry Baryshkov wrote:
>>> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
>>> This is achieved by adding compatibility string for mdss in the actlr
>>> client of match table.
>>>
>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>> ---
>>>
>>> Changed from V1:
>>>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
>>>   2) ACTLR table is updated per alphanumeric order -- konrad 
>>>   https://lore.kernel.org/all/20251105075307.1658329-1-
>>> charan.kalla@oss.qualcomm.com/
>>>
>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index 62874b18f645..0b400e22cb00 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>  	{ .compatible = "qcom,fastrpc",
>>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>> +	{ .compatible = "qcom,sa8775p-mdss",
>>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> What's the difference from SC7280? Why don't we need to set CPRE?
> 
> Sorry, I'm really not sure If your question imply to talk about the IP
> level difference compared to SC7280 for mdss?

"SC7280 has MDSS, SA8775P also has (a slightly different) MDSS, is there
a reason these two have different settings"

> Regarding why don't we need CPRE -- these are QoS settings that does
> control how well hw behaves i.e., related to performance settings not
> the functional ones.  I guess, these settings are derived from factors
> like how many masters are sharing a TBU, how crucial are masters using
> that TBU(like important ones may be allowed to +7 or +15 and may be
> others upto only +1 prefetch).

And this is a good answer

Perhaps you could reword it a little and put in the commit message to
make it clear in case anyone has the same question in a year or so

Konrad

