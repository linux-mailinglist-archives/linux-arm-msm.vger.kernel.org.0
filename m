Return-Path: <linux-arm-msm+bounces-62630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6ABAE9C36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6283A1768B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426F82750F4;
	Thu, 26 Jun 2025 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0BQ9gWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF7274FED
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936155; cv=none; b=MZFoNUqXhm1oR+puc4oTc86x/gfwj0cx9L8noLZPtx+0h8XjbWIrn4WKf3baGTey5ybaTtCiSknMU82sGa3npMnaYYWYbscbY3iNAzq06RuzTJvDFVOABT4eGAxmh2DGybQ1VKBEYl5De8QYqiE0EpLZIatonMUbeL/X4i2Wl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936155; c=relaxed/simple;
	bh=u/D1ay8UUGMtLszn+WtT3hvrawQnxSb8cjFR8eq0Q7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk0ZU2n8CpEo3cvuPKv67WEVTrPgye04EU3Jyb85fVY4ONy2+0IO1xKb3n70FYUr/+Xt4pZj4tb8yiuAM6vbGlbbBbdBnMdno+D/Jn36D8dybDG5Cq1Q0i105dEDtavsW5EyXhT3IWsrL0E3ZNHiwTIu21D1g5oGe1nc2lPyA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0BQ9gWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA1nEu014014
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwK2Fkc9kXdYIYq/ONLeHwPJ
	m0yg19eGqP15rBj0N9c=; b=i0BQ9gWcp/2HNR6iTHrxTeTM0NpTTrwlvlzfGAIf
	NjDCg12E6YObyaClI/jUD7ke8BBjAIqOAFxJ+tw5h2GEnErfwj/0A/tzoHsI4Ck/
	UFEGNm3HBwKM0vVxctEN527ycEAz6USJvWrdsMlgnWNdrC6vG+QMmz01tyEhA9Mx
	1J2OkKv+JLyBpxVeBU3vjBRkADQNcW7nNKFQTiTBqwIjqEU8LublbhuVNfBak+mC
	Umn8OxY+npnjaMJzJFxJdlxIuyHS6YLNi1omZt6nvfHZJNpk+mD4CXpF9L7p49Se
	ZnPBrKj2tH40rnByt+MYU04KIHjaMUJ3yc70NcAHIMniXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm21mx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so129833485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936151; x=1751540951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwK2Fkc9kXdYIYq/ONLeHwPJm0yg19eGqP15rBj0N9c=;
        b=wo2I2t2elEbdbs3tOngBqcr3hxapjUM/1cs4699gyfHR8M7b04UyYRyTEFKf87A5q5
         sJ0P+ToXwI9KCEp68g7NyI8DlpNfJBtQfJi4wllqoXPnyR6DG2SBmQwIsgZHlSPnx7HT
         AYfRdj9qnjj0dJVjI/wgFl0m75gNRhwhTCaZkiRicW5m+4TsNY2M3yrEqlrhCsGP9tMo
         WINha/VqBzhvXrD/5FayBL44K4zl5VvEFs1jBoUdbWdruZFGBQXTZ63oxbon6W0xQMkw
         YViUuDbaYxZwrbJExrQINEKb87O8ah/QDVc9mOPy1HesWgOYvvMlTD/NZF7AyPzN6dx6
         oD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW97SEnY8z5HWb5YMgiEn/T3fyRnYTMDPd8StyYeI09J0Q8xtHowzjtbkiJMjXnHy+VnC/Z0KYtTh1xrNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcRqv/NxkrG+lXbdXcB+T6x+fhXn/XsTegbsBTiclUhIz70gEU
	hDexkhfATSNh8fLvYBdToCjI8C1xSmqVlpelFUUnJ+rE/wxNNJJyIMlOhERtbwZWFe9Ims4U/wE
	EjtCmCW3wNyBKR+Y2PnTUd0+gn2uJKeXrXrWzttNKEAl1qRQnwASnQS8VkHaYriEBKrEm
X-Gm-Gg: ASbGnct0+Mf13pTmolSQRc9PxU0DZtd+UxpYBJarXzqUbirQIs5cq/iVcoy+wBpBvJD
	5I0WQ4i2MPkI9WIPBz/OwHGEgoURKY9K6JgK/aP2h5tWMbMHQBsHHWCJzfuSvfEuzAPaCl/xadB
	jwqMJsrlN/hufDOWBU/IUOrIsidA6XBawjed3WCpTi3UgWIYvrxEjJtloBMvuVVcsitjItrOP7h
	UEz1mcacouFTahJDKl4T6uEDMkstz6pj6+S9NsVsnw8vJieB8iWkxCU7oA56zFkAIXCrSxkg9gY
	uRvLuTTDKUcSfRTU/aNexm0U8aJsj2lF2qGht1BXWvKG2MAxSt0gM3UDw/BH2JkQO+O0qj/BKTi
	ppPfSRidVRqoX4oeVCta/0Ah6tKTV5fgGbEQ=
X-Received: by 2002:a05:620a:2b8c:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d42971d987mr838008185a.29.1750936151319;
        Thu, 26 Jun 2025 04:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0h2aCb1NM2KPsFMzxWrQyl8qAyEOIws0dn4vUhwBh3WRgVeSbR4vmL/vcqHauH8COhQDLIQ==
X-Received: by 2002:a05:620a:2b8c:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d42971d987mr838002885a.29.1750936150590;
        Thu, 26 Jun 2025 04:09:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbb85sm2550275e87.99.2025.06.26.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:09:09 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:09:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/8] firmware: qcom: scm: rework QSEECOM allowlist
Message-ID: <3jrz5dtblgmacp32zda6yai76qkp3wxzj5axj7cwnzpdgk3uxr@5tnwyayvzlyu>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-7-aacca9306cee@oss.qualcomm.com>
 <aF0ZMcVcgHpqsKoG@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0ZMcVcgHpqsKoG@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d2a58 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BxrlvFMbxrEKopoIaNEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ornGyVjo8MaQRZ7CxYrSKlmIwtspoTQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MyBTYWx0ZWRfXzygzAAmFq912
 lIk1gc7AKx+qM0SImEPZnAo6QNjitdi19PxSS8COv423c3N+zrI43cs9/3Ttt38BrT9fSLjngxb
 3/TIFd5PqUjSmhQjKbsQ3Q9OOwptPNurOlc/MJKs7aOqO1d263chWHptCR/LoBju2siQvE3nJJM
 LrebEEz4hiex7PqtHnx2tPd6o2DCucQw4JsWIL35l5Ah74tacGvv8HCM3/CGo8aRMnmiCzRyggv
 PIhMth9EaEBMv1PV5N1oR68iD4XhGwinjVlCX+VfS/oyFTFxidNMVcN0Jwv7/lj3ceuZh7APgEA
 imzkgyhLQ1Tbdmjs+XKXHB+dIjy9z7cMw0DbBw43nVluFds5zGkWuDcxbZT0ESvCcHIxT14WZ8L
 1LWSDUBeF/CVgV3nizdxgSk9/a+m4BvekLVK6Ky3fnsPscWz2boNFhuE8iIPEfCkGXi31qus
X-Proofpoint-ORIG-GUID: ornGyVjo8MaQRZ7CxYrSKlmIwtspoTQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260093

On Thu, Jun 26, 2025 at 11:56:01AM +0200, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 01:53:26AM +0300, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Listing individual machines in qcom_scm_qseecom_allowlist doesn't scale.
> > Allow it to function as allow and disallow list at the same time by the
> > means of the match->data and list the SoC families instead of devices.
> > 
> > In case a particular device has buggy or incompatible firmware user
> > still can disable QSEECOM by specifying qcom_scm.qseecom=off kernel
> > param and (in the longer term) adding machine-specific entry to the
> > qcom_scm_qseecom_allowlist table.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> >  /*
> >   * We do not yet support re-entrant calls via the qseecom interface. To prevent
> > - * any potential issues with this, only allow validated machines for now. Users
> > + * any potential issues with this, only allow validated platforms for now. Users
> >   * still can manually enable or disable it via the qcom_scm.qseecom modparam.
> > + *
> > + * To disable QSEECOM for a particular machine, add compatible entry and set
> > + * data to &qcom_qseecom_disable.
> >   */
> >  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> > -	{ .compatible = "asus,vivobook-s15" },
> > -	{ .compatible = "asus,zenbook-a14-ux3407qa" },
> > -	{ .compatible = "asus,zenbook-a14-ux3407ra" },
> > -	{ .compatible = "dell,xps13-9345" },
> > -	{ .compatible = "hp,elitebook-ultra-g1q" },
> > -	{ .compatible = "hp,omnibook-x14" },
> > -	{ .compatible = "huawei,gaokun3" },
> > -	{ .compatible = "lenovo,flex-5g" },
> > -	{ .compatible = "lenovo,thinkpad-t14s" },
> > -	{ .compatible = "lenovo,thinkpad-x13s", },
> >  	{ .compatible = "lenovo,yoga-c630", .data = &qcom_qseecom_ro_uefi, },
> > -	{ .compatible = "lenovo,yoga-slim7x" },
> > -	{ .compatible = "microsoft,arcata", },
> > -	{ .compatible = "microsoft,blackrock" },
> > -	{ .compatible = "microsoft,romulus13", },
> > -	{ .compatible = "microsoft,romulus15", },
> > -	{ .compatible = "qcom,sc8180x-primus" },
> > +	{ .compatible = "qcom,sc8180x", },
> > +	{ .compatible = "qcom,sc8280xp", },
> >  	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> 
> You need to have the machine specific entries before the SoC fallbacks
> for this to work.

I don't think so. It's not how OF matching works.

> 
> Perhaps this should be made more clear in the table by adding a
> separator comment before the SoC entries or similar.
> 
> > -	{ .compatible = "qcom,x1e001de-devkit" },
> > -	{ .compatible = "qcom,x1e80100-crd" },
> > -	{ .compatible = "qcom,x1e80100-qcp" },
> > -	{ .compatible = "qcom,x1p42100-crd" },
> > +	{ .compatible = "qcom,sdm845", .data = &qcom_qseecom_disable, },
> > +	{ .compatible = "qcom,x1e80100", },
> > +	{ .compatible = "qcom,x1p42100", },
> >  	{ }
> >  };
> >  
> > @@ -2046,12 +2035,22 @@ static bool qcom_scm_qseecom_machine_is_allowed(struct device *scm_dev,
> >  	match = of_match_node(qcom_scm_qseecom_allowlist, np);
> >  	of_node_put(np);
> >  
> > -	if (match && match->data)
> > +	if (!match) {
> > +		dev_info(scm_dev, "qseecom: untested machine, skipping\n");
> > +		return false;
> > +	}
> > +
> > +	if (match->data)
> >  		*quirks = *(unsigned long *)(match->data);
> >  	else
> >  		*quirks = 0;
> >  
> > -	return match;
> > +	if (*quirks & QCOM_QSEECOM_QUIRK_DISABLE) {
> > +		dev_info(scm_dev, "qseecom: disabled by the quirk\n");
> 
> Not sure this is needed since it presumably has been disabled because it
> has been tested and found not to work. No need to spam the logs with
> that on every boot.
> 
> In any case I don't think you should be referring to "the quirk" which
> makes little sense without looking at the implementation.

ack

> 
> > +		return false;
> > +	}
> > +
> > +	return true;
> >  }
> 
> Johan

-- 
With best wishes
Dmitry

