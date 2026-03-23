Return-Path: <linux-arm-msm+bounces-99183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO/GER8SwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:12:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B519F2EFC95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 840B630A02F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA45389472;
	Mon, 23 Mar 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQWrlwYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnGhM41s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028D388E7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260387; cv=none; b=kwg/aXNF90rtsnP7SRljKD2ewzgFtoCPxQKAmrqySy1sZhSh7OJTf1DzvCvYfOy8dHsJqqUA1qcKVBJc+TQuCy6Ua/ojHag75KO0OqSjDId0vXx0oUH8aE7Kd45qlbBYjER5MvGUpRRmgavXCgbYkwhgcRbp1nbELmuvhjDgMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260387; c=relaxed/simple;
	bh=D7uNzZwuRI/Naa00qtBEM/2GbCAII4LHke1I9waZY68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMona16x9YTTgEAp6oowiOTJ2GN8nvlomy9i0d+SRdq0Oq/yrL7WZZVaDxCxsyITDOyAGxLkhPmVYWt7FqlpPWAc201bQ3W7NshF+CJss+Lrc7waoVHEv43JAASOHDXChHCA4Mu3nKFuhZ87iAHJlMhv33iQC5ETIM5X71n9Z2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQWrlwYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnGhM41s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7aYLw2062748
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=; b=hQWrlwYPVoRbFM+p
	LCxNxKKJxrR4mfK4Q2REdZfr/kEWXqyLZDVCjb+NWEjoylslCVtOLfbjOzAw7C4t
	9gIs14C3rMpx4e/VtFHKHKSr9AtPfi9IkoOgxjvMjJjaQvsmpVqvHe7HJF6Uif91
	/4soIxrETpmLrSbh8CMciDKOpqV/a9Ptowtyy/hhJCFrmKeHybwX2byPBZ5CwE4n
	+TzFc/5NoeR01Xzo52EUfPJ8dzjuZQHo7CvgWI5LeTTtabdY2Koa5O+DVRFafqRP
	LpTBG+sRHBWvI8m1sJF3cwJNxADRk40v01MKbzcyXZY5Av7g+XvKRmIvhgw0gmt9
	FdKIsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kductsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:06:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso40476231cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260385; x=1774865185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=;
        b=bnGhM41sP/gWTp/AUUR6y/CnBd4sGWGt+6uNWKeKUtgrcyZgRBhuOkYpZQBScp4PDz
         nwaD57SMqogcR+O44QQAnM3mcccn4AYZFuSq/Yqmh5ypnHofDtDP2frQz3xfkTJYO+V1
         DOVhAgpm0Eh2trIvf9Hy474vgV1pOrb/otC5Y4Awg4BRE9B0yI6cJu2zVK6USrJ2qnN+
         VFC7HBjPFxWCdHG2rGWqltmdKGrCJJQdnHOXQNH1r9X73NfqRtnaZJn0PhH87ZMb64Kv
         OT6z9h8jyBhtCjtzFJkjKYnmnBEP1XJqZd1tKuT+fOG1/Q/VcKoL+kQkljSNf9+GvTJ6
         Th+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260385; x=1774865185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=;
        b=s5NVnQLSmi00F430IH5d46pxiwxEy+QHyU0ktmcdyF4qV8KUeujg9KdxRTvzDCT7Sv
         dx0JGdUA+CaLgjxdtKTk4Lw8UPO24ceTcf0x2HP/1Ji7Df7BBewPV0VOlwF/iWz4f/xy
         x1mVz+ejsa0Yg52jVvSF1ZQRGCUky48t27y8J4NEXLrjEzrvPUvHbSE0VSaRs3ShYQhQ
         /EIIDYkJiY8kqOvHhHZLaZI357DXqwMEZ9/JIPk1hg52sKPG7PDQnlxzK8jj43EZbu/G
         WbyK8B+ViN3OnajpPqwEfOVWWcytOr0eFQrUmH379QGj+AgSC7UrjNWsdCBPrCBWO3bo
         CPng==
X-Gm-Message-State: AOJu0Yw1X7yZo0hlCFattOCpoxnRD1TPkRuENXfyb3NfMARL+4KCYhDQ
	Ta21ywIQhC0+xqsmONpxjdzLDLafEOchaP4Kv7+MaGcLNxABBnvv9NXAtJ635xgt4QzAzmK9PIw
	Zlp2Q0j4m8RbBxBDTiThSgjIHuygMfv38FHJR7X84Iqa1kRsXUhTLrvMQe5Y7D+yhzWuW
X-Gm-Gg: ATEYQzw6yQzz/Mkgk2O4pxr/WMHLlHNSmerb7/ZvtPht1NnEj2LdghC+UDFmSijo93K
	Xi4sFGdUYViI13S3gUNq+Ez4W36gyzvOMdvUMrn971mcr1vFjRbsL/iPbBXYF2q8umU6HL7pcl1
	uhxe+6JIbNU35AHgBpfcn0/Uj5HjQQNOL/tMT3JaPRo+IEYc2YAFCBkHMCKWxkFSgfGnkPNm07d
	Mzg3+QdSgWF/Xm0kwWK99LasD2z6Hcse14tWbN4zlApg1+4iWtL7/HsXkD5wmzX6NrYSxMe2a9r
	PYQsTRyb7Uz/B1fW6hnNoSaRH8afnqAnUVBaNRviPSPykqAP1pY1P5aEijH+twFbjFUSbWtKjGJ
	fMLaC5Ip4/UMMqrbNAZ9+73ltkfrikNADlXPlbOidRwD33QT+qy8QhA3ne55AIChpw9QIKBu2UM
	fPVEw=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b6b213568mr1668681cf.2.1774260385035;
        Mon, 23 Mar 2026 03:06:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b6b213568mr1668351cf.2.1774260384633;
        Mon, 23 Mar 2026 03:06:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2677970sm3533532a12.27.2026.03.23.03.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:06:23 -0700 (PDT)
Message-ID: <74679a77-55b1-41a4-8e7b-297472b6db8e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:06:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OCBTYWx0ZWRfXx6BpWxQ15r1D
 Dyp83Z1ryLiLzlLi3HGyXM9nFQ6OFR23UCCaH24kt6iQduxv6s9IokLR2Q/0IfvR9omARPTG49E
 drdsIH3eRsAd1YGfhtW2YeT6v7tH6YIQz35rS9IWr1/FaqXD6qw+HFOl2IhyfUpDhlFJmX79/vn
 qTNZK0zK+vWx4+POj6ginMqMksY2kzZ2vbpyMmCMNIRZX/nVaWG6YkXQdgOjymnxbWlpUe7a41X
 z9KIvhMTT9QCOYZTFUdWeO+8gsOqSUBF0Ykf2q6tdn2sSSvcc4jKXcLLZiSyqwVPxIea9XM5kBd
 O0YI3L5MttUJ4O4VKI7D/SkZ/2GSOAEFDlCz0YzMCMbqWGjZRg/Q+Fcf8l7dRBv6C0/9hVNrojG
 S6889ozVfKZi81TJBxb3RaZXF2iO5WuEP+L34G6WW43rn407IDSip+oWKvT9jgA7/wFRN8aZSfb
 A2xnZjKuSJe1Vovh9Hg==
X-Proofpoint-ORIG-GUID: GtZ7lF62-GoUECWOxKXai4pyehhqEO-w
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c110a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lVCZqg8DjZk64FRXgSgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GtZ7lF62-GoUECWOxKXai4pyehhqEO-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230078
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-99183-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B519F2EFC95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 1:27 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

