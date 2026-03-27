Return-Path: <linux-arm-msm+bounces-100359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPuqB/6ixmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:32:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B386346CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84FCA31191C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC0B334C3B;
	Fri, 27 Mar 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ie5es2Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvWNyuZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C9C32E12E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625067; cv=none; b=siraG+mu6SLUi7qUSJovHQO4XQYOdAM39G9c455GMOc1MoEGhVMWjjDr1gZZ4Ym4HRiAjnUEHTH6yCp1WnLrkC4xOAfjcDifW2s9jsSBpIxs7L6VflFdtG750Z4kVKHMoxQgM1ab7pEheFoOpeLuE2RkbC1TMGeVhf0UhBMjKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625067; c=relaxed/simple;
	bh=/7s67FtLVQ7osFtoNaW8ycH8+kFQQs5/C4IOWP8ZXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7HtF2NTgzefZcs1uFAKYI/b07gkztVUJTU6qsHoSNjT3xuEL9c8ZD0hc5D47PRH6CvMlFSHqpIofV4N0lZHizqoxwdjc9R2TEVVbJ0YI8jPSTMQA8RP3IvqYz0pRTlw5LZiaRQPxRJPghvfNmrc5jSwvec2reH/EJT4NIxLA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ie5es2Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvWNyuZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFLIPI537747
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7CY9526LGiuXbFCoaaH0xLf
	puUVm/HTTCcdhq9z/cI=; b=ie5es2DbqHil6kY7e1DqazN+qBWcEzsbfzELW9vk
	DreUr8ECyP8Y8n6DnPKv/bfZlBVQ6YA1LoHlddXrzKQWBvFjCT8DyYFEwYiImMnS
	NyJygDXG2gVXLp4jh8rsu8DHYusLyNAKUPC0OMg1sUoEnnzVYyFpteO4KRynw4aI
	w36i5GhtH+1hpB8/q9f1ukTnFBUW5BX0rb3HtckXMs2qn8k6aKaAG2y41248mmnZ
	zVUHovDFDxTgaMovgVAL1W6xhj8mZ1mhudtk9kN+rbwbkr87R3Y0bNspQHUUW+yC
	mIHx26jRDeR8YOQxbZkPmwsqwEo2S+guaE1qNZZaRLGuSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6r0cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:24:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso69455091cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625063; x=1775229863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=WvWNyuZCuvfdR2HMP+ClWGj3Oopp4rWWNn26kVb7FBLXX+MtY6Xs33mCLorMxS9F41
         OVzTNfyqFr8I+Ejh99oINp942oJTVJX5Bu2ZIb473bBA6Jgdl8xcoNxnydZJ86x+TP7C
         8cfsZrjxaxpZe1fJu+D3eCsy2xR5XrvZJ91dC/iu3Ks/1HJYpvCgslt3CBSxmWnyX8qG
         mEYTyPQ/3X2psjm7i2pQ3rEkjsq/7Wzxuv380MS4M8iPUDUgibc8Jhc8uAiT0PoeD4bc
         P16fUd/igT/paLbmQI/BJMgSAei64uc11+gNKLkDDRP58jvz7zbynT5Zh9eJbBPFuDp3
         CPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625063; x=1775229863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=ooS2w59tfOKVg0lmHkQrTW3OtXq3+OR8u4SAsNvbDccdOX8ft1EGBf6bNYABNDywdB
         I4/eFiP6kbBPhxu1D474ASN3nS3O+BsrMNmhpyivDgMkpbbXbxgbYQCSmjODNyOTD6bO
         mEn6vtYQbxtbCG6T8J4u1rkIs6S19lRNK/oWX+0GQ4ussXwLjXb/8VZle0Qc/erqjdzP
         byxpAB+2rcEPRE4LMdSc1axxjX5VSZqOu5VD1rhRyvwBbkfPPyLlSYLJ8ALvv0993H+Z
         I7tzxRg1T3RnPPIQYWnNtIYSB+ZZAYEk3fIOQmJ5M88R1RgYjcGpkJsXBfhw5WNDTsCm
         lYog==
X-Forwarded-Encrypted: i=1; AJvYcCUifB9xqTWePzvw7zxhs3Gis9sFXYyD+nMOXi8ThVMlEzDGqBJmJOV+vjhsPQkSS+MSsWbGHz93LSAoKUWF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+MCrLo7iyBcxgJmckGfzlOLXn7PSCBSn/rkV4NAVhN+SJ2UO
	yjHItOxQeocSp5Npy6ZidGfeYhYh/890ziXlT1wJobADcFFqrTXcc5vIx9uhwKplWwCresr+OgG
	i7Hst3VerPy6ZhiuQ/B5i4DWtHBxL3c62UmVRyj/IqpTgrUpY2i3eOAMzXx0G0LxnnIr5
X-Gm-Gg: ATEYQzy+96ueKpZk4NYoHL5jjozJNNndMN0tCDoiWo8MJsb/b/fvKPkiuvT2idRy9HC
	GxlYNytLYGefHhuHo3rpFUCmtdzrbNG0w4adX8941JfJgqm3NpqmeLDpFbIb3xzJXhXfsyCDUI7
	gp0Yz6e3++oRRdJ+70+PloWRjMIeO4de1LOy97tOQaGEKhF8UbWv2Ck8nxox6XxHNSLuZvZFLI/
	KdkT/1nxPXFTklWBmjTsCGV1mkNf5XjAYkfPxkjjBG82kErGXmTWgUVqb5GmkRwius4W+JDdm0x
	ITxM/HlRKJSwpK1Of0nLTEV/B3auzm8m9cZiYoATI/wBSrOvoedG4kfKVzyHJWtrlwaUfMBS48d
	loOxmJ58FLfORuv/UWvbFkjPlV4e2OygRCA==
X-Received: by 2002:ac8:5c84:0:b0:50b:4e20:83dd with SMTP id d75a77b69052e-50ba37d2562mr41025251cf.1.1774625063153;
        Fri, 27 Mar 2026 08:24:23 -0700 (PDT)
X-Received: by 2002:ac8:5c84:0:b0:50b:4e20:83dd with SMTP id d75a77b69052e-50ba37d2562mr41024541cf.1.1774625062470;
        Fri, 27 Mar 2026 08:24:22 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9acb9sm19639105e9.1.2026.03.27.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:24:21 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:24:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <gxmvsabqwn3xmqwhefsbcornrdlxfczprrpdq7gvygx2hlcpjb@5stbl74f6ng2>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6a127 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5ggE0fpHh4ycMh5kM3h-V1cnxRAOZF4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX3rv/3JW7xbsT
 CH2yTsSZgJ7SZmexm6Py0Yw/inY3D3eeQlFQKoPssrq8pu+ymsDfWOTI+r+ZAON5H+A6k1ZEoo5
 imnj2SsjVVzO8s0zWrBZ2Eo3DOg2gQDFdZjjeYr/6qhyoGxFCQeZMhXQwDtrs7+CB413eRJ9LGU
 N358TcEerNsYM9XcxHy0oAa+vpqdPDSBo1ZVbHrZr8waNMNntcVovvngu6bj8H25+qyyiqfbzaZ
 TUVr5N/LdCmoUJWvUVrfsEbfOesdeKX4FF9YD7st2g1VdUTRuK8F0tiUcgIQRhioMKJOv8sGNrI
 aNKEtm8AOCi6uRVmSC3QedvYiz03Dal4juHEb+T4xGqmvmMc+9/N23vViCzS+AF3pPfBmANM7vm
 Djzd0yO+7vCFak9pilecztRCv/RH8JQ6NDOABsXR57iI+cO6GnSIRebJ3q833K04DJMBU/wqElK
 5atGHpnBe41fVTSFMhQ==
X-Proofpoint-GUID: 5ggE0fpHh4ycMh5kM3h-V1cnxRAOZF4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100359-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B386346CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 17:57:58, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

