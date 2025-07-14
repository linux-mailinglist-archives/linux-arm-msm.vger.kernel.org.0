Return-Path: <linux-arm-msm+bounces-64789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E8B03AE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4CCC3BE826
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A140B242D6E;
	Mon, 14 Jul 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyXJPU1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97940241674
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752485755; cv=none; b=f7MFU7zhToO2LCTVYDn2HUWoffVfr2FGBh0YOaS1WJshG3qg7AXdfaUEkvMM2UOXPpUO9Sy7ABBoJDd/k69jFDEQMA2aeKH3H798seRpZRI0f7Ccugv65S3rZ5dniCdgb0wdnskAF+Be7dPu+5zKNyPuhwaqR7xBGGEH80V8cQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752485755; c=relaxed/simple;
	bh=ru+jpxSTrNborX2bFBxdcyMpqdQrMupwkrZFcVDWZfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jN0kaW6iNBs9iktlE8eSbfJh5+ZTZzFN6KCwvBC3aYV4bl9Tv6i/mnG9UwLDE2fkCGm3LD75d1Ug/D+rvvJwamGFT15P2zG0NT2FQb2M2kuT8MweqAFRTbGmTmDBzLVtA6kCYlSf6MO/+q8WhHTma3J/ekNww5aECkEuh7cN3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyXJPU1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7Qfl4008133
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=; b=ZyXJPU1SfZ/vrK2D
	SQlPwcnf+ETIFiVlrlCYhEPEph1lDrp55tR/MWPYKFySMiZglBnknHigufYreI5P
	86j8+DQKlXM+sLnBmjC/tGbvbjOaOw3irtcSodCZVaJLtF97IfBZMaEAcJoSgWzQ
	stVU8Mkxq7jJkoS8KO/ymb1cxJmCw1Z8yTRFgvLuxgbuz9dMpAODie684ugnbcyg
	uSc2f5kqEa33wUcdUBSRurmSjqUTS0uNL67XOFLYpSmA17e0qLtz/zzpWQdEURxs
	0f4tiXhe6EmuZDZV+ZFbaLJ1TQLQETZcEpnjD1WoRdrDPGahdHbFxsGB7Wx7Vrpl
	A7GRxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vwghgbty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:35:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so15062676d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752485751; x=1753090551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=;
        b=Q9VaKzuvqO0VSw3fje3glAROj3oSlDUDzNdzwdXd5AyTHr4f6qcf9uV7SBRpXjNPIo
         GjFRG0OqyPADJ6GRZ6PPktiT6TDnasUQ7bVV1LDAkt5okpLeuP/KCvOKYrhepVHYpKAM
         CyCDPSlZkoXCJkjVQ8dKbLx6UIj+/s5hR2oK9nrTvMc9g6kemJRq92e8Y9Zf5fVwOpHd
         cM/TUXdOw5trjw7abXhNbh4bHG7Wv0+PEeJwNAXZFFoDSKcsafLqPlQySv6tEgJMtoWa
         avct7JEuikAd5glY+5qshyehNXCWpM8YCswl2fn9rbV3Tuowc/e572ePU2YQAphNbws7
         oHUg==
X-Forwarded-Encrypted: i=1; AJvYcCVJx96eIK+yO/Vzae2QHSdLzDI6jBDcsa/JIFLHipWv7VixdOVu3Xc1/FablKqjUCIhjzmsBdckIVGk4IiB@vger.kernel.org
X-Gm-Message-State: AOJu0YwLY0eDKkijTxPDVYPP9i/YgS+ZUu4QUA7py6z43flDBISPAulU
	kc3M9vf86HgotPGB+4dBCph2sGZQtPbbpmLFAli7nu7KPaBqJU6l0WYZ5wCMTmNfM0zmnkF/oJI
	wciirpRayE0Ulye+SqZjKrCpY9CzMHe8YfAEOC7FmB/Dk+AeyU7AGisRC1KJfmae6/6Er
X-Gm-Gg: ASbGnctX6TurUXOvan9vCuS0PatyA5AC/YFASVaUNPgVEKv0enY6dF2dBTrNQ4xS/l3
	Ft6Vw1kDljZqerrDC0t7IhtceKe323HY25+X6XcGTdzjW6UCxZm726EbUgbdlSCljHvlVFL7ZSu
	M7GlAYzB7d6BIxjqp3CDCWL998Sv1QZ8ITJSqsp95O5C0YObSwX++bwWXM12vQ5Pln0SAxk9kCB
	/gICt2rDzD27fDsEMD98rBKz90ukJs96RPXhC8FSyyrpsWa4JJfXhLlhwt3+n8rXqO4foU3Mr98
	NCEkWK6KgOwL2oge1mOlqWv+TJcLPaBeROZh2BhAsqTlpFTGgfy71uygCBVbIJB1+dSXjdkWho/
	CgxNNBiDPXYSp3Rty3cRh
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr577280285a.4.1752485751124;
        Mon, 14 Jul 2025 02:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPBgHK2WKHaRZG5vMxzXtbPdkk1Lmydmr3moeXavVZ20BhmDNvzkpBN20H9euW8Kvu2AQovg==
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr577277485a.4.1752485750600;
        Mon, 14 Jul 2025 02:35:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90afesm796156466b.32.2025.07.14.02.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 02:35:50 -0700 (PDT)
Message-ID: <7e65f9be-275b-4760-82d7-679ba3d7ee83@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 11:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711131134.215382-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbLIQOmC c=1 sm=1 tr=0 ts=6874cf78 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_OLkaYxBag4VyamGeQYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bWtOht5CXtVWl5bxLxyitZmDOYRnCBBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NiBTYWx0ZWRfXy5YqijtTmqdB
 2c1y1nRt8ybaOJttJ/ehH4boCyYq2oLIEeWT/vNVBWOxPEO6X1Z6cUVx5E6ptlJCZP5qgdRO86f
 en6CyEXB+/lKZikFc6jGQuJFFlqec5TulAqBErBM6eeGWNoeuJKq1VclnLq8ltP3wBjpAmu4Mpz
 vvt4Q2tG8Y0tGMG06eFKoHgfMk47cGFvlvYXIRKJVBcI3egragOXAAyIjvgOOKN3XBCaSdFsl3A
 ykO/OH/A8AH6gy6equ+2vfobmOxE5vgG3JOz+ittRhmSiTkPwYowFiv327T5r5Gj7mottSWeycG
 11tONTpEY5GNRAb1D9zQkyGD0OaURlXKXKOlhbh4iCZhy3+EqDqVWQAd+4EdCOUDEAVq0/Jyxbu
 7mi83OEWz23KHvpIYE37TEZj3S8LXWUaDSNe1wnOofWATaRjkA9o/mc83b0u/5Y7Iwh7rOv+
X-Proofpoint-ORIG-GUID: bWtOht5CXtVWl5bxLxyitZmDOYRnCBBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140056

On 7/11/25 3:11 PM, Vikram Sharma wrote:
> The CSID in qcs8300 is version 690, it is same as csid used in
> sa8775p. csid gen3 have support for csid 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csid-gen3.c     |   5 +-
>  drivers/media/platform/qcom/camss/camss.c     | 136 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index f62084fb8287..581399b6a767 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -47,8 +47,9 @@
>  #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>  #define CSID_CSI2_RX_IRQ_SET		0xA8
>  
> -#define IS_CSID_690(csid)	(csid->camss->res->version ==\
> -					CAMSS_8775P ? true : false)
> +#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) ||\
> +				(csid->camss->res->version == CAMSS_8300) ?\
> +				true : false)

== tends to return either true or false without the use of the
ternary operator too

>  #define CSID_BUF_DONE_IRQ_STATUS	0x8C
>  #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>  						1 : (IS_CSID_690(csid) ?\
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5211367b535d..b0fd5fd307a1 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2269,6 +2269,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>  	}
>  };
>  
> +static const struct resources_wrapper csid_wrapper_res_qcs8300 = {
> +	.reg = "csid_wrapper",
> +};
> +
>  static const struct resources_wrapper csid_wrapper_res_sa8775p = {
>  	.reg = "csid_wrapper",
>  };

There is no reason to duplicate this, simply point to the existing
variable

> @@ -2487,6 +2491,138 @@ static const struct resources_icc icc_res_sm8550[] = {
>  	},
>  };
>  
> +static const struct camss_subdev_resources csid_res_8300[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}

Please add a space before } across the board

Konrad

