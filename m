Return-Path: <linux-arm-msm+bounces-84741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7FCAF214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BBDD300E467
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB1C281376;
	Tue,  9 Dec 2025 07:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaIFDVeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="De1yA1IP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651028724D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765265259; cv=none; b=mxHUGw0VPVkeR0ZXjFNlzaYGpTGSwJIfHBOXjki854K2BUmyovPhjkPko07a1awZisnUOBOugJYFZkRl4aqMLxnJfQTfKGa5TeQD8p4mMtlPHgHeVoe5XDyK/GrSq4AV1ZmRRBX1Weolx3NAyHT/n2zZuAdzpk0o1GTg7gWq9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765265259; c=relaxed/simple;
	bh=iRvr17at4Q17jAuBYdmjPElsj2UsX/FYrkbyJBwMI3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMNYDyCyh9cF7yS0uUjGh/Ab8HGlkfLca77OAKh1DnoVXciDC3whPcADBY9/dtOJcO3gTGMdHoDKDpvZ8E2s15wN+ue+uqgS56/M8iod38mVzN+Dbhw/ubFSwEUWSTRhQa78HR867Ziu3NdgS4YEN7CdKEU2rm1UZVr1YQOigAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaIFDVeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=De1yA1IP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NWxU62715004
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 07:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6RhCxzimiRQdvyzuLZqr/nXiqnS/fihfU2htwIKRsI=; b=DaIFDVeh/ygYNH8a
	cINC2TzFNQgHK0bK8D9wLv+BbtuOK+Hz+ZVLGmgp3oGcyyeMAya6T5vah+96BQHD
	8A9hWhWcCOu1IY61j1jyeefA7VLQqSL/FPN9bLyDJ8EcVHK22b12WrkrJM9awlL1
	nAWeu/3piTrxeQjvAPVh/edzAjrAZ1oDkfqtcL2+JYX6XK+vj2ruaUhrZezibdDT
	KHhNQREw62eXI+wYmY1VetsotlwTG5IE8Q5HiVEa5YY9MusPu8MozmYuTfOvhmtQ
	BIX1nmIMDL/PDmo7ntdZBvccx+/X9xr0HAWus1LPl99NAtg/lr6JgtnbWq8tTYPV
	x9peMA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfrb6n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:27:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7baaf371585so3559425b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765265256; x=1765870056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6RhCxzimiRQdvyzuLZqr/nXiqnS/fihfU2htwIKRsI=;
        b=De1yA1IP79EFss8gY1d6cHpk43Ra0RJOaPKgJ71M/sjL4NbH4LNcYp9EAqTDKr92bu
         cSU7TxOhjBYtLkkcyRBIMwP88CnuUO4LadTiwL/m8wiT1dAZrK1OrddQMrb3rdRXyUgN
         UqnhddHCdTrrv9nQWwGJYw07u93SzwXo/AXtWesk9CzQ7nuIwZa81MBUj/hzyOEyYa5A
         W/idWXZ0+d/7WHO0UD1wj7FNeB1Vj6zWju5zu2K/OPi+ZXd9OfVpitVKyJj0d4DYAwiW
         hZ7+hzfAoxjKGl3oRiBVlq6shOusvPJtOaLUUlKv/xGju5UzoTgeU6LqgDo9hP40HE/A
         vrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765265256; x=1765870056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6RhCxzimiRQdvyzuLZqr/nXiqnS/fihfU2htwIKRsI=;
        b=l/Sb6GJNwMuJslJg+tyfBXr/hVhxQi/Vc1XbA4xKYeeYpjiFcd9U8Y9Eblijf8yn8i
         ijSA5LCiSk7D6D7knl1DvDHhyAiiSI++mGyLi808pe1IPa4Gi8tyOWSCnx3tNdqbmaO6
         P0AlXekcaHdYGqu3AQnl1+ubTYKE84Ag1nuskq8xc09+Se3dEORdK1Ce77XhgDmZJlQS
         9sQfXUhmC+VNXD0S5dF4TfRpmR5Ue0/JtqaexiX8zLDwsRLlsw2MOhNw4w6lCElXhmoN
         GjVV40REUd03lXEC4U7rqw6ftuqUxH3Oik3DYg9/lZ8ggrnM8bYJ7wEErwIc9+ewF7CY
         d35w==
X-Gm-Message-State: AOJu0YzSjHKrUBYGOi+3BvU7qpqlfoX1EqQmTMrcXQ3Sl6tXaBfJQAqK
	efqyGgGmkNi6KIb+KLXVm+kz0WUEYwRW2Q4LgZ2uTZKLCRy8ST5xbjUelg7MnRvxhfgrYkQbAQx
	HIbIUfCVXAn8z4HSxOgpBlKHkMIgZK/zUPjd4Qj9eA+reEqsqbIvUoi4A1Nb0pK1qGF0E
X-Gm-Gg: ASbGncvG03x2Nt5TsdAEDeMjggYXxS0r83hwsqYIdHLkiipWAjNoZ6SyuKlRz+FBket
	aGRWQUjQGp3Ncwb3ztFL9xjW0KczXXfMwIZjTcHhKSxXQ9RwrJVkLKVSPgikOYAqc0PCu3V5J5z
	WgjwW1v5Wx6Bq2bZ442x1lG6bA1rv8jBs3sB0lggvj8kBoSv5ZJ9nR3BOfesCI2YxtJQr+HZW9+
	NltRBYoBKKefem4qG1NOvPO3gNQeHHCDshVCNXBGbXskdYBfIRweTgP6cliXlPVQZ9Ggz5HCAxe
	QLOVuxH2wRdQnEbQUPFyTxV301ckr7OhP7xrOLFAgZzf4kdmjTUwUTmvigx5FsHgsjZDvha4B60
	f1PVbolSd380wL8EFXtK83xbraZSRG2DycYwxq8A=
X-Received: by 2002:a05:6a20:3ca5:b0:35f:5fc4:d892 with SMTP id adf61e73a8af0-366557517bamr547288637.19.1765265255673;
        Mon, 08 Dec 2025 23:27:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVw8gsiW/tX5nzu6xnkQTrabOyjhk6od8S8pge7YkBc/cGTiKfUJ7/lIwz/WP94+umvyxLdQ==
X-Received: by 2002:a05:6a20:3ca5:b0:35f:5fc4:d892 with SMTP id adf61e73a8af0-366557517bamr547272637.19.1765265255213;
        Mon, 08 Dec 2025 23:27:35 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ecf6fsm15252400b3a.11.2025.12.08.23.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 23:27:34 -0800 (PST)
Message-ID: <e51d4fd8-80bf-4774-ba93-66d9a6761654@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 12:57:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100: Add crypto engine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
 <2cf32f08-99e9-48c2-ad0f-2e579d50f7a9@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <2cf32f08-99e9-48c2-ad0f-2e579d50f7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1NSBTYWx0ZWRfX7f+0abCVUWda
 6ELG5k9hheB2tAmRh8dr0G6cXAGLQQuY4KmpaNm2C75weFnAeDZHqgjLSoL8ugS3AOF1OHC6Dhy
 eusdoSPmU/d5xL/0ZPzrTUw5lul/+TNt6Ecje6NcfBdepmz59Lctd5rQ2XV4uzNgjEsMmsXEK1Q
 JkjzjMz/zWhH5Erkzs1Db+rAEQSTrD++AacrzPx7cX75Q+B+tMGukhXziO74z3HAa6ESGs+hCNE
 /hFCV48tfB329MMvcMSegBaEMNbBDPXolzPEBQyMrX/WhArxWaFpp6Fy7AxBgcs3e62ROBNpPuQ
 8zw6zN4RiHyF1/yywK1s1NksvxsjxTzF5QBFAvoRTAxxdMTppttvqHenv+mX936sOEAg459jKDQ
 Adndot+ugP12xAPDXT5jUOscxjvsvw==
X-Proofpoint-ORIG-GUID: J653MsNVQ1SV_ff3IeuRiYwhSXBAfWA_
X-Proofpoint-GUID: J653MsNVQ1SV_ff3IeuRiYwhSXBAfWA_
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6937cf68 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=z1cI55MCKPk2RGrjuXkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090055

Hi,

On 12/8/2025 9:26 PM, Konrad Dybcio wrote:
> On 12/8/25 1:32 PM, Harshal Dev wrote:
>> On X Elite, there is a crypto engine IP block similar to ones found on
>> SM8x50 platforms.
>>
>> Describe the crypto engine and its BAM.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>> The dt-binding schema update for the x1e80100 compatible is here
>> (already merged):
>>     
>> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
>> ---
> 
> 
>> +		cryptobam: dma-controller@1dc4000 {
>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>> +			#dma-cells = <1>;
>> +			iommus = <&apps_smmu 0x480 0x0>,
>> +				 <&apps_smmu 0x481 0x0>;
>> +			qcom,ee = <0>;
>> +			qcom,controlled-remotely;
>> +			num-channels = <20>;
>> +			qcom,num-ees = <4>;
>> +		};
>> +
>> +		crypto: crypto@1dfa000 {
>> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
>> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
>> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
>> +			dma-names = "rx",
>> +				    "tx";
>> +			iommus = <&apps_smmu 0x480 0x0>,
>> +				 <&apps_smmu 0x481 0x0>;
>> +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "memory";
>> +		};
>> +
>>  		cnoc_main: interconnect@1500000 {
> 
> Right as I hit enter for the rb message, I noticed the nodes you're
> adding are not sorted - please sort them wrt the unit address (@foo)
> and retain my tag then
>

Not sure if I understand you Konrad.. I believe the nodes are already sorted
since address (crypto) @1dfa000 > address (cryptobam) @1dc4000? Do let me know what
I'm missing.

Thanks,
Harshal
 
> Konrad


