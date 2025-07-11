Return-Path: <linux-arm-msm+bounces-64564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B4B01BF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9AB41C2843F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BA33C26;
	Fri, 11 Jul 2025 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BM13EVbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687A295530
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236839; cv=none; b=hIyh1MyceIgc7vIyw5hQyZKtioJpYG6ZDXrXFU+zkmLWAdSMRkeUooQddUjbMrF8TQnVHP9XOQTfUDrf9QW/gj2r6MpKvApTpILshMjymANKqcoDfH8I5SZU9Mu+3EV2NaXs5UOiVfzbhVL3gzo2vqtoZMqouolBCusZ28PODNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236839; c=relaxed/simple;
	bh=eF9OHglEooMPRkT+RzzUrKW3/CQXaTm6Xts5c9lE7eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dn9UcqYNIEE3tumNgZ3M/QB+Qb5CyORdjx4C5+XtxD2YOzSaLiFlz/FD7hhg9b3uzbmu1QSzxyWIYem9nevNpBEmrqWBLQoY/O5QvyzvDYJsghVSAnF6pAJQWHRAcKCUR19mjZJm14vQ9CxvoZGkLUsHXry0XPyF/25tFlie9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BM13EVbj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAxZbg008925
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtZNijnRp1w5BVwcDMHaMUT6uupwS+ihEdb3Rm1l184=; b=BM13EVbjL2HXLpd0
	xEF8zYMCiAcdsd4xLg6veMfZ51PcSCe9qy602k9N1r2P1ww9GwxL2la649S+VCXj
	9pvFQrGO2Rj2WgPCTxknywHA/fseKnehgezNubHY+nhJh6v2Ouc17sUBjAaY/65a
	qVh9egMeXNkbnIA4hCgd5dDvx5yo455N7E8tTShZmUWb9eYScR0W+8JjGV0jfoMV
	gvn9pBHd9ZLIxJc1iyPxVsCPiANud+b7PAVZA9gmJ+uxGlLJJToxOA+qJTqv24By
	o4q3ZN/DaLrAT07swEit1+O6e8Xb1cBxge3e3JdRZ6OhPH9SfJZ4wY6HTg14qtQK
	XuS66w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8he1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:27:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dfe47423f7so7280385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236835; x=1752841635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtZNijnRp1w5BVwcDMHaMUT6uupwS+ihEdb3Rm1l184=;
        b=vUrvyA2KVLDaGInuoVLWpwOZUlpssmY9PqD79HlvFG8E/cehJ3o8nITVtW3/myppt5
         6ehhgPf82MkTmoi1retXx9BqxwATqQAomkeL0TpFHRaPRdrxBMI1r5p6tejx8rnFCsSJ
         /r8hE/4rywdWSf3Ob+Wv4j8mIxX8g+uZPdUjXRVOifYgt82ZR25093yyn9R4jZhoXdhz
         27UDvuOvfvwGyHdBu0VnkvN4+STDTplEmQZGVbvBUsMtvdjp7coW9EdVAFP8vPM/sYk+
         wAPORzmkJgwRkJ4WwioclIfvezrIXavapUfMHp8qPbk3/lyQmPc1DplifIwcpfKSvO02
         P/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVcN58yrlP1kXRf0KjOMcKCAYOq/PsIUSJmkio10Lc6EMRNrG7tjxALWeEdiwPhRQLLtZJFMlaxzi+yFFPs@vger.kernel.org
X-Gm-Message-State: AOJu0YxWiVBF5II+EPk+/ONg2RlYcLAEhI52pgeaXaSt4Tty+i9hFoPU
	AMyjCJdfhJGZIBExkSb5FxqLhYJ9UH5CNhhmqthock+5B5TVYv/gOZJBVXz6WxxZ4/rBELhTjZv
	jJ6OURuIVCOWvG/dnwsulptnCSm+blsxwUsOvj2r5qNbP3GB65uvjf4UERDLj/F9kfNgC
X-Gm-Gg: ASbGncuFY/BFZjM1lJgEAKrNIa+QWzseiGRThNV882020kAN9jsfZZGzjxoGh2eZgA0
	7pSot5W2qsdE2LuwgCxJrw4xb5qrUO1XC4tWH2MAsz2AiDLSGRgpyGKa9PqvwyiYhFDniQAJSFp
	5S9VfxVasZ2H/jgd+SR1BpxIc3spWo3fWKgz59HqNPHYXvArxmcCr/zbyo5MIOW1jE3UaOVIVLQ
	KYFcsm7V1Qnty7Nj02ayLu+wqZYqD4aSXEypJtUdfHO27OnnMUmtJjZAdII8Nuw875CkyWtt5ok
	3QoLJwX9R8QhnwjgBewmLydtHKZomGURqtz6r8UunWXm8BHu/OtMph6/thOd3cjNuP7FJNfH00l
	P6NhIvBD3ZdZS1W4kf1yE
X-Received: by 2002:a05:620a:280f:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7de9784c3e7mr121622785a.4.1752236834650;
        Fri, 11 Jul 2025 05:27:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOEjFy6nozXjUM7q17Sb+shXEs+/L0eK/zLANGZuXGxAeetPAnbYDbefoGTuUvQLgTLGjhmw==
X-Received: by 2002:a05:620a:280f:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7de9784c3e7mr121620885a.4.1752236834194;
        Fri, 11 Jul 2025 05:27:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826469asm285169666b.85.2025.07.11.05.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:27:13 -0700 (PDT)
Message-ID: <82482857-2bdd-4739-9c27-ec3143c68a09@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:27:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 support for PMIV0104
To: Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
 <20250709-sm7635-eusb-repeater-v2-4-b6eff075c097@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-4-b6eff075c097@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=68710325 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=9PpJxbGV6q8lFR2oJlIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: -YHF4U1mHNf84okNwVjmYYy4pOB-FbIe
X-Proofpoint-GUID: -YHF4U1mHNf84okNwVjmYYy4pOB-FbIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4OCBTYWx0ZWRfX1C37BMFh1I8z
 4dQ27jlV4duZN589BEJRvbyP1yuPJQKR0syGbAeKzqoZrV1e+Ww4hMri5ycGZcKXLazus9+0fwd
 IpPa0QCGzpcdTUEPmMucu6+UfSsnXWFBY/mBxtBySX8BZVgVD0a94hO3DfCQRYNVH+vKRhmFZeD
 +DMG90quq9le1wFJljZ3dWz2reYnAOjn5s6RA7q8cHkpF74asF97nevieHL/fBSNWFRZ5JAqPi7
 beEILIE0jLbUmPtlWLWUp9pMMy51eGlS6zZ4E+Sf3UMGFx4cSLGMQQ3j+lSuIIF+e3pG7heD8Za
 xF0/aVHXrLs/UQNKq1LbAZ11sOrO9eNjn+hKew1A1sBSDwzCmT64blf0IQ6hurL9e0QQigpibic
 YHnUE+lpp6Xz9kY0MaFRvWz2PqbhnnwtYzG96ZguGkoXovR/Jt6U+0BbxAIch6HOAZ/hex9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110088

On 7/9/25 4:55 PM, Luca Weiss wrote:
> Add support for the eUSB2 repeater found on the PMIV0104. There is no
> default init table for this PMIC, just the board-specific tuning
> parameters are used on top of the default tuning values.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index 61594739e5b12706775622e1f76af6ad5d2d29bf..3d4cdc4c18becd8efd5015e698b836ad4d7cf18c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -82,6 +82,14 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
>  	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
>  };
>  
> +static const struct eusb2_repeater_cfg pmiv0104_eusb2_cfg = {
> +	/* No PMIC-specific init sequence, only board level tuning via DT */
> +	.init_tbl	= (struct eusb2_repeater_init_tbl_reg[]) {},
> +	.init_tbl_num	= 0,

NULL / omitted fields would be fine too fwiw

Konrad

