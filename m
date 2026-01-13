Return-Path: <linux-arm-msm+bounces-88782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 166DAD19035
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 397FE3055E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5757B38FEF5;
	Tue, 13 Jan 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRyPBOk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlZkdwm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4FF38FEE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309508; cv=none; b=nukhXMlrApOL6XXkFelyysQVKWyICBTBVHjMV8qbCjkbB8U2/5vl5CdGzVO4et6n6zV8TH7pOpqnEOmkM6wZeh9/GJpFkgqmnBOke0w16PlwK391eHgtENNNTA4v6t+89eL7kqVnzpTEe6CFxH2vbF2C7p84TDqLESSk/HZaR4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309508; c=relaxed/simple;
	bh=bdsxR1lkTR1NMiMQrWc6Z5waeQ593rIW/DnTKDqARn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxZzdg3Rg4g6Uht5LD8rp0Ph/NQLkU9RoPqfdlzCNcsgFxZgzun6L/JiB+X8xynBhyZgpZxXT8QLLRAtmld6gCL6ufeqPcuLGFGWFfcVD3pT435xPvyH6J6ISdwqtMbfvtEUXkc4GrZ/OQ0PDmpZBimJAlkLz9GbQCpDAm3JLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRyPBOk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlZkdwm3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D74Q2P176963
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	neiMhCUlfo05tbI3e1iPEgmhFazGW0tLIbSzyaNtg+M=; b=RRyPBOk7Nm8g+wrP
	laZKyGWES6UbvCouMzZeoOuzf8FL9tTHXKT92tF8tvKtlcX/MJJA60yEUDbot+OG
	OkcaicScs18pH1EnSLwUiY1f1Irq9LKXpPudlDgZ5bqUrUQvnKzivW4/4t4vfkv7
	deejTZSFYcurz/5KpfKVF/Hh06lEPoIUmbM4j3SsSqjo4q9Nak7BAYUGJLn0KJ2A
	HA1uu32dPeaMDbPc3jGhzmwgjxMpZEbsF53i7djb4LiI3h3AxHC/1S4WQ7Z9hd3D
	xaNtIvOgMjmyMQxYseanZCyLySGvoAzm/GaSlG90H69mN+Ybg4eij/XMfOtJx7pZ
	Tskgbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f39qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:05:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-501468a59d6so58391cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 05:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768309505; x=1768914305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=neiMhCUlfo05tbI3e1iPEgmhFazGW0tLIbSzyaNtg+M=;
        b=MlZkdwm3i2o41mr8+6gEzv30XbVWy5T0UkerAGD0WzoyUpFor9IwbV646xX00TsWJE
         Kux5QhJNWc70ldsXAljP3HyAbh4U/oRHEFP0WGOSlRo8+2LWsxAe+iux7yaetC6pEDXf
         2li6zBQhskwA1hM16qgVp0QVFueatFl1VFAY2+ounk2ylKXDzCd6nqaCVKn/Y0iLwDkF
         hJaafP58GIUTtzzeHeMPCqLykp9Ohj0yNmV9F9/KtNPqjZfvBiR5r6G0t0zp1cASrETY
         mYdScuemzCCQcE+MQXrqjaLRWuJQhfRmu7pvhiOGdcLWhIuJJqUKQZO8TE6B4KCUFmNp
         neUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309505; x=1768914305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neiMhCUlfo05tbI3e1iPEgmhFazGW0tLIbSzyaNtg+M=;
        b=tzc1hlLCJeCdNb3DWZEywKOlpMWDsY2jJZkX9p8xohBAHnHVYyk6a3iCsrMsKyPyNZ
         trcKSHGMhJ2kmgWQOKRIlCNsy63mdLjtyec9NPd+HS+OBs4jeYBzUg9sXHnUtnYwd7TN
         FUpwbqco/U7XiCJ7K1dSyVBIgtYEoN9jPvzpAoAVbx9+uUbm2cH5GDJFer4qLeS7vaX+
         3QUMFlsDPjzurPv57fk6sNLsGc/heaauD0wxc9Anx4fjshhKWoJ0evdC0bYU9XZo2ZQv
         3rzzcpy92vGLBPtEWsbsSakFZ6z3HbC1klDkMFb0m9pYYmTGZyYRqsjtIQRmT6CBD4nB
         eHrA==
X-Forwarded-Encrypted: i=1; AJvYcCUUedQ6sTj8quHsfAh3AI4HX5JAiyeTbs9py6i+Tg0J3cB5gRkw8U0kjmnw3L9gD9L02ondG5nbC1iB0MHa@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKIeU1LqosgFQDW2b6C+q/sDjX0KFxOkPwLkVmfrf6rVSj57D
	gHRZTjtYj4nRpkpvfanFtj2r3FXmX5ycp1Dfn+b/3JYin4orTcu03K3jRqL7+fWGv9j16Mij6nW
	WtvZ3wrYlKntjI2tCTcwdz85vmzqY9+huUcsBpJM8zrTo1dL5fqJuss2MnKdd4lYqVFW8M8htrW
	Co
X-Gm-Gg: AY/fxX5qjPbWjI2xfVKkupfHeLfGzCb36vpdnTcEYz9V1/4UMm+6sq2SPZQ+Nfx3p1K
	w+yqFB50pPC1wMIvtSASoAWk3Y+z49WO52wHFK4zrYdsyiu4U3T6Z+xQWhDmDPSnoS0vHrLsz3Y
	5MWvv/nCY3fgTMpB8azWPt0HD24DA2CAIKcwxa4MqyIT7U+qNI6gDDWp4xM+AungY8a77MetROj
	regUP/hah3j9xDZrCOfE4LWBktor7wkp5VTCvbymcVDIWjjo+JZWf9GPkRt/z2i2Kwd9Lon7vwa
	DzUMwgCleFWIV0O1fl6eGaGJ3ZRwVwjdgtQxbxMip/Yyx21aaOUsJQVmg2CkCq6FXHFsuGn7q6z
	DZGHrHU1S8k61wLn9iOpZo3Q2ImbAOdXAL+GQ+86dcLNIcvkxQ1P5Ud0vrog4EU8TwKc=
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr240324471cf.5.1768309504788;
        Tue, 13 Jan 2026 05:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcplFnlt2Sv4raFaeWXiNUyu2EYwm++k8ojATvugdaV3zGrnz0m/KWdSnZbVGQVoSM6EZpUw==
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr240324181cf.5.1768309504347;
        Tue, 13 Jan 2026 05:05:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm19171192a12.10.2026.01.13.05.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 05:05:03 -0800 (PST)
Message-ID: <3ad20ed6-d870-4532-9559-9e6c39e545e4@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwOSBTYWx0ZWRfX0k/Z2e60o6/h
 n/trv32lE38FwgXwQuYCK9m0WQiwtwbc1V/FBzzr+qsd0dMdcmFv6OKUmiM5yKCnocJy2C6f55M
 j6jyG4eH4BdJEJCzEXF+FlhUSh3qacfO9X+FZPOD/7nJ/R+NOR9nBjKQypjgCnhZO9bNyOz0B/W
 2tU/l+LhB4CaWHMdaqY82bkNVVZx7/VDbBMPo1pdUZrQD40spmjvF7R4l+XKjFmmu4pvCiRZ3Wa
 zlC43C5YtPvN+rpQjH0pDJZx4OfGv7S2+fIqqr7nVHpmbdMyQHOs4DOrJOrM+WipC5IoQldr7os
 leodYszEt8I5V/vekqMpb7f9kR7Icmk0K7rIaiMuJsQk+E496nlh/JbN9sYqgT82rF2EkkfMgCV
 7mv4B5pWvgVDjAV032T6w0Hfcs8b+GGBGJpxaEnyoPoICYgX/zmv1oRj7qnp0qN4wfjUzGsYJ2q
 wjdTGMqnE310uHz6Mlw==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69664302 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iuyhanrI9R5_42HSFcsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: nrzBX7zU_kakzkBrJs3_lNZcMTQBV3aS
X-Proofpoint-ORIG-GUID: nrzBX7zU_kakzkBrJs3_lNZcMTQBV3aS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130109

On 1/13/26 1:33 PM, Abel Vesa wrote:
> Some of the controllers found of these platforms can be tied up to a
> single high-speed PHY, basically rendering them as USB 2.0 controllers.
> So in this case, the interrupt to the Synopsys DesignWare Core is coming
> from the high-speed PHY, so allow the interrupt to reflect that.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 7d784a648b7d..f879e2e104c4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -500,7 +500,7 @@ allOf:
>              - const: pwr_event
>              - const: dp_hs_phy_irq
>              - const: dm_hs_phy_irq
> -            - const: ss_phy_irq
> +            - enum: [hs_phy_irq, ss_phy_irq]

I fear git may mis-merge this.. if you send a v2, please tweak the config
to add more context

Konrad

