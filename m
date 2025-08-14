Return-Path: <linux-arm-msm+bounces-69117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304BB25C82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4460561B8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B5B264A8E;
	Thu, 14 Aug 2025 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTt6dHxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369B25C81C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154935; cv=none; b=HII+632nHr6fDJtJ+PTfXJ1I2AFFgpT9RNDg3oW3mBgbHTRvvJfh5iQi2rivYWrohJVA5UrkIkpuoczkp7WUnEOqeiX9iQEqDjg+jAMyCv7yS3dm7lhvn6X3KVYLL4WoiGQz6pz9dtSWfs4HIcxNQnmZPUAvD0ND9wJxQf+kU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154935; c=relaxed/simple;
	bh=Lyxa5/1zntq0dfVNk4rbh9qz47lC1ZTh6Pytnc+GsqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMVPRCdFyudvaBEVa9nSG/920yQWEfchZ4XNKh4bZQf4s8T0GHSaW0h0AhIP1cLbNP0k/cWYR9QD2YKyymvNkj6kblcDXXnRWo6HEM8Vz3dLAY7l4Y98JWj7GkT70o203O7MPP2YlizPbRkXkcFEIr06aDbicfgdc9/AySDPz14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTt6dHxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMh1ZW023960
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Iy5XjLJ55RnUenJqnrBHZVwS
	VIhZcPvSxAiSS+k4+Ww=; b=VTt6dHxMQ5uJCZ26BA7BTEZ8Yb5u5ySn5pbhKa9C
	w0GVXirFEI2J9FgwVdQd562ooU+7hjBn2SHIh5nyOgyaK+P21VQikgA0r+mmejbU
	W3Kg5AvMNxsZotpCQ/x63kbx7Zon3nl1+SzElpFWiUO6vmRxnmAPz8doYLwIQ5Y9
	lViJIdCsasV482a4StmPS5QcDNCiMxHkVTYYGqnyWPkInqIMSgVBRZF4PixGfmoU
	WSWT+lQw4IIBiVoX7NCaIQ38D8jBRzz6yJEOejA7KwePbZc4YivFWVc/drlj0BRp
	UsyGclWX07v5EVC84OWJeqQcRwBXoznhdkxqNpzQypv4sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rubfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:02:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bb3e22so19688991cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154931; x=1755759731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy5XjLJ55RnUenJqnrBHZVwSVIhZcPvSxAiSS+k4+Ww=;
        b=HoqAengPi4hOZvKNwT4ZZwb4Vq1jBCTNuUyuetGk1dfSgNirra22IwHm2usHvGPUDa
         0lqel9ff6GWvmfKmPL7xY0g70nTZe4d3IaLqQZyK/opMLLMSPrPfFTBJMEnAP8JpJgpZ
         vnZy8RFM1JJ0IlyJQwcuY037z/OPwfuNp5TXOrSj1crZXDW4/YgqC/JhVrEwXjqlYmrd
         a+CqlafwrYyPSwIVDzxdKGlQEbDXmo3m1KZHIEXwvKmMGCxitmkMgoaHBNloJ1fl6W58
         ANSKE21xorwZxuNwnNUBqNLjntoNzGULxZwzIzQDUfF17nTpgkCpG6nqOn6UrvCiJxGU
         216w==
X-Forwarded-Encrypted: i=1; AJvYcCVYIhnApjemTCrlnGWCrxiAgiWNO8Wn+/T6ur2v+Wwi+E2bOYPUun00hb6UsSfYaUi7VYNlgHh8CviuxmFB@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSN3Cls6C7R5SsrxJ72QllmNwxrd/IMGL8tsjox4W+x70VOs4
	PiHXV2oDAmVxxXWSExW+4k5e5WSqWcoLg1ZSktsatvTzxIjx2E6axjrr0UCj+dufEM7S3/MIKEp
	LYFtAbKX/bcXPjp/NDXb9mqlGSu/AphVjwZdaKyvgZhoFi4vmSgqWGadnxDIaC8NUHDFu
X-Gm-Gg: ASbGncvVriZYSSl4lewK0/v5lKgSxrHmwtMgIDT/eyYZ8wlEeDW/BMkbd3OmhFZejoM
	8Ksj0I77aG0mpu1ADbhmrrFTZUJzWLkUoFqxCPGwXLVgWVcaaiqtvyw9vJYxbGUuQ/tpbbtfFZv
	tUpN8YtD41DczDMxNCrocfn2keDakZjaI6x5PAAkT4GNaRqV8mfSA83Y+nV6UaF/+ntPlXp6mv7
	T6UCbdbv4jsaURLiffTjuq4Dy+T6HcxFYkAwY3rIIK/wzAPxIb7HJyfXSI7HwIShxskCH/zpZdA
	zs2f85cPUthlYqj3sVjxgoQz1tsvIyh4wknkzPnTP8rIaCPcolQOz7+zSPlnll8TmdmahBsMztI
	h//HJIkOa+cT2aSMIQdyeBEf8m1mKaRBjzH3i+lYxYIjyONEqnrrg
X-Received: by 2002:a05:622a:738d:b0:4b0:8338:30ee with SMTP id d75a77b69052e-4b10a920d45mr22488941cf.11.1755154931329;
        Thu, 14 Aug 2025 00:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNJhcD6JQ708YwPrqw+PAvDxzp0+x7FgcO77yGZpD5y7vEB02eM4qqc2J0t07nBTkfxfSOA==
X-Received: by 2002:a05:622a:738d:b0:4b0:8338:30ee with SMTP id d75a77b69052e-4b10a920d45mr22488551cf.11.1755154930800;
        Thu, 14 Aug 2025 00:02:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm5481193e87.102.2025.08.14.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:02:09 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:02:08 +0300
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
Subject: Re: [PATCH v3 3/4] misc: fastrpc: fix possible map leak in
 fastrpc_put_args
Message-ID: <7gen36c5as6fxpgeinc6if7ysex4ieswh2uhqqjtqlt37tj7or@ngpiqfyg2p56>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-4-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfXzWtg5Drs2N2M
 TVYa4eg1CnqObtPEYTD9zv3ayRA9Vb31DpDl5C1tDMHPOO1EWY6qOFzY/lqmZZ+bB8OceOdTccj
 D2iyxwgqG7j92FpkB9Ncn8WM4sBpUnY0xwFOcvg4eEqnWTO2TBh4bYqHnAkQd+qRgsFM4PgFVDJ
 k2SdwW6DR+xA8N/XyvD4Be2mbjLLFV+cZCEtwRVT0AMqxGGtnDYn2A0BYkPST0WFnxzoCxECVRa
 M8FqQMxmMAg2R3qqWqu7rbMLiHM0iQz2gwmf4+i5Ec/RRqUwrzIIdZOaJ4/2eGCMAOrhtATE3kM
 8YI8+AAEXiVVZYRd9v2aH197JKD2rcjWTE/bqniU+HOhYMMJabSnB/5456C03SVXAJJpxYSBrvr
 CIlsQIHm
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d89f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NWtY7HxR_mlG_PNTBF92a_44088ghOVe
X-Proofpoint-GUID: NWtY7HxR_mlG_PNTBF92a_44088ghOVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On Thu, Aug 07, 2025 at 03:34:19PM +0530, Ling Xu wrote:
> copy_to_user() failure would cause an early return without cleaning up
> the fdlist, which has been updated by the DSP. This could lead to map
> leak. Fix this by redirecting to a cleanup path on failure, ensuring
> that all mapped buffers are properly released before returning.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

