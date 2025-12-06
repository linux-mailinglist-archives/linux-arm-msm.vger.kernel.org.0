Return-Path: <linux-arm-msm+bounces-84542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69DCA9EFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFC4930339BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC1F277C88;
	Sat,  6 Dec 2025 02:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avPYM/hY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rix6Vr7B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447712609DC
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988979; cv=none; b=VUbQZF182/JstX/p3nrctJmnrOQz4gRby3bnFjL5L/N/oEIMCuRJY4Tjg/wycgy0ellJcZDMTiRhvXzqOYmry/e34pXMNjOqdzGdndw67yOx4UMaw0FBazeh9RBJaVM6wfm+ic2HVbJHonUuRc8O50EiiGIQGDpynNJPB2xwr4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988979; c=relaxed/simple;
	bh=j/n/Vl1lqc9OuMWdAVYatU4woR3YW0GrXvb3t5VpaDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSYn/3Wvm1NUnGSU3amjwk4scqpyNovJDgwCcMVj9DUR7juE7iGavwF7I4uuA0FfdlHjjKhdmWK8iTsoS+W1fHXLIJnFVwW1MP2LuZn9MGJWACHeUf04q9ExMeQ7Olk2HdkMf3lm2THCEANDCcfomIilkI34f5wW5eQ04YWNBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avPYM/hY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rix6Vr7B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5MkpUd2206666
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JXNS2h+C1CfMyPBfhTqPN5Yh
	cMbeULYg0Yv7h8amnIA=; b=avPYM/hY/EoK0SRTlFoEohREQMYUuV20TKCIA3Mg
	KyufPGqXKarosbOlFn3x4H21hs20fEVoWzamE3+3MZk/OVByONerEm9IiaBxJ3XF
	S/m3scUa5oet4CdPOVIhSS+ps7nF1P/ihy79AgoYNE/yZcPYlUmHxubemp7ZHr0L
	95kezTCEdqv6z1G4UvNNapYVwpifraqLDDf5DAnNM4ifyWHkSRqcJoozO5p+u1Fp
	Vq3MMxmd83bT104R6ZSP0kAMGck2uzqYzJKDAYL7uA0/LZe+A5pwnYri5+eO0LLM
	DhXxEDYxTz4DkWn7uc0Qf6LS/LLRpdeUIIxlc0MmBMsdPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av8g5rd4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:42:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so604484085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764988976; x=1765593776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JXNS2h+C1CfMyPBfhTqPN5YhcMbeULYg0Yv7h8amnIA=;
        b=Rix6Vr7BHz4VhLRIQK1Y94YmiubTv4JWwM8ZQ79GMc8/zzfFtNc9qDfV6vdgnFPvAg
         1ciE/tEKu3kgkJm6nYRLpWJY9l1LoHEbEJ7qs4HYmaOBxeYn8EpAlMJofzG3wH8PVE34
         o2PmZz6K/WE4YHBjo1AYvzXrn4jBvIsRLj03pym/UkxDftBc+1ikft/OzX5mOhvKC04H
         W4SNKgl3oQxWdYy/4UE9n46595v7cz/yO5ynesHtImNJqHESYSLA/15EJWfRVETVR9ZP
         IfVotvmPTdSXzxTdfec/dJy6dSvdRXUGqp1abpvxdCoMHzx3Ey+Dwf+55raOsKp4gG9y
         Gr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988976; x=1765593776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXNS2h+C1CfMyPBfhTqPN5YhcMbeULYg0Yv7h8amnIA=;
        b=FKvCqK/ub+x0pXdr5s0mAgMDZvlaerXXZN/X3UWtfBdrNZU6T0/87kSAyBKE+NSTZ5
         8c9Sn+ZRQuQRBUbAvg5Wxxls+EkprrnRAafIc9I8u8xCj+SeTRQmEiYh5uu3ewDa6/aG
         qQ6/a9M52/DrzmwqFDfy4OTZuv4Usfs/G8SMj+R6EYTZyJ6XqnPZffNKts+fl+qnvI/D
         fe/SSvzwos+mH4jo4TBco6H/unA+PZH1+pyApqo5K+bDWTu+xM0nF+shBWYPSXobXzcF
         c9YJKNI3Paj2cx6I84LpsBxlcRA/XNF6y2sw67gqCo/O5vfRzFjs2G/vXekrcfJntRdz
         YKXg==
X-Forwarded-Encrypted: i=1; AJvYcCUXV+qy37J4+xPKtfBuspmS6YC2AFpflDh6DOVvhKl1uTpj3yUIP2v8LIOcrzZdr2XeVLnNwjejYPY9looq@vger.kernel.org
X-Gm-Message-State: AOJu0YwvebejoE3ti57Geb3+qF/arNAJuwi03wmSedkALfGLG/iPl3Wx
	SSOK3LbW75mayF5ES36uPYaMKHaMzNmRVGeAA8GvUHADuPCRZMWGpPiDJ2/56WNX4RgSPYa/Bjq
	BqkSRTz9e7KrxcSbFE0Y2BO8qeunjd8vVkFnFyPfhskRr8cGi8gpqtxOaFEBd+bTnEYUf
X-Gm-Gg: ASbGncsNIsSZt1f4JgPo0Y5TuYZWljF70HNn6zEIMkv2nUvshsxEr01s97dw0pLw+aS
	b18yG1BQDxkKhg8IbDY3sELsYy05AhDVykg77Avoe96wVpPKYyGZoSAgOBEnROIwOWRDPiN7WOe
	7smhqs/xdWBXS01WsI829ZRLKkGom0R0+rgWE6xrmyvoE1O6aJsrZVbyE1D3sPHFjWxLmj6bGRI
	4UimMBDz5+Fn77oVLstwbDfcJZtJHoQRFArEEwrSNbgzYoPcsi76CmT/HSWz9+TTwzxXU2O1vOt
	XFmpF9WgicmNv1rB4mhPSJT4sbE9bK1npyxJmnraQaGucGxnSDGFhpw18NCPk1sNIyOL5Ytpm4U
	0rMdcTWaQhYnm5lZcrXhrYk+uG2T+mJOxVsmeEnLwYBHGZDg2yWm8naE49stZzSZE766clE48DH
	a5LvvMGcJgXtsC8mlLs2AqMII=
X-Received: by 2002:a05:620a:bd4:b0:8b2:f35c:16ea with SMTP id af79cd13be357-8b6a23f8f61mr187252385a.80.1764988976599;
        Fri, 05 Dec 2025 18:42:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg8/xIaujUmvsPLL5MiJMAjDbuHUxtjE9GHH2cSrDU8i5syimspdy5QjebVARVit1+o7Pilg==
X-Received: by 2002:a05:620a:bd4:b0:8b2:f35c:16ea with SMTP id af79cd13be357-8b6a23f8f61mr187250285a.80.1764988976204;
        Fri, 05 Dec 2025 18:42:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e3e4sm1988386e87.47.2025.12.05.18.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:42:55 -0800 (PST)
Date: Sat, 6 Dec 2025 04:42:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
Message-ID: <jv4u6nr6gembn263xzwsfou7lgpqtvl7q5temfiepopc3yvmpp@xn2uelts5g4m>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
 <20251204-knp-dts-v2-5-596d8398c6d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-knp-dts-v2-5-596d8398c6d3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qdlrf8bv c=1 sm=1 tr=0 ts=69339831 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ii0bGMNOlrnFhgTP-T8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2PR8pgq0iiG2veHOkXj_BVZKXg6KRLsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxOSBTYWx0ZWRfX5AozP2azhofo
 5PK5NWO0qvK/zP+G9L/pt3G5VA8XowXR8y+cjuLo3sxOUBbTnxT7Az/INFYer63Zc8/DRYJXGXu
 mrN9zvFM3ZpwN7GykF4sYyG6+YYRzYaVkpj3+VPlJCZTTaiZyKr3i4dLUYKFDEubOSgl1TBCPZk
 iAnL2ovvRYdFQ1UKRBtkjwKUYQWIopFWva4PDv386+YUx1DZpdtsscKSTW5YiG78ETZaelpbL2a
 TpuKFXz7ZxHGj+/v9YSEjiMSy5F7SfXyb6ip66DVtJYZMqmLv3pfv51156wcDHxI6GQ1myIC5pB
 YtbQa5FUDbl/7gYVr+nPizEJ8n4liiuaeuZtjiA9rfN2bwC8Ny3l9DTItOuEr5vZHyR0zU1fhls
 ZMdsrEK0cyCckMutTmmQGng+smcbDA==
X-Proofpoint-ORIG-GUID: 2PR8pgq0iiG2veHOkXj_BVZKXg6KRLsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060019

On Thu, Dec 04, 2025 at 10:31:23PM -0800, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali QRD board which enables
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added ufs) and Manish Pandey (added SD Card).
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |   1 +
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 712 +++++++++++++++++++++++++++++
>  2 files changed, 713 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

