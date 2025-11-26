Return-Path: <linux-arm-msm+bounces-83385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C23BCC8876F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F6384E984B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 07:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894412DF137;
	Wed, 26 Nov 2025 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwG6p1uU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nz7QEiRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F72C08DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142968; cv=none; b=SVZi7Xzua/SjnXpj8S5Lag1P8kBdyHX9fkOngv+hSFzPT2VkKckPL8Dn2nJ/E5AVi3wXY9yz6CWRDMTC/kq4SroiW05nTsNWICDfymVz3c0c6TOA93n3a1dJpE8ip14SIhf4pevsFSYsfowPYwRKqc3BLejCg8LfCa1+z9TuM20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142968; c=relaxed/simple;
	bh=MTvQXJUnjx7iXlFVgiEhTmrE/wtj+l3N1tkXre2aZGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAoqXWqXz7eM5xWcURWJph0K7MDJUZVNDg51CrNU5VQRN/vaS3Oo/9B3vJSPZxU80hnWdzWq523BYxhA4p2REWyZyX/4t0vTK8hZYE1icEDizMdunhavhswEejPMnk6TNyHQt4YZ6GGoV3RyduvgKmml4zs2yfN8Gd94AGX21FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwG6p1uU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nz7QEiRx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5tagn2655532
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hSmMytZePYeJh7GyIYzpdBXF
	zz0XlHcC0M7p4x0FFVQ=; b=nwG6p1uUumWtSV52a8oFNHRSDQlrFGMAjrIU+KeT
	cSWGHdG/mYWm1/sl/Vxs3c6uY2UVQ2nrIr6MGyU2Ir64XmELzyUAnBrNXnSeOCKP
	hjeAvINBi3ZNiQ6JyfDBxx21gNTDUqIJDED/aY4cGNwjFhTwJe1PUHeJV/ZDKIII
	luLegjCDMYNxuY1qTZM71WT5gOHuq0Q/5MYGZ36ZJGgTE2MJQri4yVHbolC7K6/P
	Lizk35WsAAgdW6piWFpOFtLk43bo07GPZuxKucEk1VaKxF5wFx4JtaUhHtVcn4fk
	lgXIDxoyD24WDPAvVyAB+tXiT+8TnugdoUuvW0o4xQLsDw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxufqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:42:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823f71756dso77027436d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764142965; x=1764747765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSmMytZePYeJh7GyIYzpdBXFzz0XlHcC0M7p4x0FFVQ=;
        b=Nz7QEiRx1UwSrZIWOi723HUnTcRCyHzqaLD/ENPjhRYBJ30P4rnmzf+fGSTCln+lMg
         dujQv1D7iKbu56UtEcKLdtTzmyOOeT8d1Uypuj/MXHBcwrhEvtEIOaOZteGYfv2Kng+f
         /3FHdbqQwu2SKjNTBC+dm6HVW3Ce8uekIx+E+OiyKDuHj0LFKJ4X2DSkJt7sQ7XIbtyT
         gVuoDH6yWWb043tbkoVtdNjeZoY6XgyHEPk35xeTjko2wr0/LW1u4dILgYKaR7kJaGC5
         eGQunkqG5B5o9eaz62+NOmSxwgxL5rUMTXkU0HEdqOc2Rd6+KIjuTWBHhnNE/i83wiTO
         gW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142965; x=1764747765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSmMytZePYeJh7GyIYzpdBXFzz0XlHcC0M7p4x0FFVQ=;
        b=Cg3iIJF5zrn4LL1F05KllsI53TskQ88oQJ2rw1fRq0Xp535D9/Ax40doDRzkX8aig0
         sLYAKQafJDrh5Pg9Q5rp5oKvp8JuUVuZyXMTPX7mtgaPiZsh4TkXff6v4wOVACsepMJ0
         6bUELNOREHZZCTQQKSVrPkcHvgSkmmwGjddL/flZdF3f0cFoBOwadDYZUYCmwdcD5zQG
         FF0btnKsJOM3jb1K1I+pGPMhfgn34uPdlwoL4GDlBgXGREsaqYXaIyILAyyXoJJQQWZM
         liHFN3u1fyynowi944xOmAC9fnolpRwfmRQfewJTjzU5vGi6AhTFwPh+q20H7LPlqmr6
         T6UA==
X-Forwarded-Encrypted: i=1; AJvYcCVQtFXPtXiRpDwXH7AtNw9b2fRk3LaO1j/eCgBfIpovrodVghYkP5RdFGlSc04cPBcMyapOqKTEq6M0c+dF@vger.kernel.org
X-Gm-Message-State: AOJu0YzEmKmhja0WWcAsWhKbSaBr0Y1X/BovVZUIXCTY7/C0XJxHUGS9
	rZQ4jHEjA+Q3l5bHrTNEztxxVwpzdSTADbhEZotd/X2OlkuCn8BsA8Hj4FFTkko0PCSrm8PGa33
	51Cl7QEUvv5u0z+kFqu9lY8QnMseaNlwvOgxwTsLUrVFUaU7Vn5f4ahvKa4I4N947VMSL
X-Gm-Gg: ASbGncv2Qthr1Sz/ByTFAZnh24xjToONAoAlBEs2aCVsF5Qc0CABYgT+zGF+zyxpjjD
	AkYcV3+pvx6soEu8j0xYmu4wGunr3vsR/yTe6leJf8jV1uoqlSYGFoUJHYz1zjdEioEnUJuym7P
	6lcIIDwyWgKTcHLCRq04ORkASbZN+Oe65s9Sojv0tO3fj5vb7mDINoUfAtk6hz1Cq/pe9baTn1/
	rr1vxcu65tgeOS9OrOL3crhANKrbUD7/BCx1tux6pXScnRBi/qIwULAA4wN6IddMkwV8t0Wd3Ia
	yS6QglaTVGeIcEDufcZUNR1JmRTZ+JI7++s4bI1DjQBcI4LUyiMkar0cYbxUNTCfHhVtFBm8VgO
	b0kaxeAio7mmi1GhB1iOXPd3AOdklho6XNrogg8cxu8Mo1wlDjHTHa5rSrfixTh5Yq83NjGMXBx
	67XwZlg3t0gdXvbf7+y1OKtfU=
X-Received: by 2002:a05:6214:4013:b0:879:6db9:148d with SMTP id 6a1803df08f44-8863aebaebfmr78896016d6.27.1764142965401;
        Tue, 25 Nov 2025 23:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGh4tssCs+1WRQwtr9pXm1Mg58jhurhNBu/7oeDZCBesIA3nCosUO1waEfZS9MB1P5XOidXDA==
X-Received: by 2002:a05:6214:4013:b0:879:6db9:148d with SMTP id 6a1803df08f44-8863aebaebfmr78895736d6.27.1764142964949;
        Tue, 25 Nov 2025 23:42:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecaesm5847146e87.59.2025.11.25.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:42:44 -0800 (PST)
Date: Wed, 26 Nov 2025 09:42:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <z43yemdvybqltbdfwphacvclf6nrhaqafoloxmcsy6fhjhgpyn@6gtii3kl5mg4>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6926af76 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UjhpILRFXc9wA8WrZFMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2MSBTYWx0ZWRfX4vR8N4aJH29q
 4V7aSfxs41xOBE6gzX6yp+WgtVq7xXTYQEh3F15TbpVeWQn+Tj9zZ/9L+z/+rmOY/yD4TNHAKtF
 1KdG6S0/6O6BS8qHrd8Iq6I0zHyQCtPuSsjkEQNNU2UdGYk1pQGQBZmbRuzCQLgbS0LOHPCkQ7t
 DULI4tF/2D+pcYLTDq5MB8uxmavB93A26sSkXL06yMb63VPG1D2oE4qrKYGR7fQjGKQlu1Tj55M
 sfUwLhDQ094lEDPqpEag2m6wMD55A0KVaJNAMh+qSoHZnkDnXF/LH09iq2Yj2sITvRGEFXccfTr
 3vQqbpJr6CuFrSkW2Udbybo8oWcNQCxaiWRPbADeg==
X-Proofpoint-ORIG-GUID: u-dKEDCEwlyyvEEECIJVEaHiD_F46k7s
X-Proofpoint-GUID: u-dKEDCEwlyyvEEECIJVEaHiD_F46k7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260061

On Wed, Nov 26, 2025 at 09:45:51AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

