Return-Path: <linux-arm-msm+bounces-104834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Eg4FHzU72nGGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:26:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FB47A976
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C29303031ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6F378D7D;
	Mon, 27 Apr 2026 21:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFY+L/2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KazArD5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94974372EF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325175; cv=none; b=eUXdKMkTUDtrLHKl3ET+KAhi4e9wz97Qoza/clQv/c1vQIy4BKeEPzCKK/taMn6d51lF5Nnx1M9X4Y8fdA/wSmvllSd/Mp5X0Q8ty7oc5yCxMzoFHB/Sb4vrYISsXDMrF52ED/EEiyHNdA7Zmu2y1/f5+k6PfILiKEE+q3TFvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325175; c=relaxed/simple;
	bh=bSW3WAoBsrFd9H0Shnwo+F3LEYcpztafIuWLW0/ey7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuPC0RveIqcZe80VVKE/EDAT8SvJOO8HNq/EGZtOrqYhIQRSzlC8ArcwAYZfFP6G1VgTJKPwjGKI/DbM/e/5bggCCLa4NeD/6HIJyW7+mEwCFagcCRgcHgoVlSn4FC+3z0vQdtbqhL5cuslY93W/5d1EInuEMg3WfjD1u25AtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFY+L/2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KazArD5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLUrm3760592
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MrW1+n53XVO/1Nwe6562dqWB
	qJzHztQPyL2+RkJZeog=; b=FFY+L/2C1G3HJL/qVawdllPRlyp7UAv1KtYIMDIS
	F1Q9dke9bYRu5QNuqnupM15zObumRApEo3IO9wMWNIjh2XbGWDcKBz/jOze6ZULk
	cQ5rru4hWkHd3SJevvGAjlJKSsrlydeRFDKhNxzhUVRbOOuCqRFA3xwMZn1ErvKk
	YoDQFFn/mdN4DRW/22uUzn/4MELNd03vHYmg/IcIwYUswCcSSxWnBv1k4yzsStCZ
	kKeozLgJQxkI5CtH0lMHEgmQdimvm3jgxCGvtbWIC79C3Xf+veOQNWZWkMcvsODg
	mO+GwUUG82JgRQPSSNVsB4w5Rl7ll4z9EtgUKu2TNriJKQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacds9yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:26:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dbf4f678eso8312284c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777325173; x=1777929973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrW1+n53XVO/1Nwe6562dqWBqJzHztQPyL2+RkJZeog=;
        b=KazArD5xDOb8DIs8HJJvwXBRGLENTbOY7uHG1nnc4iJ5RS+wLdj8iCofRSwEbHs+XQ
         nI4uNQQVM834xBs5lXIpfN0GhY30Gjz3GoAedf48bIgmdxuyEJt+fM4dgGof2DU3ZzhD
         NgU58cz3rdqqNj6dSq7l/t1Qj04pMC69x5sc39s/avgRUxAm7v8lb4VsG4ka11640FyG
         9CwnFPF4LszHSf+K7bc3Te2BwJbtigzcFiA0IE/BL2KcMEzTo+y30Pu6FhLBrjQ9mIfa
         h7PppbdxmVz6xz75dwSVmfm9fk0NUDUgAdJPxPGRTv7drFgp/S5BNzo3YVUTEXhhXr38
         42EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325173; x=1777929973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrW1+n53XVO/1Nwe6562dqWBqJzHztQPyL2+RkJZeog=;
        b=KMQ8KxgHgsBL9VuqhrO1eSdcN+maFpXBfgK4eGMHSFcY0CoQE+h29ivfw5c500Kiwy
         RiBneEKMvwizFM1HI0dIwJ1nDvjOriczXXyrp9EEn7USmuVE2WlhyJnyTztSusHpITVo
         ro3vSCabf2/fPirup8k7xGe9c10/ELpxNtLMhBqqBXN5ZPqkH+8Udb3ye7QMZZ6ZVd63
         VkOvzerJ4mpTbwIcctSTjXgP10c/GNsGndNSIJn+u/o6jFvkEYIKEW0AX2NzobUrRhhC
         hl6jBH3kCEjTVZ5JNrdBXJad3L4Gxi/xy4CfGmW+69z3M110Jt5DufxDHifehjSEfIU6
         CQ5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9el/Eyt95f8NBZS35ypO2ADtd4G/d+btpEnThpVXPKZTTGFE3/wGGADHHlK2mmJR2A/zpad0nknFxPKIoI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7WrNfz53GyKgKML1P25JsRP8Baw5JuLrUNfUpHhbfL2Tch3t
	O7iqMt0T48zII8/rh5ORDVdcwdBBSf9S6Bpz/P2SQ8bMtp4jM/4+9QZwopU74XySp/a2Rd85Y6c
	biTIi9ZxxGzq5wXIOTYJ+SAgkj7MBa3yBQMeEFQ+Sss3wDiYAqQ2iWD8apIUBWKbrhd2u
X-Gm-Gg: AeBDievBYGKSgeE8XQo8zW+5pqboe2ik5yeuUv7nWc+nb++oZPsRblKYDzgbmgLN2my
	Mu77lqn50ZtU79I/dRkJNkKlF/F503F7CFKiXkuFx0Wq2Dhy0dZjbbh/9oI0ig1XTf/LaCHMb5G
	5QRZyTNQYJKolsZznyoVGK2ndpxOPfrXGjsQcQ+6ufkYIcmF3k55ptyUF7NqUqj8Fplsy9dgbC3
	Z+SUeuNm0FBbnJhfqSiJAumO8rahmZJ5PxqxG5Ec4gy+IndDvDGhm7TzgqIgVc6p2qfWwN7e8vR
	ZjUsTcbghLm/KJ0wPov2oWJcYqnNWp++vmOPMtCBvWmlcXttkUg9U5UbSmq6YHn0uN6t0f6ir/L
	nMJrf1nb/Q6Kzru6FqbjRrm0HU3EaZy2OLG/mhjnU4/u/O0QUJdVDwSfRt/xsN2CrCiZ0rCH/DT
	gCKkZPd9u30w==
X-Received: by 2002:a05:7022:f94:b0:123:348d:8576 with SMTP id a92af1059eb24-12ddd93f1e6mr393409c88.6.1777325173235;
        Mon, 27 Apr 2026 14:26:13 -0700 (PDT)
X-Received: by 2002:a05:7022:f94:b0:123:348d:8576 with SMTP id a92af1059eb24-12ddd93f1e6mr393385c88.6.1777325172657;
        Mon, 27 Apr 2026 14:26:12 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd93abadsm592162c88.6.2026.04.27.14.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:26:12 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:26:10 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: add Hawi interconnect
 provider driver
Message-ID: <ae/Ucn8kiDTdjPdQ@hu-mdtipton-lv.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-2-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-2-851cac12a81d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyNyBTYWx0ZWRfXz2jruA2z+DIw
 h+MZGkP6BtqqJXg/xQU3r/O3H5nwE5BZxJoz/xdddV4D6sWURJfsD4HYhpjp/uEbMKm3HarTltm
 Kgnj0xl6oIsFMiZofr4wtb4nU0vFNYfnws33YoLRBrS2YlzrPSJ9Uww04kXSPzLOmqZsnQeEjF4
 ySXg0MEse1xx7bfeuCTsf/DsvI41pK4Kh3nBHVVTZBG7OyfoArHe5ic11GBgLTYi3IUsZQmgfZ2
 MtJxmbVzYg23uTOUpqNiseDPzoANP/YYR+Q/GGFVAcwAhUOSOUqO5S2In3NvClBAMG26knXLZSH
 CSChryKnVNjH7JDd4m/KpZIk0aVqVk69/nJykYcxfgtIVUANmY/J7n8kyMTAhc5EOq/Yar+4YTa
 L38cHzPKmjtboj+2onZC/CDVhC+MpOtGj6KC3W8AD52ziECwqhTsTjqvT5YcXosi+zGXjFXLSxK
 MzVQYIEGlhTvkxa+T/A==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69efd475 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4GzhDZxwaX2ww3neWW8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: UqYj_4F3zNEMG4KvIGZX6MNgTvdPc6Wr
X-Proofpoint-ORIG-GUID: UqYj_4F3zNEMG4KvIGZX6MNgTvdPc6Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270227
X-Rspamd-Queue-Id: 932FB47A976
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mdtipton-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-104834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 09, 2026 at 02:01:38PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pair.
> 
> Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/hawi.c   | 2021 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 2032 insertions(+)
> 

[..]

> +
> +static struct qcom_icc_node * const cnoc_main_nodes[] = {
> +	[MASTER_GEM_NOC_CNOC] = &qnm_gemnoc_cnoc,
> +	[MASTER_GEM_NOC_PCIE_SNOC] = &qnm_gemnoc_pcie,
> +	[SLAVE_AOSS] = &qhs_aoss,
> +	[SLAVE_IPA_CFG] = &qhs_ipa,
> +	[SLAVE_IPC_ROUTER_FENCE] = &qhs_ipc_router_fence,
> +	[SLAVE_SOCCP] = &qhs_soccp,
> +	[SLAVE_TME_CFG] = &qhs_tme_cfg,
> +	[SLAVE_CNOC_CFG] = &qss_cfg,
> +	[SLAVE_DDRSS_CFG] = &qss_ddrss_cfg,
> +	[SLAVE_IMEM] = &qxs_imem,
> +	[SLAVE_PCIE_0] = &xs_pcie,

We're missing the equivalent for SLAVE_PCIE_1. 

> +};
> +

Thanks,
Mike

