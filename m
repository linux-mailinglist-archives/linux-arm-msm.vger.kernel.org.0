Return-Path: <linux-arm-msm+bounces-69118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64CB25C8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 773827B8AC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789842FF65F;
	Thu, 14 Aug 2025 07:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1cxzIob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033118634A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155029; cv=none; b=ONH+hV2QOE1AB4tyCUT6KARx/lO3ZIw8i/jOVPNLfeDz+853WmecbmfNLhjVp/oI+tDk5c/1+VR9Iz0gfzSdeRMgHXQ9JQbOjvDQfGd1rOwRe6NBNSDseFCwqn9eikZQwT+qDBpw13JrK/mUx4b9M3d3oPpKkUsR1hHigm+DD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155029; c=relaxed/simple;
	bh=c07bFBd3mXLkwBPutavl3gY6ldyjnpLHHq/cXaQN2Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1OauVRbXOcNmRBnkMayhQfi/lLbnVoQ7743pl5Jo2qEjg0CURE173pACnALvwBMc8JU6lZ7iwKp4IaDq9r6Pvq58DZDaSLL/iYkNB5rV6r5rn4vTws7Yt32l6DohaeZdQL7BKX349JRNjjoM3uhIuIYkywr+t5sum9tdKP6wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1cxzIob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLPhE0002871
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LF4IE+UwqtQfgx5vOm9pwD60
	Wb8Rm7zswbtxjHM+xig=; b=n1cxzIob5U5KJR2OWy/pE3dMoARe+ewMjBiKHBbx
	SzWOvMOscxaJTezwTN4nlDLQWVJab1jOhoNFyuaknnh8vT+ZvKNLQLo6fVIJCjtC
	SP0VN19y+Bo4SoM8ig2Fw/2K8OB8T/UAng0+68LGzVFUK0cGDYj5yBk21RY5jQT4
	4sTEfSB1wAdFhMW7GVTzXHm98SdGPe0c08yxa+NUMAO02QFLdSzhLLB/ImqKQuy1
	D7ZSqUiH/3o0az8ItkSnpOUTP2Q6HJIuR69ttfj9u39kIFoFcjjZAJgaMcyp3EG/
	fgDjsXv4u3fDWQmpmQXReqMNm5F0ztFcgP2uONlTJOIeQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv6q2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:03:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b1098f924bso18587001cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155026; x=1755759826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LF4IE+UwqtQfgx5vOm9pwD60Wb8Rm7zswbtxjHM+xig=;
        b=vslSbcxBK58sdWnnRJY1NR12MzVtRIcwpg1VMGbru628eSVunt/4TfNslNkpIDw8IX
         lwUoqUkKBr1SN7wV4aZGF6NIH3DNivGOhVXnFTA3RZw9VQ87oJuZhNKOKWHoQKJtLGgU
         WPfHtxqBgUaLzR+tD8pENxt2UwxYIPBESJI9w58Po261vZkIqVYtdjxXaO8IV+H8as1g
         A7Lqpr9qC93hNHWQTT17iNGPDghctFsVZVqm4p3pQGE1xXtWIpsDeK9E4Y+VsvzrujAB
         aQVgLpaO6+xDsya17EdeBP0unu8s1cS8twaFJPtpgv2brzwOItBZzYjPp/WVEGwCSxUB
         YX6w==
X-Forwarded-Encrypted: i=1; AJvYcCV5Vj81e0Fu+IhUyKWYhhXtMzsOQGsSgJDpuEz1xJh8Wr7g726snQMiqx8ckP+y61ea0uYiKa5mcG0sy87d@vger.kernel.org
X-Gm-Message-State: AOJu0YxYedzFWo8BDy9k9HFfmd7mjX65ocrRCbc/9OhrElRs4nIK3Smm
	MYjmVBXBmG5h+NyYPO3HecArfZd0qzEX/W4jYUiJ+MDUTK9YmD10bHn6fWUqHXnNrdkCIUHq9dC
	kJNqSX6re/1RvsBcpB9U3UPvIdCZE2SXT0V+HCz4eRBNp1QotWJMAL3g92lRhVbuMwiwE
X-Gm-Gg: ASbGncvb5nHF0MxocUFBR+vzJ78mTg8l4/jIZVp1ArfL80S1h01um5TBVLCW4kLCp8s
	7iReZ/zPiNfdSyXBsiHMKnPWVBjrZAYnhpEU2FtXFEkXCAvOKR8S7cRpvgIORnsi2h4tHH5npiz
	wHFNx7ZlxhHQGHQHt2aT7BDzYwhjIeAAtTRIlnP7AnbvkjtqF0adxDtHJmZ9CtB2vU7VrUT4oxF
	GtoUB9Yi1P+lLq5RjridaDmiOEMUQPnqy3tgktXTWVvYl9FH8T11EfkwhCdRE2gYcgDEIkuLpeQ
	SYQmTa72v+FbwSsK48VbeAsrm/JZ3SyHKiNiEAgk9km85VGhO4sXNTXE/Gde2nODO99Ts5mVbLP
	3bEI9bQmR5h2iiS52rxmWhusJh+0QR1JOushUwOwpuqIr+U2DrVr7
X-Received: by 2002:ac8:7e95:0:b0:4ab:b1d5:3b77 with SMTP id d75a77b69052e-4b10ac12fb0mr31956481cf.45.1755155026260;
        Thu, 14 Aug 2025 00:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb9AznY1bE/2T3os5xRxJ28Ngs1U0GfsgKPw61bINS+BdKmMzoT7z6J2yBVZFHfwcAp5+2vg==
X-Received: by 2002:ac8:7e95:0:b0:4ab:b1d5:3b77 with SMTP id d75a77b69052e-4b10ac12fb0mr31955861cf.45.1755155025816;
        Thu, 14 Aug 2025 00:03:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cca1ae1acsm2393274e87.4.2025.08.14.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:03:44 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:03:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, thierry.escande@linaro.org,
        quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Skip reference for DMA handles
Message-ID: <eyqm52g3oymidbylo2jp4uihp7luwhoet2sj5oxoz52bcsnhhx@vusta6qaws3t>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-5-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d8a53 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JkWzhcs2yCoc1eRkl8M1ofVYkkNFET4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5RTgHr4GchrA
 5mMc3navE6SI4zBDqLqMT09yQ41b34JTxJbF/StwxDs1HoSEShg67Cs2olF2J7M2oUpr/563Odq
 OhBmyiYLmALVD+HxbHEicyMufwPMicZOpxfAdO5WckyTPhXKWawZWpluqw3HDVx2Ipvd339SYUG
 5Xulk30GYQ989eNILgHcxGoLIp0y//oFXEOWpxvWHFo0mtahpJJOfzYhrXfDgnehTt/mC3e15YG
 ER3WxtujvBo+lO7qC4FyYXN6RSdhF7QorsQRxgb0wU87rYfGZykdYAMJOFm/O5HLAEyr4xG+zmL
 dCWd/KblygqTonpR1NM7bwQotRJRqUCbYJuDvwLVYO/d0wEg4bP4NfNn50tLA7b9oqdFaTCrAvm
 CRfzYktg
X-Proofpoint-GUID: JkWzhcs2yCoc1eRkl8M1ofVYkkNFET4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Thu, Aug 07, 2025 at 03:34:20PM +0530, Ling Xu wrote:
> If multiple dma handles are passed with same fd over a remote call
> the kernel driver takes a reference and expects that put for the
> map will be called as many times to free the map. But DSP only
> updates the fd one time in the fd list when the DSP refcount
> goes to zero and hence kernel make put call only once for the
> fd. This can cause SMMU fault issue as the same fd can be used
> in future for some other call.
> 
> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 45 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

