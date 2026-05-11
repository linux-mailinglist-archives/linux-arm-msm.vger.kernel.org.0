Return-Path: <linux-arm-msm+bounces-106830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Whk8KfJBAWpwTAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 04:41:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E250741B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 04:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F03C13001323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 02:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF202F1FC7;
	Mon, 11 May 2026 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4UAqiyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITyu4q06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E402E8DEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467312; cv=none; b=FpK4G8dGl1pPQZtImdxkFk+Qmm4gcjoVhHGNkxuCm6gO5YPVsU3Z2tjXqqzDWCxYZIl9T26M8Kij8U/OhOd9eYGzdzs/C4Wa78XqSbI5jqVdEu/WGlcaoK4/KRl5BifZeUUUSnROLvwTonpaqqYuU9dxOBL+hOeH7peEzL5ctbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467312; c=relaxed/simple;
	bh=wtJs8ouGpD+raMzVMs0C6/YAsEI9+P+SIYwaGl8xsz8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iFpxI7TbE2LDKpF36t4zlrLbOVEWQw10qYp+AbiYlSw566jtk9QgGBczhTrHcFQMvbPETCyFHANg+opcdsOTvYmalPs99Nj3tpB57SfAwuacIPjjW9u3WME0G6ECjQwOP6bxc8iTDs+u5BljtCY56kl/tXzwqkhbw9QACd4QJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4UAqiyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITyu4q06; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B001AO688220
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csTFQhCS27/TD55NnmDyE77bhxVaxEVxBVRrSVfa5Fc=; b=Y4UAqiyW06bE9Nuh
	yD+U5y8MhKA7x6q8OpGzR7A70I/chbJzeFaHq5W/FFDtQm8YNtmzoiNGTz83ALlF
	c1vDPtpIWYPb7rKrGN1s9IWEcmzrdsdFXgoG/ROfSE1Ahi+cYVssJFgcHrfDr3mv
	m8TyjRxbMWPyyfuUCb2mvLQbxTYKwBhtL6C/H+k3JQm4ncNfS8eb1yEQoR+WKXRu
	3N+to8kh3OpbZ0g4naxhC82rZOxrNKQUVbRUej1y/gweUsFio+UgRtafx2r4CvDR
	8UCxSiRpBB689UNie5Kp0j6xhOoITBqjRY1hYw7PhjnadlzCGuM5hr56JSWjYSvD
	Lc8Saw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpec2sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:41:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c828659ecd4so395916a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 19:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778467309; x=1779072109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=csTFQhCS27/TD55NnmDyE77bhxVaxEVxBVRrSVfa5Fc=;
        b=ITyu4q06/hrggNhwaaEwD3+u2ECDBT0QhRR+yfNmLsrSCCn64sxEDbF0LdL/ya2sc8
         cIJvkiZI/Abl4ShHBJdmG9qdZnsS6D3x3DwIPTqpoqXhwxNBM9OO2L3MufvZvkbwOh91
         6pxLdPQckb6GO3amSNygw0YZIyX3aBudY+Io/HrNrRja4s0lEwPZ10UWJ1sJOqbGwJTX
         Q1nxvs6QSGCGDlPR3SKSNAyUXoURApfzlgaxR0ooXk514sQfVvNpgeSfHvLtWLJMl/Ao
         wB0jz1G+CheDvUL3gl8aTUm4sJKzAbshcXEADaSFYCQf78kZtXDSnPkmJIuLHWgUGZSq
         yD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778467309; x=1779072109;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csTFQhCS27/TD55NnmDyE77bhxVaxEVxBVRrSVfa5Fc=;
        b=fof+wW6XJxnIi7ImYs4c9DqDluSSTDSaiKoOEDlBQBOIn7tJjHWxAOt4jVXaE1soEh
         TrLSFBzuT2lXSIyQgQHt6mQg7L59PLiuRcZ/kPkXxaCdho+t29cDbRMbHxpjR6U6iYPx
         aQXHlOvRh3fRL4Vl/mEM2VzvVknIvXenmUfUDDZblUjai3yap15WCkvkqEwhlDEi83X6
         vcMKaLKRnT4iQmMVlF3K2Ovxw0eHdcra/IR5A1Og5nJ+PDAjWmPJ2MWrSBGdtJmTtiXa
         I1w1k1iYo2B9lWKTwl+K2cI0CNdAOnbfKJCVM2y2/Q5nJ6J2EAcmBNLzxzZtt68d8OJ4
         B/fA==
X-Gm-Message-State: AOJu0YwUoFLk1XXYFVZz9gd3v7UHAsVWSrzkJHt7ttjI1chEQ+AVcSgw
	BASA1rz35etaenzZokXxePRdqXbJciyV/v3icPrl0bD8YmzOGVzsRXx6+uxKE4nzLut/GPoseHO
	iKf2rUZQyWXDEmSi4TIeNvho1X4u7hGUZtJWzWdIFL45O+BVECDvLUlreTVlwawOSI+KU
X-Gm-Gg: Acq92OFjs7jvLd9sL+XmsRSCet4TPjV9MlMed3RvF0HhOrdbc3Jb1wYtJXsHTqUOO8/
	ewTC2kW0StXDgILPYxK6p+BQRfGm4dASMISEyrFKMhX48Zb0FMthBgSS17AFErmQTQ0f2xlmFFJ
	xq5epJIEHjMr2DIKSmnh+E8exohh1oRDD5K7X2zNcCt/D2pdaZ8OJAQ+zwrEUNqLHFnKPQESOgO
	rJL+DjF1NgCGUhlDjH4hcgBfmRETC9ZSXNxANQ1WbM8Mvj5pLJVAObmCrGZNCJXyQO9lDEKRsei
	QECuuKBmIOFBZkin7X3LbdEOhX+skjpHcoC6Or5+TD9f4Gwf2E/rqWsLxEcrru4/ip4EN0rnTx6
	DPu9w8H3sBHttmRbQDUjDhy/aS21x6A+RV7DCod6H76qJRKFnYmmR
X-Received: by 2002:a05:6a00:c95:b0:82f:74dc:5f48 with SMTP id d2e1a72fcca58-83a5b2d34ffmr20957182b3a.2.1778467309321;
        Sun, 10 May 2026 19:41:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:c95:b0:82f:74dc:5f48 with SMTP id d2e1a72fcca58-83a5b2d34ffmr20957150b3a.2.1778467308715;
        Sun, 10 May 2026 19:41:48 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm18671564b3a.35.2026.05.10.19.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:41:47 -0700 (PDT)
Message-ID: <06380d7c-e6d1-4245-9518-a1155011c68c@oss.qualcomm.com>
Date: Mon, 11 May 2026 08:11:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 4/5] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
 <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TZy6uoNd9ngdbbGyAJS5A9DR0zeAuOyr
X-Proofpoint-ORIG-GUID: TZy6uoNd9ngdbbGyAJS5A9DR0zeAuOyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyOCBTYWx0ZWRfXzl+S1H0in/5f
 HWU8s+HPguvKBVUxKycognEHt2sL6jC6kqh1MHbEp7ip4tAEm0DkBRcOnk8mJqE11JiG61Up9JD
 0HL4PIzVAye+1fgZ8qWihCo1EvUb5STA+KcZrIivc5CsUE2jiuCZga0GhZp0i47M25cXHXmZuDR
 vkzncNNMKYsfSwLvrgzV+X/1zGU5nr3liW1cNWUpyX+53SNRl/kRg+yMHEGjcu2fHt0yDVUeZEk
 ZEXGyqH15cy3sSCepXrT/cUIl56xFEdP8cW/l/MAKlgo1hL19mZpKvYvrLu/ldKqZFOBHandREc
 ObsZZc0E4MlfOzYIL7v4lKs+dKrMbuxzTAqixGqsUbPF85Qhe+ixnhSOB4sOK3mYqFWgiQOP2Qy
 BKbXM+Thls67lLHR/WyPTmHRhrq6paxh49vV+2FNs8XkiKPiPCpIosKxCQvEw/glXOySQjjlnBY
 5wOeRg4EM8GmWcqVaiw==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a0141ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q0yBPzA-_2TLdE4bsmYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110028
X-Rspamd-Queue-Id: 324E250741B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106830-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/25/2026 9:23 AM, Sibi Sankar wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
> for proper sound support.
>
> Also add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
>   1 file changed, 263 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e571710de40e..61a5f263f5ad 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -17,7 +17,9 @@
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>   #include <dt-bindings/spmi/spmi.h>
>   
>   #include "glymur-ipcc.h"
> @@ -3818,9 +3820,138 @@ compute-cb@8 {
>   						dma-coherent;
>   					};
>   				};
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x1004 0x80>,

This SID mask should be 0x1001 0x80 instead. Current listed SID 
incorrectly overlaps
with the ADSP fastrpc node. Will fix this in the next re-spin.
-Sibi
> +
>   		lpass_ag_noc: interconnect@7e40000 {
>   			compatible = "qcom,glymur-lpass-ag-noc";
>   			reg = <0x0 0x07e40000 0x0 0xe080>;

