Return-Path: <linux-arm-msm+bounces-98210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGuoMKtpuWmZDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:48:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000F2AC467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DD7C300AB29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA62B35CB75;
	Tue, 17 Mar 2026 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOL4vvU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2Xo0GiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6923E8C6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758882; cv=none; b=CpmBktwcvktf5v2JwguQSrhXyLuay5ZvKhAbPuYW6wSV61OJP9XKgH2CHWBXgkbQcuF6SEBKrAAkgClQGlt7yn/o4DAd/yLgsFCLzo/MFGBmCzdmGYrbZum8em/nyeo42TCwCxr48ZGrvUJnMw3OICZRGk39N4dhFwgpoJqagak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758882; c=relaxed/simple;
	bh=d91sZaYsDnRwEuSfUDjlnevNSMTgeV9lU0JK/m4f+Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nA8+pseP1SXOO4P8xhqRfuNDv13mI4xPXOgf+H7OO+MSsVdt1YRmS1JglcXGj5g8zk2PwFgrcHwKr3guKpy4Ia+YAlj2CKCgXRRDC3N+A2IzRfgfIxSORggMjytgutozNDiSyMyc6zEIYWXzB8iuKwNvKIqXhXSQiKCg9r8ylHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOL4vvU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2Xo0GiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBled81025567
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H7sovhOd4gZkyI358YRrryGK
	+jm0G4MgUIdC6SvcGgM=; b=OOL4vvU/i5bYl9CcTURRY50lHorFTwjnb/4/RG2K
	xkfVTt++x0s6mFqtp1SOWqNTLedIqZCb1MdAEcjX0ruYwX9hauMaeo1x3PZCwU5v
	yOx0DXdZIpwP+soiMLKAnToEV8su6Z6IJQQid7/tCRnha2uTx0B0XWopUZwH3/zF
	yrgKKm97Lt3Pt05B6DawxW5Nx+RbVM5KAUGD8aLNlz0jZQluH9Ehiy4x5fOpKPOn
	OPhfN1MK1CqX9ukd7JEbSJPsu45p4nPq8GOFmZrubzPCGh7d8draRL6iXXrgJLGh
	kHMQaZ79ncWyiHhNpcbc7Q2/GmTaljEvof2BLgyFgqQNEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6gmhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:48:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cdb995a1bfso3906370485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773758880; x=1774363680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7sovhOd4gZkyI358YRrryGK+jm0G4MgUIdC6SvcGgM=;
        b=Y2Xo0GiYhLo1Jl+gRRQTMtDX3CffymE32Oh7QB0Bi/Z6XgcNg5xBlYlRO0dAyRBFom
         ZQelb0OYlmwKwZSjJphUxKsfYCUxtOqTbhVBXpK3YGQgQPZEtVfM+RWT0Xpduz5Rfwmm
         TCMswKt9jl2xkxSWfd1D/600azuPj3sB7OZVlwDyCWSgf+6yY7fDFT7Upz+3HG4i/kMK
         xowUrU7Q5taOh7U90yXgB9aatWy1I6XcbZluxkjsMO6aGBXWQU5okJTyNf8SYnF5UHBO
         6qBBKw20ATJJGoHhRe2Hlif03L4jv01y0Wn9qoTJWrViyWQfkno+L386ydN2xxRfEAFy
         SfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758880; x=1774363680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7sovhOd4gZkyI358YRrryGK+jm0G4MgUIdC6SvcGgM=;
        b=OhfpqEi7ZqKmcnNDyC22w20oIX5+8tjZh9J/QpCVY3Fi4A+s4L3GQlb/4achGQi0or
         i0ZNLLAheIkIXKeOyDm7r/nCtlapaSlti3IiiguWyWH5pysPKzqYP0s0bgQEXizWc1Hi
         gnlqyBfQo8A6Bq7UAGkzAHEWm6iTGe9r3JlYL39qKP9YT79p5Dug8nXw+Yxp/1Nngazv
         TVZl0XXCQWIUWyV0hy4RF9GNGPvmQZ8+acv2Afwvmb77HFh+F9owIIzlqrTLjcmXLbil
         Sy85gPYnMzIqwm0DJsZcUhm8xMv4Pd1MWtj9NXyTlGjosQGyrXuiu5gtkwiunQ+wbEKc
         Jg2A==
X-Forwarded-Encrypted: i=1; AJvYcCXK1Osvg5kgda8KwnrBvshz1LaI9a796x6GsSRcvsfJSNz/qQjAkr6Zyv2kD8aY5r5GAD3OuXI9yV+q+9W/@vger.kernel.org
X-Gm-Message-State: AOJu0YyMioH9jcpqzcNAB8JHWwDiotTvZJrbtVyst/JAsm1c2D3Dp2F5
	tDHiP4ASkz8hi67pkrWFoRcDTPVX8aNV+Cu5hiQ3OEbcNVb/u2KWmZkiK5m5RwRxyYxAtvTHZ+h
	U7yVD2FswO1AGeWkOSOaFdCIuaGrEHL38MtXa/Yq4L0eCoOYgANXKYB1QHKTJxZgFjSSK
X-Gm-Gg: ATEYQzx9rab6gm3Kn18K7hqmNmAM75defrJV79XpfWF/sMpGelkJSCJO0fOyd2xhEPR
	Nq362lBDvcVCxuDWGp8DbexbF7ilfPCI3Dgkhkyhm2DbX0levjmv05wO9/1G9a2zpPeOzuzSbHz
	XRv97zChmN1QpUrcNAv+LIgcv2spy8CH0Yoo9LqFdLe1bP8QEKrJRdthGmquSg0DDMa6ufKtiyr
	ol1h6/NfGliCtDUQdH4Ij8BQf7erd8DwA7UyxonADNey41P1ixFUlCLwtzIeDrT/uV5QCjhcijb
	5NKoXyRoCu7QgqANnniNuEQik2+jORUzvwCQTEHkeHNJYMBLw89wQoC55hR1r7LC3qhpu2gpwu3
	RhEFBcd6mlAkD4WvRmdTBWW8Axj4PRizqeg==
X-Received: by 2002:a05:620a:4627:b0:8cd:7685:760b with SMTP id af79cd13be357-8cdb5a6b370mr2226211385a.21.1773758879585;
        Tue, 17 Mar 2026 07:47:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:8cd:7685:760b with SMTP id af79cd13be357-8cdb5a6b370mr2226205385a.21.1773758878900;
        Tue, 17 Mar 2026 07:47:58 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm57298996f8f.26.2026.03.17.07.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:47:57 -0700 (PDT)
Date: Tue, 17 Mar 2026 16:47:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] Fix up GIC_ITS ranges in QCOM DTs
Message-ID: <ot7mpguhlxvwhxznxsinynypdwcwky4fbfaursrr7o5dqigmaa@6yezeixg7fm2>
References: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX4I2nafkyGYMZ
 JTuOZBunxg0fu275LNPBSGTx1bm7+tSMXdzDEtZLZAqrj64FGLRirR/9f+YdFoIIJSiqaIgbYtZ
 +06v0m8HxhkrPdmARYIyObeiBRUstVfbW99hEMCWjZklDBirJWOSaGrmTN8QKsuvHCeTNyohEH6
 VHQnOP++JwG8iCDDXp10R1UYsoe8YD91E87iFgptJmQScZ3h40kBA1AwZC1zfIrZCxIAph3k26V
 CZd1A1xzVXvvPShq3rEj62eVaMEQLc96odhqH4vKxyVXIMgxj+hXbMmKU5iIaB4rfn63iMMMt4R
 zjv++Mb4SEvPZCp1PwCzj28OevOj40nNrn2cFAqeGFWvCcyHpRp4wwf4dZo1pAmuZWHZl8GAcMC
 woKfMlP6ZCB9KH9a+KOzTUCvbsP+qGmEhFZzuACjckfiqjYJg73sBDacteG1b24R85zjJT4pvAG
 pmilALfaVtFWevwli3g==
X-Proofpoint-GUID: 2GaFloKS1Q7tL6_o0YoH1pkgFsuOyl9C
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b969a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SXTJD1JrO7pAB3PV7a4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2GaFloKS1Q7tL6_o0YoH1pkgFsuOyl9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170131
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98210-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8000F2AC467
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 15:41:13, Konrad Dybcio wrote:
> Platforms with GIC-700 have additional registers (such as GITS_SGIR).
> Checked against the docs and compile-tested only.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Really straight-forward patchset, so for the whole thing:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

