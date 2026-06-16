Return-Path: <linux-arm-msm+bounces-113293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id epzQNKmVMGrrUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:15:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E7868ADAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V3bH+pTn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UtJiCWR8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113293-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113293-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C89A63007B05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245181FCFEF;
	Tue, 16 Jun 2026 00:15:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EFC288BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568924; cv=none; b=jD9WGXYjWZ5G1s/lg0bk9on5F8rkDXyP6Dw3DLT/nS1oyVnxUY3SBMzTj99qX6lZoNmgvcaFedUxDDu8YVAwYhxp0/X+wGC+E+aHi0tul07Spe4EWrc7K0Z3sNUWw0RmZk0grHsMGMvjaIA964mEUOZOUgICHz5tSehLghBeo1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568924; c=relaxed/simple;
	bh=F0dxFyh7+0Lx5WTGp0pJ8s9poU5YYBdfAd+ODs7ztQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLGzKMZElFqjYNOZ2X/DuGCeiYc0oxyhlZP3gGQfuFWHI1BSovhCjZQONe+Z1q2we9kMLUsahgCkcup+pLLZ+EVwDpICuHC28Tx8Ae/0XtXoaBJUGl51WYWVfHUbHsiw0IqtveGSev1Bc/nfzlpHoH2cQnE1wsQFpDLCD/9V+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3bH+pTn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtJiCWR8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ0gQa1453158
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xOJyhGHw0YkzQBzfvXwCpUig
	IAyGz5Dz4EIUhlUhfmQ=; b=V3bH+pTntsNRC0WIupmpFnnbLbT+4KI3jMYQRYgc
	2PotYsY2j1ev1A5QsVpWsNKItTPs62Ih6xJYn8AJVoYhMO2laQc4eHMqmMSzxjVO
	bGAkRVK3sd8FZIiK12P8fbxIo+eWS8ISMrpXmyDPIgHp/Z7O4zvbV5HlFIS4c89p
	9vxRROJV0yr02Sid8m7gvkbl6LDhmGXylxxA7HLdwjIAzeU45Kv5PCmhMI3Uqkly
	8gnYp6Ico8aaCX7iSjuLc9+BJ67UaagEU4D7BpACB1bTdNJ0F7MwECOFY8SDEK2J
	zIdwRxdXC7sPzDJS3J/RVTuGtsiA63i8KX5STP2VF79QCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cc8tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:15:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915767b341eso383444485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568921; x=1782173721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOJyhGHw0YkzQBzfvXwCpUigIAyGz5Dz4EIUhlUhfmQ=;
        b=UtJiCWR8DtLLN05hzQvVur58J62JZP3b8ScokzbL17vS7vCoJAj0pO1kI4shqWZp1S
         5tvT3VRTcU+xPf/m1YnSGRPAfhOB2d3Nn1CqU9kQvvo3d1wgoSnSw6f6cuI8Hl5sy7qv
         NkzGWVQ+lOGUCPwjX5Vcd0QeqbMpK/LV2A6WBhJN1gm7NReDlowbyj5+34T6J7InXcm+
         +0o3YnhvrVMV+3Urw4ODvUJmt6cgNmCxZ+WgOVYpr3O2lx7TOfUO6mPCAOFR3kJG0tRh
         shPEpGWhMvMF3vGrqs1VQ6zPLw7S/Tk6wLTgaPMKD7piZB2mVxBGt7dzB71p9hXHG5FW
         +g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568921; x=1782173721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOJyhGHw0YkzQBzfvXwCpUigIAyGz5Dz4EIUhlUhfmQ=;
        b=LuwrtUkbNfQJp4mMCxDvayGkZtyNXZS5sIxsMZJLjY3dG1YoTNscbzw5XkUL2JfgCE
         nrs0UFwrYWjsUvKq53CO/VnWMIoaLG/n98Oh06R/o5hY6vTseI0WxWm7ETCHqC3gaVi1
         +63o9zm8oamdgJ4c6zl2DiOhAmFHDt+p/PL+noW7+HAn6VFDynMNb4opjzMPwBS+74dF
         +cVclBFu1vlf+jSuzqyhN9/KXPNFUyjS5nnhCZiMKsA2lYtattLDj72Y3foq2p17bWB4
         1+iH1paISISOBb8sUbPvim3KljYX+wmmuD9UCgO1Tk9XqDvUzRjBFd+NbjBS3dMSCRLv
         8YOg==
X-Forwarded-Encrypted: i=1; AFNElJ/qIx2/qHem2u6Ou71xa9VUhfcDrypO4DVpItBnbYQ4Uy5vo2Gsqt/pJnZY0hA3iXYs8BPzrfqT+Asa3Vls@vger.kernel.org
X-Gm-Message-State: AOJu0YxBVWJiiuinpUmxUZUjK9NUS7okyZGzEdvXEKDBA0xdSdIR6rFU
	JyEtRj4FgRUXYj3WLNKLYMqSDgXK+4pmvk8ej6CVIs/sr+Z3CIesFa8WPqR4Q28g38MDORASRbR
	lsCf0iNAlcqDolCy5tZpoOib4Qg5TTsioi4buETuZVvOwdbN6PN1yBbE3QzjsH+7DIij9
X-Gm-Gg: Acq92OFFtnzEre/Vh+j+2KWvxVwNS0exVyOZYXQg/4QISUNPHODRdcyD7cxB512MKn4
	VBv5UCsJR/+Qqelet15CHCooFwP4BxFa5ZJjT4LZt5S4TxtXCc8YWKAxxWDjbe2xr2t/Bvr5vvW
	pppTl28zDTe9u14EZrnlhSLIOMpYd0401baAg8BQsWKc28q/k1Zyk8y0Jab+HGt4LDeNoyFtrgG
	5ulFgAOoKP4xWG4SdSUNpbWWBlS/hOjuy6Q6idl2mJBPSqW7XN0Qm2Mqm3ldgi/uMovn5oeu2eE
	nEMTVRrV4SmRCiQU/FH4AShIuRkJH4w3uVg9JbXISn84ByHdFQXeXjS+PTfrN8XmbWzGTyhjo7L
	rdgL5rwTmImYzlO0E0ySJfOBApU8zbnG6doU18GvaF+Hy/H5//XeyQN6FQHpWUWDksIibo8Ky5R
	XHKp1VnHB+Tbn50apYau26rj2Tp7uIg8bBeDU=
X-Received: by 2002:a05:620a:d8b:b0:915:5cbd:1d96 with SMTP id af79cd13be357-91c475a35dfmr219472985a.33.1781568921097;
        Mon, 15 Jun 2026 17:15:21 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:915:5cbd:1d96 with SMTP id af79cd13be357-91c475a35dfmr219469385a.33.1781568920642;
        Mon, 15 Jun 2026 17:15:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fd9sm3094630e87.46.2026.06.15.17.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:15:18 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:15:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc8180x-primus: Describe the
 display power net
Message-ID: <32shpoxn3gfohnnpe74bh5v6t4lsvhe4p65a7sd62pdnsd7lkt@pd2dmftq4no3>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-2-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-2-18d36b548c48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfXyEwC14xdThz+
 vaE18oPCGWr2Ag4n6WMayF2oOlg/otATikFBe0VT8fNsSBam9QG9O50HkGS7ItGEbbn8nVmsbM8
 /OGfH2111b3+pKZ6M9dE/VCmcJtHGP62UXTao7tt7CA2l6PZVc/BpR7f3rQQWPRYPt0Cx26DmHE
 Nl38al8x/aEFR5t7tKLFfIZ5JR8E6i73sFMTneoIkrPSojHpPhlHVpzw5XfTB4vyty2219fJYps
 NMtfUWg1Njpm4ejmbfhjjPfTQmL81x2jZMMWTvCZe5vEnz5/b+iCjN55N5mQfAJf0Xk0Bb3ZRPp
 OkE+Jx5jNrMuQ9wUfj95iHPRLlBzZWtd/1RlfuOs70av/gCS1IYgv3KVE3u1WLzNRzeGjT1oZwD
 XMqujKpUtw9rT99Rf1xgzu/RucBL/9J8+Ul4wcjE55Rab5BD38DQDiK3okCHUyur4uCQUYwzIUe
 MZhbn7MgmKZkVRDfs9A==
X-Proofpoint-ORIG-GUID: kEWsa3RGcX7qVYT_M8wlrDBGy7rzGXhL
X-Proofpoint-GUID: kEWsa3RGcX7qVYT_M8wlrDBGy7rzGXhL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfXyi+mgtAUtmyL
 evkyDOjC8Hv/zhPnvHzJ1qhRpowypSCwv6NbDL1E8/fOhKBsftP0djtbLYlOreEwleyytXhpclD
 fOuUur6/ogO4fhq4R0bWih1noZ7oBAg=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a309599 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rJj1s7GqljL9zuNtHbsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113293-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1E7868ADAD

On Mon, Jun 15, 2026 at 04:22:05PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe and wire up the power supplies for the eDP panel and its
> backlight. Previously, this was only working because of settings
> inherited from the bootloader.
> 
> Fixes: 2ce38cc1e8fe ("arm64: dts: qcom: sc8180x: Introduce Primus")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 48 ++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> @@ -769,6 +803,12 @@ &wifi {
>  };
>  
>  /* PINCTRL */
> +&pmc8180_2_gpios {
> +	bl_pwr_en: blw-pwr-en-state {

bl-pwr-en-state


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +		pins = "gpio1";
> +		function = "normal";
> +	};
> +};
>  
>  &pmc8180c_gpios {
>  	bl_pwm_default: bl-pwm-default-state {

-- 
With best wishes
Dmitry

