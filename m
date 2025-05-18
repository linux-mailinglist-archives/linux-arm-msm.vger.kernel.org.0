Return-Path: <linux-arm-msm+bounces-58333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F025ABAFA6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15F23A65DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80358218838;
	Sun, 18 May 2025 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8BEu6iV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18F2153ED
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565940; cv=none; b=S7HhGqkzSf17Tcmbo/w8fnVYmQTkmPpANqeSwB9QAMpqp0LoQPySqrLmEWWJFtiSRtfAQfgS9psy8qpyzrOHl83oDKb7y7B5GKqkpy7iW87UGPpHSmJnfXKy2ujYhHbtTEE8BtA5XiDKs08V4+rIpTA9VvesWe+4UHc+bmg9GLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565940; c=relaxed/simple;
	bh=FykTRlIxjDzbglnpssmAFHjJQauPRAVN3qrxkXgnlZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNAIY0YxVKtVjBVd8W9O6ehy9e/D47Qvs7Vf9Z+d/NsvyZwqbIMkSvpMKiM4a3N9QG6rQDP+ffVO+3huIcGjl6LOZwxkx1Vz7WxXZK252E4JHMEBvqa44YLwDocMjWutDop606mc0YLtxdRDahQc9VNd/NikjT2OIqaQWFdr8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8BEu6iV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8noNN009984
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sIwfs8CMcFkznEmjw0gnSJXf
	PCqhbqfunZv4/U6dRig=; b=Q8BEu6iVn2cGTupwDcG6brPB9thcfs80X4yy55ga
	XvbZYy9LpBdZdqQ6rosTBA/EGH2VVaJeAOQgWUxhBiKzV519AFY/dmR+b/dcHh4O
	eyRrGoRMCIJ/eZq7gLvZMyfedrmRkf7aafCmq3wVD3Xw3FoPIeRLrx3oAk/wETee
	dg8f9qNT39SB33Kt4X6l9qOYparNpTOW4kNZWM3yyaafOTxITkTJ1wCjaX1PFUvh
	G5BdV1C4LxmPun4ZluIPsGsxmdJ0AGfiJEFgsVIiizMTSDu8tacysqGcqV+RDO89
	3r/QNkpYa0ES3tOB/Lr14wGIZh1wjZADHhObj/Hl1nPRsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4svp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:58:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so64736236d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565937; x=1748170737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIwfs8CMcFkznEmjw0gnSJXfPCqhbqfunZv4/U6dRig=;
        b=FFM47ULdV/uA4jFKxPp+Y9u4+ZJEKqlwSOcb8fiffJxImVzxNF9sAwPf6tOtDG7m2x
         XoSbrtAdMRmfYQE1UCVEPQYp4EC9X+okM5qPGUZuZBdx7AXa3Hp4X301icqg4ssYnLRW
         xXvXstehWl7Gu85SRVWVo0avlf7Ausqs5mdL7hPlsV/dvZya/Tb4p2UUsjWQeCLJdTV9
         akkofvPiFukXfn2LsYGhv+NoTBycteddO7n0w6TXHWW5120DdCc1IUmTXocEI0jnuDnH
         OB9u9AgDc7RLd3LYCwvUHl5Tt34vsaYF4iOCj/a/eC4nDVGLsp8S2hyYWjXgbbKmEGyL
         d55Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYMknxeeIQtlANJlkNb5By2fJpiHHSekkpXTCzCjeJ7qT27zlctKLwO/1Nrlkr0MMobxjylzmqKgz4GJ/l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29rLgSmH/W0f0gujXlW/GCTHenOqF8EXdr07ISshpOzkrrjQl
	V2qMIFkekija0CUQKM+3CK19m7TQo3PLC/TEMM0JWkncZhW79YmQs+UxfY0sIz4QvyU4/9jkb7y
	+jWoEPxC0idA9naWjb84F8uIMfaMiPw6NFUCJIpJBQsXS7fxzoPgat1YtXI+SYOoMK2aP
X-Gm-Gg: ASbGncuXcLxBrYIPSE1zcSgz2x+ejqTlDBePx9KLL3k8ZgAUEkToFOyP/xr2d6xhcBs
	M6Oj4LOM+UTpz3Ul3f0Z0xxes+j30+sJuJA2hUhABltCqnGcEoTQU5FOOY0qoXtr1DsODnlLVsx
	3rM008zb2ttTTtmyCm9VvjXo/TQf/rIWpkgXPCnlNev9AtHQ1Adyp3vBpdvxF7W9YDeQBlKyaan
	qdpzvRje50RdGYH9EyojqxYN/xM93YmMsyantirijB1ilMV9YM/VBSEAYpkv2/ak1ypjZ1iLY1P
	YX39rCL8SpSFpkHMyqhq8zeswY8hvxDEKDILkSn+fOpg//yrtFiWH/4OpN0Ik3lyGjMhGJAF/V4
	=
X-Received: by 2002:a05:6214:c68:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f8b0810501mr139946846d6.6.1747565937137;
        Sun, 18 May 2025 03:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTF8erBXQAPJwJvLXtjQ40MAlLov7TqbJChJB3wusJADd96rIcUm1Jn0qAxKbMMsnIoK4OVA==
X-Received: by 2002:a05:6214:c68:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f8b0810501mr139946686d6.6.1747565936769;
        Sun, 18 May 2025 03:58:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cff9sm1407220e87.180.2025.05.18.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:58:55 -0700 (PDT)
Date: Sun, 18 May 2025 13:58:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc8280xp-crd: Enable SLPI
Message-ID: <ovohvtb46f56vuwbbeiet7nzoi25nh6c7foz43m3dh4vvcx5ie@zyoxf526jzzo>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <20250517-topic-8280_slpi-v2-5-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-5-1f96f86ac3ae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829bd72 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Da-7SC1wzDm6D55RPVwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: XBkg6pBC61HjdvR7vK7wLeC_6ltoTczQ
X-Proofpoint-GUID: XBkg6pBC61HjdvR7vK7wLeC_6ltoTczQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX18UzWwCSWCnJ
 pI6ZBGVoeC+aLIfyN6l1dnzwaSOwefvW3fKIrrhCp62jw5woqnojzKFmA8ePwdpAqFjyLTPpU7L
 rK6CTw/c+jjRoqpGz3KC9JE3hTp5dmCZpZmViiNYKAzNQ6GK43+6hmWWOBXaJflkTgMDdsp0vtN
 km8peJ7r3ZBSXsyLmobZiSa7v1wgdDLH8mKHd3myeLCKgRsdy3ElpPW/e4BC7+pT7vjmG7StrCe
 YfFmZzogDHAgfp3EKIEuHwqy90H7WhigqvRrPvGOB61a0RkrmJUl/Ez7uszA9QhfHSXZBE32LJp
 /xJSM/drGftDN1waAipeS9ncJZqVnjulnK4QbiF8Rz6wjM4Iee369oyI0MDsKSM7r5MNdIWLlY+
 8ULc78vU3o2AwLgQHq8vxbhyBWHsY2ax5lcK5elcRkvtWVpDoTrE54l3yn684qeVJSM4Q2dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=662 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

On Sat, May 17, 2025 at 07:27:54PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the SLPI remoteproc and declare the firmware path.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

