Return-Path: <linux-arm-msm+bounces-88265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7078D08E0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEC27300E451
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40009322B77;
	Fri,  9 Jan 2026 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdSQBMli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBX1A5OT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AD9309F0B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958028; cv=none; b=jvOwCq9TLHfRQCSGz/uhfeJwzY14o6SWAFF6By3ASZnS1DzQQn8+ITh0p+yJejKVboV77HwB+P0aTS1nHZmMEGimFIXqZJ/XNin3pyeiexTxOFNdi0d9L4S/w0nYuEwO8oKfQ/fFboD3N0lHS4i8WXbRM8+q88hBXpTDwgAUlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958028; c=relaxed/simple;
	bh=w5RqVneUkEEMGjz+NhjqFRnHc+oGWCRs9Vg8P343Dl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHNjh/6AsWsyuDSwwyulPA+0H6lp6YbpqKjaZbNI9AFqiQtmEHC40gMYWQ6eEa1Yx4Q/1bfc4lJ/eLtEKMGhALx1vhEcxwuT/kmccVlhagx+36gAjZO/h4oi+v0IJORp2PU3SmMles/E0/QCbrpf+PHtsrlB59GONwKgc7kyN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdSQBMli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBX1A5OT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jCDG007844
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 11:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+ZR4dnvbJ+y6yDGs9SuvRFM7nDX8K8jRqdd+yeqBQA=; b=HdSQBMliFfXzEhWK
	DrKYLft5Kx49kkyc3vdphhibYVKgBOTjXXsgOeOPRYZttSCs4ztXH63EzM7YnmuT
	oBxed6Q39XU8TXmzjoZ4SMDFMzfDEAssEoBPk0xfy5JfRU0wRj0ApwGnrsBU6tA3
	Ww1cKyCbOQjWHolakMZcvxTVqFd9JaMNJqA8Kx6DUt/ORjOu/yTgBVK/a+M591do
	QEByIte9zV6Fy7btrXePR7O3FsoigSYLaly/gzF/wJcjoKlSw4WPpSu1OtE7FeOo
	7ipFIUT8cT5926eVt3OLtZNtroLFAKqxfY8xwo4YTj0bKJn+ock8W1zx8oACHqTA
	uLKuSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqg980-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:27:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f77be4f283so6546911cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767958021; x=1768562821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+ZR4dnvbJ+y6yDGs9SuvRFM7nDX8K8jRqdd+yeqBQA=;
        b=gBX1A5OTKthewz/m7+Jh5pQSCTjdyM1lJyZivOvgera/nRmB7d28D6lOBJ4gU/DKSc
         sqvYlCk9pvbjTP//itSGqpzuVRZX7QkTKqxj4r9M6QLR6/56/CrE4BVauEAwjHgOHlmk
         1ctPrrW2CbduOgUF8CApA+D0eZ40tciTnW9XzPwMkC33cU3lIDH69wpIHjozzwWTe//P
         t9Ba0CyrOGhMtsaxEL5D1xtZ1rs3efNrg908l+nFFbr6S7cw/CSrK/qvLCBZ4jTHYOgP
         hxGMEZZDijWTqX7/oZ31gPjNlfuEpuTnObx4pPniqLFICUAomw5JpPzfHajtWHK5gDjL
         Cn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958021; x=1768562821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+ZR4dnvbJ+y6yDGs9SuvRFM7nDX8K8jRqdd+yeqBQA=;
        b=ShU1U2YMgSsC87vk7hhjC7by2871Ps4sEeyMMuXhmhdj4Kul0PHrkGFxcGjjbPepjK
         H6L5q3EeCiHJgR/LE0L+jy+KGtRJG8bygilFt10Vyu5Dac43l1cuaxYzsvkfQP4GDGc2
         FiIU3WAUpECFoYhwNhhY+8bduvWeDfY9qTMRZyyuzDgixwUbaX+MPEsOnedClKD6Ac8o
         Vcocih2dKvkN44KTHdXjnoajMIQGdtLxWxeMKVFexVcqNu/p+Ob/Upr1S8WFK+IA1W0m
         32fqPhpxL9HZor78G2DlBhTMsA6pBOVrdbHM7SBLiv9Y0NDFgnds6yxHer9aUnyscJxj
         1U7w==
X-Gm-Message-State: AOJu0YxofF5o3nc7My8d5MY8vZwUB/JqyKW/9Gvxr5l2gNGBSZv7ELlB
	mxm8+RZB6NbhYd+AEHTnQBwb10Hi1eKWTJK8zNqQ0+uNBQpSxJ2qCu0rKERlCrsJgbTAhWoR7Fa
	kJTl0BNfEJ3/YKy9qdr9pgVTJW9zqsbB7Ys/C+xQPhxnfRSFI6UPOVubkn7QpSiDAZOkA
X-Gm-Gg: AY/fxX6I/ToRGqmtXFrw0T4/+q0gZUwW7QL81wl5q1E5U9h/8fRAceNN6RJPWnI888r
	evz4pO6Ir+oT/kzSJCMkDGlTMGSF7+/kgW7zbRerKVAspCGxLOKW2JSCaHPzt03sxOwP4SeBTvb
	kSONtMo022Fw9oQqXraJCvMMvGHu/ZTeiHi5l+YtUVN2GFpRn5701gP9qJ3Oc53k/DVbHn3oe1U
	O2RfLUVwDiNku3M9/zBT7q6AoPU4F6IW5paakhtxgBMKvq7t4wsU+24qccCau7cqNih/IhWc/DB
	VcLPYYp9dR+xfCBRnmuQ5xmQvzBseEGcqVLhsNlXHkXZksZCe8IvGpHjFZuj4sxKZ05qtU57Rsj
	NHGiqQLmL0czIb5NGUgAbGtND7F7mlEGpV5F1fx5nrvcdb3oq10gFK9nt/jPB5s39yfo=
X-Received: by 2002:a05:622a:282:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ffb4a3ff5cmr101434101cf.8.1767958021493;
        Fri, 09 Jan 2026 03:27:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxyStr9/yTwoYO2M3nfEO3OzvPIIrO41uVIbzWmtnhKMWOi1N1EN+6soyrPRdmLiLr9Vf4Qw==
X-Received: by 2002:a05:622a:282:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ffb4a3ff5cmr101433901cf.8.1767958020984;
        Fri, 09 Jan 2026 03:27:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm9947983a12.33.2026.01.09.03.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:27:00 -0800 (PST)
Message-ID: <c6017022-c96e-4095-b85d-88784a44c13a@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:26:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom: qmp-usbc: Fix possible NULL-deref on early
 runtime suspend
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
 <20260108154944.211886-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108154944.211886-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfX4pt71NnIjmey
 DFdSMdr9AiS1eDD031PTkZIAK4RuWjcct3KaihKaSUCNRnIde0IrCOMM8lDIUheuAxC79McPgqx
 vtH7rFuSCWiN8Z6nCkk7mYMGlzK4X+B/7Hc/sZ5Ya3TQcuTh1h6IpyjJnwqdWvwiPQw29uph5ro
 zOR0FiIs3lNqMy7j20kdFB9eNTSaQR4FM44J6ZM7MWXmT/sHTCJSpfZbY06MT4NxtQ2ELsuBENz
 Dqsk69GBSh4g1UDCpgiV6YifrLgZnQO0i597uIRIK1nEM9BopE1GCyfFjJocDGIVONF9GBCl7ig
 q/KJKHDuZ6U+9bHdh71w2nGkZ9lByD0S4UZZfpKE7xts07pbKKcpzdfLGM+Xlk4dp8/TWy6VdQ6
 yLXudokSl5m37AEKZOeKcfowRRkA9kmT7sEU9xzVphOD9NO4io079FtOkH+QUdVYDAwhFICWDeL
 EQLk/+9ou+bwj2QjwHQ==
X-Proofpoint-GUID: r8Xhl2XQsAnfPya2T0UOOKr0H75Cbis7
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=6960e606 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JrZo24E52nylh-zEmEsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: r8Xhl2XQsAnfPya2T0UOOKr0H75Cbis7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090084

On 1/8/26 4:49 PM, Loic Poulain wrote:
> There is a small window where the runtime suspend callback may run
> after pm_runtime_enable() and before pm_runtime_forbid(). In this
> case, a crash occurs because runtime suspend/resume dereferences
> qmp->phy pointer, which is not yet initialized:
>     `if (!qmp->phy->init_count) {`
> 
> Use qmp->usb_init_count instead of qmp->phy->init_count to avoid
> depending on the possibly uninitialized phy pointer.
> 
> Also reorder pm_runtime_enable() and pm_runtime_forbid() to prevent
> the window where an unnecessary runtime suspend can occur.
> 
> Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 5e7fcb26744a..05717ca85c5b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
>  
>  	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
>  
> -	if (!qmp->phy->init_count) {
> +	if (!qmp->usb_init_count) {
>  		dev_vdbg(dev, "PHY not initialized, bailing out\n");

FWIW this effectively says "if in DP mode, the PHY can't runtime suspend"
which I'm not sure is what should happen.

In USB3 mode, there's definitely a register in PCS_USB to put it into
"autonomous mode", where I believe all the hw does it listen for link
sleep (U3 in USB3 spec) exit requests

In DP, I suppose we can't just yank the power until the controller
decides to suspend the link, at which point we just power off the PHY..
would that be right, Dmitry?

Konrad

