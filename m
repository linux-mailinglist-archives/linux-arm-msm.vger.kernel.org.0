Return-Path: <linux-arm-msm+bounces-87874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D033ECFD8B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0725B30AF577
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69783287511;
	Wed,  7 Jan 2026 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H839W9pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT/xmK37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887130596D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787411; cv=none; b=ZhYNdg1J71JXLt7SM6mxZS036CqiaQ4+7pPZ+5CURa1DECpZ3upZQ//ukmHJdv+rcPKnTmvtEaugpB6gM9i6YG3fHXw5or6akQND32B0l7m7bjXE+ryMOh30h+GnCTDz2uENLAj2ZJM5J4gTeF8ZKDESgh6ndLRqP82CU3kQfww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787411; c=relaxed/simple;
	bh=oMhk/Xq2aC3Aag3B5Yh6Uo35K9uJs0+HxKtSjP1ZhrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1UDFkXHek0TwEgmshKg+LzSRzaSNYdINKKOX2ifTfp32UF1Qvon9T3gl8hGpzHAP64DtqFXC2bW5HTGAyPtLHVR2CbmZt5KYwDSN40eTXVJKaCxUvUZVKdad+Nl79rgaohR5pU+v899+V4GxTodzZ9DtbdzhM08B/KadaP7hMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H839W9pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT/xmK37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078dpIZ2577889
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OYIuWlfNmnER+pgxQN0927vrOsdUT6g48em04i5dIM=; b=H839W9pnQG6eZ8c1
	HTH66kEY0wsIqHxHKei1nAj7N3xuiARn0lGM1HgyVtqsGtfy+GSFpSnFPjy/GH77
	jdbitQjZyhKAVp1OEK3jtcRdJ4wdu74J9zHSZ96EadBezXuqkIQCvCTieRp5HIVD
	n2H5U5QRR1rdD/T84PwDQrP49Q6evMGf+hbREh7S+mY5i1r/2rsWw5O+CC7fP+7n
	faf3i4D569aMHHIg9WRsFLZW4fwQ1wDqo4V702ZeXT+vTGN+RCUxnTISkthLi2aw
	mhK/bpjw4DCo4LZ9/NlJ4kpQhDIEu+jNfDvLBYxklJezx1uM3x8m0tDjfMnI/5sJ
	59+J8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm658mek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:03:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b10c2ea0b5so62655085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787408; x=1768392208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OYIuWlfNmnER+pgxQN0927vrOsdUT6g48em04i5dIM=;
        b=ZT/xmK37O8q2ZM3pH36dmgOQoCmLWt9FiIIVKrEwle0J5ckY8C4m60ev0UMmPj9vNW
         ac8VtufDmvdpBt8j4HbD5iFpXXqYySEet/wkV3iETioEL7j3BbCDLQYnni1dW89BcGAY
         9V9WyhMHMEVifebv88p0l/Gp47ppXZOx8Zcie/1nbenB7C/R2q2btyx8JFokDTfAZ9k0
         rJb8Ea4Sv+NTHZ8gLBNBcKN0PAMmxBW2FSj4Hzuc1r24dI9KEfvGpWzoZyQQ6553k41U
         r3PXqheXvNZJbJQIeoKch1bjQujUg1yn+oj3J+Dzhe/ukQUoRtl7CtPn5NAThjB8VItt
         dwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787408; x=1768392208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OYIuWlfNmnER+pgxQN0927vrOsdUT6g48em04i5dIM=;
        b=ag5/yZKtouUTYSlQ8P8Wxv/00Svw+aAhPoRk5RazTQRvhFxZscDZl9DuB0kLzAZsmi
         CKN5vHvAzEQHEa/8J6wk3Y4OSI1QGvVZmnNrYh4li5aIdnb6ce5v68FLy+XZFtWAcpXK
         hitX10VTqaJQ0T+A0Qu5ffAoKPLysi/VGik1ObJxH4Dw0Y/a5cwxebEioZUC1/MLP+6M
         q9amYNNPDpzvbnGE5SOjYeVuX3UJkdnCrXg3eK5oyM/Z0mIyIuWfhUmsXivvPxxNEsxn
         bsk/+uGAn85kURLYuxHNVfEMDFi6SacUAFIlLDTpnaZuAoXsz4th15ZVvKrJbv1t1Hjd
         MU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrRnm0YHQezoATs177WfwBOwOYrEXdENQ3eHynBP/QuOo3BEBZvBktimyNMXkXlnpgaUnpE6IO+qeXo0WS@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXKtkX53EhSj6pP687UD3XX0bMxwIgzRUWbyv3hn/ElvA1DxJ
	fKdsbmw3FE4+B2cRbljREBPRMROzpD1saXDw7r+pqQw1mPn3K/o20a58en0hKTCD4XJlt5VYMVN
	3VX8krXjj691H3Q8iIjVWrzvTN+JBcabKaQmA4u5efRoANMhcVjl+je4qvZSNOqJ5ElzN
X-Gm-Gg: AY/fxX4N8o68iL1pRnqtEHhX70WlKuJl2jftihSAes2NlHw96tkaACSi09VWeNDlqj+
	vfBIEf/gkb6AWVsxRy28N3+9H3GqdUsIpc20EskmgTZXyaW9ClCa2Bgie4WrfSaUsWkeH6IK/XQ
	Yl4nSBm73za9Xl4cn5MQJ7KvCzcV5yRdsaaPHF/xfmRHpoZCGEKlkd0AYIms02DB8Lu/MqG4EnV
	yDXgMy19vVrWppB9KBoHurnSFBNVvf79rSEuJfigJyxongDmffDRZeOm5UndEAu2ujS0JSYEV10
	Woq6EANcX2GFWyULjJqJ0D9P0elxCEW2TXfsc9ducjAs6tMb8x3pjbJiGox8LnbeB8t9sU2PU/9
	6/4FKAFN/fgyhedf5FrfNVvYZjWqQ2nE9SZbYAP2P4uFzAAebziphMk35LM/xxK4dXNk=
X-Received: by 2002:a05:622a:8a:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4ffb47e3b0dmr22957281cf.2.1767787407868;
        Wed, 07 Jan 2026 04:03:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIUGxjnQgE4PgHsYyrjWsDHfJ6IeypN42Z/YRU+rG2QsfHWIVu19VW4NAlWcg80kdk86FAHg==
X-Received: by 2002:a05:622a:8a:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4ffb47e3b0dmr22956801cf.2.1767787407325;
        Wed, 07 Jan 2026 04:03:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23432dsm482678666b.11.2026.01.07.04.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:03:26 -0800 (PST)
Message-ID: <84799abd-3b30-4772-b716-37f97a28a8f7@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:03:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
To: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-6-6982ab20d0ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-milos-ufs-v1-6-6982ab20d0ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e4b90 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=STFXn1ACf7ZPQ-DneOQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: H6Uq87DArCrp3cC0j2OZO3Fsjs9J2Vdo
X-Proofpoint-GUID: H6Uq87DArCrp3cC0j2OZO3Fsjs9J2Vdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfXxqs2h0jFSsTg
 DE/dect+FuMIdFJExcpC6VIlpOa+D8AX2jjT+eUDFlVPIqp5wCzU26u6qBZZJ5ChqoQoHcr/AWy
 CzYIqbsNAI1aacF+2Yn699f0FrfsE44hLX4JI7SAEkVCYwKALzJj2PYeH3rwRYPhWNwEdEKY2ks
 1NPA2nwG208OlAv/IR4oTmQeumDMYBIz+QzH1N545Wzc9Z1Yc+Ofy9rz1cEeh9CvTDejDdGMF7C
 zUJ54Dq5XkVEWczRahmUOAIWpXI36PXzm6PJaVqLdPgYJFnsvYY9eGkZF6EMJ2lMcZskUowcB2G
 qnEWFizuctDLoh40NVVRt25V0gI5xo41ApNLKda4zjtHOopjVTt7/OHak2lkXou4NVUwlL92de+
 HLQ3JcbmI5U53rYbze8C9z9BJ+Y27WculzuWNTRyKmYAcJUxtEu/Htt1xwmo/osgV8vY5mBCIUn
 9+CrzrVS+7HmW3+vzOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070094

On 1/7/26 9:05 AM, Luca Weiss wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 3a7f2f2b3a59..7629ceddde2a 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -819,6 +819,24 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l12b>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l5f>;
> +	vccq-max-microamp = <750000>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


