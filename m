Return-Path: <linux-arm-msm+bounces-65991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F1B0D1FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 895DF7A196B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 06:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D73157A67;
	Tue, 22 Jul 2025 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jg6WO/Ty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542F28B3F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753166339; cv=none; b=G5oTt1zYdswB+Smt6w4jjBAMpsm9TU96ntXvT69u6dZB/ZBTIxCe33ecw39jmiz5pxK2KGsNVekaOXc/sRsoc6mGkAuyni6XE61Vso5N5TYaniOhS1qvLX3Ox0bfiqsPVMLjsgnLWu/CtwdbiWnvgB1HlWT8i80eug1ZbOf4hAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753166339; c=relaxed/simple;
	bh=nv5BKzMmeYS+0BXgDRxTOk3LBVpA0pyOQkii3cTST84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGvucfqXNMloyNVluX2ufCv5daCWFN0ekfFe7G3m0nazc9M56AcUWM8VXttdH83CnMkCNqLOV+oKxWgJCj9u++urlkU0UfNWBy/g61R9x1S9tWzF4PxxwcIbDdBG3aR9wvriNoQmNFQRjpajzW/yXFSXq/G2CdR2Dj0zZPWgNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jg6WO/Ty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3X7ND000932
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/kicygk8G+o72KNhMNo4zmHA
	GE5DDAi0EuNll8s2Q6s=; b=Jg6WO/Tyg2KEvvMGE/UJpTDms/fv4JM6NV9XWaNI
	VaAH0jpwTWaLRmyQH+Fsekhhhb4KZgyf5q62+rgWZ/ZlBOBOnjisJauLkiJLBZb8
	ouqwQFVltc+SL7EWq0NL1ng6+4AMs/0p07ttFZH8gKuNaFZOJLqCI9SIL8n/2TXL
	lCxollu7u9dMckiG7BBIoonmeX6zRXhfHQUQJTErI9rL0D5vFeM8BFGMg+x+Yxf0
	sJQu3vaEp6W2o1zMT8WrFNo3lyQHD9rtoTpbc5yXXE2qawbf+SUCdoa+VBZy3sJ5
	8XWjgSC1OqvFudx2qE/rR/Jdj8YFxbeRq7Gnp6XzS8K8AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dg8ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:38:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33f7a58f6so804921885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 23:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753166334; x=1753771134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kicygk8G+o72KNhMNo4zmHAGE5DDAi0EuNll8s2Q6s=;
        b=WgZK2z+S1QFgU1SYNZg30DjSE/Vy+OH14/Wc4iD4XhwkwFYt0BMhrYELjk8rdGEZtb
         bGWZnBfvF/rO5mGPjsg2WmDZ+IPF7F97HEUvgrZghWq59qV2RTZ1YEyYi71Vl1yHJJya
         AQ6fL1LdryFevaUXnQMWFC2WH7LvrsZ93h5tx9jk6B3b+r6HMjDDSQlRNv7p/D1OPigl
         UQ4Qb1OEKPST1REHPphlUuuoXqDf17eN6scUVTKllx8nzajOyi/3B44jninqR2PTwjft
         vF6MHIpAeraUG4+bIRoajOYkdxBt5UW6ellJLP4f9tsGs4QXv4saPIup6e7MMpqR0iak
         ePFA==
X-Forwarded-Encrypted: i=1; AJvYcCWtXV+j6l1U1wWQb6POfww+sS78wTzBS/qIIGQbk5QSd3OoEfjSKwwCvyveqrFqnSFURUPdLxxri9FQgYuv@vger.kernel.org
X-Gm-Message-State: AOJu0YwunLFG7jLrZNTQ2QvVAIrZtsUb9tqwG7e3bM5qP0TzpcfHWXEE
	SAr7vdPZCe6Ct+9cMCNmdbx23qCJPbqpVreCU19/QkreO6foo912FA4e4UUUWx7S68++3NJByrA
	xhd7zpQ+PpwaWAUgbT3D2Yi30u84IX3t9lcnFZ0XgpsBeeHdysx+2K1n+E/ABTWn71I12
X-Gm-Gg: ASbGncueb6H03IcWqtLhNuPI2iaZYaXlpOaJ2s86rrb2g6AY0ikmdEnJuyDRSxaKFRk
	AxG1/5wWipR4lemPHml8WCMJVlx62aU+1dtbxq1D+NzIQmZj/GXN7zpGocKSBKVXmgtwHpwuenm
	MI+oopg9vo2e9OvOSrHW8cFNB+lJkOwQUYpINN3/WS5mfMPyfUVMAIIhfPj7Pp85+GezcWGv1/H
	MtNwvh/ysisTF5tD/dBIdjlPK5CrSnxq7PMZ8HNJ29DH42SBiwML7gUervwhbodPwvqSnNhYjVO
	Xt3kowe+Wx3SGdDCrivRMSI/pgLV+gI6s0BGdXl9CE9LFP5kEuaKt940et484fJMHBCaABTzrr6
	10U4iTXRxMI9taPl4mXyIpBlU4S0OVZFn+LN9dtCYc40UcdtzxRMq
X-Received: by 2002:a05:620a:2943:b0:7e3:3ce3:aa3b with SMTP id af79cd13be357-7e3436146d9mr2995286785a.47.1753166334547;
        Mon, 21 Jul 2025 23:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+MyPilAzTwiXG6RCCwG1+kBPaTSqsi6NwSEYBQbTso6ft4Xw86uogd9kxCGqOLTbwSZaEjg==
X-Received: by 2002:a05:620a:2943:b0:7e3:3ce3:aa3b with SMTP id af79cd13be357-7e3436146d9mr2995284885a.47.1753166334064;
        Mon, 21 Jul 2025 23:38:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9b1bdsm1847924e87.19.2025.07.21.23.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 23:38:53 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:38:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: Re: [PATCH] pinctrl: qcom: Fix logic error when TLMM reg-names
 property is missing
Message-ID: <ximweq3tsedvocc2k2agl7gmckcvttsyiwcer4wjfenni7t62b@7bkvchfxm6a2>
References: <20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f31ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EcN-t1bWbtBV2Qjh4l0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: evKubb3Msb_uuobo_aHVMLVvbTdCAcec
X-Proofpoint-ORIG-GUID: evKubb3Msb_uuobo_aHVMLVvbTdCAcec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1MyBTYWx0ZWRfXxQzUrP1ZHPRQ
 Cbu7sAhWA4Ui6JAAi0IeeSMa5QY+tQKLqUaw5SqNpfT/ASf7C3Fx3SRFJetLoOntWO22+IJV993
 RHl4tOg9i+CXzRLg/5oppOpB/n5/bXM1926iCjzjK6WDR9j2Y+IYKAI0A6SIlOrIQciOs11TizF
 Q9o4yvgy9KC+K2m2dWnLjOmwuSt1yNTZL7maDWhj1YJr41RlZ/UXZBYxAZ1nDWRhFOY+GfBeDsS
 pGY+1mKBD0YH9w/Mlkl2eDZGOaPGRWGS00BJyJbb0ZIn3Hvx4DmsgRmvcOuM2x0DX7GRdgfnzXf
 xw2l95Vvy8slBHnMZPkVdM2uaxip7eEz/HRzLxKOvCYWr7yS2Wq1+80CBV92w5cU8bptI8y2+c1
 31egmKJytLKoVJPg1Q56ksNIfIwFf1JAE5f7ChgZCBNxnZDq5SsGR61M8IPOpyYefsf83s/4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220053

On Tue, Jul 22, 2025 at 01:44:46PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
> region without the reg-names property. This is a valid and expected
> configuration. However, the current code incorrectly treats the absence
> of reg-names as an error, resulting in unintended behavior.
> 
> Refactoring the logic to handle both cases correctly:

s/Refactoring/Refactor/g

> If only the gpio parameter is provided, default to TLMM region 0.
> If both gpio and name are provided, compare the reg-names entries in the
> TLMM node with the given name to select the appropriate region.
> 
> This ensures proper handling of platforms with either single or multiple
> TLMM regions.

Drop this sentence.

> 
> Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

No empty lines between the tags.

> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
> index 7d7fff538755..6de8cf23f9f0 100644
> --- a/drivers/pinctrl/qcom/tlmm-test.c
> +++ b/drivers/pinctrl/qcom/tlmm-test.c
> @@ -581,25 +581,25 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
>  	int ret;
>  	int i;
>  
> -	count = of_property_count_strings(tlmm, "reg-names");
> -	if (count <= 0) {
> -		pr_err("failed to find tlmm reg name\n");
> -		return count;
> -	}
> -
> -	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
> -	if (!reg_names)
> -		return -ENOMEM;
> -
> -	ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
> -	if (ret != count) {
> -		kfree(reg_names);
> -		return -EINVAL;
> -	}
> -
>  	if (!strcmp(tlmm_reg_name, "default_region")) {
>  		ret = of_address_to_resource(tlmm, 0, res);

return here and remove braces around the else clause. It's strange that
you didn't get the warning about calling kfree on the uninitialized
variable.

>  	} else {
> +		count = of_property_count_strings(tlmm, "reg-names");
> +		if (count <= 0) {
> +			pr_err("failed to find tlmm reg name\n");
> +			return -EINVAL;
> +		}
> +
> +		reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
> +		if (!reg_names)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
> +		if (ret != count) {
> +			kfree(reg_names);
> +			return -EINVAL;
> +		}
> +
>  		for (i = 0; i < count; i++) {
>  			if (!strcmp(reg_names[i], tlmm_reg_name)) {
>  				ret = of_address_to_resource(tlmm, i, res);
> 
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

