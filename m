Return-Path: <linux-arm-msm+bounces-70340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F23B3144C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265703AB055
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BF02F83D0;
	Fri, 22 Aug 2025 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvjNoG+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F92F0687
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855635; cv=none; b=S2O2FkCgpYi586NtsHS0a2P2Fuuu4XJrzvyz07KI2SyOT7rdCDdkIsoiyS9Kyv9IvmTyvI53h8Xq0+dgT1dZckkSI4e53MPRigcJrKo7pda9BAapTBUsNrjh8Nwf5HmVXHTDKm+LIIkVOoiwpL7t0nGVf9VBepO7MCjmWOlz9rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855635; c=relaxed/simple;
	bh=jmzwF7hgpK+QeNYSHRElJIUrPbgwq9GsIHmndptgODM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxMnxEvWaJWsqcgaib7ffUQC1YsLJTkWierYbKPu9o0rSFMMEdfS4U9cJeR7Cg414mCLfrvpdD1ssoiWiD4BarcZZ/wfLGWapJp4KPsUwNwwxna7DhQWz5A5zahCPPFugtGp998opSZmgWs8SZrXFpGB8biksglpF/nnWtf5qxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvjNoG+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UWlG028822
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oTdfVcHoKyH8WICZlBEizZHt
	xUjGef7BEKTRRFMZNHU=; b=YvjNoG+qJZnkXcCMccxiMYV92i/bW2UvDcwbxlEx
	CV+neUtgBnJeGViAnSZM3NBQAFxIEYLNBrzIZRoMGSYoRu77FN9sWVdm7qkJhbTo
	4KjSwDFVRssRsbw41F2grklp6e2HXOEV6AiNwepobJTfJ517ZlHRJSzY/PAzdP04
	TN/0oP8LSfFHD36NtUf1eL/NsID4M1NFGoXof5a7XrODQ1yB2fCTNjca5GGZW47v
	ZX/cdHFt/WDeh++OF/N/T1l51TcblEMcbt8ST441fMMoX4/nm2bet40a+xeT9xzI
	wuqoS2Ii4aYvgsH5U3gtLLmKJOaxsalDY0G0NkjuuNNKKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52crqyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:40:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b29461f7f5so50523971cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855631; x=1756460431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTdfVcHoKyH8WICZlBEizZHtxUjGef7BEKTRRFMZNHU=;
        b=T33Y2v5Zr5Ly50olLylfB+zMYYbuGCO+/5zENon+PIsz0FiIBQM0J9zw/X+O2RHVhO
         XxSfGlBASwxQ57UNafuo0b3lE9SmErSdpCjQawQZ7ofRon2ADxgOfSYs5jt9cAmxuIde
         lPbF5oRt8BOIqmvQBrtvQvnYieqB7xipVH917kewTyO6bR6Vt3PkPhsr6V6f8n7yzdKy
         8r72O4WLsF9dcOqeRqkcBj/17JcQ7RP8yrxcXaveDHoiVDSp8D/TEM7fDh2OzIa+WagL
         M738cqzzhCKf8zUfMCLqzD5UDO/1qj+zuBfjqOPjl3+5DBDwwD3HK/dicBJ9IKYz7OL6
         LmSg==
X-Forwarded-Encrypted: i=1; AJvYcCU6IcuRtZVrCR1E3jxMdeGgMydSuUau5XQRTBg91sJSw+AejLBHHPucp+/tNLCbH1MI04cddZRtkWu2cKoh@vger.kernel.org
X-Gm-Message-State: AOJu0YyftMbV5XBMeI4SqRgr3CA6nKYnavHtAiPyHonI4Y8QVJRpBQit
	0XVNXC0cdqMAfRbPQjw5w5LjawhgxFs8iZUiWN7XYsCW8iHRqsgo7gtwKLviYgmsye5Cjc6RRmz
	blJKIFpdmidZicaRADT2DChRgiofn427BvwL9y2u0Dr6IjW2oQtrlqdHMQeICX469iwKe
X-Gm-Gg: ASbGncvpCJ6mb27S1ylYt7xaaZBR9LBh0wDEEozlT/NF5ypmSeiV++XrkbzTdhboRoy
	lDU5aoJMUeAT92XuNGp0XE8gGX/C25mylh946uFJ3dU9sXRWBqLAG4oV8sTiYL1BenOCiVh4ImJ
	E7gZecWD/XpNzFzY1QWc0IpEG71LxaqZ6/mgYKi6deVwLD0c2X2JhHw9He4x0ooGWPjiyl2D6R7
	+4EgcPMeU2v8BsC3kB8A2QvpEObXojgpCW5zjkDbLqZoTsGhJ6iZRYjHaH6cXepDVZSrQBRQITF
	Z79rWeQ/QjNVmUrf7uWje9ch9hYHdGWpcI+gQQ6ftMMIwAcAVwNXqDt5VCG9DYs7d3+EFGurSac
	LIeRNktsuvN7n8AGCcJBdVtuArfobort6ZMhe6wxmjbtD4nqCsaTT
X-Received: by 2002:a05:622a:11c9:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4b2aaa7d88dmr21808941cf.36.1755855630899;
        Fri, 22 Aug 2025 02:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsVhv7L8dU3Sq9QVmMF8OX+HjQZsePw3qXFbwxDvx5fPbibAtj7OF1KcsW/5psLmLDmYVKTg==
X-Received: by 2002:a05:622a:11c9:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4b2aaa7d88dmr21808571cf.36.1755855630011;
        Fri, 22 Aug 2025 02:40:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a63da08sm35381751fa.67.2025.08.22.02.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:40:27 -0700 (PDT)
Date: Fri, 22 Aug 2025 12:40:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 00/10] arm64: dts: qcom: x1: Add missing pinctrl for
 eDP HPD
Message-ID: <xos3ayzhunyl24wu3nd2vqutvsx5dnffqrrp2xnouw2w43nmsw@mbfmcq75qgpn>
References: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
X-Proofpoint-GUID: sBsRq4UpsGfgPTYavAf5PiuT_BPPxk_x
X-Proofpoint-ORIG-GUID: sBsRq4UpsGfgPTYavAf5PiuT_BPPxk_x
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a83b10 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Cg9rbgvQzwxKNQwbMMcA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwBsVgkBRXx7E
 2HtQWU40al1hyogMRRHSJvbEM6QutV0sWXX4lapW5sQT+S8oMALM5P97eM9uSbfggn7UkX90cdF
 a2lVtTmdNNsRWCb65O/3SwAYCM1ZifDwq7YsdAOi8GVdQJEHD3TXiS0AyvVyeEyXPyDJqhEz7CV
 5erSKM2N/bbZKdloegQ569J1AGxCP6I8hJa+ZXKkOZ7aQZOI8CyuuPAwzah7IHajEUJeqI7+Co0
 AAmkSSUtiya1dYskkyaU2fI1UND87SIXff2cEekqhwMa4V8ADQpt99lsHDMiotaLidQNKlgiXHW
 fyca1snPwNJ25b+kLQOWknTDsc6vXOg9gQLcPk1KTwN2N2w/IDK4K+zklbEo1zsO/xj6FtF5OTK
 6nBCrJ9nIGf46Ena4RoDSZxsPcekxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:28:51AM +0200, Stephan Gerhold wrote:
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
> 
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>  ...
> 
> Fix this by adding the missing pinctrl for gpio119 for all the boards
> supported upstream, using a &edp0_hpd_default template in x1e80100.dtsi.
> 
> I ran into this issue on the X1E CRD while testing some things and had this
> fix in my local tree for a while. Chris made a similar patch for the T14s
> [1], this series fixes up all of the boards upstream.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org/
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v2:
> - Define &edp0_hpd_default template in the SoC dtsi and only reference it
>   individually for each board, since it is exactly the same for all the
>   boards upstream anyway (Dmitry)
> - The resulting DTBs are functionally still the same, so pick up tags from
>   previous version.
> - Link to v1: https://lore.kernel.org/r/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

