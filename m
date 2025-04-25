Return-Path: <linux-arm-msm+bounces-55693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E73A9CFA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEFC77BA8A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2E61F8BCB;
	Fri, 25 Apr 2025 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDsUZthZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989D1E834A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602259; cv=none; b=G5wCz9Qu/1iP6PBe8NlZ6vcRM7wHaG3OAq6+1MznbkGm6+4Fc16JgFdFu2PuSQDfZ5FOF1uXDr0QOuwm6bez7KQ3GQegxs0/jSF9wz4sAplrhIK5wVZE4Ukwz4/v/4Wgurr83FWajdokeutDLxw9uQJ5Am0EH+np1rgGIKjmvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602259; c=relaxed/simple;
	bh=2Y7wGlQM2yG/HX9oFJj7fpeCtYJynzOdaQ4/Ghdq82w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2JbPrdhx22ckCoIYdwsMC8wLC8PYvKiJMtKTcr2+0UqBPmhO0oukiblm0M3K6nMG8P/nXibR1x1Ehq0srN37pHqfRwvwkmoKHgnrkbdfvicmDk+Jr1oWN+TI51Uf26VZGjBwHmoN2li/zafcGomFZyNfMe7HVpsb9gS1yipNAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDsUZthZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtTn007900
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=21WlXd5F9nKR9C8cuYQfBPNB
	+eYIpbIQPgwD66DZLf8=; b=EDsUZthZSQ9irj4dfWoZULdGU+QQhAZ92nfQIApN
	wypswh7cwS0wpr4IaswrhqHxE1P/QLNLuZ5KvvUZd5GQmOj7mPKSUsu/RWHBH3NU
	gZzukiTfeSLXmAk74tOSDRBk+7S+Ku2O1pUB69Zjr6K2lK6RCl2m+uEmO8ebRVNX
	scFfEktwMxly00fV7w/C7LUeEX394zM1PvgRnug1ovi4oPuOb9bat/mESkpU8kWV
	b8fksW9aS8U9fIblvZC5fhH0Q7AcfQsocqu3vhLmiHSacq3SA/ntI6H4oh+JNy7q
	OQpf0kDfXb5tgZ3G7vOx/efIdCqcUbVl4QrPLxwVSRludA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2hw8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:30:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so452334185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602254; x=1746207054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21WlXd5F9nKR9C8cuYQfBPNB+eYIpbIQPgwD66DZLf8=;
        b=nMP+/rSLWSwVdLXEeSUWxsf6mvETDsEMw0ksU4y36PnOsCzB9bgw/+nwWE4WGnPM4f
         k4KBc10mgOWYOO/EYdy5oggdSk8PXEa+lVkSmK+rnVBsfSs7lPQMbsIEjoWo/o+an/3z
         GpJyS5Okwo7e5afy2v3Cxf+Ci78xn2o6MN1+kXUuGfkEaDd/ihG0Sz09IgZpsmXjyuCo
         SULGgBCd3Fvp+bvAb6ItYenQmV7Q//97v+DnX8Nr1RmWzSE7q/++3y/soMVcf/Xj6Cxr
         FvXwS4qWW4Ae+um7I50FS8GUXRpFAWPTwH203UzFFg5pP5S36FQxqj26GX9cciBf/dWh
         UhCA==
X-Forwarded-Encrypted: i=1; AJvYcCXD8Fh0N54JhiBO7Ig8snU4744I1YdE3as8/2v1mzfhmvHFRvtR2WL03aB70MBMovdO0VFonBnUGVC7QcYf@vger.kernel.org
X-Gm-Message-State: AOJu0YwcrcJ1w/cL+KPByPMZPeHKgF4JYnY6Nbmhu4yYp9jrqugeYB5E
	kdwXTuIt52RdJDg9Y3gZpBQ9vwM7gd5ojhlZJEHaC0FuIU7o40DO9uo/w2LhAUgZ/5YbOmO2/0d
	CwYoXAEXr1Q/MGyiIrGuO+08umxIJ5Kbz/2NljooUezwGdX2SgkEtF1GILDhOss54
X-Gm-Gg: ASbGncvDqTTAQUXvRWJNBDYQaLm32RB07mdE53UKrmozOKIJ2oqwpeXnbwlufK/Vcix
	BGebOCtIaTbOJoN/7RXHxiAV9CIJtvZLO5ZtX6OpiyrW3xchuFcRyIpVC6yVcY2EPx86hDj/CPb
	WtQGj32OoPatfOAsUWYuXjeqnQsUeZTdau1JefvuVWy/5xt6axgO9i8pft7VxVYIGQecJj77nY+
	dpgNCzCHEhwbjEVijG9HZBsyHBH0PjhtB5E9K68pH1VJTezXEJfbgsx2qloUgXnUSp9OYleNPMd
	vRR7gpsHb9jOCKaU0MEz3VK5z1rBjJ5+YBki8zlW4OhTVIrKMvJummdokkIbmP3+7DIQQV8b0NQ
	=
X-Received: by 2002:a05:620a:4694:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c95863f7b8mr972471885a.20.1745602253960;
        Fri, 25 Apr 2025 10:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENeplBqCuFfk4C2SguqDeztUVPytcVD9nnZXiZ4kjuj5HHA+ECvqnxncLgGy8g+RnWX1Lq1Q==
X-Received: by 2002:a05:620a:4694:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c95863f7b8mr972469785a.20.1745602253649;
        Fri, 25 Apr 2025 10:30:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a426sm8223461fa.109.2025.04.25.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:30:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:30:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm
 defines for reg
Message-ID: <vjfkesae2gszpvjvgfgpctqumdxriwha6lolmmke6fzdfweuda@4fsi7i4kmepb>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: 6WffHag_vBrfQX_Qiq5cwCfRmRhi-Hy5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfX5a3jVlNX3nD7 xgqeY54H4q2bqwFuqR+Z5kwJNe1y+UAfeOunuBz4mcoU3Asmbjbn/uLRSDlK4tCWkEW0kdk4prB mxGSx1WFJriiibjbzODIgJJ/8+cT5tk4c6xraEf9R75/8LuHgAr47pdyIbKlTX5J0puqfykaOrW
 dt1/sNdhtAiXuKus4nPqUrZ1qEULWDlk1o2WEncwLqbX7s7Z5iFkACbimcVOd0SeQxiD78thZCg gzrNsIl5NdD7DYAyqGy43/K+MOdLQOU4l6sDNX+mx+9Pa40Wv0HdhdxeR//5OCFm45owOb3usDA 3hyHOdgwLNKU3RPXCzSY8ScBU8Q66ddqK2z/Z7+CRfOt+Wij/vCoojEI7ReFWAPlNjSWqpq1SNE
 dM4kWk9CRv1Ty3zUxnTmvbnx8M1xF0wPjDyDWizpbVtTl1ycdmnS/GIGVqi5LWWNaW3MSwaO
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bc6d1 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 6WffHag_vBrfQX_Qiq5cwCfRmRhi-Hy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=587 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:40PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

