Return-Path: <linux-arm-msm+bounces-77047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 63106BD50EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 18:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC7263510C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8192C278165;
	Mon, 13 Oct 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Px9nbS/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDC19309C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373106; cv=none; b=W+qHhrqU4fgUTvD9ttTJHJACoOiQKLyngZXpclV1yOs+g7fFfkBaTecyBcNUIyLt0VaYqU1x2jax5DKR7MFuHpfdPheGxDtIm5eG5pFqxaNjx+PWx8aYc15MF22C55LONnqlfjQuDzedfwum5rG58DFWdbj92rBFdq4HilZeVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373106; c=relaxed/simple;
	bh=kurJp8JCs3541IcWv9yKM97FEyktgGNpVUnrbeMqMmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8WXDeyc106N9lS0Uiqs/2pbvGkd9TCntTYOBo0n8RKkl36IUadaVf69Obo5f4F3JtLfGib/wFKE2K0+v9/IcNAQHCg6DXoLx1OI6/R8mbTTh5ZNm+Ubn4I6EMLFozv4CRL6FaR8vcXR62XJJUiEqmm/y/jSCo61vLMM+aaG+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Px9nbS/p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAQGIC024651
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+J5ukcMVl37T/9FWTJUvNGf
	Dr2aFnYEvXR1o2qyJEI=; b=Px9nbS/pmxQ1JmNLhVKQyzag9h7IMdeF/kr1sF63
	aqfu9t3xqG55T2XZqLsitCTd7MQxMH1xQF2ouu7vGlQmig+I02C2NoJSSu9DM0ih
	BBfJPoQMOwVV7k5RJNKOBPMEY5zqPelxlkMbBRSaZvCe+9nngn/Prb5KvfnZ1v4f
	21lbWSfAL/03H+rxYSX3Lf5E0xnFG2efLxbvuWxqsa9bDH4l/pPSNDWs2WHG9Pw7
	2WM7ZwJ6uH+NcxCLQxN2ZWuLKCzlhCk1tDkZEpd3ryTx6hbUPqm5yUXDBaV+64Jp
	MOaTEuuW9oePd1bBjzMWoEWWQiIGMNzTBroS2rRBzu3ELw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa85cst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:31:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a7a912f1aso3362258e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760373097; x=1760977897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+J5ukcMVl37T/9FWTJUvNGfDr2aFnYEvXR1o2qyJEI=;
        b=OyE2sfSU99XutQmo2M6oO/kde2FNrv+v3wJv+ltj7etmSkAlnFfLlqy64knz/dMGMz
         RMZFWwixCx0W7nY1dycrDCKksnn6agYXtXoh273kaXXVecXRwTYHarvA7geCPYvOYYug
         t/jO0Ujf/k/GczCM5sR7cRWYaImnIqmv2lJTQvKdDqn8r1jCEZRRUNOUqQh+r4HkdB5m
         UpmJ+66qbiqQhDeiZ42+Ak0N1425Ed+ZhvZ4N1xiz3Qx62CixjpXFelpuCmoor4DkNoP
         M7JaTlzsNLp4lFRyE+n/SQpwKtiJsoaVd3f54fMYPxCvN3C8AGPpdlOKCDdE2pVSa5pY
         7pQw==
X-Forwarded-Encrypted: i=1; AJvYcCUmlV1j2NN3wGFD6ouUk/0dunxMwVaBMLeLb0pRjJiu2RPFrGJulph0X6uGo6g/h4GpgbxRyI7y8HBHJlgr@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbJrAeiR9Bg8E/Qm4mNahR9QfDTS6BY/7rsrvLoNWLbtLTF/a
	zBP+bWnkTpcX6mOpJNspxPOyfrgyu41yfqkmYtGjbWpBapG3B+fQe7/TSgHfRysJujfL/Q9SeOc
	yJFVqDFOgEkHK/brs1acwI5XL7wbas4bzJM+pv+jR/+nsJqGtsN6zFMjN1JxZJLGD9fMh
X-Gm-Gg: ASbGncvAwjPkyfbShMrYIO6zRGW0cxVl2+Qr2IQc7FdQuLGQ/lt1KvDNTzLXOOsu51v
	kKbvqHn+2vrg4GTY1RYUFcxsA7Yjhv3b9ijAyZeGmdlXMHSU6V0H/+CajTzmmybpWEqc+QT/a4V
	duMFv15IiS9xTvRbo4rXHPrvZDtrWZxdu3Q1CfGfH9RhoagKx9F7K9FDJp0hkOqnNqTrBo7PEKI
	gFpDKNZdS9/SggDXTINZPcJGa09SyZIaO4xcoR6GlJIUF7Vxam7ffBD1H9YDBRSWyfUit/obqTK
	p24PuTsFlK35oGeCQh7nRn/egoOdM+VDqX3vGqMeerD6giUnb+/3RKwy6Y2n3pkIJrq1EsNuhsF
	sA7Iip5mfpOJdvVv/d7u3fcnsrhyf/Ao7GkX9PV+GmDrZamsy/gMX
X-Received: by 2002:a05:6122:2a0d:b0:554:afe3:1fb1 with SMTP id 71dfb90a1353d-554b8cf023dmr7813085e0c.14.1760373096849;
        Mon, 13 Oct 2025 09:31:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGHELLnZD5uUDdYZlyXcDIBhlCnjKA0/abnMG6vLUVDWQv5vJoNIMTw3EueGnWuERzBnCkHQ==
X-Received: by 2002:a05:6122:2a0d:b0:554:afe3:1fb1 with SMTP id 71dfb90a1353d-554b8cf023dmr7813011e0c.14.1760373096190;
        Mon, 13 Oct 2025 09:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590885638fesm4274022e87.81.2025.10.13.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:31:35 -0700 (PDT)
Date: Mon, 13 Oct 2025 19:31:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Add resin key code and RTC
 node for PMM8654AU
Message-ID: <rddqbzh5f4evwsabl5wvpsaxnbq2ndmedwplsi5wstpqxib6kv@lx3lutmsvxgj>
References: <20251013-add_pon_resin-v1-1-62c1be897906@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-add_pon_resin-v1-1-62c1be897906@oss.qualcomm.com>
X-Proofpoint-GUID: -Ri2uZ3ZpolqFvN7hZTfezs9s-89032k
X-Proofpoint-ORIG-GUID: -Ri2uZ3ZpolqFvN7hZTfezs9s-89032k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX1PElLrY2A9JA
 qotdaduA1Rm1N9P8h6G0SGNAr72o/Ar5C9M7KKsE+EuSw1ujhh7qG0SEIWKDc0/vjj+rO0LdyhD
 lznW9zEP35/igUKwj4VoNseFvaLPdkx8exp5jG0eZDHnJ6caWuez4wAElpp1qziw0IZCUIHw+qI
 eweGONWs5LCdLv0DDPs2LATeB9TkAYSWk4Ah4ILPXpSh4IcSd5cnFAbobqufmc1/mpFcR8NWu+I
 ElE7wynQRFcA8kExAHuV8BJEIP+meknxHOB+GFcESXxTrgWq1ZHm7fq0bQbXXQnP8PzfKXstl/e
 mX5IHSPEPnUTI0Cx1OY229NsL0+qIbLTHS3VlNkdIG7kwXF9GFIcNnZSXJ+dEW5VIZUdriBWeR7
 jdX5jW/NzbGfW324z/K2LJHe8qq9Fw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ed2969 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=o6lFeYHLYNB40Li515AA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Mon, Oct 13, 2025 at 08:15:23PM +0530, Rakesh Kota wrote:
> Update the PMM8654AU resin input code to KEY_VOLUMEDOWN and
> enable it. Also, add the RTC node for PMM8654AU.

Two independent changes. Two separate commits.

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts    | 5 +++++
>  arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 7 +++++++
>  2 files changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

