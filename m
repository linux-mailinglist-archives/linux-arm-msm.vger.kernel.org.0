Return-Path: <linux-arm-msm+bounces-108063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF/oNAwFCmqNwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:12:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8D562EC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75927301C6DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA0D3CC330;
	Sun, 17 May 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVcA2+Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImyCPieG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3682E7621
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041527; cv=none; b=qEIQ73ldiL7U6KSWdOJCEhk0jODvhCOwrY1ORaIyoq55e1CNRm2SOJJsJexopOth8Tbs/s+5BqB5bUMSH5VP6fim8+14BX4LzYQExlajDud+Oya2qY7MLMtkWnTHApGAQ/V8FVKQD/Cwx5O4k+/T5aEPYVEW1cDo7a5v+0k3ec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041527; c=relaxed/simple;
	bh=xGnD7yBHQ+nLtVK6MSzRD0aOKM1eCs1UBQP5IPYsJcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dk0X86R8AAlPKWo/MQ1FrsRSkSyM4wAG+fryKil5IRd2Mz5U2MYzTnv3GXfy+6vfv71yFJA5ahUKgOCc/AeEFSGzAJFrdQxJEchaGQ52NsspdQwej5kvQRmwMtD7SRaPnbfGe6sfh83KsRpb8mQFDPo1aPAp7JmnU2MpzK4MiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVcA2+Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImyCPieG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GKxP5T1564165
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lF3/2RUQuRYMFEAVIwRWtW73
	IO4hVQVV7I19wPH93XE=; b=GVcA2+Ub5pG5pXpJrE8DbKK6ExSfW7+aZ+zIInGk
	ow6t3kNJ+7lu2BA542LYfO0ixTjYbaZG8ExG7fS8jeZPBTtlLxHAinETuh9WIwCE
	Kux6xv9FjTGjm3OR3IKmqeG7saaofT0rLw0ORGaOzcIhtF1LXDxU2Sn2BND4R132
	tGy72AAitoVJWOlNsRlLqqQ0Lw56G0hEQW+N7vgeU6kOyAWJqDGlZuKqTM+F2jYJ
	slOPpqpoRjBaPXaYB8cwxgaq76FIkENRZNQZfXSGu/ejUMDBdK3tsrhlxTrg4oal
	/FJNAgZdQHFG/r6RmtxURkThGD5iViWoNKVlgrns5McnMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvquaxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:12:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so49774591cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041523; x=1779646323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF3/2RUQuRYMFEAVIwRWtW73IO4hVQVV7I19wPH93XE=;
        b=ImyCPieGFRNdylhhnLcXWiDGMiNPamob7x8K4+Rbtz8RaswxzWbgOyHmF0OahHKXIX
         3isw1EmgOmDjlL5BugVK3KXs6+fg9gB3iwNL0GmzeOuvrlIXl7dQqMf5sLuej13wM33+
         cJ7WiOVFWUbNlDjzd9O4wuRUXq6kPML1P4c0iFVap+zOIzfJ2Vx1YTw40RuNeAYRq8ft
         X41VJ11+8mSlfy4VEy8r9mmTn1D+zDg2QzwTL+gTZXYbjPiuggy2JmiCPi3T7l7+9u6/
         d/5OsdBu6vL/mTz2fPMxsqG8xZiPad2MQIor70+rQtLd6vqwXmauMSOZ04nNTsoydHtJ
         6TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041523; x=1779646323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF3/2RUQuRYMFEAVIwRWtW73IO4hVQVV7I19wPH93XE=;
        b=idt6IjqkYRD1/ZV2jahmL46BGnM4aCKN0xlr0gW4dw3k1joZL1HPEPyFI6Kc/TkJQo
         1KOdp8kEU1F0Bb5iLc1w8k/y4lM7Z3CaWJC/GAZJr4VR1WLR93B0RffB6idGWPHnPytE
         KU0IEx/O9eZlMPgnO9G7ZgrDHSVdcOEifM2GPP7aPIj+tC/FS9rCpn11IEmsl71pHsBS
         paXdXciDak213R6JD0QeSJV0iYpGJ5vb1j6EnrWYxcw4UNdYnfdtkKc1VI24YphbKjyK
         L8rhoB6kgr5KvabcxdtIpauzr3ZyB2Ln03X0nvJrivhkTfigTXC9cutOzNhrzcuFXV2y
         U2xg==
X-Forwarded-Encrypted: i=1; AFNElJ9KZgvyJnx3O4Od5fGTfNx9kbJ6VCa5N9OV9sHKYx+jFL51DnfvUIpAZ1jLwxF5FL6qx/c6QtE0gzX5zPs4@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQMFPvgpxuco55CD/3TOtMX/bF+A0AFHudJLyigh9IUvWQVp6
	37Qeeua3vj7tPwEG+fKFsyRSNCUHcjSillONRV0mXb/B/RIC7UGBtCf/TZPgSRt1hsJ+YgspdCB
	Cmrkk4CDUdZ1CPtxxaZUlFA+WB80tdR8S1ELdYcO/6zzjI0z454XltG4pcxJ9GiiXlv0L
X-Gm-Gg: Acq92OHmXH0aXv3JiIwSEjneza3kuIdyyiI459NNgUQwq7mI7KvI8/1vj3cnIZs043V
	JgF7K0ezoT0iz2boCq0vU6w1FKYTEKhR84y63wRYrX0wydiRXyoa++SBQaGCgEDQOi19PZ8IGYr
	F8EO6QTw6ShiJ/GUKBKoZ7JCs2PnUoKleTOLfg3mrLqxfiCY+EtAs9Aad9+LNY6Sq9UbnHRXzyR
	5Y1kv3Us2p43ny1Wvrcs9w3RV9PVQYCw3rxDWxTSOQCLIj+ycge11d7Ol1DWpfeJ17nCoyxsoyM
	JhiEJItZ7OmKJXkpQZe/zfgCwcwUB0BbRZSmcoi8ug+UpafIlIXUPDEBUmX8sa8hmCelSdDHIuT
	0ggn3vg7WwoDvrt6VzrmGcXUFen4MIkpz52UI34OiZ4Iyc2Z58SeCnKFfLto/wvrb2z+Uos+8yY
	1leHyKE61MrTLvgrkf9tWeVVOxl+vlyVFdX3g=
X-Received: by 2002:a05:622a:8cf:b0:50f:be4f:465e with SMTP id d75a77b69052e-5165a25ce43mr184111881cf.53.1779041523230;
        Sun, 17 May 2026 11:12:03 -0700 (PDT)
X-Received: by 2002:a05:622a:8cf:b0:50f:be4f:465e with SMTP id d75a77b69052e-5165a25ce43mr184111521cf.53.1779041522805;
        Sun, 17 May 2026 11:12:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b6cb8sm6721051fa.37.2026.05.17.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:12:00 -0700 (PDT)
Date: Sun, 17 May 2026 21:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-GUID: 4J3CHy7vbmUiDEGBhc7oy6zTvrtH_Bup
X-Proofpoint-ORIG-GUID: 4J3CHy7vbmUiDEGBhc7oy6zTvrtH_Bup
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a04f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0_QClZtVb7ToMYl6Za4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfX5/7jHmWryQA4
 4Opeu9QtP0TrSwWDtOLBlTAPF0L4k2XPK8nctQHY4iA+NrRMrmys0NLOZEqaLaI7kSjGkShe7Uc
 ZeL+9r/oz6UCie7qmJxnuZHza5RtbEPnOc4q3/uTikAN6o/Q1+HrGSmTqXlLX6IH7KZFxEAl2OC
 rE5CnAfAWzPu5ITRU67+bKoxzBVRR2c+imPKsGdTv9ujy1pUooplcCKwoa5f1aOv263pqHB/Inf
 6JPi+utojecphgwfbbGhvJOyRVhHlgO+uRK8vsXgpRXwKzlEZ8F4EEYuTVxQ8CHehESm5oCPXn2
 m8edIZyLDoFNUTaEGPaFrGh88OHGIXkrgRtaHlZI4XWCRAl8eX55u1c8LcyCKHYAMs58M6MOgbY
 wS4D+d7dwRMJfsGzA5OlyUvE02LBcHveyNZfCN1DkgTF7zZxiJrmrCwvvGyNul1HgiASKdUVo+s
 FFdrQ6G8XRsDuDudCxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197
X-Rspamd-Queue-Id: 4FC8D562EC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108063-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,aa00000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:28PM +0530, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>  			status = "disabled";
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",
> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",

I can only assume that it is "vcode0_iface", "core_iface" and
"vcodec1_iface".

> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
-- 
With best wishes
Dmitry

