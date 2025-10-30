Return-Path: <linux-arm-msm+bounces-79626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FAC1F473
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CD13A54CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D3F31A805;
	Thu, 30 Oct 2025 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvFdDly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiAhaXjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE42F39CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816409; cv=none; b=pJ4UlRkOxy4VOjkBZxAkFnPgD5sLhDvG1E5lE9Gby49bPXhicKGAKk5eZbuXsbqUZYvCDCeeGOE8PGSiftdW885FDhlQ9wXPW2Kmv7MzBWM1rJi+IC+HacvnBGJauwVD4w/gsg2e+JtfiyBIpIILiRXxPGGvK49/Wxgct1mY9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816409; c=relaxed/simple;
	bh=UGkzncBmFT0Z8Xgx3vo5n6ftCbyEbJOpxTeyYrpQGd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vpvkby1uie8bAMUqRcURUgr6Bjljb8jRZT4SgUgHCwZf+HV7AUocHvfhJUWmL6UUAOX1TDyPSJDkDaTKmhJRZaXFWu/2j2eMJbA9q1gb5gW25/cLALzbyFS7iuhC3x/DOoc7ydSCFwo6DnkiD2/Pe0L1S5wubYx/jzHATwmbfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXvFdDly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiAhaXjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9MUls3115499
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=; b=WXvFdDlyVDlLgs24
	hRq6p+6qK8CV9lic9QlCuUfaa0N8G3YCqYN7vRhVoRwikaXnrxpBvPouyJN9TthI
	Rvvxg6gHR2/83eMMhgIKHaF/2gzjTsd0/pwzyo1HiT7DJWdmxw4zXGOxJzj75wPv
	MxIqgQRwirpvHbcGxz6Uh5x1NIHXK1NA5mM+EXNEXSpNYv+ArFuWKkIbnB6TyN+z
	J+Mh2nk3LYfSRxD1D/R5R5tkklf9An488gzGNuxoue23wlQwz+TJGmjzPZzFtIfl
	Ecw7mI8ytS+6TnUauCSxQKMRKMdlm9JUK7i5oHYuEdiLkBsiOgfN0108MZ76Nj9P
	ZeiYXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b400jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:26:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c28cecb4cso3150616d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761816406; x=1762421206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=;
        b=PiAhaXjPWbcM5m3DHUxh22vE63xOb9Je4/o+jQaTPkL1zeZ+LZVjnXGc0SSvjW7DYl
         xEL1oFqsFclsRFWNeBTyDvSA5MLA+zCkr9LLko9g1YbPfF8Y7j8n3KZ11/VwlfQSHDfc
         abaXySNacFkDoT/XZun2x97BI9L/EaSKr+jK2fF2qBuL5+v9hzrCURvvEpJyFc+jxhKG
         45Gqdpvzb25AGF6MXx5ftxjMjxTYyE4Haap+kH5ENJ1ej4d9phR634vcUEMBZ92NrTqM
         HmspI1p49ShYQJWMo+bA/R0H5Mwft5nhPNobUu3Ydn+xmynPXeNsf6ECxVc8RPnZWfJb
         s0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816406; x=1762421206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=;
        b=bidAl6bRjZtLKyQhcLGwGjy/lYdAdHqnkaT8G+SvUCAh7kDxJKnvx7jWfG4eF/NdwW
         xWeuovLZSD18H1SB0t1k0R2BwYLjigB/ScSUUbp8uREB8FUJpW4Q+Dv67j7L2znR5ZDC
         k0785QQV/0r93H/1J9hs9f+Rtg9FPCQ65Q1mtsPMipB14rck5llEyBc8naqxBweoDHaY
         mIebw/SqYF9ujdXBOTMEOuQiyQu7yrm4uD2IMmUJ22PmBcswm6tEWQr9KOj6TQYqqiXt
         +LDZaTFmP1FJJ/au6bcoso4QOQdMQsBVh24hpR91+E5ynz41659fB7fQ+0wgP5ZsavMN
         4krw==
X-Gm-Message-State: AOJu0YyJ2LO0iwdPhBu0/sBDsC/3g5ohEiPrsHDI4lA16pxGqsb+w8fD
	pv/EcMDvbRa6NKXpfvOewUpCvUNStpSqyiQYWArCmVpIxtxSNOw9ijFhsC4W53XvpX8HPchBXjx
	2/WE95c8Dvv8lzYmoaXkjv7zFjem7wLtbaVv4eCgwAIh22JZfyhz4RmpQRuSnhFZcFnCw
X-Gm-Gg: ASbGncutUSxx9RhSqHPSWbrtDYRpNIJkm2eR9u4/5U50TgYjxmd+MsqDGsZuskLSvqP
	rcKqjCs6zZLoJf2QT4SNZdl1tAYYKOTVjVpYkAXhwCPGGptVHRNIZmHrlueyOzM2TuYL5M/Rt23
	+NDL10yyoCo5z4kOw5n+8kOA0idCo2LmyudAArr0bOWzrPjG4hujuAvDktlAG/abUmwQ7Bwoiiz
	rubpqp4bP0y03Qck6mF/W+3HyuplOY4GBsSh4/uzEBQFGc7Qm4LSTiUmEahm6KclGVl78zvpiKt
	TjwyPOpAK1sLusP+8mOq4yUOqaLQH8UW3RIWnAwVrGk4/3wKYnn2X+mFK72/XlXV1KREWBsA59H
	BgalIvIOivS7K3K5oCAhNZHtgecwpUU5Z7lzTtjH8dSmjM1G41uiFpzao
X-Received: by 2002:a05:6214:487:b0:84f:81b4:4440 with SMTP id 6a1803df08f44-88009c059damr57947696d6.7.1761816406161;
        Thu, 30 Oct 2025 02:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENOdltg392rpt/C6P2DXClkaCW6AuvtVnIkahf+FfBy++WBa3yu6xR0D9iLMYKtJjowkMGMg==
X-Received: by 2002:a05:6214:487:b0:84f:81b4:4440 with SMTP id 6a1803df08f44-88009c059damr57947516d6.7.1761816405687;
        Thu, 30 Oct 2025 02:26:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f9a0fsm1679780866b.50.2025.10.30.02.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:26:45 -0700 (PDT)
Message-ID: <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3NiBTYWx0ZWRfXwVN5O4fDInu5
 uudavYjR10JXTmZMRzMa3B6v3dhsPJ7QG4yPpeAunJL6HiUUrrLSyx/NYq4k9axruR/Z2L2mNRP
 OrNDT8LFtnpIxl5uvjBehB29HZXxn7RtBCU2dYEldyQg/7cCNdHxuPgz4NPTgh8bFlXcmyLcqmV
 jAynklqZA0HVuFzBQX47dV4RPqa1xqiBzH/WUN7S6xDrF/BySAlB1sb3Ws46m/b2SjCVBsFOnrY
 mkk568IHejRUfJHwpbe89ywE7rW4u+p2525NV1NorLTo/C3JXAx3IYv0dAhk/NKIVl8U3vP/A9F
 EA/pApcmNcPyoBbrMWCrKAugyvM6VmuYlTJnj5tjLgRI52s1zeDSgH8u1eLNpY2RRnAyNkQhP8J
 j/CuhQKaEX01Jj34kWnl1e67tu3sNA==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=69032f56 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=7QP1INNbtZu8WugdpZMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: g9XVwYErx_XA5f_1tIIXuJu30wEVifEM
X-Proofpoint-GUID: g9XVwYErx_XA5f_1tIIXuJu30wEVifEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300076

On 10/29/25 7:07 PM, Neil Armstrong wrote:
> The I2C Hub controller is a simpler GENI I2C variant that doesn't
> support DMA at all, add a no_dma flag to make sure it nevers selects
> the SE DMA mode with mappable 32bytes long transfers.
> 
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 43fdd89b8beb..bfb352b04902 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>  	dma_addr_t dma_addr;
>  	struct dma_chan *tx_c;
>  	struct dma_chan *rx_c;
> +	bool no_dma;
>  	bool gpi_mode;
>  	bool abort_done;
>  };
> @@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	size_t len = msg->len;
>  	struct i2c_msg *cur;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);

Not a huge fan of putting the ternary operator here, but I don't
mind that much either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

