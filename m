Return-Path: <linux-arm-msm+bounces-77637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAB8BE5538
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A7DD4F00A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCC82DC793;
	Thu, 16 Oct 2025 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWVAUeTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB22D9EED
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645373; cv=none; b=Zd1IxWYrGLdQF8Zfpbg0BdIGSq9h2hW22f4kuqdVNMxpIwTp8HY2KN71hAotpIpv36KoAzcYWwvRiny+3v4B+jD3719l85vxnUuVRccmA86wpv11r5wGMDUD/rIQ2UzLy+ebdEBRhvAOMHpcdwcOGEpH02AaMlgPPghAk6VN4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645373; c=relaxed/simple;
	bh=yUXxrGfZgFXeOKbwMfDAKVw4I5W2VcFWZQ3AiBq7Fio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv7Hzn8cyMY6o1ARp9RQ0l2Y4tPxxF3ILAENMzRmMHV0IqDXdnV0CVCnxxOUBa+SFTO/kEYUWXtILo6n2Nd6KhrKtkqkzbykyuwxr/wQY4FuTi/IcBBiIlp+6yBaSoCPXTuO9hGdGdBbZeLq32R9eDSW0JT2NTpUK2AzUb/wN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWVAUeTX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GGm1r0005263
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NnAT7GWs/EBXvb1WM+DOP4O
	7PmA83tdp8NxNf9Dzlo=; b=DWVAUeTXtA6xisChkPA3hZBUqlRaW8phfwhLioCS
	YEGTPw8kUQU+rCrlHir5p4lbIMl3W6xXKhp1QfSMSrHDhfBJ60YB52yM38UDnHGW
	tpsWChlYBouu+qlLWdP/w2t1QG3zZqohh7pnyHX10AxJrTZiWJEjFCnc1vGbVy9h
	7T3DC39FbkHnGO55QUMDG0SaEwM0NUMAL0kJO04Zc0y1Pyi9B2s54Cenn+KMgsIz
	8bfMgy5DzX32wpX+HedENZqKhXEOqyoAlRdcIZP2v33L/XdexOGa5zFwrsOpg6sC
	Ai2OfS8i5HPyogmuc6JgG/zKrWpZF/ePLLeEcFWSEnf64A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1anwvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:09:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-86df46fa013so508430285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645370; x=1761250170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NnAT7GWs/EBXvb1WM+DOP4O7PmA83tdp8NxNf9Dzlo=;
        b=WtrsrMrxyVJUMJkga7kFkff/zmrc83BUu4WAOqItc4ZJMyDDgM/6fyNXC2VaCc2ij8
         xlygKIHVDbMalrSvqaqc0JIWAyZnmkkpuqvLFthlU/jjr0Hdf20EuCdSNeAmHsKcDc+d
         eOcKeVsSml0PPhx7d9bXt9ct+R1icO9KhSWxf7lzg/OPtzoJVhoAb5thmboSmXvCmTsA
         CLV910MsrEOgO9qXVjE1BPqodIdsnT/gq6sm09+0ojiKinYm63vt9ciEndMG7qblnNbz
         W5f38+31s5h3apcIbh7T8fl7m7yckSgn7jAbq/jB+2h8T9g+DX0RiHgz2Z//UVjjJlRm
         1T0A==
X-Forwarded-Encrypted: i=1; AJvYcCW0cFkmRqEcfxNlw/ptjozIOXvloXODG5B60ViAu/Wg52LF2IWnGqeL76xvtnNtiVyFAQhxcK11ti3j6rwD@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDKcZilnNR4XpZsT7hYPjrFZ9ANzZlyvjqauJG+KXpp6ROHob
	X5SxV7vSPPbb4R7ky7oBUMDdiAEmHtCHx+v9Kyx3LMDY8PWLErXDILMjRQeO53j9+cptepTEpM/
	3Gk0jh87/0Hhs2ckEwYxaXnHhspZGUCrnGniTyUN19LbiYaHU8IjelJbPpjVGdTdTQ5Cu
X-Gm-Gg: ASbGncvaJXReBeLzHRIHRW4RQWkcnjhDOTztuYcHYkaBk5MBb1SGwAhB2RAVjzrfw6z
	njT0yoYoYDs82YuxrxVBKvPuFZ81zm4Y2IRutMyJqLArCshgwImxhha5MvCbjyXhQcq4dJo9IIO
	5nzyQSXeJ0yuEb9uDllREQWecddJ1ND5ffWMiTEQQ7BJO8FqPIuWnmjGBJVvel7xMjAr7YJ6YCR
	HstJ4ntRkchM5RnNMnm/RCAWkX+hPCe9d4Pe3L2/FYiuKlalr+fpjQO3pXPM4efwZep4iwPhtIP
	mFTQemWedyK0V+WBT0wGzdbt/a6wi8BismOfgt+vnsEajBsaIJXurDjni8TAD0IIp8kQpWL89wn
	OdHYH3mFTezYbZdYXI0ERoXy09bR4xsOV9xafTJ4sf9zp39Q1OpmoMr37+jmb9fivj8i5evNQlv
	60tTyKH1U7Tks=
X-Received: by 2002:a05:622a:1a0b:b0:4b9:6bbf:7073 with SMTP id d75a77b69052e-4e89d35ad07mr19782641cf.53.1760645370002;
        Thu, 16 Oct 2025 13:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Mk36Krk90BdLrHtrtotYSVU1GazaMBECY7mZhgRjNDVhbGp7eXIDACXM51k42VjlHR9fwQ==
X-Received: by 2002:a05:622a:1a0b:b0:4b9:6bbf:7073 with SMTP id d75a77b69052e-4e89d35ad07mr19782251cf.53.1760645369580;
        Thu, 16 Oct 2025 13:09:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f91aasm7364503e87.38.2025.10.16.13.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:09:28 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:09:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] arm64: dts: qcom: sdm845-oneplus-fajita:
 Compatible describing both DDIC and panel
Message-ID: <o4oe3bjrnzthgwomy4y6r6swtzkylerimtgir55fgpvhjbrlgb@4hvemz3q4ho4>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-3-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-3-ce0f3566b903@ixit.cz>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f150fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=J8i-PDvN9eMQhD4ShqMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bM0Wn1ve3wLurwneZmkl5QPaQ9zM9VM2
X-Proofpoint-ORIG-GUID: bM0Wn1ve3wLurwneZmkl5QPaQ9zM9VM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX2bS8OVTNAvEK
 qCjsJTfhx8ChApEP3BRhagTa5625efTlEaxfkqctkMbPnLTnuR0D+ZHPvtQBPZVPRE4buU/WhRs
 GlnJwk+EW/426p8tLe2+ds/ergpWAxJ0D6Ekx9esDSJ0JV7qkc8QhCHCKLd6USsNvj/d7MQ70CS
 28PZB8bYPJYiSTitdgluwRg0SMsWiAS+umNtZNi9/B6jh002vksinqlXY9jqPcm4Hq6wl+QNuEK
 CKLEwzl9w/Uyxr2/7IZ8j0XK4U7kuupot6FzIIWKQUFhtZ8jaNBrXc+7x5LlK124ZR+0EjqbgF4
 eQxw4Orl6M11SA5n85aQygN/5feZmZhO82FcnUic6ZYws3Z+S4avyujOzS9qqTmiMvqQuajbo7v
 Z54ErQCbk/GQl8ksPkIgwrolRTxIEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On Thu, Oct 16, 2025 at 06:16:58PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Compatible should precisely describe the hardware used.
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMS641RW), which we have no way to detect.

I think this should be squashed into the previous commit.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 7e75decfda052..d6cd873aef0de 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> @@ -32,7 +32,7 @@ battery: battery {
>  &display_panel {
>  	status = "okay";
>  
> -	compatible = "samsung,s6e3fc2x01";
> +	compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
>  };
>  
>  &i2c4 {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

