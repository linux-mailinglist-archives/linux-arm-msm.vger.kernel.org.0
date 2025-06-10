Return-Path: <linux-arm-msm+bounces-60883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D57AD45C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 158AB189E1CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAA928B4FD;
	Tue, 10 Jun 2025 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOLrrqEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3976021C19F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593772; cv=none; b=h3YxPJtncBcgt+cbWdHiELB/wKJQweOoHRG8D5HQIoZdkV/Azi9y1pdEvOFBPnmyHFbnFo9sHpokgvwoHJTqWOV1wERuy0Dw7gOZdR51oWefEqlg74xoY/P2Krz+fAuGelpmCfCj2tk1Lrq7iFBnJG+IxrY0zsL4MV6q1j2mVqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593772; c=relaxed/simple;
	bh=AdckpzHORZ04nz52khFJp8hY694kPNdQO93ZPbWS0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT3TRB01Ys9atgpZ3ysXCXbuiHqu/cyknATxfkCUBm/2K001jFcuDHtLlAySVBEOmShA6h7gV/lUeyujEe6nDBo0Zrr3gD5jd1J1PAU77rpU3fwx59X0JDjpeeLfszXBG345yEXHcX/mBTyokq2UlMMlvvoiVYVnYjYjRIJPQaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOLrrqEK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPuAL010121
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9pZN1HLKcnKZHer+eXfm+cc/
	DOSG+5TIvmhgIGDFcyE=; b=mOLrrqEK003d+TjbzN+MMJvU0R/CMQ3T+77usO0T
	p/2wQJsNA7kaxxfjlZGNU9A9muJ4KQfEEtlTsPKg3YA1HbnamQNXVaaguG72LL3B
	4VqroCwDQEUxDOHGdmNWwv/ww5iPkhAZecz4pTyEwBEFFn7JFnAf79ID/gN8fnlD
	D04bFikUpEdcKGrdNaJdYKTa639fEjQ09fFffsbIZ+nKZY9VY0scX6UtoSdN3ffP
	6vCEMsjHA4BfxOyzn8jgwwVbqFajm3XKptDvdbIOCM17H2EFNy8knTJRjGL4pO2p
	OhrsUtT2I0JOyaPQkU0cGjsV23WPxIl7CoyYeaKH1gvbQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1231qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:16:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so1079825985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593767; x=1750198567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pZN1HLKcnKZHer+eXfm+cc/DOSG+5TIvmhgIGDFcyE=;
        b=BURN1F9pxFMJS77SUTmMQU75mlCU0n5CmqfFJkus0VOfXCzYUg5TgvCQSFjW1Iuav8
         hyblgCexanr/UgCIeK0N0VwIqM1VvfzjmuPZPHOVIq7hZVcU/zuAH0i+CwTCfaCZPFcu
         s5hzzcV7NPENkCQ6d9Gsh2bfG6l1XPBztwuPDPWlnV+YTjbprwiJM1EvuoTPdPW8sl89
         pw8heqWamwb8bQ8BJnD9+XrNlmrGhZ4qfFFxzTLF5qsCODwe/1MFr0vc0DuWMYD5m2Ve
         iJ8lBWtMA+sEaO8a5Npe/WbH3/q4dNc9b8tTSUXjGQeR1ybsNBNiePqrQllIguoZeLe3
         xXhw==
X-Forwarded-Encrypted: i=1; AJvYcCWae1gk5qFv7T++F7mQgmM7Pn9YfOC2oPZQylQwEImmy3QVL50RQ+eOh/1zeotkrrIHO8GMxebV3V3hlorq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PxuKEzVAhZn72mUgEENzbW2x5Co9wy+H4f3L9WEdlXDXbq0S
	J8cKOmaCL7lSapbkKvGnAUJ4MNRtqUbk18r3rrtVn/UBhFSBNupyKXvYO1yiAHxM7oCymN3zUwK
	rOpg81qsqvWGNdL3CCYYKqaTJOXKyx40Kk8RuaBAvD6sd3bdhvyonEl8zhwBg1NxaFC3e
X-Gm-Gg: ASbGncspQVsu5sKTWpfaz3GGopoRf+VLxNdXFDg61uu4Xr6lcGxdv8kOKXFQYdCGfxk
	ZwlEozTGOa/3GASArBaRX1uOs8JsheOajrHaKx+PfrUaKDmuJcHF0hHic0+fRBr54eHekbbAn4S
	B1GoMNo6ncLOXjPTwPIKBhG0Dd0W+xcaWw1a+BkKE2HaoP1rfL8D75la5yZDvXwXKiys6SS+O2s
	0n3Guj2rmXFoICN6mkZRLamc8AOI9a19LsVTiA5tJ4k/1jvd2/+pcEEUlcmFrJXy01t//PiewYY
	splI9ywCgAYTqZ0SFPzCSyHVQkXnTI/x7UONqkyF4lGykSX+4ro6ei2uWLvaDjiXnPorVcqQ/qS
	gcfUugQSe98UYIXYQsPGTLgDKAlgFW+yMyEM=
X-Received: by 2002:a05:620a:440f:b0:7ce:ba1d:400a with SMTP id af79cd13be357-7d3a88e40bcmr167394585a.30.1749593767236;
        Tue, 10 Jun 2025 15:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/M0hvJvyIKxc0xXO1KKdRvRgsx+vq+O0zU4EI6ADE1ohAPsKxZG+F+D2prd/gjcYfYouQdA==
X-Received: by 2002:a05:620a:440f:b0:7ce:ba1d:400a with SMTP id af79cd13be357-7d3a88e40bcmr167391185a.30.1749593766930;
        Tue, 10 Jun 2025 15:16:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d765esm1718734e87.85.2025.06.10.15.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:16:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:16:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable
 USB charging
Message-ID: <kgbfmd6ql75nw37eocsdhoj2mrvibdhnv5hixxakv75uycgujc@6umcwrjo2d5o>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
 <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
X-Proofpoint-GUID: 9bEm1rcP2UpBvxmIiJrzZ1bQJ0kPlL-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4MyBTYWx0ZWRfX+RfRDJy2tZBx
 5iKDWnjPxdcARwfAGGIIHXug0RI/CkC+6So3AlGq3mOY/fjdK5oMO9+y5x6gMIgCJZORt358YH0
 B6tOHtoLv+R6ag/FNWjivopgpRHO9mVH3mbKjbwRMisip5SKyvGc3dNPg+m/wvXOsg5ABHjvFoX
 cpRfOadYobLo3UA4o3/vpKp/Djxq5ZUK11Qlzy+5y3j/ojoeNqRwwf+8cTTl7RnUPwVKxsdQaPA
 ky1e50nOFX7yh/ZpHcOBukP+7dmIKtX7GImejPSy3aOg9Cal4569HmAUarZH3YnjzYoxEIz9sxL
 f5Pdl20zzCSxT9QUV3BWvYeu39rXRzns3so9k03QUblJD0GOyMvcTRhLLSOc6UzLq5jRwNM2mNQ
 FCuexQ9UHwR9I8Rg8PVv7Qw1JJwV3aIjh5XBZKoMRRM7BLOLiEEso+I/ATnBZMcTOpH7pNPO
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6848aea8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=UvBUG8sCUGYd-mWNjhcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: 9bEm1rcP2UpBvxmIiJrzZ1bQJ0kPlL-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=618 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100183

On Tue, Jun 10, 2025 at 08:34:52PM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Set usb-charge-current-limit to enable charging over USB for all
> sony-rhine devices.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

