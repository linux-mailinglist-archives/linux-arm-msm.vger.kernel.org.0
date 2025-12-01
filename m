Return-Path: <linux-arm-msm+bounces-83947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414DC96CB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 12:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6665E342F75
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 11:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5423043C7;
	Mon,  1 Dec 2025 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMSsU2Br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmKIeHBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3DB2D0C9D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764587095; cv=none; b=bzxzXjNqZEEHkIk1u5az6UFC03vHqsy5vlYOxxdWFUePOpP4mJ4E/sJSAiIL4Ofd0obN+5b0B0uV7ctS3X00zWVdOhwSiY6jAXLfTSxae77HuHqXRoM8LeUiuQfJ1OCt6wG466LwFm/jG9ooQmXHf75YwwPSAddl0MgggkVppf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764587095; c=relaxed/simple;
	bh=fjKjrLZk7uj5gaFLc+nEjLQA0joiVJDR/iCd9fUsgqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bl7NeABSinIbnst837N8WiKX/z6uqnYalFRkmKYrx+0e7/0bE8bZrRginkXgRKNcvNjE9yUVZk5eSbKC6TLB+KGN7JNsPGniWGzGSGVYK7nfvuPWMqYX81j3S5xsZlUpNbWM9GXC+/swIITLsfw9iKr1VUbK02MSHp5+F9lxysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMSsU2Br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmKIeHBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19MD623362010
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 11:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJypT8id1riQxvc+MHEOuWd2vICcL/EIKtNcIwKmsoM=; b=GMSsU2BrV2mhN26h
	3+FtV/ogIYdL8StoNrCHbFJhgxHclji4RbD8hfjvHA0oj53h+w12OUVig8UwMVfu
	64V6Er8gRJhKbAzKw2wAv58+0bsxnXXQzIVw+a4JKrPXJWby7mUo2AXr4e1UMRuo
	QZ1qn74bYGCv5ezV+n6QK4o9vD02TtJT0LPI2Z66YpbIB+KJ3us1HvxKW0wOqm2W
	PUtDy7w1D2qwqsrZmWgjhpEYkiW63y6oOOLudGdRKPgxIstP1YJrKRdbowatj05Y
	x1iwwifOMV5c5+qdj7uYmPI+ag8cUcoRmEbONblRh+ltGDAPObDxIJPAIyrU5kzq
	5KRPSA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b009x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 11:04:52 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9371a5de388so1549035241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 03:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764587092; x=1765191892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJypT8id1riQxvc+MHEOuWd2vICcL/EIKtNcIwKmsoM=;
        b=SmKIeHBAwAAK85D3/F3yu1MP1bx6ToqE4RWai/eDOOfPRNRDUWtASbHYBd1RAYIeNA
         HXKDBuwGbeq7UwJy7WS13Lqv5eBVwFfzUUSpmZxdMiqQezePS1joYvWbs3uV2WgS98sa
         /jHlaDUEERgj1Wp+wRc97HMXTjMW/achKBX2ltj0w1/Ewh1rH98e+95JXUmPlDfV8e8B
         F2lJzr85pkY1vKT7icnoIyZIUrfZdr/hpGg+mNj7/XA0yFVpmNK5oMgHsU7E/eyg9Vu8
         mENYW73f7BYUCvy3/Bc3n9u6XTsWvotpdgC4MKwH4zf6oJBUhooqxXNFm9cl+VZzlwtB
         egjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764587092; x=1765191892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJypT8id1riQxvc+MHEOuWd2vICcL/EIKtNcIwKmsoM=;
        b=UCfIaekjSwYcTIQsnU39joMaH3viTM8DXUeh+P0qDjnvhwqwaNKXc4Yqs94itnb3mk
         rhqT1bYs81q+9s5/Dk6TBfQ6pclYLhpWgoCvdZ/YAbzwzuRqU2OBJ0Mii5Vgd6CH61tl
         9uUMxI97UvOljppRCvDs9bbuD+p204l59/dpo/vwvrhxd4RCs//j7xUQ2Xzc+3YJOlhv
         vkVs/QoX2ddcwFCll+03t1CLWZk2TQDfzIFVaLUNHF3zn+j61sVek20i8Qyx2vM0UoxD
         chCRcblX4AirEyTnxWR/CVHxtJCJ0DWk+RhjdV3V0HL6z1DrsoPVpc1HXB5kwcLrEwiW
         PUgg==
X-Forwarded-Encrypted: i=1; AJvYcCX3AAVyMRc5JaiOaZaS3PUUl3YyN5ZhdBq4H1pbaXIYBRcTcjXleokeVtzcJVXKcjXcmOwWspkjYa25yMEn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+mt/G3WmHIoC2CT/Zgc89AmiFOEx5IGiMwpMtwRCsck17Y6hF
	xg92xe+wqzC8D4/O14c5JhXRFrs1ZCcz99Da47rMlBb1HNpIwnao1PCPKALfdnFDt7yVwUtec7P
	auuAeuNuBqusCm2xpG4CRf169eXZSps2spRLH6Uqz+zmaJCylUENXLlFm+BlTasAmxQp3
X-Gm-Gg: ASbGncu/CD/jcyqf6xcKKMZX5I0xlCOB5MKzclBXdIdKFzRpKHoRD6eYQ9rUz9/rbPa
	hHIIhqNDidTTG9kXO3DenpNfgLkC1RPe3fEw/j22/YSTgEIqN9syJ4/Za/0DOj7xflsLxhC4DpC
	RqwM/+vZHQfL1/UFxVq+kC6bTPDO8obChMELe7wIraSB3ozcxVGy+GZSXJ3q5Y52l1dAJcdyVmO
	pFTh7KIabjmSaQZfyvfJdsYjA9iJ5aADqYQmC2UIZxC9B91ueuyBfNtijStsIoW64yi/H73X0l6
	c80zKcsNGhK44gxowt45Q8pb7wmQgKlQGuujI0JgdLw9nUE8OE23rH1FndScHlr6aJUmN5E1hUU
	fRkcVQwM9oKf335Y7yanau9ojBs3DgL1hF25R
X-Received: by 2002:a05:6122:d16:b0:55b:305b:488d with SMTP id 71dfb90a1353d-55b8f048ef2mr14749615e0c.19.1764587091925;
        Mon, 01 Dec 2025 03:04:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1fzqTcIhPwBthwPI9sIx98IGlGB3LqwjOOm8jqI/lDrPl0eIFqJ9aVKPC/Rt1exyMotDgGQ==
X-Received: by 2002:a05:6122:d16:b0:55b:305b:488d with SMTP id 71dfb90a1353d-55b8f048ef2mr14749560e0c.19.1764587091478;
        Mon, 01 Dec 2025 03:04:51 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm25783091f8f.34.2025.12.01.03.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 03:04:50 -0800 (PST)
Message-ID: <fba86e25-3327-4fbf-86f1-485bbaeec32d@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 11:04:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: Use guard to avoid mixing cleanup and
 goto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d7655 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lK1EhxQaTO3hfdUELo0A:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: _UrCwUeaIUWxdpPSqNQShzH-K7vnDlVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA4OSBTYWx0ZWRfX9MAcXduUe83t
 tnDbr8OJYOt3G3hpuWGMyjYX1YD6BPXyilHO6Ex7JEuh2UoYftKeHxg1uOKzyB4+UQgLG/PX7kv
 g/VTaA3vb4+UQqnVac2E98CDhepZS+fkyD+rd2fS1hPPYFbsb8Z5vXE/MzKDa3F4fUf7IISeXdV
 BVTkB10FRJE4G35RCFtaHbZoahJKfIK4e+Dy6szYjQUcpbcucRxlu1gLSzlgKJJi8D/cTQqnsYr
 kELhDl5NuemcRZZogjL3jpjRUWBi8Ax7ctN3LWriIIorBMJ1KeCVpkacsdxT6aJ+NEzMkv/QuEq
 Me8coAAavWh9dPdZmzoDkhibDrtEAN70EncumCnK21/2d92ZBsY82/YvRoG+l/5/S+I7b5sa8D6
 v2hPIaoQaDjllQKhtMqzJW0RAqzkzA==
X-Proofpoint-GUID: _UrCwUeaIUWxdpPSqNQShzH-K7vnDlVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010089



On 12/1/25 10:26 AM, Krzysztof Kozlowski wrote:
> qcom_swrm_stream_alloc_ports() already uses cleanup.h but also has goto.
> Such combination is error-prone and discouraged:
> 
> "... and that the "goto" statement can jump between scopes, the
> expectation is that usage of "goto" and cleanup helpers is never mixed
> in the same function."
> 
> Actually simplify the code with a guard which allows to fix the
> discouraged style by removing the goto.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Thanks for the patch,
LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini>  drivers/soundwire/qcom.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 17afc5aa8b44..8102a1b0d516 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1228,7 +1228,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  	struct sdw_port_runtime *p_rt;
>  	struct sdw_slave *slave;
>  	unsigned long *port_mask;
> -	int maxport, pn, nports = 0, ret = 0;
> +	int maxport, pn, nports = 0;
>  	unsigned int m_port;
>  	struct sdw_port_config *pconfig __free(kfree) = kcalloc(ctrl->nports,
>  								sizeof(*pconfig), GFP_KERNEL);
> @@ -1246,7 +1246,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  	sconfig.type = stream->type;
>  	sconfig.bps = 1;
>  
> -	mutex_lock(&ctrl->port_lock);
> +	guard(mutex)(&ctrl->port_lock);
> +
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>  		/*
>  		 * For streams with multiple masters:
> @@ -1272,8 +1273,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  
>  				if (pn > maxport) {
>  					dev_err(ctrl->dev, "All ports busy\n");
> -					ret = -EBUSY;
> -					goto out;
> +					return -EBUSY;
>  				}
>  				set_bit(pn, port_mask);
>  				pconfig[nports].num = pn;
> @@ -1285,10 +1285,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  
>  	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
>  			      nports, stream);
> -out:
> -	mutex_unlock(&ctrl->port_lock);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,


