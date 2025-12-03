Return-Path: <linux-arm-msm+bounces-84221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A88C9EEFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 13:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38F33A6AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 12:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ABB2EA752;
	Wed,  3 Dec 2025 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RptEFBwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQ3oZ+c7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6769F2BF3C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763785; cv=none; b=jigAVdQt5E+Wp7rVCm2xaN7mS2amOGUh9N/yh2pjiU5P8BFA953t6vNo2zcf5tEQhfrAPrgmcmB4BG1vtVu6ssBloQzvO3Q58A4VIbgQTRppXFUOAHgp62lU5alI/osjlKXEtjBjFM1cvdXcx8I2jh2ZosrmFsaei/jSR9GRvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763785; c=relaxed/simple;
	bh=jKREOrMEea/Dvf8aCV8zVWNQRNNGIL1A9YE3nPwj6Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogdQzs3S+mBqrx3GO6mJxC3wNCSmoYp4E5QEqw3KCaM563A4tfJBlrR63zvPeN8wnLqdiWGpjRQuTdDRmpgJls6+ktWLpnr01trwL3lUK4TG5kiaxH0/pBYelPUVWbUjR3wl2cCQ2poUGIUA8+ofS26rsELG4weTRCuH9+Mb014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RptEFBwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQ3oZ+c7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39Q4ml1969626
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOIwtlbSfFO1paT2asaWBjRDgzfRuNe9uiSWK8bXW1s=; b=RptEFBwL/mRbv2u9
	csWogUpq8z4lhKAIjRduAx42B5sGQJX1KZuxUhJbezhu7vusAo869J4evqm1P3K3
	savVPCrLUGQewp59J0OME03a4p0OP2dCdQDMr27mwpo218DhQPTk4PbWv/wE4NTS
	y9/kTv7wXRf/Z7m0ZEwpXNHTYmKqjB2cdQ67FeJ5KnjNxQ3MMWiP2nfTSJeI/D89
	X5fdn4vOPH0tyOGJ1sMN2nJBxpcCaIlx6JdkuOb4TZ+jB5cRqKW76jPN4SF6h4fs
	ZePZ2ac8QvW3Dyn/ZzFAiVkZFTCK1Q5+IwUa5aYEzDmDRQ0ufGfGxU+Njty5GSfj
	a28m7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0gg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 12:09:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b5ff26d6a9so4327985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764763781; x=1765368581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOIwtlbSfFO1paT2asaWBjRDgzfRuNe9uiSWK8bXW1s=;
        b=SQ3oZ+c7D+c/Ek7mP/ldVZKlMT9RagW/1MsWvgNoEa+69P0ApW60nHQIlK34kQi+gd
         hUSG68E1A6vVljSV7VkWI2G/kJBAy72AzQDLOt7F2DV0rLhy3XtsfCMEfx8M4zmETj+3
         1aD7G0M4JYGCqa00A3JfwpE4DBMC7ApUGoYUzajSDr3lKP4P2q/vZ2gEpG7hZsj/SuNM
         oBxNa7K5WWbO+aGCelTUGQy70eExIUel4t1ABwrWw/9lAx10+L7PEbgULJRoGaYvFKV5
         YE/9//zdHektKIcyyjza7b0xwrMWqrGUDA3NwdHP4hcKO55Wo5bbflAImGP8IOxxbVY6
         mYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763781; x=1765368581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOIwtlbSfFO1paT2asaWBjRDgzfRuNe9uiSWK8bXW1s=;
        b=HWnSJfv/ax5bZuXd5DSMpIiUdtFLuLazvmuQ91q2MWhVB9mY7kqbC/LDqhfwSbehgn
         x1O5/7eYx2FOj8Av9GhjIAwIA50rM57JbFBM7xO6juh++s/D8DhbSfNrb4orPDGFFk2Q
         NyqYiGqE1HtvhRd+i5WIg5/M85agLt1XBM9oQLa9kfwiR8L++Ejr5I0JIC0TfdaPlX+B
         KUYVF3xhOvLtZ/GeaCJCVWoqMJo2o5e0a/LkCMMc20lPrNzSGiODZf0kcMEeDXmQfM42
         qXx4e6pu9bcnjppIfylM81TXuPiV7sFD+GgZgqKsUDTUljJK/4h7w8WsTKp0vCJJygCC
         nv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoDLvOXtCGJgHrahWyjU6I/xfLrOCXm2A6LehUl6KOerfNf/ZsZxjOSF78x4leoQiUthZYCsShozRGSSEn@vger.kernel.org
X-Gm-Message-State: AOJu0YxysIqxQFOtktWKOkYdd63roKZDvgdV+UfuO0kAn9AX6lZXOQKE
	/d7i7o4HyiJUzUNK0illFeWs3Zy8FZ8+XVhwq81Y8O9qsGP6JVkJ/wHYH/+kmy9mTbIYf5bbfKb
	KEh+GnB/2xnCbWVByfD+XjPBDL8QC8bwdejvMVglnmHZTNIt2PFC14sYpT1SY+PL9xws+
X-Gm-Gg: ASbGncsO3mElSg+KFbBUG20/1eqifAVr9+dDMAijMYcAg1L4ohxPolO1KcsE0ZLjKyJ
	Nr8u6dMe9/KNs2EuDkem4KRPCOGDqykzljanxzyNyxaxQNNrXOS+/gSCuq/UgqEPW62xQ+qSzA/
	GzigsPy2s1okRpSRTB3Sk+ceyJK6De0FNcyAXmNT4042nPm7rd+7rBarN/lcQkyf2iAttLPgBBs
	qjmX1eUD7pE4LWhc03CQhTpOJVW0ZCZeGgwiP5rR4iJ9ITC5Re5sALb/2xUMTBkYs6XBMN01RgK
	ZTByNTKn1Wm8nPbUl2IR6RxsqWysPTWYYM3P0hRNhp/+83PCfoYGdcScP5JNs61rP5w43cQfZ+t
	rNLmPwoZKs6PQGUyvtkoFWBmLyyumyhE7tMVcI7h2s+QP+/eV08D0gJS0B9arkppQXQ==
X-Received: by 2002:a05:620a:d8e:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8b5f94f5814mr83771285a.7.1764763781429;
        Wed, 03 Dec 2025 04:09:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/tQNWpWIfm/aDbuyctvia+8c7GjAosDE+DztBcruSp1YGOG7lD7uBXr/D5xbZQQkBr8OI2w==
X-Received: by 2002:a05:620a:d8e:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8b5f94f5814mr83767685a.7.1764763780870;
        Wed, 03 Dec 2025 04:09:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510508d4sm18021174a12.26.2025.12.03.04.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 04:09:40 -0800 (PST)
Message-ID: <c743b023-21ac-4e59-97d3-982c1467c8cc@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 13:09:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_wcss: drop redundant
 wcss_q6_bcr_reset
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: linux-kernel@vger.kernel.org
References: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
 <20251202162626.1135615-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202162626.1135615-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _3aAnVr2B9VYDHZjMmeW3bG1b0yFGrxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5NiBTYWx0ZWRfXxYG28yl5+lHt
 0WW6yFbNIJ3LE2C8/kKmvVZxfkd4C0IUqRIQfME+Ss6HSSxYvb4Hox3raY5iYlD5NHszN3cmyzZ
 dB8NysYCR+6xdZu5vnU8Vth6rxfUI3IomxELur2MmY6FKlTW/JLoidYH2SaJwOWJbzRF4mduUSA
 2KnnUCUQD/E21Qu9nFdphv4GUw8vy9TY130eO0LcKMcTz8G6mCThNIbSzTRpnIQxr0nsS499gMu
 jQ6MLPsKn9H4WEBsBt86U0bv0Amw8VVJ93weDV/z3TRI4XeGmLfNoVfzbLhQjPiqMeJCKC1k31B
 yZPK6i6HqF+Grga1rwCLEnvA2bMhlFVMsLDfwekwkC40CUA90Ak3jBwHZg07mlb9lrdCholT/iZ
 +nEqS/yfG/2OUtA3/pkB0++CCPo5VA==
X-Proofpoint-GUID: _3aAnVr2B9VYDHZjMmeW3bG1b0yFGrxo
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=69302886 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=DUJM-m3_rXbjdIdpYt4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030096

On 12/2/25 5:26 PM, Alexandru Gagniuc wrote:
> The wcss_q6_bcr_reset used on QCS404, and wcss_q6_reset used on IPQ
> are the same. "BCR reset" is redundant, and likely a mistake. Use the
> documented "wcss_q6_reset" instead. Drop ".wcss_q6_reset_required"
> from the descriptor, since all targets now need it.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

[...]

> -	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
> -	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
> -		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
> -		return PTR_ERR(wcss->wcss_q6_bcr_reset);
> +	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
> +	if (IS_ERR(wcss->wcss_q6_reset)) {

This changes the bindings expectations

*however*

it actually fixes the driver to consume the intended ones (qcom,q6v5.txt)
(not even yaml!!!) which houses the description of the qcs404 wcss lists
wcss_q6_reset and *not* "wcss_q6_bcr_reset"

Please add a paragraph mentioning this in the commit message and add my

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

