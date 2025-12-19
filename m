Return-Path: <linux-arm-msm+bounces-85880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA5CCFEFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D40693027FD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344002E54DE;
	Fri, 19 Dec 2025 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUbzoGQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEIyuA/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF219DF4F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149151; cv=none; b=oef6wNBKN7zr3/6v1alzxviRmRtg3I/IQ8QoXBgtSagWgDWvcY5u/0ca1UEogH5SpKqPkrTuE/7ZVYjq3TJ5fV40xFOywAZaCsMYS4CIvuxCEJ3y5GoXl9roMwx7E7zJfA2Xw5e3g1OmGCuE0hRnkY1ANCpffRrNP36+5M+spPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149151; c=relaxed/simple;
	bh=IQiqP5ieYv07JRTlNyvk6XwLHvpcOoZw30QovOgFdSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn+e3BTFDldXFq8CJkLYH3r7Iw+xb6NwA0R402tDByBJ4CdNRBEAgjQgayheWe9qnBnEVfK20Px69AAzMc/PdejZ+XXSDMiNUGUI3951KgZObRJqhqG3X9RoPQaLnE8EE2K2SJ5i8REy1B1ucMWiBMuGchK8AZGZQmyAAwYcObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUbzoGQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEIyuA/L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBZXt34101209
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Efa9heFDzB8Tt0RbVtYLypJD
	IL8Ns1COcky8O0sAqRQ=; b=OUbzoGQX5AgKZXfWabRe0G0R/5LWL4IMDbhb+4nU
	4gra9cqnQysAW5WwdaRkPTnKJEq0ZsiQG4ugxkzUmAUB8/yj4Pe19qCT0ZbAnXY8
	H9j3ls0VmU6JOyhmVwLjvuEpeBvliHpdiZAHiRyLwhWCCy4I1Yx/Qp/mdHyMtVEk
	X7GyFvD6TL1frXwLvkCGnJBaAE9B3ZqGHBG8AHf4wRuB6lDE3vIrwnIaoztzi2o8
	MxL4Dh27kxPqcFdCHp7fdCxgk2G1pfZXS2w29UQ+jOvku7e2aGnOQ/1/vF3/xCq5
	Yl9EDU7lghLyo0kLlCVkuBSuXU3MuFGxiHAOsEp2bv0MTQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2pkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bec29e62faso404200b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149148; x=1766753948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Efa9heFDzB8Tt0RbVtYLypJDIL8Ns1COcky8O0sAqRQ=;
        b=MEIyuA/LCKGfBDxMTGNQmdLl8qz18jj5dW4keQD4m6VLUZ6IlJ/QMoLlwI0dD5DqXu
         bVso4He0J2Sa6INW2P2R8Yl0/Ji0q/Tvc7zC+cZqDINSr2x/2W2inbWAD8C0t1dftefA
         OjUeTGBLT4LUwtQtueke0Ywrvyfeou8JmKdqi5NSvL1FEQ48cnqBv4O2omWcGgFu8p8y
         tD0LHCvxsCSRmQ2C65yPSI8S2lxXg9+79UY/SxVZlFf5ztbOAQNJoTx0GFRkG/rFu2mo
         lUoY9CuOH5YaWoIC/EclM7SX7+VcCTuW4c6KChyYf/GPoCzgWpcesb5Y4H9pVa+YTVmN
         L7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149148; x=1766753948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Efa9heFDzB8Tt0RbVtYLypJDIL8Ns1COcky8O0sAqRQ=;
        b=tnWo3maacXgphmGnsjlzSouclNvuAM5vYmrjra97sOfrcQMwHUg5fVESVCPnApJyeo
         Ig6FrptlqEO3U41+DaNc80O7YVq2NdwBeQP5xrqMcI5cmmfbv30xXvKRrYs6x4P4Dpm8
         18GmzZK/Zhu3V8OPMqO3Dl+kLuPLhwFAmCFak85j2A2+/1u5Y23TzLkNIQ5kB4lTdvSu
         0R/Vl1EcyAB9v9PC+TfQkFYoBmnjG/iKgzZaK/HnWLvlAwVRptMF/Zm/K7GvOGEiEqvx
         LiONcoYtl0Co/JGJzaRerFwaE30ZOeXEXO1GMoZf54icu9yATGz1eBE1rtiXl+/wMhT1
         NDPg==
X-Forwarded-Encrypted: i=1; AJvYcCUpb3K5eYuNk0194DHu3yhFrV4qJUrz+vrNtcZZdM9lN/EGAbr7oUx6tR/8cyZP0QWAzLXu9GURPIkjJlhs@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvBwUqN5phABEDA1NAepYjakUnBYa+o42wMFYiCyvbzeixKs6
	jYL5qdWJgeovqsQG9HtSr5oOH0F9dacdxhRbcUWaWSQE7WlLEv40XCLjLpYyZFbfhpE6wOWtXyC
	5lJ+NxUIxYEUFhIzhThiY4SRFIBvR8E2Hai+67EHHhg2SV1yLtzh0ZlKDD3pO5HWnDJGZBIBWNg
	bP
X-Gm-Gg: AY/fxX7rDiKMmxFe8u4grweE55yfAjKKks4QwjNY+7Bhat0CP/c8sCX+qELe2YO+dUW
	8hTlMaaFrupNNmdjxlv0nt+SrFwh6QZ5nQqJVmuGIN2hwPJkER2wS2KmOumvE0FFjNOlqq6tu2K
	U+gNx0KTlNFGlHrMsl3ZR8cp/oXtBM8QrvkemrvvfnU7mJneVn1KTBx7BamTQFtpFPrGFpKIq9+
	ya3I7wXtJpVhv9H8AnSLyV6dHAmgVFJkmlBqjxctk6g5SX6eUMbDlAkcmgOuMi0JkI6FvQPZWJk
	IXDBr75jQGqssk0FlF8buSTbaRePhg3R2OxsTSiXaDx/FckFEJLlL2qKA3ZlD2/UBh07CyNnS95
	zh4MscmzzVj76Ipdz8flQ2wfi1FmCvRbzGMIDvF288BmsxpGoiqLcDBUpFXVaHeepWPmKYTAsg3
	cUdZf4f7CiMvC2mGX/tsIgn3V1n2dh+w==
X-Received: by 2002:a05:6a00:2355:b0:7e1:afd9:9a69 with SMTP id d2e1a72fcca58-7ff6706198amr1788671b3a.5.1766149148012;
        Fri, 19 Dec 2025 04:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSgNMamhujnmgcIp+ewQqPZhNznSmn1P30c0yQhGKIZPS0ijEUb9uQ7LwUlw6/SH0esiyi5A==
X-Received: by 2002:a05:6a00:2355:b0:7e1:afd9:9a69 with SMTP id d2e1a72fcca58-7ff6706198amr1788644b3a.5.1766149147562;
        Fri, 19 Dec 2025 04:59:07 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a844d5asm2415421b3a.3.2025.12.19.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:59:07 -0800 (PST)
Date: Fri, 19 Dec 2025 18:29:01 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <aUVMFTtVLPe7re0L@hu-vishsain-blr.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
 <7d31f45b-1062-4118-8769-49209908f2ef@oss.qualcomm.com>
 <aUU05P+xP1XdwihO@hu-vishsain-blr.qualcomm.com>
 <4112ba0b-6feb-4e30-a57e-50ef9e3d6b5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4112ba0b-6feb-4e30-a57e-50ef9e3d6b5e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX1wMYZTlOMnhI
 RspC/I0g0uuJjbi6n1smBWF148QJVDGFSiAY71uKTFYq9xCXVzNINF3GlViGmINgQSsvQBkIGuy
 zsJsnV0Yp0VH/bt6A3fmLKatX1G/Mtt+P5nvob2LaypjETdxPwWayKSWFgqTzNOURwkVy+FGwY6
 bWAnZerYgF5O4OdUV6n2PA7Gyl0f564O4xoQO259vo/KUgK/5vcsPV+3cdXu1MBdc2e2vJ7Lf3Y
 zKyMdyQoNd1Rj3/7A5icmx6LNpqcPYZZZLRPO6X6nqVBwn8wYa2Ln6ehwIYbN631jA5S8XW+2ZC
 n6v1ieeQLV5sqqNJjtQOn0lpVQoMWyJSGFxO8zmH+mg2cAU0qOYX1YTfNZ+lDLGqkrg/hF6gaZv
 IE7WihwX+oSzMxdwARvxr+uTiu5/9hH86PU32ANnrqZp+fmawBX7OCFbv5Tox49bNfAQIRxIYeN
 3NFBoS/pLF+6EZ4X29g==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69454c1d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rT_Bp38etaQa0i48-N0A:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: s_NXlXxcPGkJfO6_dAo8T2ZKfpM9jJr6
X-Proofpoint-GUID: s_NXlXxcPGkJfO6_dAo8T2ZKfpM9jJr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190106

On Fri, Dec 19, 2025 at 01:10:19PM +0100, Konrad Dybcio wrote:
> On 12/19/25 12:20 PM, Vishnu Saini wrote:
> > On Thu, Nov 20, 2025 at 01:11:00PM +0100, Konrad Dybcio wrote:
> >> On 11/20/25 11:58 AM, Vishnu Saini wrote:
> >>> Monaco-evk has LT8713sx which act as DP to 3 DP output
> >>> converter. Edp PHY from monaco soc is connected to lt8713sx
> >>> as input and output of lt8713sx is connected to 3 mini DP ports.
> >>> Two of these ports are available in mainboard and one port
> >>> is available on Mezz board. lt8713sx is connected to soc over
> >>> i2c0 and with reset gpio connected to pin6 or ioexpander5.
> >>>
> >>> Enable the edp nodes from monaco and enable lontium lt8713sx
> >>> bridge node.
> >>>
> >>> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> >>> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> >>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >>> +	qup_i2c0_default: qup-i2c0-state {
> >>> +		pins = "gpio17", "gpio18";
> >>> +		function = "qup0_se0";
> >>> +		drive-strength = <2>;
> >>> +		bias-pull-up;
> >>
> >> Similarly, you can move these settings to monaco.dtsi and keep them as
> >> defaults since 99.99% of I2C users will share them
> > Is it ok if i update this in a different series, similar other nodes like qup_i2c1_default
> > added in monaco-evk.dts?
> 
> No, I don't want you to introduce something "wrong" only because you
> don't want to run git commit --amend
> 
> I see you've now sent a v2 just 7 minutes after asking this question.
> Should I interpret that as you expecting me to drop everything and rush
> to respond to your queries immediately, or do you not care about my
> feedback anyway?
Apologies, for quickly raising the new patch, i thought of correcting this
in next V3 patch if you ask for.
I am new contributor to the upstream community, just now i setup mutt and learned a bit about
sending reply to the emails and V2 patch was already validated that's why i submitted it.

monaco.dtsi already have below node except drive-strength and  bias-pull-up.
tlmm {
	qup_i2c0_data_clk: qup-i2c0-data-clk-state {
		pins = "gpio17", "gpio18";
		function = "qup0_se0";
	};
};
I will add drive-strength and  bias-pull-up in monaco-evk.dts, let me know if this is ok?

> Konrad

