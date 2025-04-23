Return-Path: <linux-arm-msm+bounces-55121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E40A98899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40CB77AA545
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DE426F465;
	Wed, 23 Apr 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwRh8Og5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9A262FDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407786; cv=none; b=jDbYBI/S5uAeWHDT2X4LWnk0sCKIa5326gBaN/iBU4DLZ8qXiMfOaBrRx/O47OHBY7kIOowsl0KlBKZozn6myqt2t+3l+PXEA+58CiktAFJLBClAMyTOLv/cpPFI7Hq5PaUuGM9vOAge9yAhKhUZJWHwQse5vok9S5cRQTndBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407786; c=relaxed/simple;
	bh=JTT75Mn1aCr++Zw+4/sd68fJWxFJ+nXgtTCekw8+jOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVvcvS154EC5ib4U5Z3oXkGgHZO7e0v67rQ1ckICWjc2wemLydbWZHE82SpycwO4RGFInmKxWXQdSyf2xqgIVGWmdsjeHX4grIdjwIpCmhpaWYmSiroMN+A593ZlwHGCkaZ+IOsAbBSQAdFj9F6WGViMH8UuufdJh3iIo3H3fo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwRh8Og5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApPiI020408
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiLYMeII1DzKYJXChQAXWDo4SsnOHw7fzuxji7XmLYs=; b=mwRh8Og5wI59bfsL
	gzcq8bksEhmk+alL70SE5tmEiJhgWm7v3YoUgydWlPoy9QAdCYsgkNOyGJtbXtv/
	Bg5QhlVnctg/enbmUjwnHTC4cksMLN/VapnjkbNxEJpxn/xLYAtT9oBDXOfa/c/M
	rb4CBs96lm1bd6OhuVU3oV0E/HHaEcyQeLApr1o+z5kg9tbcw2PLUbhaOc1zCA3a
	NWRlTw3JoQAuSYjJf+Pk3PD96mtt8NsP08IOsOUgp3GyOnvC7O1QBJslOhpB7Vq/
	znAYxLHsTLMXGr1NzCuKPtesTkkG2HU4EWkUxHdBqTgucees4a/htP/It0+i3UN4
	o7vDRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh21y2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:29:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so26044236d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 04:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407782; x=1746012582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiLYMeII1DzKYJXChQAXWDo4SsnOHw7fzuxji7XmLYs=;
        b=QAkSAZDwAybH7YQCkdGFcCU+l4jZdA/wLKjqT1A8iVe0LUvbp4khWyT4ZkTDsmc40v
         vlF4ejvGVyXOg+lTIzjYuSsOX9gFPNxlk2dFT2+lb4BCEtOYlmWlt1b6d3xq8zX69CSb
         4L7bQIHeTh/adwc8RRaaG79D+cZVqJY12cJI0ApfOWbxQTbtgWWjGpgsp4u3Gto4tJ+b
         XsEvTKR1Wn3EK6XiwCHP0ie3lkVyGw8KuNOsiZmdcQsFUgpwJol23Tmvod181/JQfvJB
         0G+ANi4K0GbcMuN1mMXPb6XoXacjr41H1cHDKfLNiJDvN7jPORUT9pCVcekgpd5Y50sb
         Ajbg==
X-Forwarded-Encrypted: i=1; AJvYcCU83NObDqjs7zO9STPJ3MozNWTsgBPK81bhus+6Lon5gzOOzfoL4EAgaQoydt2scrBzONFVa/TY1mRM6Xpk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rKptd4OQzyXD6Nrz4xQes/a58Wj7oIaspnMJWy/6rkNbDxnT
	G15DLC77HCpOLsCmTtB61rfmBUa8yBM6QAFaRWo/nXGBk8DS29jdRs9Pk2DZ9kIuACptDu5aFiK
	bWdL5cwVM8wDpWcWS+LjLDAcaua6IcYWVTvmycM6kS/626LNyyHTSiqA+xEN2kNeWuq4aOPM/
X-Gm-Gg: ASbGncu3j3fuWTsRMSHzLw1ytNxBhFl3M5rOWRlr/bDT2DFUTiPiD3TfUv4UqQlA5Aw
	Z6EpYPhun4Eyk97LQ5r+wCTRZd6B5mH+z15YAkOLUWc2djMQU5jvdFKfODIn1sCWzlSdb0V59vm
	J/Q9B2cdYvqznzSsxitErMew4X66nJ/5nSH2zAXiOvbvzCg5vvTbXYJ1BwZ7dLZWATX0cALKz3Z
	JaAFLYWuLq4/T4UrcAEeOZsL4rV/VoMZ5ImLkWj7G9h0LpOR3KfhbRHf1+XnO1xOyQXXlicBRmK
	2UQ8Ia1AZ64/PCTguwz3YXwrNSZsAtv2tR6ZPuJNEJPRrKl6grfnlT84l9Lj0DYgwVQ=
X-Received: by 2002:a05:620a:4543:b0:7c9:2465:8731 with SMTP id af79cd13be357-7c94d123bd5mr169984585a.0.1745407782426;
        Wed, 23 Apr 2025 04:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgFbGmUp8j9I7o53Gg0IqLCwRf3sb8p8Am2LmvgQJTpn9FJCrHSFbcU5fZ7b4kD9OfN5zyGA==
X-Received: by 2002:a05:620a:4543:b0:7c9:2465:8731 with SMTP id af79cd13be357-7c94d123bd5mr169982485a.0.1745407782052;
        Wed, 23 Apr 2025 04:29:42 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm802900666b.148.2025.04.23.04.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:29:41 -0700 (PDT)
Message-ID: <052fe049-a17f-4fa7-80f3-a198de21b3c1@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 13:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 6/9] phy: qcom-qmp-ufs: Refactor qmp_ufs_exit callback.
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-7-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410090102.20781-7-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6808cf27 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0G_SUc_-HujNE8ZPJPcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LlJeHOG8FdXxsC6BrsRelLSL25gDdbdy
X-Proofpoint-ORIG-GUID: LlJeHOG8FdXxsC6BrsRelLSL25gDdbdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OSBTYWx0ZWRfXzqaQvHcPyCS0 RJEEU1E9m+d31vMljidqay6yRYPUEaGLpmeIsQFfoU9s8kKSKNZGF/IoEgSyC2o6LZsKpIWrIPD t2TMpCcHQupevalz6T1SerULAcp09E+kUkOv9jeikb3SImnpZSVcjWOtbVmnskr1X+2g6I63S+w
 7wNN+yCIl/Y5/uW1W0MI6joQmQaleCI7EMyk2n0F7NqNvEjyoUFM06xlPHtE3xOo1NwJTLRsApn SEpcdEdC/F8OOSvb2U8LmgZhIA08LQGLi11mwljNytjH8O2upKZ3L+EWZJ+sU00hXo8ZPPA2pnI 75K9oprEzogRBPiLQwmzRRUEIS5cnG/OnR6NBXSyDVUbnNw8rxO93AsO9XA14COkxRxfkKLbC1f
 Dnl5MPMzl+WxhkBmmHw/ybXU6ENfpW74m7BhVWzxRAOnbvIh0spM7ue6pXtstAFWCw+Y12Ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230079

On 4/10/25 11:00 AM, Nitin Rawat wrote:
> Rename qmp_ufs_disable to qmp_ufs_power_off and refactor
> the code to move all the power off sequence to qmp_ufs_power_off.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---

So this patch does quite a lot without explaining the context
that isn't visible in just the diff below

- .power_on is altered to no longer reset the PHY (but it only did so
   on docs with !no_pcs_sw_reset?)
- partially inlines com_exit (dropping the reset assert)
- removes .disable in favor of .power_off that we can't tell
  what it does just by looking at this patch in the middle of the
  series

Please improve the commit message and consider splitting this change
in two

Konrad

