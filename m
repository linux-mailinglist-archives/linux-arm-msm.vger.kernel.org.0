Return-Path: <linux-arm-msm+bounces-90775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBBmJny6eGmasgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:15:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2FD94BBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A4C8300253A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62495205E25;
	Tue, 27 Jan 2026 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv3penNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cN+thswu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0124224B15
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519735; cv=none; b=iISPDapUbPX1oW2M/CYLyaGz0hK6lAGymEyAeZr6W6U4BE8KMINnxCF9ic3VETqCLbJssAJADMF4Bmnzc95Y74dbn8tuUST3HUUN5oPQNUr1OQTJDzxnC1gsQuZuqOTdUjfsuWvD8/KlIg9w4d2sAWZlew2pRxyENTz4zvwAbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519735; c=relaxed/simple;
	bh=1cKY6BkQKnpuCf2B89RPj0zbkxZjlJBnqHRJIQ9btbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbLttQgJaZUHmL6jkmzT9zQH4FwcHmssC+lu+lD2/3WaMa3r5SAUSwXLw8s7j0mfL3gGy/XBi1T8Z2vMJxh4dSCJPaH6ocfdqX6bTuzUmWWPeCmFFs3/uzSrYZOBW1wVOMuWC/Hf/p+jtalHQuXdHFwkQ/Fxo2LCcGkddegUirc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv3penNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cN+thswu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9rUZf1268745
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19/MdffilA+Flr4zp73JQSFJbwwYSsULtIZglPCfrOo=; b=Zv3penNYmKT4yXTO
	A4X5vXP1oywnyYIS9H2+npER1EU60AF5aNiQVcsFMfQsRoIbfBsWx7grch6czInv
	zuTjyprxpXdTXSpC/moCd1X57iOu+BrQBYfeSQu4ntReSS1UOZLnhMmjaKYyBhmv
	LN9hS510A0IxwVg1ccs7Voxa5ZEEZenBypAR7guHk0LSvwKPgHyYUQPjDMuIRz6T
	W3KaQmn+RGC1rFqM2hWl6KFGTchUk/RjC3v5YpCkOCSd8GkcyxzzbzuxXWeL+dsZ
	v7XaZSHqb0AQ0M88V3eWX7NksyLf0wj9TKNQTiZ+hNMcfOLlGtkM1GgF1GeUQuR/
	StRCXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasrvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:15:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88882c9b4d0so15850916d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519732; x=1770124532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19/MdffilA+Flr4zp73JQSFJbwwYSsULtIZglPCfrOo=;
        b=cN+thswuMaCbVJ+FNu3u335J37ZAVpexB+4IzZnBg2vyYzGCxJ2BuK3yghJdodo0oO
         ZEs5UXNhkJAVqbjz5vWcwppxEm6vspst9vQ1Fg706f1cK2TXkJUWLM7jl4h/PlZTSxJh
         PQdOwI16Iyk7M3iEsKsAHpNjDXeoh/b3bFkivod//SkvEnLeI70W3gcF5oiOH8zyyZuW
         b0yWBsjfdU9/RtR1SHfPXt4uqETSFg/V+fFjQfzoGPA2S48VCpD/hSsyB6GfPlxUa3uH
         Iw4YrAh1kryNr+9E6S4tgw9UHv6oK8qKN8EE2Y/72e2oX/OhoMg9Xyr6KTbMtR1LVbFm
         n+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519732; x=1770124532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19/MdffilA+Flr4zp73JQSFJbwwYSsULtIZglPCfrOo=;
        b=UQXTHJZav7iQCy2uXtfjuVPBDfa3UmgVCBFnkgcao7yPKpCBTM2HzShXTdAp4T8YTq
         r/cnh/oPOMsCnc+1PJtMVNcS+ZoyDXa3JE+4pXodBIy8kckYQJUCFIbLn3pyBtXxRuT1
         h+mxu2GbxomLIeV752O7gR/1IgjGSWDs6B0ZRfPfTA/+AshMlR2Id9gVtfRA3DjLWHUY
         IywOBFAeNwF7rjn8cpK0lXhBhAXwNTU1VqwjU1aLcLCIaal4fi8Cz+I9qcQS700ODHpx
         6V8ZoG/4GZUnvym9Yo6yGyZTpA3hNdH+vkKWJlXV2YT2qe+8SBo+a30QoeOv1wFDdisH
         Ra7g==
X-Forwarded-Encrypted: i=1; AJvYcCV+B8NoaAIoQA2ar7SuTUgxLoKEWzk89ek+MB+kLvIiC8kCQFrkZpwduFW7En3DcnGiGgpTKZUfxNr2GC/b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pO8YO0ZjOm6zZiy35SnDgHLpxnQvSIkC8eN2uUaTTEI7qhnd
	Moc0v9r3oJqTqzddpgm3k1qs9viCXy++fKaEd7daEm4e/+VUHp3V/ucUQ5qhR9i8TqK4ZKxaFJS
	PZLiU7DSsF3f9yPzaZYXcwiGjydVQzocjQZIdmQxT3j8LJMJT3M7hjKaOr/VXF63nw/ob
X-Gm-Gg: AZuq6aIxKdP0nWb0Ir0mpYH01v4RnwJoV0NllfeNLVrYXWgWa3cR1RzU0yqlUQo7uzG
	y0VgORpVYFJX0o4MVemBcnXG4iRqjbwOTUJopcl4dZgFIWnzS6naMhC6jSZNQCzbGDwXco3VXYF
	BNz6qwJE/y6uQIMQ8x3gUOGf9wqImTyYCjxLDlbk0QgAgmpxILHVfbC18ZkEWrvcSuajYjwq3lV
	VDHZ1QmdlrKsD5vlmgPXqtLNWPdOZUZPkQzrzYtDBObB2TTfaQbRuod7Y717Qf36t5bgXX+Oji0
	Gu5l2dLwj7PKuQu0kR6roJaNYAqMX9Y/xA11GVBAcA0sRT0CHFbVrPPlEhbA3v8G3rXXDXcgNIN
	I1HDaqMujeHn5i6Z/zoT1zhvw5ZCrwNDol7tmlV9QdVHpJIk3fPyCGvFfR4ZVWkAt+xY=
X-Received: by 2002:ac8:57cf:0:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-5032f76e070mr14463251cf.3.1769519731856;
        Tue, 27 Jan 2026 05:15:31 -0800 (PST)
X-Received: by 2002:ac8:57cf:0:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-5032f76e070mr14462781cf.3.1769519731420;
        Tue, 27 Jan 2026 05:15:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3e054fsm6616915a12.7.2026.01.27.05.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:15:30 -0800 (PST)
Message-ID: <847290c3-d5aa-45cf-a75b-ff119b608433@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:15:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] spi: geni-qcom: Improve target mode allocation by
 using proper allocation functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-2-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122151008.2149252-2-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mb4ql03d4BzAh8vvHxYNLZe7JIk8Gsr3
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978ba74 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XHOLzdKp66iKSBlp6ecA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mb4ql03d4BzAh8vvHxYNLZe7JIk8Gsr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOCBTYWx0ZWRfX0u8DifDgjLmN
 4eyM6SqmFYHn3G+HvTu+cPY2kvTFsh8wT5Hu1z/sKUAIsaBUbsfNEdLknRNv0htcLORwYRwmU38
 KiGhtNtCz94+3+0Nx0ZlAyNS0K9fkT4xnHvK5N8vmsndA6toa6ozGYtbA2XOF2qKVUxEZPcSILG
 g418ywJLiWZuxBODt0eGdNTXw3cD9ex/LByV45u9rRZU8AEGgYA4+TPVvh1u7cnSk+SvL2vMnUR
 XSUFrhm2T9evxRdVaVNWlUFukxQGUEQyW+0G2JU8sZzVFuV3RfwVz7VqhBAMNG9ydugjQvzVoIG
 ZbwcO9jSFgE5ADSvX6jADCJFkrgF/kMr8fq90B3ieAhb7q5AdyoC1cYi5c82MjtQetO09WYFwAJ
 /4+Epe9dfVryDLGAOYAyflIM25YqkPlAS9w7V6NbghMkaN0EjPaAMuY3jrBIVv0xaeD6qpBAoBw
 hzK4k13txf5EdE3fbqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-90775-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB2FD94BBB
X-Rspamd-Action: no action

On 1/22/26 4:10 PM, Praveen Talari wrote:
> The current implementation always allocates a host controller and sets the
> target flag later when the "spi-slave" device tree property is present.
> This approach is suboptimal as it doesn't utilize the dedicated allocation
> functions designed for target mode.
> 
> Use devm_spi_alloc_target() when "spi-slave" device tree property is
> present, otherwise use devm_spi_alloc_host(). This replaces the previous
> approach of always allocating a host controller and setting target flag
> later.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 0e5fd9df1a8f..f5d05025b196 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1017,6 +1017,14 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	struct clk *clk;
>  	struct device *dev = &pdev->dev;
>  
> +	if (device_property_read_bool(dev, "spi-slave"))
> +		spi = devm_spi_alloc_target(dev, sizeof(*mas));
> +	else
> +		spi = devm_spi_alloc_host(dev, sizeof(*mas));
> +
> +	if (!spi)
> +		return -ENOMEM;
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> @@ -1033,10 +1041,6 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  
> -	spi = devm_spi_alloc_host(dev, sizeof(*mas));
> -	if (!spi)
> -		return -ENOMEM;

Is there a reason you're moving this code to the top of the function?

the "main" change looks ok

Konrad

