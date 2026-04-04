Return-Path: <linux-arm-msm+bounces-101800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPlrG+Zr0WmWJQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:52:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D738539C52A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB14A3016D19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A5C23C39A;
	Sat,  4 Apr 2026 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koNXpQTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3zIXxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE433688D
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332228; cv=none; b=pdtcdyPUIzsmR4F00fsP25HYUc26h7X6MGEMqyAPHpScxZuuYzTokn8tdWuBZpDZ8//6EXFdU6xyoc/xj7zCZilUevkxVQTZYxYLar598w+HMSveZ2LVRYg3BA9kSVvLhiBXtqUgQR1W5ozwmtgCrURbGgCUetuqO4+cLxnhghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332228; c=relaxed/simple;
	bh=oEvka2cCVwjdZ/2SaYmzaRYlycgatkm70cRMMQnqeAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTqMnDqzjYhkrs3aa9F7GiPjv/SSALThTqwuNTFzKZnEfvEaLp0banhdk9lMjt/eOLssE/IJv1zgWFe0WZs6a4pbzzhlFsFTWiV8DAk7zU11j677+8mw7g9zJjTL0VZYGtcjsFmRNzv8iM2ybphYXGEFvGkOmSZ9OsL4hXC3TvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koNXpQTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3zIXxh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634IAcQT1860383
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkW0O6lMxvTRUMJ8i6D03xKS
	5AckAl4ZfZ5ree7Mv5g=; b=koNXpQTE9zQSNzQZxGeMrvxvVxXKhSXSGHFdrTLJ
	dlcmH92/U57oK6Atht8mImYfR//83hGsLUjSekmPn+en4f/bqkhNdVAw7zcHxXjB
	e2j64B0qJrGpptHVseYLgOn59RrjeKE5fys8bRTa4Pt28xbnIpg1uJbtJUIILh/Z
	3MujT9A4MMbIdMdu3m5wzVmcz1Nmr9Cl2naIj1Q3QjWWFgXsuy/nG+UmfB1jm7t1
	PdlPdMdTkSn/JH1XAhQZJfFEisiOLQcrpucn+T+zH5y5hVlMAWw2cUlzoqHQkQKQ
	/g/C3gxqlmspBVLaLRUqzkFV7VHW4ZrRI6O1Nin9/FZw8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5sgne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:50:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so65546391cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775332226; x=1775937026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkW0O6lMxvTRUMJ8i6D03xKS5AckAl4ZfZ5ree7Mv5g=;
        b=hx3zIXxhU+oeKAEiYI5HRrP555yySSgJrTM0hC0ltUy5cDHbSRZw89bycvXdEjqcty
         1TAsk8VjecySCGNeN1kkmbUeCJN9f0SrYHFGMi8nkOixaMeRhnDuXKnzQ0kshbLXoukF
         FarmSFY9IzOWFIzo4YvYlJDCNuNWQNt63X5V+Z4E9B+l9kLLfkrakz78897ZgX6B61FC
         f3MLAdFrbh4eIHSOoDZl3pS74gEXyjxRU4PsBIP3VeYmH2KcBNDKVsfSP0ljCWN0UzVF
         1Q99bhzHAitM7aWlZ429De7kw1PxZ8VES+BZNb1kfKXo16LxmnDMFVZd4ziSSBF557CP
         a3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775332226; x=1775937026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkW0O6lMxvTRUMJ8i6D03xKS5AckAl4ZfZ5ree7Mv5g=;
        b=WU2W7uPn1mi3mdP3Gl4xcWeqBJHh2oOf1FFJKrGq0jhdt2qYWQUBuUoMkVTSYtCPWm
         tL6PO0TbqmQE/ZuJ4UXxQzYC7BmNpY0ghlQ+sQF1QYI8KZePz9n2i7e5IPyeHRAOITG3
         uCEn3r/+Y5yAvu8YChdI86aotkzWuyAkqn+sb7M22LeKibyNG2PCXsUgB2glYO8v1ad/
         FOvzBdAP1vY3RrS+exIF/DFdNFEkVyfdnDTsNRYgnYshvuHCC8kXgq7/13baTAf2dsIb
         +hvMEO1IDSZLx8Q8vCQGsgw+An0agw7nNZtdUnzWtPtLguMZbDVluaetr+YpklDs0KI6
         cydQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUgoDZIJR+EmvZDGInEUol7en9sHj+9Ug5VZu07gwahFnciS5dqc5O+GEUi0mSMO+Onu2WBFS7hVWyjHjn@vger.kernel.org
X-Gm-Message-State: AOJu0YyqI1TqGb3mk7EICV+YAcNEjCEymiDV1se8iUbFFqUWhIVSJuhw
	oaCsnF8nhEKkoRUhF26GqrHctXb8W04UCGgj2xDmkL6QkLciEpqb6qNNFz0wRK7JKlraCX868Np
	iimwzuREFWW8hR+/8jySkLpE69El7wiiUmS18vopr1h8GpsJAiISS2zvieM7gb7icdYIi
X-Gm-Gg: AeBDieuYq0dpxrZ1e+ybA1YlGS2appW1JepRryYsCpEIrRW9oZgBV76eYoalbPbqspi
	1F7iXuXNhANIwOtZDDOaKYLZ2shdoMbZhi5UYrmWAOnib7jECFD5tRl5xZdus/qwzX5uMl+uqJ/
	kQIYvV3GN8PJUxO34xnFwfSTtlb2F3PBtcjMYTNmphYkN2jCs7k4p8+0HSUfzxE3ErfJGLJzDKY
	1nln2IQQQokFmUSLYMgBq/lPtzsUwZ10cku68PCriDZXSfsrAb9s9LMiyOQ0ejslD/H0G+4P4Se
	5P6lJI/GjCzOm1LwB2Ik3d2L/7niNnfgZ1afSjYaFtk5FPE7S5dMy7lSTJLQFRBlgWmpYQUGThK
	vdE6Fd6JhbwqwWTZKHYIijReo92pPU8Ku4b5dRiepkN+Qf1Txi70eGuY3dwnlQCzeuodTWMpJAA
	8OXf0Jstdi3l3ApcbqDpg4l0/6rnVNx4IkWNM=
X-Received: by 2002:a05:622a:8359:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50d629d5696mr105025741cf.30.1775332225612;
        Sat, 04 Apr 2026 12:50:25 -0700 (PDT)
X-Received: by 2002:a05:622a:8359:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50d629d5696mr105025401cf.30.1775332225086;
        Sat, 04 Apr 2026 12:50:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd8491sm2286574e87.83.2026.04.04.12.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:50:22 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:50:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg
 warning
Message-ID: <lbk2h36ja5zdjkqdibgyz4eiszdicz6zlshtrtkjtkmhnacinc@pntbgwqmhfrv>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-4-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-4-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4OCBTYWx0ZWRfXz0EYmgVQaQYb
 aQlEU73QVugK+LHh8O8EhAR7KlfSC6J2pFlW1Sh/h07KiH6nrz9A0dpsf9bgNh/kSTVpIBumEc5
 0/ceNiLMBjxTp4o8RaTBj7tYtQtRgO+6BE2MWVHoScc5zNAFmg5F0Xp+ijsc1N9lLEphzQ0GB/E
 5+DHIDvGWE5/KE+sRCUzB6O5FVRav/OvxZA9FBs5z8O4SxnnL5xI6NAI6XeZlVvqqy4PDxBBuip
 LlrAJh7GV0mJFebceLNezgREi2AgJWgayTGYVkVC/9pxFm5Q70mmQ6pQbeFfDk7tj2V+w8+G8YN
 sWww0aHCHLpKlIZ7KFmt35lDW2m7ODN0F8MbO453nsjq7aCYUxI+nas8EPoElnhcoIodYzeT0x9
 w0DY3isEZqsT+UZCB3egra2zZ5uOLvP7zKRRIw8Mfn6Jc/VwnRm8WgYqMCDXJhfQnVHxAaIhNHr
 WTTJsHutCQWNFrHsQrw==
X-Proofpoint-ORIG-GUID: mmWR0nXzONvSxzz8bYeLIWcj5XWd6P17
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d16b82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9meie53SDYsjhsWzb5oA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mmWR0nXzONvSxzz8bYeLIWcj5XWd6P17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040188
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D738539C52A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 11:51:03AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of phy node in Qualcomm SC8180x SoC DTSI to fix
> W=1 DTC warning:
> 
>   sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
> 
> Fixes: 35e3a9c1afce ("arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

