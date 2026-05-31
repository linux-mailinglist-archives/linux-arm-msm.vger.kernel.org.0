Return-Path: <linux-arm-msm+bounces-110477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO9uNu1YHGq7NAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:51:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED0F616FBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E27F301D330
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 15:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A57224B15;
	Sun, 31 May 2026 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhZHHD05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cr3DgQEj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742083905F4
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242383; cv=none; b=PjMWiutyiTfLNDqgoJDqJfPZnfsy2gFk5Eno4GIRjeE64Fex+i1pTwpBulRSO9PUOoqAfXz1B6hPKJeufoVJZOmlwGUSm+OwYcNuWcMtHoO5+4btEyovDYZ0optwDC5yFY2Dta4hhFlEeWYox3U8Y7syq0EFmSL9L3nJ12kf5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242383; c=relaxed/simple;
	bh=tDRhPY72eH1MEmBS1nOw9h8VQfe8ypT8HiV/251brQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlUXSHrz5hpx2V/ZP39SX+v0ifH/G9bZtHLpOyCCE1DPbDiLivLVZLGGI+cYZvQQsQdQXMMsYxTR36y8tm9tBrQ1zfhtHpn1aiB4Wh/Mur74dwY6XOxAVlgNG/dHheLgKDCiZi1OzEgzYMxBMTxN5jGikZonZGssLOFCALSKQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhZHHD05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cr3DgQEj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V0n1Es341360
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=epu/m1cvWH/gMxE1VHYbejyh
	UddjLIYqkFTpjmCCs0s=; b=FhZHHD0515LPy1LXnlyjOV+nVDT3mUfKiDOXzM9g
	qUfnOY7do1N2DAm3batsMoalFpce7/Kw1AQalfdYJHaM6SFXZYKOPIXOB3eBamdp
	wKvDesaDkwSIp9LRITI2+Nuvzs0nPIVt5TJKe+UTc+rDN9Tod/XoroOK2OHLR9H0
	JFTIx2oUXmrXaT1VeFGyJ//k8k0gC8pDqfwzNs0eKwMo+53R2dfb3Fgzv3BP8Spg
	KeHWb5hDERAvXLrzkWSdeFHiV6ENNnqddOocW7DUTRr8GiYgs/2Gnv6NcE8VD0lo
	7pXYUAZwVXqEq8EPSZTLE/oetDRne/xDXjwRtHiOU8udXw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fc2dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:46:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cf9627010bso716944137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 08:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780242381; x=1780847181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epu/m1cvWH/gMxE1VHYbejyhUddjLIYqkFTpjmCCs0s=;
        b=Cr3DgQEjAdqo12++XZ/RBCYVJ6Y+bTKgum86LcRgBjpHLdELXQqJ1PnlTsMLxzdamd
         mQvL7gKS1xWx7TZZzXlmTTby58r9BC5FAeUS6a6eaUEWNcjj3URj03h7N7InOIzMNsIG
         9sjgNvhQrOnCdQw5VRXFxuWUHVFnypB+QuBfNsYChA8Zb8ktcy5JE3PYoxNgayDHZr/q
         t7X3TMR6Dd9ksyZOa11sRNY+3hOot6qvpYGjyJPyjqTAwmVYV1q5zeZx9uAlxShpIgkl
         fNOHLqJ9Hk6AfE1zHL1ek12FKt4DD53/N8B7ovTHJk1y7wOYRLIAcqymkW/FBmB0Q0Uz
         iL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780242381; x=1780847181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epu/m1cvWH/gMxE1VHYbejyhUddjLIYqkFTpjmCCs0s=;
        b=G7xsLm7tV7tVo4w8MXApjNxHS7rqW2cNjArOGJakzBl9tzgocw7jsCXlz9Okd4AiHJ
         YraGB1Lu4hIlqF4sBeHtH2CLMs8pdUcY1oZaUcEJ3B0RanItMCmUWkuThGeiM/3r9+dl
         jjh3stSQclaHbzkO3U2X2CMfOmCjRV8V7EELhLfvX3Sop3ibtxr7IxmYs02OLpH0fWGX
         GAEbNFTZZyG7Z6vbWbJPBnR1TplvWRd1s8Pue+/GMA3kh3T80j8ahecTC4DJOMOyAo0I
         Jlu3I841eNBpqCFIOz6TqhJi3cynlfSTBLDfkibtQo2xWlm8dtjy3Yy5Rim/kYsrEmXb
         C2TA==
X-Forwarded-Encrypted: i=1; AFNElJ8OrcBA5eMN7EicYMBIbBonSYe2PoJROwvB8wqFkHTZKClDDLNPh2/yLBknmzOeuWgTiIULfsdobCXiEWbK@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQIO0w17ms0zecY2v+WiIRgnqhx2Wm7hyjDGXPx6nbSqpW2GN
	jCHpgs+3v5i3Cqbp8G9SiMDjeaVKabIyc1lqGHwnWeNZmvM2k56UqzVfTbEeKnnrkxUJWty9mHj
	pwGRaSX+AaMgZlUtisQvgMlUyt4H7k3LzKzXowDkl3ROKm4V6ULZOyrA2kWJbcg+QPfpJ9q+Qdl
	2dhT0=
X-Gm-Gg: Acq92OEBHtDLuWLe+HrwuY36nBonfJHiVHusDg7NbFp3YkE5xfFgE1usbcjvR5qhceh
	ptawQQyILovRHZ3eVUqs5XhTv13wij80QobAzD19q6dY18I/zKVJDBZpM1y9/LPJQYPqln9zT6A
	BwXk/UVcaF+jHfmxmtPviyVL/rQQUZRljgvyd/MNLbzbTRsCFcI6cTVHG12aihuye729Z3Qp0kJ
	L2V5PzsMfwVqb5UlqCDl/dSR3m2xzU3j7L52ER5eKsRDuBycqMGU1pQpp6GiH7Tucx9W8rpAHJ/
	ArmGKf2GeMPPOuo03cuvB+q5UVS4GQQiIm/dgIfvMP7gIfOfjd2vwhftWL5ZVyJJ/Y/mAIIwPvu
	0iv2bGXDshKXUebbNe53YFV/7Vvf4VuSayb35xaY+BITPr3vpRBQSd16rAj7qulgY9m7oVNV7LD
	81uuOdzID8P8uETx6Hen2Dif7CxNffAVwqtA9U4odTa4C+Og==
X-Received: by 2002:a05:6102:549f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6c684ad0f5amr3004747137.14.1780242380803;
        Sun, 31 May 2026 08:46:20 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6c684ad0f5amr3004740137.14.1780242380421;
        Sun, 31 May 2026 08:46:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07baf9sm1543041e87.31.2026.05.31.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:46:19 -0700 (PDT)
Date: Sun, 31 May 2026 18:46:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: add MSM8x60 LCC (LPASS) driver
Message-ID: <vrvmex3zvbwbtobccithsxbel5rp4agpnor62ocadfnwbasq6g@rt7hahrlp4sf>
References: <cover.1780148149.git.github.com@herrie.org>
 <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
X-Proofpoint-ORIG-GUID: Ftco-6PId-KjgmOP0dP8bZuetMwwg7Z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE3MSBTYWx0ZWRfX6JWx9zsSP2KN
 juNngqhagjMrCjpu7RToxMOnQZdv/GsZpkf/pNahfKA19sZgNvX6Igm/KlOGUTxLiCYlBOAs1UN
 6056ft57xTgmMb2jx6rJqSNYPNvUAkJMbeF1UGvObEpmTckO34jXKuiP7MGeEAe8UH/HqAqFW3L
 b7RQT43jHae4uE/9fpWeTN+2UG3r9FznRsNzN/ORUDz6uWPc+BIYAKYYY0LPe0/GHppV2tX63BR
 AvMC4TqVQQ1BdeZJ6NPkpWN4gtBbdGU7M2zAPbgXS1A3ytxXCO2k32b1iNOgvZLxzvz/2Av/tzM
 ypHxbRf9hPkcFujaUoVSXeRXwp9dSrl1DFLRbtiaYb6k8Vaonr/RQy6sLoJqWgex6iP+BpUDWyX
 oC00Z9TCnB1uONW+9aouUOhd62nx+LqNY2fTFWirK5mldmituT/QxVqdNHh8PcZkNqNIhNf3AdP
 q5FMW9SEfKk6coL2KxA==
X-Proofpoint-GUID: Ftco-6PId-KjgmOP0dP8bZuetMwwg7Z_
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1c57cd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=cTwmTnRGAAAA:8
 a=CMVvGDE1AiGxj1kctLsA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605310171
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110477-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,herrie.org:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3ED0F616FBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 03:59:58PM +0200, Herman van Hazendonk wrote:
> Add a clock driver for the LPASS (Low Power Audio SubSystem) Clock
> Controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060) - the
> Scorpion-class generation that preceded MSM8960's Krait CPUs.
> 
> The register layout, parent muxing and divider topology of the LPASS
> PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
> driver is simpler than parameterising mmcc-msm8960.c. Both drivers
> can coexist in tree (different KConfig options, different match
> table, different device-tree compatible).
> 
> Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP
> needs functional MI2S / SLIMBus / PCM clocks before audio playback
> or capture works.

Could you please merge these changes into lcc-msm8960.c? There are
minimal differences, so you can just patch the definitions if the device
is compatible with msm8660.

> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/Kconfig       |   9 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/lcc-msm8660.c | 517 +++++++++++++++++++++++++++++++++
>  3 files changed, 527 insertions(+)
>  create mode 100644 drivers/clk/qcom/lcc-msm8660.c
> 

-- 
With best wishes
Dmitry

