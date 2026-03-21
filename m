Return-Path: <linux-arm-msm+bounces-98988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEDGJ8dBvmmhKwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:59:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 401352E3DE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69655301D0C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 06:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8661375AC1;
	Sat, 21 Mar 2026 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7e+/x16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/QLVlYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0C375AB0
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076356; cv=none; b=N2yci5dbXY86Mw/Oq3NhjRvY6G5C12jszFCMmk48hFbMMA+OWDje3T8p9TevIOhzHO2wqQCSz2/Yo1wr8Smym4Wart1t4+EhkJETRftSxm8U9dSH2cCC88CanC+GJBkNHS4oT6rkxKr2W/VU5mI/fXDXMEof85ZItO44AMkhSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076356; c=relaxed/simple;
	bh=YLxawYoMqwrDagQHNtgY0UdSsD2gPzPW/6AokfN0m3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRo01wmvqzxPFIvWAM/iL0WvTJL3R/Sk4XNzkg0lvr02BJRYo//bvuP/DwZcCZ9cDXDvLtQLrmblypGKP1FIfNpn0y2bzEVoHOZBmMk/EgyBA72o+bbZ0lhxkCCQI/K/NaKb1ksMkHpnF1rSqHi48APwBBvszU9VpU5PLUOJPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7e+/x16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/QLVlYd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4pjWL3826047
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGg/1MRgLOoEks2DaxJ/dsu3
	2MUliD5DG//4EHtCw2k=; b=W7e+/x16b4k0EUI9yHZWTYoX6jIM26Go8NoMvqny
	7bCjllck9Og/rHSzIKFxpnoG6MMxEXXOY8onab5C54pKGK5NKKji1YVXx74Vosrr
	fFVDtnJ/6KQZfMNclYbTu64ktE6KefGialLht70EHgown++JrtWaXe7vwCq0NvFm
	PFjuwmrtRMdgoiOTWpys98xl5GauVu4cLy+J1hHoFYlhyabc/aQ5vCjGd3NZO4H6
	LPJWktRNML1RBDsnjYjTBy20xvtiUSCcx/ApuIxS+dxtFl9TWkMVObiqSEF6bjoa
	mLT3+nnSGd/GYdvWfoR4bHg9BSFqK8UTo0sVklx7BNwEcQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1g7us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:59:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso194621791cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076354; x=1774681154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGg/1MRgLOoEks2DaxJ/dsu32MUliD5DG//4EHtCw2k=;
        b=V/QLVlYdTTzzJD67Ucb023CJzUBoNoT2q8VJD1a7n8nt+PgdTA3CWryNSDLsThxu8a
         jS3FHhOCP7wv5YS019fleqiBDw/+/3oMyAlJMAaGzMmYlEfETan3WtluKZkOjXqtWkL3
         h9WWALWOFkl34hBxv73DUSi1ek+4EswmiwxAu6S+oPWp8q93xez9XfrCjPPqs1Vdztus
         TpU2TpBATbnjeh1HaeI5GwnsyuchYkRTFJ3PVgsDdObt+LScBlY5rPPjLdCPUVQwzfYZ
         Ff1pwydDMOsk4YJLk1TKADLL8VyUq3ziL5Rb8uqF2cxDIa3EFWOHzeWVslx9XKoNAEZz
         ASAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076354; x=1774681154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGg/1MRgLOoEks2DaxJ/dsu32MUliD5DG//4EHtCw2k=;
        b=UXRZlYAxzk+n3sk/KnCd0wnp7HJdW0Z2/jMkNiCtnyfDsU3YCoEpKAhXczjxxtQUox
         jqVdFv6OQ+uEab3qjiLdBQJZCR4pQEVx+fVBmAj00OyK+bMxty88mCgWvKzAAKk/OUaH
         oObvAj58MNCXy/GaqFBglcS+3YRCPkJhtYtPJ4fdlPmoNor1S1qnZZMnWyJk+kUHON0d
         M4RHMZRtfWHwqagaBekIDNPWbr+cASe9bSwOn6KybDjnAl6P/QmG/WOOxUFLaelPXvM+
         SQUJteRTgnOsvPXM2jkAa38mF6isRT9Sfma+H3P1xzPdQEeOdKJjnL1w157waP6qBr3q
         hH9g==
X-Gm-Message-State: AOJu0YwP2BrDnBPBaShuoKOp96G0Dtyjp+ywlpz03vDHBETwR3iRDdto
	ya+HNavOv+CkcbONaXJfe6WQoBrErSxnG2al89IXpoFqISdLiNGy3B5S/D6sgMhRY77k6JfRJHA
	d8Z0L6ZHQ12HC8HE5rD2SU6u+xUcCg2HXYo/mAgz1hNH28lUm8GicoVWAjtdt7qqTMrepwhZEVa
	dN
X-Gm-Gg: ATEYQzweKugDQH85PBlOyhyTw9z5+Ul+WcFhMX/wSHTPYSozpE4Izh3oIm6uWzjHiIy
	uRc0L8evco2AwytP61+atF9XBGag7IQ1hW8VweTlN/p6E3M6KTB2RBapelrzW6QCG2rY0vJIcOV
	G7ziEA/u5DALjEqsWAsKO+X76sJJMJTzIQUNrUuylqi4Qk670gkiyFoUzlKeSoOQuXp+aIpn04r
	HsQxrvHp5ZLoIZkpUyVcBfPVrUvouNdKBIGHS1AGFTBLqDPprSDftMFWoGXAk76lMfeZx3kGn97
	37lW+jQOOqLBkk3QRk1MZ+r1Aw7wz5qL0XhSuWDBLG51d6VXR5e7DEOUKe1Cjz+PG4zDSxXsbfW
	GXoXtDVVPJUvDmkjPatHPoEAfiK61jRQGejMsboYDLZ6dIy0u1/qRjdQWfbVGnSpVxEANBS9BqP
	XslUEWWJEjVozIKwi7XigPiSLFTnmb2608VPU=
X-Received: by 2002:a05:622a:1b29:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b3756847cmr90079541cf.66.1774076354085;
        Fri, 20 Mar 2026 23:59:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1b29:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b3756847cmr90079271cf.66.1774076353618;
        Fri, 20 Mar 2026 23:59:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm1011425e87.39.2026.03.20.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:59:12 -0700 (PDT)
Date: Sat, 21 Mar 2026 08:59:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Lei Wang <quic_leiwan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SA8650P
Message-ID: <g2a2eh5eqjedqucnn6h24mwb3k5ezew2zbmi4hcvmgbi6urgfh@yu6elitm24q7>
References: <20260320205933.992852-1-rrendec@redhat.com>
 <20260320205933.992852-3-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320205933.992852-3-rrendec@redhat.com>
X-Proofpoint-GUID: tZ0fkwVnCHhNADxuNG8aMUlYO83ztWQt
X-Proofpoint-ORIG-GUID: tZ0fkwVnCHhNADxuNG8aMUlYO83ztWQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NCBTYWx0ZWRfX8vTfgxcLGzmk
 FsXMa4UUV0gKj3swfIWFtL1P7Cn7U1oFvMahyhIcYrMlc1y8PdYrd9Afz+zGP1/g4qWKgMVciGH
 t476wf66pRPA3CM7g6tjx/IHearVPicMwZLVW7GYYDIM7KvXL6H4OOPYdiMhoQ/PRK3/8wpCMZP
 wt6qKQfr7W8Umx9ao/YU/c7h0819g7J3Qes20hXDG+FlCdwOVGa4e4IkhAg4DAps0SbulS7sd/Z
 lzV5wISQ8lizRTjlVSn5tLJjxjzsh9Hvq+ox3OqicZNRSIiiKf0DKd8s+heJ8hDQu665AAbGvCp
 4lK6Z3Swv6AbzxHFp1+fPMptZFmC0JIg78VSGZZ+K3Zk4CT78bvnTWD4qql0xrPta47oH2dO8gP
 77Z6aY9lxWZUqfG0xmqvfeomDK54RHyEIaQWSaB2QetlbOW5edutGfEY6U1mIzucpZk8iBoK2++
 r9sZl/zVW3S+DzwBtDg==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69be41c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=VBRRJ0ig5K1ZyVlATl0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210054
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98988-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 401352E3DE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:59:33PM -0400, Radu Rendec wrote:
> From: Lei wang <quic_leiwan@quicinc.com>
> 
> Add SoC ID table entry for Qualcomm SA8650P.
> 
> Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
> Signed-off-by: Radu Rendec <rrendec@redhat.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

