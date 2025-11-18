Return-Path: <linux-arm-msm+bounces-82293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA4C695D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E25EC4E602A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0709833B97C;
	Tue, 18 Nov 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SThZBPsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WT/34nAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931242FBE13
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468750; cv=none; b=EwuQuZI8V9rSyxhAzHUcRpJF4+pCDDfLsI+PCXMl1GQXinYpw/FnuykfykSVXX6BknWpC81FGFbn5QAI+o8vzh+OEyThvNBKCfgmu/IBk8udflWjWiBwARN+HME6z7uqSNLL2B5pLBx9NQIDLzyH7Hz/DRcynM2K942z+/U8XAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468750; c=relaxed/simple;
	bh=IqGoxiiPM4aaVI6Cf3IQO77aMpWHjHKlELDDj2XgkKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnjwikPbdw3TskDgjACr0G/9ulnG0mm6+7Q6ZAijoppKxXRQ/JUM/J1vGTGfvXoxWP7rD7XjBkjtBHGk2/zUD5yF0GjLwQ5HFf2h1fsdEAo9bWl15A9JCzhS4ZJvbcuO9ae27n7u1htYLK5u9xs5+ppQhUn2dbCdKt/c8qLSGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SThZBPsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WT/34nAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8DuwF2194267
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z+yvga2fkLkSh+jx+IkNSFeb
	A8zXqFUeRo0e+HHZXoc=; b=SThZBPsxXxOgq5hCv3+xTxwWiAj3Y13Eew7nKDB6
	H3bV5nnEsHgMyOXXcaKMIILiQRMsFvHWcd1Qd1DEFvONyvedtulhtc+3xwYfFlt8
	K8eD41OzFWae8G0qu6tHlm8kAN2PNdaSso9y6Uv4Z5mYiPrYastIUkxcFtAyDvOx
	fSXDDlsEDUpPvlqmJnvUNDK99qTKjKvpXCEQGQcYR8WWoCRkJx5Jrn7IjJ9QjoJm
	gMwVrDH9gB3240/dxJ99znBdWv7rIufnh1VxPWbgMyKk4W9Wkmliq13V9SJtLYko
	zRaLKDdx+94on8cRF3OBEh2yk5195Ngub2D9KYSY0+mceQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8qbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:25:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882381f2092so258111466d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763468748; x=1764073548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+yvga2fkLkSh+jx+IkNSFebA8zXqFUeRo0e+HHZXoc=;
        b=WT/34nAqUGNUWnzMsyt/7ZRRnGLkIUZrfIiOfucNK8YAGZiv8XaywsSNqxgkrrMIZb
         U7C3B5mD3/Efwfdl/Kne59nWeOGbNXaUdzEzJeWFV4W3hi5O3ZoBCo7tfy1U3Usk/sxb
         RPig5pn5qKF7MK87bXFkc8GH39gHnKtnwI6mRbSYIcDgBOzPlIlWY81YNPdePqGPzkNL
         pQUGPIlNATsUtzBCo0MhpM1EnvGGuQMC3Zk6iQb1K7nxyKjnb238ZtJ8nRsHM48tgoAh
         kbdJ9Vw0LAWryPhi9Z9kemvSNQIW3PHNs1BvSW4pGuKlK0PaNY1StqEGb4veMvnDT4Ks
         R8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468748; x=1764073548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+yvga2fkLkSh+jx+IkNSFebA8zXqFUeRo0e+HHZXoc=;
        b=iGnr1myJnwZ7BTAznBrgMtMVnGAXVlq5plRHd6/QSqryltiCmHX7HBuVSL4+BXM6t6
         o/gdBcLuQ6pdP7k7NNwf1SbWfddzBhsV0ZLB4MrfIb8pPXyf8LCIfYxSftv1K6QZz3eG
         LAPESz98OkBmQ12j+sVaox1nakh5MfypbQb1FLqlagq5S4Cs5agS++7RorTpCeA3ioLu
         wZ1S37iBtFdH7Kd4QgyVqsMF96DvH8LdXi/YTvjS6IfW8rVICfHC6UsBlD7zwVx88eMi
         Am27+n/y6sl/s6QB+lV9y/zQYalXqtIfR1iBj2zayaphheKz+JjRvQIObGMOngIHnCxv
         +/fw==
X-Forwarded-Encrypted: i=1; AJvYcCVFRUze0E1QeQohgPo5MdaUn5kQhCueYkRrO1Wes5whrCQJFq55bif9A/6n8czT6jRB3EAHJEqpOoO7Woo/@vger.kernel.org
X-Gm-Message-State: AOJu0YyQiZ88JOcuHDqcRyspBzXtjdyL9wA+6Jn7cCoiobieKqpeP9cI
	xVpYJxaeMGBqXbWFQyBVTtlQwwRccm16SexoEr9P2xDnd728taf0YmkopL0oCUIT2cS8aYrtkAB
	M1pyFUywLBFCapvxHH0msEvWD4uq9u3TLmNt1DoXjJ1TR2iGNxkXAq1MRntJzwCnfOK6wbgZHiC
	Lq
X-Gm-Gg: ASbGncvbczClrVbqI6PeVTZqNpoq//8Jb61REIWhm7eFHzPOvToxui5xqAB6ZW6pxG2
	9ExXKnGjdELDoyzZ/4P/ySIoXo3aE0U9sD0c++8AXASyIuGD9WqZc/tUs23rE/qxKTbNA/wkWFN
	0cuzzOblBQ4bK4WVDRIvw8X+/9o3qpbzfl9qL2I1gMNNKh5w4goFruPo8etvz5yrm1gyGrw+nGo
	Mp1D+2sySNCThcZkkV3pFs7gIIq6fUxLDi9APbWAiiXMWxg5hkItzgGDLGeR9HJ/PQ4F4KI2orF
	PS016J9oha/I1wDJjM4LNS2sFh5BJqQl9FKIzDG9QjcYXUOKmOParC5lOKeR/RuBJBiJwQ12dAZ
	0mdk6sB3F0TI/JA2RCmZHNn8CwcvlyD/RnacwH0NEevgNLjIT+9e7rPRv1rlDTaXpySssC15l5r
	bSdnhmbj4VE1gX
X-Received: by 2002:a05:6214:f03:b0:877:81d2:4c27 with SMTP id 6a1803df08f44-88292730b33mr264092436d6.57.1763468747687;
        Tue, 18 Nov 2025 04:25:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/jB0lm0f7k0C8j4wvF4D17T671o+ynK/VtHEgOJw7QzP3MKqj/bQ/UKa3XNkKmQMcnKa9eg==
X-Received: by 2002:a05:6214:f03:b0:877:81d2:4c27 with SMTP id 6a1803df08f44-88292730b33mr264092076d6.57.1763468747262;
        Tue, 18 Nov 2025 04:25:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b2e26sm3951074e87.24.2025.11.18.04.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:25:46 -0800 (PST)
Date: Tue, 18 Nov 2025 14:25:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
Message-ID: <d5sn56mlwaae2hou7t6pr24h2pojvjcv4ufsxg4lbbnk6vlpfi@xc5e5uekofbt>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
 <d9af64c8-f0b0-4e2d-b182-824078f5d185@oss.qualcomm.com>
 <9c10881d-d5c4-4e60-8960-2ead76c63a2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c10881d-d5c4-4e60-8960-2ead76c63a2d@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5OSBTYWx0ZWRfX5OfTnxrDEoLl
 YZUdio8COyB+DJwd3d40VO9MlSw8QicXOoX+Q6BzKsw+fNRWIPOOMG1RR8jJU6JFwKdrdFbEzGr
 HfWA+gwfUd8CCnCPlT6QIpXFqYwFQ7DAQhEUh8xcnk4QI7I8AAhHy8YuLJsARXMRh2KQy4iC3rT
 B0GgCa2rTaYOAHB45HCly1G4yosLqdFiIBpNHYCkFV0dhZSJ0cJzzLd81pk1ciCQsHR3felargE
 Ydz7uMf6MnUnlF9qlMETM/7HfwlJjYM1nrhr61x6DmY+iCsOv+l2PqRxrQaiLvhiN2zlT4rqlT9
 NmY0L5GUvhefZt58gAEefJ6KoylpIv2ctYoarfiljf0+5KZnGHfeRjWAICX2qAqcDsAtY7TyCVb
 /HdAqQ5GdV3Q0sjCb/0gGSRJGIbBmQ==
X-Proofpoint-GUID: IuiD771xuLY3My2sUQl2gcgNyjemWJNC
X-Proofpoint-ORIG-GUID: IuiD771xuLY3My2sUQl2gcgNyjemWJNC
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c65cd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BbxNYci3Ycueo0ITe0IA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180099

On Tue, Nov 18, 2025 at 12:39:51PM +0100, Krzysztof Kozlowski wrote:
> On 17/11/2025 12:35, Konrad Dybcio wrote:
> > On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> >> Make use of the __cleanup() attribute for device_node pointers to simplify
> >> resource management and remove explicit of_node_put() calls.
> >>
> >> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> >> ---
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is obviously wrong and not helpful patch.

Describing why it is wrong would be helpful (or having a pointer to an
explanation). Bear in mind people who read email archives and find this
very brief note.

-- 
With best wishes
Dmitry

