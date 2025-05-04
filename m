Return-Path: <linux-arm-msm+bounces-56700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B05AA8751
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 17:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6B6173916
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 15:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5D91C5D77;
	Sun,  4 May 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZN6DvX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EA38F91
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746373069; cv=none; b=SHIChakCxb0+Z8Bhz3owPsCSUJjpsBTsi9AWLA4PUWuumLBtiFZNH7p7G3ouO1kJofHxd7vUQvD8sYiU7vEinznlbZO3onM+sPeEqZjzCa27yIqVHpwmPuuSkiZ/npnluhBw5LIyGWFJYNKoluGLwm3B+SPUxmfJ/sud9DHPntI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746373069; c=relaxed/simple;
	bh=R2xutr1iGnl0AlRF1VlT1gNU2BcrsrOnuHKMneK4Z10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgrGYO4e7diCdwyk5SHk/7LciqSiWy0J2q0FXsrQ0ELcel0usIhgtn+9zO/daseQR6tCFXGrkwa+8TP9Ukh9Zhc7IEofn7vJeZEvFuT6tSyE/C3EuBMjqU/YliGRy65kZK38F1J14XFpV5vUjViyk1vgrJ6C+kgvrqBO7lFWLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZN6DvX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Ej2w4007929
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 15:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8J8bGYOZSSA8D5P45JYX64wP
	eN7udZjhNxZL/UmjYmI=; b=aZN6DvX1jDnCqpajUand/dpLN4Nl9CO92sapqSN+
	wj0OTPmz13n7k1RmnImj+ea64rVUJmBW4tX9KNxraW/C/zIlqYqNxz/YTPMmwhLS
	HNzpeBDN/abDm0GUWQKVe4+5sF6p7KGFbMvkg0F5Fz8YJJuq7vXohAAKZZb1FmoY
	cIDKBg8oiavceAUxaJfPtrN792CLpPq0ipNaNMBi+5kI9OENOcSFnIqZJGz3swYl
	CXUpot1UOaCvIQswPl3Nip1WUnao5+10EpKk5y0YERjb13oed72sk+hsBuBv145V
	L+RVxFV8Hvi+OGniFZ5F6QjE/zv9sAh7iDqmU4ugPqjgcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj1tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 15:37:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so659292985a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 08:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746373066; x=1746977866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8J8bGYOZSSA8D5P45JYX64wPeN7udZjhNxZL/UmjYmI=;
        b=vcBs7eoZ4rSCRw9ZahLqKySxgVaXZroI/IpXX6rF8hahS28e4T6Y7QkgCBktLTaJlT
         GxbHpA1rxkgkAtAIY8KRHo17sx2ExkQ9AdE6GoSkGgAUu4RSCC5kn/cAfoA4zyeBs5tX
         FyuQ4mrxoEfQQjM+qI2/X7hQjeeuYJkiHAH+lEQXSe4nEdHaHN2uMYCDY71XJylvHwOY
         s67DLG1exa78C5yhuFiUyC1i19MVyR19NqcyU39q8vEBXv1emv0X7nb4ahVmRWBnyNlh
         xdLkmQ+MT+aicbm+wJm7L9C1HVQqsu91tKt4h7KDWoJW4LP/MdHmWvZ6628ZT9KqZr1a
         Plgw==
X-Forwarded-Encrypted: i=1; AJvYcCUGurkkItcXR3VHhSEfl69sFEzgj89m+TLSot8bpvDl0AmCAjN5n3Y1AP/6FaARj9cm1/52Dpgjdrm0+fF+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Xr0wdkqGLWmDILkwWsm/+a3/JiOcY7Xh3rcMOucpFHJFDkmB
	LKkqQqrN+nWUKdKfazBucLVvKQEO8CGWc2uTP/0ukyCoMA3q+/FAP6+nq9mjFI3FSITqGdskPH3
	T6NTLvNB8AdZgOK1iZEJ/iFjxwtk9wh70dGaHEyeTzKHsQEaOePaobW90FsNSMrVU
X-Gm-Gg: ASbGnctnQWeLx04t5Cz8++P9GYrBarGXpUQqzCpQtuYqpkIrbxYmReeiQMfWv/nGuop
	T4AavYFjB6OGy0FT+TLxBPWDma0eJrOkDslbSnm/1gQAKQvypan62OXE9ACZWcI27VfpBEofaEr
	p/lFIWTqXd4JYG1CHxm7hYp7iJeOe9kYcGHW4WFL2cerG2/Mz8Z7X+AVAuOla8WF/BbMUvABG8N
	MN4sSsV0GHmRUuEn7byZ1LRiJJXGbP9HfUE1qa7dBB3lOOBttQjePcm0WsA9A4cDheV1eTKFjkE
	1Wx+ooHmin7dUl8I2kcPAJL92jjKSh/R70x+a+FCYS5jVjzW1PerH1N30/3dc31H/BzK+DfivIs
	=
X-Received: by 2002:a05:620a:414c:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7cace99ed1emr1939684585a.8.1746373065978;
        Sun, 04 May 2025 08:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKu/YOLUixhsllPZMz10hB6tnLnnl75sQCaZlpL0pB9iFUtQTIQ1rLugPO1WNiOnmuvG6ZBQ==
X-Received: by 2002:a05:620a:414c:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7cace99ed1emr1939682985a.8.1746373065636;
        Sun, 04 May 2025 08:37:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee087sm1285876e87.147.2025.05.04.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:37:44 -0700 (PDT)
Date: Sun, 4 May 2025 18:37:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Message-ID: <prbe2guxzsea6aqonf32m44zp6oa3vzdf5ieazcontv4fmx3d3@2r4tu5nr2k4x>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-7-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-7-quic_nitirawa@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0NyBTYWx0ZWRfXyMcTSnqBm8d5
 rjnTFy8t3J2lPwi9bv5r6nQ9DbjozSTvstY0w+sDevU2eKUF8sl1gjOt+N9N0YeZ+VbbQqxzLKa
 t1YhVtAfuwqgvcX99SKGEl0mWfQ2ziBQtxg/o2dY0i2NsV4Be7ZH+BtyBewLIh+BmPq+PD/yRog
 FO4vPwAGcNnP1020TjGCQHD/WDrrJrhdhx1jQ1n789S69hRu4vSeE+5jSVRs/iiGF4j7pFgAm6l
 rWC8Igkq6tBh4BcbkFy83L7pBkOYeV3zFHvWWZtuCG3JQ64A+ycn/Rb5KGhzNHcrgg0V1XrDeJE
 C5AXTPPHKFCku704VfP/lAmPhR/l84c88AGYLFpmwq0jVJ/wx/1VilXOooMgox0U6mm9cGgcmPv
 RDINtanCJBeNqgS59t6vvMwLHZt3OpijNYPAAJ3wGMxEz3tlsYN4B+XbpLJg0hRfXc+3rGVy
X-Proofpoint-ORIG-GUID: X91taf5HAZNVbiqrMk-0PEniPpfgFHw0
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=681789cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=xXtjh3xWv7Xu3w3lKiEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X91taf5HAZNVbiqrMk-0PEniPpfgFHw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040147

On Sat, May 03, 2025 at 09:54:35PM +0530, Nitin Rawat wrote:
> Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
> functionality. Additionally, move the qmp_ufs_exit() call inside
> qmp_ufs_power_off to preserve the functionality of .power_off.
> 
> There is no functional change.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 30 +++++++++----------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 94095393148c..c501223fc5f9 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1835,6 +1835,15 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>  	return 0;
>  }
> 
> +static int qmp_ufs_exit(struct phy *phy)
> +{
> +	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> +
> +	qmp_ufs_com_exit(qmp);

Just inline it, unless you have any other plans.

> +
> +	return 0;
> +}
> +
>  static int qmp_ufs_power_off(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> @@ -1851,28 +1860,11 @@ static int qmp_ufs_power_off(struct phy *phy)
>  	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>  			SW_PWRDN);
> 
> -	return 0;
> -}
> -
> -static int qmp_ufs_exit(struct phy *phy)
> -{
> -	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> -
> -	qmp_ufs_com_exit(qmp);
> +	qmp_ufs_exit(phy);
> 
>  	return 0;
>  }
> 
> -static int qmp_ufs_disable(struct phy *phy)
> -{
> -	int ret;
> -
> -	ret = qmp_ufs_power_off(phy);
> -	if (ret)
> -		return ret;
> -	return qmp_ufs_exit(phy);
> -}
> -
>  static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> @@ -1921,7 +1913,7 @@ static int qmp_ufs_phy_init(struct phy *phy)
>  static const struct phy_ops qcom_qmp_ufs_phy_ops = {
>  	.init		= qmp_ufs_phy_init,
>  	.power_on	= qmp_ufs_power_on,
> -	.power_off	= qmp_ufs_disable,
> +	.power_off	= qmp_ufs_power_off,
>  	.calibrate	= qmp_ufs_phy_calibrate,
>  	.set_mode	= qmp_ufs_set_mode,
>  	.owner		= THIS_MODULE,
> --
> 2.48.1
> 

-- 
With best wishes
Dmitry

