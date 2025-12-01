Return-Path: <linux-arm-msm+bounces-83973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A8C977AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0383A682E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009A930FC2D;
	Mon,  1 Dec 2025 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDGZCW8g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnCZuVdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A755C30FF39
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594221; cv=none; b=ulgz+s3IBCRbBxLZGX2G1OE2co9qOaw+2VssHrS/cJ1+EYnnE4e/J2+mGUjCXV2XvXsYY/iZeaUub5j/kRb3VsFP86WjFfnI9OiFRqScuWbpiOz87wZnCtx6TKluUdN52OlMVErW/44VJkJXPVyAvEdPTBzuDqPyvOwi4NH1uRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594221; c=relaxed/simple;
	bh=mQiRzhVPiTBI5fhfG5QlYmYGwxQKVPYJzIQfa/KT8TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch6I0J+avuhYeOfrOefdhCX3HIbHqMUnN/PFUsBOBHyB2z9fjzBVwh361+RVNmloCWENVDi00dcu66qHSTYTEHH67ruUGPxlTG2shq8z1D93B5Pizkr2ah+N6aqMWqKMVEPvBvTXjXNROILnAAtJFX3y0UZWXG+wOdgZtS47JiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDGZCW8g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnCZuVdV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19Zvpo451735
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ctg+o1lzozlYykOwrPvWfRQts5DzAQREjfwDpCaJEFg=; b=KDGZCW8gOwA5z+dU
	7p+aW47KzL7MlgizscFE3966je9YM+dpKsgar8MEH4sqByEgwL1+J9jrLXceq7eq
	TJyhdYKf6ye20fCWdgnOBcNlFGwctx3HiccJhjUkRyJt+KIm0lCS7wAIvbHeP6bh
	/Pa7jVeOs06DEfVzCkrsO13MIyQFBguVgVdkliy/098XcPRVkPHHAYxFmE/B6GVM
	t13lR+epDg0uX8tjgzql64RjdN73HxOp8jPvCw4sa1f9pM3hytFoT5xKqAHdLfGQ
	bTasuVEGwpElWGthBheU5BKFllo6tc1TJmeflm2de/0jH1KQQvlO1Sx/9h5qYmlb
	BBOhCg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8herhxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:03:36 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-640e5edbce4so710501d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594216; x=1765199016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ctg+o1lzozlYykOwrPvWfRQts5DzAQREjfwDpCaJEFg=;
        b=bnCZuVdVtyAj7uSPNiP1p5+YTo75ZMfeGGDSosvpGjZSmpR3ZYRb8RKhkv3NGWA+n2
         xE5QEjTrmQAIm8hZY4cGvQHdP82ocAq1g0XHWo9OKw9im8OA/Wn585+0js3981/XfFuM
         tUrT0aGRLYkgJ+cxvemkCp+r+NKo4PC6lMsCzY+wtmpTHjyUBylxCB9VhZmD5HElgxfL
         uILgdI9ILmGwRUQRVk0tH1dQvFk/bwEtOj4oy4Ao9D74/4mWJfF04xO9eLvLpW6jxLwu
         hjNq0ZikDETUD9XXbvt6RQ1SjQBJq4ApPzJ4RgF6WXqZEQdw+elpQljF2Jyru4WikMP6
         Fo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594216; x=1765199016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctg+o1lzozlYykOwrPvWfRQts5DzAQREjfwDpCaJEFg=;
        b=aKNPSI+1dtMoaurnwJuaVmpDkOXqlpaws2+h8Pmtixk/jpLb/Z1moyqyp+65ND5Kty
         3zKBnu182zAiGpt9+ld56lAt+n384Ynm64yYoqKJTp1G5PGWSKkaLm+o7GvxhN3OT/2V
         9bOnMXG8ohY232Xvt+Ca+exCrmwwOvoFeK923/38skjeEzWu5ETpuRAy/dwi5dOafDEQ
         YEzypPLoGO3JJiYhXxELTu//LcBAIaVfrbjwpZOQ2/JzbDXh5BqoZo58EW8cC/5YtK5e
         3HF67SWJIN/JEyb0DEnAsBnrF1lfHp7Pp0Ue05VDmj3Z2JZZKTm9zc0Cw+y8rerx8qkn
         S2NA==
X-Forwarded-Encrypted: i=1; AJvYcCVHtlp0GeHouLIEHxnVpvegGb0odwckvepACafUa+gSGe3p3AubZYicy/vULEEVqHfintBiG1T0zb1f6HqE@vger.kernel.org
X-Gm-Message-State: AOJu0YzkqQaKGl6wKVdL2Lyz9rM7R/1DYeMB47Jgeyhte9iJhawU63w5
	wAfPLwVEiBE2l/cGJNJOi2Ui1VWIW49qMhpY7j484zFXSH+OLDn1bIR7nWK/+l8tLeUvIt6wNzL
	no3WpiJRqJLHj3ijPTQSOhGz94+Lb4PGdAICGxZpxQNUvZuyl4Xabb3tzkYnWUW7EtiAC
X-Gm-Gg: ASbGnculHMVSLfL1ZozAeFefN/JG8bJwE3LDvn5pNdSIMPPPjloQHaOR032DjsIEK7c
	rHqOKrTDv67jhdzpIruBikdZlJ0wx+xFp5ni+Dj/8lLlyIAbjuKT8Qkc5n5IPAnM6AE1+N2x6Tf
	AkUgDJ8WCRUXRu3LxEqUUH8mTuVSod6NOvg6mGerKVPBV2db3k3PXvmS9qDPJyMuxaHq/v2NTM1
	DH9uJI/omiE9Nw2mu6Ar53v9ShnFILD3gfhuUR2MJSEKXO/IYKXAmuhmVZHQdygD5lvQJyxHftO
	Oei6lp/hwGsk+d4Df6D+jhZXHpu56TOm+xpd+K0v/Rvw+eQzLhJIDOyhmvM6tKdCMlrZGonPJrR
	G0HSER9si8yWK08Z7Xy/7ETDAP6gjl2d/eqbtv7AhYq3xH9IHT+oi7fhn/p7iSk7LWzg=
X-Received: by 2002:a05:690e:154d:10b0:640:d0e9:1d7f with SMTP id 956f58d0204a3-64302b44480mr18940970d50.3.1764594215409;
        Mon, 01 Dec 2025 05:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqMXMDUrIWgkKWxZqcL0dH0seGl1iVMJGPq0rXLF1jLMt1txAJQwrRO9ii3mNBnFaFb49pNg==
X-Received: by 2002:a05:690e:154d:10b0:640:d0e9:1d7f with SMTP id 956f58d0204a3-64302b44480mr18940933d50.3.1764594214730;
        Mon, 01 Dec 2025 05:03:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062709sm12436798a12.35.2025.12.01.05.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:03:33 -0800 (PST)
Message-ID: <c15e156f-fd11-4d38-98c0-f89b78044407@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:03:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/11] crypto: qce - Add support for BAM locking
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-10-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-10-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692d9228 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=SbnQZzZDCDfwX-qd_CgA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k1eyIGFJQzPrBcZvb0dzw7RVcSnYeGOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNiBTYWx0ZWRfX42+Da5CFeaLs
 o7v+cdnO3wHoGdDwIpB4Ber0epAI3GMuRfbms9NwTjW8EcKhK4uqsQQl8jDJfp5Uz6w0POslY6S
 Y+UArZmt468jaUv4eDtbjcyG2WO50GH4l/pIRESDIChlyAorMg19dppBTxMZGY6jKzFs2JGUupC
 wWP7kql5qh9yqD6c6jirQ6u85i6J4Y/KYadiA8PlHK0h+u/nDEyDOGPNroX3GM43TZfOmAI/KLL
 2TUAoo7uXGhQ1w8vGsV5O80PEbtnc8hmCD1vHUbuSCftD8eT3g/0zvJ4jYxCvTbpDl9VmZVmwlu
 9qZd2/rM9hweoyVIzHxNQCHTsKPN3ZegDtMmUyn/XLfl17daSp1PSRZLCJHoWybPshFxqKZiGcf
 VPNgazC9BEKMOx3sPrkEWl9gvx0cNA==
X-Proofpoint-ORIG-GUID: k1eyIGFJQzPrBcZvb0dzw7RVcSnYeGOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010106

On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement the infrastructure for using the new DMA controller lock/unlock
> feature of the BAM driver. No functional change for now.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/crypto/qce/common.c | 18 ++++++++++++++++++
>  drivers/crypto/qce/dma.c    | 39 ++++++++++++++++++++++++++++++++++-----
>  drivers/crypto/qce/dma.h    |  4 ++++
>  3 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
> index 04253a8d33409a2a51db527435d09ae85a7880af..74756c222fed6d0298eb6c957ed15b8b7083b72f 100644
> --- a/drivers/crypto/qce/common.c
> +++ b/drivers/crypto/qce/common.c
> @@ -593,3 +593,21 @@ void qce_get_version(struct qce_device *qce, u32 *major, u32 *minor, u32 *step)
>  	*minor = (val & CORE_MINOR_REV_MASK) >> CORE_MINOR_REV_SHIFT;
>  	*step = (val & CORE_STEP_REV_MASK) >> CORE_STEP_REV_SHIFT;
>  }
> +
> +int qce_bam_lock(struct qce_device *qce)
> +{
> +	qce_clear_bam_transaction(qce);
> +	/* Dummy write to acquire the lock on the BAM pipe. */
> +	qce_write(qce, REG_AUTH_SEG_CFG, 0);

This works because qce_bam_lock() isn't used in a place where the state
of this register matters which isn't obvious.. but I'm not sure there's
a much better one to use in its place

Wonder if we could use the VERSION one (base+0x0) - although it's supposed
to be read-only, but at the same time I don't think that matters much for
the BAM engine

Konrad

