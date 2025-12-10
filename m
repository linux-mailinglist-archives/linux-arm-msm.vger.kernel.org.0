Return-Path: <linux-arm-msm+bounces-84893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7029CCB2943
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A1E7314F508
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5103427A123;
	Wed, 10 Dec 2025 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXWsDUKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDDAehit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8422578D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765359274; cv=none; b=u+1ZyCgICs2YFEvWW346YJL51AGzeuH01ovYXpFB3NoxAMSn0jSPzaoxIlyWXueaVidNQbYrOzr1rkkAdh2TLtq/GeaP3eVLPvz4J1sbwdPrHOrs5pVLo6OMXnH8L/1hxxolfGaCssT8RoExzi5zU9EbrcJSORZi7mYX0Ksk+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765359274; c=relaxed/simple;
	bh=K8Ktk29wG0837YMw5/6Hjk6C7ucXIM600B9IFlBHgLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P01sdkacodmPUEOuIW3LADM5BoG2GmH8o1/0G4wNXMFqHjPS+DtutwQ/E4VWBxsdiCAQ149Q03+QlZGUDR7FqmZuz7JKird6KBcUdQNG2vGQI48Blk3NBbifM3H7aAlzxxgQ7CWuHUNgnzA9p3SV0o5KRW4eThORGMBrYbhTrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXWsDUKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDDAehit; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9GnlP2858891
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nLIuiKI9f3uhqvvCkT23dkW7
	JCF4Jb7RHeBSa0lWBeY=; b=SXWsDUKIHQaY+el6ss8G1LPcVpbnXRULIpSQMEM2
	Aem5ICghSFHJqtKnXLp4oNWkD/qDRYl2qJTwAspl6kzKa4O57Ih2AMf5QP39Ii2x
	y5YiHa7kRiepebP6Ih4CKAd6+cg82kwlPYV+/hDn0dz3D56AcMOl7uX9RhVq4h3r
	DoI22yeD4v5OhCrGkqhn1o+eIfjPXq3fBs/7YwXGol6qAAaK2hKxmF7W+3McZEFn
	B0nEnN4TuAviCljLInA1+ozClXgY4FtWCxwtNRku+icehKZ2dbRcCy0jhuy20evg
	T2sPYebgjWHz1Iub87XI7fJYzfyeWzjl2aC0oaKKQFWd1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay63fr26h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:34:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1453325885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765359268; x=1765964068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLIuiKI9f3uhqvvCkT23dkW7JCF4Jb7RHeBSa0lWBeY=;
        b=QDDAehitqiQW1skMrk31wK622j13UazXDfcPM0dq3HZABHla9gUWqJSMO1fLyUSnd1
         Zdlft6s2QqZuNp9JUZFBBAVAqDDfM7y7lvfPwljXFsMeSvHSLeLXHL3sBB2A9/Mv/LdF
         xA+h71ved+SFnfSFoVLN1ISZaNEXEqR0hPZ0Iz8S9M4QypnG2HdwZema9A/SUtBHyXgw
         8/C2RUpfG9yxMf8KrmDvivDldNiLl3N7wZK/txGGR/lbeNgj0wEysfwMLXSt+84MroOg
         /XSr7P0IoQhc32IoFPDz1y1pX1kOqG6cisf6MkYlRIk0MDz/zK9ZqHKUWYbJpk07zBKU
         NiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765359268; x=1765964068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLIuiKI9f3uhqvvCkT23dkW7JCF4Jb7RHeBSa0lWBeY=;
        b=Pk0WU3yjZcYWfbmF7RfrI3k/U9UC6Hhay1eACMvdiuro1cO0QzLTuzAVkxGxf9+VZj
         jGBaaEMnB9UMg0h0yJv+unoyCCnCCuVR2GEGbDzRxuDoltB3YYRgPbEB6aJS2X8ImdI4
         7YEAPKhGAGSE4t37WsU/Y6p1PBollf/26NFlK7/F5dbmyxu3A4IxN3pyBAJWyD41ovkc
         Bn9rPY+0rCtIqpratZ912/2WiWxQYJ2hK8uPbajSiNiGuicZXI7v5bgvF+I6t6SHwZ3z
         QGOkaYdg0/+p5qemJYukcuV4x7Swp5jGljhohOUu+yqIDbmOW55NKggh1lCMqqFWbaiF
         bqXg==
X-Forwarded-Encrypted: i=1; AJvYcCU+2a6EI166A07j9lqj12oyhlEFv2f8eAXfFye7sWt4U1FrwJBtYaKz+g2+VfawgoeR09aXYuynAzZ0/s7g@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmsmEDSLua06fPso5T/NcljKXDVhVeYc821++QCzcPfC+ih+T
	2mlnqR7jnmBFAogxVzbxzEjZx/5GojBx5IXHZeJc6v5ewRzRM29EvIbqrd8hgUPhpqzBKl6yIJX
	8YZqk8o14cfUMm9LvCQwrL9+jwlb6zb+cldLrrAagTMoAYeAKh+7RM/r5n10dWq4I9AHA
X-Gm-Gg: ASbGncukMEbSSWud7VhuR8XNh5jsEeZCl5CXuvWGyNoLxZO4w98ghQsb2jaAoU9H73N
	uACnRhYFhi+zsbpFXMsmaBTvplYfLRLy0Ch6svxuPsyu7HmjdhIEkyOtVJIncV4KDW57FpB4c8S
	T3AdNHTvUsKeTEVhlcpoVu782GSEopoMUVjCxX2ngpqb4CjGKDW/+Szm62Bv6psFOPyGn4nR+Yb
	vgaQK00g+Xl8CQjAEL1sWwm64iYyZVhEd/qsCvXHxtq3KSv4VThv3esZ+B3ba2qG5dxllJ8klg0
	l8pZGFTQTvL3Buhen9Jxg9MMAlnKVKap9DGGthqcNcDs2Qng7xclY1wcRx4sd3UGqKp2kj5TIVH
	MInDJAHn4qPOre1gZpohNIA==
X-Received: by 2002:ac8:7d88:0:b0:4ec:f9a1:17c5 with SMTP id d75a77b69052e-4f1b1a30053mr19154071cf.10.1765359268488;
        Wed, 10 Dec 2025 01:34:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDeVqlUuRLhGJTrU6Iist+YSKg/hZLzAR5AkOQCy5T+Dviv0W1bkWvWWnSC2UV2RakIsL3Fg==
X-Received: by 2002:ac8:7d88:0:b0:4ec:f9a1:17c5 with SMTP id d75a77b69052e-4f1b1a30053mr19153861cf.10.1765359267845;
        Wed, 10 Dec 2025 01:34:27 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44d3d9esm1596754866b.30.2025.12.10.01.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 01:34:27 -0800 (PST)
Date: Wed, 10 Dec 2025 11:34:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: x1e80100: Add crypto engine
Message-ID: <sr45crjfafbwgxeykod53ct2n2yy527ldzufbnspl7bc727lpe@efstp7dz3omw>
References: <20251210-crypto_dt_node_x1e80100-v5-1-5ad22a869a56@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-crypto_dt_node_x1e80100-v5-1-5ad22a869a56@oss.qualcomm.com>
X-Proofpoint-GUID: 6xoS_-PhMq7dR9Okgb85esdpq00JmA7e
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=69393ea5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GxKyrKa2EaMeXejysu8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6xoS_-PhMq7dR9Okgb85esdpq00JmA7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4MiBTYWx0ZWRfX6QducrwrzWAj
 LjdkDp3q24K+xxD5ctH0302if4r/boEqQRWaYl3kurwMPimUzhRDXChm90C7e+mLm0PjKcY2SGI
 t54DVw4KHmslBiO9yPivBzzPqvQwAWVNxrzkZOq5PaRqiJpTaKly1trjiM1D8L86Zakz/bnHpMn
 NVW9XjfDbs2W1h0lqaexjfgd1PMSr90jCsBvEG89LIKSyQbY5Ip3v2b6+AObUEiBibj67GcKzyB
 N5/uv//GfbFst7p3ef38SuG7PpUq7NdSvCJrxNmOPlr4IsUEW3ENHPuCk+fQfGLTRt/c3y378+t
 2KsPHR2TxeyVrZYDtrBwVLkpdMdkp+ODIIvi3qn724RA9S5qx2qaaVBlK/VbBLC9cf0dG9kmu9k
 wF5XAF8GQXfrvtmvyxaKUOhBq6qwIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100082

On 25-12-10 10:55:33, Harshal Dev wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

