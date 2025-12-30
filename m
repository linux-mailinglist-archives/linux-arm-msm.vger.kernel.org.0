Return-Path: <linux-arm-msm+bounces-87011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39916CEA6CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 19:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 020443005029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660B932D0E9;
	Tue, 30 Dec 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPXLLEXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBsuRG5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266C732B995
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118192; cv=none; b=e5KfeMmppiZ9o38JrV/5lj9I0HkzV2KBAEJiKQZbG2TGvg7i0fZ0WEMB177v5S5ILsmlDHgg6PhoJClySKsL533xyyMa5ctts/eJKGAHoNmDAdp+wndC9Wp2FMxYMAftLQjFGTflJR53LaSmXU1skEqggHwAbE1214/Pnxp0IUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118192; c=relaxed/simple;
	bh=JrSdVQs8umFznETgBJlE+gXeHhfL90x8ie9YdD53G1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cymnKv0Bbae+BRz4yyzZ2ACWEmbBEcy8XMkPFQ/BJiT5a7N9lnpaQqpuDNl35awq5S+0/0O40XljTr+S/dtC+kx3ITHNB7+FRyBdmRJ2zTYe9Kz3fgUoSYBgBk6kavaZmJFVjGCmRjfQlWuESHsVqUnBRtxM2w6Y+dxqw1SjOIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPXLLEXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBsuRG5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9LrfS2550982
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zxrwpCmrklVLd3dQvhy5lVUw
	gtJd/h93CSb4e5jlCrA=; b=BPXLLEXBsPw34p4n2MYC608hjPf56FSEz2azi6q5
	stJS8yullh+R9JVp3o8ivlYABdl4kJKEFkPsw36PXRMMLLtbukTDmqNdjrCP/HSK
	79iC1zaFf89Hx3PSnBRLWJ3aCze9rYrJafQgcKCwCTJiURAyYO5d3rdcKK6SddIX
	RbiuW03Ggjpkm0ActZ6Sw9I+3ewap8TarhlDvEE8BXhFSShM+GXaz41DLdrSPnN1
	mOSyNNcVpd4ptxyJmbss8mHs/qdv5RrCyAH6hgc/AoCcsoXDg0MY6HBpy2OAM68S
	MLzI7IedeNxuTBD8wFIhxEhm6/qYQ9mwn3t0fgpCnvHzmQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skjkmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:09:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1dea13d34so246547641cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767118185; x=1767722985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zxrwpCmrklVLd3dQvhy5lVUwgtJd/h93CSb4e5jlCrA=;
        b=QBsuRG5vWv/pwnTdex1h3SaM8/3DrXlgsvxQ5hkueo0bqYFYTYJKCPniaS8XTPlwn4
         pwvUt7NA46eHZwVMqUGm99jNlhHrN7lrFW9W79bViv0lzHGeKQiSC24hq7PU62s/AzLx
         Gw2oLTGNHtSdI5s4lPDuo43UpDb/ltregxeIfXL6rWgFGTPbOdFDghgjDpWMlj/ksrvv
         n9DJlAHWBYLjXJMQq2c87K9q+vewzm2ia7lwdx9XbVD5EeE+VXe0Za8Pc6SX+AhrLGl2
         ffu2YTG5VUGu7sZc7tBuLgwn93MWSmINUaqbz3hafeGDMsYqXy+X7NGE/96faPR6DM0a
         EJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118185; x=1767722985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxrwpCmrklVLd3dQvhy5lVUwgtJd/h93CSb4e5jlCrA=;
        b=NZ/lRKZza313TliU73HaWij54OfoLLOnq8+1CfQQuy8WUsWXFLHrLdEguul7hjG8ds
         Cx6zn/k37f/9WJyTu412JPz+UIXkzFGmGTx93nNVZn3bHKYkumHdRABQuoNNXOcvDR+6
         kQXGImx01iqJoNVcnDHfcga0f7stRproGW0c9Fnt7wAmcSQ0wNvOGsmJ7G6xnISUdPtF
         9ihlxjT28f1Zs75ALby3OwU7mOuXKvUK3ycHfSf9WddrVtWj2rZwqtbvDFp8YC9fk0rq
         XXrWDVE/1TBwaDkqt8nVpv6vdreV4BvBIInaovN6EvFRkivgzPsklYDYDus3BITn42Hj
         Tj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhzkRa8kpUeRbcpPKtJ6r0mRqlcaVhPQu+/OFizSSNh2RR7I/XL0+OtywTdU/D72hakYlXTQ1GI8GTGp7y@vger.kernel.org
X-Gm-Message-State: AOJu0YyePRtxTDMonWnH8iqd6Un0i55NnGHPUGyMVyXVawz5SOVu93ru
	XTclWYP3PBVG8nDA5VmNF1hK5WPdLtgmSNvzXS0sn6kCqIDIGWq5WQsE6pP8eo6GZd7jtONEM4R
	qVpHrYYEqFyugsRGaphev6tE6b1P8Kqx/iOZ7lFezhmMsXygkvCPSr2EOzb730kDWomDI
X-Gm-Gg: AY/fxX60YZrd/bYuvX/e5TUNpLP/prWICZZqLTYNMAY9QF6z3Ekt2qDPbNd/16Cy3n6
	JtFpeyBd8TOkBFLUzk8xdbM1llshD6y/dDyEgdqWrdsUaSjYXx1B21zYUVlrLidt+dt3UjlqFN1
	uM91hp9mdzDftxeEfpidDmKyQR9bGiHe66tvWibPdij1aFc+KkqXY84v4zA54Jfy3k3Dx1lZo1B
	COGHGJ9NNsxgxrzG9odheHsJJc4Bk1DXENmsibraedwuGFSSo8Q4/vukRdcMgmIX8TxbxpgY1US
	R9HDg+hkewvc3xsV9IOAV9SidAarsNNVi1M1WgdtljdFAKf/H8Wv1XyGlYjnFOdnDZz9tA94/fL
	hj+TFbLjAF2S2VuEmwg6bf6VhpPW4+4Qeibmre4LRjUkiPf5VzO4txFKA2lb8UJPEiHNkis+5Uz
	X565gUfpZ318xiT56uIc9onVk=
X-Received: by 2002:a05:622a:5916:b0:4ee:43e1:e591 with SMTP id d75a77b69052e-4f4abd939e4mr466238881cf.58.1767118185034;
        Tue, 30 Dec 2025 10:09:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeXCP+TMD7l4jEeTo5UrB+NryoWkj/z31BYNSG5ir92U/bAlxqI4Nt4wzjzofiPgyNK0hgag==
X-Received: by 2002:a05:622a:5916:b0:4ee:43e1:e591 with SMTP id d75a77b69052e-4f4abd939e4mr466238471cf.58.1767118184633;
        Tue, 30 Dec 2025 10:09:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1862840asm10427036e87.96.2025.12.30.10.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:09:44 -0800 (PST)
Date: Tue, 30 Dec 2025 20:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock
 list
Message-ID: <73dxvqekezl5oo3wnlhsr6ok4usnoabfp7p3uodkkusiql45b4@tmwx22gcfugd>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2MyBTYWx0ZWRfX6PsEtLa30OUR
 MXqXVLDwByMuSn5tC1eESGja8Q24M3x8CC4M1HN9GnThZoz5MUr3G2z0JVXb1rCu40RQK/OiLVu
 oeKwaXk2dDdzgTTTKwnICIPoA9q9kt7Emz8TPi6LgJ587ACA7VBA5jK5ENA61cJlfjSDRRdiTXx
 qtX2RNR372a/NIUM6Wq/02NL1WyNXJE/BCunV+1yVNj+5DzkLZSuJq6dFLuARP9sHy+Zb+nSR0p
 G1EQdtiIKVOzUExpPcdP9oLkIMuqXS4jgtuPuykNYW0Ez96kRbRaGCnnk2g2Ax+AUZ4IyxRcymp
 7HyouQih7Cyn2Wc/VGWVyhd0cIwgw2XN9mnHOBOLb+Gf7LXEP2dOAlYfgznPFKru1GJnwFipChP
 JUXWmiqg1os79UX7sgh9TTClglqINR3G2tZtcIxyMOcgEfqWn89txlymV9zHt5Z5HMQiRzbNAyZ
 SmlO7V8fXcaUSk6ypsQ==
X-Proofpoint-ORIG-GUID: 9aih5Y1HgdbWOrMxo35hu0dyXi3P4y07
X-Proofpoint-GUID: 9aih5Y1HgdbWOrMxo35hu0dyXi3P4y07
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=69541569 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q0JkR4NhiA7wQx93E64A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300163

On Tue, Dec 30, 2025 at 11:08:36PM +0530, Taniya Das wrote:
> The recent dt-bindings were updated for the missing RX/TX symbol clocks
> for UFS.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

