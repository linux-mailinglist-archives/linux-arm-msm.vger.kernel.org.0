Return-Path: <linux-arm-msm+bounces-107479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ILeHkzkBGohQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:51:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262D53AAFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5532930285D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0119C384CE1;
	Wed, 13 May 2026 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iuj11DuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EX6Iosdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E14381AFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705476; cv=none; b=JuZS0+Qh5VNC7aDLppM9FGZ3/FkLuKkvcz4DdsMAJ/5p6hMy+gUFWNb2lmMGGwf3zu74Ev06e4PlVWRpqi3BmRhttL2Zb2+UDjJjcUIH+jx8QTj2QPejgufx6CYYle0NMWaeG90ouMArD2K7g4nTdxe3zUMc5VN5NzALOHJ6Huc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705476; c=relaxed/simple;
	bh=mDLLtU4TFfGQ8msmT45y2EYwAq7Bn0q5hG9yp4xBWic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q43z1LpWAmpvdjps3aAsI+CZ9Jrp5601sZ4Sf+eI6LcepRHGudoit6Q0U9l4dpoy9TmAGp+y2INgc6ffBn7p/xMxycIQa0Li+y5HnEkQIRU+IGqoGERIS1dDuIQ1X2Lw7nKYpNPqb5bJZcl6l6OrKmGVb6ujvJ4LOWgMuJwGpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iuj11DuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EX6Iosdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGvEWX3997611
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMgU7G0PULtWal9zMMhkYiuEJrUUShzsoQegQpN3nxE=; b=Iuj11DuIde3Bi/3W
	bYcwXPOjbSvOfS0g1ee6gEwAzqVu9q0mJYBm0aOqlUt99JHG/F2tCD8VNaJvwNMY
	nWLdT7jh054fEz72rlCIp1NHgLDyh6I3J0Nwdk1tWKlOWQAfExYLuo3mIfCVKPXW
	MiTRlaLRGsPYPywqnXsfj8Ve+Jk4Op5YacHA/9SySKcsqKTSp1fNDkT0Imm5lyy9
	pH6LHYf1HPS67rRcqA5jMViPw1sAuVX7QhrfNfHGGIMErl0+2TZKt8lFhlqoYXug
	miPbhXs2ivFbTyew2QE2Ke/1gOhk1ZF58K6F+yMdf86OqATj1md15ritP0PPQ+wA
	bVzEjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urx8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:51:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba115ab6bbso70350535ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778705472; x=1779310272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMgU7G0PULtWal9zMMhkYiuEJrUUShzsoQegQpN3nxE=;
        b=EX6IosdvTlChKNd48OoUNuWpuYQkrIlnZCdWxIB5Z14eqM5g+l3lDgaLlOBPZXR2/6
         Z/cHrU0CiWdIUJg3s5fUN120neTA5RN7f2jkxGJHKzKdKaiW3Hzr3Edi+qJPPw/zCqOt
         jMvjxn2WMQsBFCz40ogYKP7zR/uZd9h+gMMPpA5iQtET77hLD0fyNvhkpwzo4p8rhxP8
         vrT6PKxZahitoJdb62k13fOMXwOZSicKI4wXqGfmeAHkjxSzRi3UxR6hHXmns2fTx8cs
         rPr4W+zqGB4tlxRNgvZv0Ezv9ZMJsXCavZ2L/+P919B6z0Vvrd8ZYm3rDjy9Cbxot+eZ
         Obcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705472; x=1779310272;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMgU7G0PULtWal9zMMhkYiuEJrUUShzsoQegQpN3nxE=;
        b=J+lGyA/0AwJ9DfVVA17Pc+hAtBt0uRGD2do4QKrZtw454CGV31B1XqhJurxpjKNlmr
         +eusMkd7hszCEsuyFMol6r7ebfMTpL0+m7T4ifqPWGmEI6fnpKuebMpLp0hvt9PpR4PK
         ISkAdY7isGONQ0g0Wl1ApsTdNn6uxfrKTuQQAF4x6Op/FRfZCbMnsU3RTB2jWsQE7sOO
         J4gUm2mM9rF6zz2r8OJfXjCF4f6M38Aq/lwMOg0Fgo9t1Gh2en2oFsjR68nNTORDTgdi
         P+Q+MtdibGM37EHBK7migDXHq42jz+417XUAC/6yH6I2JcibdvNK+wtem/6pnVfOVG5G
         3vdA==
X-Forwarded-Encrypted: i=1; AFNElJ9vImuBsuiPSxZLMIr80kRq/M9lgw6L7QGgc7EIxhlT/hH7Goq0NtN4jiyQ+d/ATf7sGNEv6thD+1WmM2JA@vger.kernel.org
X-Gm-Message-State: AOJu0YxCok+Revn6uMk0HRwdggjtQYyVbtE6mL+GrlRyxqlxfs5FlPkI
	J2v1GgAGGklDOhxt4dx0SOxKP2M8qjE1XexRMO/CONOgn3Rvwzd00EI8uIeOklZR02QAmgN8bZq
	CV6exibgGcKCd/yVsN/inpOF4JJCdjHZglHKQlnokuRMiw2CkcAsvU5yVE0nXObY6SXMm
X-Gm-Gg: Acq92OGnXyIycqj6WBMQN7krYQWAdI9hroNaknkXkSxvKt+GvuX+Vld4KEG36IwuruD
	avFo4PzkC2C4v0IJ72IB/rqk2JB2/fO0UAi21ZB8hqbCCpIHGZx8p3fxko0uJvozGTXdw4bGcC0
	xaqakSBZOIHF3B3kjcIm+ZKJMya/zUeO/GIsRJ8x9z7FRIjfwnEvSUGtEBdws7Q2HpKTopz3EI+
	vAozJr/J2kDGSbegoHW2XSFlzM0IiN/55huVPRHN/stHHSY7Z1kGgcVefuWjZ0xM6GlHkTyQqmV
	WMOks+sfPEZOKtWz+2LInJUzUyWp+RyOSOHhPAcuK3uVcpHnwmsOZOWRfEZgMsef3po0HUl9v2D
	oDqX8TG4Cmc3gzPLaq/yDeTiMC72ZIWVoz4vQYE59P8vM
X-Received: by 2002:a17:903:1786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bd2de35393mr50799685ad.19.1778705472339;
        Wed, 13 May 2026 13:51:12 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bd2de35393mr50799335ad.19.1778705471848;
        Wed, 13 May 2026 13:51:11 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm1595235ad.21.2026.05.13.13.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 13:51:11 -0700 (PDT)
Message-ID: <9b3a3cc9-c53b-48d9-a5d1-245b9be894cc@oss.qualcomm.com>
Date: Thu, 14 May 2026 02:21:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 7/7] arm64: dts: qcom: milos: Add Adreno 810 GPU
 and GMU nodes
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
 <20260502-adreno-810-v5-7-bc9fd2bb788d@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260502-adreno-810-v5-7-bc9fd2bb788d@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04e441 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nm1BsBjGsf7C+PoY3QnOXg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=E6X0ssOTjsGwspkTZlUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: H9gPiK4gpHIzAVWGVB0HOuFmJP2RCv7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwNiBTYWx0ZWRfX8IU5gkKO/JxF
 gx7mTeBI/56TJQ75sNCPu1SYCYe5jWx/cB29YdoQbllIa2vgXP2iwnqkmYhWOSnWNJqGtu8vAr+
 pO+EKFEsVDkSlegzygFxnm3666ndoTZ0REsRWxwSc+1GHOJvDI1SNDL9uZdpCsv5blp9nUw/7DT
 hd/+UyKueuFXydpXd5rPjm3NfNEVzcOp45wlS6noHiPnzIELhzl3Hzhc0vUms53pSYANWide1xJ
 6Ztgl83Pc/s/sPE+rGUk1K6hcrv9VoCq6LSQu4vdXh8TPI9K4Na/aon/Ra6yoVLJvsnQxojRfon
 DTm6PEow6+8ebCLXACWFHRQv+ABbwIqfpTJWua3rdTjEGaXH4pnMSUnUifN+KoCqFxWjVtgas/G
 /u9/Z2F9MJokuCOwfMJ+Yb9f4Zi0nJIdmcLzs5ed6HdwsHf0yvU5ooo21sEtkjuLcOT+bzBxssR
 sS5J9ua1ZA2pCAnuyZg==
X-Proofpoint-ORIG-GUID: H9gPiK4gpHIzAVWGVB0HOuFmJP2RCv7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130206
X-Rspamd-Queue-Id: 1262D53AAFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	TAGGED_FROM(0.00)[bounces-107479-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,3d37000:email,3c40000:email,qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/2/2026 1:38 PM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 166 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 0e7cfc12b0d2..4abaef42d7d4 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
>   */
>  
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,milos-camcc.h>
>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
>  #include <dt-bindings/clock/qcom,milos-gcc.h>
> @@ -1554,6 +1555,171 @@ lpass_ag_noc: interconnect@3c40000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-44010000", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> +			      <0x0 0x03d9e000 0x0 0x2000>,
> +			      <0x0 0x03d61000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";

I re-jigged the registers ranges for A8x GPU/GMU. Could you please
follow what was done for Glymur here:
https://lore.kernel.org/lkml/20260513-glymur-gpu-dt-v4-5-f83832c3bc9a@oss.qualcomm.com/

And with that, you will need this RSCC update in the driver:
https://lore.kernel.org/lkml/20260513-glymur-gpu-dt-v4-1-f83832c3bc9a@oss.qualcomm.com/

Rest looks fine to me.

-Akhil.

> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			iommus = <&adreno_smmu 0 0x0>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";
> +
> +			qcom,gmu = <&gmu>;
> +			#cooling-cells = <2>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&gpu_microcode_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
> +
> +				opp-264000000 {
> +					opp-hz = /bits/ 64 <264000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xc8295ffd>;
> +				};
> +
> +				opp-362000000 {
> +					opp-hz = /bits/ 64 <362000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xc02c5ffd>;
> +				};
> +
> +				opp-510000000 {
> +					opp-hz = /bits/ 64 <510000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <3972656>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x882b5ffd>;
> +				};
> +
> +				opp-644000000 {
> +					opp-hz = /bits/ 64 <644000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <5285156>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
> +				};
> +
> +				opp-688000000 {
> +					opp-hz = /bits/ 64 <688000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					opp-peak-kBps = <6074218>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
> +				};
> +
> +				opp-763000000 {
> +					opp-hz = /bits/ 64 <763000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <6671875>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xa8295ffd>;
> +				};
> +
> +				opp-895000000 {
> +					opp-hz = /bits/ 64 <895000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <8171875>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x88295ffd>;
> +				};
> +
> +				opp-960000000 {
> +					opp-hz = /bits/ 64 <960000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <8171875>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xa8285ffd>;
> +				};
> +
> +				opp-1050000000 {
> +					opp-hz = /bits/ 64 <1050000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <18597656>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x88285ffd>;
> +				};
> +
> +				opp-1150000000 {
> +					opp-hz = /bits/ 64 <1150000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +					opp-peak-kBps = <18597656>;
> +					opp-supported-hw = <0x3>;
> +					qcom,opp-acd-level = <0xa02f5ffd>;
> +				};
> +			};
> +		};
> +
> +		gmu: gmu@3d37000 {
> +			compatible = "qcom,adreno-gmu-810.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d37000 0x0 0x68000>;
> +			reg-names = "gmu";
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "hfi", "gmu";
> +
> +			clocks = <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
> +			clock-names = "ahb",
> +				      "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "hub";
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gxclkctl GX_CLKCTL_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +
> +			iommus = <&adreno_smmu 5 0x0>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-350000000 {
> +					opp-hz = /bits/ 64 <350000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +			};
> +		};
> +
>  		gxclkctl: clock-controller@3d64000 {
>  			compatible = "qcom,milos-gxclkctl";
>  			reg = <0x0 0x03d64000 0x0 0x6000>;
> 


