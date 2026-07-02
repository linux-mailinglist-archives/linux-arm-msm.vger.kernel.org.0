Return-Path: <linux-arm-msm+bounces-116010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6i5B4hWRmphRAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:16:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3316F76D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:16:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UlTzxC5j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZmY3dknn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116010-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116010-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E25AC305E48E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC7C47DD65;
	Thu,  2 Jul 2026 12:15:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAE47CC70
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:15:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994519; cv=none; b=gQLjmgkgtNdsw9uaIyr7pxG9Ff879jVXjK1A5Vie1QMtGaT/uAXMC/yIhm9cvOJFGpOxf/ERPLZ3K7186Xfn+qXnawrimeer/d3nVL3ktWNToG9ZblLPTu0WF8ap/FVIRtKjfyOkAmfVFSza+PRI5F4wTeqjRqfswp4Ud7kVA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994519; c=relaxed/simple;
	bh=3MllCn5BW2jrVs3X10aZDREK9qNt2/q4oENR3SMY8Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjmFUCIswqhCucZMQ2Qb42H6d1Z2a7629KsLWwkEBi0Cwwokz8vYpsfKxzFO2HXRqXfDp4rQ/JdXA1JEOX4reRUD1mihqz1SAskyI3KulwH2+v4KHeX9EAPiiYITuvAIMiXg/esXv6f2Hmmfl243mMgbW4VGOXAI0V62dhgzMjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlTzxC5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmY3dknn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AWWx93460384
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VDGgtPcQYtpiwnqPVv2kEVYa
	FPC5xtBpVIXV+o0dHpE=; b=UlTzxC5jRcDHV4OgshrD3hyQkpLBL93a6jgb/d3q
	Bf97kKBx8jxKZ30pm6uEUUoN0Boi+eE93hmGy2deef58KLPO96uHzJvw/FGnil89
	71F5yijgnZxZtd5nUxwGGekWPdYUaj9CHaFbXUHCpxLSKsDnZQ8WgxNyRt+71omd
	nEIoUPteLadDEFUXCurmxDWW+hmho1icFKly5EBePvmFiaIUxVZ0FWht7TlgWczt
	uO8TBRuShIneYDrf37slY5a0AMiSDuh7Kyu8E2x41YphnNSYLbIHj96xoKpWYfUt
	3/gOHAykmG94PWkZvBn0bgTzIxYDQ1NDr7mujtHnnV9oBw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb1snp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:15:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5af6d1a2c32so2177574e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994515; x=1783599315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDGgtPcQYtpiwnqPVv2kEVYaFPC5xtBpVIXV+o0dHpE=;
        b=ZmY3dknnwbqNJBBk8KChpKRnJm10tst7ygGIWIrRSbWIAtyy8zMeNiPO+C5PvBGs8r
         es2s2tfU7K/9wtz2lKvVBso3CavxPl5LvMdb1u1dgJRxF2HU0Eq7jTRE38fG5TMmlyza
         TwlgeTF/m1gQyBg/p6yaV+A32qq5IvxTKUFRc2AWmrmcByPrpnMrjK/3+yyUDFO0sROl
         /h/dEDI58Xl9iZqoztBal/lY3zAbLOP3m7tMwsdu5fJG/6E6IMm2NqILv9LbQHwrKguE
         CgRY/+8AszPuOy/xWpYPULtnsbW1Jvzgt8UdraPJzVRUogH8J0mjqWMzKtd5ZblA4rHR
         xIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994515; x=1783599315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDGgtPcQYtpiwnqPVv2kEVYaFPC5xtBpVIXV+o0dHpE=;
        b=iIZrPOuBhPEOQjNv/y/nMWk2BX/cEfo5eam55GMt6ULGKOZmHmQrcMApAEtjiH99zj
         jUsFnYeZcfUhlON3yB4ya3uIcxblzUSMP1H1AE1dy7lpzixppZb6gjgt/IjjbUB6EuBH
         /L6C/y00Y1SnDojUqlp/54gA85AaezJ4Qtq++Jds7M4DnS4/vGYQc51wcP0iDSj2rsjI
         +KhbHuo4cxL/5lThvhDLvaUokpLhCsSnX7XpHPhrOBPukn7OfZNRBy3dXuL+n1R6OrJQ
         ELnaFwNevIcEOntBYMlLXFPUsJIsVH5Xd0nG9ka+EL0/tkHPybt1G02/tM/+WZ8mgGtQ
         cJcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPKiBOePfWxNXUncEP9GNoYP9zXGxPHZ11RHPXO2uTKWwpA3/BpxPkl16qnQ78CSuc5pDzECug938Fl2Di@vger.kernel.org
X-Gm-Message-State: AOJu0YzzC2NKI+Njq0fHDN5X899vYzr3t+89bI8ehDwF5aTvw5jBlNwk
	Zcxa1TmafTFQWBkYq4AeCKalMnzZE9jAX2YO6znFUJsgkllJG7GyKtA29UifxeL23l6OazMvyJD
	/Uab5be9VBCMeGhaneDBN2SLEeYK747MSDGyKdIlCYjnt5TsV5HqzrTyJJCUxbnEgyR3e
X-Gm-Gg: AfdE7cnUPcDh/OtSiYekjVzXP1vor8XJyAil9tf5yIjItpQGlYy55DnDmtmJrvFAYK6
	mZ/Y+d+PpEH5KM5cSO65L5BrJ5QyC6iX3W+2yh/rLSB5O/4WCFgg3/4mqbH96DEoKl8AWnKXar5
	JOPyMcbZZ7wAUTIZA8y3GUOvLCNlEY+/uN8bz0/+k3w7aOxz1WP4DzMBO2Hk9aaVOnz6yikxgrr
	LABcO9HI+NofqQW5Gh+MpCTQ4e9HpuMM9MMclq4R0+B5Ly/BRYLppFwPAzflk0FFsDBSRFkOS/n
	4gakXwKyr9+mOJysFDaN0zV36WAjMcX2QSmMdp+SphGZ3K3vTY2VSx8/t9e6A7X/OK8PrpemayB
	5cqC6XK0gGsVYtWSv4U6HwFTI++G32InKCIMqBWntmSM+qqs9EzZuV16i2avjQgxYWipZMLg/Co
	Dr5NZBxK8B5B4eOk8q7d9s2Hs1
X-Received: by 2002:a05:6123:2c5:b0:5bd:89bd:354c with SMTP id 71dfb90a1353d-5bddf6a3077mr2355569e0c.11.1782994515143;
        Thu, 02 Jul 2026 05:15:15 -0700 (PDT)
X-Received: by 2002:a05:6123:2c5:b0:5bd:89bd:354c with SMTP id 71dfb90a1353d-5bddf6a3077mr2355549e0c.11.1782994514536;
        Thu, 02 Jul 2026 05:15:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e25e8sm647776e87.72.2026.07.02.05.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:15:13 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:15:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Message-ID: <kojnsrskuifjqsrq4xsm4inz7xr6hhfvugy3vz5ogddcu5y2ia@olrsxmnevu6c>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-4-7b56e2a6a6d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-monza-wireless-v2-4-7b56e2a6a6d4@oss.qualcomm.com>
X-Proofpoint-GUID: OLdrx5Wpq1-_5d2zJ1QOeT4ZErgo-kiY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX9rAsrrj0qofg
 fyzut2+/vSLbqbjUK2o9hognwiuRJk8qSFut3A3XR7rEK5FNr02Ca195LuoSo0XGLScMJPzGEdc
 ACPQXwU/24o5OxDTknvIQ06xPo52J/0=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a465653 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=STQ2a8oQ04ts6E9hehUA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX1k8fJNf/5o3f
 MpU95mZwFJyizaVGV2JRC9F/1DHdkwMlvnXqnteybTRHeqXdnC7Q2Vv5GOXcC4XSeCBouqRSyYH
 t33VAxOZ7KfhTx7yhL8M+9XEz5vBav5+aLx87elBQ6tMU5s6LLhts+rlU4x1IoYG9kudGJ8zmrf
 YRH09t2AyZljWUkOjT3Ijr+Jy99prTBKU4Y5bxN0aH2Bf2Ufksn+GM6GvKsyGe67IQqAGMANOmK
 mXCJOnqXt342znIyFfAARbXSeIvKdEQhmMRQGKC7OdegEEiQhOjhUQHJtueGoE/z4xtBYEn433j
 nvv9YNhkiiNZi2LX1kfkoeX+CUUAaUfOoDZp1LxfCPddPeT0LJKmDe2JEiwsJQbhlMNcbEYVPW0
 yDoZxoN+1U9Si9oLQtWvizfV1MUOJ5rClkz/Jo8bNp8rjhYnPsXbP49nLotgbpZ25RsxW+Yhpr7
 U0+JKujteQDEFqnz9Rw==
X-Proofpoint-ORIG-GUID: OLdrx5Wpq1-_5d2zJ1QOeT4ZErgo-kiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116010-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,olrsxmnevu6c:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F3316F76D3

On Thu, Jul 02, 2026 at 12:46:16PM +0200, Loic Poulain wrote:
> Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> Arduino VENTUNO Q board. The module is interfaced via LGA and is
> compatible with the M.2 Key E.
> 
> Add wireless-lga-connector node using pcie-m2-e-connector binding,
> connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> the Bluetooth interface.
> 
> Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> the pci-pwrctrl driver can acquire the power sequencer and enable
> the M.2 slot before PCIe enumeration.
> 
> Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> (gpio56/gpio55) used by the power sequencer.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

