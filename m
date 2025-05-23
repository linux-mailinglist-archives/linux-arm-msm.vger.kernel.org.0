Return-Path: <linux-arm-msm+bounces-59242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6022AC28D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1433A28379
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C8329B767;
	Fri, 23 May 2025 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UauyAqBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E212980DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021688; cv=none; b=H5ul+XXHqNZv16ccEkiUFAzoAJ3uBNTdy4ZfqvLBUrQrqHwtWx9O9bPEe27vNx2Qei7gas3U1IDIedALNuDCrOSeAuhH+M4sN5e/tIhXUK43JFnSvIZ+MB7p2DR891Q1/wF5Lr7vFZ3hu11J7C8H1Ltdejcf6ngI6MxGXFqgJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021688; c=relaxed/simple;
	bh=CfPwsGCjMpa9GTGXDQafqAYVJKVnEyWXaBt0Gr4pDVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWyatzhkhiKQ/J/zSgUpNsW+szjiLxzbaMquPgBReK5Ln1fJKlsyegz1rVcT11jfUQivIsoQpSm24T2b4AGvOzrWQXzKIB+GaYvaluCVNlC+IWCDLEaaeOe/AxBMgmjDguc894gJyDfMX98A98IbO9yXqBbZJOtu6Xo405P+QcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UauyAqBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBM3ks006792
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rp/eYPMfAXp8V9bn9zs7+o5p
	cqJmNq1x3hm6P0+2YIE=; b=UauyAqBMD3QH6DX4JjgJNbfdtiSot9sN+3cJXY3e
	c7QefBl8kx+eg2NgyFVyDLmpvq/wDEXVbyIGmajBGeQYHJ42r3rELp5Vf/qjNm/7
	86reZWjFiCHpOuYurM2/KXoLhs3krQiB3b/44UKzi0bcnVdJWcfcu5SXh2W2ZzS8
	FRQXVEB3GebVAvup1CmkGb0nwEKzvJ0f+IoWz7T/eGFcjGwfATUZhU4dfy3Cyvqn
	8JLagkoVvD9GzTX80EUcury3hHnFMqSqnS+SbuUAUuhz0LrJvLAwJ1q8lz0JZkAx
	HkXsvVTkvi7WoWkF4wcPOmsQfV9/2JhgHth4j+W+cycPIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0twq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8dbab898cso1847606d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021684; x=1748626484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp/eYPMfAXp8V9bn9zs7+o5pcqJmNq1x3hm6P0+2YIE=;
        b=PuUbr+qtw0jjBqexfFstCDzPxVG9b6qVX2WBDn/ygdsePm4W9iVXxvziSwDoBGLaxG
         DN3ecC/DVK5UaTe36+Z4aMJV8Eu2DXXQZCctjJWVZxQCPEjcCB+FLgnFAjhW0dXl5MXr
         Sb8GFJcDHzXBowympYXIqF5Z00cmKUEzr/wIEzdJb3SfyJuUCW4aeGQWAfjQw3xTwvbG
         r7Vhvqz6xc4MAX5LEGmj02ac8He4ScFPsI3sbgaUMDt4l3vb1BQS05EtQ5ArcIFW8+7o
         QWkOY5hM7kwy3HUVtM6N68k0GvLglz4mAVc+HIMeVYBoWCiTiaAfLEKxSV8AHeQRFlyP
         kdJw==
X-Forwarded-Encrypted: i=1; AJvYcCXU9BZMw8y/7RsnFz8jKSf/CqPTRxqD2ZaNAYxEFchvCZ6+b4eyg+GCrVTgaIyZce9EGMmZfM+4y0LkUnpm@vger.kernel.org
X-Gm-Message-State: AOJu0YzDejfAz1BdWzOyRsg3D/G1i1MXdrAyTqR3KhQQDeRXM3EvFHjB
	TdjCdZi1wWzqer7NxZw6Bu0DTaXVa/XEv4fMlIo/OKUEOIADDdpU56aOARf+AZg7a0jR6iFa92y
	8+e9qxhaQKG1TGA9Fg3cSaZ3bDlxWjREgcrLlSZol8DVXMODvNBHr0YDrZK45BhaU0aV7vfaClY
	3Ydto=
X-Gm-Gg: ASbGncth0cf8C2nY3hm4nGoGZZyXve1uXjHmWd3M8YXn3uiucI7TIY6UAV+UBMJBvhX
	+1BWSJWsFnmRa/dea9DS+o/1d+Rn73aYTLvXjtyPmNP/4dLqTjvjVleltOGjDYdRrN1sCvbCzrK
	YMai+DMXD8y2n10RxCbvThY6szlVrSP7qepBln9F55DaJ2XMZ3poVBE31yaqMVE49lHh1U3K09+
	FuLRv2f3DcUC6prsZs9B1x1ygjnGYytrheOGe3n+nita10Dnhs2fxslIETU7nydBdH++7jHT2S8
	BY+oXebCEPu/hO03t38m6oLT1o1o3qmvF75dQzkFvXkyXACRe/FsOl9AnJzzBxBYvRTb+lAnf2s
	=
X-Received: by 2002:a05:6214:c4b:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6fa9d13be9amr6012426d6.22.1748021684629;
        Fri, 23 May 2025 10:34:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Rldi2+FEs14z/AVucIFJserNaopcgHlnQSHmQAg+TPCfJtu+N/RwCEuKwyeggBLfnyGRtQ==
X-Received: by 2002:a05:6214:c4b:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6fa9d13be9amr6012136d6.22.1748021684224;
        Fri, 23 May 2025 10:34:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcbesm3955273e87.73.2025.05.23.10.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:34:43 -0700 (PDT)
Date: Fri, 23 May 2025 20:34:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 08/10] arm64: dts: qcom: sm8350: Explicitly describe the
 IPA IMEM slice
Message-ID: <n7gortqvdkncn4qhclblitiqo62bxl6dyf32kynau4525dx5p5@uw5cnhbpnapr>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-8-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-8-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: IbQRC1WgryJRd3MTVHdIySOS2yw9m1lP
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830b1b6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: IbQRC1WgryJRd3MTVHdIySOS2yw9m1lP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfXyWTsXWs7tTsH
 5JtiRxbWE3XDPku41W4abslVn+WGkIFWoilhABmfyxHWegFw+NPsK+ANGjUluxCQ6Pttf8Flc+A
 mhU/RgZJBCNbVSt7EaEvW7VqK4ivFD+FnsXgyGH9xhiGOj8Tl9ZHDCefIpe0rI43CWDWZ9hzARF
 DbRdoTHDTKrIwwVI2CmR9+FbPcPPWyYGEMUbcYMYcH5CGOMyjZhM14AtV3bSxU7vD7kle6ZuJul
 2eYg8Ju4NA6B9m+Xy1rCQq+bO77NplnQi+PBi5NR+JFPUC7vBryOqIKdy9+seWTOmuDD8UqjMrf
 Xey0I3M6rzyzpT9vruMDoE8vUNK7jAiYXKs4WFs+WeW0cvtxeOulODkg37Da/aKExAKvpRUcENB
 yzXCVEVmD9FkX42TjV7Moojl38EvV1HnfBlRI5/J7haoP1+87VxepdBXakRfhgqiIDvKKwKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=703 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:23AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

