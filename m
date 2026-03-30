Return-Path: <linux-arm-msm+bounces-100881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LB3IODEymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:45:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBD35FE7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63BA4300B9C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B869EEBB;
	Mon, 30 Mar 2026 18:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy05irhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2hs5Eci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438853DEFE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896346; cv=none; b=NLjbmPKYA7v3UBIrGq/ok9A6SqpfcZ5Z0bgwEUNoITbYKnNCrky1TP8koeAGx2/qFpYlFHSydg7jmup6mc+Nl4TNssJkKxOuYY2cigaoKBn3tjyMDElBFHXDbbXmu3ux4q4hwdkEOy7mn5FXsg7u11aRC1xyGPMvPmGhVhoLVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896346; c=relaxed/simple;
	bh=d/XTOWWqm0oWktvbWfuLO3lQrFQbiTUvkqPjUJxxsdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbtfJhrFX9Y/zhv3Juw1Eg384Y8noFeh36q3wKmeY8h89D87XEV5TPGQqW50AoiCJYzuKOSJGF8F5JTXievWpbsSUS64uDtrXvhujdBrXkpWgp/mj1G7/NS41adUPam2pEdxrK52zVPu0dtGsZ2Iab087BRTaeXoWnKzDTmq+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy05irhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2hs5Eci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIWN6e703510
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGINkZ/CzxHJcm7+tFz+ACk2
	brf74z0Uya2Q4uJAxoM=; b=Dy05irhriU+J7yUhudsbZXn8tWmLa7wIUEuFnmMi
	aAYr4iErDkjDkTjU4zJGy4tFWxRnkiwufALHBYfiS8oEEhGx6EKQyW/fDZuOZDl+
	pqEqWtz5SGkHVLrosE29bceG+FmTXVzWZC89suVlhfnwu4oocRGGA5mTE8saeyVt
	IYk1BKkdSLX6kvHgCHZGwC2J1rrruxrCy2NBWbPCQNlY4OQPsltL7AuiYl3m8t/K
	E4IeQ+6gD+fOuvNQZUN5KcSQ3L/pXJ+Mbm/+wU3LlM30EcdvL3rJcp1gPBCEQp8i
	D6GQjiljUcx3JKDVBsmqH9+8ZkXJX336bpBqYxP/jSklLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansg72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:45:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so156733721cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896343; x=1775501143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGINkZ/CzxHJcm7+tFz+ACk2brf74z0Uya2Q4uJAxoM=;
        b=H2hs5EciGhuhI0Vpd8i6TlEVDXQ0hAp5STn6keQl1t3N4G1LUhj/l9+ceJScGGXOBa
         x/dYKpeoC4CywXiM9AEKw639wgXL0I36ZUksnDbJ8eY45cXnHKOk9/tyMYD9QSrF0B6u
         Sr5omh1fDuAwqrnhax4Fi/ZA01NDsUEkMswqDAQ4jpkRsNIiN2yM9bgnnFOyWPUoyu0d
         HBIT1GKdINuyOkCCoKTnt5hqDsxl091kGA6inGSVYhoovAX4jfUR1wWL5vuNJlrWPfpK
         Z4O67ozyv1tGV4G63y8iNvzNQFZST2x3rNzBK4Mli9TKF/bq8x0SCiH27dpfe5qnuxBv
         EINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896343; x=1775501143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGINkZ/CzxHJcm7+tFz+ACk2brf74z0Uya2Q4uJAxoM=;
        b=Oo0WRlHg4XwSg2hc2motepyFZVfE54BEGoIX5ZIUqd4JyA0nSfqMf+u2tV/ZdItmCa
         F8MGrW/4Q+cmujSKwj3rksq6HUnIqjouog/iInD+dMx2ldiKJ/N/BlmPsYnqjreXp446
         rpkt7egGWYi9XuuDMwF2g3atGsH4AFGKIihtcybk3Hu+Bg/CPY84OOQwWp2xhsOAKLU0
         N2pUIQokqtmSbFYJz8RU1apNPqb7PHFGSxzsSRwlSp8oLZ5g4JEAT1MiSipPWdukRUCo
         ZOipA4IjS0+kwLLWUk7bD0AnsqCM5W7CQVZQ3LD1AmHRNMuNm4zjxRpfiiCG8EGHA+js
         ixZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcZGJKoj8VxNsC215K5b1TIt0LzNSn5JF5PU+NfvPveDfPMQCDVW9gFJw+S0pcro30HMy5xvELM/4GqPLa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XQpSg3gApEAfJzMhe7oM711VVIsLhPor/cE48G3pqNSiXQgW
	T4/X7OFgyRx2hCc5AaOPgKyD7YIdnwLfA0rQ9Q4Jrj1o58gpdVXJPECGmn5kLjq7UhDA/+UQf0n
	QMWEzxrij1iaLfNjtRF6cDMf2KZBlU/2AOKRHH/ErAfyQ9BAR5JxwdAaK7lJiFr3dd7rZdqUcIQ
	HX
X-Gm-Gg: ATEYQzwWjH/lPqu6kk8YAHT2cVsBGQ8rga6yb6PUk8gk/akAvL3bIyioPszeCp8Htwz
	7YXauO6m4p1woTXILPX4ubLoj05p0BaROMHmXtxVT3VIbkwjQWFn4tOtrFv+ERqtGOOXFiVBlgq
	lk9zIKhHNMxAYKUQ5DpV84YkHPK+yJMtnfQcsHS029jFXVFO6+aUKE6YUyj7r63FqbWdMtk1KUL
	O98Izd3C0hAxZYgeTkx7VvjEOxMy4aLPwgLp0bMQMsH0zgPdFmsV1mhsnqPmhZWjmZlV0TsE1g4
	HDXl11uNdKgB9Aa0cXjL2NC4mUO2zz+LqZ4G3VpNWcoXllHMzUNVep1CWBSnGPI/8sOpv1rbPSO
	Qj1aK1evgrloP0yF+vYzHGTYOYj3oH/JtyGsAy8crHyai/uTLeTCzUwaUQCfmDBSDp0S4XL3zti
	KR+pUdg+dkSrnprF03AwH9ojRYaUsegxJH6pM=
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr174205031cf.65.1774896343231;
        Mon, 30 Mar 2026 11:45:43 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr174204611cf.65.1774896342663;
        Mon, 30 Mar 2026 11:45:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1443f23sm1910487e87.42.2026.03.30.11.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:45:41 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:45:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] pinctrl: qcom: add sdm670 lpi tlmm
Message-ID: <ctbz2i6k3ipqzvus7nmz4wu56dp6qiy6cqspl2tqybdcgv52fs@xqbiskjxxfqn>
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330164707.87441-4-mailingradian@gmail.com>
X-Proofpoint-GUID: fv-3ue9FZRs7s6viQTbisdKm8xbNdeoL
X-Proofpoint-ORIG-GUID: fv-3ue9FZRs7s6viQTbisdKm8xbNdeoL
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cac4d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NJrbL9JRX9UYfUS_aBgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NiBTYWx0ZWRfXxSm2+iweXSKC
 slGQyf8zf/g5OuoClVw8nTxBHhID8ixdHppO9MMYJcCi1+Iga0BceFBM63VbcyEsbRuRsxs5Qjq
 mZsleXkBgiN3GazowQYDTm+rmjt3nyrlmaI7CYwW17V5Jp3wKluCP6yQrsiCzmw6x2anZS0ukKo
 kiKI48Fd/gRFfw5MPrLYc0Xi/ZjG7cOXxEA976ap1RZKFLixtfwUy1GtdPYy6xZtFrldlTrGpLT
 8BUnEdNYwkdNGlK/RjIoIEU6qZWhiXKL+PIluZubGivNnY6AQAxLQPU9sP5pCZnQivx1nuMSO05
 zdDxkj4Nt1BWsUTXz+NHHeRoP2w2OAP7mq7Lw3EHqXX5UqnXzDwSaBaRKtvm3DjEv0SS0g1CL8S
 G8bGoaXG1VGJe61Ej06F7a2Er6lv/BFnVT5Cz7wfcPBDWAuETtY1ttzRF+Kk+9l2qhPtkqrgfNR
 /KpbwyJPUd67ry/K2Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70CBD35FE7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:47:05PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig                  |  10 ++
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

