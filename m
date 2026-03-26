Return-Path: <linux-arm-msm+bounces-100029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DRMCIu/xGnN3AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:09:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7582F32F411
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C5263036062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5703537F5;
	Thu, 26 Mar 2026 05:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwloJN/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwI1hLMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF834C9AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501578; cv=none; b=UTbUcPL8UyN07hJ2SX3z4lXvj0BFjKovZSYj66ZM95J5LcpA/sdNj5GYnODk30tqDyCx8L3qK8i3TpEMsQn87u59B05uavLLhCpwaB3AmVhRiWbTdT4hmNRPTrgmoFHtBjA1JXMUJuIFC5WsCI4rE5rEooiX2VYzoWtfKtn4i34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501578; c=relaxed/simple;
	bh=ObpuUhEncOlpi8q4Llh/6L0oowq9gECOdciNqUeKjLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUs+zkDT6YEPSNgSL0OHVGrsTJj8N3zjaHqbjemgq+ZowTOkFD0Eqf71B/9FqGk2X8rqjeTRavcsH+6xyCEGe+gkVXJ4kmS5wSOp9O20fTDhS6vcgKELWV8RbTFXNkwndlzdYb9Cg7v902qzNaOrkm+9FpslLkpOS1VuBO0M2E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwloJN/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwI1hLMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKkuZK051545
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kX/Q4tA/GGa5kkY3FZPPynvH5D47EXWFc+DBBlWPBDw=; b=TwloJN/EuipuqjgI
	ewx4ZWUoLxUzztkbX8sN4O8oWa/BefS83UksG56Ds8pzxKKR+CA2XsMKKwqOqSmh
	eiuDd3ojea2YJNNvzA1qhC3yC2Kj7G6xd4nLJk5DxcQhrSWb7HGiFeiyq1EKQ5qT
	wsZ1Xib8AuBQsGchz+JAQ3b5grWLJwMg8b/3RYd+2zRv4DV86uMTvfAyIDDL+Gvt
	aljeE66UU8CVMreOnssvgqueIsK8ZzD4A4gbebKZQVnv3IPWNDxJl/ubN+fgjlbO
	B0hl+kBG/o/rnEmvOimIr6LTNj6OAYbwoT/gs1qWH5AbU0014PcQWUyTQyoXV69I
	u7GWRw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t18rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:06:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso600299a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501576; x=1775106376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX/Q4tA/GGa5kkY3FZPPynvH5D47EXWFc+DBBlWPBDw=;
        b=cwI1hLMvW0LbmNM9WMTrrVDey2DX8WdBvIpAGR8zMGGyGQe2v3xCVXzRwJvfI5UmF2
         LdjASPbxkHEGpUsdvrhc0tHU3aAo947EBA/kWX8FDdLx8DwEppGfJCv+2lnW7Lc0pTio
         F5S6qMVsjNfkM+2tLJZ42CCFhFwq1BiGZi1sEos84R/auFqo0x6iUppw75SXsO1xM+HE
         imUficZlwvfQPqoUV4LFvo4KSFS9yolbmrEv4QgYhqJYK8jEkZr2UxZJX5FWgFwbhI8h
         u6v5lMfY2qkTlkOpWAR/N36Adl09ZB9KxJB6mmtJzF9r+/9aTVQbpIcRS5vYgob0PYUe
         kGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501576; x=1775106376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX/Q4tA/GGa5kkY3FZPPynvH5D47EXWFc+DBBlWPBDw=;
        b=LN3y/MClDnSRBz4eK/58rszvW4bvFGUX2LEEn9HFxN9vmvx9He9iXE+nZX04BdFA5Q
         gh2w/+laLhs2NKLKpKSsftLRw8AjNWPjnGxl3UydwNT3UKpy5ZlerpxlR8SxLhHFzEsn
         UToOfYjPda3JfiAE+BKUHXNxlCBNJLEwJLGV+vUvkQVapFy8i+Gy96Gx4BD0YrU2UdTe
         Gchs/NQzraFGlbmIezwVGvweEqYwzCHE5EKsabNp944nkJP4F7B8VFlYmp9TcHI9ut1i
         Im8v2nx3XrQ/dNFlO6st6LCIZV7U1Yx4x5Sz9ZLBD9rZvvH9N4XLN5mLu7C0xpkKLXQG
         cEuA==
X-Forwarded-Encrypted: i=1; AJvYcCX9WRXrvuQWYkXQXIyQ6cNllB+8gRegWob2afC8AaOphhn476SrCXr1p28sUuuJnp9fmRWZWKG4SQkCmRcL@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9r3DLZzDZo9LDPMUOOT9UJDIw8Vtkqwx3ex4Z8BM56M1uVzE
	mRlrMWAAJWN7u5UJBlaEAUZRbNJOR+WWD0xH4nCNGm/un/YOm2r8Ou7JfSGgRcwaK/ekFcuw0Z7
	7mJRMDuM61KkTOwE7qb54PBsr2b7piXyWVrrZcSsKN/I7M8vXdixe2tUdUXIE1eS5hmud
X-Gm-Gg: ATEYQzyXwMfZaC9TfK24ouVi/8XCo/Idm9ymHp7B2AXxaF8pfbc3ot/9ggnYRg6sAtI
	inAnFV+B+5XHN9/0s4Mg1D1BA7R4MMC2rXbbjjMqi1hfmUqsybS2krTU3tXZ47mRfmh6wPTQkiL
	iEPWQgdahS2xFpcsZYbZuFu4fmMuCgXRlKQEC5gpl9F5SMpQJiTk5zYGCW5+qmFGggDxPPkytFn
	WI5uf+6FUV7YNkiY/8qg854Fke1uAAx9EXkpPPnOPDlnVSYll1YoKN31cB8qPnlELfWxucRZxgL
	DGLYj5lpRetpI9ezBCSQikm2AYiua3eLJw4FEBzTS5VK7KOWe48DViGW/OpBcLoqtc4KIe7q1u2
	1kqI79oQ35webI5HAlohkFEEhcbDJ/1HuLJl0s4KQqAu7Nf5M+D90WQ==
X-Received: by 2002:a17:90b:4a03:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35c0dd95865mr5470189a91.29.1774501575449;
        Wed, 25 Mar 2026 22:06:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4a03:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35c0dd95865mr5470167a91.29.1774501574933;
        Wed, 25 Mar 2026 22:06:14 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09429sm198541a91.17.2026.03.25.22.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:06:14 -0700 (PDT)
Message-ID: <56860faf-3f74-daeb-3d19-a35243172317@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:36:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4bec8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=74htzXLwVZE36vefv0kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eH_hjeYaY2qC-6DiMqobm8sXOth1rjpR
X-Proofpoint-ORIG-GUID: eH_hjeYaY2qC-6DiMqobm8sXOth1rjpR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNyBTYWx0ZWRfX4CcmpSf5fqsy
 5pGbhSHb4VVyCUgqot7LoeX3g5EndYmhpqfoLCpZNsrSSZERTNIa+QIfek5IIwTHs0/yVCZ3Kiv
 yk1idNhG8Z/XJIGTek/CQCU4SXLdC9hjGuh+g7tvu/sK5R55KTsE/piNhR1IZCLfW/l5cLcXCIS
 DnyzRqV6h3HHahUcpxv14/KF3fR26p9Kfzz97XD50fOpHLVUJL+yRFXNqws+c83DWoLvK5yUDIP
 vdpUPDUBX1bBa09wrcNAgs1DFkBC7adh5B6NrvRoXDZX0XJLICbBI/Ox/YNGgqHdxnJjWvE9YHD
 VBliWap3W78gDvaIdiTRoa12LhWKOXties5cSzbyEYY5ezlRcbaTRuvCZk+oeWbjuqFsWOpAkKV
 RyFUE5Ftr+KpmCTxLA2QzHom0KiwCfqojE5PywsTxP4By4uCdvTtVegA2uJA0nwZ+92aN9f/6qt
 1RqR1PggUihg9HoxdMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7582F32F411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/25/2026 5:00 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 1 +
>  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..39b06de6c3e6 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
>          select V4L2_MEM2MEM_DEV
>          select QCOM_MDT_LOADER if ARCH_QCOM
>          select QCOM_SCM
> +        select QCOM_UBWC_CONFIG
>          select VIDEOBUF2_DMA_CONTIG
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..d10a03aa5685 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,8 @@ enum domain_type {
>  	DECODER	= BIT(1),
>  };
>  
> +struct qcom_ubwc_cfg_data;
> +
>  /**
>   * struct iris_core - holds core parameters valid for all instances
>   *
> @@ -52,6 +54,7 @@ enum domain_type {
>   * @resets: table of iris reset clocks
>   * @controller_resets: table of controller reset clocks
>   * @iris_platform_data: a structure for platform data
> + * @ubwc_cfg: UBWC configuration for the platform
>   * @state: current state of core
>   * @iface_q_table_daddr: device address for interface queue table memory
>   * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
> @@ -95,6 +98,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*resets;
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
> +	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;
>  	dma_addr_t				sfr_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..492f85f518eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -10,6 +10,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> +#include <linux/soc/qcom/ubwc.h>
>  
>  #include "iris_core.h"
>  #include "iris_ctrls.h"
> @@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>  
> +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(core->ubwc_cfg))
> +		return PTR_ERR(core->ubwc_cfg);

Afterthought: This change assumes that the presence of a UBWC config
implies Iris UBWC support. However, some platforms (e.g. qcm2290) do have
UBWC data defined at the SoC level but do not support UBWC in the video
firmware, which could potentially surface during SYS_INIT if UBWC is
advertised unconditionally, so this might be worth double‑checking.

Thanks,
Dikshita

> +
>  	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
>  					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
>  	if (ret)
> 

