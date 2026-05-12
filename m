Return-Path: <linux-arm-msm+bounces-107159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AA+FUp5A2oR6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:02:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95239528612
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E665A314BE72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D299274B3B;
	Tue, 12 May 2026 18:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBh/D+TV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMghJ9JH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799D357CE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611760; cv=none; b=MCi7TUyZjSCCH7enSd9/4B80QZSzQ/lxwVoklJCkOdDtDHUnX88dPamSRYvywW0H/eMvvmQl4FThH3BsGPV35jgc0LchN4M5MnjHMB22ESF55nCcq1L2Bo2lIouTs/IOd1T+UKD7CWimMMoQ9cz3XJz2XhpTKyMdYAv5ZEVD5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611760; c=relaxed/simple;
	bh=poC3rwVOHwYvOMVMOOACw8sBuBFjKQlRM77g9zwv0X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY/qtzKEfpLXcfmR7sEmNOC2ajythgZ5v0fqS7td+dXGvmycdmGbhDN9Fq6Dmgudrt02cIMtMW+74w0p9dqPNKgYMr4+zIjYpid/ovFfZ1xDOoNikuuGUYBa3dZfu2Z2r1eYl6WwY976JmcfBn8c4DdqeGyYp5hEJnHbVxkGlp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBh/D+TV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMghJ9JH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CGGOHs740581
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xCGIbxNFoFGNHYaSu9RAzibe
	V5IaAoj/NmK3urAHHuU=; b=TBh/D+TVU3LmBPHJlnd6bTzO1Wiq1MDHQ9uYkwON
	Y6bS+LHIwUVj5oKC1DyXh8pbDB0IPuaVIeiblYifEVqD1HQPQ/fZvho4Wdrd72ot
	KvZAELchdulT5Sw5jMErLrj/c2Y/9aw6E9oe8BVuZurq9mrK+vYJ96r6qSL1IYMx
	nhiBGLM+uQDvyrR6HOR6xx3kOAzl3D49y+f9LFk9PP1t5PUKom5j2G8ztUeK1bH8
	fX9q2O0TNmejw9jqy95aF0zuhLUH+YB55v/0WrOxMVsupiUyIS8sYxxN0i+AIrTz
	M/8Nx2Zw6QIR0lpS2B/7uPfTpKlQC0nvAima4kC/bvYFFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rht216-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:49:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514a182b90dso42184421cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778611757; x=1779216557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCGIbxNFoFGNHYaSu9RAzibeV5IaAoj/NmK3urAHHuU=;
        b=fMghJ9JH5+jl8Phko3dTGYBKrlYa2LNeTMlecbVDRF0ZqtTW3i/2dQy5azN9qqrrNH
         u3J1p8gNE693hzzs+S9FfDLGXzchWS8mGMm1aeoeyHE+gN8Wun8hu0BrGP6B4J/hW6iB
         eHkKi+1onKTbQ5/Opsgag9Q/lRycPRrc9pIzwXW8nmxv930abcupAuFr7Jr8Amxre16r
         cDLj6pPoguNIgYwACwd8/Je/EXGS3hLcJoP7sfpbHrnYNLIIh/2iMuUg0h/MFglfcrBj
         DCZgy7a7cqV8S+1+wD4BCKf+LX+1A5B+38642BrUQ/tJ6UzJ10qVo2wNJxMEYfk7I9/C
         151g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611757; x=1779216557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCGIbxNFoFGNHYaSu9RAzibeV5IaAoj/NmK3urAHHuU=;
        b=MkmbH6Z4ORVfMXHz0187IAJgFLM5k1oqYuEkUw+8m1uzYjgLFJY5jVVcGcGCOsxUOn
         GFNNA4/t0jQRfQlBaqQkwe9SF0re2X5fWqXJ+2nx6PjQ/DiYxNXEvlvBB4ZOKQwHwxwS
         shjNURO5KcLc+O+ml7yMXAJl1Bhiwv9OW4MUAMyK1OTf1x4NRFRWKeQCrA0KF4NuUKE2
         k+ETDD3x4aueDDzXjnzBiHoUQ3pzYO8ifHBWxN+/NCP/pmF4oO1VHvJjFhTx+IKMe6K0
         i5dOKOzxVLCWthTLPYDKcHBaTfoohjaq9xtkuauZagtJHpY+rdWCaPRmL3pow6C/zwUv
         rhuA==
X-Forwarded-Encrypted: i=1; AFNElJ8NXyGmojuAcO2GghxR22l2gmLuTFRARoAo2NCSIfLNN9M2eWauxRUpb+DAPof8cTgkZEM3ntyEzpneE7z+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz565wL1SoQ+PZiY65jB5CspGblMha0bogktrC0w7aGTcbhwrAr
	GNfGfUSg11m88HZgUb06XKPphtHTANDWYKCcr53GxMcSoUV4y4zTq8K0+hpQBi58D+RBeYAFOpt
	+KhiGm4mI+zv7qPePgZBHyH/BKS582n1EdABw2ay84IQ2+Ki+dwTO2P7WbvA3Vr4wBpr/
X-Gm-Gg: Acq92OEqlriLlijeQYi3vd016Ono+pH+fmeiEs9eqRJNFjIFWkQBYky2u6fsMJy93Uv
	ehiDyeKbAaLD43m0FRbL4uVpQ6idT4S4/fcr9Ib/UmvJkS4s1O0u9nAXK+iqU0vWrQF0ejevD/I
	SE0F0MopLZpTnWSRvUeb+yunXRds1XZEMoVZqjkJ/KLVCkiPp0uq5pA9otfZMcOPuRLk+T6py4W
	sXUStLZXZ3IgVtTOs/V/gvCnKD80nqedHAbKRxfRiMruCC+cqAx4EJqj+QZtqYycH7lNVzKcz1M
	R8W5u3kofqWqxy9F1xu9zYd+ukInb+aTfL18fSeSHjGSs0WSv1UNxxY3JP42+IjBQzISfjrbQPI
	c9ReMRwxYau86r2NKsse464i8RH7kMpQssmhhNXRs0h8Y+ZLkeNkyEUqJiGUTXn/QHDnIOmMTqM
	BSWZX8srXeFaUBe36eeSU9ViasUGpmm6UtD4o=
X-Received: by 2002:a05:622a:1189:b0:50e:5a33:672c with SMTP id d75a77b69052e-51461c158ddmr436792381cf.17.1778611756993;
        Tue, 12 May 2026 11:49:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50e:5a33:672c with SMTP id d75a77b69052e-51461c158ddmr436791771cf.17.1778611756357;
        Tue, 12 May 2026 11:49:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956642dsm3428293e87.71.2026.05.12.11.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:49:15 -0700 (PDT)
Date: Tue, 12 May 2026 21:49:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Message-ID: <q6hxnbg4b3crzo6g4h7bg25aiinntw6b5esajubpxuze5yev6c@jdr7tk5knu4j>
References: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
 <20260512-glymur_camcc-v3-3-a7196fee2779@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-glymur_camcc-v3-3-a7196fee2779@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NCBTYWx0ZWRfXzgkmiMicicco
 IcC2SdTQBIBxZE3SPpYURLPmTJVS/PTjIl6DEh7QJZl4nuJMDyOJHNVSjXECBVLC/jp6Gay9BRx
 U0ykmMWseCzxMVl81Dcyo3WKy7lOnhdjddGees+VYMY8IGogkYByij6oIuPrQ96arFD3qcxaNpL
 myHxe9oNLdnQmPJvyIrFrBBMF0wtgCC5r2NS6PWcgTngY5K4q8st3PR7puvG/i56syxpf/2gccX
 Y3Yth0yBE6byqvDwwyvOms8YmObg6b7gRuyV9aTH/ymFgcZoS0UxKGP6l3MDOwUWv+LOmtsemVf
 AWh2T/xD/LqjTQydYGYvfU8bmERdUYtWlV9vKG0ARdc251LvnzG0yJP08i+okYSTsH+6QA0hQAM
 m9Q7Vh7dgpM6GHkSheIaNiVLBgx9IaPY0rB9rSOj+I4fHUMDAoLk9CRwpw7mVOQ3oIUVFyEaBGw
 NEOaHXuJSdtooK2hTXw==
X-Proofpoint-GUID: UVNeczpHdY57q8RoeZAcdYbvnJlXCMHL
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03762d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1xNs490kL5DDSzzqZ6IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UVNeczpHdY57q8RoeZAcdYbvnJlXCMHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120194
X-Rspamd-Queue-Id: 95239528612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107159-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 06:35:28PM +0530, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

