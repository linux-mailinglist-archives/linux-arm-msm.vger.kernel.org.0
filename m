Return-Path: <linux-arm-msm+bounces-81839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F5C5CCB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D28DD355C6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7A030B53D;
	Fri, 14 Nov 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK2Tu9x7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QctsuFzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E1311967
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118725; cv=none; b=uQXs371Q3FkQXX5SnTNdkblykdPsDKDTc94ybRk0R5lSUB9pMsbxNR++5EXNI5Fznr20qVD0lW0VDpMvCqRlk6tes4+/VlUydDg72VPU8NJTPvpeU/eG275XgMyWNeFYJuJvFeDDbbbKA1GJlhoWmTdnvn0brcigJlH8whV97D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118725; c=relaxed/simple;
	bh=jnvGdqwuBrtgqyTHAfNSDcp4syy6gJ4p5IRgKKPsTLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwvmWaldHdHuWxly6OmiIA1veyl4RXCvtTznE06PO2ROTFlNEMAi0rW9siftyGX4ffljMoQCPiLYSIQyA0V+M5wVvMJkpFuRexz7nnwTpJDZ00+ELkkG6e96hZnjTBdyOTZsf2qf5m2618OswOSeouPQ6QPBNYikgYICSfoW350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK2Tu9x7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QctsuFzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8traJ1431126
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r5CCymoblA+3YsclxlisSuWi
	zrvBV5APVXMnbsm8vTU=; b=IK2Tu9x7UidqMJK1It7P0IzxGU5na7/jbALUWOOi
	Bc3ECT5fQ/DQ2n2RSOtIaPlEu4MsoLdlVbS5USLrDnchA6G4hH5lzpIQO5segWt+
	sQnROnlcCBldVW9ate3wtQMeNMy0RzkemMcaT5J06UQRJbOB2O9XEY9ipMC6Rtt4
	LfTljdcf/tPnil+uKkOMs+K3+MTRNRpi38pSd8vDHkfJ9MBUTQO84zkk4jJTASQN
	+TEoJ9kgiTAcobB/aihODnV/QIZSf9kbyWuG6Pi9nHmrvEIY8jVBhu7xt7Iup7nt
	KGSYVjMzMrlWPVpyVQS/OZzbDqGwgcGhOUcX7fw1kphWeA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1wps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:12:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed846ac283so69276601cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118722; x=1763723522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5CCymoblA+3YsclxlisSuWizrvBV5APVXMnbsm8vTU=;
        b=QctsuFzrb9/lPA+08el0N4/7qbjb7PAKcuFt7dxSWbTw9W1f/spMRwHaLmmK/fFs8h
         DvCgjqgPz+93bNMzXWMjmaS7DtNSWBRUd+V5fkbGGbZOmxQXSJZX9Th2hgiKsdNLzCre
         7B8vX+OnqzSX9kJnUhpzk5X5XVCCc3KXby1gsaj9cCGJIg3YcyFRkPN7GZifzvB84yYF
         /hMOy5V7+gwOoxt3ELPHzaQCgQmcKbEDQSiRWJv8IEp2z+6Uc0nJwtV2dfmb0UBBKCRH
         mLfAHJNuOcO3jxsLZXkkB/jJTROQ8X9fooXyUzNTJsnKjtbCdjPBpm/ne9fhgQBHpXfN
         xJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118722; x=1763723522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5CCymoblA+3YsclxlisSuWizrvBV5APVXMnbsm8vTU=;
        b=bI7vA2U9XUrHekyCWQfQamC5O6u7FUvD12QP2pEP7IljuAzbFlnuTvS1LS/uE3+N1X
         f/uPjvpplNBs/JesVaPDKsdVBODsFfP54yH8w4fmHAghHJHlqhh93qB+6+jW7/n/dJyb
         tLfcdP+nTp2wylZzzL5oKZCt0tQEQGhYCcRj2df7rnN+1cMf+jKePoY8Jp8L+VL/GzHi
         NomzpBt+0NVH+fL7FpnNBruT9Wce6PbKxRSky6m/yUrtkU46Ew3Qx1Tabzt+I1UpSO9M
         LdwFIo/uU2FA31MzeX9cecwS10AaFLYsra2X0TWKC4+EH1AoctN3mwgb006dAKRfl1QF
         Rsug==
X-Forwarded-Encrypted: i=1; AJvYcCX+6YJ56ipWuvSw1Dd/RJ5w/FlMhIM5sFu7mLP8J6FcLbqam1pmyhV+2K9BNzUyNMqGYn2pQkIQnDS1pP0/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz925yNGAJ1uhIBb9vEmHqZnTuL64+tH0nOZkdZ6UK9VkfERXcS
	AcuH+RS0VQvtyTQcnfiktjccHnT3Ubx2kwERrHgEmny8UoSDQ0+Zjw8+9yjJ/K8IaHsoFBRu1yu
	bZAhbkSd8UhC6k5j5xWSXHKVr0YcjFz20pIzGROkx2i4PZoXcTlCLugg6vpAnFCOLY2nI
X-Gm-Gg: ASbGncv5oh5O2X/0+6ng0hFRuqbTRMpWqC9pxXGUx85sEhcgsF7VXIeNg4xT+10LubH
	Vh80dIK1V2pV2/vlw7JktK6eVMnFFq7IhOupE23vQ74cz2rXXWyk7qrxrNXTHCu5P0VNyuP20N1
	TF3ggm/njNxtsA7J15pXES3baGbg/rWbZFsfpMYFwzc19UWbkFY/DMus/KFuFX8PqNs7PpeVd5v
	29xHmoAULZbxkhLC3sdzl/DAtIkREyIHZ7OhXQ9hdLzmmxbOQFjh7QhVrGKcimw83BwRZjBr0Tz
	L8kNTXJOLQVjqxlH+Tw4jIf/DD0QCKw4YxVJOysgLJH5FUbWjUXC8l1PsO2IOvhacZ1auUCLH2U
	il8RQfcMNTOm3liqJa8IgxO4VcFcT7M7ZXQBHm1r5yURZwmOi7ByNGfI3o+qxt8L8LNeczm9IDE
	ZJNpXmdi8p7D8U
X-Received: by 2002:ac8:5a50:0:b0:4ed:5f73:f82c with SMTP id d75a77b69052e-4ede6fc95demr89379301cf.11.1763118722423;
        Fri, 14 Nov 2025 03:12:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwoAFhBTNAYz3zsfK7mcs2aDBJ2FOHVUz5CPbAQXuI8ZSje8vzdqqLxQruO9R+VOgk9aqUEg==
X-Received: by 2002:ac8:5a50:0:b0:4ed:5f73:f82c with SMTP id d75a77b69052e-4ede6fc95demr89378871cf.11.1763118721892;
        Fri, 14 Nov 2025 03:12:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803aca8fsm1014691e87.9.2025.11.14.03.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:12:01 -0800 (PST)
Date: Fri, 14 Nov 2025 13:11:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, ekansh.gupta@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add memory region for audiopd
Message-ID: <56wrs6h3mdscpfogcsl4rlmuhj56cixetfkl73bswfm2wlc2k7@ixgeujbtulmq>
References: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69170e83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i_qK8UXPN19jCK_xs14A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4OSBTYWx0ZWRfXzuNJNQEEkT/S
 yCiOczTydx/lHNn+qpcp4+DM4P/VAa/E3Sr9U0ECtpC5nSWjufJ4yF+r/R5zzsRAVeLhm3E/ZQK
 sV39KDwYgSUgYJikIIfuhq9vbAJemAf852i/5hHt9rwTU9ZOhpxc3o/v71GjOszmE144WRhd5pC
 Fc50KR01BbMYkgkMWyjciZgVaNtBGuWqBKd2/7WUZcTtQSOy/WbnZNVukWh18zBUoMmax1E760N
 ZfLuOzVoGZjm3pbhqO/2JSSuALKY/6B0C4J+qJzq0DXoCTUFWJQuMdIrfZ0qirgcNrAtwNaYGch
 pb73tIFZaS8tDHdPJqTjiUL3swYY5p5jXeiRUDznQVe07e3GYnKZTqPZK6N0x/V6aactzOodHYZ
 OXdMjg3bzg0E0Z4i5xvrXPYiX8W6ZQ==
X-Proofpoint-ORIG-GUID: LPPgj-kaeAeK_ZTvI605bwfb0AUmx07r
X-Proofpoint-GUID: LPPgj-kaeAeK_ZTvI605bwfb0AUmx07r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140089

On Fri, Nov 14, 2025 at 01:56:39PM +0800, Jianping Li wrote:
> Add reserved memory region for audio PD dynamic loading and remote
> heap requirement. Also add LPASS and ADSP_HEAP VMIDs.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 3ef61af2ed8a..0cda9af98dd2 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -190,6 +190,11 @@ rmtfs_mem: rmtfs@9c900000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
> +			reg = <0x0 0x9cb80000 0x0 0x800000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -4139,6 +4144,9 @@ fastrpc {
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
>  					qcom,non-secure-domain;
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +							  QCOM_SCM_VMID_ADSP_HEAP>;

Wrong indentation. Please align vertically (or fix Tab size to be 8 in
your editor).

>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

