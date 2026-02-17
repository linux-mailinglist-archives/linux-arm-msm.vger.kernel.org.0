Return-Path: <linux-arm-msm+bounces-93074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UnjuOKAflGl3AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:58:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E4149788
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98A8530028F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679A12D97AB;
	Tue, 17 Feb 2026 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlxZrvNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CahO/gcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7802D7392
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315100; cv=none; b=CnLoGDb26t1e0a9B+ZC8AD1vb3zEm+3lI3/4mmdmVHPuFySQrjaHj3NXICRywwCHDen495nqfo8DDn/Sz6T/EL3obRYazA+YnmaFuM6rFdQeRtKqn0olkWdiNPCEfmWsRj9l978uFDm7lK4yqCseX9hK10Ip59TFbmuE2tkgOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315100; c=relaxed/simple;
	bh=PP7Ry4xWPPTpiKYcF3WwBZsgd+2mhlHGV121XjD2Nbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRtu63nSgS5ZUep15TvvgG7DvvUNCEmxrjBqrjgxYvg/7wttGKGvVc64wHD2PVVVd7DBPO7zoJrbbn7KUkxUxgba61CvrJLxV4pLQIp4JkxBtEJAQA6BwvdNsyA3tR4fwzSIvVqUMcVo/KFWxSfYwzhnVUuamdwhSP3oGt7Jl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlxZrvNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CahO/gcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GLsF37006270
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jMXGS3zNtFR/HePL+Mu2Beew
	1OruhKTFEqLUcfWgo0I=; b=mlxZrvNXXFvH+hDPgd3a/Gy5xthkqiQtzCo7qf6u
	aZ46lxAOW4Sojg0Y/qOUDPGiXXe4/+gmRjqP79iUJ+dn29/MWcnPWuc5h+I2popk
	7ll/Tj9x654uccLmBvrXXsExmUT+GpjMr31wsoMoQvlUepNzOpV8ehL5adZAPhty
	zeYZ5QTIBylif6T3uJWpqlydeo3rqoKZ0PaEPGVcPD6dtH6ZHyTtB0kEZ+2k9ZZC
	hfCT/WiqlHOmOUxU4vgXYpw/fKBKKk5wm9TSdNYGFImtj58VxKoxmVNu5fzO2Sdm
	bguog4JzA0WjDPs4g+v5ira+tg1vgWGcl1mxvG71AEgiAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh9rnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:58:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so3271637385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771315098; x=1771919898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMXGS3zNtFR/HePL+Mu2Beew1OruhKTFEqLUcfWgo0I=;
        b=CahO/gcGsU+hFTnKMGMnSIfffTEbRBJOQA4At+AwXUgkY5yignNu0Fbqsl0G1EGjCq
         g0hsYmYt+ZBhjq47fSTYMDeL1YQ9M8ChbvE/7tiygu15d2iExIR0m2A3CoUdk4q7QFSW
         ntdBrx2pacwQv3pqeDGXWgYTKxDTkPgagogXLvw7Su1JRjRIUhrtlkYp0IwRTOfuHXsQ
         CGoMfLkdscxgFxp7h9utqtE32i1G0PimYV/y/jlG4QSJiFomWW/ztftK5zo13RJXdoVH
         X5VNPxqgAcoLEzH2qSF09uN5EHK8mH3R3v6FAPgmfmiLqWGeivXaY7l/uJELqNXX/HeF
         Rs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315098; x=1771919898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMXGS3zNtFR/HePL+Mu2Beew1OruhKTFEqLUcfWgo0I=;
        b=a6mjaZuGaEMQbEcDeQnhEmZRZGzNPZAWRau/E8EIy/8aMcB3X1NYVu1od8fZAxOXGv
         xYXw4hyVSncCYPuHCKgCw1Mub9oTk93JHxU7IYiuy9TiIRE8AbSkhy3n5wkz5jVj5BcZ
         MIHpVlql3VrYYAuNN8Wlj6GnNFP+0Jtn9u2A7bdEssiTek7ogKj4q/1kpjT/WL14+XNk
         19qRH6eKF/b5NkaRNgQhJ0BhEP9DyWpom3qEfbu10/+rOIHErhpX5aB6nZz2rx4n7N/K
         TAF5PB+iAbDtTla97m1ciFBFUEN3zarL6NIC8uz2p1aPr92xlCD5alegaBHU7xViJsdj
         P6DA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9bvOPTy4YHfbNxnAvxOLuIuDTXftyj8nYdrUMe6uM0zcpVt0THnVD/MtX9z6xrMx01vUuj4jfo0p9Rra@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MjLVVlsKojbM84dlOAQYl3q9qFPj+DiKKwIHq0ujbL/wrvMM
	NAhu9jQ+cqltWYiMWI9jH72ipqk+emKPUma9uP87n6QMP+sca0PNwbABLstEXYtUBpuRgvs8dqr
	LZvsjs4CacQX4/Kel2fQnrD7jgcIKHhMx+w6jSYuhDx0M4PADilYIsMvkbkwDoE4HmbW9
X-Gm-Gg: AZuq6aKQjmQhN0jHVfqtXX6XUxEqMxR08KEzW0h88x9obX0USfE1GN5qTUorAGebes/
	Mta8W9oUOX3doTjKwYRu3NIc4kpfOUs+cupI8VIA+j7FLelk6a2HtMnRYTomlHCdsLaAf4JIWix
	u/RmfbNKjOTssHBR1W3goVO2s0Y7WwQt+hJ5wXEgkbPjexDxN8kFe0iPj20kC3LvlrlOM3D/RQ0
	zNBya2r9MxSTcYJ/9dLTmVpTaYGQAh2actrChiScNhFXOMBoinmwsUzxbXSa1UOhNVJ2kHYkfP3
	BuxqeYuiK1ltakDbIj8GWJQeHml8qDKOgU01f3nTF6ZphNg4vnj2yEK1R7nWC/5VNZdHhSrTiL+
	3xbUUQtrmGaR/eyhTvjIeKMc2ZXmgapDvqf33
X-Received: by 2002:a05:620a:28d3:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8cb424a6736mr1563527485a.87.1771315097574;
        Mon, 16 Feb 2026 23:58:17 -0800 (PST)
X-Received: by 2002:a05:620a:28d3:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8cb424a6736mr1563526285a.87.1771315097153;
        Mon, 16 Feb 2026 23:58:17 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm34625082f8f.27.2026.02.16.23.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:58:16 -0800 (PST)
Date: Tue, 17 Feb 2026 09:58:15 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <iepxnbk7h6yti7biozcgw4uq6l6fmtaxrgxbt2tmcjxf5x2lep@expe5bgt3oin>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69941f9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=H1luOFva-Z3cimKgmEAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7l_2cfn7R8bBleEamADUBGqtm_cV6cTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NSBTYWx0ZWRfXwP7E/3F9Vvh2
 WybRtPo6YkJilfxfamkv4OQH7bmJCcEikZh6ZCuDx2vtC7H6w5xQVghEbxFIPgHP89IzvatapCe
 PfR39ivo93ic60OkTayEAEc0j4Y0viMiTMunRewfb7yXxBxC69erOJIZNY7pOv0th+053UgkzOm
 pvd2RI/nO/1XdTN7+mHbKvsk03oL0NHvaG8m//EhNfSM6AJeJPMbB7J371N+m9dCrq2qGllmjYo
 4VdMlUqOeOsw907hJrLhWLtgojdnrMuaNiitIZQD0tx/inYN2LQ+vwLGAc9cYBxLvWwVOMLkp1L
 e+WEk+WgwQpfQrjnYQNLHEkEhvgXNqwPfQsWWe+ytlegscG5W5NlTcuhd2EwbPCH5ZFG3b/Wy3P
 O9D1xOCfVGLvYFt8r8PQO7XCqThXa98ikvMhyUH6a8B4GO9oJOO5ZuZftw9n1OwswTzZ71QjgsZ
 0CF3DfVi56gbkkeKMIw==
X-Proofpoint-ORIG-GUID: 7l_2cfn7R8bBleEamADUBGqtm_cV6cTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93074-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 185E4149788
X-Rspamd-Action: no action

On 26-02-16 16:38:15, Konrad Dybcio wrote:
> On 2/16/26 2:43 PM, Abel Vesa wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add support for Global clock controller for Eliza Qualcomm SoC.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> 
> > +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> 
> This and a number of others should be struct clk_regmap_phy_mux instead,
> cross-check with kaanapali and remember to drop the then-unused parentmaps

Oups, missed this in v4. Will fix in v5.

> 
> [...]
> 
> > +	[GCC_CAMERA_HF_CLK_EN_SLP_STG] = { 0x26018, 1 },
> > +	[GCC_CAMERA_SF_CLK_EN_SLP_STG] = { 0x26028, 1 },
> > +	[GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG] = { 0x26018, 2 },
> > +	[GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG] = { 0x26028, 2 },
> 
> So SEL_SLP_STG=0x1 allows setting SLP_STG to =0x1 to assert the ARES,
> otherwise if SEL_SLP_STG=0x0, it's controlled by the HW state machine
> 
> I don't think modelling the prior one as a reset is valid, but I don't
> know what considerations we need to take wrt dis/allowing hw control
> here and what the consumer expectations are.
> 
> Taniya, would you know?
> 
> Konrad

