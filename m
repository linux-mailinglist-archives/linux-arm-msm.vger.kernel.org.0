Return-Path: <linux-arm-msm+bounces-107155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOlfMMNqA2rf5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:00:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C55267E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C32A31630B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5793C09E5;
	Tue, 12 May 2026 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxEanmOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgDBly3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32C3EDE53
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608337; cv=none; b=Ae5ZExu3Hwj6XqlBHVloIpSGlWjACGpZfI89B42EyRg7UPCQEGn49kVKRa8imf1tpGRS0q3rZP8BpY8L8G3S1D7orO9SzU8BgHy0Er2HV1U99LdEBIAkozGAM3iJ5UYqHwFhkDck4h9iGchfkCMGu3HDlSoRaRnsKK3Cn6clu9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608337; c=relaxed/simple;
	bh=FYBpb9HDMk9zYyD3R2L2DWIXBNaI2qIxjFxCMRHjhVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9EltXLLPHE85Tu2/zWgBHn9ZkI7GDXikU1WkMhL6iKkskOVUdpqmffUDJiDm7YwYCdFfu73IAy2an9Sc/r+ZUm38tycgI3fGvtEyZ5ECIYCxasEIBI6Hn2XYXXRvQUWTpQ4+5nXKPrHkB3kkD1D7BZ3tBHvGR9fbQNGXH9JPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxEanmOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgDBly3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCL3iI545270
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iuRKzl2H0S+sNsBSVPSenDJn
	kKJASVZxZOkqN+6UxY8=; b=JxEanmOMqnqrnO+EMypBe//BbDoXFa9dy8sV0lgy
	W/bX3CdfQbq/stXONqjB6nQt3/w55LS4AhU4wAJwLtOLvPsqCb77LvsZ8Q8LqAd+
	IVKySt2HWDfQ2C8pF65RphyjOwKQlDdMcjVJ+YlbXC+skCodKwuhzok8v8nSXz5M
	ddnxAFZzNbnGzB/HVdFEa5uLVA3lxTyFP5WEVzo+LK/uTi6hsOXABkR95agaYF9Z
	6b0U5EWNA/GxNLfPW/Fu2CP/m2QUVBOZjkiTExY+UVakJl6tSN9CqMMfCjQmCSHt
	4tU1GE0ZyT99dNVJqsAcYPcQCgySDYufLB2o7NxrT0Gb7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444ss9vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:52:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so98266751cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608334; x=1779213134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iuRKzl2H0S+sNsBSVPSenDJnkKJASVZxZOkqN+6UxY8=;
        b=RgDBly3bWrV+S7HkHz1ct1wQaXGnqQDTNfAl6x9LCmppj4jhQQ69+QdU0DYb2jOPuI
         xQWsvfW3LaUMGBqcn5FrAG6NEOH7pWPx3JUDwDvrlMfWKbdJwbyVA6YJlDlq7osxGZd+
         bXltPOTX/HXZWAzbf4g4W32cs6qLLPdDesJg+e9pLhBQuIoEOxH0LvTkDbcvN1w1nnSN
         p73Ld+WFv8NU1Z1//kqCs0YOrUS6pnRtlhFmFWutij1ZIY4viHc94Z9Qmi4O2PkE8UYs
         yMY3SHvoAVB6zTiLq6U1J9AnLyh3t6MJWVwxDRBeqgnlj9dvqJ6WrHIN2hMxzBch0k0C
         gSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608334; x=1779213134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuRKzl2H0S+sNsBSVPSenDJnkKJASVZxZOkqN+6UxY8=;
        b=a2PGLEbJ841vslBASyZ5rfSATlPDpIcbWLPgWXXkSrH3qKrR1BwcDMZT+g0hdGKzrc
         u31idtlYzeB9N7Fh2ZlYmNGWmUuIRnrs+zhhR2NQws5rpNTo+qYMMWwi/jaNuEVgyXs3
         7f83Vb9vmW3qdIuQE0Ux8fyH95yNTBLPhf4yxJAVoeeU/GLAV7FGQ454LSGwHlY9eYJB
         q9SAFvhTRnBuvRWuVTHklSpeMtDPnmNCiMWM4DICdgVrF3CExNutfcuts/cdR5vXUgIt
         K9v6ceZKnoCwJZs0cZYVHAgPh7APxOCv20etMAw2zx/P8/BgUjPXgYfhz6OJTfjPu/2F
         vLPw==
X-Forwarded-Encrypted: i=1; AFNElJ/LXrKPRtIfNvhjNtBUcWxXf4QJTVRskGdmqXU5/JX9Q03x7Imm5aWxA3r1f2NQTmKizbtdRinxN2SNrPPN@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmv1M0WfaWJtDnIsGfN/s+xxOzNKC+Y4x16Xm/E22lmdLM9qG
	fTuVrfrI8p+NgS/88KoFfxACweZ1sNlVA1dMIFaE2CGZf7wZxIQvN99+DoO0AKdn3hYzhmvyfTN
	PsnYYJuAROooMuB1O4t1SUx8qnPBpY9v+lhudhxU2Gagm8O+0DKfqpqcU4jXHKDdYZcNP
X-Gm-Gg: Acq92OEX4mgen2joyCg1IQZK5dDjQ73S81HwviuEi0a8sziHD/+ZTSWnv3L9jlJS6ca
	USrjPBSoeLLFxiX19iig2mti95b38kbS1anUHbbtAhgEd9GZw4tA405eQQURMO66Fo1B9O8q/R/
	+rNmuGj+oISBg1RINfhIu06v940IFQ2eS4O0HsMKmE/jdytlQjth2Uf6Oa5OSG5C+BFTaETIumy
	z46oH/RoIdQNjwL341QMz7VYYB1D1YFEwnL/KSVUT0R1UUckFuteGhiBWN4gXUKOVowB5MWSk1K
	JZn7XUB5B1ndnuPeQ1Hc+Z0qg/eW29zvjNG+RVVEqa4pjmnyIjLKna/Tgh3+JXs8lD+eN9Ps2B6
	qcAtGtR+JyohiUoNpit4l4DtXYdBBY8MTUsdw5e4PIb545xcUMU9bi7fziQ54roDfGwiZn4yqiD
	k55EduTZr65DFIsoX8jt3YW0XKWkj4IGb6ZU4=
X-Received: by 2002:a05:622a:568e:b0:515:6c6b:48a0 with SMTP id d75a77b69052e-5156c6b4a29mr21482531cf.28.1778608333910;
        Tue, 12 May 2026 10:52:13 -0700 (PDT)
X-Received: by 2002:a05:622a:568e:b0:515:6c6b:48a0 with SMTP id d75a77b69052e-5156c6b4a29mr21482231cf.28.1778608333423;
        Tue, 12 May 2026 10:52:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6292993sm34234081fa.41.2026.05.12.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:52:12 -0700 (PDT)
Date: Tue, 12 May 2026 20:52:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v6 6/6] media: qcom: iris: Add intra refresh support for
 encoder
Message-ID: <ixxau44iyaf3oiro4csw2i6iabcgnmhacc52ee4t45muxbidsv@yi3trwpyk2sr>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-6-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-6-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-GUID: eh5yGp4GZzBDgI-R6YyVCRjAg6F6-2Y5
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a0368cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=bhafrh2O5digpgmg_hUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eh5yGp4GZzBDgI-R6YyVCRjAg6F6-2Y5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfX54u33FzttMlf
 BoV9dECy9bytOioQzR+Noz5dtXrTvK/pKv7QMPkKTmEjywJDja71RMU7MzdIm7neAoqJRDSiAeM
 T4+SpjVEVKdyDRJxpccvKqHErJWCwigt4FCVSoZeGxwqI/lNvYQIFid7zcg+QvJSAOBFHWBmZci
 p+3o8lex6/MoXeukOPYk/pKrEr/bKDuhfsgdfPlZw2e67ZrEtUs50759Qou5Kz8Oagy2WGRxHTm
 6WyZyCea1zNYl6P4tzhrzyn1u8ueSvqvjrqkX6B95mQxjA+EEKKxKRliaR/nhy8/7FLtWAHMzY0
 idXt8XNMsFvKjeCAFkUa+o+kYN4yQLDWhDrtEgg/XfLCm3vkJMFsVNlQZi21z7dH8UQ81YuGWtt
 7LSl75q0wEkVTrw+V0JBvQ2AHygMuPsF7SY62Qci2aN3EnbP8vFWMHmoOnRdJ+BIjlf4irZwBr4
 V5PYx5ypqsCScLdKPHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120185
X-Rspamd-Queue-Id: 5D1C55267E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107155-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:09:03AM +0800, Wangao Wang wrote:
> Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 34 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 ++++++++++++
>  5 files changed, 58 insertions(+)
> 
> @@ -954,6 +962,32 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  					     &hfi_val, sizeof(u32));
>  }
>  
> +int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ir_period = inst->fw_caps[cap_id].value;
> +	u32 ir_type = 0;
> +
> +	if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
> +		if (vb2_is_streaming(q))
> +			return 0;

Comment, why. Here or in the commit message.

> +		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
> +	} else if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
> +		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, ir_type,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &ir_period, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 355a592049f3fcc715a1b9df44b4d1398b052653..9518803577bc39f5c1339a49878dd0c3e8f510ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index c9e93d97fb01ec8d9c4b38ea932aae21c1df0943..f6a214a6815420f299be70f80732943d02168f0c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -70,6 +70,7 @@ enum hfi_rate_control {
>  #define HFI_PROP_QP_PACKED			0x0300012e
>  #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>  #define HFI_PROP_MAX_QP_PACKED			0x03000130
> +#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
>  #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
> @@ -108,6 +109,7 @@ enum hfi_flip {
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> +#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E

Lowercase hex.

>  #define HFI_PROP_OPB_ENABLE			0x03000184
>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>  #define HFI_PROP_END				0x03FFFFFF

-- 
With best wishes
Dmitry

