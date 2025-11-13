Return-Path: <linux-arm-msm+bounces-81711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6DC59FA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2161E34413A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583E631C591;
	Thu, 13 Nov 2025 20:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GApEKKaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fx01DTd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939D31C578
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065961; cv=none; b=oFMPDjFp2Dt07mxWUkRdsRSXUldfMCygjiHv3aPEzRYqXv9HquLgzc2KNcAPDucxl/kne5H9meH7kyVfG25CYJLRZLjfP+YvJXc9H1EurTj/Z01T6Nq7iMpFwDuqUfEEF5Ghj9+qphtTrcwhIsADNzPNpZ0/K6wQFlMJ7Doouqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065961; c=relaxed/simple;
	bh=YDhGpfj+ldsg5z1qX5rquYyyg3kbngw0flNYZh0jorg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCOqsrPVbKoeX21suCOACIhmBENcd+92eODH+ORdfg1bKoIbBXcEXDJC6jDV79Kgkm1V8fleQGy9cDz2wrtkptLxKG+XPxMPYVU2XzGVJa+313We+dd3RDpoLAs+WK1Fd7WrsmVHIoQ7F1gDbiEkEfoEXWbhMcOle2rcBG7iKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GApEKKaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fx01DTd4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADDRhZP3564018
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7pKUqjqXkVpLjhO3RA384uWh
	SJ47+BaLYYexXOKAxMY=; b=GApEKKaj8fGhLYPQgCHyRfG/AhY3NoYdW2sEcUQv
	fNVFJ+MVDqWH03zcVRYXt0OE+wgyRmM8pTG6oAN92oxBr6wk36cw13zYXUjh44FS
	CLnHjak7oYPqC5k2Ym16n/uN3ePEr6WGikJXJy84OrviRgXtVRkXNA1thxtG96vT
	5JlRp7oAbNjSzlUEeivzDuyNKWnWdRXQjasmcCBTuq+aev8Jl21YOuooo/dx4XWm
	XU4Ums5qKhVXJoOsKS2IQTJtFoKULynKqY2R4u+do59paP+2G1mz3M/+haEzbp/S
	BOB/kzgKUJR2a0n4ALJ7J2cqOSFO8v2PJZiz6KP+xpjhkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvjpcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:32:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24a25cff5so379078785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763065958; x=1763670758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pKUqjqXkVpLjhO3RA384uWhSJ47+BaLYYexXOKAxMY=;
        b=Fx01DTd4m/FEMKFQ3wPbInNIUSkpHPLA2QuHCH9bog4Dkuu0C+rGymJ0c3hE7BYmtj
         MM5WXECWgodhJemRdYxP5/D08d7Nhfab999VMUoxL76ed+zdR25uIx0oh+qFvw7M6qzh
         0HiNWA+f6HiblENIS3+h893Ra4pUeidTo3DN2RUQWcMkRKMp5gz/8YUNPMfawzHc0gHi
         mTqHzlSRRjAAmgmoHjNT0+SyKmorBC5F9RcQCmJ8kaacQutgCJfz7Tx0vSfvIacRWnjX
         ywE5/UbvkRfdJRV9bNI4ELFn0tK3vnBsfTZTJFzD19FZSTi18nEMRHKabqkkmHKwTFcr
         XdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763065958; x=1763670758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pKUqjqXkVpLjhO3RA384uWhSJ47+BaLYYexXOKAxMY=;
        b=Ll+hUK2KrE4gNt7+sWZMJGCfThBzu0yr0JpvdVvCiXbQw5J7O6STne0CVw/l+W/jxK
         PULZi1mUlwNNfJTgy8pw9wf86A8o05CFMVQ0lKXgo9KfV3aJEeT3BXduvfn4PJQC+Hv8
         yxoMXB2dPrTEk8r99oX6KmdtHS336e/DbnAgm/xItK7S2qQbDkmA4TLPd8FdO41C1w6V
         MaF3ZEpTDKaiV5uNTy4r43qykfFkGXws25nwAq7phD3+qcksQKhIb/B5hab+tHdBFxyb
         GKS4O2V4YCb+AXCx6U2VUus9RS8PD5EYgitDET/SA4wvSzDsLucrqo3CBjdq8zBx80KT
         ksnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkAf/rceMvHYPeoXG9T4LmpRlkwYdK/7IjlZBuBcEdy2Rp+cVJPNTJADZH8qw9JZJ1C35T6s9DiIdVS+nI@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSczhkrBiiU3+LekFUzI3CbdfAtMT0yYxPcxXt530pcm6FfSv
	ku47/Bww1Vr5byVSpTTsPVw4yjjZACjAb0OWyar/YJlg9MXjeuyC3bZbwjDKEg458WRHmdgFgeX
	ivPvUrkQ5dyG9veidrUKGpWZ7bpbpnYxBrxyB7W2wqdEtC4EAEhs+W0fzmCvHm/AgY+5lxqP760
	4y
X-Gm-Gg: ASbGncuevHM/0sxWkVFtRF5C+GgfvqJadso95zjj4VZfP39cGNpFXQ3jpA8mT8moelB
	boXhD4LBiXRirFAWw+7vs8PU1R82DsI8X6jraSuPmnZsl6NccGDqlaO1ZVBLe9pFKRWqKZGfRNe
	2zGskLgYH7gubdcP5JBVij9MveobNm6b+nwCv8c3vcmxvZlAvLuamW7jpHoYMPUZ58+OYZ0Goz9
	7F2rR7MgEXSrUr1TPHw7MCUp5K4a7xMg1sOwZgwKG5aemkbNUlqKFSMwSAw5jS7lVeUvkMe0IwO
	pqm99cR7Xluma+KGg8q26/AGxNa6mizSzieLcOY3stgOgl1WHvmVKflu7/D8mYXfCpNDQ2nFXXl
	3fkSj96kY8bblzetj8Cg/4U2YFUhqASCFeyMwKM9Y6E/Ad+H6pYnP7xJfkya6wIfIJbdKowoyMO
	DD/ehwFxGxzQal
X-Received: by 2002:a05:620a:370f:b0:8b2:1fee:4029 with SMTP id af79cd13be357-8b2c31bdc9bmr106001485a.47.1763065957703;
        Thu, 13 Nov 2025 12:32:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk5FHB2Bju/65VvUGI0+bU6hUboMV1drFLQJDIgC3dVULGUEERraCph5z1z906w17s+/rZeQ==
X-Received: by 2002:a05:620a:370f:b0:8b2:1fee:4029 with SMTP id af79cd13be357-8b2c31bdc9bmr105996285a.47.1763065957140;
        Thu, 13 Nov 2025 12:32:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400458sm597998e87.63.2025.11.13.12.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:32:35 -0800 (PST)
Date: Thu, 13 Nov 2025 22:32:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG
 variant of DB820c
Message-ID: <wf4h2lwyvgswtv4bgdfidj4vpvykwhu2gri4crvvtd644hf6nr@cnpqi5bmpvm5>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
 <20251111-db820c-pro-v1-2-6eece16c5c23@oss.qualcomm.com>
 <02a9d6eb-e480-431b-bd4c-a35cee170516@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02a9d6eb-e480-431b-bd4c-a35cee170516@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=69164066 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u3Kf3rDHAAAA:8 a=vz8XGB6UFhsza2CXe-QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=EGheP1PGFffiXWuNiQ4X:22
X-Proofpoint-ORIG-GUID: idFtFWeyQmfirNLkmJLEAYYcq8tDcg8Z
X-Proofpoint-GUID: idFtFWeyQmfirNLkmJLEAYYcq8tDcg8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE2MCBTYWx0ZWRfX/OmAxS4XLfZ4
 VzlekNFEbwqr7nKiP7N3oVgXzvGm+fwLsNAbB9WjQSHUskCT+mNOiGUmb4MgcWKow/spP0CdSCx
 PRQZ/5q5XQjCZJOgUUMtdbEkp0wk9Ste0PeM3d3pcBX4h4FkXGzpszebtN/DVt44iWhW2idreIE
 g4Qq7gns4PJZNqgtJB6xoIWAjkQaCxxSWDyjvR2tdQTELLxVagzoED/wEhiXkCfo5hevLkzztWx
 Luu9oLyD4guisUzV7wCxS11Gcjadj13ANjVdJY8pfZi+nU9Dy1mD03GL9oK4VJyUAnAeMW8lOWZ
 Oel4Ub7EndoTBqf1aOziSMipyCHvUre9SDxAmfDHvt2tQlrH+r/ob+zBPFkXhyLIWxVqSy+rf/f
 N+alnq5wvRq5ZU7HfVJQFExffuZKTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130160

On Wed, Nov 12, 2025 at 10:44:49AM +0100, Konrad Dybcio wrote:
> On 11/11/25 5:02 PM, Dmitry Baryshkov wrote:
> > There has been a (rare) varint of Dragonboard 820c, utilizing Pro
> > version of the SoC, with the major difference being CPU and GPU clock
> > tables. Add a DT file representing this version of the board.
> 
> So is the conclusion that both flavors were used?

Yes. I have had a production unit with a non-SG flavour. Bjorn's lab
has a standard one too. All units in Collabora lab are Pro ones.

> 
> This product brief
> 
> https://cdn.lantronix.com/wp-content/uploads/pdf/Open-Q_820_Development_Kit_Quick_Start_Guide.pdf

This is a totally different board.

> 
> suggests it was the SG all along, FWIW

-- 
With best wishes
Dmitry

