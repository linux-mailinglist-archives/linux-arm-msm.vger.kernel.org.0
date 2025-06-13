Return-Path: <linux-arm-msm+bounces-61222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8316AD8C40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2144188EB8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 12:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2839E440C;
	Fri, 13 Jun 2025 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idXzmazr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09F2C9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818219; cv=none; b=TvZoUDnRMlIbawotbToOS2QQXtdSC66eAoZi3sLQgdALNnuROl1vjoM/KyMJvRL5bYit58aCQzPuviozcn0KI9cVIA0u3govQxaFCDoYr5WbSmb7w/cqlavThAEtYEVqiI4LBwIaFPU/FCHWJzhI9m67JdgjSsKoSH9iw2fzZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818219; c=relaxed/simple;
	bh=m4rkyYEqJtoOiSYYioayX0Hhab6LqMJvW2vTZ7jZY1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+sf1uZ22ACQo0VZR5dNzToSWd1CirN1kYnlPMdLtvBSGsZG77KS7O47GzJFLo8p3j5FCuKDqFIczFC+IwWcNZP/6GknmohypfeMI1Rnxb1MHOrjK3FXcCdh683UFLEsAGf3AbHUkTy7mU+uLT6UW5eWzgxq+OUe4it0FMoESfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idXzmazr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9JcMA015312
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WiUakxxSN+1nXzFjzlIrZN1S
	nz6/jGOBgrcWU/AJ22I=; b=idXzmazrXj/gGs0J6hk3EJZjvIe6tM4OM0QVuAiO
	XxVdwqvrfaRy9ch8ZrG6ixjweVV2bzKbQf7Qi60Zy5ab4PnG90/RETPqxNKvRZjS
	eiE1P1Tzxvq1lFwRbqgkyQova1PDSGXfPOepNV0zU6mKAvAqf/V+Fi/GsRivWJeQ
	jqhSh45c7Mt8JKnya7wzmX/xJ4NtDYfpMh5IXhSwKVeMg5IezhsgEbip3M6izkZ9
	aIJ6rpnB3vdu9YX4A7iy/6i1Xty0PW9KjdILPZYVBE1AyScKdPJ3bRsuxXYKiXTj
	NcrY+NFMqfL4tPQ2mUpRXoPGeeP0X0pZgZJeV68/Gt2HIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8krc1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:36:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso21489746d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 05:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818215; x=1750423015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiUakxxSN+1nXzFjzlIrZN1Snz6/jGOBgrcWU/AJ22I=;
        b=I6NCLzJJMohaVM6bPdRc781RKgYrbqJBqPNbIkaBKE4TtiDDKSzrMQgb9e/maxLv0K
         6gZeH5U6nyk0eeDN0fdw9W1rHIbIzDBQOWiRfD4eelruYg6l/P3COM07jFtnMiMMQZ9O
         QLBLCXaLUn7a+uODJScU655k6OSQTuOeqRxBrYInxChpVdqrv7EH6LZ+C5xAMzzQ1HVk
         CpjLkJzntVl1I6KPeGO84oN4k6vzLUCfCEh3fdRJMHIrbL8W+upSRkClqfF23xBsriAB
         oI9AuzFSuIEDC4SPuOKp24njNvHPSoQ/WqrOQ8iN0NFq6JjOgAxm/t+KBZmyLbtnX6ql
         RWzg==
X-Forwarded-Encrypted: i=1; AJvYcCVurA4yHpxEPBUKowYNgV9JkxV3MOFFPmGH778mYQQigjgCTgWqivgvDFmBhkn1xJhVJw7xXArODtT+rD1S@vger.kernel.org
X-Gm-Message-State: AOJu0YyUIUiQAGzbdXxpgWZxUEfDSoRk6aGPWwpUrlzc3FmaBbx0UQ6p
	ayFHIBSHmSSjbDqcw6wPeXuTVUnahWZiarBYoEGtN6mpnum3cUgP19YBJ2P3cyUGk4/XLRRXan8
	Xri/YmmzOhXEZaa2A7pbaEUArwChIOAX8/3ZxkeAcqtBwcZdQgi3+D0T0xJ8CLPNOFQ1u
X-Gm-Gg: ASbGncsp+e0aZAz87OSvqCnBfIEotzJu8ixypsu9dNep6pI3po7YWeyFo9QdJwdYJs7
	QeRXYmOqAzcm/sK/voYXXq4+rr4jTo/FZuK6Dj6aZfThunfBOkAscr8cB86bkBqwb+3G6nPnNUi
	sQB+AcRtMJM6xAZbiYQw+/5llJDX+5Fu8e3xS6cVCuIBfBCd09X7KU4+D7LwZv4EMQ5K8BtArKG
	XRAlxTWe+HYUzjr5VCCy6gQ/eoUIAzR90n9fzukgAcsd35A1OHs6dFYSSu4/wFfbBS5Qcdzm7v7
	brkz7amj/0AqwKhZm0C1TRsGOBRuOUJ7/gnF9dio5C43W4UG/2g/RaQ+Ph2Dcj1xSPUc2HEKt2F
	ocPH69n0VrvATKfdHpkbOKhHMa9t0nkNG1C4=
X-Received: by 2002:a05:6214:519b:b0:6fa:b1bb:8315 with SMTP id 6a1803df08f44-6fb3e59a061mr40470766d6.6.1749818215670;
        Fri, 13 Jun 2025 05:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKBgV48W2nf8QXu1t8reMR4IVWaqjw4aDfebN45a7V4MAz0VWfAE0OjLFPbHkgdIEljmvRgA==
X-Received: by 2002:a05:6214:519b:b0:6fa:b1bb:8315 with SMTP id 6a1803df08f44-6fb3e59a061mr40470456d6.6.1749818215294;
        Fri, 13 Jun 2025 05:36:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f4a8sm5397681fa.3.2025.06.13.05.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:36:54 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:36:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video
 GDSC
Message-ID: <vsl74hdwomghugslc6ol7aa4r6ralx7fswit6eiw3674xxgnr3@pigmgoxpiapw>
References: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xjGculBejjb5lvGMmaWPGq5muRgtDZ85
X-Proofpoint-GUID: xjGculBejjb5lvGMmaWPGq5muRgtDZ85
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684c1b68 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rn4lbcPYODbMvauTXpgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5MSBTYWx0ZWRfX8hJgmZe57T2d
 pzFt1VG01OZ5zuGphl5zNvB5rcmWi+RxUS4g2155FdLLDdqrbNvKxG4JuAPhKCuRqtjhXfpJsyX
 BfQIToKwPQbyuhyy573gon6iq6qv36hawVonteUhq+q5uk6FXjm0jrk/cRyJAJg1eEGQCGCuBaU
 3oQrKwE8ViTvVr11shqUpT3hDRnmqSMamu87NzbpbMILzrYUIb/lwv/fjdXd4+R3djMZbsGlbKp
 lzZtTkV6aN059yA1ITyUY5veONS7ZRXXb7NOIXA1Gfr0ejHKgg4RBd6MkBlhrdFZ4IdzzJVthUb
 foF2QEfaEBcHwrB+5wjgRAJbkHnnMtVHgTDOQPv0LVMFh/9QU3HYKt5Vfu/WzdLHk+aYqAilq/l
 UpzFCeAqcAB+JbdFuMsc5ILCNENYXeLLx+VRzQ77nrzVqR/ZHrPw76kU+L3QacNTEwDxFVhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=836 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130091

On Fri, Jun 13, 2025 at 12:22:45PM +0200, Loic Poulain wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

