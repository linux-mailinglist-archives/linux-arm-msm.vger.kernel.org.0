Return-Path: <linux-arm-msm+bounces-103595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG11OS6g42kvJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:15:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D04216F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7718302C6EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 15:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CC5224B04;
	Sat, 18 Apr 2026 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVLprOdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4rgAL+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214232E6CC0
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525308; cv=none; b=QV7eJWmWrthFXja8M1O1TlcCla2mioIz4DFJ4zqm6yFJZnu+WEJXeKd9WyuVZinnZCBB3fg8iQo+iEjey3ogOTAM1yWjVkeH6B6nTfu12i9MZIutwuU9eKY7aUXCUxzp0aJTH7M+wp+i44xIZhqkvN2pZGhshr0cuoTdRAsMBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525308; c=relaxed/simple;
	bh=Qtc+wBW4Kxp3SLnMd86csGCdaNkfCBDi82G6vEeEW0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwWjEzcs16OV2+CB9v5YZBZYBT7nA5Ufd17oc8WwzTewF08ljWP7SsJhgUd3kMVGT61KuGnDwwf2aYmYHQQQlrQjfL71BzipoLC8KGBDkMm/ZV+gGcQQuHLWNK2hGjO2lnUPLz0V6QU0xtx1PX+PGTeqb5E+ses0orrImjmbWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVLprOdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4rgAL+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4U9TJ296153
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1IMG5RAUvb9hMjVhCRtU1+Ag
	WRwZIWSe6aJ/Xb2IVY0=; b=QVLprOdWjSiNPDy8avHL1V5F090yNYl/uNQoqwB1
	9vjkbGvVg/jB/wfTJAyRVyvhdA1iXptvFcZ29JiWAUw/mUSkefw2V/5Pl+jKm4kK
	ScDcyL3yZaxP6wTv9ESt0Dq+1q33ga1W2dg9DxnlPwMj98RuOijJ62HNn3R9PPNd
	tIjBld9GqTjduXDZiV3bK3vgrMBOAbt0n9bK+QAjZMUqa1cACv3ML2x9ihTe4gS4
	/0SHRgWNVK9uaiMaUDqbBKieaHW0GGCUcDBXpXLQl7Lhz5XRm5GTgFXGw7MKBzhq
	p3SbDRShhDM0gF0yO37U9C0VSycuYMiRoRnFPDCjZNQ8RA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr159x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:15:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so3540821cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776525305; x=1777130105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IMG5RAUvb9hMjVhCRtU1+AgWRwZIWSe6aJ/Xb2IVY0=;
        b=i4rgAL+mwTaIIpuyXcqSpkK16a3myPgdQcSKAv5b1P8MXheSddYnz9SntJ6wwwVZTb
         B3sfiObs1Y+qVHUteVJod8mqplngJh20U4TQh+HL0qbj0KjCBKVyknM4LN2lwT4ul5ts
         tmOpiLEGbimT9IhGPZBzXTu+yQ9QUEhYBsiKcEWOZwiYG9m5OJ2HOrdPnxP3j4elXsi2
         HebRzOm7wnD06RqdFfKRt9TMUkxtn0SQ85pEkSgX6le8swJjCfyLw7mbCB2viVamrTu1
         8mC3zI5nt6n2kfMEytREzJAyw0Foj4IoC63ISdbUmLPqmgAnsP3g9wGuHwKMKB5rhC/r
         G/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776525305; x=1777130105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IMG5RAUvb9hMjVhCRtU1+AgWRwZIWSe6aJ/Xb2IVY0=;
        b=eijymOdwB4IFgsngMUMkRL3VvajQAnscoGJFQJ1Qbtx+CwsUYJCuXOw07k7/e3MtpU
         z+fix+5Poi3D5i+LaJTROHOIJaBP+uDgxX/Bgzdu7fc0owMo3U8qTTdXS9lWz7g441fd
         L4VV1Eu5P65NI/dT7OiOe4Y5SqDl5W8jCQdRgRFM/akhJUESIwI4OOSvYdLOajZLXxGJ
         4ly36ZLkL9Vi/Pz6ydfoWA2HjZrVMNOmfgTFdOFoWFW4dO829rIDDXPmxhIecePxtAfT
         NzDfMvIqltNC9PI1OHAp/+49KY8NcqgYpUXR+6eMg3KnD7mL+ZgOT9IbPLrsyzTHVNHt
         xeIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LdTIOKzwOAAIFCvQU9QI0Mxm178bRJKEvCezzDQann1HZGeVfukFqFmjklZ43qyFWJKFHJWgL7/Ak4vFc@vger.kernel.org
X-Gm-Message-State: AOJu0YyvOu39R74Fjs1vU/Bgy7UkJpxt3a5cB19vfbb7kXZG/quq8Ilz
	Dgbv+zhObgtbLnfOuHnfe6wu1wuTUI4hyaSBVKwwUGgf8t4agBZLWq912MvIMim8Y2eZaSwRXYb
	O9k+bIdhCYghyV9RSjIrUpjjeDlOXVxjpMwQeR+22ueqpq3U02o6ungdhvSK5a4N7AjCd
X-Gm-Gg: AeBDiesqw25FXusLMzBsIoyIPGjUDCmZ6batKLgz0TCbXzY5M3MzZvSSOgz+12wsnJE
	Kp/AgvxQuYXY6fNFtp6MYY3waeNlJh+QK5QlWhJSQ3HFERhnPY6UNmImmaelRJT/ef5oRg4Prod
	D1GEJOv4TNf9MnrJ23lfkNdPufPWWvlsFwoC5OSQq6ifzEHs4Ac0Mobb2XhP0pipDn7hHOoYcBv
	wHyEMYn4N2gjvAjETx1CGKfm9zHkzrHszLcFdn5l+nWPXkpMlwQLX1ILTFiljUtOJkS2L42UnJW
	SU5miSFKV5Wu8mGWb0tqSvO40VBhhKXotoBA0Jef0wRsuJDRSjgF6BlAsmynAXvtx+a0viBANDo
	NFslkYseQRM+SJIhEHQrRcw+dcWen3ejT9RVjtPH2v2tSrL3HOnEZrM3YAT6xdXpZHzoCZSL2DQ
	5r6E5eTVr1pi1m/JnjP48IogSj/yfkp/SMWokDynSGn+wBVA==
X-Received: by 2002:a05:622a:1116:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50e3664722dmr95573821cf.13.1776525305312;
        Sat, 18 Apr 2026 08:15:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1116:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50e3664722dmr95573061cf.13.1776525304851;
        Sat, 18 Apr 2026 08:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1106sm1406673e87.53.2026.04.18.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:15:03 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add memory-region for audio PD
Message-ID: <v4nqsxnapoyrfifcrjjunhu5s4ggl444nj7gdonghqmhbijiej@fzafvs2igmeo>
References: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MSBTYWx0ZWRfXwKhdzDFw/Kyp
 RD2Zx55EnZ7OB2/Jb8nEVbwHkrwBw4I074H/5vZl73L3Knm7CAizkMjn10DByOxDWxccmQP5LIP
 kVwoZTnwUsOa0h+8eSoBhpcM0Kd6Lz14TbYoP06FxhFEYaliaBePpTCruUJgaCSE914iHhElurz
 m0HbcD6IA6g3YtwXV/W09irnBPeziqQMlE6re4RbSzpgkQVO286RI/9d7zjq/It3MLex8xnXAwD
 JBodYMmce/ifvBg4VCvSPiBHXPgnIPdObkowi6IojA64LQJAmOVNpiF5y5CFf4uBSw9ebkdauhl
 kdw4XHfy005KQePEi/tx+xlP8lRcW8DxzYIjy37TFx3Q1g+BUcwsjuf9TuH/1bQJ9vzfhk+6xhY
 GPllqoyDCsJsXA+A2mRyaTca88HyKyTDlQBSbSugYAM+57sRCkXbwg2jrjhdx3vN96JOSYF4c9r
 jqCfdb+fFNR3dn24L7w==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e39ffa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=fWzJ4JuvnLyy3v9PZgIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6Q0GiHtGqtgHDgc-U3Ag0lczSQmvE0mi
X-Proofpoint-GUID: 6Q0GiHtGqtgHDgc-U3Ag0lczSQmvE0mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180151
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5.211.11.8:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,5.211.3.56:email,0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-103595-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 424D04216F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 11:18:01AM +0530, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ff5afbfce2a4..c36917d6e0a9 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>  			reg = <0x0 0x97715000 0x0 0x2000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
> +			reg = <0x0 0x97717000 0x0 0x800000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -5100,6 +5106,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +							  QCOM_SCM_VMID_ADSP_HEAP>;

Align on '<' symbol.

>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> 
> ---
> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
> change-id: 20260418-talosaudio-b8ecf8b9a1b3
> 
> Best regards,
> -- 
> Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

