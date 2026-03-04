Return-Path: <linux-arm-msm+bounces-95240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEu8G+uXp2nviQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 03:24:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9C1F9D6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 03:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8724304A9DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 02:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8288B258EE0;
	Wed,  4 Mar 2026 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJ6w9YmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4vkNPqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A227FD52
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591081; cv=none; b=I9TAvQBirYqvuW92neMipZHS85Nhpjr9U+sRwQA7kQxf/EYLamZIeE9yy5jBAW03j6TKPhU2VqYMk8e6DVmE+LNkohpkZbLjXwH1h2aC9XSus4cxwML+NfILU87HBVQVKAdHVfPd5PxKf5BI7P/4TClMh/Ycg+QrFRK8zmILEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591081; c=relaxed/simple;
	bh=L78XTuZqa0Gmn8x8DgEjeQINJ7tlMiUPjJz66Iwcy3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZPm+2RIHQdBYLj7kQiOB/rBnw18EJu561dEO5u4X2HrS63RkMrj3fl3Z7A6dkoBFUSyz2jB59H+Yubu6TUrgsprPcT3D1PFVWC7gQum8TPedSNCteqoWlUYRR+1H6Jnsq26Zd1mfLb9tN+CnXg2nvZeNgB2ml+fIKtANS6IBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJ6w9YmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4vkNPqJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62419wnN1755696
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 02:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x8VxTN5ARZbgoXRBw9eXKlSM
	rx7NILlCWjHAc593l8A=; b=gJ6w9YmXO6E1MukIomDxa3yAzBlhOLpB0kC+2BTe
	qAlB/oOmJaLqTr7uASrJjKFkLaHf2lFB7LkBsMOW4L4doVVa83bEMnI94kYhnwVL
	Ovqi8brhPsKzsBX82Y4bQNQ+Yu0kMrMjl6uIeoYGTtvASuuLpZT2Q1u9ZQhPD2JH
	n6nY3js4aa6VzVAOJUf4NR2H+zSZ7YmOMgHTFB1AEosHSEPq5mIPi2JnQ3Hnm+zF
	b1o031IH2i3bRkdoGW0b2rFhxST25ppAxc17tYUNUwhgq8tY+eeBisPRf2ucPnwo
	Ajom0kKsdV07TSz+lZGRKimaf7/OTK0mA2eI8G6cCukNdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8r6dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 02:24:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso4679982285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772591077; x=1773195877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x8VxTN5ARZbgoXRBw9eXKlSMrx7NILlCWjHAc593l8A=;
        b=X4vkNPqJ0bNV2osc9SOR8vdGBHjB4Em0SzNCA3XkE8sc2vYTr231E5flvwx0FazgKp
         pHNCyhsTJEP3NlFaS/JsWYPyv76HFyX4d/tLdi4zSlMGaVxbftqcb0wh74rNkpeIcDOk
         tJAVjSFGObNcNMAut6vWp4NU1opw41ru+zXTJb28vyLpxGguDx/KOMmCPOHkFeOVV/2C
         cWBtQ+BtpOmI02yxekhW0rIhCJv+Lska6fyrEOsW8qYi4XXhMAoImY3Mk170x3TzGYMI
         tLLbwguBySbbOuHea8QxKG6Sx5Cx+yGsSsgAYlt+HaWHA6MsWrDymakIvqn2H2DidXOE
         cfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591077; x=1773195877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8VxTN5ARZbgoXRBw9eXKlSMrx7NILlCWjHAc593l8A=;
        b=HqKzUjIx3KMUFEjM1SMOe4DLGn7QwXG1tsJpgBA5UtHxA8nNVxike+VQbDMpgsSjFD
         F+43nIMkr2vTs1A+c8pY87u3SI2/e7rBal1gR6tdQes9Tu8ZHVy8EO9rdwJ+W4ewBw1H
         tIDa7iRckCS3Rj6x/RgswLm1PenyGmluvn2OqQiq987UfGOzkrbH8xrvAXiMrugbx+Pn
         NIPAlV2XccyrJCLVNCjeb0eKYWulXUHzjoaC4KBHIq+djkuJQY3cS/EoIJBiNwYhrLMS
         3f5bwi8yozel3vef4SgCuEt0bvImc3rc0FgKznoX1K2ubAm0/V6zKRUpgraMxokCkj1M
         U5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Lpdm9eNsRCTjWg9CvT+stBmmx+cugvHygVoSUC4dcJy+rvCUHCL/utcZavufnVeWXD80fuqWP47pI1wJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzW6oaJp6+gOo0dU4bIvBdu2mOEihJsvKWD4uk1NorI0+5BRf0k
	dz/iex+Sxs21nYUV0QSJMqHzLivndFAVXOre91qBoR4YZwPGKfvy4auVA9vCXWB4WvUfDsi+wSm
	6TvNtuU68B1C4Z4E4Tz7kbNzQAC8gtrwvp3dMAy/cqYNnLTxdYHJSVpGeEpYWbu/T5Px3
X-Gm-Gg: ATEYQzwhlCJzfbO/JDOZdJdM1UZSjwaRNOoXSh4tTqAaiFl93msTwGqYLHQ5SAwbexY
	6kHG4Mb6sripvIUwHMdnXUg0LVPIbHt3Mm9Fd9BkuPoqKYClCbCg1bVd2Z0l51niDW/gwr4Rd8V
	pI3mXjQJvdhj9WwNAtTtG/sC8ogesFeXKTRCfXP0jbWDsTwxo2PbREBgWubevqxNCUFE/gvU+3M
	BfK/fGWFnQhccsW35OryZ/88qwr7vGYLgcQhih2UZQYNnumRDmReECqvH1YPGkoc+GS0C7VISwQ
	sZcBkWg8cgvzADynIAkUrKN0kGEQkIxCg/7IoSLc220OTVDEHQF0J83xBMHTqlsNk02O8CpH8yF
	vgKbI6AJo22UzFyiwN6pFggT31OW3Sw3fXEnhheBTB5Vw2z1mqoyTtzA5fX83NjHG4GEtNHg53e
	kDqA6U7PBPQGzvR/vKbA4b9pirucgSHcqWy1Y=
X-Received: by 2002:a05:620a:40c1:b0:8c5:e166:fa14 with SMTP id af79cd13be357-8cd5afc00cfmr62858585a.73.1772591076709;
        Tue, 03 Mar 2026 18:24:36 -0800 (PST)
X-Received: by 2002:a05:620a:40c1:b0:8c5:e166:fa14 with SMTP id af79cd13be357-8cd5afc00cfmr62856785a.73.1772591076172;
        Tue, 03 Mar 2026 18:24:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123583ea9sm929371e87.19.2026.03.03.18.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 18:24:34 -0800 (PST)
Date: Wed, 4 Mar 2026 04:24:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Message-ID: <b7svdypmdfyz4j43l56zutt7uu5nwfwjnsuz62yv3sgm5j7huj@kw5ppzf7q7rl>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
 <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a797e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=w84UvY5X6zoAIV4OglIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qBAceYy0OqXS97C0nZN8lbvMKov0Pp2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAxOSBTYWx0ZWRfXx6LUs1vfLOKg
 nDv4lLVYDrO0ioPjneAbTZiOH+hv4Qc59qp5f3hykEzPWd77sX2wuP4Vwg2KfHIejdhMkkYJvPj
 Sw3xAakvnmWhUSBAQvPugSSV+DrB0WubkaAZR63hTketQsOswLLViTJ4+HVp+euBRRq1QsRwXja
 qwBOazywjYTUEvuMY1HdrZNYddgwboDIYzBmrIGG5QHZHa3JVK0OiO1wNxUvsrvFuISoUkXfSNi
 wR06SmN3Ag6CZulDhTjC1LBmhudRZoaWiCfUwzq0tkmr7MfocbZ3m1wg23gPRy+F13CLGCQ16nK
 GuN/Y221NnkAIxVDzw49D37uXq3R0aIo2M0bp07DsdzLzBbbEOs3q5WYTNAkrucwrlIGfiM2jiB
 wESRxBtLu1bC1d41cLPI/Md2HbxQAb/5YzrAzYdfq3ZQtshhy95PkEVVcy//d/SDsPHj2vLA9iE
 Hs8Twi4vTPLK1B1yWMA==
X-Proofpoint-GUID: qBAceYy0OqXS97C0nZN8lbvMKov0Pp2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040019
X-Rspamd-Queue-Id: D7F9C1F9D6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95240-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:05:26PM +0530, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Support the graphics clock controller for SM8750 for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for SM8750 as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-sm8750.c       | 473 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |   1 +
>  4 files changed, 484 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a8a86ea6bb7445e396048a5bba23fce8d719281f..e4ec41e3dc7dee43a5682a3bd93297785e67e41f 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1481,6 +1481,15 @@ config SM_GPUCC_8650
>  	  Say Y if you want to support graphics controller devices and
>  	  functionality such as 3D graphics.
>  
> +config SM_GPUCC_8750
> +	tristate "SM8750 Graphics Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select SM_GCC_8750
> +	help
> +	  Support for the graphics clock controller on SM8750 devices.
> +	  Say Y if you want to support graphics controller devices and
> +	  functionality such as 3D graphics.
> +
>  config SM_LPASSCC_6115
>  	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..817b13f5e78cb534e165b09d95e70cd4a58b12bd 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -180,6 +180,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
> +obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
> diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ab618c440848e2e763b1a5da3e70c9a97d5a61d9
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-sm8750.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_GPLL0_OUT_MAIN,
> +	DT_GPLL0_OUT_MAIN_DIV,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_GPLL0_OUT_MAIN,
> +	P_GPLL0_OUT_MAIN_DIV,
> +	P_GPU_CC_PLL0_OUT_EVEN,
> +	P_GPU_CC_PLL0_OUT_MAIN,
> +	P_GPU_CC_PLL0_OUT_ODD,
> +};
> +
> +static const struct pll_vco taycan_elu_vco[] = {
> +	{ 249600000, 2500000000, 0 },
> +};
> +
> +static const struct alpha_pll_config gpu_cc_pll0_config = {
> +	.l = 0x34,
> +	.alpha = 0x1555,
> +	.config_ctl_val = 0x19660387,
> +	.config_ctl_hi_val = 0x098060a0,
> +	.config_ctl_hi1_val = 0xb416cb20,
> +	.user_ctl_val = 0x00000400,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll gpu_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &gpu_cc_pll0_config,
> +	.vco_table = taycan_elu_vco,
> +	.num_vco = ARRAY_SIZE(taycan_elu_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_elu_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gpu_cc_pll0_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&gpu_cc_pll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_elu_ops,
> +	},
> +};
> +
> +static const struct parent_map gpu_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
> +	{ P_GPLL0_OUT_MAIN, 5 },
> +	{ P_GPLL0_OUT_MAIN_DIV, 6 },
> +};
> +
> +static const struct clk_parent_data gpu_cc_parent_data_1[] = {
> +	{ .fw_name = "bi_tcxo" },

Why is this clock using fw_names instead of indices?

> +	{ .hw = &gpu_cc_pll0.clkr.hw },
> +	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
> +	{ .hw = &gpu_cc_pll0.clkr.hw },
> +	{ .fw_name = "gpll0_out_main" },
> +	{ .fw_name = "gpll0_out_main_div" },
> +};
> +
> +static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(500000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +	F(650000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +	F(687500000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gpu_cc_gmu_clk_src = {
> +	.cmd_rcgr = 0x9318,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gpu_cc_parent_map_1,
> +	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gpu_cc_gmu_clk_src",
> +		.parent_data = gpu_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
> +	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
> +	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gpu_cc_hub_clk_src = {
> +	.cmd_rcgr = 0x93ec,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gpu_cc_parent_map_1,
> +	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gpu_cc_hub_clk_src",
> +		.parent_data = gpu_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
> +	.reg = 0x942c,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gpu_cc_hub_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&gpu_cc_hub_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_ahb_clk = {
> +	.halt_reg = 0x90bc,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x90bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpu_cc_hub_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_cx_accu_shift_clk = {
> +	.halt_reg = 0x910c,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x910c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_cx_accu_shift_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_cx_gmu_clk = {
> +	.halt_reg = 0x90d4,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x90d4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_cx_gmu_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpu_cc_gmu_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_aon_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_cxo_clk = {
> +	.halt_reg = 0x90e4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x90e4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_cxo_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_demet_clk = {
> +	.halt_reg = 0x9010,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x9010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_demet_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_dpm_clk = {
> +	.halt_reg = 0x9110,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x9110,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_dpm_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_freq_measure_clk = {
> +	.halt_reg = 0x900c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x900c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_freq_measure_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_gx_accu_shift_clk = {
> +	.halt_reg = 0x9070,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x9070,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_gx_accu_shift_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_gx_gmu_clk = {
> +	.halt_reg = 0x9060,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x9060,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_gx_gmu_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpu_cc_gmu_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
> +	.halt_reg = 0x7000,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x7000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_hub_aon_clk = {
> +	.halt_reg = 0x93e8,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x93e8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_hub_aon_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpu_cc_hub_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_aon_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_hub_cx_int_clk = {
> +	.halt_reg = 0x90e8,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x90e8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_hub_cx_int_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpu_cc_hub_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_aon_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_memnoc_gfx_clk = {
> +	.halt_reg = 0x90f4,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x90f4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpu_cc_memnoc_gfx_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc gpu_cc_cx_gdsc = {
> +	.gdscr = 0x9080,
> +	.gds_hw_ctrl = 0x9094,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x8,
> +	.pd = {
> +		.name = "gpu_cc_cx_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = RETAIN_FF_ENABLE | VOTABLE,
> +};
> +
> +static struct clk_regmap *gpu_cc_sm8750_clocks[] = {
> +	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
> +	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
> +	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
> +	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
> +	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
> +	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
> +	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
> +	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
> +	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
> +	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
> +	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
> +	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
> +	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
> +	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
> +	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
> +	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
> +	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
> +	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
> +};
> +
> +static struct gdsc *gpu_cc_sm8750_gdscs[] = {
> +	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
> +};
> +
> +static const struct qcom_reset_map gpu_cc_sm8750_resets[] = {
> +	[GPU_CC_GPU_CC_XO_BCR] = { 0x9000 },
> +	[GPU_CC_GPU_CC_GX_BCR] = { 0x905c },
> +	[GPU_CC_GPU_CC_CX_BCR] = { 0x907c },
> +	[GPU_CC_GPU_CC_GMU_BCR] = { 0x9314 },
> +	[GPU_CC_GPU_CC_CB_BCR] = { 0x93a0 },
> +	[GPU_CC_GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
> +};
> +
> +static const struct regmap_config gpu_cc_sm8750_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x9800,
> +	.fast_io = true,
> +};
> +
> +static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
> +	&gpu_cc_pll0,
> +};
> +
> +static u32 gpu_cc_sm8750_critical_cbcrs[] = {
> +	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
> +	0x9008, /* GPU_CC_CXO_AON_CLK */
> +	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
> +	0x90cc, /* GPU_CC_SLEEP_CLK */
> +	0x93a4, /* GPU_CC_CB_CLK */
> +	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
> +};
> +
> +static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
> +	.alpha_plls = gpu_cc_alpha_plls,
> +	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
> +	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8750_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc gpu_cc_sm8750_desc = {
> +	.config = &gpu_cc_sm8750_regmap_config,
> +	.clks = gpu_cc_sm8750_clocks,
> +	.num_clks = ARRAY_SIZE(gpu_cc_sm8750_clocks),
> +	.resets = gpu_cc_sm8750_resets,
> +	.num_resets = ARRAY_SIZE(gpu_cc_sm8750_resets),
> +	.gdscs = gpu_cc_sm8750_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gpu_cc_sm8750_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &gpu_cc_sm8750_driver_data,
> +};
> +
> +static const struct of_device_id gpu_cc_sm8750_match_table[] = {
> +	{ .compatible = "qcom,sm8750-gpucc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, gpu_cc_sm8750_match_table);
> +
> +static int gpu_cc_sm8750_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &gpu_cc_sm8750_desc);
> +}
> +
> +static struct platform_driver gpu_cc_sm8750_driver = {
> +	.probe = gpu_cc_sm8750_probe,
> +	.driver = {
> +		.name = "sm8750-gpucc",
> +		.of_match_table = gpu_cc_sm8750_match_table,
> +	},
> +};
> +module_platform_driver(gpu_cc_sm8750_driver);
> +
> +MODULE_DESCRIPTION("QTI GPU_CC SM8750 Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index c209ce5fe4f003aabefd4421eb4f5662e257912a..d46243ee2ddaaa233361dc00a2f64d85ee4ebcaf 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>  
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
> +	{ .compatible = "qcom,sm8750-gxclkctl" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

