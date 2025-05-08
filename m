Return-Path: <linux-arm-msm+bounces-57257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F61AAFB23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515611BC6DE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B87817BA5;
	Thu,  8 May 2025 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2uQA0KJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24D450FE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710402; cv=none; b=ez6NxRNDW6ISJqCyNgYWX0sd/dlKbVmqEPE/c92PLWgnOzMXims7uLpAwg917o1H4DdF0CzMJ6JDVwVCN75nNfjBCbYRLeISGk+WENpUPWrljg0JS3AwuxrcwMbXpTtHXUSoBfiahMuc+Dn0XoM1MUwUXeI5QVa3NFsFuHgqAOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710402; c=relaxed/simple;
	bh=Vb2ndZfQWhVnxIuJ012CE5O/e+1gyQzIVTgTH+O052E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXBFrAL8ZkErCBpvAw/mUkn59lPWwgeZLZdP+JhwsXtlD0BgKzrL67hvnaiyagrGLfIHRYkanRYTWHU7KNZAapDBb57nigP+ZZ7zirPJvt3WIydNoK4QbiaApas1XQfueNyzA5T/HasQO5c+Id579TnsyvIYZvc+KhptGcfddG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2uQA0KJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0X4E024939
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=960g2/Y7jbcP5tMBnkyZ+/1n
	tYIRcCiwlH+N70WW+Vo=; b=V2uQA0KJVbl13br6mtbmQFmM9dnH2fEoYwj6fzY3
	nUO1F4JnA/0JiiSXIZfGJUfYWAQNdwS1gPb3n1p2v8KlcNDWFakbJR9WZ/hLUDnE
	whM8JczNimCMf8fuTx9K3lSZDkEpXuC3CI+aHDMSGDO5KoAd2gO0shfS0e2RLMSt
	DWp/uvUnFShtXrRMKoFhRfAjek1yE+Z0azJp3UfLWvVd+Q/pqhcSaROLio+zjBis
	MfJdjOUg2P8NObxfJca6LnVMG6FGOYxy9OckrSlc6zq5/V+PMCpdD8U294jESRZQ
	sNJP1ycQnfLvgjz4lMNA+1YlKdsAr9hC58PV8nWlcsGz2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp11em8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:20:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990722so190815385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710399; x=1747315199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=960g2/Y7jbcP5tMBnkyZ+/1ntYIRcCiwlH+N70WW+Vo=;
        b=lP9BugPox0YMuImJk5KCfcEoCB7Y2gJiVwom9BW1CQpdLQ2CY2YY4F/56ixSFWpcDm
         PW9WHX145dJP2zGWt2ECdMKJE+Jqfqh4V1wr2Sgd5i8Td4aSkMM56l9T24H4A5pZllpm
         O6J0xauvmut4qzovwb1F6rQZfEEh7AzB35PPmqmLBF3dIN64s6sIKXf+Cqv2ysqBWXAv
         UNaPsiO6veDijY/cZ8MMVC3J/fap2aQFt4n9iaAzxjiYJNmEV++FYrtZEIZZCZUKFWVj
         qzFjIN+UsBSgObt2W+cGIb8d5YNTNxKAEwl8W6yd23ij7A9W+fzGsUp1z0CnXrHx7klD
         8t4g==
X-Forwarded-Encrypted: i=1; AJvYcCVjmVtGVz4FklxaWtbD9LhRWW2EJS2CM0b94+VJparUhzvl/9APXcQhiW2OLvUijvtiZhht9G+Y0dMlhVI+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoh3k/WweN9SubOsnqhlzRiRkDhC+LiOOePmFeKmzQzNxJ1u27
	++gNFQFfbaYFjD139V5hpvoxiGfYXfASlZrbgi72vE0/KRHc1dluJ89PS7MlSuefBqkWCZSzygb
	dF2ZxY5qsrwrdPsuR2FlsGUsFt1SWAA/o6PvL/AaaPSfCmuDKQiIU3M3S3imkhItw
X-Gm-Gg: ASbGncspMxNaIOaJOGnGO/UFrB4rhzKXh2lx1tuDLxs1BJw9X0MkdobeaYU+z62Sub6
	Qmo3M+2UFJsAvjlVYsh6UwK+5YYzhjwsjFoCMkM5+2kVM/4Ed1/4MqjrckVIkhmRwE0KPlUtBUC
	r9DghCnFSF2F2rfRfIYGIeuOOaBLCaPZf1qTKgcewyEQmDEndSB3DmzUl2iJW3ENghF9agwvVSE
	ndYxCN6Aqw8vnrj75GIoW5GYBHBewk6+rl/ndf3DB6I0dKd6w6nO2WV2330Sw7Obi0MyIG6FQeI
	GAv0IuwdkgtfZmS4YlYIISQ+qpnsG3kpU0C8xbq213IMATuWEJVWyvS4uhfTgEP74x13qFh/p04
	=
X-Received: by 2002:a05:620a:44ca:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7caf741d0b4mr1149272285a.50.1746710399336;
        Thu, 08 May 2025 06:19:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3lNe78VcCcWEy1AnXymGxoR6WvakpzlFpFa7RK5KkM/cGbvKzb7FMbulvZ4fPo67Mh2bgxg==
X-Received: by 2002:a05:620a:44ca:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7caf741d0b4mr1149269285a.50.1746710398992;
        Thu, 08 May 2025 06:19:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee2d8sm2681252e87.136.2025.05.08.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:19:57 -0700 (PDT)
Date: Thu, 8 May 2025 16:19:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
Message-ID: <fcwzy7ih56bdnj2a4vdov4sg7tz6cwj3wdg7zitwk4c6rthex5@ztbgptuacprf>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX4pF8lM2eRjBB
 OJ9epMN71ZvXJLpQD9l0TfUyRETmIPWG1NLuVHvmsZF+cSmuT4rzzELPCXvk359BAf1NVj6Jqt/
 FYfTT36M3FFj47l7NNMgHAVbJ8rqKop4Z4mhFU5zf5ydKAp+A/EXUR6Ov82qwZfNI71Mub4zx/m
 bX+VQqdB+iVxkxfOyTPdmWsl58481N+S9XpOwTZMeDMRexAOaiMHF4soeAuD6vDLkxQNohuwxWp
 olFjhZYsTqOUts+6OEs/bzuYgCdfZHwO5Z840ixIIBYTSHsu9OAT0NaAQXF6+Q4KeKGYGnp018L
 ThEsZuN8TDEYRgGSslGdNLfT5WOosg11S2RiZkcjorQbZWCGMtO7WxcNim2dyfyom0gjhw3p9c+
 t1P4JGejGkY8zw2+PEAL4XblOCQwhA7jYiQcjO0caDuYWlJ3B/ChIigSo0RN2t/0vaQ4NtmR
X-Proofpoint-GUID: RC_LAuua0IutTSzSYg6l_e0t7iyryteF
X-Proofpoint-ORIG-GUID: RC_LAuua0IutTSzSYg6l_e0t7iyryteF
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681caf80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_N5iSi_J5k_ybs9BqwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080111

On Thu, May 08, 2025 at 06:42:56PM +0530, Mukesh Ojha wrote:
> Add support for socinfo version 20. Version 20 adds a new field
> package id and its zeroth bit contain information that can be
> can be used to tune temperature thresholds on devices which might
> be able to withstand higher temperatures. Zeroth bit value 1 means
> that its heat dissipation is better and more relaxed thermal
> scheme can be put in place and 0 means a more aggressive scheme
> may be needed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Added Reviewed-by tag.
> 
> Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com/
>  - Added debugfs entry and described more about the field in commit
>    text.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

