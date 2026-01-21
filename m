Return-Path: <linux-arm-msm+bounces-89965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDdaLCSWcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:02:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18154045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9EE155293FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFAE47CC61;
	Wed, 21 Jan 2026 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plSt7tKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Id9jb9Il"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403247CC66
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985854; cv=none; b=ck+c0E+3ZR3ONd4aSwopyKeXuJgKVMH7vm9GounIfi3rq5Hyi6/Eu24ieVi8Zt3C8sL3CqdU6DWbfXJw3+nX86y0bHB+dDqOUK3exlLMr17Icgu0c6UU+nd/iKzAi0ntDTfVQsIKCbDqwnxYSCKSQKhdK2eok1a3Ht3HnLGVBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985854; c=relaxed/simple;
	bh=lHhYnVB0AwD8SjKF/yYmM4BXq02635YcRcN8Pb8dRxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcjrR1xchngYnq268l37jULMbMhn/mG4agWHR8zM5VLSa783bsUBLT+4lTKd63giKbgkKSnWllxtM6SRnVnncJJrZ6xf0gHJv7Z6T2Gt5+4PTE6joSQvFZpgti9uAmLLbYaClJpOY2NVP4jIcinJDNX2KEiST559Q6jD6JO6nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plSt7tKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Id9jb9Il; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XS8s2938623
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4d8y0BDBnOafUiIaPz0GAskTugR6Rn+Ys8TSj5wyr0=; b=plSt7tKYlqQdelgx
	c8lrQL+YurJYlrq8FvJnVToMBXma1mH/H1/sWMabmWMi9OFcXVkWEUpwZx5hHjCz
	sCC3ACI2hyF1SBfl7NRvAag69fuECPeg3fgL7ALtAF50cq6XH+FASJBk/Vcv+biu
	qdbAWtPmLRLYij+kLk+XnT0T5okTd7AM0ag+4xNr87gvsznCloWp2iRszRwCEWMQ
	qFR+qqdRBAe1Cd7ldRANPvbvsX1fP4DhzNobv3ua2eKgqjuM/tfuIvYQZ64IzzTa
	5HHGi49kr61itd+T0I/AstoV0350P8H7CE7EzyZLSC4+Y1sFACWne4cvhDchg6XQ
	5D3r1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu8g2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:57:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so4523322b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768985851; x=1769590651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4d8y0BDBnOafUiIaPz0GAskTugR6Rn+Ys8TSj5wyr0=;
        b=Id9jb9IlPkhOSJ0nVB55gnlTMK8NcRzgs6t/VbaeHX+JPeUXSNpZd4A663WZLzDDAZ
         p56XFsa23xBh+XoTtLNRN6DOK1Cl8gilyqO8njDZEY+ah4+BBTUzl13ZZFdghfDeVSmw
         fvyCq48sljqmFIUqE3Pke+WxP7KwZhAMonF1Jw3PqtU5ZeqXQw5buUqbYNDLOz0+HmHq
         DKIGbIwO/egEnYnipFA5F5EFi67/LZ8TvhUk4gi2S96TmeUF99sc1ikt1XiplEwHVeFH
         TCErJHa3nR036dVbVqRNV+tmL0cLvlUdaAR2DIV6M+cr483g7tyRERjYMSnGecdRzuso
         7qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985851; x=1769590651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4d8y0BDBnOafUiIaPz0GAskTugR6Rn+Ys8TSj5wyr0=;
        b=vuQC61CArxatsvcryTi3WSQbZsczanGq2H/1y6vQrxGoUxYMYdR/6O1ybdh3KdNZ3Z
         8wR/809FPRRkyXWNokR+o9pOULVEBamQmPHM+x2qa5EJwIxs4FfU97s5N4u9lOthjUwE
         nO4n+mp9N621t/bSfKRt/iYRMmTE4ZAgEfND9ZcsfEkFradvFf/Ny4miycEIzmZHJnYn
         DtK17CYC9G+UCXtp8r/dkBVLwQXjGupl6hnjU/wZ0R8+otfbMu8dATaBtVaRFeMm7KZK
         PR8kb6JojBh5mEJjaSMEIG/52tp80jCL7CL7utYsZryhrNlHBz/wKMgGCxcp9mbL9Aed
         Pz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUNCD8ufM7TuXIaZKmykgCbOHuXGRwekyQk03xPqn+Befjr1YDyYvru0cmEWqbxYNRnefo58rb4k5bsHN96@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeJSZQ4+r0ii4EovBW0pUGWMSe3HtBH3r1lln8i/BweJvGjrQ
	H1o+/KoGRuTD1MdTH4Aas1LE1ODDNnKcc7yVjmDsU+UAPVvxbMcDaakpmHKwVwZYVLByDHsds99
	gWcg1SKdI6lJp9l6MvGFFiEe+tofjIsf1ZNhcw9/b2GSsUStOelwKjCD1Bsg5Uk8N0KEE
X-Gm-Gg: AZuq6aLI1UNx19rh+ROlbkMJhnZPgKYqLaxM7IVKYoXyaQ9jgQsgnaEiqe+/q4+OWe7
	JQSd2ipI7J+LyrqQHkILuEBg1Om6VC12tt/8OMXPEygwT+iJf0qwUhBZXEVO7khhFPo0AauGpBc
	UTzQIVXkYi17IQJUDoLzFLlAR0X1DeozTDhi9STqsEeOz8jmDrdZSmqYqQGCfuFISnXEO03DEv5
	TGcz5eDy0XiFbIxQAJ/BuThoXI1jxiShxaA7azaiVwUT4JKVRRN47BGM32fxSHXUA9zWsW4BSS7
	IH61P5TFdLzPObhi2PMtc7qBgapLunUQtQx8SWzh/bXH0y3p6XdFGP5XgrKAW+PdCoADE2pMsNQ
	o9oIv0tx77WZhRPfRvjlHDDQqYBwlVbCnrrN3FKjcfg==
X-Received: by 2002:a05:6a00:2d9f:b0:81f:3d13:e081 with SMTP id d2e1a72fcca58-81fe89c09ecmr3855102b3a.41.1768985851164;
        Wed, 21 Jan 2026 00:57:31 -0800 (PST)
X-Received: by 2002:a05:6a00:2d9f:b0:81f:3d13:e081 with SMTP id d2e1a72fcca58-81fe89c09ecmr3855065b3a.41.1768985850607;
        Wed, 21 Jan 2026 00:57:30 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b21fsm14436173b3a.13.2026.01.21.00.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 00:57:30 -0800 (PST)
Message-ID: <9a1a48ac-2d33-4c86-92ef-28724221adc3@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 14:27:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] i2c: qcom-geni: Move resource initialization to
 separate function
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-10-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-10-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=697094fb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=l_Quz99wmvEmyA82au0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Xz1oqPWW6_ZzHtyneYUj_oAJaPFAcmXu
X-Proofpoint-ORIG-GUID: Xz1oqPWW6_ZzHtyneYUj_oAJaPFAcmXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NCBTYWx0ZWRfX8G31Qv++Sko7
 I3Y4CEOTZREpCwLBdppPpF5nHFogjevC1QlmkIwrURhWHK1/RvOwyyJxVBYaZrPq7lsiQPketrx
 QzVAXgzzH9kZWqviMlfo13RFAoJfdv1CnRsHxh8I59L2eAEY7b/WJDP0a8NbIUa3jFbKYUa2tI5
 xbcmSoEi/Eu0Khu8ZzmQVwLk49AgWwxQtPjJ7w7YRLiGRf07nPaPX5NNUqcNPlDFjlwrD88wvJ2
 V1cQBLKET2ZV8AUx6oyLj9EN35OL21Df+G/i9RDIwJ6GAHf61giyJ9a1Pnez7KsVo7AGywuCJYJ
 WBcA4viQ8IJy6CAei/0oX1OvJS3q+CGEEMPNIx0zqoLTJK1BNIqPmJqNC4/OFvetN5e0d1DOn5T
 4SArqg8gSmCVwit1B3Ss+ZzplYjFXxevv8hkqzadat8AofrodWcaZ3lTF33U0f0lj5xMXxtlnYY
 dlVg66KDeBraiqFey1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210074
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89965-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E18154045
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

On 1/12/2026 4:17 PM, Praveen Talari wrote:
> Refactor the resource initialization in geni_i2c_probe() by introducing
> a new geni_i2c_resources_init() function and utilizing the common
> geni_se_resources_init() framework and clock frequency mapping, making the
> probe function cleaner.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1->v2:
> - Updated commit text.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++------------------
>  1 file changed, 21 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 58c32ffbd150..a4b13022e508 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1042,6 +1042,23 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  	return ret;
>  }
>  
> +static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
> +{
> +	int ret;
> +
> +	ret = geni_se_resources_init(&gi2c->se);
> +	if (ret)
> +		return ret;
> +
> +	ret = geni_i2c_clk_map_idx(gi2c);
> +	if (ret)
> +		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
> +				     gi2c->clk_freq_out);
> +
> +	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
> +				  Bps_to_icc(gi2c->clk_freq_out));
> +}
> +
>  static int geni_i2c_probe(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c;
> @@ -1061,16 +1078,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  
>  	desc = device_get_match_data(&pdev->dev);
>  
> -	if (desc && desc->has_core_clk) {
> -		gi2c->core_clk = devm_clk_get(dev, "core");
> -		if (IS_ERR(gi2c->core_clk))
> -			return PTR_ERR(gi2c->core_clk);
> -	}
> -
> -	gi2c->se.clk = devm_clk_get(dev, "se");
> -	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
> -		return PTR_ERR(gi2c->se.clk);
> -
>  	ret = device_property_read_u32(dev, "clock-frequency",
>  				       &gi2c->clk_freq_out);
>  	if (ret) {
> @@ -1085,16 +1092,15 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	if (gi2c->irq < 0)
>  		return gi2c->irq;
>  
> -	ret = geni_i2c_clk_map_idx(gi2c);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
> -				     gi2c->clk_freq_out);
> -
>  	gi2c->adap.algo = &geni_i2c_algo;
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
>  
> +	ret = geni_i2c_resources_init(gi2c);
> +	if (ret)
> +		return ret;
> +
>  	/* Keep interrupts disabled initially to allow for low-power modes */
>  	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>  			       dev_name(dev), gi2c);
> @@ -1107,23 +1113,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = dev->of_node;
>  	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> -	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
> -	if (ret)
> -		return ret;
> -	/*
> -	 * Set the bus quota for core and cpu to a reasonable value for
> -	 * register access.
> -	 * Set quota for DDR based on bus speed.
> -	 */
> -	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
> -	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
> -	if (!desc || desc->icc_ddr)
> -		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
> -
> -	ret = geni_icc_set_bw(&gi2c->se);
> -	if (ret)
> -		return ret;
> -
>  	gi2c->suspended = 1;
>  	pm_runtime_set_suspended(gi2c->se.dev);
>  	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);

