Return-Path: <linux-arm-msm+bounces-68652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB77B21DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB4B18827A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A75729BD97;
	Tue, 12 Aug 2025 05:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U04R24ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1E29BDA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978349; cv=none; b=KxowLmrqSLRZajcG79xxd0TX89alXhK+DiHrMxp5a4fI9m0Tlx/ovEcbEPfry4inWrjEIBQ+c8vn3m5NLk1/Nlq8krXH7c4lldMaiYfFAZ25du+y7ujcv2E0o4nRrXKuna908qu8rCWkfSjI9nqcJJJX0IX/HW4qi6JpjcNODuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978349; c=relaxed/simple;
	bh=ue4b1D2uu4Awy8lLm5SVdgvDn9/ktpqESG5Z0wrXMrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqmGbYv8ud7yi8+fqGagTRC7s9Xb/pD6LQsODBMKlgiWtyUP3Hl2U0YlkjjS755nwEGPo042d1G92gtIynRUNPa9Bf3Q1U4TGIRwmJis27GsYtvXNRpI553HaEcc5uZDXYBB+K/ZoLLVj5OwcqABBfd2b87irIFfBhqO7KOfOEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U04R24ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4TuuG028799
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOXE9MNO11AvtJ2FCkQ+sRifjq8EJjmsltwKqyVWBgU=; b=U04R24ph26eR964c
	RMgEF7qoJsTaXhMNacIpqZP9Tw2valxJYBdGsLjaKLRH897v0rU2TFkXkj+fZGAl
	RMKN4DXcCjsObsNUc8PcSd0gUfAW1Gm9/Www96nl34S1FbpWhh3Anc/7ZysK3yJo
	NZz0R3XcwXWedq9CZa8cDsaqBKTPzvzJGczykBIWCy6OWiyCn+PHpzo9AGmq+VZp
	vflXx869uti571WUarpN9HAKhIW3isuoLfY2BSkYspyBEsdLZnmLhcaSPYuAEqdp
	jnZOxyZRtz19BhLAcnaIMODynbZVTgh0waQ9B+RGmLV4C3iF2MUcWQzw0X61zkci
	ZoudmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sq55t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:59:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fe28867b7so68685515ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978346; x=1755583146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOXE9MNO11AvtJ2FCkQ+sRifjq8EJjmsltwKqyVWBgU=;
        b=rSza/OC7V7qcyUjKgPqAfzpIhOpF5LT4ZeXl/SDo5xhZO2uwb6Suu/que+etgQX/SX
         CHZreJRUyHEnNQjujlVIL0QkBPagICgloF6lIuAXjBQl7m90Q1otJAHswFxYOi3xORcH
         8qNLdWeKamfBaUUaC86/cuJAF0WU5dQKhKZgYM2ljDAHa5e8Uh871pi86Ul3sKiM95gl
         uomQVlhGsqq0vPVt+iPU/9rK44vpfOVu7zW2ZAzGLdDwKb/SG16YRKB/7DoWxSV3+l+r
         mnJkpA1nnfkcHZKqU8MPr1fQ9Qv1iJHmKtOcISIo6Oi9vZpBO7/btQG5Vya7gwOQmfCz
         0soA==
X-Forwarded-Encrypted: i=1; AJvYcCVaNuvwDC0aIX4RnEXlk1QZ8phEohEVeGvxJgxfses0mSM9TODgCjJH8w3k4kEsNsZhYNkr/yHDX0VuVGqN@vger.kernel.org
X-Gm-Message-State: AOJu0YzF33VADJ5CNq0/7nvU56TONawFyHVU4xBoXDWX5EoVZG3QduJC
	Lt5xdzhunMmSSOZhSNCiqxnCO0V/EGTMX4aPrIxKIf0M14lLNsGjeFEon7q2DALtKq5MFOJGfRk
	JYE37A+ocHipvhPGQ6CuPbcwbxHLp2HTBexYHnj3JxCFPnRV/umXP6rEgIBZ9KgKmlGP6
X-Gm-Gg: ASbGncv6v7kKjB7AZt3Tq2VIMhvWR+ZQbXdEfWWX4tMzxGfnSNXJU5WeLCKW5fWTwsj
	3GzOVQWXqL95ZFoaKbIrUPglDCN7+735DAzj+4jg2lTOeqTTzWg4I5K2jXgpuDf3eScNbTo9eON
	VwCzsbd3XMCupf7U1/7WDqAnqitgQPTWKaQ6lX8jUs+INtybyxcIkdbxfP+t1rdHn0bmvJMucWJ
	/k2weOkmzX1m0ModxqWHuir3BbQl8EWmxi986v76cfHaVZh9wVyGsVlL2i+ARj3tyfZvPKII/ax
	zlOaqKQZuHa82FLJsACP9G/kdbHs/9vtTySakyXXrmpK+vGmldOtxwdv+T7TkkdAB8jANvk=
X-Received: by 2002:a17:902:dacd:b0:240:5549:7094 with SMTP id d9443c01a7336-242c200e82emr224518215ad.18.1754978346006;
        Mon, 11 Aug 2025 22:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX0c7+1zMTIBtfK/B52VR4L4RdKkG5Jv47XKjyW5YwjgzPLE/21ZmRClHXGIpYpgq6/G5jkA==
X-Received: by 2002:a17:902:dacd:b0:240:5549:7094 with SMTP id d9443c01a7336-242c200e82emr224517935ad.18.1754978345535;
        Mon, 11 Aug 2025 22:59:05 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-242fea29f1fsm8786145ad.99.2025.08.11.22.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:59:05 -0700 (PDT)
Message-ID: <4b190271-095e-4c6d-b823-e4d3c9e15fed@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:28:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] misc: fastrpc: Cleanup the domain names
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-5-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-5-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ad82a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=XdWXSf2iVvfrRCFRniIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SmARm0cXJB2cnvCfT8mWkrhwhfqSkVLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX05+CqL9v/9Az
 xnas+5WFmvFPttfoC9olK+Qm8iQSy7HSAOw9FShsSDX/K4LbRWmNpkVKK7uo3R+4h8OmNN5bIZr
 OyhpEFA24EFQkAlwKkE1GqXeNrOFpJ9lWc3xSRaHaETpie168JE4ZDIoKaaUdvPrXGSuiIOjVwF
 y5/xkeG5Toj4Vqd4R3cvp95tv9HNpfXkODWDGxIcAcLUYvJEz1htreRnUjhgse6GjoFXkgol7Fv
 X4TZIV2/+sz3MgCGt+gP7g3WE5RT5EbEmzimkXjg5o6ElHUSCD+uWBp+Q1EzZ3VwSt958IpGayP
 +fa/t3e18nAuQuaLVQePZq+06Oi6rjC5oaeBHgw/zOln9o17oPUKbHLxSM8EZ/FkhBmcH7g3IKV
 JBgk9qF1
X-Proofpoint-GUID: SmARm0cXJB2cnvCfT8mWkrhwhfqSkVLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 495ac47e7f90..85b6eb16b616 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,8 +27,6 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> -#define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -106,8 +104,6 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -2243,6 +2239,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>  	return err;
>  }
>  
> +static int fastrpc_get_domain_id(const char *domain)
> +{
> +	if (!strncmp(domain, "adsp", 4))
> +		return ADSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "cdsp", 4))
> +		return CDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "mdsp", 4))
> +		return MDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "sdsp", 4))
> +		return SDSP_DOMAIN_ID;
> +
> +	return -EINVAL;
> +}
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2260,15 +2270,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return err;
>  	}
>  
> -	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
> -		if (!strcmp(domains[i], domain)) {
> -			domain_id = i;
> -			break;
> -		}
> -	}
> +	domain_id = fastrpc_get_domain_id(domain);
>  
>  	if (domain_id < 0) {
> -		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
> +		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>  		return -EINVAL;
>  	}
>  
> @@ -2318,21 +2323,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP */
>  		data->unsigned_support = false;
> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> -	case CDSP1_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, true, domain);
>  		if (err)
>  			goto err_free_data;
>  
> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, false, domain);
>  		if (err)
>  			goto err_deregister_fdev;
>  		break;

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



