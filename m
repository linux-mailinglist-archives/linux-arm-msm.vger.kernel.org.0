Return-Path: <linux-arm-msm+bounces-86699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50667CE0303
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 00:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A073F3017642
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 23:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792726CE33;
	Sat, 27 Dec 2025 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/iWcOfl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejBDEQBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320671C5D77
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766877884; cv=none; b=hGbLtQTgvcTrhcX3NERbw/P3psUYZUq1WPqWFl+g83wXHjciSjLc7HNCgRDBpYpMf7mzBKUxleWt2EiWl9IjMDrBYLfXLtJvuJv5f1daMt5RXN/TK+vgXiZzdxwhtUuelUr0vgbks9S9fikTHYfPHk8fSVPm+Eoxaurtb1PCJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766877884; c=relaxed/simple;
	bh=dkpib39LfAPFVcX2qI/sL3l9+aaH/QokeukzFEABUFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOZVqKKMn4mis9gBPRgE9OII6JUWEktfIZrcS8iX0MsaoutG77dO7O7O75iI07NLap+vRgg2J8zUWOJPWXBGedlmWmwZcvigZLLSq8DJ+akSR+MIxrhocSwW/dPGysoETZpXzLjKWx5NwXmqLxmzDLfcpLbiluaGrO6415mvDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/iWcOfl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejBDEQBg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRMJMPA1184079
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6CjiYXPrKtqb59Vsb62XoJU/
	b2MptT7N0bil41waJJw=; b=f/iWcOflbFtMH6x8euatBMwkQJabbI2Gf9bxX2s3
	bzoBMLFh6x7wCuGzseTOb7/F3wp/Tjp/TeE5fpYoomk88gn4ohhAeEJJ6MTLJRG+
	kktf9xC5/SmKv2aUMNCtQbSHHmZsGw9XiBep3alqZL8ylHqCJTz/EW2+oSJNW8yV
	5skQF4i5UJHkbE0HtAWPJ6qxOS/zDu+gcjRmmtKCncbMFi0uh40Ra7W/lOPOyRQA
	zzS3uFjyB9/bfHVk8ZT98TsM/YFOz9FeyUQPFlPZt4mPlGyQRmDZKutunsQKWvPi
	Ucdzy6kP/vzxNLd8XvSGG60/VsF8n26HRk3ze6j4p9P7aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bs78u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:24:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so179552531cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766877880; x=1767482680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6CjiYXPrKtqb59Vsb62XoJU/b2MptT7N0bil41waJJw=;
        b=ejBDEQBgCyRPw52OpQPlCi0Ird+6/iOsqwe2kG0u+fIvCCj5xOzjm1kwFYVc1DYhQq
         j7IWh67GosLMCzJwJdEErv3fpYkQDFV0MPuCmO1e/Dt7hwfoAd70gfuPY40ocxTBV/oE
         96WVKPXFsaTA2YSs3N7HfJz5B0jSWpBM6d4wyemuGFtYWiC0CJL0jNZ2fUPdoEP4nBnR
         SFiuAMjFj5RFtzCemSw1OcXemTfaT3cTl5j3Rr035K/GhWL7RW7VDK90rLiHBVEncWxy
         GwfhuhEdyk6I/JwDl1fEX8SZxnBDeBKjrN4Ktao1XSwJiJoFTZfCbPIGtDG/6cC9xMA8
         CY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766877880; x=1767482680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CjiYXPrKtqb59Vsb62XoJU/b2MptT7N0bil41waJJw=;
        b=VZrdpjg44rPuQZdvWKcaPyOPFD/261OuGWXL4hidvo3yRNK+6wBf2w3kNcF3V6kfd7
         0zWZyMv0zWW3EoWRrNZY7D6KII3MvSZy9jdFZELc+pmeJnko1CIH+VqDc3YzU9l+z2r/
         ieP+SwSERZXMffGASHor3CegnGhn72biUDAIc9aimJ4VcxIi07dJD9X8LBcqGEa2pHhX
         o4D/cTqcBXuLxaRAHiffw3J1dOAnTrDzR86EIe1e1CLGeZhWT1cwSCSNfYaFpROtBQ8o
         gz51cV56R9/szg0yJYbsnukeqOAedyUzxvdLsJB3RcbdgIqJphjqY0Pcob/SlXSHmfjY
         ZDOw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmjYiKI6dl3vI11gYT+CuiPy2JwFvnxL6pfqnZAbMu+c+RGxGb7+oUU69gLm/ofBvLe2E6xiyQJj7tb9x@vger.kernel.org
X-Gm-Message-State: AOJu0YznQV2y9Ef7CTOZWKBgwt0Xt9EiRwQfbj9FCUrUxa4mX3sWA22j
	GuQNqCL5ra0NqZwJb0dRUkzVdnFE5V7OPqLYNbFlU5Ivtr9xt8/q0ynW49TxIaSW9AF+qkn6j2J
	x3hiShTErgbs65/3g3JYixlO95RABcxmvsoQleVJx+en6Et52fRFXwMyA7knEf1uINfd9
X-Gm-Gg: AY/fxX5CNeIXm7wKfpnCapZzJxoT1x2WU1pfbSS06YW8jBS/OV8gGwYbcuvVD7D30aH
	+qEi1ekYDYKTNszLkrVYhCZdyEW8f5gRWTmbaFieI34PwgIEKlsbDSAUAyqPuRZzP0QMt10GTFi
	el9h23BfkgsxRT193Y9EwnCA64tO1ebXTlPRMmYdh0p1Nc6LdsYo6y3JuEHYeF/OvLSdlV2Yr4h
	Zt20Ceguhe3/gZO83Oc6AIqowQUz5xBAv+JhhFIHy+LO4RuyX/5B1461XZiTcCmqb9bvzREj4t4
	CPqwW75LcyZQgC4ZHfdSm8fybBqap4mrCoVdel60Vuqtte4Hb5HpUMjfTg8U2xsukVZ4uUyTDTk
	dFcqArlo4wvwi8I+CcNuIHTDS1Oa6yFAZgltJ20BiAmLvDTWXbF14qS8Fl34wkN5m0BHl7nL1Yv
	mPTIEnM7ypr1xUzhjt5hpIuOc=
X-Received: by 2002:ac8:59c1:0:b0:4ed:b0fe:6e67 with SMTP id d75a77b69052e-4f4abdb25b5mr369480881cf.69.1766877880250;
        Sat, 27 Dec 2025 15:24:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGq4sszRVz+cR+XKY7cwM2oTqASKbeUZdXL4s+7Hsssumzgwtd3DSQx5SHvP+tFFQiWDO1uA==
X-Received: by 2002:ac8:59c1:0:b0:4ed:b0fe:6e67 with SMTP id d75a77b69052e-4f4abdb25b5mr369480731cf.69.1766877879779;
        Sat, 27 Dec 2025 15:24:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f09fsm7816633e87.67.2025.12.27.15.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 15:24:39 -0800 (PST)
Date: Sun, 28 Dec 2025 01:24:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <inqtsuiwvbcplhvssn5fs3n4giekcrj3eljkmogko73tgbfzaz@iuvn2h2ezcxn>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-5-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-5-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EdHiLwjuPrvbDsK1MCYBRogX9pGrRKBD
X-Proofpoint-GUID: EdHiLwjuPrvbDsK1MCYBRogX9pGrRKBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIyMyBTYWx0ZWRfX+d8V9XaE70Cu
 jEM+rMNqx9InHonv6OWBeoOAZ9ctiNvac9MPTrtVj1QJbT28XrDtpa0bzu5u/eNf3Dlho536eFp
 cxeryQs+08T4CEdcf8B9NC56UdL7AL+3w/sAqwal7qGrUnqouVaw5pyU6HAIOuvVntFfKDl/gOH
 huQig1iylVP4ONujIKa1jfUcKQlwJMP4eBHrQQAp96MTEgYk1Wol39c/rWqPvhhphozXYpk3f9G
 7rlzjZy1X/foV5xRWCKQBRUFsDICJhoe5c9TqUe1olpZ6uRkfOp+q2VsdUQ69iUIGmq/zkQy+hO
 lzY6gx4RtPvlRsi+IAI1TkqEn66rkWFaQMUbeo/m+SIV0Umx90MEglWaXXofZ42ZqVR5NLJmE3W
 RkfbCXJEfIBJiKT0QmPhcQXJ0HTR6x/s8UNFtJXHFobmyWqxuzu0yYE008KBkJNeQKagxGwb4mD
 dbpNB0DtiFPJS65H2Ug==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69506ab9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IFhsdl8TXimEBemdgfkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270223

On Fri, Dec 26, 2025 at 12:35:34PM +0530, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA bits configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> it to 34-bit based on CDSP and OF matching on the fastrpc node.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

