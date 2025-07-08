Return-Path: <linux-arm-msm+bounces-64099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63921AFD6F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 21:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE3CC7A20D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DD12E6131;
	Tue,  8 Jul 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgkXyHE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB56231CB0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752002087; cv=none; b=c9XvnFH8V5Ni2OoYuQb5WQsschdhO/nIxhKmZHJeTDU5crU+tB6fMhaL2B5JA7KiQOjHIlKIhJ82bi+V8LuM54HZuCjit4SBqix5/C+xP2bpccQr8rUiRwEwicXJxDJTNcLoq6jwBYFDDfcrBLuWl8qAovqj4h/OAkQnkfVpkJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752002087; c=relaxed/simple;
	bh=yTOZAPMsoe5+fKbdKjOJ2dVMNlBbRsFkumzf5eTtik4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U734O61k1jwdOmh8msWnyijIwc+1GStgLA12d5lG2+mHhJpe4LdQo/BGha+OqrwJtJxeMK7rDp5LG3OULR2tVgWfxpWdZgQ8tq6z8+3QqP5vm4a4sAjO7FeuFSAvdyhqP1ABs3B16kuTup+9auMmymY3i8l9BkATladafjU2ceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgkXyHE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AASI2025447
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 19:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s6sweIibZzuLyvT7LgYCKqa8
	QknohbGZn8LFyjJmRHo=; b=IgkXyHE8bpD6wo8L986OyPyuh/veJE6qipX9ghlq
	F12Q11vqh35MnGL1tnAdyuQmuZ8aBfA1zUveUIoVrRGm+LwiXQLxahKuU7XtHlBU
	SGtu8UOyTxi14MNr9RC5oF/BwDVa911qUQsmEGIusw9tfMYeEgnHd3O2C1ss/gdg
	Nzye02ZZzhRdtE9xxiNwe8/MPIkYvwAgZnIhPFJ6UDhnSf+dBgwx9R2Y2JBNC/8V
	Ilath0S7BC2FeiTaEz3+gPk3WKz9zvDyagY33r3bYyAhR6Dl3IfylVD8OCQ59Egd
	e9Fa491z63FMikiacijdekuKJ8uwBeAA0htQ9rU1yE4LWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wgyp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 19:14:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso665146185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 12:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752002083; x=1752606883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6sweIibZzuLyvT7LgYCKqa8QknohbGZn8LFyjJmRHo=;
        b=odlXRFivHEe1GRcNE7kSWlyxDkjGEIfk39ZwKvu2+ruz1w7AS4RUcPhwK8CApLT17l
         GLUlgtppErFL0m10Szq1xWRk//PIQmN4+EJxgV2FuK+6Wk7pMmNJ/f4DvsOMduqIhMM/
         /JSCPlVAfqpg0FMK701YAvdKtWxArsNKPjPBx5z7us4QmLwdC4eBqZCSdEz5FSN/ZGIo
         cgEgpgN48J4KxKYVN8iCZ5cIxoAtARupqYMVtWbx6j0N9TFKEMZ+Q3C8YMZgvMttXj5o
         l4USIswqigH1XFl9SmkureYczfFWZxqhuEzyIAnPaaizT2XaPfBAONHjbqwfT7agIKvi
         /LlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/0TVXdh1431KmabfClTXMhjnpGUT/LK0mvczBG6V3UNK8xRbgmqg9MMCddRpnYsv8y7MQ4BQXtcqibdNc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XrFDMk2CIWrCtrQKzaJdVniS6qSdKB1JECoCuCLJRaItOeK/
	2tIKA6pfIDAf8oPINefKSJDnm3ZllGfkwZkikNwQJrJk3sH5ROIsQOgqEaLAj5uRHeqJ+EwvX0l
	pxY9mF9KJ/37lKEWkn4sPEcChoPLdQt+TyhDVz8dBXKIUfsO5t/R+H5mGuVCm1SRPFpzSxj3f0A
	MN
X-Gm-Gg: ASbGncvk/UhNGVDVx5i2RmvQQ91VTKueSYcq3EhO238cNd9zCWLEAEjgovahCpzXOgx
	mNbFlk582UwHZbOjKEaghPCFq8q3J2l+0PiuBIyYmhnaZvCcdLPPKCS0tswOxwSbQiAMZjfc++b
	necTG9SoY60Df6rDu1B9gO6nsbEhoE7AnfamVA4rQkzvIlIo5zF5jQLLlpjIhx98wArN+hGKhXU
	88f9Hwi0S2DnGCTHdo4j4rwyUIpUcsbl+1/qbqTh4/6/TrIgfZx6jdba8Oj4znPjUOL7nTHVfHu
	A3gmsyV4FH0ZsG7nrDQm9D448E5DeWKe9wyrH5PjkhTLbJ+MA7haoXI=
X-Received: by 2002:a05:620a:17a8:b0:7d4:4123:6609 with SMTP id af79cd13be357-7db48495343mr85709985a.39.1752002083431;
        Tue, 08 Jul 2025 12:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkrbyx6qD2iCJJQ7I74J3FC4AKUVc3hV41rPej6LTPGifAKMpwCEuISsqpaoLYMX2IZohJRw==
X-Received: by 2002:a05:620a:17a8:b0:7d4:4123:6609 with SMTP id af79cd13be357-7db48495343mr85705185a.39.1752002082914;
        Tue, 08 Jul 2025 12:14:42 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470f871casm13738302f8f.45.2025.07.08.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:14:42 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 8 Jul 2025 21:14:40 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] media: venus: vdec: AR50_LITE video core support
Message-ID: <aG1uINWPwvl505zG@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
 <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com>
 <aF62Msej5LvY51D6@trex>
 <8c7232a3-8c49-d77e-e8e4-6d86a33e2b42@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c7232a3-8c49-d77e-e8e4-6d86a33e2b42@quicinc.com>
X-Proofpoint-ORIG-GUID: KWrG7pguuUbKCvKKfHgjZ1MPaUCPKgmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE2MSBTYWx0ZWRfXzzHXix+1Hz9F
 z5rUdE/bBhODdb0/7EXjJnmW0AaYBS3bsYQCIj9Jd+5e+6HHxn6ZvwiJJRHx3DZLgv7cC8+1UhG
 CX2BO/yD7Y7jKvrysc8AgVz6MHTtNvHMTEF2MaOlzmBLtwxFVvUfTJKaTfh0S5K+9FASe2cBrhx
 2cRY6PpY2YG9QpsXC32QR/vh0ySymMcWFAqupWOaoLyYkC73eBpi30D1ySE/yi03LXQN2o6HeuT
 CR0ZaCqDTINzDXeBa7f4Hu2YRa2+n1L3coRJdjAzto1Nt+qkAfg+bQLMzr3tr3u58LLFDaXGFMm
 DsNPAc5mrzQnBvtSqjb1BuqbEAMalc/nRn1gMFE9eUK/C44+bOGyQED9wCYCgKAsZXcIwcrqVkU
 BUNlape6rA8iKMPyskvdBgaVXy9dPftbbrodq19omnAfMORVM6qyaCpIaTktrtlCg40VS1sq
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d6e25 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Ewo0kaykH6HURsZHw64A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KWrG7pguuUbKCvKKfHgjZ1MPaUCPKgmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080161

On 30/06/25 12:17:32, Dikshita Agarwal wrote:
> 
> 
> On 6/27/2025 8:48 PM, Jorge Ramirez wrote:
> > On 27/06/25 18:17:27, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> The AR50_LITE is a streamlined variant of the AR50 video core, designed
> >>> for power and cost-efficient platforms.
> >>>
> >>> It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> >>> formats.
> >>>
> >>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/core.c      | 11 ++-
> >>>  drivers/media/platform/qcom/venus/core.h      | 11 ++-
> >>>  drivers/media/platform/qcom/venus/firmware.c  |  8 +-
> >>>  drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
> >>>  drivers/media/platform/qcom/venus/helpers.h   |  2 +
> >>>  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
> >>>  drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
> >>>  .../media/platform/qcom/venus/pm_helpers.c    |  1 +
> >>>  drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
> >>>  9 files changed, 128 insertions(+), 24 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>> index d305d74bb152..736ef53d988d 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.c
> >>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> >>>  
> >>>  static void venus_assign_register_offsets(struct venus_core *core)
> >>>  {
> >>> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> >>> -		core->vbif_base = core->base + VBIF_BASE;
> >>> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>  		core->cpu_base = core->base + CPU_BASE_V6;
> >>>  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> >>>  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> >>>  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> >>>  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> >>> -		core->aon_base = core->base + AON_BASE_V6;
> >>> +		if (IS_AR50_LITE(core)) {
> >>> +			core->vbif_base = NULL;
> >>> +			core->aon_base = NULL;
> >>> +		} else {
> >>> +			core->vbif_base = core->base + VBIF_BASE;
> >>> +			core->aon_base = core->base + AON_BASE_V6;
> >>> +		}
> >>>  	} else {
> >>>  		core->vbif_base = core->base + VBIF_BASE;
> >>>  		core->cpu_base = core->base + CPU_BASE;
> >>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> >>> index b412e0c5515a..e755a28e919b 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.h
> >>> +++ b/drivers/media/platform/qcom/venus/core.h
> >>> @@ -382,6 +382,7 @@ enum venus_inst_modes {
> >>>   * @lock:	instance lock
> >>>   * @core:	a reference to the core struct
> >>>   * @clk_data:	clock data per core ID
> >>> + * @eosbufs:	a lit of EOS buffers
> >>>   * @dpbbufs:	a list of decoded picture buffers
> >>>   * @internalbufs:	a list of internal bufferes
> >>>   * @registeredbufs:	a list of registered capture bufferes
> >>> @@ -450,6 +451,7 @@ struct venus_inst {
> >>>  	struct mutex lock;
> >>>  	struct venus_core *core;
> >>>  	struct clock_data clk_data;
> >>> +	struct list_head eosbufs;
> >>>  	struct list_head dpbbufs;
> >>>  	struct list_head internalbufs;
> >>>  	struct list_head registeredbufs;
> >>> @@ -520,7 +522,14 @@ struct venus_inst {
> >>>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> >>>  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
> >>>  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> >>> -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> >>> +static inline bool IS_V6(struct venus_core *core)
> >>> +{
> >>> +	if (WARN_ON_ONCE(!core))
> >>> +		return false;
> >>> +
> >>> +	return core->res->hfi_version == HFI_VERSION_6XX ||
> >>> +	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
> >>> +}
> >> It should be HFI_VERSION_4XX_LITE for AR50_LITE. 4XX represents SC7280 and
> >> SDM845 which are AR50.
> > 
> > ah good information - where is this documented? I never found this
> > information... I'd appreciate if you could confirm with some document
> > for future reference.
> > 
> >>>  
> >>>  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
> >>>  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> >>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> >>> index 66a18830e66d..f8dcef0426ac 100644
> >>> --- a/drivers/media/platform/qcom/venus/firmware.c
> >>> +++ b/drivers/media/platform/qcom/venus/firmware.c
> >>> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >>>  	u32 fw_size = core->fw.mapped_mem_size;
> >>>  	void __iomem *wrapper_base;
> >>>  
> >>> -	if (IS_IRIS2_1(core))
> >>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >>>  		wrapper_base = core->wrapper_tz_base;
> >>>  	else
> >>>  		wrapper_base = core->wrapper_base;
> >>> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
> >>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> >>>  
> >>> -	if (IS_IRIS2_1(core)) {
> >>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>  		/* Bring XTSS out of reset */
> >>>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>  	} else {
> >>> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >>>  	if (resume) {
> >>>  		venus_reset_cpu(core);
> >>>  	} else {
> >>> -		if (IS_IRIS2_1(core))
> >>> +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >>>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
> >>>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>  		else
> >>> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
> >>>  	void __iomem *wrapper_base = core->wrapper_base;
> >>>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
> >>>  
> >>> -	if (IS_IRIS2_1(core)) {
> >>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>  		/* Assert the reset to XTSS */
> >>>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >> No need to handle no-tz case. Pls drop.
> > 
> > ok
> > 
> >>>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> >>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> >>> index 8295542e1a7c..812bec9a05be 100644
> >>> --- a/drivers/media/platform/qcom/venus/helpers.c
> >>> +++ b/drivers/media/platform/qcom/venus/helpers.c
> >>> @@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> >>>  
> >>> +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> >>> +{
> >>> +	list_del_init(&buf->list);
> >>> +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> >>> +		       buf->attrs);
> >>> +	kfree(buf);
> >>> +}
> >>> +
> >>> +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> >>> +{
> >>> +	struct intbuf *buf, *n;
> >>> +
> >>> +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> >>> +		free_eos_buf(inst, buf);
> >>> +	}
> >>> +
> >>> +	if (list_empty(&inst->eosbufs))
> >>> +		INIT_LIST_HEAD(&inst->eosbufs);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> >>> +
> >>> +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> >>> +			       struct hfi_frame_data *data)
> >>> +{
> >>> +	struct venus_core *core = inst->core;
> >>> +	struct device *dev = core->dev;
> >>> +	struct intbuf *buf;
> >>> +	int ret = 0;
> >>> +
> >>> +	memset(data, 0, sizeof(*data));
> >>> +
> >>> +	data->buffer_type = HFI_BUFFER_INPUT;
> >>> +	data->flags = HFI_BUFFERFLAG_EOS;
> >>> +
> >>> +	if (IS_AR50_LITE(inst->core)) {
> >>> +		/* We must send valid sizes and addresses */
> >>> +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> >>> +		if (!buf) {
> >>> +			ret = -ENOMEM;
> >>> +			goto fail;
> >>> +		}
> >>> +
> >>> +		buf->type = HFI_BUFFER_INPUT;
> >>> +		buf->size = SZ_4K;
> >>> +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> >>> +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> >>> +					  buf->attrs);
> >>> +		if (!buf->va) {
> >>> +			ret = -ENOMEM;
> >>> +			goto fail;
> >>> +		}
> >>> +
> >>> +		list_add_tail(&buf->list, &inst->eosbufs);
> >>> +
> >>> +		data->alloc_len = buf->size;
> >>> +		data->device_addr = buf->da;
> >>> +
> >> why this special handling for eos buffer is needed for AR50_LITE?
> > 
> > this _fix_ was develope through testing: without it there is no EOS and
> > errors are reporting upon killing the player
> > 
> Would be better to see why there is no EOS from firmware,
> there shouldn't be the need to have a dma allocation for this dummy
> buffers, as there is no useful info in the buffer. Having the device
> address as 0 or 0xdeadb000 should be enough.
> 

hi dikshita,

I am still keeping this on v6 as per our internal discussions and
because v6 is quite different from v5 so wanted to provide early access
to users.

if the firwmare is fixed to address this issue on time, I might revert
the EOS page buffer. 

TIA
jorge

