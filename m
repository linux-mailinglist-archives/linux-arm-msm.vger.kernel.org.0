Return-Path: <linux-arm-msm+bounces-56426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7192AA68A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 04:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61523BEED9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 02:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7752157C93;
	Fri,  2 May 2025 02:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKzJUoLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FEE134BD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746152225; cv=none; b=uMlDMrFa7NbIKX3O7S/rQvoFQprcjRF0RTCssjAXcWW+6hlNoU/ihz2vy6CSU3xNj3K0FFY/sJxJSOR43dI5cXlyz7YqLmbjNqZq6WP8hMu/HflX3nbuGIcZJ2+fWXYmb72YgkNY0umWDbrojwoVsrDWXZeXQnTky1inZ+JP0ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746152225; c=relaxed/simple;
	bh=GOkCqQSrFxmRvTw53doxoDpQBDGJECghNqwxhhNN9n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX+cLH+WIRcEpmHUNr2i6dPdo+yMlxhl2sCI5aavxRQYBjyTYhHivQTMpKQGhtQSM1ZfR5tBkmi9atdVR+SbK8PBntGBXCbu12+ogWahwXDU/55xXPuiNDPampBKaf5O9ds7L32h2OZOp99SY4k8egD9SZRs7dzpPTDzhv5un/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKzJUoLO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NYET017555
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 02:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5oT72X6mwQlfV9dF5Y+1Ez23
	5tgKiUG4lSyv0Z4ZvLU=; b=iKzJUoLOGoKZx0eIE8ElnX9iQMmIGKpUlXajOesM
	/DJ6MKxQy9oRMMGc1GyXekkrauh5LvdOuMDDPwsifUkv6aoZqfIHXqHOzeXJN4gk
	W02wtMToHj5VoMfpmC3RRgihtclFjjFMwsSvsTTc+iRxnEJcLWnDCstlyLAZsIUU
	eGKYHfRsXm6QxQnfnYPBdlG82iirCVWcjUqmNzxBmpvoQcBS3l5YLJ9SLZFW5wpo
	Qbzh9XvDx7Cu60mVrBqcuxQdAQdw92lQJITPASz8oLQAOHZRg9Je504DjKbdHHdv
	oQ5ODdalCGvFWJn4ui0rabmtUqZj1gWuAhl/D9BEyGCg+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3xxha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 02:17:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c544d2c34fso229159985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 19:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746152222; x=1746757022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oT72X6mwQlfV9dF5Y+1Ez235tgKiUG4lSyv0Z4ZvLU=;
        b=XrHb0uDGqsKABWOIibNZS40T8hm1/W85pjVuxZXvxAvCQdqHwL/xdufDl4O+BR+2YJ
         uJ4heQ5KvSbEqBdhnVe3UqZeegQLevYua+FF14iv4l/6aYuFJ3mg/AVdf1vFUfBwh1No
         j3xwa9t42DbNoj39nkMvspQg2D5Tua1aNYdFMhCVwfhVinvy4PtDhNd+1zvvETBsAGBk
         QNn+seTUA0ZMv+XhnRDYzgcl7g4h/m1LTwRlPg4oD+pW5f9eNBj4X8exwrlqPn1UWHib
         sKJtrfAVUo3UitCNpaY2N1qKfvW4ysQ6tnA64EZkSABEhCv58QrxL29oy64pGsViBwPY
         otDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbuyn1X9p6ubZkMwgpnygq/DhhZvGmTCnQIFurrmp3n1dNW4hK0LXCT2NF/OcakC2eVrSMQ/Of6laI1Gi@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmDyDdBuC8Qo9343C9xmxfjAEhdlEUJ05s33EvGmUOC0xqd4k
	VPYZtZg0UR71DdVK98biSenP7TLfZ2tJI8ojALTftHBKY4IUIEdobliVtNhtcvT8A6ZdMnkqZMY
	gZybEDsuwmAJLlMPffSAAWPV2YqiQiB6tlXa1S82NlJ6nc+wJfoVc7jNAgx4Jz5jn
X-Gm-Gg: ASbGncvVa2Vtk49j1ecmd5JIpjSS+xDuopTGwxz/n7JPeYmpccBUbRjeZIYOzggTPHs
	xaXUZJQU9WrT88XaIf/pJt4rOzzud+5K8Z8/PCY81VQj93+HPXMOEhoRi56cw1nUeCcPDWxfjO6
	PhgypupVZD5C16vdgu5Hb54T66+bTZS2wSrLAvOQjNf40wNUb74FaqmVVNFrREXfNryQTiyYVgw
	4HWUFRwfoCBVLiRvMGtW9I88+dI6j8pSajErNuypI+0uVyjLNFgKNZYsdkwGGSq1WOAmRcW0i3U
	H8ZE2Rcro4xLJUQVyv4qyqRGcWhY6WBZKBdk5U3wTjTS3SV2dpHehSPbK3p7IqGCjK4OI9P+bcc
	=
X-Received: by 2002:a05:620a:179f:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7cad5b383d2mr192391285a.22.1746152221673;
        Thu, 01 May 2025 19:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRQI9OZkpJjJTMAHtR36kzYsQGo/Ucv1FSwGGm5TGym9QFJ2XyQKGj5FI6uUZZkWFC5pMDtw==
X-Received: by 2002:a05:620a:179f:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7cad5b383d2mr192389985a.22.1746152221324;
        Thu, 01 May 2025 19:17:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89ef1csm2328001fa.66.2025.05.01.19.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 19:17:00 -0700 (PDT)
Date: Fri, 2 May 2025 05:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
Message-ID: <ovokvdc5vd7txnrcnljsibbvtyukp33ml6c4xk5w7kf2vd5g4d@2sw7r3xmvw3n>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502011539.739937-1-alexey.klimov@linaro.org>
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68142b1e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4kMaQRGzCb8m52ShnMwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Aztzg7gkmnRcIFZdwY9mkm6-AsQeE59A
X-Proofpoint-ORIG-GUID: Aztzg7gkmnRcIFZdwY9mkm6-AsQeE59A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxNSBTYWx0ZWRfXxa2b6bRjGJgk DDUmLZGCmgHmjg8iaGvxYHQx8COyKfJdrw5fJyfqsLs6XUZlGWV8nLENjbPgaCQUUBqPNcuLt9P bHs0pqv6O5fJOh0jH7A5YnO67MR3qXLquOI0jf+Yc8ivagHEz+9TtuUWcN7+QrpkdZbkuG4dWGW
 wIwBRkgycutPwupF7k1OTcRm2cvax6kxJgsu3PaRQ2bEl2T0IvJ8xrQoYDT+xwohs/v4xOFb2du S6QQ8tWtpQEO5RLQC8+/ufOmgts/XGMadHK0Trvm62ye9Ni+go66KDcC4m1OjpyPrI/f6mcoExZ UOjXJuqVxy/8OJ4vQAqeDG8JFfo+oNXs0xAsF8IdU0VEB5bVMXPseWso18r008uwonHPVXJ9rbL
 BL9bYRHcRglFxjKM/m+pKo/ZLHSYDdL8XBSJ5ABRTQ0qig0zSV+p2YpVzGBQL6ZIGk8YiQZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=696 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020015

On Fri, May 02, 2025 at 02:15:39AM +0100, Alexey Klimov wrote:
> While at this, also add required memory region for fastrpc.
> 
> Tested on sm8750-mtp device with adsprpdcd.
> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

