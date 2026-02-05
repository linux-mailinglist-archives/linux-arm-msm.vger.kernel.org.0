Return-Path: <linux-arm-msm+bounces-91904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNypF9p2hGkX3AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:54:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AACF17FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A001300D616
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38E63A9628;
	Thu,  5 Feb 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pocazJaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAU0bOyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2663A9630
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288855; cv=none; b=mlmrGbG1Hr/7mt14zjYkO1DMCTnhHBzg/Uq5tiPEjupTw3QkCIKIbf+sOOo698bfoea+DeSdJo7KVBwkm7Cpd5Q7JLtChrnfn8fnMmQJToavJJ+t89A3EBT92hRwrwdtzrFC0x3ky+udcqMG328mrbad/Tl6pLscF+++guhIUmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288855; c=relaxed/simple;
	bh=XN3AefHVV1w1311IsRNSz0cW8wrQDOhcNHRadh+OqFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+j+sBbpopgk2rtH5kVBG0NTdF3Z1l2c/u6m6E4mLAKR4lg2imZJ5fDKBhGKA4+KxCrx7/col0p2Oc0cB86nebfFwlqoz0hAePGGHoWJVJZCjxs0CckTd6DkAcJOZUEE5pF3RsyEs2rByWTC/fxHxk11/TwsaN/GGzPFn9upu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pocazJaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAU0bOyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61555uKP3047940
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 10:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whLr7MW/Mdk+IVxtqqbQLigwg48uAWjJvV3sO+l24hc=; b=pocazJaVs+eZZut+
	QU++ELg8P1m8fQrrVG/6GmqEwEsu/HsmgVXjTPxyiKmcxzkqu6p3LofmLjcHjcTe
	kL/i4x8ars9dHFTTuk1w2hb3PBPgkOy6ukhyNt9IAl3vbr05myNt3DENqu3LHtED
	lh6pN4U26sUxwjZUeY/aBq+rzJYX3vVevJD2OJjjn2+nYfilc09y3+L/H7Mc4ImS
	Y7bCEeywJqCccUbKJNea+yYEZnz+KxED0RNBMAM6H/tIjqtWgz5GmwiHu3UeL6mj
	UltVxCootUVyzgt+QHOC1bWdri+/7MgcBqmq0YxwnvmRGEfsSaBRIs9SHJlLXaJP
	FAwM5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4mrth0r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 10:54:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so71302585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770288854; x=1770893654; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whLr7MW/Mdk+IVxtqqbQLigwg48uAWjJvV3sO+l24hc=;
        b=RAU0bOyxNNR/dX2xHpwOJ9fFBHHZ+XEyWX0I+F0sTCxSnrTIiYSYRba6BtNaJyVknK
         lZtDcguGVbindRiiKi1jtD6QMW/VXZpQQLodQV6LuWFSwgHu1b0CDefuWnRHRyFznBYY
         9VqARoH8SdENHK8Fjeue1MVAEbQ/Fp9ydTFCjahPSo7vvzkIaHq9iGL0IL6MbDc29Jl5
         RtSnLwecpnmiznaNThuFM6JCUWQSAgC7TN1lyn+tSUIfdS+A7RnMhPoeWntPDZFj8Kv2
         4jUSoMRqM1PQDyID/WwOjz4lEUy7x402Wao/2pZYI3I1WFTPDmjwNYExF067FOE3gj5C
         PYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288854; x=1770893654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whLr7MW/Mdk+IVxtqqbQLigwg48uAWjJvV3sO+l24hc=;
        b=ubiSmK85H7qI5Wic7TlR9OsDwezfAPoBRAlrLHjEPscs5yKRqCKcLTzQijheS+gH/C
         NlmVoLgixOVyQNSt6HSz8Mv6ftolP94eZGb2R098CMqfbnN+z5PImyB8EVcz2MF7on6N
         9Ou4yiFVBmU6D0bi4fZvdgSaARk4m22KeewscDZsrvCIjVdoCGio9hR14QGtjUHLY4bx
         x9coY37brBg7yHUWXF4q2jJWf41dUsscWp0Z7HYxmisIp+2hLHnPo0xBZjFxgWINlivd
         65J0dQMbt2ecLC9JUNXky7YUKK0cW57mTY+umyIW9JUAnhTHTb3IZ/EI/0DY9pNl5rJF
         Ea/A==
X-Forwarded-Encrypted: i=1; AJvYcCWmdMud2P8nlYOE3Mqrlg2LG+RftHL5Hp8WkBgd1Jr8MFU7Atmc6yBBgo32mRBCfM0CUrHqo5DYFG1vHVjE@vger.kernel.org
X-Gm-Message-State: AOJu0YwU4gZy/ZHWbCqq6Fph+JbcqdyBnuZ4qhuU22q5ERsaVvLr0Uvm
	zE2ARUp7zPUWHRpzP1Jg54JsCu9ZFuSKZrDgDI6735cra3tG27OA+VT3HR3Sk0Df+1w5H/on1bx
	lIzWxkaPxVyLpjY8Ug0OfTHem1reXFLx8KPxYvNKf10xbbTeQDar4P/B5tdQUqKRnBg3D
X-Gm-Gg: AZuq6aL8D4nf3SLf+Fqew4A3xBry+BtjTK+LUewS1vclDa5bHHL6NeUw4O5NxT+CQe9
	ENX4oVG2xP7Wb0tILAeuNHvH+9pLLKmfX10reizT/EiVCzauAYCeHy3aCyO1d0kT3HkUL63MULI
	mx4vCOGXiuQkgnhtgRkj5ScgP9CR+R8zDDeVeFJkcU5EtnMUJba5s58f5H3ujCFqVy0Me5YpVLJ
	Sm9+vCnpSwtR+Ilfw4tbTrcS8zpjkhihPJE/G8O+5WSPNGBZMZshERiOTuvx6yivauEgq48rqCL
	J2RjrgKWEPvDi/j72ccACzVYp7BMVpLXhQDx/+bMNNAcjK3nEKN6hWw8HHunhxoutrHXih32gbA
	VD1rVLe/eJkj9E193/K0/nFYMIXtK8Es5YskO7Vha4IFm7MBvIT0oLlxpConVY+umof/us3jnvX
	Y/tUFdpHjxURzc/JDyoxMz6ig=
X-Received: by 2002:a05:620a:4514:b0:8c6:b45b:9e2d with SMTP id af79cd13be357-8ca2f84a08amr722012285a.26.1770288853646;
        Thu, 05 Feb 2026 02:54:13 -0800 (PST)
X-Received: by 2002:a05:620a:4514:b0:8c6:b45b:9e2d with SMTP id af79cd13be357-8ca2f84a08amr722008485a.26.1770288853076;
        Thu, 05 Feb 2026 02:54:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3881b3f9sm1336216e87.55.2026.02.05.02.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:54:12 -0800 (PST)
Date: Thu, 5 Feb 2026 12:54:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Message-ID: <d67faniik7jrlnq2a2wsyku3agpezh5qj4g4rip3j6pbeagmkj@xax6nuginypu>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
 <rhsmmvbxjzb4ylxryo3n6j6wf52tjpxxon6fww6tsfhxttc2g7@xfsnyfkqh3ke>
 <ec4348fc-b27c-9b56-2967-222e4e280c8a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec4348fc-b27c-9b56-2967-222e4e280c8a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MCBTYWx0ZWRfX6piUcL/hE3a5
 T+ax49/iLFh76i7svMfwqBZXQu1fB0KVfxZazRz+e18ZvpCwU5in8WktjyA7jyE6aeGXKgheiM9
 nhLkdmursB5zhZfSNe32QFaeHNmX57XKFPvfNpZUZdA+WhDh+VT8ihgHKj/DOn/pvxXroloAvn/
 1Jp8ocR/FnKiCeNxHe1FUF3zXk0kUPTE/BCkI4vpcVVbMgmfyiun3EmDz7/kNMIznVB/c7EJxNZ
 Tm2sJYbvhrJAc1ZzM8Z7Lv3Ft+A8wGuZlWzCAeH/Mf69CZBxQ8LUq2sYVq33VZo6YT/W06qNyvP
 17Vcrh4TKNaURze/v+6NTzPMJv5aWGq8cHg4yFut6SSuJeTz+p7busZjrjOoXtOOpishOoovHNb
 +FHts+igrwnQ0/NxU7p4cWVvwEbYaT5orIB3ufaXhx7wNu0w8sBltPuqqAcNFBbygCFOR9WG6Pn
 MdmJ0kCWzl4wxbJPGpQ==
X-Proofpoint-ORIG-GUID: 9Fx9-VQXc8f-szScrlyrbGbH-adXjpz1
X-Authority-Analysis: v=2.4 cv=UoBu9uwB c=1 sm=1 tr=0 ts=698476d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zUm9VW01pFyA6eDtYdoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9Fx9-VQXc8f-szScrlyrbGbH-adXjpz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19AACF17FC
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:40:39PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/31/2026 12:58 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 30, 2026 at 06:46:04PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> >>> SM8350 and SC8280XP have an updated version of the Iris2 core also
> >>> present on the SM8250 and SC7280 platforms. Add necessary platform data
> >>> to utilize the core on those two platforms.
> >>>
> >>> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> >>> driver is enabled, but SM8250 and SC7280 are still disabled in
> >>> iris_dt_match.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/iris/Makefile          |   5 +-
> >>>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
> >>>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
> >>>  .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
> >>>  drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
> >>>  5 files changed, 144 insertions(+), 4 deletions(-)
> >>>
> >>> @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
> >>>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> >>>  };
> >>>  
> >>> +const struct iris_platform_data sm8350_data = {
> >>> +	.get_instance = iris_hfi_gen1_get_instance,
> >>> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> >>> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> >>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> >>> +	.vpu_ops = &iris_vpu2_ops,
> >>> +	.set_preset_registers = iris_set_sm8350_preset_registers,
> >>> +	.icc_tbl = sm8250_icc_table,
> >>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> >>> +	.clk_rst_tbl = sm8350_clk_reset_table,
> >>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> >>> +	.bw_tbl_dec = sm8250_bw_table_dec,
> >>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> >>> +	.pmdomain_tbl = sm8250_pmdomain_table,
> >>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> >>> +	.opp_pd_tbl = sm8250_opp_pd_table,
> >>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> >>> +	.clk_tbl = sm8250_clk_table,
> >>> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> >>> +	.opp_clk_tbl = sm8250_opp_clk_table,
> >>> +	/* Upper bound of DMA address range */
> >>> +	.dma_mask = 0xe0000000 - 1,
> >>> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
> >>
> >> This firmware is not compatible with SM8350.
> >> SM8350 firmware is not released to linux-firmware yet.
> > 
> > What would be the name for the firmware? The downstream uses vpu20_4v
> > here, so, I guess, in upstream we should be using vpu20_p4, but a newer
> > version?
> > 
> 
> Using a newer version won't work as the firmware for SM8250 and SM8350 are
> different binaries generated from different firmware source branch.
> You can give it a try, but AFAIK it won't work.

Ugh...

> >>> +	.fwname = "qcom/vpu/vpu20_p2.mbn",
> >>
> >> this firmware doesn't exist on linux-firmware.
> > 
> > It was based on the assumption of having 2 pipes. If Iris here has 2
> > pipes, then probably we should still point to vpu20_p4.mbn?
> > 
> 
> SC8280XP also uses the Iris2 4‑pipe configuration, though its firmware
> comes from a different source branch compared to SM8250 and SM8350. This
> means we have multiple firmwares with identical VPU and pipe configurations
> but different origins. Could you propose a suitable naming scheme that can
> differentiate such firmware?

Can we have a single binary that works on all Iris2 4-pipe cores?
Or are there any differences between Iris2 on SM8250 / SM8350 /
SC8280XP? Are they stil vpu20_something or should we use different VPU
versions in the firmware name?

> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> >>> new file mode 100644
> >>> index 000000000000..74cf5ea2359a
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> >>> @@ -0,0 +1,20 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +#ifndef __IRIS_PLATFORM_SM8350_H__
> >>> +#define __IRIS_PLATFORM_SM8350_H__
> >>> +
> >>> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> >>> +{
> >>> +	u32 val;
> >>> +
> >>> +	val = readl(core->reg_base + 0xb0088);
> >>> +	val &= ~0x11;
> >>> +	writel(val, core->reg_base + 0xb0088);
> >>> +}
> >>
> >> you can reuse this from SM8250. That would work.
> > 
> > Hmm, downstream driver was explicit about clearing only these two bits.
> > Is it really fine to clear all the bits?
> > 
> 
> Yes it is. We are doing the same for other SOCs as well.

Wouldn't this also ungate / start the second core?

-- 
With best wishes
Dmitry

