Return-Path: <linux-arm-msm+bounces-64790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31531B03B38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95B3A7A4C5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C50323B63E;
	Mon, 14 Jul 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlmyLUPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209301E47A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486325; cv=none; b=NAHyBgq1U9DpWVO3criRygXYSP6c5EcAZ6sIw7+SrpeY+KLGVmVbW4NlNWckhctobFKH0NXvPJ1Jbl4Qd76OQjvqkOrMzzm11P9bHpits5fw5+yXJ1anNw6xho0WG1xeoyty0VGjhlWs9X0f9fRgw40feZHngX0FviofK89AAF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486325; c=relaxed/simple;
	bh=19FLfrQWrYTSbSU3JGPlqFErrmbDK9ROcIwOmU/chSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mA/gxEx84CfJb8LZVMsMOwb0eFnpJR0LJqnXPdPOhy+88iy3ClAySTxGf783rgNOLpTROrR7BxkwhFzOWR6S31MFZjaOLF8IXJSHN0sXdZ5Yt91SGcnMl6S6DrTpF+mJNksoUdC6tUwqcrS10mop/eXcZy9OMug58cJDOlo3Tro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlmyLUPg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNNVBh024162
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RAwzxfCx7GmXiy6V5DJ7j7sn
	U1MBsuON4yb7/O794BI=; b=UlmyLUPggLg76qotGeFrsy+nINSIvvwtxKOksFd0
	7RVx5g2PJlNVK3FJjpsefV8CCFaAN8l3mS5dgKRvHIvqy4SRHwvCfdJ+RDT47CxX
	ui+ArKf0zncegTI0z5dGjITETgznrr5pTqYUkhOMO2jqIO94ZeUbSITziJ2E3qFv
	1yRk4bmJwAkbHEHC4uaAyZkKrhvVlMY2kr+udDH9zxVjHqF57Li3Qc84ut8fWV9T
	NtiTNLKyoH7qbxW5gIxa5AQmqC36znJaAIoknSukVFnKF9OZHzOrVeHS167fpdYH
	Os8QxOnRyoxEOR+w8LhFjKxzpNmWya5UrQ+XHu1bnjEBgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbc12g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:45:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e269587d8eso165911285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486322; x=1753091122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAwzxfCx7GmXiy6V5DJ7j7snU1MBsuON4yb7/O794BI=;
        b=rfy9UVtZN+KKiWs6wkJ6pOZWdH4mpsnYVnAX6sX5IRhpGBLpWjXnV1VVY4tLPcKFPY
         YHR37VckVmQwxbswJ4US4NfFNeYSNEZqwDuXJxR3YOGyPH4n63Yy9FtnW/q4+KmGZMM0
         Jd7DKMCN7vGtVIhY3XsNwZCFaIUm6qZ7BfNF94ZW0vQqc2ukRX+0klAfw+A7n/r2rP7X
         SIPkQ3tvnQaMFU1qI6gdZxkab7RD7JDwkxhwctfh3S5517tzeGO8vd6y87Xc/uX4cjzR
         +hEIJaaWXBbOtki+VIDpjArsQyHQ+aOZ7IipNfmXXlV0jmcN0c9q1r5pE+PhkBFEgbgW
         RFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW60IQ9nv40GTgbikQKruGdDujTZT3g5nSvPejsQGPqHtDrhgyvGOQwquMXuSimZDhaIzdTwDZBXIAUQYgi@vger.kernel.org
X-Gm-Message-State: AOJu0YzUewre5efDwylNmfov5mKt8ANfoZpnu1x++ynpE0+HcKio222z
	rEUz2K/W8OzI/lA5SoBObnZwsx7OewzFJ6zkDDaaCC8/fX2YiYgSesf21C7HFSnja+ViV5zWmKR
	RFQar5wR7y4IgTVVCLjTE9DAtkfGIus7eXUHW7D+u76ESvqcunOk+y4Rac8xxtKdavx0f
X-Gm-Gg: ASbGncsByFhQKXWonm5i+NWAIold540PVtDNEhqgYO8fM1kWfDLVwa3bfCr592FFIFE
	FdTfA7SXdbMTeIqL+k7nqQmdHR3D61E7yEVZHW2NbNghMXdcFoyFL3DrCCFOVNhCn67S40HCuvS
	PQdfYzegl8q0m43SRttCpGwepsemSFkDUBSY05VJ80MImQRLphQao/78WPWi5HoNeMnIUe6ybTk
	vZEA0+qz4rhQw0iOfOwwGBJT03W/IYp6wsFBlDFi75VntSR16ZmjOpxc9s4j5c3FC/Roln+xM4Z
	6DGujUZGPgp1nOPP2Y8QagUunbXI22gXLbnE6qFebp1qiFCY1HBcKSD8erjxm033eX8AkYbdgly
	5yyQJM/QmvPOqyBjAcT0BY5zLwI8lTJXg5y06sTsTij6+mKoMXLBv
X-Received: by 2002:a05:620a:319b:b0:7d3:90b3:28f with SMTP id af79cd13be357-7dde9b5fcebmr1665486985a.5.1752486321973;
        Mon, 14 Jul 2025 02:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvhM/t1FHIrVZWVYG9mhbjIjtg3iUsjf8ZC04xPKQpfbPSy7xMPnq9ivIn1rnjpbbWl2zg9w==
X-Received: by 2002:a05:620a:319b:b0:7d3:90b3:28f with SMTP id af79cd13be357-7dde9b5fcebmr1665483385a.5.1752486321371;
        Mon, 14 Jul 2025 02:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7ea9e4sm1889678e87.73.2025.07.14.02.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:45:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 12:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <lzdhczkz6irj2u2cwxounro3qcmp3glqzswreoqqvxibeeacny@tiohbb3bv4at>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714054133.3769967-5-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NiBTYWx0ZWRfX8UmVpLzeIZq7
 u72cwJ2k8I2mL/TrHXs8uq+NR5BQVr3IFig5gD37wDESYijhalEg1PeIkxr5JmOh2qgtFdg0D+n
 jeJexVq0F96FbYc3VgF7Nhk4GFv8ZMKZ+lNZcTF2tD4/OgbZ45vfjtIwPks5bBW+6fNf3Lk1GLJ
 bqNlKuoywn9igjqU6dce8/ubjwqqVpDavdHqxVrPC7eUnwZfi0E442C3YAtVCjeIFAfcGBP5GsR
 a9lPOZz51t0BLw3hVc2DoIhhH91YKbql2joFD3wttZIu4Zm4e/1CBB7Se57R9Do8+B0ncdg572v
 Eobx6Znfv911yeJqKjj4fPp5nm+KFkjFKBccGmQEP7V2XJ8edC1qR/2M2AonumvEXUrldz7OkG4
 B6eWJONUTxfu8m6dQG9JGvpXY7pw+vJF8Tl4+m38+ONp/F0KtzWOHZ7CfHROPSUJizqPMaft
X-Proofpoint-GUID: YYZ6SmQ6khhQiy9Kd8WSsOEKDglPmLwS
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874d1b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GAzI_fwOJHwl1SWvAbcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YYZ6SmQ6khhQiy9Kd8WSsOEKDglPmLwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=766 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140056

On Mon, Jul 14, 2025 at 11:11:33AM +0530, Ling Xu wrote:
> Some platforms (like sa8775p) feature one or more GPDSPs (General
> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> a FastRPC implementation, allowing code execution in both signed and
> unsigned protection domains. Extend the checks to allow domain names
> starting with "gdsp" (possibly followed by an index).
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

