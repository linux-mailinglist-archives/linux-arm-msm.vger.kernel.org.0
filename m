Return-Path: <linux-arm-msm+bounces-89967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J6xEO2XcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:10:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4884541AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3119E4ECA81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D24C47CC8D;
	Wed, 21 Jan 2026 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkTHSKxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWhgKGTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D5E47CC8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985983; cv=none; b=ICQAjOp3dVX1aRHXEkDyh081L69wHwS7LZzV1p7jUkaCP1RpcqIegtL5DeH8CaLGpuhhMnQeTNBGbkm/kegfrtHacDG/ra8g2IfH7F+B1AftUE1x1nAx1oa9YXb2zcnN34inynF0BVlxW+ZU2YsksljTnGsuXz1abELU0q00sXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985983; c=relaxed/simple;
	bh=VAHueLdIbT5ABQNTOeVMqxqykObxMf2Uxq4Gb27sYcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpgNIcQ9K3Uzn1dk80gOL/wneTVTQpPaYYzR4Ie1FXftfvPiaVoyg/AlDRvPPi4Vi3PUIqW0lttjQur2xWXmrQOkW/Y3Eqhq6mkW8Q1E3cURLZLe8WvowUNH7pLUpCQjiv8viPT1ZHj+nxGdt6EqN3s9H2LJkbgzTHB4LBHna1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkTHSKxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWhgKGTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XKRn2938419
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTXNVWhTbjXAhkX2Ow60ufGWtnR7Uy72/xesvBbUNLc=; b=dkTHSKxlfr/rCvZm
	ixq0MDk663iD/io3sR/NHpqrJxMu9W1IVHFB4Ytt1Dv1z0EQDA10jpOl+3V0kCQE
	szMgHuDy6nnCxMSqGayNP3kDgVVqFK3rf6RCRRLrOLFojaBMMY3LvHfTaBY6wAdQ
	X8EKpvieDwglytsv371M/EScNQn94Fze+EEomzGptVLL/rRaBneZwzIbMODBGdRY
	GrItI4dApkNG11N5nW3v1JSxdu62Ho02yNfz2Mvji/6fqfNr5wIpKHZVr+7QTs8k
	e414alyPAANBPSMSxh7q7illTtfa2HLW2BCn2qj02isoXdF/FQhEx66TbnU+Bf4L
	SQXfSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu8g9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:59:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bae9acd4so45186235ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768985980; x=1769590780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTXNVWhTbjXAhkX2Ow60ufGWtnR7Uy72/xesvBbUNLc=;
        b=dWhgKGTCFcz6JMLh4YL1xlmTmwtWLkDc3SE3gRkoLRwA5yI0s0kJfORbC20M0z5ukP
         p3XUllDPFpkXVsu3jWyeoAKHpMnvPxsiD77GPi6tevDGOt8MlDFvWV+6YCJfPMKYgz+w
         gmER9ihOep8ZNxLZXFfUFn/suEY5C2YDbdELjjhWumGDfGMFlUE0HKaeH0XO1wYdtqY1
         u1fG6iZRihXXkc2MqXs5TL8h0KExBfI4MXk/i/oxDxJoPvR669luqPboQ9d9hcCQGmly
         J0TKZZjUi7Ye5xh36b1VqYMWABrl/z6wj+/OVuRXOg5PZuF7uMlgu1b9uxSaxON+QWQm
         OVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985980; x=1769590780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTXNVWhTbjXAhkX2Ow60ufGWtnR7Uy72/xesvBbUNLc=;
        b=V9vVJBgKNKAdYL2jbT3ABFA1urf7fGULtE/aRnTyhuFWtdTFstAof1F2piVfzeIldH
         Ity06bRMtLo6Ks7+Gw4Lxp1fyqjiwRSlRj7tPSLG2u87KMcVhZ5O7UcT8AL6kylovADj
         V+WiKbnlZXZPDnpFyK4MERL5DQrmvtKJBlVgGGEiUuW/RVIeeWPrzYgPJRnvl6unBe8s
         71ZWFEfyNfF13HZNolwjt+xdrZIYTDP6bDjsNP1sXAPQGgO4T0MM7IEY/DSuEcUdaaT4
         J7LZv22IPXNci3F7+vigXX4JsbysPb2DAb5zAe67lNCvvwupsmSFFkc/rcJvq4JXup8+
         nMtg==
X-Forwarded-Encrypted: i=1; AJvYcCV7IvJD5uHscoTinMDpwKBV1GWNGYzDufuGXCiuA2Rflz0/pzWmy6gjHeRYiKS0P0DZbhG9m6nTloFFHkKp@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmw7fTuLqnT7p0xk1eOCV6qTEVzcb5pPE1jeuwHzYr4EMtPZJ
	kJlNhBzWtjKiekP2ymFDqlIj7vlgCqfntexV0NPLix8zMz//m51Lrw80uE9htnXiIl35ocSv/G6
	r1JR6a8FXTAMSgov4VLkeYm8WlXzg3zUv/hCvZ05Dgii+Fdu7ewHsW4fZQMgQ1ti3xBs6
X-Gm-Gg: AZuq6aJRI0DfNJ8/hwMgxN8bVry8mGAduXyu0f2U2AinLAafTwxZyTpnlCaySb7KAy2
	6EMuamck1umsmx436qBJPPPb1d9+foILICSFOHb8OJ3RgpdHlqNoJ/2062+5ENCD4He1oXBpDVM
	EXWs6x94oyT4Kqanp9m7lTIv3SupEb1vy4PoEGg76hFL/TUKPJSp/+gPUckGx5r6JxsZ3E3k9cr
	VHrY0bnmeTdSuHEVXzt4y7EiiL2o+Yr63PMV+kXffFcfng65iSrrZ0wFbphm3bA+pDA23jy/bjh
	dOz+UyYj1BnviWEir7vjOhqTCjBookZhhrocrfI9DG0U2ESEadA7BJNPLivdb35IUhAsmcoLTZo
	hnKzDBpV7CIwjfcLKaKt+0ifrc5u8vvygem4IbBGEhw==
X-Received: by 2002:a17:903:1d2:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-2a76b16a325mr42072805ad.50.1768985980287;
        Wed, 21 Jan 2026 00:59:40 -0800 (PST)
X-Received: by 2002:a17:903:1d2:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-2a76b16a325mr42072595ad.50.1768985979778;
        Wed, 21 Jan 2026 00:59:39 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fbfa8sm147509515ad.76.2026.01.21.00.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 00:59:39 -0800 (PST)
Message-ID: <82db5424-8013-487d-90bb-82f133cbcbf2@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 14:29:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] i2c: qcom-geni: Store of_device_id data in
 driver private struct
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
 <20260112104722.591521-12-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-12-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970957d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wvo1P1tB0sfHhNg8w_sA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: F_fexDBCAY3HMgaRqSwm8fjG54GnEDIL
X-Proofpoint-ORIG-GUID: F_fexDBCAY3HMgaRqSwm8fjG54GnEDIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NCBTYWx0ZWRfXx9dddZfsHcrl
 +zZMKqsCSCnN0LexE6W5l/tdWMbTm8LV64ZJBeENmXY1par5ep6JJcK5+n8fSMyxOU2B99g/5oF
 Jw+R9l2DfBCSUXY5Dyh9cbvf3pp+NtfHX8eIohU91KjOUZWdBIAeGOqhEIHGA37W5n8ud6TPKAd
 K8dV93PIccUVnIBlA7hJ1wDow9aNTttv4lyI1d72IYV2/a3htFEIIwP4ME262080Z2usr3LsKwg
 k8LCarqR0Qbty/0SezVOym2SS/gEh5wbXpgMcKQfVBRAEXEULLIoFQzR9ukEa17Nve8vrSySRrj
 biF5PjKTCJor2gWNMs3RQWJCD5ob2UdfEzH0ftGqoqxxD95K3il55xwsbaC52d5elVoYIwJpkPH
 TyIddogItc7re0p31kqLlKw0JWTyh8TVltm6AzPe3PudtbzeOJCCar6cZwAfCaX8MTU1NOjIhlF
 4Yg0jIrxtfJlWojNfPA==
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
	TAGGED_FROM(0.00)[bounces-89967-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
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
X-Rspamd-Queue-Id: B4884541AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

On 1/12/2026 4:17 PM, Praveen Talari wrote:
> To avoid repeatedly fetching and checking platform data across various
> functions, store the struct of_device_id data directly in the i2c
> private structure. This change enhances code maintainability and reduces
> redundancy.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index b0a18e3d57d9..1c9356e13b97 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -77,6 +77,13 @@ enum geni_i2c_err_code {
>  #define XFER_TIMEOUT		HZ
>  #define RST_TIMEOUT		HZ
>  
> +struct geni_i2c_desc {
> +	bool has_core_clk;
> +	char *icc_ddr;
> +	bool no_dma_support;
> +	unsigned int tx_fifo_depth;
> +};
> +
>  #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
>  
>  /**
> @@ -121,13 +128,7 @@ struct geni_i2c_dev {
>  	bool is_tx_multi_desc_xfer;
>  	u32 num_msgs;
>  	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
> -};
> -
> -struct geni_i2c_desc {
> -	bool has_core_clk;
> -	char *icc_ddr;
> -	bool no_dma_support;
> -	unsigned int tx_fifo_depth;
> +	const struct geni_i2c_desc *dev_data;
>  };
>  
>  struct geni_i2c_err_log {
> @@ -978,7 +979,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>  
>  static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  {
> -	const struct geni_i2c_desc *desc = NULL;
>  	u32 proto, tx_depth;
>  	bool fifo_disable;
>  	int ret;
> @@ -1001,8 +1001,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  		goto err;
>  	}
>  
> -	desc = device_get_match_data(gi2c->se.dev);
> -	if (desc && desc->no_dma_support)
> +	if (gi2c->dev_data->no_dma_support)
>  		fifo_disable = false;
>  	else
>  		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> @@ -1020,8 +1019,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>  
>  		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
> -		if (!tx_depth && desc)
> -			tx_depth = desc->tx_fifo_depth;
> +		if (!tx_depth && gi2c->dev_data->has_core_clk)
> +			tx_depth = gi2c->dev_data->tx_fifo_depth;
>  
>  		if (!tx_depth) {
>  			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
> @@ -1064,7 +1063,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	struct geni_i2c_dev *gi2c;
>  	int ret;
>  	struct device *dev = &pdev->dev;
> -	const struct geni_i2c_desc *desc = NULL;
>  
>  	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
>  	if (!gi2c)
> @@ -1076,7 +1074,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(gi2c->se.base))
>  		return PTR_ERR(gi2c->se.base);
>  
> -	desc = device_get_match_data(&pdev->dev);
> +	gi2c->dev_data = device_get_match_data(&pdev->dev);
>  
>  	ret = device_property_read_u32(dev, "clock-frequency",
>  				       &gi2c->clk_freq_out);
> @@ -1215,6 +1213,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>  									NULL)
>  };
>  
> +static const struct geni_i2c_desc geni_i2c = {
> +	.icc_ddr = "qup-memory",
> +};
> +
>  static const struct geni_i2c_desc i2c_master_hub = {
>  	.has_core_clk = true,
>  	.icc_ddr = NULL,
> @@ -1223,7 +1225,7 @@ static const struct geni_i2c_desc i2c_master_hub = {
>  };
>  
>  static const struct of_device_id geni_i2c_dt_match[] = {
> -	{ .compatible = "qcom,geni-i2c" },
> +	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
>  	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
>  	{}
>  };

