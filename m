Return-Path: <linux-arm-msm+bounces-89966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJTgCeqXcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:10:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CA5419C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1C4C805629
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9632847B423;
	Wed, 21 Jan 2026 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqMwfvNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZwFw9O+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB8466B51
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985937; cv=none; b=K8c4QWS4gsSx6x1JdDtKYaZcFHTqZIK5AnrNaU1LYSoY+vpw0vZU+YiBoaCi0K9MA5fJAxJcrGbmGt6Hxfcv7AS51z90YoSTMoyKpGN6Uybg2yE27ZXKC29tzg4RDMRXeA/SJIZqvfz2Smiz0OQaOYnFarKg6ihkdbPzTi59cCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985937; c=relaxed/simple;
	bh=T2usZ8gSTQTfCOB+Rt+2OtkLgup6i3tdElu2GWesta0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLzzyqZnDk4jB9r+zW5EOQtcDa059L9nkHoD+O+jaaaGAEiiUIW33pD+CRhyhe2rqFTB/s301JcL65nGWTw0BEtF6amDVUxnwL5ZDQ4R7qRL1ij97bn1X+ruXTraRL7Ytw0gG3ToQ66brTZZeeK2knVVxT9/6pD6DQ9W4Oi0z6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqMwfvNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZwFw9O+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L2clYQ824257
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JEk0RTuiHDD7n7vffGqoKnhwc3Of48wJVKaL6PKEH0=; b=TqMwfvNosfwrmv4E
	RQv3u0WwOXAA0ArXIBcxew5qui9yzEB3a6kF7rV02pkTYA8WYMMA/r6yAgP6pbGj
	kF2i0pEcCeMwdng5b1dBvge7Aj29lncTrBmJTV84bbNKIHQqFfF8hIAAa4eMVj0D
	xAcLBwvATq54v6sHftAHiX60EjxxopLBDFS5Zf+f6uPT3ZAefXj6BV1C5NgPGnbN
	8oAQDGh4xuVdcjSthlNuIZjbyJeZ3IHLl2zyclc+Nz4NoocckAWfwyyJDNtlcLGI
	FHf9Wg9uYNN4Q5QGwoWjJoeg5NL7GL+4EMbiC5Tcs3k9tSkKzrMBDntIuWi9MD6q
	TW8yTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e30r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:58:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3968484a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768985933; x=1769590733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JEk0RTuiHDD7n7vffGqoKnhwc3Of48wJVKaL6PKEH0=;
        b=OZwFw9O+kwWNUohpxnPlfHapZgqKVLbdMuVjb4wXKS0lleB5hZ8hCAg7d8+lvD6hNt
         pGmAptlmzuJiz+zgbJ02Rr1OXdm0WOdFBU1MUZM3o4OEO6wrLmuac7lbfo2qD6eR29eP
         BTRVS8jwMaw1GqB13M46hFSXoaDDoez6FLsBhLLMQPFmyCRlYDexFyLG5zomigDKox4O
         gIPGMOk+wQ6zpaXnT1nhdtmI3Qc3QS346IQFTZDQFyLNEdrnqTmjS3z/vnRbicdmDNUt
         C05lBDelNC9PEUfXXRrDmDJedSJ4aafVMQJmYb0XYL6HS0wD7eYqVh+XRrQz62VDQ8on
         d2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985933; x=1769590733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JEk0RTuiHDD7n7vffGqoKnhwc3Of48wJVKaL6PKEH0=;
        b=AAQO7ZxSZRZaEAiYTk2VWYgUHiYTeZph2lCfT32zWgwOLUckEDOBPz5G2fVwzbqZIl
         39pQewvjlCIsNlrokAAxqNH46gmnpJHPOcZVsISVL9F7j/ggx6RTVkWGppaDv3CCAN1W
         87p00MuVfEOYUnFN144//21eaa8dw4zr4086oJZfw1ZkUdH/k7jGfcfySei5QC/IgBpV
         0bFGJEdiLJ+/k+OWgMC+PqbVFadchs7hb91um3dLJJ9UZMZUFvINZgBK77ur0CsuAUjz
         yc8HJEP0tta/Dr7fgPzhapca+1FFXrlv5bXIctd0pEwOHxcmBP985jtCP/c5ClAQ9GKs
         bZaw==
X-Forwarded-Encrypted: i=1; AJvYcCXw1IvQJlO8j8BH5EDp9jR0tGQkpn/b4LlZRNqGzMlZIFNp6/Htyj9iByS/PFzf0nqVCd90mBh0YA71veX7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKNm+w2AOt4eh3vlX7n9iwC0+as+T7kV/gTZqfIwkBOHuLJMjQ
	NBHM6Px7V9mtBc5nyFWqHPdak2tKkeVU5H+SG5Dew00pU2lb6HlMCP0MDXIHSRtRzEtSMhlrWoF
	cZZ0NceM5InqbbA4McyhMqwDUFmIoauEFQDQnlRx4H5/h0hDT82X9/ZNXpkOghnPRspsx3dPHZ1
	sJ
X-Gm-Gg: AZuq6aJWU1G3FY7n8qhFJpIoNj2lwofT7KXR1jzGIHkXcGZXymPpUmIfSbCie2B7CBG
	jp8GLlyE0Y5pkmlHyUepzEdxSM1sWaWBLQP6mo8dB7lvQJO6wfuaZ5rQxE3Ki/v3d0bxnAFZn2T
	VnnaNzsg7Mk/TELU7AI8/G/sm1UDIMR5a2y9L7BsSWMukO5daRpF9G9s/HYXeXgBhTHeOAmjpkC
	X4k9DciT9cqxCVIQs9Bu2hbzJ/mFXDqy4YmPfFdECe21cz94H/PYY9fdRWUpmd6zZXm/UFTs1ab
	ylofKQrp3kE7pyAlBzeBEev3HpcCpxL2D9JTB1XeMCB8rZIGm4VQPXI647QENbPHqM2tawTEvVX
	YZMas86QyUBowxchbQH3cUBasdolsvZEMk7pmnVR7EQ==
X-Received: by 2002:a05:6a21:a96:b0:37e:4319:d7c8 with SMTP id adf61e73a8af0-38e00da269emr14536318637.75.1768985933289;
        Wed, 21 Jan 2026 00:58:53 -0800 (PST)
X-Received: by 2002:a05:6a21:a96:b0:37e:4319:d7c8 with SMTP id adf61e73a8af0-38e00da269emr14536290637.75.1768985932769;
        Wed, 21 Jan 2026 00:58:52 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10be07fsm14428100b3a.20.2026.01.21.00.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 00:58:52 -0800 (PST)
Message-ID: <e28195f4-e73e-4c02-bfb7-850bf3eabffc@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 14:28:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
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
 <20260112104722.591521-11-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-11-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970954e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zVePdD6VyHPybfqkj0gA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: g7MeaeiUzQmdD565dh9Ebf_Y16rsExaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NCBTYWx0ZWRfXzBO+7OAT3AyV
 2v4QTrLxu5fbee94J3ZnxEu1trQ0jf1jTVZQ+TStMf0EVSqN94cIYzVFUfgMA2cDTDfqAHXWT8Y
 7v/enfIDtaT9LhhPuVGJRnNEY2hvkf1fSsH7ztmPw2tEOcqlFVxr+XPW0KMqK0TZlkZsSBdk0/m
 fgCbYUXxS9K+RVRYEqD2gOHfBNUvc0oOkyQ0zXP3q4PUvasszy2lYDnu15tPPsxQZvboULpmBKh
 8tY/NUWcjoYo7DZ9BzidmT193M2WNPYkLyocptxvD1MURSOST56AM3OsH8KZ/Vq2kxvt/2VMQ+s
 gS++DbWd7fZjJ6ccLuJSepJTwbvRJQKgTbMYHIPrLm1pdevo8WnbxgIKgdhd3FvZ5cga7E2LLmA
 eUv9WOlhcOS3C0GmKj/dgkVSmdoucyEsAr5kWt0vbPL+wvUMwL8VMFh9dRP5Q/qWTAl1LSt8Igk
 4NvtZDQHVByAr2EOTRw==
X-Proofpoint-GUID: g7MeaeiUzQmdD565dh9Ebf_Y16rsExaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-89966-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
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
X-Rspamd-Queue-Id: A96CA5419C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

On 1/12/2026 4:17 PM, Praveen Talari wrote:
> To manage GENI serial engine resources during runtime power management,
> drivers currently need to call functions for ICC, clock, and
> SE resource operations in both suspend and resume paths, resulting in
> code duplication across drivers.
> 
> The new geni_se_resources_activate() and geni_se_resources_deactivate()
> helper APIs addresses this issue by providing a streamlined method to
> enable or disable all resources based, thereby eliminating redundancy
> across drivers.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1->v2:
> Bjorn:
> - Remove geni_se_resources_state() API.
> - Used geni_se_resources_activate() and geni_se_resources_deactivate()
>   to enable/disable resources.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a4b13022e508..b0a18e3d57d9 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> +
> +	ret = geni_se_resources_deactivate(&gi2c->se);
>  	if (ret) {
>  		enable_irq(gi2c->irq);
>  		return ret;
> -
> -	} else {
> -		gi2c->suspended = 1;
>  	}
>  
> -	clk_disable_unprepare(gi2c->core_clk);
> -
> -	return geni_icc_disable(&gi2c->se);
> +	gi2c->suspended = 1;
> +	return ret;
>  }
>  
>  static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
> @@ -1179,28 +1176,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> -	ret = geni_icc_enable(&gi2c->se);
> +	ret = geni_se_resources_activate(&gi2c->se);
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(gi2c->core_clk);
> -	if (ret)
> -		goto out_icc_disable;
> -
> -	ret = geni_se_resources_on(&gi2c->se);
> -	if (ret)
> -		goto out_clk_disable;
> -
>  	enable_irq(gi2c->irq);
>  	gi2c->suspended = 0;
>  
> -	return 0;
> -
> -out_clk_disable:
> -	clk_disable_unprepare(gi2c->core_clk);
> -out_icc_disable:
> -	geni_icc_disable(&gi2c->se);
> -
>  	return ret;
>  }
>  

