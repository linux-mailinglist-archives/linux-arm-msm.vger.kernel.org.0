Return-Path: <linux-arm-msm+bounces-116756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LON5LwWUS2pwVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:39:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF4C70FF92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:39:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=psP9WYXz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V1WKLZPh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F60C30C30C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652A13EFD0F;
	Mon,  6 Jul 2026 11:07:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A0E3E1230
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:07:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336044; cv=none; b=rOMQG2fms2ZaQ81lcTTaXijRjGHHvGjWDAkhIlPvievc7XL090iSTKVQMGxHxGZxd96ghs/Bg29cXKlKEvdw2wacu3JdxKL/+nKk0DDt6Pxj0vGYw50kKGsNgF47FidDVbAdsSm0uNoRTS6AwPe5ptzWA30eIWlGOylkUxZ5QC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336044; c=relaxed/simple;
	bh=GSC20CtzxbmxBVORCMfWhPZFgodoTm+IPeQhXWhdJ8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGQyVCAEJbTDX+R0XQtrqZEctOpTz39ISP91A9PyFiMaFFPEGl65TkVb8z5iQYzNos9+4C21Or2Pv83iyfbfJTyxWYiJbih2Vs0bjkGii0Sm05f7QaTauKCoIZzNk4vkNy13T/Qb78W4t32XBTiM58Brsrouyo0CWmNasIRMqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psP9WYXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1WKLZPh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFRr368946
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=; b=psP9WYXzjA6tVY4c
	e7rvWCUSBKLLxlaKYYldlfSj8q4wfEcWRj8z0GEpzslEP5lCPfkuOd0puPbQnESx
	dpHExnPs3jZUFkF3Qtj6ig3uQDhfh0W5LGqf+KBRZb95RDDco0i3w67KSO+AaKVA
	n1cgehAjkLnlQ//KiQS7HScVSQnbA76/tV75eE5Z7o0INDuV2vgr7DyOqtXFS7qn
	E5O7ExMLndq6u/rPHHfCpi8YSgNdg//4RILbabVAENfoj/nOPHSpNCc/o26wbx24
	s5P8arb22Ut9h7Xjcaw9TwZ3SEgi/xD2yyezhU4wYLHhkhdyHFS+rvennSmICyqv
	8A/g4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98qs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:07:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so3271031cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336040; x=1783940840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=;
        b=V1WKLZPh67M1MqPiwPryQFBSPNSMuswQ/PdDowc4X0CFt3j7Ni8cryOnOgpxJj/3WJ
         mcrsJY5CxLKl1RKCNyobPnc5TyVAckqkSZkUeVeO/gtP1PFb2VoPAWs2f5vc5s5Wplrv
         vz0zX0/PTNbgNFskeBbSO7ACWB9Wh658GJqt64bJDO626unVl3FFqJGKPb3DBETIP7z4
         YJRVz7JiT98zitqw4gVcnrWtTjCK9Q3M/O/UcOqDt8N/BI+YnZbiiyASSCpfO10/0Fw5
         6J39tNmcfWBPba7kbE17BrRvsJABIEKijAWvA6OTSs0L7F9ifOZ5jT07ZQClnj+Q4dti
         d+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336040; x=1783940840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=;
        b=AcpNpeAWiwfUYp0YoJ2rAOCmGDhB8zdCnARX0jRPu3PszZv7vjeDU3t+pNLfTVeiOm
         Lffqare+GBSJoh91ufGTkEE+mZDZSB9OYx8J/N3K/bPvekBHZs5II7mXYjmSkIrML4Wp
         9m5iSZcNt7iOQry0iMLDbgHzN0b+EW0kCNJuX97x68ZEed3neidhNF9aKVxwytEKTGAX
         KBXj5f13WPzPZObm256e2HbNp7WYXqRb1CEgpkBbWn5NHF6ECk65fL/dvOE7mKOQ+451
         MKprboYEskraBgnSCZvHeq5+NHfTRW4buT3MTb4sEUx9QO8SsE4lpmeHrN+RpqaZW/6k
         XamQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPsjFDubgTn2B0Fjy5xIrREuHJu72TTtx3stGoWEkTfQ60ZZNMpPlY9IT5t96yiaCnzhf5hA610sDswwYU@vger.kernel.org
X-Gm-Message-State: AOJu0YzFclM6Vc6hgiTkqW7l68xoHjbwqvnpIzDngVRNAechweULktJ2
	rwww6ci43xxFfE87pZHWgHyYZTt7f31YP0ng586a7SinVhfXwmg0d+uh5bYGI+oZbZyhZBpIhIv
	Z3iw2CzI9wP8kNyDQArL6okfqW3V5M+MMS4yfMvDl29Lc8EtIF8MdIODN7WK57nWp7kyg
X-Gm-Gg: AfdE7cnOAKjUKvliiWehSqtjjA9eIWRZwKl4kouqkj0Wl48FVxuwHcN3jcRA4F0p7WO
	nCwbCZlb8tmBFzQve8O73rFR00ui4phbyNDvFVKqG7tasumJpetZtqZzo1L276uQO20lod7FF0h
	leoI3de5zpwTO81lOrVdsqml5nZgdi92P2Qmyb1qxaCmAiuF6VpZw3GS93vLo9dT+m3eLi5hYO0
	/DD047GbAiBADeMnIp/KsKOtTZEBraogCeX435XbjjVdSCuwoXlAyV0fVrVAgYU2Ds1UTVz8/PJ
	4gqwEUiLlZxKWQ7uZHNfvSb+0VAYTbFX5AwV3MBN6ob8nlYJXq6DB4VNSyHuIfY4UjFBprJd2f6
	exFVmOa2x/wrZCa5QAuGnuvOrYYW5Hx7ouig=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr97022501cf.2.1783336040106;
        Mon, 06 Jul 2026 04:07:20 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr97022121cf.2.1783336039446;
        Mon, 06 Jul 2026 04:07:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm720881966b.4.2026.07.06.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:07:18 -0700 (PDT)
Message-ID: <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:07:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xsapqp7kvCC_p47XAOPYr3Zd4PQpjCr1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfX/6wal6ZYYw5N
 2772fiFbgG97bdpWmKebnPb5YFC5SxmAWnOYx7ZM5tCEPpuYSTB80G5wjflkSYwfupHsonOommh
 fm4kO0QicxrTEj60rXA4ST2YnwvLxAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfX5kscX4VoG2F9
 gpfFxI8eKGlQ58eBGgupKRPesJ0/8ydn/eCkD9y20K1+IXMWlYevwaGaXQef6ND0dSFoovbxSYV
 BfTY8g0dEdIzniNlQ4cB8f2UP7+fHxoOqr4MElKHUvK4IvtEE3YMb815XDiKM1G+Nk0KcXautkH
 4J8eMEEj5dQ4k33Y8KC3nlTopTTSFpsGorPDbHNDJ/WigX3XEjkWwoixbfKO4Zp99V8TmkDD10z
 L0br6V8OX4JGeptGvU+3a3/S8Nx8h+4WzyZxQvLj3R2SGzzrRKDg+nFrbdXgfgPxEEWxgU2LCLX
 xs7nuyRAX9bQVamSwB66TXDHF5cUUG8m5wjKeDFy5YKonLF5ITNpY8yZbWz1xaKt8zPX23RJMYE
 uinEKhMobdikhIvPrlotIvQ33Kp3MwEHDz9tWP1qTNdDLJmNGH7UqZ5xZfxx7uqcTHuE8qML1NT
 RwqZEVxadCGe5ghQk4A==
X-Proofpoint-GUID: Xsapqp7kvCC_p47XAOPYr3Zd4PQpjCr1
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b8c68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UMfccTTTTeY9HYHi3ccA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EF4C70FF92

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Add the nodes to describe the GPU SMMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index c5635f22e2a7..e5b8377e6c3a 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>  			};
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,

674 is the correct globla > +				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;

This list is not quite correct. It must be sorted by the context index,
to which a given interrupt corresponds to - the driver relies on that
to give you information about where a context fault happens

Moreover, I see that the interrupt sheet has the bug where some
interrupts are offset by 32 from the base vector, and others are offset
by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
out which mapping is correct with the right folks

Konrad

