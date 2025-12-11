Return-Path: <linux-arm-msm+bounces-85057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52122CB60E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66A52303E64E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A6930B510;
	Thu, 11 Dec 2025 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZC9wF7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYjdZdfM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF431283C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765460318; cv=none; b=ROaui6c8PvpfEUbM5LXaKPiYEWshoDv2GHc8qxGscvIzazqsMcxXh6b6mWgh777u0wYpe+AaYmz6mHRnzAZ+vG1YK2DJQJFGR6+m63Za9o7sNAnO/vSuuoy25EV4vDVTgAjAlq+3fuHUgGfzuv9dn/l3QJv3IuJ7v2ld0DCiL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765460318; c=relaxed/simple;
	bh=0XxEF5FKehVgy+piGRqaHQSdKFpng4vJ3y+vf/BPOnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbWf62OqHa40aYFBrJq3v3tpLyNQhLHQH8wV7WndQtEGn8BJ0iTzE7UiGF1qbVJjjMhLByEm0Rw7ncHHDNzNAWcNV+ZMdDSaXHnM0b5TeMC8rQkcsDwNNFrM8ftnYLuC6FOs++sevpXeR4ZFss6JH0g0FwJn7WpVSwDI25GZuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZC9wF7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYjdZdfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXnK31032252
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1txFr79AtXs5zaKWsK7avjrh
	Np91Cmv9tciNTCP/ZI0=; b=FZC9wF7r0xzWVHjIpIVdT065fJR4/8LbJPEW2wmu
	IEXZtro8wxT5zSsYAOb2Q6lwreeJMuCvlurFpz9OVQhG8oGzRNfanp1rs+k8Pugt
	jk/gLNDSsMVp5DOStu3Xm8/SQZnSms0C7pCEllcrTtSip1ioXAsuZ/YUQ7c6eyHm
	GBHdMgcxfrHjpnfpHL5tmLZDX3owkMTmFlGY+boebKuVP9KY059+r6+khAOy3IzE
	8d055rxlDlBmjBNWIEBFGxPh8Lvn1d+JzoPyO5a4DM7xUrIgoW/Z2smMxp+jHOkL
	et8okZs2kdgDJNUSiY26uREEIBddM4YRboHyVnAPmEs2vA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfjjy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:38:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee27e24711so1647621cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765460315; x=1766065115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1txFr79AtXs5zaKWsK7avjrhNp91Cmv9tciNTCP/ZI0=;
        b=LYjdZdfMcsm2BQO1H+wkJeuRSszXyijEOO0IrRvdsIsSRLR4mof/gEJ33UqPSWyd7F
         WSDvmJYWsdT3gBbwYgptIKk9HoHhK1ZsR2amhsUyllEQDDaghbffxidLmzkaoS5Fj949
         JpDSdHXTbUQbWTEyMxs7SQhhFIQcscxJD1pA4G4m7Ozn+WGh9FJF4XCFKJ9iqKHYIush
         tSaosF7ulHQ9ZaJtG/OSMFMtB5LuuipFrIqR6deZkhbYmUp37Ig2rEHhDyeWFU0hQuQ/
         U9xTSJVsI88uZsTgdMG24BNuFJ49WYhkzevI5UDTdHKbk4/AhgyxjSqhTqK/Uq7iF5zA
         4Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460315; x=1766065115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1txFr79AtXs5zaKWsK7avjrhNp91Cmv9tciNTCP/ZI0=;
        b=wSVkHKIr5y9tcbeuWfr+0cafbTcjvleMKTI3tqQIaetUzMpizFGWNMrZgXy/9Mskrb
         4TbkpYIZg9o9N151olYnTLyoc9Hm9vjcQIPDHBRBDpX37KLyQwGLEK1wy8a8ETS3b3J/
         EvNZFWYvrl78aQRqhOO4THQcJgMrDmmZ5QYn8NXUrSyNqLLEIJf8ssRuBjFoCIYPrOSp
         E4j4RauLtrD6kxgLyLI9bojOPSk/C1Y+mVBseQ1jCbocFOy4GBQ3YJzSqdO+gsCxKhQg
         gvCTvnQQ9mX1G0DMQuZG5+LLnADAOq63uEcLEaUQ8pkFcuvo7F+V7h2LkVjAf+0WEO4S
         ZKkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZjM18rZR1MmlG390vdNA6/hEp8EdEJ6765TqUdyoxxW/X4iAOmBtIh/MH0QE+OJw0HKSWWEE5ucyt/R1v@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7S/okUK4osumITBEPjwm0VL35n6/yPHggEprvfAqHs3wecAMY
	6K/MTXmkN3F9q/Ukz1pxtJ7ooHB7G5YXLb+2qPgMjPQ87DOaj63/MmnwD2LqvodJ6qLS2nhOhQT
	8xxnD0+zfsciu7HofOog4GuGKkqqc6B8urKiuQ0K5prXTKvmr2qVt/96jMklif5j3Ie9p
X-Gm-Gg: AY/fxX7towDkqYdIVClfgu0j2rJr+SsVAywGlQJuWNfbL0mhrv7Kp8DhjAtr3dkXZ37
	kpDoTGDgtiZa01NtEZFAxvw3MlVm69yBPBXhGWaBk8Lq3mjic1QJObl0IY+ceXZ6srM9+U5D67X
	F47P20cXYZRlWtUkQwYww/JDX/xJ2FRdjKevAGPsoblIEA1i9S7cui2bhcGYyplgAkkt5PxF0gA
	G6FV3cLVR9pzZXhfvhK3Nz4WESZg9RwPIpgHSCGUPvyOkNKmE73POdm5MFtA57DS/psOB+OTDYx
	eyaC9IUrooqDZev6twoXeaB+VFeWK2kXEux2Kvx+cGT2tTeZzHly0r7CsqBqL3h2wG1Guxpl4Sd
	xMFJq/Re9onuUuAOVX29HI2SCxDQZdZfj8pU+gVNKlI+MimuBCWLZheoLqlIyCUwDsJ3XFoWlx2
	mkk5uD1nVwp1/DVtWU3Fc+xWk=
X-Received: by 2002:a05:622a:5a91:b0:4ee:1a54:d2bd with SMTP id d75a77b69052e-4f1b19d3c6dmr88158891cf.29.1765460315431;
        Thu, 11 Dec 2025 05:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2TUScDpmeBa5M3MVeCZVAKKT2iORqa8I+l1ZWfWExOlbD0U/32mQsYXJLNemDvwTLUvDdqw==
X-Received: by 2002:a05:622a:5a91:b0:4ee:1a54:d2bd with SMTP id d75a77b69052e-4f1b19d3c6dmr88158371cf.29.1765460314996;
        Thu, 11 Dec 2025 05:38:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa7fe0sm871983e87.72.2025.12.11.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:38:34 -0800 (PST)
Date: Thu, 11 Dec 2025 15:38:32 +0200
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
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <e3kkj7fjovs7gd5vqmyrgkojkodmmaqur7tzuq4oq52zb264xs@x6opdbm65k5i>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-5-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211100933.1285093-5-kumari.pallavi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693ac95c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IFhsdl8TXimEBemdgfkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: HAD6vYg8fEexhbgIz2bnXEo-Le6ecCbK
X-Proofpoint-GUID: HAD6vYg8fEexhbgIz2bnXEo-Le6ecCbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNiBTYWx0ZWRfXyUVZuHuIQVa6
 59Ax7rVEmGpHfW0nnFhLtva6izofBw3i1udv47kpj8AB9/n7geSz1NdCcMdmVdwAcp+tuuw7G56
 iawoOJwpwY6xyXa0BC4CApFoin5MholZLbFWwFv+wnJmDlYib3qQY5T1BFU9oAdL14ZX62CXOGk
 gcJTfLIC1yc0CDiwqbp9Z8rkmu/LaK0uGgz13xBby4c0drlgHfs8a5vgw1KtQfBVNKV3j018lVy
 XOAMCfbS7wO42JLFnw2/0PSuSWXT6UDBWAWWyHXi6gZvn2lugdbISXrvp95y73NvCwXSps00uHP
 VM48QgUfD/g3QxCv/WJCD8KAvui/Zk/+JeYXr/6gGSC6iIIkYdagoQurPdQ2U5RzbD9529/k28T
 /kXjLmE8imZ6H5NF6birHcLPsDpenA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110106

On Thu, Dec 11, 2025 at 03:39:33PM +0530, Kumari Pallavi wrote:
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

