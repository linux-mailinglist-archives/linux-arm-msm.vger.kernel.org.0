Return-Path: <linux-arm-msm+bounces-86879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43209CE8204
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F26C30021E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8AC263F5D;
	Mon, 29 Dec 2025 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlAdv2ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtNdLZOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F492505B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039711; cv=none; b=WwPoIWKS7rew/TWIBna6GiMvujVxIxY4Ih8wgegbPxsQVd1y6kkLz3DeFpOpBwJWAA1BnK5tn+ijPrbYa7IP2UH7QM8EpfgFXzxDq3b967e+FdFpJfAggQ8A1p7La3xn3GYaQ9enHzn8zj1GSusylta8hDOLNVDZf1D/3/wdgOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039711; c=relaxed/simple;
	bh=fQyhbdxLu2Yr8h7IfuKXCAVZ8vKSkQIrn0uwbz9tiK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSjkUOx13KINxgrPlU9KKYRB+AkAtNocssvEFw+ZVzTNNj/sgdOMgUQFqFkkNOZ9SUqTrYWUVC6yfMDUYnoDRFM3CTJIi9VgMUOWILiTw/9fHzBMqkP+E6qKtFhXNIIz+D6CArhHvWclIwD7aVH4cxJh7VbuO/pmev4yN9V1Z5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlAdv2ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtNdLZOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTB914O1528321
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=KlAdv2ubMWttmbER
	zK1m+HlhknlB9IltkrkURme8qcJDFJ+ZfDlbtrT4bO63ZP5p0yx+Yt8/PEmB7e22
	ahTfq8OgZvlgXY/Fsb8iq2Hnn0nKA7XFrPAgv5htE3T0qjnlfrTng8IXvQR38wtG
	dyS4TuVPF7yWnkc9+GkWwkgFnvdzpeOMNt3YbmgDgTpzxZ6IDNNMTu7cVEt0ApYd
	RQLEh2PAj9p1gENTP3jl3g3yILavYaUsbAem52ycezS2xmen9DpZqC0OGQFJUvui
	8gdV093GMKBOXuEyX5EfYy6KfwRshLAHXVDpYwIjScRmISHmwSoBA6hGexuUMRA1
	OFlloA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj3sxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:21:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11ddcc9f85eso18264837c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039708; x=1767644508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=TtNdLZOYJIyCM3BRagsAIL65UZIsoge8QquqZm/AqvL2MGhhkIR+CYPxHn+y4F5jbD
         3rZwwQYu/xTXo10KjfjlkxyU/KE1FGwhCEdHRRniFMtP4QiGDMfVpVBtWdSKRrKD4mtZ
         BAN1itOqJgJ4UOBA5BhJIjI/LOKSv7FBorm6GIYfSsw5Tu+8272U3gfRRLDkJfTIix3E
         BKfH/JJDuPpkwT4/OFGwWzFgrMoc0oBjtY6yU1C2iuGlKc+wrFwE3mlNnzSqqnQvVdbp
         B0qoZIHVrdDAHaha2jIrdtfnobTJaEL/5ClCOCOi4ZnrfVXdOEGK92G2VDaNYESxaWQ3
         Vmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039708; x=1767644508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=VgALjkaljXPkkUQ2225hfr6qwIbtmoVzD75DTtjmXFW/P7yyRzlCce7OeAams40E4C
         zlxjgERjLSwBVyM71h6lldeFRfOStfNv25/lTa3DxBdC/KEV0xthSHPVO4944KUpJn+P
         RJODwr4lQZdXBAqsEFRDh/Gz0kmiQyLBjwVeiMXbTTfH0GDnIZLObNAxcek1O/EB7kyf
         rWEULnE97Vd6Du05JZcrptJi1xqd0pBpFp998GCjZeayO8peOMYpi0dcharhSVr/7izN
         mNKGxsx1b4a6t48hGNh8Rjag6A/GKqG5MfdrtSaMTDQaSdLH7W+p0xpMi3r1Qk6j3+cr
         tHHw==
X-Gm-Message-State: AOJu0Yw3kOcQoe/gCRVQHXozksPNAGov/gEHrkjFohjbE56t9URzbJQ6
	8kUxOZBVeyYyPKZ8IBCpZb7iJN/N3n15rEXB8bX+7gJxhXP7zuaeqKoNhTbqtcDJXJh2itkxaKv
	MrY6h5ZnjQDV6Ca14jN5uFk85ym9h/chEH/eSy+Qj8yfNk6oJE14PN6fuQrCIvLnCuz+z
X-Gm-Gg: AY/fxX4xm+tvvthK+gEZKf1HSGVnWhUfwAqjFIIKt8OYV4n9UOm/VahSje3Yz17CSM9
	vWnFU8n1lplTd/pcJblkDdZamFAIvFK2j7JwP5XD4wTTrVmhzIjgZ9BjoN2YKqMGqe91Wciqoo+
	Zyen2ggF6XrZxb0VB456gAWR227LdRisLK163MrSDiEp1X49YbYQOOsvCeWSHjGWBb8OY2xNpxg
	xGsveX+/BxeMra3D+rMY9RFg2l45nGSMDDvWAXuKvVBzh58GwSPZ0z40+cpwEGvPyPK4aHu3aB9
	tpigpew0vlILqYzBCqBW0eT+sYEABzjg8GQwXOuslrVjseWIT4nlU3CKVZ1JpF2cCzLrHT1T5aF
	QRRmaWiiV8e31c2BWzHFtYaJM3/PH6vATO/vt88wlefJhYVOB4XxQSvCVxDyqL7o=
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221582c88.12.1767039708188;
        Mon, 29 Dec 2025 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETQHo90sIZ9Ah2oFCPURRgJ6JOFVSXKLGKjyL2O2wo5JOl3Bs3GTMtBAiIr30Ft0lRKlNsqA==
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221563c88.12.1767039707617;
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm120318362c88.5.2025.12.29.12.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Message-ID: <9e6d2c54-6c63-4cb9-933b-3647c25fe72d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:21:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hLeAelK4IlynYAgHrU-w1BcqFx2sH4xc
X-Proofpoint-GUID: hLeAelK4IlynYAgHrU-w1BcqFx2sH4xc
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=6952e2dd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gPICEALkPRU_h5exja4A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NiBTYWx0ZWRfX/8fny2sva92N
 ZTBVomI3qQwS7R8BAzHzDMWaaU3eOPuZCwwVtYMCUwuK1FgUgcyWJTkA+ka/lAOpqDA2esuvXXO
 8v06N4nJoUy6UeZ/eTX34NGpHCQEN8jZ0E0uUf+DHsoHtYP5j3oUUbQrRo++obIDc4w3Q5eBEPB
 6+mz5dKU3spB7bwrSf3uG3X2d4CnlUCUu0X5TA2FaBIdo5GFwhgD4T3MbD2qPpUgrM7NfE36rwT
 H0Hdh4PXRFRIUJjVwB/mQzucoaVz4olr14k+ZXrDikrtR8cnXuJ5hDl6ydi4ZrB/djRxcxvFGfr
 IVj7PpHv3GCWPHN8IXWexSI1CwC0xOdY6yjq1mmrv5Gb7iyz59xfdfAz/6DT3Y5TCWlF5w5k0Qt
 ZCHaZVue/HW6u0w0Q8/E1LYnbq/h2aDR6oBZXXsD2z/LDDvA0g93uCoJpgVZm3Q4DirFVhlvXrX
 F4oLZgGQAirRzQBUNPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290186

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

