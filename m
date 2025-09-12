Return-Path: <linux-arm-msm+bounces-73309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A2B54A78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA7C3B208C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09102FD1D6;
	Fri, 12 Sep 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU/22Fnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0291EA7DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674732; cv=none; b=I8sgGxx3eH/6Jeyv+lR2MAyETrPAFLFbGWfvDkgnCGWVeOPc2L60TWYCymbH57o85qQbrQvbs89oGaJG2Y0T0K+IN4gD6EGg9WQxvvnnsRiKJFcl45jYsn4P/T0ETS+Zg5z4KOzISqUscE+AcxYQVs46dDxM96oB8U1AhuPUFr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674732; c=relaxed/simple;
	bh=o5VBkPOlbhWgQBK0/iP+h+Cmvhm2kWP0djdlvYDXhZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzsQLXcQy5szoMU11Rg+sbFs2BAh5pkaU7Vo1fYbR7q3pXlO6uFtsqqXiq3fCHePbl8SmYGJ79LOOl6F/kghY1oSY9r3o88u75oNETKOXF9mn4XDgYpfGY8ak6CEyF51js38EJEBxteU3Q0gWAbAuKskYD5YHTwBW36qUEno04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU/22Fnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fadr011151
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7dFyZonuztP4v15xqELBBfstv28YyeHj10FzHoppmI=; b=nU/22FnhZuTi4Oeb
	NzzTM19E5cBFsrvpPC1rm09s36lkq2tmPNI6DbgaV5TZQZgltzumxJSM9ckAC9EB
	4lmEi2lV/aA+wxDCFaFB0wU2CCVaufAEjEJTs4oVdwJzaO261CKQZ1pYQQ63YJGp
	fn05ahqylh7l/6TSEKkD92dlrUirnnQoa6t1nlEVoK88tGowf5u15/neKwewBEAM
	MIXCjitmU1LMQAgDFmqH/L18ryj5VjkqvG/5NF/NV7srnzyapqgjhj172y2pOoTk
	4jQAJRFw6t1wKUvbspx+pc/zQg3Xnr5EYJCso3IL02o3aAXgrs6VDBC3ZyzVP1/L
	org+8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mb6aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:58:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b77da4b375so2070491cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674729; x=1758279529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7dFyZonuztP4v15xqELBBfstv28YyeHj10FzHoppmI=;
        b=oaG4yaUO4MxAGNX87GwQyL/jmPvhGwUxC0J2OtRtH5PGgG+dryRTp4cBOOMDPCk9RS
         mTnseljLN8v0pAnTxhJrfA3dm4cKkmHsh1qq+waNyPAquSh0rpTBYW+7rz6wkwpKCzw+
         wq1iIlT2F8f8wDpNSRR41EQz6xERWStxK+6CzT/BgTdnJjfjmJFH4brTaX3Ue35KhTFV
         yTRQkKXTPIMY9cnzZTAi1uJEEbz/bqcsJ5mShXSO4E+wySZNGWCOJ+c1qhMi/HNCptdQ
         euh/LIp1HvPw0x6Tf02O8inrsLmsDE7tFajFlmh0lJea30mGrL4++0cWolD1QTa0w5Co
         s0NA==
X-Gm-Message-State: AOJu0YzGz2f/ZcdBS5WUU+SRbDhgP3BiKiJtRCMO+bXUTDTollFueUKj
	a7sBkX1vNchT5YJGm2e/FK858ZUYOPV/nYFFl2EXaan7HYGOXMGWAFvt7OY/U3wkY5u60L1aRUc
	KZ+puLBudCLoZ+zoMXoyGhPi9IBhg5FEepoi9BPkbmq8R4VCF5+4l42DSHFj6cXbse6wi
X-Gm-Gg: ASbGncuv9pWMNDP5Z7YyEiKoXWFZy1DJTN1UlF9dBZ+T0sNcg7WiRXGq4Pm49co2Ml0
	iWh95Q7cjkY2nPF5UaBfLmpfb4iJxNAVUo0h9GuOA9/1h+RIy6be0SlPN2klaNCR0v0PjE/Ccpm
	CF4pLbTT+SSJzHO+QgI++MDMlOsqTGFolDp+zWJJ/0QFh/Xj/XPixTclDKwGQxdyduBDkIpdE9/
	acDjeBdCiyZOEtPOwKAm6rrYeNBPQs/EKdgd2KrX5+oahzwO4SFhWYdqrDjrDeaXi2Bhpts8185
	RkgBPPzshstexsaXZVwTFw2cVN/uXKEGGVQmYNOLHzsADV2nPi7W2tbTQ/fEMGgBCK9eUBiggAO
	oz3+LT/4lt/OjWbX4+MA71Q==
X-Received: by 2002:a05:622a:1a1a:b0:4b4:9655:9343 with SMTP id d75a77b69052e-4b77cf920afmr22702541cf.3.1757674729182;
        Fri, 12 Sep 2025 03:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlSmyF+Gse2lNQD69+IKUgQt662LJkJWbTIuY6hl8QE56qi43llUixSvAFTFZLJvm5l7CXAw==
X-Received: by 2002:a05:622a:1a1a:b0:4b4:9655:9343 with SMTP id d75a77b69052e-4b77cf920afmr22702341cf.3.1757674728681;
        Fri, 12 Sep 2025 03:58:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b316e2d4sm348001666b.45.2025.09.12.03.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:58:48 -0700 (PDT)
Message-ID: <d95fc175-359f-4559-b680-36de87d75a40@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 12:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-starqltechn: fix slpi
 reserved mem
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
 <20250911-starqltechn_slpi-v1-1-93ebf951a932@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911-starqltechn_slpi-v1-1-93ebf951a932@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXyvn/k0gw8be7
 dH3e9xVgUvCqDNV23u+LuSybcepz4CUK4yKSDC5o92k3MJhwzk6SeXRbVFZWZ+mQidJ584bQvYW
 /VmqUNmWj28olg8G5E6RdUmnfJQPGdhcWaWxRNoHH+/cQJ+8K125l32Iz/Ydt9lNJnjHAvqQAHC
 /wqunu2sXsje+Dtjvm2877rBkSSXSFxn5zSEw9lFe/f/C7Oa4ywx2CiPBJhFVd/lwbBNyfSx9/Q
 mF9k9yPiV7i+kYDOEGrCnp2cF02i6y/YMkbrDnhnhBMi8HZclUZHIUQDmO4YfQBBtk270hB5f5m
 DXJckV3XflKgRMeqAAaEAylNjuSak3+T1tYVKTuN9QWc0NWWFG8drIBVKVfSzdeIesSdnVy5N3Q
 ZTYJsd+o
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3fcea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=gQzuMllvLFwwXPv8Qg8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: paLUc1lAIBrYJ22WO7bEgg2lawtUiudL
X-Proofpoint-ORIG-GUID: paLUc1lAIBrYJ22WO7bEgg2lawtUiudL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/11/25 10:56 PM, Dzmitry Sankouski wrote:
> When adding adsp reserved mem, slpi reserved memory was shrunk
> according to vendor kernel log:
> 
> `Removed memory: created DMA memory pool at 0x0000000096700000, size 15 M`
> 
> However, kernel refuses to boot firmware with 15MiB reserved region.

Why so?

> Increase slpi reserved region to 16MiB.

It would make sense, given the PIL reserved range is now almost
contiguous (bar the hole between spss_mem and adsp_mem.. you might
want to check that one out as well)

Konrad

> 
> Fixes: 58782c229e3e ("arm64: dts: qcom: sdm845-starqltechn: add initial sound support")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 9eeb4b807465..32ce666fc57e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -118,7 +118,7 @@ removed_region: removed-region@88f00000 {
>  		};
>  
>  		slpi_mem: slpi@96700000 {
> -			reg = <0 0x96700000 0 0xf00000>;
> +			reg = <0 0x96700000 0 0x1000000>;
>  			no-map;
>  		};
>  
> 

