Return-Path: <linux-arm-msm+bounces-99185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAZMMUoUwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:22:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 451032EFEC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCF5B3006507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3B386C15;
	Mon, 23 Mar 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtqCEXFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjGDjCIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A23386427
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261020; cv=none; b=EZX8sdsEg83TV3uxWtrC25lau8RP7oz9deQo3KiF0PEK8JXCCh7RUaaFoStg7hkOemLrNtejDp4D5lQJq79QiEXvPkI/yy9+CIx44VeGmakHwUr94SQuRqYHl8DvNcdn6dTCFZ7JY1456i+fi7p10MhwvLR+7fcVZg/d3tCEIg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261020; c=relaxed/simple;
	bh=wM0p82VmtjZI7Nh7gcp93z4gdR/Ptn3A1EBzsPgHekY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2EmqKTsKfSrKn86kW64qZhMsSfr9wtkHpKPvzSgOLRBXhjNK0AKwbZgRJlR9Lu4YUa0OnbNBcbvkcjlSlR2StJRRaZcgPZY6++gYdCLrkx1B0JHtYZh4DbRi5RTfCnw4zTMyzYhc9ry2C1khjY6MiM2oURSzIovbuQXnXPyJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtqCEXFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjGDjCIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9YoXE3685978
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5/7nvkw8333ePyXlqpNRBwGTJFBf1rnxeMIZQvJBQA=; b=PtqCEXFRke0ItJ4x
	ajj+xSzfnh7m7bfJ2mW+6XLTNb7eHAx4WPGVn7cv+DD+cERLYFay4V3OkCUJ8aLp
	0pgD5749hHfdyC0QqvszPtYMwBDrT3D6Lt6gGUAJPY3GCx26aBOqI1Sk/ZDjkNRf
	uDsSalBOLsyu3FoBuboICY6NwOlQl/qZV6psW9sjRierxrS+x9S4tuax6nZtJfue
	wzqVWgL4SdUExnmXQzwhfNoe+qJBj2AXYrYLV1fA98JS9UjzkllkBD3xxXO9PknN
	iUGCu0dJPN//JrG30lqUCA/H5mPyudKQnhrOTMNOC9FWTkv39IwBsB355UUXGlfA
	Klbp9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5vw70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:16:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so39822951cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261017; x=1774865817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5/7nvkw8333ePyXlqpNRBwGTJFBf1rnxeMIZQvJBQA=;
        b=bjGDjCIfpA8xnkbARjy9aMlunEh2z9OMV+5tLDDmSzYP8Bh+tvJn9oEftYmjyyWSSP
         HnBz/CFVNCL0ACSDnl8lE9b94Wt8vPpMDruDc2C0iPPmsTaRZttKMX932jG9AZ50X2SW
         BwvE7GTUJSbTjJkmtIuM0hWwxCVtYd/sJKtaIudLHjh7D1Q5fr95ilncD++smuqEV87S
         pwPvZbVsmia0ADLXpEdSuU9YltpONhpmxsUcJ9vqHzViTP9LH+ecdcE3it/EIiT/eArS
         IRgv4FOyL151JnZ6cAQ51Kt+YEE+O0dSy5rEGenXzR3a/215/iauNG/G7/0l01Y86nxx
         COHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261017; x=1774865817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5/7nvkw8333ePyXlqpNRBwGTJFBf1rnxeMIZQvJBQA=;
        b=aUkttF4PnQYB8O0yK2tCwKKWO2dr4rOnklBneP/HAOZVgI7KM1gwV38WGEr1RszpFk
         soalmApRHPqzrACRkLqixH3rhtH4gbtQmeEIo7h7U9wEYJRSC+3LVcQvXzHFeGl/Ucbo
         JdP1QAZHodeOmOvk4eLp/s4CntGpIzVC2nOCe+PQQrmwTPxd3gACcd9yr707YflDXfhL
         4PqFgNKMz+wyYxxsxwIkPHxSRxs76sHS0pIsdIJ28NwwfbCtBvt0e835u+mU0MUQY3gA
         AMSZzng8Plz2qpz+2e8x0gdyWXKD3lHUez58Hq7sWRIM6vRWh4VnWx75kyiO/klasetW
         fjCg==
X-Gm-Message-State: AOJu0YzpI5ExYhrMlIBrNcCsPtJIVdw4I4EAH1/w6s6GuWs3Tdl7cuAj
	L0sjEmTeJyXs4DTjzOhjXYgv9CwfN3Mt3Co5TVh8CvMsl8r0E80iwe10AD8MXUxxrizwabt63HI
	MT7p4a9bWsBE8F4GCzzOPL9t7cQMM11XrwGEXzOZPs9c9a1B52Ncz/vJ2D2mBnXq5AhpB
X-Gm-Gg: ATEYQzwc80Ii6ftgZdu98qrmnkEIrRWAaEfVPbiBB78cE+/nlyw8K3Lbbpnz3nimIJm
	xxL2SAaXQ3k3NQ7KvCWNjwijB4Vyj8iZ0sBMp37I7B62yHLhE/87fqOeSv0hYmDUkT+ARGZGRfO
	9H+scLDLvYR+4u4sKbgrLtckFYoNfmiWMKOJ0DnvJlftUNINuJ77h3qIZQuF+R/yBKOac47nwVt
	6lGmK7mmxK+4gSKtxA3lYRTIheul0PpuDnN2Xr874tW7j1mI7n75CEocf+ab28YqQmHg5fz7EVv
	ZCcO/xrWfZoLn1kJl70H18a48518NJ6LwZnvpAxTHOjQjA0LWcIvK7SjP1RvWxecpmhhI+EfBLW
	a+SfByuWOMTa1maD58F+bK3Kv7vozeIZ8k3W2ycivA6X79zRgxQ3s9k3BkP9gtlD8kzOGYLOteo
	Zrogk=
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr138959661cf.7.1774261017585;
        Mon, 23 Mar 2026 03:16:57 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr138959511cf.7.1774261017151;
        Mon, 23 Mar 2026 03:16:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm471815166b.2.2026.03.23.03.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:16:56 -0700 (PDT)
Message-ID: <1654931f-630d-490e-9b37-cd953befb131@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:16:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: ocmem: register reasons for probe
 deferrals
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
 <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c1131a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HggyKGyfTHCf_LFi62wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OSBTYWx0ZWRfX2lRW4Mp4i1an
 hJx2MMtEiHZpIuqvHbOq2Qj7tz4ubDdcyDwMJiRV70m6FrPvbHARhrPxbibZsie1VA2PxGd5Bxj
 NF/0Ap0kjnJdCj9PBolRLy9BU0xHPzbFH0mCCECkwtuiGxTGvx3LQx4bS3GGqknep3RXx0g4uqp
 Y8EaGb2Ks0iTTT0qzkSZOlmsx72EW4y9dQUsdXaJwGkkUfg2cMiJUsbeRJefge6TL1L1FGXPmPi
 l2Z9fasp132OLv6GGUapi1zT5mC7YAkt/AlkwzMtMtm2lBLOnQKhKn2ZJ5rcEUOcgrBi6/Z7f+U
 j0kqVPFYgkmisJjMk9HwvrQz/ZZsUM/fEnfliGZjTBw8FFKJm0qOnLDhLG+2PaUYP3DYS1xrkX7
 detp+KEeFobWkvHvDpx6jZA6Ri+1+0pEWc9odl394l7Av7FbrT9GGtnp3T5BY1eTyIFm4MpBUt6
 beDPxzW6G3Q85F3M6iA==
X-Proofpoint-ORIG-GUID: _Z2PrgGDUxQTi0qB6FAOAugV8-6go_cR
X-Proofpoint-GUID: _Z2PrgGDUxQTi0qB6FAOAugV8-6go_cR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99185-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 451032EFEC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:20 AM, Dmitry Baryshkov wrote:
> Instead of printing messages to the dmesg, let the message be recorded
> as a reason for the OCMEM client deferral.
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ocmem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index dd46bb14b7be..d57baa9cfa03 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -196,10 +196,10 @@ struct ocmem *of_get_ocmem(struct device *dev)
>  	}
>  
>  	pdev = of_find_device_by_node(devnode->parent);
> -	if (!pdev) {
> -		dev_err(dev, "Cannot find device node %s\n", devnode->name);
> -		return ERR_PTR(-EPROBE_DEFER);
> -	}
> +	if (!pdev)
> +		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Cannot find device node %s\n",
> +					     devnode->name));

dev_err_ptr_probe()

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

