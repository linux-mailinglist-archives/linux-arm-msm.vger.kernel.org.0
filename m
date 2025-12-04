Return-Path: <linux-arm-msm+bounces-84336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B34CCCA30B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A1583008E9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0BA32FA3F;
	Thu,  4 Dec 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAd4rC37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImmArLeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC94301033
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841210; cv=none; b=o7JKAtx4ycJ/JyzIDpTMIduehKyCaMIqaboAYydTBUI6HRAakU+EhfD46id3mZT/WNeWMc7yIp2NNgd1Ad9kedMd7AQMzZBPAPtEMAbo23thfyf/QHt8acRSBFCN0pZmz8v+FhlSL1HZwft9NWeopssTFKvDwjkNC6E5c4S5a9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841210; c=relaxed/simple;
	bh=/KjdDTjFPMuq3AlNpVCnxeT4H1s+plorv3pbBcLOZYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8kVUM0eFcapzUjPcYWvD8GdSDrJoj9GjGnHIaccyC9o48myWZGZvOJZ9JAMPuUtscXKUDa4on8gWiE3QG+CU2DSwvlfoQi+WqfAwBi92LcZ08lJJ0ujtGwH6+udwTbtlomEcrx/dqGJHp1FklGkAtU0aeWms5kNB+cmrVMl9FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAd4rC37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImmArLeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B48VgDx953366
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JikH6CuvxtFtynNDua121q67
	xU7F/+XQYBioxN2DrD8=; b=FAd4rC37sQdoDlQoxQJFJmEK9rfP6kdfZ1ifzXY7
	KxV0pN/JnffjQVYov9XRFzPfsj3MWnTosK+aE1hG07RfayKcmk0alpoom9LXhPzU
	XkzIV0xdaK+5yKraBSEBO3CD7hQvkXoYfIC4jOTPQ/ZEfLIu+lejb4sQLPN+7B1Z
	rpB2FiEC82Xi0QC0qvyoWcLP4OAyMyEt4XEkgkXN1tStg9kDZzRBbOPKqm98FXrU
	Vgi44LMqEsIgUKpoet/SxMjyWSOE1jWpYqooW9UW5w7LSkdTrppTr9ROpgS0wX8z
	TFtpG20i8KKqs0wWe/CZw5NU8Jj+ZLgOCOBuw2Xrz7IIqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1g8s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:40:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so248148985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764841207; x=1765446007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JikH6CuvxtFtynNDua121q67xU7F/+XQYBioxN2DrD8=;
        b=ImmArLeS3HZZ17wYQJUnPdKOJMU/Ir7sBf4ai71yQdm8fM52sFUlVEVkprHLHG8R2+
         YN+pDbJCkihbV4DJxnZKfE7YYzSvwv4F/TmuNSg6kr2xTn+b+8vXcCiL2yN+GEIPXCiY
         TQD/y4iKbeObaqUX2RjCLDLLOBfXqf68ASMXnKLtaSOlYmaE4oWthYQWcP02WAEmFot9
         Hp7jj/CGNJzPqD89YkTzRMEd4Xs0dAPPw/mdezSGtK7UxmY2RyjC2rbn3w+MqF44GbC8
         fZ4tEsgZzXDeuS1r1yzg8XfKsipaoeWXMqLvYsYxTIllodm27/4Q34crATx0y0a9Orck
         K9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841207; x=1765446007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JikH6CuvxtFtynNDua121q67xU7F/+XQYBioxN2DrD8=;
        b=Ykibh/ZyR+1TKDVmAduZ7tiuYz+P2c3kZO/UlVyQqafKmZnv76Icgsu5guGxdT6OnP
         KY6hyL2pTttoda5tms42SmejT8u82KY+2wcWhTivW09TD8KFIOszTU6GOCTbnWhtMwB8
         qcqt5r13it28cVM78G3ergSc5a51m45w7ygO7p7yyFgiTjYMitKIq7IdEcZxAPBu5/oQ
         02qQUbuXRb9JN8HcnBYLjyKd2B2Qs5FGFTdrwTFUwgcSOhDFRB7IeU33eR/WKja9py+v
         Gi2yr2M18v+NbmxgtqEyG8n0EnWk1J3vPzvHosntnjYdNQJ+ifgc1tbWXulRwZFFUaxP
         HtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuM8XRIYFT4TNdS9HfeVGO08BZwS5kyFS3vv11FTFy68LB/utItzZ8gETEcLQX5Yq58/wcK5usUBXCsnGl@vger.kernel.org
X-Gm-Message-State: AOJu0YziVftBmV+g6V8B7SSElKei+M0Bvw+QQ4JsBB/1hrOfTewnxGpk
	lfVJJo7VJpWynyQUk3YfudvmCKGRZXw1X5WO9JA3yQ/Td2WXWW3urTHwhPTWFINoyES2ihc83V5
	YTYrcCyO403RNGiGiStWfjOuvcd/+a8Nqy1zYLfsNnr+0QcqPUnMfMS3ApZmTVOKBiivs
X-Gm-Gg: ASbGncsWXUf1K790xcZhLwlzOqTPlckL3WuHb9ucy8jU6V9b8URDS+VOtJ3Pz7sUndL
	X+BsNz5xUU/ruKbG25NQ8SH+nqOio4CYQJCPGFf7Ib0fU2CkKGDBYJxPtcM7P4MR/iyKMAv/cWO
	LBdRi2bCae1wtq28rxQogG3D5e5t619jrPD3e66OLbb/Lidj59dtk1RwpiSg3MQOdFgekX0o69V
	7T+FsW3Q3D6OjJcRxT9+pATUdVsXGB3QKcoEtJqG4vc0aZdD2xASUqYH2EaQiky4evp6lBdAmZY
	Tyv6HRYlxwJ+yliUtYwUqxMR5EPl32I09I8hBDaZbx+izjoPqYYqnCuNcLo+OFcMcaLoO2M2ugt
	VtfX0k9T48hOZ+5aWAbMiiKCutQ15nVX6X2AXLRRIhlVT6Mh1LOg+zt+f62w2/wc3bNYKAd0pom
	xNpOUvOKPIUddexJTuNa9OfCg=
X-Received: by 2002:a05:620a:1714:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8b5e47cefdfmr802775585a.10.1764841207124;
        Thu, 04 Dec 2025 01:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+EK/19r4BhqMPSVWj+wnOQxZraqrA1MNMVHJYeWrjREIFYX8mvGwTkUZkRliMkpHdTiDxdw==
X-Received: by 2002:a05:620a:1714:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8b5e47cefdfmr802772485a.10.1764841206584;
        Thu, 04 Dec 2025 01:40:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e949sm328954e87.98.2025.12.04.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 01:40:04 -0800 (PST)
Date: Thu, 4 Dec 2025 11:40:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Le Qi <le.qi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
Message-ID: <3j6quxg5wd3uipy4azfz2i3vmkhlq33tb3fgjidihdpjzx7lnl@22d6evqemjtw>
References: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
 <20251204083225.1190017-3-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204083225.1190017-3-le.qi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OCBTYWx0ZWRfX1Dbyf+i+cPVq
 RT9mvKSptMRgK9GavazoFNUzr9VAUuQIVe1Bzp78CEF1HZKaKY8gbBnbksqCuIxL4JAX0M1No5n
 Ky0z4ZfEb3kNesaEJZOLyDNrNwmYvcKWHW2yKOm1H3q7z2cfBk3lyhgyOYmAVKIecQrXP/zjqw2
 DuwzwRqQyIWsgw/EYUpOoNMfthn2vXFOSo79XQTmA7KEFkzyJly8Qf1dn6qAYaScoSwRLlLfMEC
 J9vrjct70Etx63VgkRjWSdj2oxKblT9yHnxkYBOgxvBmePCkIPx3JnljM96Ses2UGIuXAACSePu
 uWqm+xe7sJUj6elI2TpgHAeS7RdxWaSXrFQLrfj6WGV7mJn8+QWoLjhC84iVzxYQt/aUJHXWZSv
 rlUxUBtD4ltk7lT27M2a2h9O7QUx1g==
X-Proofpoint-GUID: vQxPLb8CcY5IZbnA_-7fq2Vzt45GD_wo
X-Proofpoint-ORIG-GUID: vQxPLb8CcY5IZbnA_-7fq2Vzt45GD_wo
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=693156f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eyE2PYJumBGUyiyYskoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040078

On Thu, Dec 04, 2025 at 04:32:25PM +0800, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

