Return-Path: <linux-arm-msm+bounces-86834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51891CE6AD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BAC63008FBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5089A30FC17;
	Mon, 29 Dec 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chMeYr0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUKlXEu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBC630FC03
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011171; cv=none; b=uiiQ4haO5ssWjlyFvg5bqd3JBddbkbrSUpWR9PQKPxQRjASQFwlWa0rFFVY4u8HEcKG1wwALTDq0Gam8vV3qegRhy/8EwBsWy8vTVdSFNmeWemw3GPxDPJI8hFHovUCTjZHT5qZBffpu6uvKSpdu62FnDBlT4QrBA+I3+w3CvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011171; c=relaxed/simple;
	bh=ikcn4WZRbWCLPPagC9V2gjb/C/j86IUWIm1xRYhg8zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZeTTDAiNT8EDPmzb0b5FLbqBsvPs8H65M5PPl1Qx9I42jygIHO57Fl5QizPNYhLA+7uHhCjw4JC57jx4EHmpnQrB8020ssEu0wsSnS64tvEz4sgLzhKUw/RbUgAxvPfEJabnI9GfIWtrmcV0piR/oAWlRANHjgwyI+bLrDyKu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chMeYr0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUKlXEu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA8U7F3253861
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mN6LYrOGWt+c+fADT3LUTFhdUHN5Zo/kGP75Efm41s8=; b=chMeYr0co3R7t63a
	BiwmMzlSUGP3AfGKxHn3Jla0+pYUFpxTUXEyzG4fPErhIVZV8NxVHRx9gyD3Q863
	FU38wg0uFWJ41jswzR8Z8vZA+fCwzL87vCMbk9M3pIzxTePfBcU+RTJKDVYawvwn
	Jbm5PxOvsLZf0pzhrPGG8Xuoi1KuOoiLkePalrmzcXWJ3gy+K53rSkOM/u1+QSsY
	3Ro2buUfu78uPupYPViDmBDYBkqAfWR8ZjHtKtmnhZCD1kJneWCM9KZGiLL2LvND
	ALvjD3bqzi1h1ErXyEmIDZX3kgV+yETdriSzn6A3ztauaK7zb1ms78U5RvFMgxWR
	reVvWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnvgme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:26:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c231297839so70053285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767011168; x=1767615968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mN6LYrOGWt+c+fADT3LUTFhdUHN5Zo/kGP75Efm41s8=;
        b=kUKlXEu/nBioSvQtKcFUeaea3y53F53DJXlPpuOqkyO8YcdFbKP87BJDFooKlHRIDa
         m2BYoWToT+Ekfwx9GyACKN7W9n8fKFNczPomPgkQuzsDwEpowZnHjY6kOfWGOooNzNMn
         S9tWjn0O5ufKL/98Bu2/dk1vBxjQ0oQRj4VMagJxiOxDaXs/Q8tNxsJ4rqFfp6w2V98+
         9tTzct4XFyJ4eKjlxQvMx7zLH2Ft5+9NdSPzUEXshwDjeBaRFnBGzFPiTwyQE5G8hw/w
         PCQvAoSb+MqLzMQdqYoq/q64NaZaUeEjGk7asWAXXoq6hiiGngsU+8LECk5N9Paod9un
         HDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011168; x=1767615968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mN6LYrOGWt+c+fADT3LUTFhdUHN5Zo/kGP75Efm41s8=;
        b=hFBWQrPSjWVR8JzajYRJUFVXPXCPPrCY+nvbOkOE/mpRPs669u69B7N1+MK4TGTIfg
         1rgRmRwnwGSSk0Y3VA67nln2+PkrR8JHA9hNb0X7fByVT1piJkX+cX/JdBIGbKpocEdX
         X64/mkOXiypvCIBX0NccbXonmIcv8Gv/KxBNTItGYecbDKCIdjQ+Uczae04sU3XI4dnp
         6rg6l3rOBqBBz/ZAM5EuYcGERBkXW6QCPBArv6UtohpKXdYImlXLTlfaz28EDkuLF+Fb
         vXk+WrFI0hMyqhw/j6LTE8zE2RjVpuCgsv7J1xahqawRzXFgWYY0a0jIrgwDU1hjmzGq
         Qe8g==
X-Gm-Message-State: AOJu0YxH14QYBl6klrjf3Re/eUgtGTjVC1VnOzfq12e150J816P3mxXl
	N76Vk2jnkS1rybAgg2CQA4MzGOLSZr36HkRspzOXP1jnmky7uWj4bk2WPejbgGVliXK4kjLeXa0
	UAUO27+BxCDR+nK1K1rHmyqf3xRpbEpGdtRNkG35gXu4dZFvtLUFyVhTM1RAxPu03MjGe
X-Gm-Gg: AY/fxX7uOIWzaulcrhXNEYxBEEpHoUGXQXYCw+qZAVBDT0/ibpmCv86cdu21szHPpaY
	mtrsl/Fohv/J0RsiHad6FV5Bu3tCmurE23JRgrtQinmUP6mm4T20Q6qfFWRBpT5I+xBAB2UEn6u
	CgPWZ6bEZunKjKC1kzg1uzs0qGIWsupB7qGmSCNa9nwxCpRPHnZysUl0U+CoBc1++S9UF5l/3DT
	wjesKeQVJKHGkybbea4xpwFp3C4Grc3bL5qJtqCLdHxvwIrpaj3oDg6iCj6RXFxK6Zd4D9DmSyS
	cBQHOk0lTZXeCQBiJ7O2Id06Dk/68KP2Eyk2ULLA/vmxz/j7eUVlsKMKc+N/kzLKraZ2mdsOfCI
	6XWgNHhTB+EsFolqyH6+S/UizmQMOsj321vOxusBG2XsLx5LVmwMg6QVl9s6R01CRWw==
X-Received: by 2002:a05:622a:4d:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f4abd30b01mr356524151cf.4.1767011167853;
        Mon, 29 Dec 2025 04:26:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTNhJGS6wpzmfsSBspDO1neXn7hzzMwDf7y6CRLVLjolv5e+1eTU6agqRUfN/9vpmI89qn7w==
X-Received: by 2002:a05:622a:4d:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f4abd30b01mr356523821cf.4.1767011167324;
        Mon, 29 Dec 2025 04:26:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80377f2f18sm3295432366b.0.2025.12.29.04.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:26:06 -0800 (PST)
Message-ID: <5c97bac1-d796-4046-9450-65cc99ef7469@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:26:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/4] scsi: ufs: phy: dt-bindings: Add QMP UFS PHY
 compatible for Hamoa
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-2-pradeep.pragallapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229060642.2807165-2-pradeep.pragallapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69527360 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=x0PFmZ93Zfwba3del2YA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2iTiGir6T0fm4yveYUdMvOUW6Fd2HzTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExNSBTYWx0ZWRfX6aFzG6qE9uxG
 +je7kTlXCAUwADVrlMXnZN0j6ZcGiJYHbzgSvLsCalk0dDxTzOeOWY6e6Pc2RsWQyp4dmOgMrZH
 +4jq5E96okqAt/60FjU75uDqUSxL5CS/oEfFy1+JccoAURIZl8fhe7AYrJfRl3mYR3J81iT1ynF
 BbcRQbDVI4Tb7LNe8+UGZRQAQjyVpVgl9KXWTgt46XF/x4LYTPWI75pmL/fo0ye0Fgq84aPrxNI
 6CZ44YZm0DTUIX4ltMkQ8kMByhglhOEgI1fDCtoiwy9QHTDPMqLkrmW7OyYZ9PkG2FsUwTsXj79
 clMwvVtir+0faYCeC5uwC+IX2tEHh8IBrixJ+KN3d5Q3bNw5xq4KyNokO9/giD2uwTQhoHlv3jk
 qaR/MNd14Uo4N0BYkdqtI5Z9vTQ7d2U09o9ptnRAfIhSj4S7s0bBDcM0j8DxgHxPm5mNCiLFalI
 bTo+n4igYbpDEVY0HoQ==
X-Proofpoint-ORIG-GUID: 2iTiGir6T0fm4yveYUdMvOUW6Fd2HzTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290115

On 12/29/25 7:06 AM, Pradeep P V K wrote:
> Document the QMP UFS PHY compatible for Qualcomm Hamoa to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the Hamoa with that
> on the SM8550.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index fba7b2549dde..b501f76d8c53 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -28,6 +28,10 @@ properties:
>            - enum:
>                - qcom,kaanapali-qmp-ufs-phy
>            - const: qcom,sm8750-qmp-ufs-phy
> +      - items:
> +          - enum:
> +              - qcom,hamoa-qmp-ufs-phy
> +          - const: qcom,sm8550-qmp-ufs-phy

For platforms introduced before we were cleared to use chip codenames,
let's stay with the numerical identifiers for consistency (i.e. all other
compatibles in hamoa.dtsi say qcom,x1e80100-xyz)

Konrad

