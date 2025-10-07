Return-Path: <linux-arm-msm+bounces-76182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BABBC0F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E393A5216
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EA02D6E73;
	Tue,  7 Oct 2025 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5NCVgyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988A32D73B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831431; cv=none; b=PzYBcEVnqqAfJiAOvYR4GyFcn9zWdZj+Wm/eGvx2YtlF5iSvWA71KViLhfCbiYUEweBuDPmv82OIm/QjcGBCo5omT5Gz2qkwYGatJBmSb0YIA13qB/VUgarPdMZBqWElRTC9mjALw4QRasBO+RtgX2MhNJrxON50UM3IdtDx9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831431; c=relaxed/simple;
	bh=deCSUNbIDe5KUDM9hMfp0pEEzG+kiG+b21ccg2slSwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGmM5irKm2qoKJTrt2qQloQmnJvu870Qn+UgG0OzgpNx8ShFmi5fFJ00fuvWowNCXNmr5c2djtioS5idnjXmDewuzOVcKalaixc/D60JPzMxwK4qE5KMa7AL4V5NKcEMX/92HL4uSRC3fFwabq+n/GOBc2LeXyZXZYtf0mDOaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5NCVgyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59738kdH005144
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/lg14/r475DGELb27M6yUVRo8Ql/TshF6yOFwLnhUg=; b=Q5NCVgywT30LklDy
	PsufD/x4ImyMgiRyRIF4Kje/tRkngmJcULOZWAUlRyqbVaB4EHwo7LuYha0cs6kb
	4WGJE2YBaIINdE9BC//R+CfAGNG0qPt9BQZPpriiYMKzpbWmIfGDroF5xXgo3q9F
	OQoVxmu9wT6N1f4PEodHIa/4ZL5rJykwzRHjIiZpG7QaCf+PKMX88UK8T/2sTj5u
	D2EIj21q9COYRf1sfT2ulpGin4SFh30KUJSWlzc+QtLouop3IggUNOJsqjiBPYcW
	JNfFU8bpPJrFTmQZh4T99TN02x39FvQx/k6SdgAoHioKEsKDp6dARtpai9j1WkH6
	hnSn8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn755c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:03:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dc37a99897so15411771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831427; x=1760436227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/lg14/r475DGELb27M6yUVRo8Ql/TshF6yOFwLnhUg=;
        b=BY56yXw5Wk/Cfc1Mj2VLRb7v3FzwHsKWe0qZ6QfKozqCub9aYTrTo4MT0w0SwiEWs0
         PTmUTGAYUS1Qt6tPrw3neB0gwBaV3UFdC7Ay25oA12EE0aI4HksxgfboNIJPn33LbXey
         1Ymue3WYTbkbZYPHsvhuKF9Cs0I4tVVoyDKWngHAaZ1RsXP2ATxgUiiPFVCrvgHWLE6G
         btv646JHtGyEtpESXU47Q0+M+i+6wO1vDmn1WMfpzt30INObd8yY+rsnJLmwpc830wH7
         NhPTEDar5HCuZiKxMi+tf/ZsLUKclzseUgvfRGk751rBmZsg+0lhPd+Je1yYjnT6fszi
         /hBg==
X-Forwarded-Encrypted: i=1; AJvYcCWYtB2m9VrDODp4R0KO7AQCgMrZ7/AwUbLxp6I+T96U4mY9kXtexvtaaTdypOm3ABea9Wmm/NQFaAiyVhzo@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTrMZkI1ti8MmylTQNLKVE5F1W5ZqSltfcOisnDjAIJqD/W2E
	4WGSkk6x0eOD2Z6ac3I+5vomFeP8Kl5zgWaj0b60shKiwKNqJOYxbKPFBKHtImSbL6QCrMOvyOL
	HeiKHQNaKH/U64xkHhZMMvBuIll2Ys8oZ0/0KWXqNsGLUuc/MOwfetDXdha5baTvxtAiwcpZtuu
	vW
X-Gm-Gg: ASbGncuNlK+olcdvWSgJ5xQpxOBm8fW+aiOAXI9pZOTUH88861tRtP5t97urGR/u1sT
	ZNOx7wvw2LUEfFO98lh7cIYWG2cLImpB31Fs6aWXls9uYW8qe3yA4z4MAzavQe7x48QuHIc2cEv
	bGZNKch7HcvFeab6iHha4+wy4XB/unxNAORfXtqBxJt/BaJLq1fYZ4Pxg5CZ8BUEcI0CioSw0sB
	lKmP46agQwN3qAHI/3JtMX2xExeytExLwLiJP7XMWmDq+JNCb5vgQ0tL0kl/jb6XWPxUWkjKFl0
	XDHaAA9GMR4ZwsriV7wNGm/5tG9MviztrM4T/TqStFqOfgTHtoLK14nCknc/Pm7l2KaFUU7WJp8
	CK9GRL8s4dahKf79t2cfF109ONIM=
X-Received: by 2002:ac8:5aca:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4e576a98c02mr133841641cf.7.1759831427316;
        Tue, 07 Oct 2025 03:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhzCL5QidiG6adlmbwtbxC1CmvVbnE5VzUbfzHUGrlHgHy+0vWMRsnW7JAlRR88W32mvagWA==
X-Received: by 2002:ac8:5aca:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4e576a98c02mr133841321cf.7.1759831426898;
        Tue, 07 Oct 2025 03:03:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm1340878266b.69.2025.10.07.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:03:46 -0700 (PDT)
Message-ID: <99bfa340-2164-4df8-9953-e65f9cee7709@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-2-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-2-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXzPZpjY5hGV3e
 Ne7U270XHd5lu/gnbEoNIM5dlhs0bINjOdONCosOYp3rBylhTwow4QWlc2YP8NrjG7usU/zsQVY
 oDoVkBSVtr7mMkYU5V8b+8jdBBXnYq+KmXBkcOt4SO2w9yDKfYZ6s6V/R0emFY2n8W7k1nVA2Wt
 1VsFHxsa1IaYyVu/CF75FS/ddV4O3h2gsTx1zYIMMBKQ4G466N0dsMUyXS9prAZjc1/6lhlA+Fq
 cT9+klH3SxwJQQRwBCLgWq8isVPKbFenL5JcPssN9s0jKEEtNVVFaVa5dtYJ43bPNKhXWgtfbiG
 Uyk0xNpe+T0AoAVEndWQiTlUgDZBSF8CTR2zMnCz5k8IdJvm8pT9nEcVNFdCTUJ/zRejToNG2/s
 j0BqKGLJaeNN+dXP4BiZNgV2AHFjTA==
X-Proofpoint-GUID: 1Ow3UjyDbHRHIxsZXwrTaLOV9-Usn10g
X-Proofpoint-ORIG-GUID: 1Ow3UjyDbHRHIxsZXwrTaLOV9-Usn10g
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4e584 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=2dNuJvzwNQBdB-WvFZIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the NFC chip used in the HTC One M8 to its device tree.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> index 9c3859069aba..4026d6fedfbe 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> @@ -65,6 +65,22 @@ vreg_vph_pwr: vreg-vph-pwr {
>  	};
>  };
>  
> +&blsp1_i2c3 {
> +	clock-frequency = <384000>;

This is not a valid I2C frequency

Konrad

