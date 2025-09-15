Return-Path: <linux-arm-msm+bounces-73544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3620B57626
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2607188C6D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B7327604E;
	Mon, 15 Sep 2025 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+s1jNkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C181322DF9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931565; cv=none; b=i9u0laNXMyjnUnNnPEom7T/OSBa3yk/YTnIvOPEBcsq8h2W+gdCz80hoGP4IducMw680S9KHH2oeM/j3Z+tHf8VX71SgG4k9Md9Vn9EU69tvgcfBhfAv/WFI4nvRy3GeZQoKFaC0dKWxfTqrSAuIuGQYUMKa3VWHnBQOLP5Cks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931565; c=relaxed/simple;
	bh=GAvNiOwNLiOuGEpGEUrLWK+3lyHdXQJWYPvsInpu3LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds8evZnBbh9SHaZt0n8A5lMgW7fJ4eC6Dl6jnBq0HILTTj8Wfaaja50GDYlPXj0UywAU2hhXXznVpQKWTLkCb2XNyOohxjgVz379yutF5Gb1q03/6MxoH+nafHCoVjnAlAJlEkIS3s+TFqVqfkM7hGr6mDHYBn5Q1mSM321eYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+s1jNkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgFc014076
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ge/q8lJD6Zf1XgGE/wTrOzdR
	wImk+MA4Q8tIDE6bFjc=; b=K+s1jNkwlUVxTPUGExGvCnuguYqROv5q6NYchZ5A
	zFWQdyrpLqSJn9SA/OVxSPSBXVXo3YMQJDI5sGDZULn6rxPZlMAgqW1achPvd7ac
	VSmeXyNK4V7NjemehnIFmyBlqmfLmgkP5fyVsokav7s3jKXo6DrRmw5rtCgQE/cy
	9xTKJ+1oaIz7rOV0KNUIOc4jrvKyR7pGRbf1tvAKxqknRx2zDHPkaO2AG8oDJlQv
	z5WAykYlZ6XxLWJ4oSSf6tQN3CWD6KSuJUXBxGhMwcPY1jpE/NBIWcX2WFBVH8C0
	Rl1jvkLS/BRRDcGyiS2vf9r7oFzOHqb6GpB7Tdg/JflUmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr4rn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:19:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso4262631cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931562; x=1758536362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge/q8lJD6Zf1XgGE/wTrOzdRwImk+MA4Q8tIDE6bFjc=;
        b=mFpAxIqDn3/+sry1UZb627TnpnYtFSK/1gu0XCqj9qrKVhMf7TEqY+CkIDUTSkfc/S
         aP32iOZAcEA0nBdJFuspaqy7RmUX4dhnkjJ6Zl19lvmm2JH6aj9B40zuJE+ZkYxX2iI2
         Kt9JzcZx3RNAuOiryGSZv0cROwfBhfPsqKa/KIaze7Tew6QCtAdb60SAxwMXU8RkzDPT
         zXgRHbVewtfCz46FROYAeCQ5s5QuZMvqpCQGkSMM5HZcAoUgTZhnT/ZZRG2EPmSlJlpk
         z2cC0Ax4/6CwndXF6dUeMXG/hGIezLxVCtfs1F3idFhrD0jMPCUhGQJvcESiCN+66271
         iaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIzOTEQqQmaEwfv5QFNMKvDBhsJOdXlDIlxFn2Rp11AqeGu/uXb4Br7E40ksfzaLiwTGFfZHgnzoCzROc6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzye/loorUBggKaNnNukFArURmuOAji2nGWEzKFvcmUulj5orfP
	3LjrDYYUkWiddThwvFL/+UZPD9Kf3/pTLu8fMn80FBUS8VHSOPN1WC1NuJfFCUzjStcQZPFrhV/
	scr3XcHvGHD6TDOlDe00WOEA7Pxj5Qpvdnbhi11X0STKnhDP0sgJk9gEAJzBbMhgQSsXq
X-Gm-Gg: ASbGncs/a0l7lTpw1Od/XGjvLyVKCeYw5GHExUgudiLLhoA9QfLTLfGVZkdSxXVncf9
	zzIp33BPvyI3m5g5BpVntJyo1XZ0imJ0HFvg5PIug38WwA1h0D58ThXBOfejPRgseFt5w+h5v4O
	n2ThUhcGuDXDZYBSI5ricjs9fPBM51NWFrRPpSuzBNNZZPVk+r3jgGw/ImYm5HhSkN1bm19GETl
	5T9S/GE7LjtMNXbwPs8hYXe0qA1xGsdkPhPhM6IhKuMx1SLuOnC8dJO8ywfeEEHw2xG/+vG2YmB
	sdL7rTwK7SvsYcwtYNq2hFaqSKIOizH6nchCJsMxALE+uvVjqV+FKmCLvVPAGKQ54mDMj5TuXFE
	G3gExtoVb0qXMrD40S0sKeV7RVth5TPXb2yy4jkfS9GekRt5Y3VV4
X-Received: by 2002:a05:6214:f0f:b0:780:24d7:fd35 with SMTP id 6a1803df08f44-78024d80119mr41691666d6.43.1757931561988;
        Mon, 15 Sep 2025 03:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1FfXw0j6mkQjJ9r007AeakGY/pEvt0j/darfeawFeiMBnS9aGTLYNeE5U7vTUK75m0TpsgA==
X-Received: by 2002:a05:6214:f0f:b0:780:24d7:fd35 with SMTP id 6a1803df08f44-78024d80119mr41691366d6.43.1757931561502;
        Mon, 15 Sep 2025 03:19:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460f21asm3476750e87.106.2025.09.15.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:19:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:19:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
Message-ID: <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vfWHgYCnInyvzjUDNo76CmpSX9N7FY03
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7e82a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=q0q343tyEA3zizLlqU8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfXyVPDZDWhykR6
 +ndf2Fkhui+X7TxywpvPeGqG0qICJ4uHzXVGt9+5EtgbGa9UP0ai881Q+pJCVx09Stw7q9dpSfK
 uVfggdAv0XXauxyZ35MUOFUdA6wx4EpgTlIz1lCeqyg9rl8IEIGY3Kve4o7+KAWHS73oUjlub4W
 iUe/3MZHsrT5yvjAZoEimo84wRztWyDu+ZdUqnBA7oA2IOqoGh7Jt828BTBodFDYlmZGJi2orG3
 dzawCbn6RzoNFWcbeiGnEBysQylWD71PgzYVP/+XUpVpexTzJQTbIuoDIBuFp0FXCFAS9TpJ2T3
 XSuUHgnND5GNk53E7aCDp7TvlGh4OWbF4K6PnwApgiyYu+DHuE8PyxXZOVFvfGB42F2/ZEmbNBO
 R6lYR27U
X-Proofpoint-GUID: vfWHgYCnInyvzjUDNo76CmpSX9N7FY03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
> for SM8550 and update match data for X1E80100 specifically so that they
> could be handled differently in supporting charge control functionality.

Why?

> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 008e241e3eac3574a78459a2256e006e48c9f508..174d3f83ac2b070bb90c21a498686e91cc629ebe 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -19,8 +19,10 @@
>  #define BATTMGR_STRING_LEN	128
>  
>  enum qcom_battmgr_variant {
> -	QCOM_BATTMGR_SM8350,
>  	QCOM_BATTMGR_SC8280XP,
> +	QCOM_BATTMGR_SM8350,
> +	QCOM_BATTMGR_SM8550,
> +	QCOM_BATTMGR_X1E80100,
>  };
>  
>  #define BATTMGR_BAT_STATUS		0x1
> @@ -1333,7 +1335,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
>  static const struct of_device_id qcom_battmgr_of_variants[] = {
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
> -	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>  	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>  	{}
>  };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

