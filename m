Return-Path: <linux-arm-msm+bounces-55375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B600EA9AB87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0AE1948345
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8CF20B1E8;
	Thu, 24 Apr 2025 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7p8klQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C31E22FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493411; cv=none; b=LbZmtIhKT/py24HJaja+JjXZSO3kltb0LwPSQyeSSUGRLVXMCOlZ8vONfb5OuCNJLds2XZ2zl9/YooLAdVNa37WtdDNqUuwTeDpVqKYA9q3kjK0IHtAghXNzuvlUagliHENfhaHiDjuCsvMuePeiUfy9DlNRyNpX0YKYNJ9fsSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493411; c=relaxed/simple;
	bh=OtYc4R1i7QhpKlXAlIJIGNLOsc88gNaQq0hXB3PqtXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcxyYTY7ZQGjigSK6zbq673H2vXXRZhZISAn1DKD9DG0NNB2avtxWcYSUFThId/SzYMPmSHdrgG0IHIwfMt1YCGTEiLb7JTIeb0L4MTcbzweS6EhDvghHF1WpduV6trUpIju1DnDo7K/Rz6rff+kdzWRaOTJVoDH5d711v0ilhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7p8klQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OA45Fd010792
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 11:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOKsQBmb9gnp/skbN3gn5eJi+/fYb+YE/EuKIQjxIOQ=; b=S7p8klQglPFT+XC5
	wNLR3glxPoVg6dWxxEUO7GYFII2cSXH2sB9hYPhbuXLzyRnrmDOe+XPlvrsf6MDV
	7F/LqWgMzmdFCk+pjI1wTHFAT9gxLKBYK4LZDf3IClUzeF7rpy/TR169XJwcCz3z
	V3Wiv96OAs0tsR/bCit8TUmJgydLx8lWwLCtAaHXXOrZr5hJXoEoHQRrOYCZW+Bw
	fDPSB2AohWQmzxwTv2ouBT7n7Swuognn3Xp++XEs4kbLoGJ5sm1LGWBSoVrs0Swg
	nbX/xYiL/BpXOA/YH05gNQBRVh26iTtJNfE7ioPvEp0R2W72vCqnFwuA8ZGjgu7z
	PiwHuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0de0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 11:16:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso162605685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 04:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493408; x=1746098208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOKsQBmb9gnp/skbN3gn5eJi+/fYb+YE/EuKIQjxIOQ=;
        b=nwNa9Ah/qXHaMujhJL+GWbmruJkgtB9EI1LcubbtgwPqwJxapNbwLrbBD0zIza6X8P
         S2RiwYp83E9wrNvXZVuT9QhWeaoZcokX08gYyjUk5LwFHFdaorCwRYPT3PzhxXTfEjB/
         5279k581ukJFqIHqcgtnCzcq9ANwv+tmcPg10tQdIBacmn2Kgc2+KTG+HqFWfGFvZ/lO
         z+bDnPsgNN5lj82sbE3H63Qz3/sEdoe3xucdDYByzpUIhH+D8wYW7tj7x6qlu5+Dymf6
         siagilCxHa9T3QH80ozhVdhxMazW5BaBRR6zTmrax1LEwj+BnRmS2COTEX8E4MyOA7sU
         xUug==
X-Forwarded-Encrypted: i=1; AJvYcCV23NhWN9IWKiBCBPmqr/KtglAzmaDcyOSmziYtblcEridZf8jJprXXP319+26OoMzPvhXTzPu6nhM5Cm3R@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAMONls23s3QS2hsBQ6byw3mhFYEJs338TmPpTW1hAcbHF9UM
	E16gLWty6fuK12wxzKj0LEyenFsfKIuqrgrhAcmjneJ/B6StwpRWFHcPEk5PCATUWZ90mnhd/39
	AsO/UsjdP7gEL3KZWFc1irBwlWVIkQxbhKSZpFDM8T3wZsX930/knalIh+vBOq1to4F57EqzK
X-Gm-Gg: ASbGncs/xS/JNtTIiWmvpzydm/e1y/8P+IZLyQhvqcsuGj0q6JT4spTlW49UmgPL/9P
	Gque79AEanLAYUK7sDmgiWeYgCH8cKmEQEOJCy/cd6vY+yQeM2OBsSXPbVIzDPcV2pXttkGFYRl
	GtaGMitG8hGyHqUNaEjBUWNURTRrtbRcsyPgAx9P1xHmGmk9BCen41XnyU9u9k1c/Iuy9qPMVuI
	/8sEmBD89kjnNKLY31gTdGATquY+Oh7QPw+gadiRA4OOPnl4oW3juRIGDNAfppkx2zpH+KhFli+
	yUUU3qpEGixzknY1TWiOB3agHiEQylW+F+jHdzy0b8rRgFIRSVlAeBXoFuQrLDBIWxSp1iMqZ3A
	=
X-Received: by 2002:a05:620a:3197:b0:7c5:a5cc:bcb9 with SMTP id af79cd13be357-7c956f89ca1mr358020585a.56.1745493407878;
        Thu, 24 Apr 2025 04:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlzMsXCtRP2FCd2KVZJ1BcD6CsMFbJbX5AT192JW0OJoNvHLjBDhAGLiy+F/Q5XQhhqENkxw==
X-Received: by 2002:a05:620a:3197:b0:7c5:a5cc:bcb9 with SMTP id af79cd13be357-7c956f89ca1mr358018185a.56.1745493407489;
        Thu, 24 Apr 2025 04:16:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3b60esm198002e87.86.2025.04.24.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:16:46 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:16:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 1/2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Message-ID: <nnkct4fjzfmx2y3s6oziurn3kqzymo2nsedmlvcreekgvcnr5r@jdhvwavvbt4a>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
 <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
 <viki5krjvs3vs5jf2lrhah6v5rziqju7jv5kbwz7yyvdfjwhh5@6gieypw5owfp>
 <114814a2fc59b0fa3dd5a2863394c0f2@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <114814a2fc59b0fa3dd5a2863394c0f2@mainlining.org>
X-Proofpoint-GUID: yi8JaYiqWymwQA901XPsAgSIyfKViEKg
X-Proofpoint-ORIG-GUID: yi8JaYiqWymwQA901XPsAgSIyfKViEKg
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a1da1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=IuHD8Sb6Hs6KMzQ_MtUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NSBTYWx0ZWRfX4cVXSOXeOCa5 k4VbG2X8yusiI4OOR3Zl8rd1gKAAnKghUknVoJuWyNBZvsPrtINwXI+XMAXWe6qxLMzmK/QMUGe TrCz4/sN91JDPsqQ/VsWjugAtmYNEhE8IbUKbFF78PHD5ONijwxt7YUxHERYQz/z4dUouHaEPU1
 iki1cz0Xe3qw3dmz/A2vEz93OE5k07UQDC73zvWvZtDSxS9/7fleH61vuvF8/f00GCaxg+8X3bD oc26yAqbxoKtdvKas1t7KwzIVm2Sbw6RfhcGdBEZTb827FaY2V7rk8KN8Ovy6amvWh7ucQFzr95 CMRsupvF+L7n5v/KNggNAXHkLbibwQvW3tQyVruFHg5Fq5JVZaTQOgVgjFziQZwGTO/c2jCq7jm
 F1ZTGQC1kpZjDrV0DVZndfkjhq4n2NhRPHJ+chKB0y0CzWwAiQxjJjoPt87J7vb6VCFWUOSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=807 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240075

On Mon, Apr 21, 2025 at 01:40:50PM +0200, barnabas.czeman@mainlining.org wrote:
> On 2025-04-21 12:38, Dmitry Baryshkov wrote:
> > On Mon, Apr 21, 2025 at 04:04:16AM +0200, Barnabás Czémán wrote:
> > > mbox_request_channel() returning value was changed in case of error.
> > > It uses returning value of of_parse_phandle_with_args().
> > > It is returning with -ENOENT instead of -ENODEV when no mboxes
> > > property
> > > exists.
> > 
> > Why? What is the rationale?
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/of/base.c#n1390
> mailbox: use error ret code of of_parse_phandle_with_args() this commit was
> changed the return value
> from ENODEV to use retrun value of of_parse_phandle_with_args what is
> returnung with EINVAL or ENOENT.
> It makes skipping fallback path to parse qcom,ipc if there is no mboxes
> property defined.
> As far as I know qcom,ipc now only needed for rpm smd-edge on some SoCs like
> 8939, 8916, 8976, 8917.
> arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM
> > 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

