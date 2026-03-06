Return-Path: <linux-arm-msm+bounces-95720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI4AFVCDqmmaSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 08:33:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67D21C7C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 08:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A516B3078EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 07:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79762374E54;
	Fri,  6 Mar 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ety+kbNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIDmOv/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60919F48D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782356; cv=none; b=Ls8432+AwOMywtVyw5vryNJ67stBXn6rD/1Bg6H0JvtcEfW1fqohNfhG5IuVjZfVW19OI9BBM1D2HTd3p0LqhkrZFyK3FkKWEQtAkRweh3vc7jEV3EBcV4U/Nw1sH21iYj9q6eS/YWaD1ubiO2RYGgXWazGXduvIFZ577DfhiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782356; c=relaxed/simple;
	bh=tpgJZD9BhZZwOvg6deOIgb1RW5iufiCtG9lQ+nw/0rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+M3vizmGhRBXxDCvtOqyB5k5f3LDnlDAODIWL67tGBbb7hxu585ey2bRc/8Zu3CbyN3bBNHGyYHwi14zglbScGJ0M8bXGZd7ff8POe4PF42oxDPKku9YWNzgR8I3dCcDOE8mzgxSnc2dJFEctaXkWaIDWm26f6SB+Vj+tOCPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ety+kbNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIDmOv/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62654QCp4193493
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 07:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcrAxZ50EJaIo3b1TWK5iImb/YTs7as0+cHos7uwlgA=; b=ety+kbNM29Nr63iF
	aCyD2gvy/f0DlDZknAY8SQkCfhBv+E1h/mKiJeeqBVohCL4SodR9vis2yiOkQ1cX
	ghJ9T+dLsObBEEKYCE52B/kSp9Fy2BBBMHfMRPgw9BY3oVlGuEXpvw2Fq5aJtC/6
	bscbmm1q2rUv1j6FzDWq8E/VW8ZTHOBwa7i7UwXdmsg8QoG3WRWr9u/yLG8zre8X
	5NYFzADpyGvioDBUAcEecddbGTa7DCh1v1PeuwHOALI3QjQcSPdTDqstH1cbl+04
	Z74d2pnQOumNF5Wk9QT41chA9Y5zYhcmZ27H0iGTmGMQTB0ac0u/RAf/sEfDsqh4
	DZHP0A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5rf7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 07:32:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82743548947so19844683b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 23:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772782352; x=1773387152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcrAxZ50EJaIo3b1TWK5iImb/YTs7as0+cHos7uwlgA=;
        b=XIDmOv/G8pNY8GI+QN4xB+L6rNAs728rtAinPeWbvv8kj9/NPAUq2YnO0PBizNFhXp
         qbpV4yLx5rWJCyjB4D5zTHITX2O4LMbFwecWspU6jxyEUNYclMAiFT9cqn2BmOxOLViG
         EhPFEieoZMIHj/BM1evgVTrmbDS6sNT1S8VLvOFSuctQ2+ykEZa0Ycb2Mr6K4lYx07N1
         R3Q48qIywc+0OQIx5XCycWK7cKIPg0tMRieSuUCHhckKkn2Jjn0NZ+QobYwqy54xPuN+
         S92Xq3YOs1zHW0wid/UUxjwfMcCdU7aLDThEFCAKqcWKXf+qhHXw0EA0lFlmq+xMkvdn
         nrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772782352; x=1773387152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcrAxZ50EJaIo3b1TWK5iImb/YTs7as0+cHos7uwlgA=;
        b=uLU9vRxop0eslcCKBAFyFtXLCFCGU6P5jCTCHlO2y5EK55Eto1T4lx6iqLDX4c+ZRD
         ilsY0/k6xyL2Al3wjFayZz1u+rry9Ps1ZTmJL6ONzPy7n7VFHF1tpYAjss1EVSgRgY3R
         KIopiJibxvjalrrHJLN6xJXsUSTgowy0dBimI/LziotrHnwefgCJ/B6dK+BERgeTuh0E
         x/xZ44EQO8IdGnSanz7w5yxzIMqgtAZ1RoKkiK7ZwOrTXvqM4QINlI+bxPfdM6tr3f8j
         qVNWViKh5wvCmEPy5zeTgJukARa6NAmYD+dGtOgcDAsBr93HUDuWAPrdvQ8sBmJeiFPy
         Uwlw==
X-Forwarded-Encrypted: i=1; AJvYcCWuupaTMx7gAlMiKzsylQfGATRpZhKaSW3qG+Wy4Icx/s21oxy6vKpzRr0fKFForlKAIy7g51wBZLPy+B2p@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/+NiK6FflpS66tBsGL1uTGVb/P+lAXjUFo09XqroBduEYOG/
	qhqAV/koEGyovbmiE0y4dwCuJfJBVTAOAPftF+QvkQs0xRYl87w9quYRaQLiX9TXc/eND9kgEpg
	/YTVSJIknEdqqDQegpEwvzq5EVxxnDoS2/mS9H0IVNmSKB7p4QJxzKubnjDT4i7b4JgvA
X-Gm-Gg: ATEYQzzaAPH+Nw1B1nVvy40FffsYrjGpH9/Qqh+g3mLpK/bspMxIzfUi4iPrP0aBbGo
	KPVk8/K1yqYy+nwN6FbzAq0kVBfvburnECO1pFr0F3r9Mmw2KFAXYdTLVsNyICRpQsisBG2ANrG
	k+nY4xuK6uPxrV7fMiItbSHWzlP91ecVGBiDIsYXwoiwPCV4S4KnU11KoXONuriGL2iX+Hg0SfH
	bLNDIUZfpykTmM3qKegfhTpfIkFUkj/cyK0rQ5g53YGn9upw4K4+oop8+DwhnhaFBgz119/ZJmI
	48HLUYVC1ndX5DZUTEHAh50CcmpxT7ylqlrXQ5UCKBunSlxOZPxuaAeRWKZSA2ZNk0PB4nJU5HE
	EhCTaMogBsPCL1BmRPq2rbGQplxkhNwRL1n7NBhVFNnIpOf2a+x/ymw==
X-Received: by 2002:a05:6a00:1408:b0:824:93e4:2de1 with SMTP id d2e1a72fcca58-829a2eaed31mr1188480b3a.30.1772782352403;
        Thu, 05 Mar 2026 23:32:32 -0800 (PST)
X-Received: by 2002:a05:6a00:1408:b0:824:93e4:2de1 with SMTP id d2e1a72fcca58-829a2eaed31mr1188443b3a.30.1772782351689;
        Thu, 05 Mar 2026 23:32:31 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4867e75sm782909b3a.41.2026.03.05.23.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 23:32:31 -0800 (PST)
Message-ID: <03feccda-7f7c-1d5b-ccaa-2526f57b3e19@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 13:02:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/11] media: qcom: iris: don't use function
 indirection in gen2-specific code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gDD8Ca6xeiWqoVuvVuk_P8KXG91PVjIr
X-Proofpoint-GUID: gDD8Ca6xeiWqoVuvVuk_P8KXG91PVjIr
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aa8311 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dP4z3vtDlYGALs1CHRQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA3MCBTYWx0ZWRfXyM3+G++CXx5m
 cogbJIuGYIs85SMOqGdBHHxcNLd9DwAbUc9lSK8ZDHSrrAtHpZaTBZltrdvR58p3UacH7lE4lt3
 SIjJ4imTNzK99jw31jI+dVbst+mDLpN/sW3S5U9rnR+Csex0DdUCz6Ib+JhuthZCR56YSUiZeX4
 nNHEyrGLl2hUVJvgjDzqGSSHRJDALcbChRKMtAONl9z/Ux/QWe3tG2ikRP7RZfY/nftXEDBphNx
 MQjXjOkjOggE5zfpg9I7fQBXf2TAFWcg80Gd0FFRXGSZJL+rSVcy+/TPzDWW5npPUp85gYwH8PY
 3vdBo6YuPjU4MXRWThZ1Vi0G3/1kPzbL/5hTWsEXm6s2VjlHRvJbQ5XvXNxBMk8+djtvv01yhDs
 DLmZK5w0H7IiK7md97fxpvgJmKBgdNd1Ns9NtiJBqFgfRqfhbrbvMktlk6vLyny1fuhd6AUljhA
 iQxJWs9fuIrXcsd+D5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060070
X-Rspamd-Queue-Id: EA67D21C7C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95720-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> To note that iris_set_num_comv() is gen2-internal, rename it to
> iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
> set session property (like other functions in this file do).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index fd8a055c4acc..93ce7ac3a19c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1295,7 +1295,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>  	}
>  }
>  
> -static int iris_set_num_comv(struct iris_inst *inst)
> +static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
>  {
>  	struct platform_inst_caps *caps;
>  	struct iris_core *core = inst->core;
> @@ -1310,12 +1310,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
>  	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
>  				NUM_COMV_AV1 : caps->num_comv;
>  
> -	return core->hfi_ops->session_set_property(inst,
> -						   HFI_PROP_COMV_BUFFER_COUNT,
> -						   HFI_HOST_FLAGS_NONE,
> -						   HFI_PORT_BITSTREAM,
> -						   HFI_PAYLOAD_U32,
> -						   &num_comv, sizeof(u32));
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_COMV_BUFFER_COUNT,
> +						  HFI_HOST_FLAGS_NONE,
> +						  HFI_PORT_BITSTREAM,
> +						  HFI_PAYLOAD_U32,
> +						  &num_comv, sizeof(u32));
>  }
>  
>  static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
> @@ -1347,7 +1347,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
>  
>  	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
>  	if (buffer->type == BUF_COMV) {
> -		ret = iris_set_num_comv(inst);
> +		ret = iris_hfi_gen2_set_num_comv(inst);
>  		if (ret)
>  			return ret;
>  	}
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

