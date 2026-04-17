Return-Path: <linux-arm-msm+bounces-103559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFzSKTd44mnh6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:13:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06F41DDB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04277301D6BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D346633FE27;
	Fri, 17 Apr 2026 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLPvWDAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9itKb1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1113AB26E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449336; cv=none; b=DwJAy0EzJtKLyYMyJKs0N4mxA2c8IKlNt+BuEW7aaqsq7GXkV8QPBhEAUsZwu7VppGi/PUp+oFgNiEyV2JrAwMnWpZGzcMVqWtxP8azt68rMVW8AnD7+5uDNcQkHip/gD5EONAIeCRav053QS7mqLQylEeVf3gAq/8syAQiJpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449336; c=relaxed/simple;
	bh=ttiUZwPUDs+ec+VE8ov+y2dVhFjYc01N1s3FIbv4qlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTuMR5WjsdOZean5uLQEXQhSeHKPSbKdYlPGh4qazY5Hya6TKEOxjBLcMux36lxGajiHf2S6f+rbjMyS4C+GdUcKs7kEwUJdfVTrlzVTdPqEMDxiFFjy2Mc9HVdS0ijekdv/POnRDVoGL88qYQP4HCSPLUL92LboS58xwCqVcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLPvWDAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9itKb1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG491l3929257
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIf/DYTyho2jmhLk/HUTDnyC
	lp9GQO2z8UG/IsIZPdk=; b=FLPvWDAVg+1cwIKwvpIk7dQdkFkrJaI2nWAorg7h
	lJ0dlUSoLy90xtbWK4wVKnB/h2t5eHoJFfVXyjkhlJjoRhubme0JLeuOp3y7hw+Z
	GcCoa1Ir3i9flbtlVZJ69vTpqUopbD+tjnF3A0YbnviuqblRdftZx6A4R/sXlI4l
	fvVJy6Rb7lY/U/EgH7iaK4+Le9eUmSKQex6PAsQlX5SXK+aTuVFmG4n7uv8F0vWx
	6CHSUc2fj4g1bSQxsVaUa3n9UNo+e+HQ8lk5VDrFY7SAp52mnTFIoXdNuDV5l1nl
	qi8tDwFG37ajTxjdxFt5eVjRQ/Tea4TX1wwCCFCCM5fiOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqujgemd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:08:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611740c0b8fso385922137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449329; x=1777054129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIf/DYTyho2jmhLk/HUTDnyClp9GQO2z8UG/IsIZPdk=;
        b=B9itKb1jp5WcfQT7RJ50F3H5aRhn5sa/y3Kvgw8Tzev5o0/iiZFJRwLgYZReTLe7xe
         CZ+3xcciYLdVGkM3IrvjSLnsg8IP3Dmvj9UjSTcKtOz6YDrxC6nKvtipugs8YNJc4XAd
         gm6stVFtWXyI6zUpxTQhf+QV/X5wRBfgnOmDX518m1LKgU4fEzlVHT1UO9egkf3chz7k
         y/rKosunSBq7ke3Tj031M9j15YiQAYpvFMlcDkns+olckRZBzGDWQWn3jlWdBUniMHTy
         LUw+ZwxxeP0QodmPgYXAoSRl29YlSC4MbaUzVTozh4GEOr7QwNEOh2rh1cFApMci6i2D
         d5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449329; x=1777054129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIf/DYTyho2jmhLk/HUTDnyClp9GQO2z8UG/IsIZPdk=;
        b=Plv0e+Ie18YXpyetGESWX8yZZFVzq3Mb4LtXssjCWFFFr7uyz4jpGbmBg1JNlPlP/L
         1MFIcJ/OlE68JElnd+eWnNRt2amOXZHHxZXB2jcGEQQgIMKHO6gcEmBTX9S9xUakFIRu
         75qw8Pgoy64Tih3xBHOAQCDKGVGaeI1AXXiO+TsBHekGQjG9erzpKfe6sIUYork83X5k
         oVQnwYhp9ULWC+6nydkYs9lJBRMtgsLp+E2tteABXXF+UvPIyqAFr25d1keHkh9TTanh
         gRvl1Qt2Er36qxinUS7UVfWwMrnawC7LAfRI5lm07TdyZQnnV2MMGhrXivlSvThLyUOV
         B+mg==
X-Forwarded-Encrypted: i=1; AFNElJ+SxxdB+J3Cv1LD30J6CTRFZJyd87LX+HIIxmi0vZ90AAJtk1loAi/aARHQCIClxB0qXRv2DiA0Mrn8iDe8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+L2CoG67RuHm6H8k+KTJUqSbQGlLAPNSJD2IhY+ktylcruhD9
	viZxtmsf3boF9bg1qGRAjoNuFdjlkRJAnLPLzSNNjpnzbd9BEIKiw3BaFcnnCdm97VL0yk7z40B
	Yabk35Rv2lW3iEpZ3VD5kGQrRcNfTpeycTzsoURpUDhkFbY5oTQ7D7jggEhwzDHergM6aNOtRfh
	6x
X-Gm-Gg: AeBDieu34bey8aN8YGIBKmwYbLxhJTVk8r773nCjmoyDTXXBIZ2qt+oZvWfxGOlxZes
	V1+1j8sQw7BfJ4CCG+0HkXBnT5Gm9kvtrVsf0bcPJjmD6RBXLCfuYe29uvsDZ6QYiq0622TJX1g
	eOrZndoj1+GYgY93u/Q8/Cr1k3utGuj5uHjr/2VhuV4MjtCsX58prN5w5c9M4RRHW6Vbou6KNwI
	U+IkGX4TG1pIZGQXC07FcsSxGOhpEKRQrsBUzYRJrasrD+o9jw68FoytdtzBfA5I50aS0VR5hFB
	BeveJviPjKb4aKmKMxCPxpxEGXvfpEe8pD9fU5f9G4pSAWBPk7fOIk2qMn4YlEulilrrvGqrw2g
	N/LVQr0IHW+FDJ+DhVaT6fGtlUFEyeQQUX2O3nXfPbdfFFZaMAogwTdQKYRHEsX2q4KhkS3iB3e
	8aApKibMDg1iMyK9r0N4ghkjNW9U18ytmQR3pXHcLV2eLq9Q==
X-Received: by 2002:a05:6102:3a06:b0:5ff:b684:f796 with SMTP id ada2fe7eead31-616f559e76bmr2093436137.13.1776449328732;
        Fri, 17 Apr 2026 11:08:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:5ff:b684:f796 with SMTP id ada2fe7eead31-616f559e76bmr2093419137.13.1776449328311;
        Fri, 17 Apr 2026 11:08:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dd0sm592057e87.69.2026.04.17.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:08:47 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:08:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs
 properly
Message-ID: <zatl5fgxuckxcltwhgzu2ksj7kfv6bk5uaq5i4jhcexhcmyuao@2kryrrypeauh>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
 <42649c1c-3868-44ea-8186-49e34abf10b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42649c1c-3868-44ea-8186-49e34abf10b9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfXxED1o9jkyxmb
 fwjo3LSGZxeMvTZHgWBnxUk2SCA5MEVU4NPqsVopfpEIV5g9XelgdzHipCA4S74hARgbLCH8y1w
 fbAmwPIARUdOHsf3PaoOX93ng0RrJeJXocJDi+0lpK8xJ1E5YM4RY7xRJ+dcUv1DTcIi+5Ih8SY
 RR6AgO9t+www8g9CRt3PnKr324zjZV2DmTvywCRDvlwuddKcXwFkehSz6GHylMK6LEIkVS5WSMv
 TXtrVAJv2gQNPstI1N7JbpSzmYEETONt2HNo6O3lZGF7zycb9zriCRZWpGDWfBkogoUu8kY6b4J
 fxyr6I/bilK6qSt4nD7//C7gHIz46N4FiQMEIbRyKa+Vt7hr4Xqo+cP5WbqkFkknz9ueVf9u/zZ
 Pta1o+42gr30lVDJHdUyt33ezYvujcHl5F0gaF93quB2c01G/sHj7Pc9b3RhiRx8IJNsMGSwXJ0
 x8yMAIWYhuHYag2dDyQ==
X-Proofpoint-ORIG-GUID: 1KFJAH97cXYN8S6TLU7mXgIblJcyoGA4
X-Authority-Analysis: v=2.4 cv=FP0rAeos c=1 sm=1 tr=0 ts=69e27731 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=qIOqSNWHgndfu5AQeQMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 1KFJAH97cXYN8S6TLU7mXgIblJcyoGA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170182
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103559-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A06F41DDB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:43:29AM +0200, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> > Changing FastRPC compute-cbs' reg values to matching iommu streams
> > solves SMMU translation errors when trying to use FastRPC on CDSP
> > so change FastRPC compute-cbs' reg values that way
> > 
> > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > ---
> 
> Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")

With Fixes in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

