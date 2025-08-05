Return-Path: <linux-arm-msm+bounces-67732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EAB1AD65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 07:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316143B6374
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 05:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBC72135D1;
	Tue,  5 Aug 2025 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1VWjBLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E27199E89
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 05:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370040; cv=none; b=oYSDqaWDeNucHaJe9a/XMrQ5uQAyJErve6jmCAJzWJBIUnL5rtaEG/ifIyIo9nYiEE+Hg/S23dHd2taZRacKT3XQfjUWcXRfSTmFViDkToRbilOAUsQcITNQ90eFK3myZt0EKX39jo+5vVsRj+yR1gIkMg2GkZwykcHt6ryJ5Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370040; c=relaxed/simple;
	bh=cB0RoKbkHD6q1T2SM/hWjHdFiZDsJuQAftQaPgHev7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSOB70VpwlDp4aOxZURn14VxxIbquFJKPIZUf5th1RdGkeie4DyF7wEd/4CsTp4YJf8hrTFnDLROrlXEA3xpSYXuFMaJ8MuZIJP+MrCGd3AjSGQztDvFu5ybAfIj5L/jfz0+LkLb5syZIs1Rkq0ZtttOCMAcu8iyTOEqpckl3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1VWjBLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5751ekRs016093
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 05:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0DQgWHooGYbmL/nzLf5H34th
	SEgDO1zfXiTjKuJ41Is=; b=P1VWjBLHIfR1XVuzIzFFwTGt+j4gy0b1caNJDDLJ
	SbTeKxBirtQi3WbViE/SLMPz8qOiU3sW/FxOkW1oaMxqKGEHGguIEPfI38VC94vd
	U/uM9xaPJkrX/ssrML8soZE8NlQlF6kWqZQkZq8HVBSBA52Z2HuallGAHpVuCs6v
	of5f2/zji9mf3K4T7xT2x4hvZP/5TcVeQoPAFEy6rRWuShEE6gR6Bq8Rf9JF2Awr
	xib4dNf9UdYgPT/8tsT0f0knAW3IhEf5GSNtaxWKJnr8Uzyo3HN/FerucZkbS3Ts
	NGPmY9cnNCz6Hc8K/nejkdxPC2DeQu+KoRuuj6eh8Kyn5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv3ek4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:00:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b07b90d5cdso13151841cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 22:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370036; x=1754974836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DQgWHooGYbmL/nzLf5H34thSEgDO1zfXiTjKuJ41Is=;
        b=FIluDu7+SlTBBiJeV2HeYe0Adh0uUx5xGayn/SztHf4f5RvKbOw+Ps6uHpfDZFlmA5
         3iGxJt+bAqmAssP8DNwbsUT/erKyWyzOwxXvmTlcBG+kM1aiAp5QZl4C78Q+8hVbED3o
         6SqCTvXCR3lE/GUbgr4Okip9mmAtgPiUWniffwdkjiduK4AZlbq9pwF5m7j9jGFtYdy1
         wjvLyPR8j0Iwdnbv60zC/YYoe/DxrBpkN4BIA6SpF0R5FW6a2+fdMyeaUz5vDdcxswxX
         nErOqKu90SNHmRbaQ1YuN23Sp+plCyYmK+/i7476DgXe2FDvMFbIMkA6kq9hy6SUsOvx
         ++Bw==
X-Forwarded-Encrypted: i=1; AJvYcCX/n47sRHHsYP6aKuRu0gSwKui3WtJ2/iJRKkGquy9GtMOa6eBjlkSBJS4JpunwjQCFCb5psHt13ytZk5+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzI2gaqA5VsZBXiaLYTRdw+kwSg5s9Nm4nqfyJV6VpRWvUKlQwT
	NoiyvshF0CD5Xq/1UbHi8R9VToyHobBKMwAdSzODr7e9/JCnKnlHakQVkCJNkcG7pEq+Bd+B0Ye
	dgHNeQ1USBjSXBmvI36uf81vDKYnDqchsykqY6/CFt+GxRNOZ1AtHRY1FG7PyLpan7NVQ
X-Gm-Gg: ASbGncvkbVGxtCSRJZFwKzzwYg2HnAFIJmqqmQ31e+j/y5HDoaJ2nuGtMoM30cEqaLj
	EwV7DDbEaqNlx7nqsZX0WQucfh8eLAko3QEPKuN5Q3dLSzZO0FuhuzU6G7IxtXO1eU5XbnnA/0Z
	71tdEmTYENmaT/KPDKdNj0LTtbtSbKEbxlC0bP3KERnxtn25uA5lxXjfVtCY87BBz6k8gOKsPeg
	3zIvw1SpQFuXEPn8V6mp4SV9EKHsh2EEfAJHjitajR+GjDop4mRFAQsJgddXjqstz7rqysuWtmM
	QDwPQx6KqGC3v+2kjuHMDvO1uDbZ7Bpvx/Wk7ruZ1lXMeoMNU5JlYtjHC7y1g4VqsMdIkAk8VQB
	ovv3NekuPwZdmeUHoZZl1PsD5xs1dDnRAlGdRCne7tX7LUlT2UHUV
X-Received: by 2002:ac8:5d91:0:b0:4ab:41a7:852 with SMTP id d75a77b69052e-4af109debe6mr149518911cf.26.1754370036501;
        Mon, 04 Aug 2025 22:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqMH2QSkqbkzukFuo9DOhQUO27ugkh1JfZWpneNwe/H+GAHQGLPuQ4NvXpMhqsRUKDJMMqTQ==
X-Received: by 2002:ac8:5d91:0:b0:4ab:41a7:852 with SMTP id d75a77b69052e-4af109debe6mr149518421cf.26.1754370036093;
        Mon, 04 Aug 2025 22:00:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a3243sm1873486e87.55.2025.08.04.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:00:34 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:00:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Message-ID: <wqfapilh4mydzkabt6rvkuwtjoii6wtfhm4jzo7h55cie6ivbo@ytt4xo5l7cwf>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
X-Proofpoint-GUID: xtuw9JjOhT7BFNAgzh8Wd597XRCGVO90
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=68918ff5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yAIwcYGD20Z8B-JgagEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xtuw9JjOhT7BFNAgzh8Wd597XRCGVO90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfX3rMLNg4GtUoI
 2Zp2S7wRFItixsxY6vNkBaStiAFMvQlCt489aOOCI4EEuvI30uNC8S0j/tPEVphs8IUEdR9UwcL
 j12DirS135Q2zrlAMGdJ6lcq1N2maslGfG3RRwUF9/D5U3y2QiO76el+mVB5EmzaXM1zieqRwLn
 SzBAsYr9XSt8P1YSVUBfqWP5DFAqZnPwWMtoHQwkSiXqWnEObYasGWjjigdR4Nd8vLTF+Bt3Klk
 h/M/vVD/An4zSCOxuif2cYhEyGTA3ZKxyERgmvmHhbd2UjwqhpUOS7NGYMYgL4MBdQMqK2USZVu
 a3Rw7YVK5X4dcB+3cDQU+DRyZHNYSubhdd8lZ+UI6pF114knBHi6YXUfRYUbhrryDRDEy5uLx2o
 nrZG864GgaTTemSqD2khQHXVW19e/tAOEaINp/XC/LpvkpegjT4oTT9YgUuXlskBdM0287fH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=856 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050034

On Mon, Aug 04, 2025 at 06:11:51PM +0530, Mukesh Ojha wrote:
> Firmware binaries may lack section headers, in which case
> the e_shentsize field in the ELF header can be zero.
> 
> Update mdt_header_valid() to correctly handle this scenario
> by adjusting the validation logic accordingly.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

