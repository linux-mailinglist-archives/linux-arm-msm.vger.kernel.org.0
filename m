Return-Path: <linux-arm-msm+bounces-94533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN8EKHH+oWl4yAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:28:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB6C1BDA05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 025AA30304AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE205472779;
	Fri, 27 Feb 2026 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nK2X3KtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0KKTDsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B243376A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224110; cv=none; b=S0SXoItVOJbUF4feMH7K+pCq1hZaSeBz3YMeI2Qm6YrGF497hcaqH9/3U7+FlCCjoYwTqoLGpK0AZpT6VlpngMWv/pMqG4LESzavgfNGFurEbCXNBqVqr/m3MjLy5llOLQmijCSa/pIGcf0kHYr08CkFLf/E/AIWOK+R2dLoZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224110; c=relaxed/simple;
	bh=ubRpnnZCa3BtxGeTQH8/24NroyvQw+/jfEMurUW7GwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgxqdm+1WRnTLp66P90Dbag4aUHyR9LRo8r1ekUyps0vqAhjnbfAgCfMRAie6oPSbQfDG+lXm6gNGWcJoMn1QlTpfNsKd5m1howiv0dWSfm25LfN8FZsVN+497BqyyZtxxKHvSRxEHdyrqj1V9n5ER4SU1PTKpqxuis58XGs/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nK2X3KtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0KKTDsE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0GZp527257
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXz8uYqb+tpPwbAm+qmdqDbm
	VqPyxZKSrLTUZphOd/U=; b=nK2X3KtXtku82Y76wPMRZmUpj+8CT6L0uOmOgU3E
	L2BNQubsByoq8ptEwCyi5yH/pBdKpE3uCef79vOGcWJUbE0pDE0Q8/KxclSTQOgE
	vGm3V3CtiS3FodsjQ99+0YzzLBA2jZxABdWsJzIEAhOIGbfw7njRxnKhSY1W0Ib3
	AgNdgQApkYjlETglgOr2ZF9PBCRm3zKPPw4VO7V4EXffwXJdoZZ6XkKRVzIDnwep
	pglHMArpoTuAHbxb5x4uKbNlOBK9jR9kiIiM64RY1VoQI2TalU3hZ7EbRDW8yD1h
	ur0ZFOjaN1pimiJUixUXyJv5DYfLuJUN9PiXYsj9RV7tXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23c8h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:28:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso306752085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772224107; x=1772828907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXz8uYqb+tpPwbAm+qmdqDbmVqPyxZKSrLTUZphOd/U=;
        b=X0KKTDsETwXcZz7m4SyAsDyWFpbP1s+MYiBYwo0SxEIjIdLEZTq2HMUxY51WOIqqjH
         iqP81Hzcjl56zgWlhk6zV+6zDBqmK3l/07HisSphcc0uFsWn/9MOVBJ3kJ4ArFztqM+M
         DrOebXNxmH97mrRQGlDoWppN53kzRn3uk1gTEKsJUzUZUleuICDsUk5Y78blXerFHbPM
         jYvcKuf2R7J3bsl4dq7HnkYlric5q4QTwr8jPtuW2U/5U+42DIwoSgir0ubSzQqPt2hy
         xC7JIHvEx6Hz4faTuwTnqmMlNfU788EKhlOwCLeAfyVl5qlXiFy8o4yqGEGCWEFGjEeu
         MPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772224107; x=1772828907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXz8uYqb+tpPwbAm+qmdqDbmVqPyxZKSrLTUZphOd/U=;
        b=o5n0YWj/7aNu/0gEKH2emF3yyJTL8KrbIGy5vKnN80/DL7HMRybJYF825dlQMJc6DR
         YvwqHBTkHzjLMxMwhy8t0PNTiL4IQg64Y+xxNQ9U6gLFW4jDuaP9V403eDNxLkG+yWgz
         VnIDJnMJrDPV9JAGPrjK7stKgLCr4R99ubDGN56ap2CI5oUTqXO6pCYe0i31p1zwTROa
         /46SM8jNWxwXulQ83d32zf863l3RkUrAq+rGC77Yxp06o8ds3cxHNwb+SO2rbIl7xyfd
         hGl+yqS+txGO2/vbGXurAGmt9w9PXWJ6BlVpxJwiroua7h+bA3RGVlys7aFi6ZOn0ppC
         aJAA==
X-Forwarded-Encrypted: i=1; AJvYcCVG5ObmRRB8i5Wepeitydt7gY9/C3b8rL3B84kUadd7DmMPnmo76pmfuaR2QvqGs5rvCt8RLsvWILy7Qrtl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8sPVUPttZvZnhWpL3Wsty/7WMs5/U09ArCTq3x8vNike3rdq
	OwQzkyvxBlk1soGSa2FB25+15yxUrLqebksq+hyq1ryYwEa3cYZFk7ojQNVSjGkahvUoI0kc02u
	Oal521i8Ct2evmXrOThoQr2aMX/694onMck+pSiPoJZsxIF3qqmmxtIpm9umpBaEuIqDX
X-Gm-Gg: ATEYQzzBVUka6kIjEAfClbt7r0iGzINyL+1VatpMOyCbrJrjYD3Bp8gIT7JDBUOPUwS
	ewEjVBM3wXKda+BnKW76Md7RJTg8szlpXl0Fb75qiZX8e63qe2tvPlF1mG9rnM9FHZ+V6GBA8HQ
	uZ88482wtjX5wvjFXF7vRS88pcmZkGSFSiZ0Jcyf2uCBtswq0b+bCeBh0mAXGAs54+d68yQRyRu
	z153JcFePeji8pxM+rr/SwC1+OffEjPNRmyxXR0XmS6PJILgqomsPCTuOvdHw67CWyPD5tZfj5C
	B1dwlwKwQcd2T+Dmj5kmHStO/cILyc7+S7Ba7BHyYGAg2rsLY3S2OGcs91/Kc4sYgw7m5afia0S
	J14td5zqcrAmMu+veiX+wW1GdXJYaD2P3TkgqAAf07RjybdnD7pjDqC3PvwDs20WIywMtGVGvCQ
	ICXsKQJ1DYMuqvgR7jHe86sGVhi0HPgndTfpg=
X-Received: by 2002:a05:620a:4891:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cbc8e863f5mr527246085a.21.1772224107544;
        Fri, 27 Feb 2026 12:28:27 -0800 (PST)
X-Received: by 2002:a05:620a:4891:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cbc8e863f5mr527242385a.21.1772224107036;
        Fri, 27 Feb 2026 12:28:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30179e9sm15051161fa.33.2026.02.27.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:28:26 -0800 (PST)
Date: Fri, 27 Feb 2026 22:28:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
Message-ID: <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
X-Proofpoint-GUID: G2bk3XRDwlMPvOwbgUzV9zN_Nly_yN1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3OSBTYWx0ZWRfX7qrPTjH1FJ6j
 wv8iFsqVfngD3LxfspUHqBSPaFsxySyPOR71k51/7dDNVd7woac6EqSCw9Uj1AY4vyGNf3MN7eK
 r5gLhc+kMVCAIhv7ij/ip31mNtGqJFxWjc6dnjw7Lp0KzbuF56zmYP01INCTqDV2pseZPxfwhZk
 4tkLrhvNJfHE7alE4ReRD3lI/0OM6L5gOFzUQFuSB+8ccESmcrq1s8j8aq7YyrTnG8qJlfK2jP4
 1HVNeIekm+yjxI6XgabXhYLsGN/gPjD95lwwb8tkIne+HZVsJzEYSrcyiuqwFJZZMsdsBldjQme
 PJifLMuoOjh0pT77UPUso1tFWy9MdJ8TzhgOnNFJVcmAamiTC1q3emXSKkdlUfh0QizMInvIPqP
 uE5z865bmIW6nRFe7LbaGWZNsMQqGxSnq9Huin/X3Ofx09UPt6nNwHd7KcVpv82eWSvC41MY+l4
 9pYRwJ4VVv0ELhOrWOg==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1fe6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BuJnJetHAO0UpRBxyx0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: G2bk3XRDwlMPvOwbgUzV9zN_Nly_yN1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270179
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
	TAGGED_FROM(0.00)[bounces-94533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CB6C1BDA05
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
> The H265 decoder line buffer size calculation for iris4 (VPU4) was
> previously reusing the iris3 formula. While this works for most
> resolutions, certain configurations require a larger buffer size on
> iris4, causing firmware errors during decode. This resolves firmware
> failures seen with specific test vectors on kaanapali (iris4), and fixes
> the following failing fluster tests
> - PICSIZE_C_Bossen_1
> - WPP_E_ericsson_MAIN_2

This reminds me of the commit fixing SC7280 support. Should SC7280 or
all VPU2.0 platforms also use separate formula?

> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 9270422c16019ba658ee8813940cb9110ad030a1..a4d599c49ce9052b609b9cedf65f669ba78b5407 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1755,6 +1755,55 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
>  	return lb_size + dpb_obp_size;
>  }
>  
> +static u32 hfi_vpu4x_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb,
> +				       u32 num_vpp_pipes)
> +{
> +	u32 num_lcu_per_pipe, fe_left_lb, se_left_lb, vsp_left_lb, top_lb, qp_size,
> +	    dpb_obp = 0, lcu_size = 16;
> +
> +	num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes) +
> +			   (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
> +
> +	fe_left_lb = ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT) *
> +				FE_LFT_CTRL_LINE_NUMBERS;
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 2 * num_lcu_per_pipe), DMA_ALIGNMENT) *
> +				FE_LFT_DB_DATA_LINE_NUMBERS;
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT);
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 2 * num_lcu_per_pipe), DMA_ALIGNMENT);
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 8 * num_lcu_per_pipe), DMA_ALIGNMENT) *
> +				FE_LFT_LR_DATA_LINE_NUMBERS;
> +
> +	if (is_opb)
> +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
> +
> +	se_left_lb = max_t(u32, (ALIGN(frame_height, BUFFER_ALIGNMENT_16_BYTES) >> 3) *
> +				MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
> +				max_t(u32, (ALIGN(frame_height, BUFFER_ALIGNMENT_32_BYTES) >> 3) *
> +				MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
> +				(ALIGN(frame_height, BUFFER_ALIGNMENT_64_BYTES) >> 3) *
> +				MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
> +
> +	vsp_left_lb = ALIGN(DIV_ROUND_UP(frame_height, BUFFER_ALIGNMENT_64_BYTES) *
> +				H265_NUM_TILE_ROW, DMA_ALIGNMENT);
> +
> +	top_lb = ALIGN((DMA_ALIGNMENT * DIV_ROUND_UP(frame_width, lcu_size)), DMA_ALIGNMENT) *
> +				FE_TOP_CTRL_LINE_NUMBERS;
> +	top_lb += ALIGN(DMA_ALIGNMENT * 2 * DIV_ROUND_UP(frame_width, lcu_size), DMA_ALIGNMENT) *
> +				FE_TOP_DATA_LUMA_LINE_NUMBERS;
> +	top_lb += ALIGN(DMA_ALIGNMENT * 2 * (DIV_ROUND_UP(frame_width, lcu_size) + 1),
> +			DMA_ALIGNMENT) * FE_TOP_DATA_CHROMA_LINE_NUMBERS;
> +	top_lb += ALIGN(ALIGN(frame_width, BUFFER_ALIGNMENT_64_BYTES) * 2, DMA_ALIGNMENT);
> +	top_lb += ALIGN(ALIGN(frame_width, BUFFER_ALIGNMENT_64_BYTES) * 6, DMA_ALIGNMENT);
> +	top_lb += size_h265d_lb_vsp_top(frame_width, frame_height);
> +
> +	qp_size = size_h265d_qp(frame_width, frame_height);
> +
> +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
> +		ALIGN(fe_left_lb, DMA_ALIGNMENT) + ALIGN(top_lb, DMA_ALIGNMENT) +
> +		ALIGN(qp_size, DMA_ALIGNMENT);
> +}
> +
>  static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -1770,7 +1819,7 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>  	if (inst->codec == V4L2_PIX_FMT_H264)
>  		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> -		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
> +		return hfi_vpu4x_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
>  						  num_vpp_pipes);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

