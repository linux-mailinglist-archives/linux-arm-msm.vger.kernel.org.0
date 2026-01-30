Return-Path: <linux-arm-msm+bounces-91237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ADgH0M1fGmfLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 05:36:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA4B71CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 05:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1FE3011F2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7720A1F1513;
	Fri, 30 Jan 2026 04:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCIPZUrF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xuf4Tipq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A781B4138
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769747774; cv=none; b=fWJ69/EmHBi3PSeyJMmdI2EelVWd131FCkK4AMp1+ekJY2yEyDhDY7M4d/PCB1y+NB8kwpadIejVYgPEQYclVd5arO0YV9+VfNICiAzM7NSwSbYRMemxfZyd3IZWuQtPInChoEfCa+5pTW48B++x34mAIhVIS13WSKLruTWQ1WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769747774; c=relaxed/simple;
	bh=ZbMQ7ASXirx8i0yahW/p+PRtP949dK4km7dpIAsQsXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rg4X7E12PqINoTbCn9sKy3ER9VEYmUAfPPnXsuPNH2ejyK5ADwYgdYrYUSGgEbKd4mjwjgI40PGmdNXpoPUDunx/OiPLt3SOHLvQeFoEcGe8aXIfREAm0X2pSWTwMfU46wTlDg4OmRNvJmuBvmJqqWL0yV+Q5q8FAfkL3uQA8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCIPZUrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xuf4Tipq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3Vg4u2992846
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=srNKnFzxcWhGr13Qq6VwvyTb
	SPlSqEx0v2ivEA6l6zI=; b=SCIPZUrFD4chwfl1xAKCVaP47t+qhbxvXXnNpLa0
	Hpuh/fZ0s9DGHgLt/7rjTKv5lQnmE3eCj6GEDNnpFVPNTerpmut7THDPiUmrdo6N
	hQTHEUgLpiaCt9DZ+nudYs18pHOKcO+T8aa+Wn4oIXPLouGCbPEVZ+FcZ0w9YXrd
	jBqHmP3Mq3yRRaHK2f71JDq6kCnrAmWYGwLqNB4RWW3rhm2jUVJxeWdtjzYOvIdO
	Ny1VCBpaUrsTYGcYcsntdh0HmaWCHBD7YbN78PW717LvTqEVOJCAR86E8T9RE4wB
	Ou7E0uIR92woA/LhyicOlyu3QFj+ZRN5CbIlXFOHXHXl+Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1hct7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:36:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f58f90f83aso4849214137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 20:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769747771; x=1770352571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=srNKnFzxcWhGr13Qq6VwvyTbSPlSqEx0v2ivEA6l6zI=;
        b=Xuf4TipqEDa1mTq/r5UxkKmNA59Wx+RQIh3Ak+H2IBprjxEeSDhLubCivMb13SAkc0
         tbkI70JqX3HcUxg9ZdU30gNEQ6r9NUKVqGnaouIb9KggQPDVcojg0ykFqtxtnztafUZp
         2cPUBNScFhBqIv2E8MFOJFY098S0VwVYSeBDzf/bzbCUiCfsegU+g3/lScPNFf+FUjwQ
         00EEyG4IOQJixmSgvUd1GI88WRW2S+Rbigo3HYeKiIsDDx+ZfnfzxCY4eefdoK6odzT1
         8TtQPJP4uYSVA85idGxyfd9zgEBawPT+7a7PdXGK7/jrGdTfOtTLMmKFYpguYjpb7kvf
         GK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769747771; x=1770352571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srNKnFzxcWhGr13Qq6VwvyTbSPlSqEx0v2ivEA6l6zI=;
        b=xJblNdByetzbtJkT7qQ1pufCFmFfHrLvLTnJyGBiygeDtemg21Z6c6tOTkok727h5f
         9a2F4vyx2dasWikpdX3e2NR8r2Zm1UiLSw3PYb/R0xXGbIVsS3VNdDv2UiRMjW19S5ge
         4uAdklUA5420SeUBjL2NoleeAGBMOwz9qLfuSxcPnuD7IAnUV5IaBJ6htQOF7+XSF9yQ
         hstplIwAvjYMwQsfZfmsERUl3/3Je9HfYL7t4bYuFS6Esipbd4+K/ACMKrnA9TCCWqiD
         To311PpzGc7htdogz9MWhTELjn3eRJAK7tBVNS5P6vW0Ixq0YzdaMWphb7pCt6Eltb4q
         E6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUngSV3ONeg6ZbUfJLYPoQW09oc4/N3Hk6u11UZPl6AUQ8bvDajfsnrYvY9BL0uid8AnaQ2SM8Bb6AmRdVr@vger.kernel.org
X-Gm-Message-State: AOJu0YzIch9G0MCmCTa4dgJDlgINr4VWQ8onJO6rW2Bcs/7dim83h1vS
	MbvxxqsEhg9YNpnm1ynqPP7f6R+L7HLFQlNnDD9fqYoY3+Cir2HGuZD0Z9L5r6kNmePCNqUI08w
	UOJXXdMU1FCjDrT87S4fwRDoTxKZI0YJtOqISFzLiDcXKzRsaG+CmL8czpcHMBRSsDj5SKm+mbh
	E7
X-Gm-Gg: AZuq6aLRNjirITlpVxkO/cc+xDgh2goCEHt55p5AtP6UBRilbCK96SSluAML2CreMSM
	l8jFcb2khWQqgOVFIAVpHfETJbmY2BszVzA7iBLnPtSCIBFk7VrEwuv0+0P6QC4IG92btzdl9Ki
	lAXmyCod27MBiJwnGCwwxBiltuFmjoDLWLT/5jmvv9n4/H+F8NEVsqu6oDImpGLsxI0+oXeQErU
	PqaNPSFSgtFKplpN6FJyImQNl7+G7mhLMzNP+ZL2TTaIiRgaXjKX3qQeNwHtvo9SUQcQf8JP9po
	EQ6t5ytAPpsndwXlHjbfKhUsQAMbBkwvPSoBCJd/YulVzUmrt1WmmK2MNCEnLJFTymM+psbUooa
	lWmVc87R8kPcrmsrVi8ayST6gb9dqro+Lws/0Sr6IIFB5DX2ogkIsD9XN8f2mbHHRM+mhlGMJ8j
	W8CI1L9EbslOzPh1q6vegNQr4=
X-Received: by 2002:a05:6102:54a8:b0:520:dbc0:6ac4 with SMTP id ada2fe7eead31-5f8e236d9cbmr764079137.2.1769747770951;
        Thu, 29 Jan 2026 20:36:10 -0800 (PST)
X-Received: by 2002:a05:6102:54a8:b0:520:dbc0:6ac4 with SMTP id ada2fe7eead31-5f8e236d9cbmr764070137.2.1769747770558;
        Thu, 29 Jan 2026 20:36:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbe5fsm1477242e87.85.2026.01.29.20.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 20:36:09 -0800 (PST)
Date: Fri, 30 Jan 2026 06:36:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Print error codes in failure paths
Message-ID: <t2m4bypviwyley3aay6f5w53ekn6csi7xj4aqmfbc65frytdyl@6uya2knicfcf>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2ORUvARfFzClYnJn_VmB5c1IFUj0ymC4
X-Proofpoint-GUID: 2ORUvARfFzClYnJn_VmB5c1IFUj0ymC4
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697c353c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Yc4aT7OXPLHpaJwwjiUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAzNCBTYWx0ZWRfXwrTgomR5IL/I
 HpAPYEyJjcp/hH/Ap1RqzBIOE8T+OEbZYt2SqNWpN0cRxaiPknm8VQQT1iMLKkhY7j4OYvo5SDp
 vfoYyP75EqeDuPEkLqBPieW7KmptLCmXuzJk9K4vIxZq3IDLY9MZPYwNuzxI3Onm2J+Cxk86Phv
 x3AeZ/mSUBd0tNj0VFmbBfNcAHAf4cEyNZ2tKH4iCij0oZZL8CZRjM/YM9pQNk6z4aJ23j1149V
 9wLckftOu2SrqkPPxZqZGvUkZI+wuo1SQDNpUSp063gVVHKmdLqhl2Tvi/AbJz/dE+hLxujaGZS
 wBl5ivrXsrSTTpdrLt0t1qZn+be1ZUrQDjl+dNSRQzqa53F9Bp+/wWEpA/nk80WtsR3KLR9WIBF
 dq+3LtEpT72mLJiMNdHB13NbSeYK7dAd9oUxdExVmEvbyDZFwx8xMw0vuJ9cEbsnO3DqjGzhNRi
 NmwL8TeayvNn+4dfnyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91237-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2DA4B71CC
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 08:53:19PM +0530, Mukesh Ojha wrote:
> Few error paths in the qmi_interface module log a failure message but
> do not include the actual error code. Include the error value in the log
> so debugging failures becomes easier.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qmi_interface.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

