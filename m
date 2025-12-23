Return-Path: <linux-arm-msm+bounces-86427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DECDA9BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 717EA301E196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B29C35CBCE;
	Tue, 23 Dec 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MX2lOfJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XU0+T1mU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B4A35CBB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521432; cv=none; b=ZledJy/yuG6yPtcm3k2BHNzb/Uku5ENqUYDdFCAoSdCSG/oOohD8FS9EDOLUWAKcAW+gFi9qofl+VgyTkHG1dB5ueew/leYMJTcJOGU9tKAgrTgFl5UKi/wupGwhtqxDnpKwLmVHZUyBQG1u4Li34E4pE4gN1OxgoeWTGD5sqvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521432; c=relaxed/simple;
	bh=5k3GqnBIUwRcAN/L9U6np3mM0yc3ZSwLA/BgASPcNqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJTrKkEIz9YfxiYDoUIUKo3Dyqa3qtcAUEPW3cbqjOVwQWQYhrsyD5K8av/BprNqlDEYqrtYyPXDYrg2I3Q4xHK3qsnvsFeVDOdFIBcl1P5t9oe9zLKH9E7MsttOBY196EOXw527TiICW3LTDw63C+c3XnmjSHX0N8D7a34sl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MX2lOfJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XU0+T1mU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCQdkS1901934
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QrGzx61qhM/UDOs3f4wXgOC
	4EBQT4yao065xPxQiMM=; b=MX2lOfJhCjyBpnLM0i1M/d1eJdz4KcyI2/HM/mYG
	PmPqm88d99PkXYw+FR5BYiJ1g1yFJM5ZyLzLoii6sqaKEwQIwlhNENMv+BTnH6Eo
	TcewCh2AI1edNLNrlHVWUt3JH4sxuuYlpyotz0qTZSeuGQhmhLYz+nYNwwSaKmqu
	e+9Xo9zE7M3vfOvVqQMSJy9YK44nOh7OoGRXeixnEJK6+SDBTukyzmfYZV8RdbqC
	keoLQLq52/EfslSSgs42+2kXCj0jbpVPyOkV2Vq5XtH2PnFmnHnEbcaUTIcc/t9P
	rMEDLjswxofNPLKWn7k5hQXDz/XQpM83RuaZIBIunKGHtQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8mcq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:23:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dd885ee568so8494130137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766521428; x=1767126228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QrGzx61qhM/UDOs3f4wXgOC4EBQT4yao065xPxQiMM=;
        b=XU0+T1mUZLH2iItF9EO48GTHtDRcCpi71E1HCEMb4SFBoEaX3UnQGBhtDQCUZqMXYj
         3lSx0pe5CEFaiQ+W64hUhkWmkJEIKqPdtLrXppgG5azbE6XHD/ntsHHErIJ0IEGfhyqB
         feo2Hv9v1Gyk+cQAyIcT4prPKTWO19vF7SEwLGazxOBc9+FA6UlifS/hp8pxtM/P7xXp
         Nm/6MClV4Up/pnIqoXh3D50DUPV+JQNY1ChQCQ2g2Q4Tr5CT+8WbiSAbdCw0fN9tWzfc
         fy7EmzZBPR6BDkZr53zrLbFefoIoxe1QXObprYrCJuSa9ITL1pO+HlocWn39vpoHKVOO
         ud9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521428; x=1767126228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QrGzx61qhM/UDOs3f4wXgOC4EBQT4yao065xPxQiMM=;
        b=rwAbdYp51YdNwo+t3J61X1ookPgbBFOmLBfwayJFNR1BsJE73zd17XiJrXHOl6XVt+
         IWV0sQ9s+0GnP3YTkJCO9QPctcJvZIH3qBVa9utHf/tKV4v9d09Nc8UUdv8SpiJ0NOrT
         7kVYaPUMYcSk5EE3ksMDd09SeIi7PTqi3QqLQtewKznryHPcpwMyGpOF8QWxYLq9ThC7
         zjW6M51rA9h0cOex1YxNOEAVelVSWu/jlk4vGRPitjJdaBLFZlkG3+i9JEtL+0uDFGa5
         CsK6DkqWGQtCWK6gWsAysXecp7I1Jj9PbhyOYOYe2dQkfeAO6pDlbXOxRG3PdfEascSi
         Nb+w==
X-Forwarded-Encrypted: i=1; AJvYcCUvQHSaUIMWXf964+zlJH5gnpgTmiN4agRrVlGtMQLokwSx2YzZ0Md3ZhD3PYa84KKVKYZaa9FsABXW0xFN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0LpOGhXQOi3VQStlGFLFKvakaqvVzUWl3oEYV3DgmeSVsvxm
	P1g8RMe8PYiUuAnMFrInh5jT0PcZ+smCIoTZaWbHKUM2NW8fxyn2viiqs9yxj42rkwiUk/oHahU
	RySNIU5G7rxo6x53TBdveSJv/5r7qoBtC/lE7oX6sR0Rdrk8F3Gi2BBgYiGlfgu8WnZ+k
X-Gm-Gg: AY/fxX4wdyJ6urgt00uo8jY8wByHY0HuExLlbtlOQjbiyBdOzair104ItfQoumbF4ZD
	zhY6aafSDiUrlNegawZmAJuBT7KTEhDeRNySS5KdVVoNYFz6zNO/52A9lHNkjiRCtaZptRYDFo2
	bgK5UpSSn2SEfB+vcy8FTUXxutuR+HR1rC3vlZCLTK0nP+wAvWEbGQ3PGQHGJMykzg1PO3dswKP
	w3M/ljDYUMNxlQvJNBvbQSCCjO9jnf66bhaDRC3Ywhski/Ge4Lywy3WL7g6a83wtMOS9oJLgZwm
	MMGtZxkSvQ3/2V9209n7YFR3JV20tee7sA7PzO6pJWHHIxu+cBPtORja8/t0IkEWi5jJTAyi28u
	76YJ4Al7soyEqFRbTVe5x9l4EWdszXq6lR4FDFVKW+LHbrQuXuDkRdSyVLBuqgPHHDPe/4KxcRO
	xXbHQv386D4TWllfNvpgmuymg=
X-Received: by 2002:a67:e104:0:b0:5eb:56b4:529b with SMTP id ada2fe7eead31-5eb56b45557mr2574233137.26.1766521427780;
        Tue, 23 Dec 2025 12:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5N1al9pvDWsasVilJZaQZJ6zEB1fhlD0vue+d+GO8ZcLsbjBpz59es5DMO/amtZE1Zq2PzQ==
X-Received: by 2002:a67:e104:0:b0:5eb:56b4:529b with SMTP id ada2fe7eead31-5eb56b45557mr2574222137.26.1766521427357;
        Tue, 23 Dec 2025 12:23:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267964fsm37419901fa.42.2025.12.23.12.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:23:46 -0800 (PST)
Date: Tue, 23 Dec 2025 22:23:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco: add QCrypto node
Message-ID: <ggcuy52ishtss4xcghigxlrkgjoc2ssojdm7xx5chkmdpnp6f4@6guglelys4u4>
References: <20251223-enable-qualcomm-crypto-engine-for-monaco-v2-1-6274c1f6136f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-enable-qualcomm-crypto-engine-for-monaco-v2-1-6274c1f6136f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE3MCBTYWx0ZWRfX4nalU/N0qhQ7
 2uFCxo3mYDeT2O0zbS5D/fVYaUSBrSYLNeflLcSEMzVLo0dVT+59xXwXhBt5PV95I+uKSXckyk0
 4HZwOdT6bd6gnxPQTeuATcvv+QSs1E2/R6d92qfWsSZGkynE+wBGtW6j9T9NgcgIxgh7oWu7mXc
 grsfa1mxDhzv+VhVyuxvkhRFr5M3m8O8Ve0KZnQaCd3tYUR3HhFWKoGnVbMeudVmaUwjsiTPZqO
 FY2p4QtCdvJ3DDeZjt+VAvA/BWqnjh/WWv/nOc16ZXYNCUU8IMXqpZeHAe3FBtR5XPXSs+kBEkJ
 BRzo2nnaSNacuCgZcCyTX2k4wDIF8I7UPog89bYVPeMLcRd9b2RzOQtGm3PJwtByA0aOd3PaVqi
 7+hrFGL0fm4AmAaOgC1WIa5AadVnWVf9icA45cmCMPva3rHinTvn8Y+GIIwy94VrQZm+HxbK7xL
 T216wg8emmBjVtN6RdQ==
X-Proofpoint-GUID: mRlB_x_hptBONnxXxBNmzHaBVzJSrH65
X-Proofpoint-ORIG-GUID: mRlB_x_hptBONnxXxBNmzHaBVzJSrH65
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694afa54 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vwCS_d1Up4WPIWwfMTMA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230170

On Tue, Dec 23, 2025 at 12:25:18PM +0530, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for Monaco platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> QCE and Crypto DMA nodes patch was applied as part of the
> commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> however was partially reverted by commit cdc117c40537 ("arm64: dts:
> qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add
> QCrypto nodes"") due to compatible string being miss-matched
> against schema.

^^ This looks like something that should be a part of the commit message.

> 
> Resubmitting the enablement of QCE device node for monaco platform
> with compatible-string being aligned with qcom-qce schema.
> 
> Bindings and Crypto DMA nodes for the same platform is already
> present in the tree.
> ---
> Changes in v2:
> - Move the description and history for the patch in cover-letter as suggested in patchset v1.
> - Use 0x0 inplace of 0x00 for iommus SMR mask field as suggested in patchset v1.
> - Link to v1: https://lore.kernel.org/r/20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

