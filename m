Return-Path: <linux-arm-msm+bounces-58721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1783ABDA86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B761F7B08E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538B924633C;
	Tue, 20 May 2025 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGXC74t+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FFB24677D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749411; cv=none; b=p09LtDZgFUBHf+vBHYn/O2snwTmwAE2WbHxTfE1va+sUVvSOF/UnQSkbgmvcxxkjm/ID3Pob2p7I2WKBkcSmdn/6lHDwd22bBQyH45sH0YlCT01Xwd1rc8OFT3Y1pNMm6baAoCPpStfGgP0IGqp35qY8xRwUwZMihsDuIYwAJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749411; c=relaxed/simple;
	bh=2DtJoe4AgBZJbwKm52DJ4ezCtVzFL6J8MlLL/Ki73yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIthj3o8ECOrLGndMyp0U7WXisKGGIfA8xVDp7iwAUbhn6GcIyqKRqlHVLT4IpDIQfI2+/n8IieRvWYRtHFyNUHB3qcrrTSbjoP7lQZ/5M7FMZa2D2DipS9dgIXFIZJQS5Yxf9mQ35By4xfMs4qPC9mF/crgOeLL6lt8VJw9Jb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGXC74t+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrr2A007169
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=th+tHP6s+aFCO20bnXckCdd9
	gdUjY/kHP9tCrjt2JeU=; b=DGXC74t+DrWisFDaNEe84udJmfaD+/Fgq17rycMr
	ldlQbjZ0lhQu8Hl2g4fLQrRIYpaejGqDVNj02X+eC6+KI9ihVTLx0rVuxRrRf3JQ
	uKlD5+TEGfkhTzU/Q5v4iZEKUrNNFwx10o/qw3nULwxN1qyf6ecM7eeSt+TR+0Z0
	7Jqrh4jpoR89XHKJ8VXc/PaZQQIbSRLTMjH1Wrf29dGgnxOPdvj08W2/XeZ1NmHD
	aeORtoZQ0Qdrafex4KR4pZLIRfWHwGbNrpvWtdya9+VKnkF8nyYWqpO2kbVPYEy6
	CkYx34t3pyDV33boZ2sPVCZaNONBsAHB7YmdC4/BH83d7A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7fvx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:56:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e7b78eebso14285826d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 06:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749408; x=1748354208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+tHP6s+aFCO20bnXckCdd9gdUjY/kHP9tCrjt2JeU=;
        b=NIdyXwDCzf1rUynf8+naJQIhfeuJ6iRpvpoM1bxzODbIF3EyGnXw3KAu9bgot92e7i
         5qv9yqr6dq51tPJbL0hozoYXAwDpL2MhBBFtzbHjI9UgkJH/AQCcVKYh1bRWexQibXLN
         gxX7TbO/5wj6k2MciKlcZ1Gr1FXwfdvlz1J1QDRvdw8UCfgVfmbeNxSoXfZbAcyEbWx6
         7GpdWE1dd3HmHMACb3AzOE2AAnYY7QF63mBjSmxlVsBIRvPzUWX97mXYQgSi6lvfoPNN
         4Pee4EdqhSaSPQkGWjrV2ItSpkXPMHGZ7xjqofXW7Vh7DMg1mX2xQMHMY3/S2LRhAix7
         dfSg==
X-Forwarded-Encrypted: i=1; AJvYcCVapoNB88imnIfGrdM0naMb3zDrVxc0+TwqGyUce9PGqw+SrdF00uspar1s2pbd6Zc3s9Z47wcTvQRRbriW@vger.kernel.org
X-Gm-Message-State: AOJu0YwneztUDEzGX7J7Nh99eBKPgeJEzlY/kR8isEfHVrKhBtqWenDa
	6KE2TjObx1gD+cK0holL4oqNYl9yjRBEjKNoRw8BswO1wyQ0BlkUNZbo7OW6WbsZRfYp86aZzDo
	gGbAEUvHffdlWMD+FP/UAbn9JuRD/ma/r9qRpUmTtRAgds38kcIa+JJ7t2kU8QGvO6TbI
X-Gm-Gg: ASbGncuHE0O1rI4Pg4knaUB+n1fsRkkxVFLMYIlQSAYldgBeDdt4nEuHPiV+t7u9Imh
	xgW/VJtoaxnZj2GLQFQVHd8JrAbNnBTpz2wJbsjKVf3TCWjfKWBY9hFscxZSGsJBVY4HsCMpCpT
	I9miHFCzx8uW57mkIYRYSJ9gCYEI8K9kVfVzH0VEeyipAF6bNJmnp7ko4iwowJXMpQX4P2kqdWr
	Rk2DAkjC4NuezcC9Q29aCFmUzwN0+IR5GI0tFgRQpaOVNlIf7E0wzDVzQUxUIn+9M8cXLYwyuXc
	d2EdrsCakKWhSTGSejdcK43kIOTDe3K0PSXx2w1OmESo6gTpI5D/d7Oh+HRGdG4R62lFkLKELhY
	=
X-Received: by 2002:a05:6214:ca2:b0:6f2:b7d4:afb9 with SMTP id 6a1803df08f44-6f8b2c379d0mr273741596d6.2.1747749407815;
        Tue, 20 May 2025 06:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESVJwiq5iEovE2u7Z14uHF+CAbbHCzu7MfRmtl4pRcnVmCN+s9yFyjW/ov5OGdcR2C9j3Xrw==
X-Received: by 2002:a05:6214:ca2:b0:6f2:b7d4:afb9 with SMTP id 6a1803df08f44-6f8b2c379d0mr273741106d6.2.1747749407340;
        Tue, 20 May 2025 06:56:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm2353321e87.196.2025.05.20.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:56:46 -0700 (PDT)
Date: Tue, 20 May 2025 16:56:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
Message-ID: <4zl7rkdldm6j4hhmluijscbmlcfyrrpbyouf33aczbzrrv7ooi@igaigzitlofi>
References: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
 <20250520074737.1883495-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520074737.1883495-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682c8a20 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=X77NXM8zCmOlsI4LSM8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ima25vOmokSclUUvZ6aKn04sjRf_eO_P
X-Proofpoint-GUID: Ima25vOmokSclUUvZ6aKn04sjRf_eO_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMiBTYWx0ZWRfX1ivKh6XTgGgN
 UhKGPHrhyTnLZjFWWI4wOW26BnDZsWnq5j+9NG74oIkygG7NHxKDFNxVLqMrtMXnkFxniBXtz1Q
 MbzlI7TlSvt3WZoVGzjzg2lIKX1SjyYeNmBiP2h4J0uh7rF0UZjXcDwGu40Y/l1eLTu927pDnIR
 w37nsj2obo/vbDyZZ/EG1yqN1zhf4+I5qtl3xpORzqWThkJx+Qv0KYKNOeqj4mLY+kZGMhxn9Kw
 XDVSYIaVJSyZXLIlY4k7FHpBTjXYqckM80Fk0QiR9Au5UoL+aCOebxdL2dmfn346iAqP01CwXkP
 fMbccQu+z5QqVSwGwp7MJfQTMffoXCHRG//y1+IertY+U21SP/ewCxQZ5rR/E2ahSOuTghIdvIA
 i/gGQLg/i33XDCPS21rGbLMAojmqbGgXYjG9n6hYD0GhoLcpDAsWUqH2HCswFGrjTjAvw3b+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=657 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200112

On Tue, May 20, 2025 at 01:17:37PM +0530, Ling Xu wrote:
> Add dma-cherent property to fastrpc context bank nodes to ensure that
> the DMA operations for these nodes are coherent.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Please abstain from posting new version until concluding discussion on
the previous one (note, concluding, just responding to all the questions
is not enough). Please update internal guidelines in order to emphasize
imporance of this rule (yes, actually, please update them).

Until discussion on v2 have finished, this is NAK. 

-- 
With best wishes
Dmitry

