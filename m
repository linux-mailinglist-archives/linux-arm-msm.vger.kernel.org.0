Return-Path: <linux-arm-msm+bounces-63760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BAAF9917
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8731883C58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A552E36E6;
	Fri,  4 Jul 2025 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loA/tJUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D32E36EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647424; cv=none; b=j5LY+Tbhns3smC5+mREwrGVgFQ9nOG5nqIiZLh/1gG+FpZae0l7H+tu7yo6boek4tuf3IQ/B+psCcnXXtelITHw6B3EPlaEWQV88RPV5qlyLQRi73Ubv5/OUzqYir3Uh6387KAuhfxOSdpMSvWfjSAlMkdVRLBV6tItV5dUGY+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647424; c=relaxed/simple;
	bh=ck2xsriSsrklYZzoHY7Zb+J9xczZc3apVan0Zg+t6Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6zm5Dskrx48lOumN5EnjJ37/0tWrYrhmlu2kI6xgM52M4t0F5Jh2jkSVwLAaNSWXpgBAOBF/IW3lhboVtntu6EwIZMirMmqIXcHYFG21WYa6rwGwtqgZmZyDaEC6p1dzJeP/osDkHDkXOxCmrhY0nfNeqtSZreYqDaVoR5g0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loA/tJUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B65Pd019936
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fF/OuQJ8xsB/HKG8mieUfGiQ
	XUFgzhYQV4ZPFUXGWjQ=; b=loA/tJUsZQbHc14ZAa44WDNXTjnMbjZl4jDEy+Uq
	bnVEwShlrB1N9uE+pUMz702LNPAA2L4C/R8A5aVrosKR2q03BI7mvNdd3/W7ULyy
	pSFoDpLTqARBo3lZXEa9f20rWkirhS71/ZrbExn0PAFjiwlF4j1JHR+flz2327VW
	GhQ7uNfqWYvFs1DtYUHaua6VrbySQLdQuPtin5Dw/eDlpueiPMDe6tkHkRdnDQNu
	2L57hHyDzVhR/Yn+IRuyzZwBwGBXruk68snCYDj6VEaK69vael8eEUCE7MT44jQ1
	mmGu2T0agZUh6z6RkD6pW0TcHKoN30AOok2nOdL49bWH6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8tq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:43:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso157125085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647420; x=1752252220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF/OuQJ8xsB/HKG8mieUfGiQXUFgzhYQV4ZPFUXGWjQ=;
        b=acK07Z3K3i2gcKTZP/0+1EzMnF+kVf4MsAfuyF6ijqr7Mjo+JiXmUhySP9GTrFTT9M
         rl7xxkrHDYUjMCIv2+1m6m+GhuN7QkUDIUGqTb92Yf1K2OaXm74qpxEgwycz2C2+1Vyf
         4n1PujVMzWFgDFkvu3byLBX4qz8CekcytnrcSM2jSX5v33EAtAby0odH7PcscJEgs7Zr
         rMJHrAwQmh/s9H9wBYnaxAga5cXTp1Bwm+7oGGqVZyuX/ouniIGIyHAm/Uq+8SpNm15q
         2F+OuR5e7hqIIHAjsO9kswgRs/+gEC54TTkqTweeWqo9a7ek2L3KpvVfTCogV95lhtb0
         WJwg==
X-Forwarded-Encrypted: i=1; AJvYcCVLDuUoq0nETqDmYvLEoImWvYpIK2GjrfyJhpGCITRzbhzGGx9Ew43XgGHCCLIXyvthSTtxFrdKfU4g+0kM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50n4p+Z7GMMBUpLtQOERQD288oiFes1Nn2M3quV5OZTLhuofo
	Q+CPrt0pCwJdVY4JJw3OoXpFfWOAa8JmlUyrv0UX1YdxzWA3L/y+osuRcpFaeWrAByF/0fsNIa+
	d6STG9sqy8S6HF+dOb+Is+NceUJn72BNLkE7NxmcDDj9ZCI2sjkgI2WFScJhOw1t1JeBK
X-Gm-Gg: ASbGncv1f35kmedX2G9mDb1MKjq7ThyJrQGbPpyY+e5ULzYhch8Cav5fHGAoCtWdrHE
	bY/i9cjRHiZ4BVhxRKX0qqZDDNtZl0eRRO1GpB31U5zhdWyXwISGbsLXcJYFgt7LmIawKVh/GF0
	JNzjmVwPB3SKmCyhLc20+rzhhGoNbuEbOLTwHD0dhFGT1KJV2MxbWJqTIpnV+ylfgCxlgyaLZf1
	PgvNVNlPE9gIy0bHcZWZFJdYucUEWG2Epe5IckmQzx9abdK9OOA+odUBxZNGizuU6iu6i9XXf0p
	Ld3cIrMG2rPJwdW4o0+tf9mOzuGpiA8oLrGMUONUlqxC74+kJEYhCpFuWvw23dtyFAKJCxHdtNg
	Os3JJUZlT/+H9EyND233jPNn20ep8v5wSdOE=
X-Received: by 2002:a05:620a:4412:b0:7d4:ca4:addd with SMTP id af79cd13be357-7d5ddb727c7mr373956085a.19.1751647420429;
        Fri, 04 Jul 2025 09:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHn1PXyp0jkn2V0mI4Lk6POEXOcB3kI33BgARnqMb46tOWnip7KD7hHFCPDubKk5Pz6nWtPQ==
X-Received: by 2002:a05:620a:4412:b0:7d4:ca4:addd with SMTP id af79cd13be357-7d5ddb727c7mr373952085a.19.1751647419945;
        Fri, 04 Jul 2025 09:43:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383badaasm294708e87.1.2025.07.04.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:43:39 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:43:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add a sub-entry for the Qualcomm bluetooth
 driver
Message-ID: <ubypcytljeytit6pkis6ailue2wje6cth6yd5zjuo7h2h4e5r3@lq3hr6a2b5rv>
References: <20250704144724.63449-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704144724.63449-1-brgl@bgdev.pl>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX5xYOMTWrfFR+
 D0db1p5dZp665QTicgWmAuiQ3svpQN5IbTwI27VyGveZezv6sZf6kltRVdA8drHGpy/cDzqSQr6
 DGgZnxgMye5D9kTVYhuzE+qQn2/4Ez6++WuiE7yDOlViVdx8jjLuQYT738d47CUPzjebEzzSuS1
 5kpbCtEyqvE/yD/OzGiIwj6poc6c/k6dDYNGqgzxuf7mc9JpF9oDlrOMQV9m3UNYq13rGndbR4j
 vKhdqTmlG3JRgC9NXRrqRkjBEOfJhYk8sSqdfbXD5cfKP+w4kMa8B9khOqzhPw1dP37TSfnSvSj
 7D1lYl+B2intOsP+yhwbkpoJfwhgigwemmlIvFBNQR0c6ae4q6LOTfsYS6cOqvQ4yREV5SK04yj
 TDWmHTkdvjeEjLPgyA9j70KkE5xGp8vF/fWaZn5NWEErSjUP8ES2cvBInvtPppilzGs2dnXi
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=686804bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=rHvIfiyz_3d-7KI9RAUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W5otYecPLsJPGyiKg0VvqTxhnR1FXrHD
X-Proofpoint-GUID: W5otYecPLsJPGyiKg0VvqTxhnR1FXrHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040126

On Fri, Jul 04, 2025 at 04:47:24PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
> linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
> can get notified about proposed changes to it. Add a sub-entry that adds
> the mailing list to the list of addresses returned by get_maintainer.pl.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fcc77c93f8db..7fee3d38baf8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20441,6 +20441,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>  F:	drivers/net/wwan/qcom_bam_dmux.c
>  
> +QUALCOMM BLUETOOTH DRIVER
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	drivers/bluetooth/hci_qca.c

If you are adding an entry, then please also include:
- drivers/bluetooth/btqca.[ch]
- drivers/bluetooth/btqcomsmd.c

> +
>  QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:	Robert Foss <rfoss@kernel.org>
>  M:	Todor Tomov <todor.too@gmail.com>
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

