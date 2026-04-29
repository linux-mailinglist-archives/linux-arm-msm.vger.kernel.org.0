Return-Path: <linux-arm-msm+bounces-105214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHNlGSgJ8mnhmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:35:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD26494EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17E153007883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDE523EAB2;
	Wed, 29 Apr 2026 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsRh/+ug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dlnod9Cc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C03B2FFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469730; cv=none; b=fgJ46dGy51sSez4AF0XQpwdWceAsQK5tcpU3SoC8q7PclSKkCYSlxV4VwaAwz5maHNHte/WmpkNPWYaiJX9GiK8qdq7gynm9/qnlXatuBJys/f8Dp7k9OUNJy79WR1qL+ni/GNf28xaQaqVXRPvaksljM5mz7S6xLIksy8NL8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469730; c=relaxed/simple;
	bh=dQ7G8CS8/Ar3YmimktOhJKdAiGZ5ee8KmC6svO3a7fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5Zb6TLIGoGvpzHrIYhZt/a3Qa67ScyvLSkGg8bPzlq48G8LCqDpdSlL39DkSZyQHhXhKFnHyd1h1S8ISspZngigdVWS7Bnr5Kt+yuxf6GZ6Zo807UtKAdv2FzM63NxHgdUyd2LVtzW0FmbQuFg6p2fifgE+93kpqonXWspbPk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsRh/+ug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dlnod9Cc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7Wx1721243
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xjO6eM1A5QP/ajoG9SMWnUlx
	UI/0ZFejs2baI/qShgo=; b=jsRh/+ugpoD9sVsvAj3Lvek4G15yILU/D9d/eApp
	Dhq7iBs1w8uL0MU9BLOm/gVYxlgWts/KzjFJU/qYcu//6XBcBBW1Xz9zcFf3I/RV
	A9SWgrHfW0IbB29roQma7lRGQTd5Au6WVF6Nyee5PplVP/8NiO4nusWWkw925TCa
	tsNO9Rip3+Oavzf2y7OZmBR2XqsZJnetRUSM8PNwbPn8hAMmmmhOGaJccscZRs16
	VhMrpZ1B25AKFIK9d3/gBT7wH32sqyruYZ27hUvZteoRmN2e4w23qr1Ai9gDxzEm
	om8oMa2Q2xwAP6VtTMqW7cCU+B5+CNa8rVXyIR43InOFmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7327vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:35:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-362eaa3aa61so6832673a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469727; x=1778074527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xjO6eM1A5QP/ajoG9SMWnUlxUI/0ZFejs2baI/qShgo=;
        b=Dlnod9CcL1fTgoeMgsWwdB+O82H7MbLYTmYSLVBJXgNDyCBXiTQWpruV+SdelH4DH6
         +dv+RlFlkdMitv2Om0HV1clkch2J/5MOl2ZayA7ZBtuo1KwMkpOQWx9UCH9NQCCPEWq2
         XQE0Tbg+OXg9mG5I5A2OcLXxK5ffRTDmHpuvbKLclxJKH0pTpaUCePaUgmtDQ5ETTBi+
         O7qAXecmihJB+mVPhqKFcTqvyiHEwg+inPqjZqOlRhzWbEQW8gyxbwm+cojW7+O/6qJY
         0BYV4/dolLX6kwwGM1tBbdBJZvLzgfjbBlseJTalPv7WtJT00WpWRczeTjSrYoaAA1aj
         rgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469727; x=1778074527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjO6eM1A5QP/ajoG9SMWnUlxUI/0ZFejs2baI/qShgo=;
        b=mOLVzsOQcvFq4V2RoHaBkvdA8i/YeYW59RemkcME8zZZ2mmS9iPQfrvsSSSqM76jE+
         0ul1oUFGpHCSQq+FeiNsJuEEvaMHdxfpotNscI0A0U6GaBnYwhT0epp6PP9iXNw2olHV
         9RlzmsWAd0/9CNqJLaKToPsI7xaY7S6qpmcteyKKRblcK+J8NbFVl60gU4YFaOcJNrvx
         OgWkrxv+Cib+kWwivcDZB+FTU8KrPlaY/tspREKdKNxi/yD+CkkLvRdAS24Peb8C0tvx
         g5JHXonfL/PHwuHp5k17Yan0keMNrSVf2RZcAHItngL0pfb5KJBHEYagjxJEr0bhb2QW
         TClQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NN51qCeE3IGKtehJp3rhw7J8bfsWuLI2GySLWHIds7jypotH7ME8Trrze9m4PMKwe1F4aKCvRUsK+QnG2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3DnIvUHmNcwZh8rpXQVSGh0LpCdMOwzgh63dcmFejVTOorPL
	aCH61EgAZbZcoouxPxn6XAgWmzfLeVpLaD9ikok3Fawj94m9le8he12Bfk501jKYjfTGa7yoMoP
	ajBUNg27ydKsLKsMoaGR7sp6IltYNZ/HrxgKYHR9hI677TDPmfAakGNfhVh3WN26fZapy
X-Gm-Gg: AeBDiesQ+pC/uU511gVzzLLoIA+X/8X0nOfSQ+tyEk7P/uOt/Ke/XDCpFgKPOlK61UM
	MvgUZj4bsip0eVko8eKhmeUH8PKUTX6XE3SFIAFBP527lx/y/zuU7piklVhtcsfB2zetjMSxihk
	N6MWCnv1D5umB60WE9ECxXFZwUY1T9R56XIo6ertiZlmdirejbUuG++rxS3L9qpYGihiRVapH8T
	x26xXnNoKSPXfsaMXW+9MnYHREakAhme8AKqX9KHpnCcDLvCpE9yw2HYmvWCQDIb9eToLb+LaQl
	05Keo2ZWPDdb6xq9hbEGkdREV8a8vfj2FKq4etYoQdTKdmGqD/2qxG1SW0VtVPIkN3uqhhLvefO
	hatKffxRb0DUMAJgNjYL2CtGayMdAVfYWLx/29YPFE5YjsEO01q+fOfEZ6Oo=
X-Received: by 2002:a17:90b:268a:b0:35d:8ea1:62df with SMTP id 98e67ed59e1d1-364a0f3d3fcmr4062017a91.21.1777469727244;
        Wed, 29 Apr 2026 06:35:27 -0700 (PDT)
X-Received: by 2002:a17:90b:268a:b0:35d:8ea1:62df with SMTP id 98e67ed59e1d1-364a0f3d3fcmr4061975a91.21.1777469726690;
        Wed, 29 Apr 2026 06:35:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a4152038sm3325231a91.2.2026.04.29.06.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:35:25 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:05:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: qcom_scm: Fix
 qcom_scm_pas_prepare_and_auth_reset() kerneldoc
Message-ID: <20260429133519.ueqd5w2lsrvycchc@hu-mojha-hyd.qualcomm.com>
References: <20260429115209.283331-1-shengchao.guo@oss.qualcomm.com>
 <20260429115209.283331-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429115209.283331-2-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20920 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KyQoKVKRHxE9qbi3G2MA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNyBTYWx0ZWRfX6NoThtG7Hri9
 eHK/7zGyAZ0oQh/w1TYkz9vg7qCZT4CVP+PVDRfMuSOCrx2BhpDp8I2+cSLrjCGFOX6Kui7eP3j
 inJUYYEo6eyKm95jBgi0XwssNHVWmfFJJ/8eIyWEUOrA0Xi89kyKXKXHZKlbPuTzHtC/SY+Wr5E
 ml4548zK3uCPVIirc5VbeGxhxVpIP5IIl9sB6En0O9jQc3FgUbOKutUUl/aJ15jMoV/PIe8VUSe
 QcA/9YqkvX2FbLswaIuurzSCqyI284kewAfHf8AlnDyzLfIR6gG2yGe03amsHlFVrl/vwVAT81+
 Wmqbp1UrYn7Ix34VdHSTV6Rtx0IWks+or6mEbziFHYA24oRj9K5xk9KXN8MIypY14SDConEyvaR
 /8qaH81edSA+v3Ftn5un6ageuYBqIlBwKS1fK1KO2m117e3QbrRjPWhh48IgpjXq09eCjOdTGRX
 0ifxE1TtmHiG++w9orA==
X-Proofpoint-GUID: 7voYZMa1tuWvRElfM8U6BjcbPaQok-Of
X-Proofpoint-ORIG-GUID: 7voYZMa1tuWvRElfM8U6BjcbPaQok-Of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290137
X-Rspamd-Queue-Id: 2CD26494EBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Wed, Apr 29, 2026 at 07:52:07PM +0800, Shawn Guo wrote:
> The PAS context helper function added by commit ccb7bde5f7cc ("firmware:
> qcom_scm: Introduce PAS context allocator helper function") is
> devm_qcom_scm_pas_context_alloc() rather than qcom_scm_pas_context_init().
> 
> Fixes: 4a7d6a78fbc6 ("firmware: qcom_scm: Add a prep version of auth_and_reset function")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..3b762059616a 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -986,7 +986,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>   * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
>   *					   remote processor
>   *
> - * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> + * @ctx:	Context saved during call to devm_qcom_scm_pas_context_alloc()
>   *
>   * This function performs the necessary steps to prepare a PAS subsystem,
>   * authenticate it using the provided metadata, and initiate a reset sequence.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha

