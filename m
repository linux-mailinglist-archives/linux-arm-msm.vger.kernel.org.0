Return-Path: <linux-arm-msm+bounces-100822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNcgMjiSymma+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:09:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8835D7F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31753302795F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285042F363B;
	Mon, 30 Mar 2026 14:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AR98qoHh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8hVSEU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC42EAD1C
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881864; cv=none; b=TaHUxSw+7dg1GXSsQqacTbyIJbkoXHY7FaY6JfpeQAIlFCLipdARAnq+aaX9oQa8gQV57zoucSKB3mLGZnb8+Rhxn/6a6oV4gowo71ltN4sIGLYcXa1Z9GP3Quvy2EXN8K9En3DyK4stzMGmJFetjHX5OBOf2qur674VigmQrHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881864; c=relaxed/simple;
	bh=i9+BsmYWeNxA3vL77dGdjOl5/ZZThYuLjCOb2eFSiq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmqNSVWkFeJrtP92NKLiKz45MRC5nj9tDHd1oobbD+3+S+8Gyz8RmU95e2o8UCrZj8OHPwNSA9VAykPvBVppiSXncf0BHaWvR1eTIBFtvfIp7c1yAUyieIN/ziWAZ8PoqYOfpMGQ1ABfrhVZVRdz35S+ZRy+EB6i/4lNwQUSrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AR98qoHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8hVSEU/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UApnPb2723200
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIP639OlwUQY/ZYHd3dviSGKSjGruowG/Nrh+/9Vwls=; b=AR98qoHhGydB1Pyt
	HA/DDuxCd7/Mh9ERcNVlPKByNrzU9yE9+nybLX0nXxUJOy9JwaJW2itHmPeY2Xpj
	eN/evKkOSWsQF/JlFwHV7SV5oxmBNMiJTXJmZCBijI0ejAIcewGdJU6UsSlDhmkc
	8qV172DQ9JMisb7jLacuXYb5ciYxMjRlTdxUtwh6k4s3Z3SBUww/g/UB6CCy5Pb5
	a9grxw60sPjIpXOR9KqbiRXY7ACK5iCIrqdVy5Gc4bvkwPk/KuoJPhZMcA2rC9X0
	ZLHa5gU0e0m5ok5Mz7EYnYhM6ushGYPrHXLPz6wb33YO+RSORn2Nvz9UYhPjS/LR
	LfJ2hw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0gwqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:44:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso3460655a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774881861; x=1775486661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MIP639OlwUQY/ZYHd3dviSGKSjGruowG/Nrh+/9Vwls=;
        b=Q8hVSEU/drnCtu8wIvcfX0D3IGiqjXmlkT80tP3g2dnfnBnv9Zk0rUzG0mDO+jRGS7
         vYGFBq6EZy4Rr495DeZ/otY4XJ0+uNStOuozf3RjyaUYSFvqcF34/jYyLxEK/8LHRgnB
         coSEsMQCP8MtLXFIST6eWLUed6CR8CKDR1WW+vfX0k72Kz7hY1svGim1INFmnxdvcx8A
         PJLiFfkXKIer/tMijsI42X9pEn5cxPO9hBGziNpjLcRsU1DNELxGBPqUrKx2ktjSMfzF
         xqc0T9T5Zai5ATjnz/N44j9tNRgJRKgSeccv+X3BTCSkWtuIiu9tW/AEGr0EcfuacP77
         zRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881861; x=1775486661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIP639OlwUQY/ZYHd3dviSGKSjGruowG/Nrh+/9Vwls=;
        b=kdG0jxN+sMYkLJZceM5r+kvnfZCHlaZgVSA2YVnhORmbjO09toq9U8REAQcOh26u7n
         zvV4s0XzbEc89X8HFfN/2Q1Gs03R95q8SQttNLa97Ng5hfhfLf+iOf60ZsaV676R1CfO
         DJEgLSDbMqwXMwwGh4lKVbCwQ6D0o7/mHAFFTQm/gJY7gyng+az+LUVeBvVUicUwNF+I
         a7Uzg6Lp2siY0U0XrSVcvAWTyDVdHjlqv9+bkug8oDJiQfUl0EgRMS2SNyXOYPZ/i90z
         9ld0JLWX7tj+R/4hwSSLzmQ1ASc+ZHU95rrv9IJ5QPOPiiXBK5DY3CZowidTgDXRdEBW
         YgXA==
X-Gm-Message-State: AOJu0YwuxN4Ty/5h28pyHagjcR0yEDeqbDrFMitgjENJmQOJn1RgTMkr
	2PPojSVD6+a/Q/sG89CBPD9v00S/lpJh6ZLsh7wJeCG772uu48i+Yerw+7PjmdlV9jVAlzWSMer
	sRlsoBn7qAjl1VOIfGcuxREJjaDS4yd9URNNlqtGJkR67ZVC6fvmStFb1w9UYqmPHIbmf
X-Gm-Gg: ATEYQzzarOeysbHZNgYkEXBmSXmbjo+V2RALX+YMsFBNzNXrL6UTyQO8+nbNUgulQ7G
	9yExHv8iu8NQNG6xLqCLRZEviiymwQaY8QDdh1wy4qd2+VtZQ3K8FVxSywN6A0q7BjmmIsHfTVR
	DA6a/o1ZH6Xwks3cLABzJ3vD6oGzLPt/eBRr0o8Bg0EXxky0WTycPEzkz+WVN5rC6cWYZzrzzYC
	sHRNv73QEumbDbfPyCqG9xAdBATTP5cIYzSbkGqyNYxkZ6G+XIozBI3Z05djHIlAWJ1IJ3oGKpp
	owk/gexcp2k+cfHLDMINiu98sEpVxMgie7gcSchufYW5gXnE+1t1TTiHGRKdG7t0UNQcGrdzQ0T
	FUoLtoq0VKIcCGyTbI9bX80Oso95N9vOCR3imG6kdEtR78nQ43Vg=
X-Received: by 2002:a05:6a21:328a:b0:39c:4af6:4301 with SMTP id adf61e73a8af0-39c87821730mr13239979637.9.1774881860697;
        Mon, 30 Mar 2026 07:44:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:328a:b0:39c:4af6:4301 with SMTP id adf61e73a8af0-39c87821730mr13239928637.9.1774881860101;
        Mon, 30 Mar 2026 07:44:20 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm6527687a12.2.2026.03.30.07.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:44:19 -0700 (PDT)
Message-ID: <90375d37-0440-48d9-a3d3-b0b442839d89@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 20:14:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
 <acF0ggIIJFb7mUUR@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <acF0ggIIJFb7mUUR@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69ca8c45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MkXX12_YoDuTWG391pEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: sxRWGaaTn3ZQj-M7Sj9uAgta0oe_X5ZK
X-Proofpoint-ORIG-GUID: sxRWGaaTn3ZQj-M7Sj9uAgta0oe_X5ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExNSBTYWx0ZWRfX9VQfD7nd+VpK
 G4uCJv7bCKh7WBOxXrSg1IlGwsTwsHYWba7+Q1F+CiN0+UqrMDJOGrodJcKWrqHN+CCW6w2+zty
 aFwrtlamIioGjENgf0S86qEPfTaUn6GEBelqzsf5FN7cewcwarN2eTHDw7MSxc1Klbd2yDXoZlT
 KeoO3TW2gycZlEs+vXnFXRYOdtqpK1juwM9H3G4qc1qkrtTDVMs885YiN3ZfKeKuTawt5WJvMX7
 n8tCduXNmfgxLlbwuRZCQUYllZlObm6cV8fsHYu8/QUpX45EN/Ue7yX1m4dPNUsMIgx3goAP7B6
 Dyjn5lXJhrP/JlgUIpfAOf+USeiReUl3sgakxNCWsVJXTPOobUvD5EIt4Wt5qomZw2AwrSEc5jv
 jsb3BPsy3AzkA8813JmwGSd0NRzq/RF7b/VLu2wdOqiVIj2cX9XkyUEdS1hD/pfhdFBu0D142H4
 Ax/nG8U8aCzwUBFioNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300115
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100822-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FE8835D7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 10:42 PM, Abhinaba Rakshit wrote:
> On Mon, Mar 02, 2026 at 04:19:15PM +0530, Abhinaba Rakshit wrote:
>> MMC controller lacks a clock scaling mechanism, unlike the UFS
>> controller. By default, the MMC controller is set to TURBO mode
>> during probe, but the ICE clock remains at XO frequency,
>> leading to read/write performance degradation on eMMC.
>>
>> To address this, set the ICE clock to TURBO during probe to
>> align it with the controller clock. This ensures consistent
>> performance and avoids mismatches between the controller
>> and ICE clock frequencies.
>>
>> For platforms where ICE is represented as a separate device,
>> use the OPP framework to vote for TURBO mode, maintaining
>> proper voltage and power domain constraints.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index 7976a18d9a4cda1ad6b62b66ce011e244d0f6856..e8ee02a709574afa4ebb8e4395a8d899bf1d4976 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -659,6 +659,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>  			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");
>>  	}
>>  
>> +	if (engine->has_opp) {
>> +		/* Vote for maximum clock rate for maximum performance */
>> +		err = dev_pm_opp_set_rate(dev, INT_MAX);
>> +		if (err)
>> +			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
>> +	}
>> +
>>  	engine->core_clk_freq = clk_get_rate(engine->core_clk);
>>  	if (!qcom_ice_check_supported(engine))
>>  		return ERR_PTR(-EOPNOTSUPP);
> 
> Hi Konrad
> 
> Since you previously reviewed this change, I wanted to share an improved approach
> that I recently realized for handling ICE clock scaling in the MMC use‑case.
> 
> So far, we have been voting for the maximum frequency during the ICE device probe
> to align with MMC requirements.
> But because the ICE probe is common across different storage clients, applying
> the MAX vote at probe time may unintentionally impact other storage paths.
> 
> Now that we have a generic scaling API exposed, we can make this logic
> MMC‑specific instead. In particular, within sdhci_msm_ice_init().
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mmc/host/sdhci-msm.c#n1966,
> we can invoke: qcom_ice_scale_clk(ice, INT_MAX, false);
>

I agree, this is better instead of blindly turning the clk freq to maximum.

I was about to ask you to move this to qcom_ice_probe() as per comments in previous
commit. However, since you have mentioned this now, I suggest adding a call in
sdhci_msm_ice_init() to qcom_ice_clk_scale() immediately after it calls qcom_ice_create().

Regards,
Harshal

> This ensures the MAX clock vote is applied only in the MMC context,
> without altering behavior for other storage clients relying on the ICE driver.
> 
> I believe this results in a cleaner and correctly scoped design.
> Let me know your thoughts.
> 
> Abhinaba Rakshit
> 


