Return-Path: <linux-arm-msm+bounces-87161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F4CED495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 20:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8FA3004415
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 19:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94114224AE0;
	Thu,  1 Jan 2026 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVk5OCmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grW9bqdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2193D202997
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767294187; cv=none; b=p7MQJdPvvvxcUDCUPP/yE9QLgzGCiKluhMggWPUmrFpzYkUxUhC9dmad5wFDPVXuXbfqhkX96nIwTtGec4BPH7aBvjorsNQzTLK5BUeOdxwlBlHK24rTD74JjFltC+oaTGZ7OqXyS39lgkVU+Ekmm8vI78JYbIihI/u/EWNzWng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767294187; c=relaxed/simple;
	bh=OUWnoWTNPdGbUGux2s2BxAMRUnlVB6mcFngLAWpA/PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiixTPkOND/hQ19VqZDchLofjb7g/nm45aOz8VittCNE4Wz9ypRFbJ9MF9CPf8K9MEFbkq3l2Gu2+D6+TqaqKrvSs0DeOaBlvQnMzCJywSOC6CaSs8V/E3kExjg7M88SMMTITBb6slFXhmFWsJsFTKW0KdP56ubvuPSFAuPBmhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVk5OCmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grW9bqdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601IXdU91745026
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 19:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+QMKwEVC7Suor+bYorU6lSsj
	bvDGk1qiJYr7KsqFwEQ=; b=DVk5OCmgh6we/gApUU0oj6gT4khXU52t75L5AuaW
	zGZIQptxgfMCq6VDx/pC4ailine5HN19W3s7r0i+Ou+C7rIw4/thOoTJ4uKFEJ9N
	gyRxHVG+WtkXI8gcBy9FqyYLrw2kbCl3ESUIiKhhp8PvYuU6pCXUE9Mab39TU2zd
	N7dAtKeLfLaLvQ9cHNQEo3N+zXb+/tYSbrFciu2nwm3k7V4iggRR9xSxLxymbhwI
	jOynhDD3Zy1p0qVdw/IP4dWX81sKWEdcrwbCZrj6M49Wh14nlcti43tDLGSxAjm8
	Xbum5Seu7LOxu/hJZMlAfx3J3WyeGljVOrz5CP0e43HJbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v1ws1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 19:03:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d26abbd8so349873681cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 11:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767294184; x=1767898984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QMKwEVC7Suor+bYorU6lSsjbvDGk1qiJYr7KsqFwEQ=;
        b=grW9bqdkNeMxDEAUaB+5uZf8vUpgfybNZYDnES+dU2ZBUwxr+hEXrCbmO8e2Yt3WLx
         xHz2yqqstwKYuGx0u/dNgpD5aAQtb0QimYUskqJ568sox7je3aqJugZHSYgp8dyohByy
         m1P8Jg9WkEBLzJlp4GOqANbAa48Dp2SCmQoP3+qVEinzrcnut3rQv3N10sz+ezff9JHj
         XM2Oh7Gw4bFlpVzww/wPVaptjaj3DCS88EE3yJE9X/1hGpFrTd8NJVjcKtqWRJ1RHCd8
         2PKfJKnW6D+EjWyMs4vk4DSZvI9gl2KHSPKRLSoagnvWMfuw1GH+u8AKQAbHVMJ56ZiP
         yBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767294184; x=1767898984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QMKwEVC7Suor+bYorU6lSsjbvDGk1qiJYr7KsqFwEQ=;
        b=gysTrVgI+isJl3BkAYiCmnpN5QOS1lSfzptJIaWzUhK7wLqmdKE/7j8AB8UVNswakR
         jd6SQwcZUe6wzaa1eZIT8BrfZtb3Axu48+8mJOjixXB7oXvdtEVn9NcD2rd42oHdNu+t
         DtRHUfAQtnYy57NSi9FkItrH6f1jA60FGU1h5h/QYzrt9qS9gxetVEFfH6wnh2K9d04m
         knt4QTwU25vOybOTtECYTSKrAbY5tPN+DOO1JcjknQUmzoT64R0lrKRBMdx6t+pSvFyZ
         F1zUhcJC19assOKSmhAi77V2GeLOg3aj52jAgfEN7zGEth2eVXYe//KKfuomke5m++W6
         s6cg==
X-Forwarded-Encrypted: i=1; AJvYcCVK1up4yse+UaFNpyZ7RFyjHuijfq06BvgyJtb/PDWYdCEl9HdOFwEEcGhk/FlsJiVBBOyXLVygla0HHn2l@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/SwDYFYKXzAH4kTCJh30JBCdWIBiZkazGFqDXUwxcCZ2M1MW
	FNO/cmVCvVAH+HlOfdiA4bgrdupT+F1c9WtXGmqDOfj8z5Txmukp2hB4jxOHpYkVVeXdvO2nH9y
	RenuJQbntfy5cB2eXAhhPHVOG58DosWMqn0X6nk1W4+hsLM3nQG9s4+ZcqGwnlUUifz1P
X-Gm-Gg: AY/fxX7BEgG1SUIPqCqqQnHTkZqyrE4frTq1ALZyP3Wrvurfp9H+/qnlrFYp0y6rHjl
	gqc2M2eaMkH0zIo6n8l960Uk4Rs/LmeECcoV3GzE5QoW5dtulo5LAZF3WGNW3UZpSp72h3COV3e
	C7utK+jkX7r8Swjqz8PMz76UA50HyXFSwhU3jq3r7sojNXv0/TTaSlNQmBEKh4ovR4b8+KiRnyq
	7o1LOoidQDUCoDQBhuTfvKXOxKtRUKoH5b7i/GI2cYG8PBUklx709u4Qq6EmvMkl7CDGQckRQB9
	TOTwqHsya1XvuXE3cEoM7fYXin2bUrTJlMbaKqNehW9R5VDsvB4nbeK5t/s+LDe66wm9irBWGLN
	J5gLO0Y8R8rRczknmMeTg
X-Received: by 2002:a05:622a:1b29:b0:4ee:18dd:1a1a with SMTP id d75a77b69052e-4f4abccee92mr592914681cf.13.1767294184271;
        Thu, 01 Jan 2026 11:03:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbz8D62YVcxQdedAk3k/DyH+ejsCG9KzvNP6zqm8qsDsaBqLCPblpAAvfwL/lYPOD5YCY0jA==
X-Received: by 2002:a05:622a:1b29:b0:4ee:18dd:1a1a with SMTP id d75a77b69052e-4f4abccee92mr592914251cf.13.1767294183805;
        Thu, 01 Jan 2026 11:03:03 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f18575sm4226918866b.54.2026.01.01.11.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 11:03:03 -0800 (PST)
Date: Thu, 1 Jan 2026 21:03:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
Message-ID: <gq6twkddeshvonzuyl4jcp2bsy6wzsveed3figx4sxeatrr7qb@ulv3d7dust4j>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
X-Proofpoint-GUID: OloBD62KN6ZTPH0BNZitbK9z-N0FrFUz
X-Proofpoint-ORIG-GUID: OloBD62KN6ZTPH0BNZitbK9z-N0FrFUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfXxCHO8jcas6bp
 XR1Tfe8cQiTB+Ct6w7daa1B6qOQLLxW4Y+hHFvR9/Ml+vaH63e5GS6r0g5Cd+fJHEozA1J22vyf
 Lesdwgr6N3CvXlTRBZ7Dgn5qWNuj2q2cLjgj33K28YovudyKo826E5acatzBV/aGK2tt0E8hwbr
 kVlaD01k9QMjs6lZZpLx11mcErUFflJauNqficl49Dd1KFZyhOYMeTbf9AV61qGA7mhLYbDRDel
 PnY+CQVdIbI27t7+bezYo6mO1cUaM3ZHPJ7/Ttml4wjwNRJ0HcDGsTnw3/FnfGjfmY942Dh9ilu
 15OO6AivM4A0Ibq5RMYHr7IGxOC+4YkR+mUVC8DdRa+u/5rUtYHR6/mp72CX79xXSHFO0QnXE58
 r6w5+Zu03dHmreKYafzmFICM/X+Yy68RwQ3m8lnIJIY77KVlncK7MywfwwtvCp3/7pBKcZN0QBn
 J7QtJ4yuLmI22QXmo3g==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6956c4e8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=P1SvqDdPwG-YsO9EcX4A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-31 15:49:50, Pradeep P V K wrote:
> Add UFS host controller and PHY nodes for x1e80100 SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

