Return-Path: <linux-arm-msm+bounces-52091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BFA6A7BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 14:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8A9A1733BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774EC221F12;
	Thu, 20 Mar 2025 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWrYHxr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25C23A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479112; cv=none; b=DzrW9OEG3vD+rhSoWNVWscqjo12XRMqCALzUmFlY+8/C9caTKdHaV87Ab7LN5FG1tppIFsuoBnmuYt+OKJxxu6U6nHQQ7E1mUH00j9aXYoboQ6mK6LD088IpwrE26Ry/YDc6tqhu8MEyMOXDzR0WsqntRe7x43rvFxRJb4694G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479112; c=relaxed/simple;
	bh=YgvuKEZ82WueEbmg4lKF2pJEcbOVzlhiTsYtcY4I7O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp9yR+DfbMbt+1lwyuGa8e60xCnyqG4V8XHuL9Na6NIuIkfl8ur2JPlTmDo8L1SZCR+heYZJGFdBdKIPtiqLE8Oy+7/3SEhV/96bpYBwZin5KmsSi9wS/guSe+xpoQJAZhcCmSMngyZvGzxemng0r70m4XRx8jB17/nodBslXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWrYHxr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z7fw025416
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 13:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3u0JwHzpVv7+HNs86i6YT71w
	f8BI/GSn5CzgGwf5drQ=; b=TWrYHxr4JSlCLJ/oA0EuN0/yRfBCrAmbOaJqjvmq
	wBqvdDDqKgOABS/Bg1XkXLHHVh390PS8WRhnUry3Z2JavRgLzAwwmYMtjpvevhj7
	VZ8adkh//jIIsap0z7F7UHGreVmqFlOq3WYYX1/qryIvmEUINKTaiHrqUfbC89xM
	4VRVeQStwIDFBSOMk5ObfwzzhvuGsa76yb3VubmzdqRbJbWFsQdIc49PXgCnmUpE
	GLCPClD46pDdQxm51CuX4n1dK6jgIOHrM5PSscg6jsLuB6NXPQN44CLe15aYu7G7
	oo4DnvzhfJ1C3EDVNO7RBunWaYxd013lZNQdxOmSaezU+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y38bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 13:58:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so122217885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 06:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479109; x=1743083909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u0JwHzpVv7+HNs86i6YT71wf8BI/GSn5CzgGwf5drQ=;
        b=LDi/LUnWFOQnQSqnL7tqWw16h7bI1o2Tub4poyOwgK5AvDzK6brcm2ccpuXK9OD2OU
         NZUo+9lXFmoOi/6nfcIdAqJ/ihujNv31ll0QCEGfC/nvwSsAPaMaahnes+aA/0RjngYe
         2IFko09gEWg+NjsFh1mbbix/3soFQwuUwt90oIHl2PXXNaHLMmRhjxHZgxQIs5+mRn6R
         ui9UO5HLssl0chFkMsCe9pE18yyOWqzgHewMk6wyBlxAJ9a3JvtQyFW+9VcPfw/BfCRG
         UuXD/ViqSF4QEGyIVGvVYysdt7SBJqbRMEvpGYZ4MS9uhtfYKIeWrCMwwLwmwCFN3t7d
         EmYA==
X-Forwarded-Encrypted: i=1; AJvYcCW6ESsbOgi+Wo6iUTNULag5xOUPthwUg1hhYCTxhFZoPT1ogQRWNOdNgwjFLXOvKD48r6BL6U4G9wxwgia7@vger.kernel.org
X-Gm-Message-State: AOJu0YwAj+C1gEGHxaoSoat7UqRnE1Bb9WkQ6erYh709UOgAynlstlxa
	RabIjb3CtBh+aZNCdWzoKqFOBaLdSbAs1XQZsmYbR5K6Fe/aHm2+x6HMvrQWhdPWpm+ZZRP/Sox
	Ju9rYphfl4J1RGij1dZ2tcGlDb0GlouxsHtoV0LTsP0p3rlAek2OT1AMgy89Ej+Vs
X-Gm-Gg: ASbGncvwXB2OH+mp2MMU0GEdN6hr/PVWIOavAMZLY4Wrwwi5MipTzdbWK2YKRHo+ukS
	MbWQ/KxmSo2l2aA34gsJWd01ttYU73SmFHCEi+vCyB7zindkgxCyxc8JIUHfEI+eyL6iZJKajOS
	3+uYpSXM1ASikmwnBJpsQmydNUe/CjpOyKJyb3bD+ZMBBlz0pgKX016yHcq7Gn4kJZshxVcLPPY
	tA9dD+2VKBaGtArqXr1IRJhDhtaQcKqFX6gkomzFIwid6U8+Ql6hTkn6fIIg3RQg7KhtaTjjxqm
	9286fewcv2CoVumRncxyJclVnqcTUgJJ7LXcy0o3711ssfQ2LEwH7zNZcLyMMy4VE/3DVkoT5MR
	Xfg4=
X-Received: by 2002:a05:620a:4593:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c5a84ae82cmr1128474085a.47.1742479108707;
        Thu, 20 Mar 2025 06:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM55sLU2KpWX4UC4SBggnkyK9JKrQtXsw+ffsbau+k0mYKvbmbCvprVsdEvzrdFUOzIhfKlA==
X-Received: by 2002:a05:620a:4593:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c5a84ae82cmr1128470685a.47.1742479108318;
        Thu, 20 Mar 2025 06:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a830dsm2272394e87.37.2025.03.20.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:58:27 -0700 (PDT)
Date: Thu, 20 Mar 2025 15:58:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: x1e78100-t14s: Enable audio
 headset support
Message-ID: <z34vbkdvocuxjtnqwce7rbiwerrp4gmgfamxreo5swts4pvt54@h5u7tfmjdz5j>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-6-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320115633.4248-6-srinivas.kandagatla@linaro.org>
X-Proofpoint-GUID: WwMxHBqig8_j7qhsqWEkfIWRDgn9uhBX
X-Proofpoint-ORIG-GUID: WwMxHBqig8_j7qhsqWEkfIWRDgn9uhBX
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dc1f05 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=hJRnET2hOHO_yKWgjAYA:9 a=CjuIK1q_8ugA:10 a=kfF742M2HRgapxr-WXtP:22
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=935 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200085

On Thu, Mar 20, 2025 at 11:56:33AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
> support CTIA and OMTP headsets. This switch is used to minimise pop and
> click during headset type switching.
> 
> Enable the mux controls required to power this switch along with wiring up
> gpio that control the headset switching.
> 
> Without this, headset audio will be very noisy and might see headset
> detection errors.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index b2c2347f54fa..b40775c20493 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -19,6 +19,16 @@ / {
>  	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	/* two muxes together support CTIA and OMTP switching */
> +	us_euro_mux_ctrl: mux-controller {

This node should find its place so that the nodes are sorted
alphabetically.

> +		compatible = "gpio-mux";
> +		pinctrl-0 = <&us_euro_hs_sel>;
> +		pinctrl-names = "default";
> +		mux-supply = <&vreg_l16b_2p5>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  

[...]

> @@ -942,6 +960,13 @@ int-n-pins {
>  		};
>  	};
>  
> +	us_euro_hs_sel: us-euro-hs-sel-state {

This one also should be moved to keep them sorted.

LGTM otherwise.

> +		pins = "gpio68";
> +		function = "gpio";
> +		bias-pull-down;
> +		drive-strength = <2>;
> +	};
> +
>  	kybd_default: kybd-default-state {
>  		pins = "gpio67";
>  		function = "gpio";
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

