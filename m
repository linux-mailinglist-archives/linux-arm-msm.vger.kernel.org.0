Return-Path: <linux-arm-msm+bounces-96240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF+0IYyvrmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:31:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5021237F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61A7830474EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5BB3A1A2C;
	Mon,  9 Mar 2026 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbfkQJKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUWRo1oS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B413921D5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055695; cv=none; b=pYcKNsqJqaq5cpEFpjzIolbZ0mx1nwHUJALjoVY2tj/lcAp0gKAOOn5gKYR44nkDugyN/4w8wrEfm+KF4k0MwCTBf5UIhOncPBEkYNLZqAGIx4+BvX25b/UrDuLClFZ2Dwv2wvGlKslwey5ekOaifpTbfJEq9Tj6oqbCp3aQszc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055695; c=relaxed/simple;
	bh=ffzYuk87oLdr01kXxXdni7PcHeH6mS+mEtrAYUC6uWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsYfebxesW7D/U35bx5KR3wIFgRV548cod/fgNxTkzj8/6yc09ySEe+mdPFJHC9MrQ60q40P4AGMYysowVd6kPCfmk6l+TmsAMLfY2OogUnOSoLkNvcUueNnvUg3BeXIUbzB8+gTIiQjtQA61Gx4XRLU2mv11GqC7F/TcUh2MAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbfkQJKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUWRo1oS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297cUT53645182
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKVphyoaPLZOPMgBSVtGNnozi0+Qf+TQcqaRjh09CKQ=; b=AbfkQJKrD60/hXiy
	iBdRITAzulzNO40wAcQbkyD+zVYbeCDUnLq7b4l7T0wxngpia41K/mZ+pB+ROVp9
	NPR26HO28da1A5zVNFIUy6t9aCnQ9PlwqTxRm5JABapmsnP36ihSsZ1GpkN7Ylps
	GlQVhi946qg40dXalRPE0+y7GS23hcSZ9guASgT620Vqa0NZ1nEmbuNuBFleyFI6
	niI8rDIUdzXkkIsQ4hBRN93qEfXK1HngSAEPMpXXOsmL/twesHJaenLgRLd4zJ51
	xmH0LNtTWj140Qb3iiZZ+BdzVPR5qgW0vTTf5OwzwB87b4+9Rr3Zk69S+flAt0Z/
	T/VbvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrnac9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:28:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a01982dc5so52327686d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055692; x=1773660492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKVphyoaPLZOPMgBSVtGNnozi0+Qf+TQcqaRjh09CKQ=;
        b=OUWRo1oSXKdaLlZAJXzleoQs97GtjMZzPf3PeOUxWlqXfSW4NtOJ2EMIWWBgek5dzL
         pCXaEpT8LlaVZfN9QsjC9n0nLlT8KkVl5m47vSYt4XkA58qHs06zkGKp7cVyA9UFeQfe
         WNa39UZsPdTc9EKkXFrrP48JSgsIxHHzWVWTZbAZLSTxP27w0JQp1zTgbkvc7JhVh47m
         AY4kDZKFWj/gtSQhlDLVVtLNnnqiQ8ypOlXVBo/U9f+HzCmTQkGsZEjkzfQYD69txotf
         QUI8LSvChsTCMuyjmJC17XY5om6YlvyLHks2tBk92R4SS2ZSWUQCZuSpgVrxFdPvZlUc
         ieXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055692; x=1773660492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKVphyoaPLZOPMgBSVtGNnozi0+Qf+TQcqaRjh09CKQ=;
        b=LK7gcG6kGyKlBnTPYAPAoJYGwyUs2921dGqAUDPiqhlC6BmwLvZrdw0YOR1S/4Ck1X
         Js1p46x4fmZRszdWrDXbUqzZHQbQidzlCikvj+BTrWwb/q93jFqqZ86SscxSDuTevVUF
         S0/xWRB6rAX5KkNt32tQA6WsFPIJm4PdermXHpHCDgmwVWxUBj47fO/c110PPnfJJlY0
         S58EJSb7MNYItqyUjmRY016h91OOId4VVMnikc5EQFgXbAFWSyesgxentpZ+5hl1wkGG
         VO+RutjPJQSkF+ifd9Edtr1DYdPXnw7iiySlXFGF/+wWF+s7hXhMvu5AvtwzLI/Ylwoy
         UTYg==
X-Gm-Message-State: AOJu0YyMKqIA1Yi4rRBeI0ePMRABtsJZpkkMf9ZzYJtWl6gt1+tW2SRh
	DWtlA9x5/9HyZRyVevQFWcu1SheUEld3h1Yzli23OaxKsbPlw0xwQbTxmDQgnujghKFZnJr3kb7
	2gkUw7Y2ud8UkmZFW8OyONLn5rXmv23w/b1vqSInARgOvwrYnkTLZWfoYpf0U/F5d5m4d
X-Gm-Gg: ATEYQzxtKg9eScS/Brjmb+KyFk4k+N7rM6ZGERTfDPCGjBn87p4QUb0U1XIaey2S4QQ
	h7pVB0rtVhBBcFJ1dAyNAdA/s74J4Q9NPaBSkdiAt4g/qspJmQjSjHVZePmTj1mJVsvaCdN/xJP
	hdWB38/aGR9IDgpaWLzAZV06D0G/IUbDWnpjOrtnIJYBm6BW2y/1UqeHSIQAJmKVKoq8FaDGMsy
	yUK0YlxDCmbxGPaFviFxlv2u1LuTGz0RGcGtKRLHP/v0pVBNpFEeQnxMWp6do1FGRhRsBVlNkcA
	N+UDMltM+3TrgRSOHJvV+xZodloipoqSh/DT7z7p2oaZHzAgsdHljN8JsKmE8mHf8ds2Odq8Dzq
	5bUmwJHRIIxP5HoMUQ0HHhsOZPd9gDXVlhwq+7V6PLR3W+/kmNE0dDjt83NKLC5cmxqV3d+EKSO
	gCeKA=
X-Received: by 2002:a05:6214:6104:b0:89a:4f20:cb28 with SMTP id 6a1803df08f44-89a4f20d1aamr22563856d6.3.1773055692160;
        Mon, 09 Mar 2026 04:28:12 -0700 (PDT)
X-Received: by 2002:a05:6214:6104:b0:89a:4f20:cb28 with SMTP id 6a1803df08f44-89a4f20d1aamr22563416d6.3.1773055691636;
        Mon, 09 Mar 2026 04:28:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef4827esm354122166b.2.2026.03.09.04.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:28:10 -0700 (PDT)
Message-ID: <1728fd8c-148e-4d0d-a041-85a64cf03770@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:28:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
To: Alexander Koskovich <AKoskovich@pm.me>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
 <20260307-sm8250-ice-v1-2-a0c987371c62@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260307-sm8250-ice-v1-2-a0c987371c62@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aeaecd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P904AwLpek5QnlVglQ4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ckJV-GcyQov97zyFnoGzRb6Rz_WOJE5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNSBTYWx0ZWRfX21EgzwyRpnNk
 0+gFnIXoBWgZiPkeKVms2XLEBM87p97VoO92d1NyjQKaTKGai/+NWWlQz/zI3lAQLoO2if2yxbv
 aJ90uJ9y4uvo4TFgz9/2Cl132b2tsXH/VWfML8OHMulsreihqsEZJT34gB7LL1wlQ/vsG/LiGu4
 FE0+S15430lT12o9BD/6p1+y0Ho9sQSr20Uy02/3YdTXem0GFy7EZrHjZTeFrPyxZjrwpealRJn
 80lirHJd8hXsN5zWMrn6Pxtm/r++7ezZ9Xeae2Kzdsv9AeaQQMni939lmfhM991/Yf3g1qDtEA7
 /OEUSt1tFzCQC3ehqkAjFoFDchODdBe05x4QPmzJxcaag6ndxa5sVBKPzUK3nsT5Bpj/H8G1sac
 b+brfjetKStp9g9jVXyUbGlFPzu9OaB9Tq9ZoToclM4MhEi/5qiMsLqb6hoXqe2n5FVn9ijMy5E
 PrZmOGa8Uavo2bk+OmA==
X-Proofpoint-GUID: ckJV-GcyQov97zyFnoGzRb6Rz_WOJE5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090105
X-Rspamd-Queue-Id: D5021237F41
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96240-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d90000:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 5:49 AM, Alexander Koskovich wrote:
> Add the ICE found on sm8250 and link it to the UFS node.
> 
> qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index c7dffa440074..4e8a960acc5e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2513,6 +2513,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  			power-domains = <&gcc UFS_PHY_GDSC>;
>  
> +			qcom,ice = <&ice>;
> +
>  			iommus = <&apps_smmu 0x0e0 0>, <&apps_smmu 0x4e0 0>;
>  
>  			clock-names =
> @@ -2592,6 +2594,13 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d90000 {
> +			compatible = "qcom,sm8250-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d90000 0 0x8000>;

This part is OK

> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;

But here, please add the ifaceclock and the UFSPHY GDSC, as per

https://lore.kernel.org/linux-arm-msm/20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com/#t

I'm not sure about the merging timeline for that, but it exposed
that we need some more resources for the ICE to be actually
accessible

Konrad

