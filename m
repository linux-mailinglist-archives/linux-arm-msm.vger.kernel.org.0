Return-Path: <linux-arm-msm+bounces-52076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF0A6A431
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19083463AF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE932248AA;
	Thu, 20 Mar 2025 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTndezSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8814F2080D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742468086; cv=none; b=D1Ox0i5H06pJtTz0YrOyoFFTNeQFW1uLyo2GLmKCwKZygONymSAPLhikyuA0Trnf3R9Y4BhiUrSBX9f0IcPXvlSIeGP/J4/GtYyPNmDxFFKTw41iFLL6NYiLodsDLEs9iuiqgALQwAFKocOsRc5sDY9diBURosWA9+oF6WCX68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742468086; c=relaxed/simple;
	bh=Gzl2OAOWftrG50OaeVh+6u3yuNfq2LInxjiLaVChIWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2E1aBXRLTo8f2+R0/Z/b82p63KOW404wl4DKMSS5GDFXZwLvXtoTB9cRF1XbGp/nKXfQVO8WVri/wul815QiFJUMujmwJW3aGp2Fx4ovGjEUD0KMVXgVdiMZj5zaw7SWB8d7eq9SLTOBou0OFFGrA7c5uRjKwSPPT068XPMyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTndezSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6YwOe016194
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9MSSpvRG+TcV9gNCepPHrW84
	i6zOiyJTCdB87QHlGkE=; b=QTndezSmxaQlMikf3B1wozAHStIREKiRVGk2iEnt
	qyPikNFdl/tDpwOfzEh/nbbo9eRkOMm5yIwYizDD67NSX7J0Hjm66O1bvQDO6NfA
	yUk1vZGxUZ2PgoY7XWE8cdNEcHIiG9KLOwIJPO7ZcUkZ0QHxqFvFTBZ3AUXbOPht
	wnLVrkt/FjAtymCeUpJk3Lmlba54awBkpaSpEK2pRj+QWvg8ZARjoGF6xy9OOOXx
	tg9E1zpV29QqyWeOLgXXU9gsGhr2WIeE6/Nnxdrmot7JnEIj5rMhLhBg5IUX+tVF
	XU0b+l7AfnkPlbvPkqip0KbIISOdMmb1oPuX7BRgl70bvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t421hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:54:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c548e16909so64757285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 03:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742468083; x=1743072883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MSSpvRG+TcV9gNCepPHrW84i6zOiyJTCdB87QHlGkE=;
        b=jCWxNQQNQ4apdcZxignMAZ0GbuK+fYZWcwlGrNfiIR0VflfruODR5VMQphH4I/Ltsp
         Ttj/uA3j0RuYMAY9bvZdmf4Oot0qHnbjGGk3vufeh1SDMJHirf40p1K49TMCRaFKGWhz
         jDM6tuHtpZW9tqcjm82NeUYMybsAwgtdXKFPMn38X7vcoftbz+fPcf+Rc+GEGYqM27Ox
         w79OnJiWivSyUfgFOeXTLRoBZ1gDEMIvE/eEWYKoSEGTDFbfqA285UCvaWm9MD4vNiUZ
         CoY7v+zG6ufDi0shKhN+4RtRzz1AHGmFJy594XjNpN5ZSP4BVpTE0lA8s+7yAxoweF9j
         P5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUM0XFpL6qT7x7rhy7tFx28sTjiV8mKz7pQ8Acm5ykiH2VYelQD+cePXhUOcMpHV+2kgVLJA9DnmOlY2Id3@vger.kernel.org
X-Gm-Message-State: AOJu0YzLz3gfkD6oLmZKHxfOcKHNGDipoqTPOtxdVUXqwZKRstwemDxn
	niPbFHPnAyohACoSZd4wCNiYzvALd5LeihGv/7OdnRbK0g2mIudtuSE3+VOnT7Jvu/lQ+InwtaC
	C0Prjq6iqyjWgxziDuMUuIq4aKVCtMVxYRJvkv++kLJUcHdXbTCIyeG6nvsli/hvd
X-Gm-Gg: ASbGnctOut28KEkpT5XwMHixWTRX7790dc5H+u2lhpfD4ImxEIFYWlkbWLoXO/RfrR6
	H0eaauSg0wy1fKbP3OPzln4i+tLqkn0XIr5WHLkvlpouenlGoLXeTkpJjedvj5P+gCzzm6zFNYk
	pNVySUPdOQb6l5oufzM4wAkbfOUz9xDcPi9j2QuHZIWdOvscHvhnlK7SkoZ6go3KSIQfeznCqLL
	gvHnqPSomsCuiOMC80QMgI5JYi+y5H7udqPpWNY1ibjLDsa6vf9IxNwpHoP/gJvuyAgNzco9U/M
	1Lc58Y4s0P5qX/SNx5e9nBkiTHG6Y84zy+ggtSZofrXUFGxn1YE6SoJT+8mXHnRxMKWafCGsc0R
	3zIk=
X-Received: by 2002:a05:620a:280d:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c5b0d06405mr416386385a.40.1742468083405;
        Thu, 20 Mar 2025 03:54:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdFV9xVqcyjUuzTORF88R0q5+1pBPTL/vZj/baesC3onvB7C6vsCaH9ilw1XKWAk1ufOuWcQ==
X-Received: by 2002:a05:620a:280d:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c5b0d06405mr416383885a.40.1742468083112;
        Thu, 20 Mar 2025 03:54:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8516sm2247703e87.31.2025.03.20.03.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 03:54:41 -0700 (PDT)
Date: Thu, 20 Mar 2025 12:54:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sa8775p: add GPDSP
 fastrpc-compute-cb nodes
Message-ID: <mgtqgzra5n4tihgyrvb26pyzfcsupliorc4hvrmh6j4l2zw2gv@ozfjoxdolle7>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320091446.3647918-2-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dbf3f4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=X77NXM8zCmOlsI4LSM8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0WaKqPfusli8yTM5NKUpZiRH9m4qv6pe
X-Proofpoint-ORIG-GUID: 0WaKqPfusli8yTM5NKUpZiRH9m4qv6pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=629 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200067

On Thu, Mar 20, 2025 at 02:44:44PM +0530, Ling Xu wrote:
> Add GPDSP0 and GPDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

