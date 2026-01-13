Return-Path: <linux-arm-msm+bounces-88672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F312D16F01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E101301A482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57DD30DD3F;
	Tue, 13 Jan 2026 07:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEN96sZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDia3WrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845EA2C3268
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287686; cv=none; b=D+k2fivSXnIupjH+z8mHA4VFgGqGTedZjlXaz1FxueRBcBg4tWocDhnQCdqIa2QRfJoGjA7uIzzUQumWqnJ/CxvLy0nDgxP2QQHr+jR5Lc1Cep6UOpewN22AfpjE2UZ8i3enuqK2GT5NqvoFPWb64hNvOqHJYarb0AygzQzns8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287686; c=relaxed/simple;
	bh=vH63IuFl8uiDHEz6sPtIIOnAcarfSJUDtushthPddfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QODkhl/eUY37E3B8VZ7R9bw7j/uC7Z89owlAMjHOj7AaAqi7B28DwYAnCT32HR5E/+t7XbF+tTiftptJo0ESIH5fUN47yEiuu/ZATIWEhPnwzER7RMWz+CH44YdR7Qrfabw/a9N0z0ugKE9fq+/5jazHpdevw6w5N/lWEEd9ODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEN96sZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDia3WrE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1tUhW2751284
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXQcprSbWpP06tY4WL8F1pW+wcqpnIIsT6KOlR0Y+MI=; b=CEN96sZ9q4LK+NU4
	3fdBg4MU70pW/aRBCX69oklZb/7PqX1n1y7h1ttPBNxO1/e2HrnaiBiXSHActBYb
	95ZrJ74hM3bqoP2pHVH/9/Hk9a9UY8OWiZX+EyYi5//dwEF7aTKtlbefkMgb1Yjz
	Tc+uxkwHGSsEDDdxgG9ltL9YpqBTo/DjFPadaI6/SP0GsbI4DWglmSWIY+Xc682c
	kBRWOtTq8IWH4afowA+wQtYIfvzhGYAFELjOM8QeGcYDCMu0yCFFl4vgu2iWOyGD
	giYUTkV3z2JHzaUqJxl91yyPIY+78Kif4klGz4g2L+WyyM4nHVTe+fLuUY9nYCjA
	led+Jg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjrrdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:01:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb0ae16a63so829179885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 23:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768287684; x=1768892484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aXQcprSbWpP06tY4WL8F1pW+wcqpnIIsT6KOlR0Y+MI=;
        b=cDia3WrE7YSWMgVzdvEx4liUuEuOdodSdxmtdwrYxB98IHXLKuj7DXZCkH5HPtPEGR
         3PRSnmOBZjSNYSVSlspx5AHrU361Z/1sgAYO2B6K5djaFYKf0YLmah8Fq0ftYjZnxkm7
         YfITRN2eP6+etXtatFnU2vNFUk0yj5XyxAUS0I3OWdPbvlRlmYrqNEC68QNzzuatGkg1
         sIqZcn4ZS8KvmwGyciOn8tgit6qLNt4CbVPCiLk0PDQ+crt0o1k398DBKIiaSmv+pDvp
         tWNnP9B7nsLCJ7LgDqbYS/cO0MLACMUyObPBTULNijzUe0mYyESicO7SIvJl+4iiv7mD
         ubQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287684; x=1768892484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXQcprSbWpP06tY4WL8F1pW+wcqpnIIsT6KOlR0Y+MI=;
        b=UKMYoAoXjIvXy7ZskM1UeKZyJG56kBabW801znFoKRKFBuI51JIBE8RfMUOLsP5j4j
         Eo3jtwdhQfftEErsN0VVJl5Q9dblosatIaysU6kcZDzT31xGHBAf9A7Xc/V/p2DhyWG5
         qOuipTL2EUQDb5jQ1TwfJkRc9rmGrkaoBTIQM2E/Ypwe5ScZthtQSMkOOyl5e8JJeF/4
         u71SVz4FsbDqtAm/RV64WNe2RnrZYZWi2d2HijtKTYJ+i0uS99vcDLzTpmmWeWQxFlvG
         FFix1pN7A2Aj7j0tDhpYTOw2vpXkjwar5Wofd4pYYC0wXMbhyxX0OaBIvl/bC0fAZJ6k
         mC2w==
X-Forwarded-Encrypted: i=1; AJvYcCXpT+Q0jgQlMReKTMyawdHVlGA4LNVoPU+fDcQj3mXPxWjgYjqQ0v5KomZHYRYkmCqbJDgW1N1r8xViE6Um@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGQhawEstT97OdOGhSTd18ldkazQU8r6ewHuqyjVmdjQizhfu
	vsAEc+MLIxTwSCogQFga/9GqA7xiPcUEV2pNYztpqekv7J1gSUBLB3EB7EpBo/Zhst65wuA9LXK
	K12kFhO7u7wnggDTFNxXwURCo/eNI16sNi/Elt/h9mMqHLzpk3OfHLtV8JNfq9akx+8+q
X-Gm-Gg: AY/fxX5/8DRg5rUY0Beiqb+WxViFx5LrtQx/7ZJiQksgZfzai/QDstIbb1E0irkl/dQ
	zDczZkpUT3Fskve/qnOd4pgwHGVBNXJQEEiNYxVy90Vg7N+RvIsn+yXLlW6/XWL1XxULv4yHhAW
	xK7MvcnM9zyQaYsOczdbymG7ImSQ/uQchWPDXg4wqlziwG3twZeUgmKRgmowXNYJ24/qyvsPNoZ
	HEp4oz2uqbLXWeMfrsDLPZ4GL878WHKGPbWeJf2Eo7xcdVhbEXptPDdWDL4AQgZVMRvOojzBkyS
	bVNWrPWdyc8E3I5KatTmUwNU2ON4ce5IRtmQ0T/2QRNqQppTTF9pyxV33qlPMw6mbrnE8YYJKk3
	i2lpieUW6QMDrNefHGuZ3vjQt8bYpmCr+EFFQV1IfArDs5GJOsBR5hzLCDsKF5hztavYD2HBPBH
	XIVuEDTrHzbdakfHPceSPU618=
X-Received: by 2002:a05:620a:3911:b0:8be:8e2a:3132 with SMTP id af79cd13be357-8c3893cd7f1mr2582006185a.58.1768287683560;
        Mon, 12 Jan 2026 23:01:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHViNFPRf43wJMq7N3oN0ERKUBYaBMdd3Ccd3RWzK174+8fpW+ZGUBifAcR49KhMTOaYzUIuQ==
X-Received: by 2002:a05:620a:3911:b0:8be:8e2a:3132 with SMTP id af79cd13be357-8c3893cd7f1mr2582001385a.58.1768287682940;
        Mon, 12 Jan 2026 23:01:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6fa7f0acsm4588036e87.99.2026.01.12.23.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:01:22 -0800 (PST)
Date: Tue, 13 Jan 2026 09:01:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Message-ID: <4oegbpuzqdr2v7sdi6ojyejzs4pcstctkpllhswuymh5pek77c@yyodmmropodb>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
 <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1NyBTYWx0ZWRfX9wBblWaTcJUA
 pWcSUdXRFyxgQBfe5dggWOZK3o7I0Pn3U0Ou2xY0/GPW+u9+eicmthaoM2GvpzxxOnD+k5eOIvt
 IQeWy9JrXby0aBT0JEg9B3ZSbV86AefrsKTxhQY7YNHOw9pcwAnU6iCpmShdUT2PDpmfex3gXLJ
 lsAZG6EnZboTzM11TVRM5J47eFKfLKB5l1MYmu2ByukVdmO88LJSuSm5iIpxKVbX6rOK6aHYg3N
 cSqIZFEQRaVf+AMtFm3SCAE0EmcI4NYyIlEwV2Us0xlwgpV3z/KfwUs5Swex68/NO3tSUCaB/He
 V+jKyNySTuJp768ws7F7kUQ/125wwrrRsYnPTq3T7+Tq+i0KgP167yVM4/Q4MtYE0h3gL/O5ReD
 lSZviN/m7iB+Pdy+UCVyni4m5g+gm7LYIxqlglkoTqaR3GWsndzVPfIlMP6bO6WCPXusdKZ0OLP
 yxTn7LnXiOzwKtxurtw==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=6965edc4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=MxFkaXIYAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Vlw9s6kSZOytnfEpRPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bWa-HqqoEbs8MZQ2NTq-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VIYgVFtj2-C7wJzPbmtKR2eV9zxYkL2k
X-Proofpoint-GUID: VIYgVFtj2-C7wJzPbmtKR2eV9zxYkL2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130057

On Tue, Jan 13, 2026 at 02:29:53PM +0800, Wangao Wang wrote:
> 
> 
> On 2026/1/9 23:02, Neil Armstrong wrote:
> > 
> > With the following reverted:
> > 456c99da41cb ("media: iris: Add support for QC08C format for encoder")
> > causing this: https://pasteboard.co/t8HmeNaIFMDR.png
> > 
> > Nevertheless, the changes are functional and output are visually
> > coherent with the parameters, so:
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> > 
> > Thanks,
> > Neil
> 
> Thank you for helping with testing on SM8650. Did you revert commit
> 456c99da41cb because v4l2-ctl couldn’t run properly? There’s a change in
> v4l2-ctl that needs to be applied, please check.
> 
> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u

If the kernel changes break userspace, then it is a regression on the
kernel side, which needs to be fixed there. You can't demand all users
to update userspace apps when performing kernel changes.

-- 
With best wishes
Dmitry

