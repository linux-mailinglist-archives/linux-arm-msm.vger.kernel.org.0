Return-Path: <linux-arm-msm+bounces-111502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EiaFFa8SJGqi2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:29:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2164D690
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I1OjBi00;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AQrgaLaJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111502-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111502-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52FBD3037885
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AB63A7D6E;
	Sat,  6 Jun 2026 12:28:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B53A4539
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:28:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748893; cv=none; b=N0Ld6s81HzNuKDmKRqNh0DAC7jqjbzSMTEWgt4Eojfo3kOp6AYfCWemSmHA7HbA7vJY+R7fXAs2rSJIGZnoZIAF10uOKBVh2lgdrWbsi1pgwEEphO2a1yIjoIYYALPCGMCH4sfTNjTqfZt7NSqCnXlXiZ1u1mKDJ8e0Dk/cy+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748893; c=relaxed/simple;
	bh=n0RMNufJCrSfWUmwc6w1chzCACxk2sx/6Ga6+jLMAAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHTjHFComdxF1JteKXnkUDUNxCrsv2cUt5FGgsyygE5pUWpZMAhjB7XFh1crYHA/KyZal0hDU6zqGYUtVVJk71DvBWLSgc8PoahYlzb4USKc4UsSJd2uSgn5HFPOUN9/qfPCrXxDvuuEkgMz6wD85zFIfVjWVqN/PrOCYPE5ZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1OjBi00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQrgaLaJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDr0T1279436
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oohZfX3MrAqDkrpy63hwj9NO
	UqH9OuxEKmUnEtM1Q64=; b=I1OjBi00f3LPD2gEfafL9D3UzAkSs4Vx/wJPVRbN
	Fm47N+FlsBxsqzvegmPdks+ZHV590tjEhrCeGnQvOkY28PTO0W6DdE6YYsHNFEsO
	EwbBw2sDzGVd47epfO9vfl95MV83rma9lPiDmG9X7FxnmZwCaQ9sg1PJbpwjbj9y
	Sz3YajYGyhjTCa+lVSDKSTZysJyGhYRZa92AWdJpWKG8JMj5yiIfKTpG8+xyfCjP
	VQGULcxE02OaGWE3+7cHsmzVX0QTpYG14i7xwZRtZtKDuNPheBCA8sKIMXSl+xow
	YTGs0OCUAhTzsQS13wDLGy7DO+8m69B4TmppFfFmsgPxUQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagr9akc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:28:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b2863d62so896799241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748889; x=1781353689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oohZfX3MrAqDkrpy63hwj9NOUqH9OuxEKmUnEtM1Q64=;
        b=AQrgaLaJojThF3zG5l4OYKQbXfJsqcsvrZBJ159dcuplxhQHbLeHzW5t5YnPINEP2Z
         RGk1qi8c5GWE7WrcXpt8Qp4GmHILurPJ/jSvdVhfDvM2LIV+D5sh3u8bJ4zLrhGYyyAg
         eZkXN0juHclYiGOmQjIX58fc9oG+xc+FhevidJkFWmFN3KQmFcFrAtdEbgoKPYuouwsP
         Wm6TIVUMHEsGm3ozNADJDZD/FJlCeVf+loNtsQ73ZqvgZbKTOOUmrMmNJZt82zR65vAo
         oYQBEOwI5BK5wzFaQfJbGtwxLDgRPjocCWg/9UaIv7FVLtDsDfBNUftxWIWET2gryZtD
         +DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748889; x=1781353689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oohZfX3MrAqDkrpy63hwj9NOUqH9OuxEKmUnEtM1Q64=;
        b=GfKkgoZ7TdIgdixU1zzwmiwUNacVI33HcE0MGkyK3Rx7YTtQ2/UBMmJbBn9HRYF14M
         7yS/elDL+MpNNFERXi11MV8RddWmWRByGKrS2FK0sKp5yt2rndIopNJuA5CO2gsDNF2X
         tG+sgz98a/3XC/M8R5MYgs/YRTDs0cBisItKzMpP+8R+O+ngX06av7f78rNUtR83Kflf
         E/Tfwa+ZMQ3WGMk0xHntFMc0vIl/nEkpCFF6iOr9Tnbsy5PoP4S6W0LhnlrFvj1NWSWq
         ZAvbYFegWlnxHgHlS11AX3wUqDk2YDW6jUDyMq2ch8jR8SlksbYo5EmHZ3PMkG7LKWRY
         4G7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/s0SrK6HyXpcMILhRcYUDl5mMsFgJdrmUV9xsuiP246gfZdLC2ZxtLkpS5DroGQU1RA5flxlGu9/DTcLko@vger.kernel.org
X-Gm-Message-State: AOJu0YykuZHPkZso520/125bgtA73IT+fkab3eH2lFpq0QaOqx2Czr13
	UP6liRnmFGh8OQh9d8WI/O89MkZf/Ebc7Z1JE5a2N0SSrZ6mRRlXE14kw13pgPDj0LpDo/OO4jB
	0cAUEd2+2LZiqaVyNRhDuJqjw0+GmTS3sPDRhava6M8/L+mNjLTF3N0XLvhowS0y7DecV
X-Gm-Gg: Acq92OHRp2oTcCxtuaXa27tnIfKtNsSCP/oc+nYeAfMc0Cj2LKTPtPhi7Jebpi2Tlrh
	f7q90mtyPP1VRn8U0fgA0YtVViIQn80EogwW1v5EZKEEdSp2ecuK/3w2nDxmF76A3u9wfu59cFW
	2njsVHyregdlPQPWxq3rgQXzk5fxq28g/JnJ3MiuQysq9fML6Sn/6PxsdWQtRwe+lF78RTIG/g7
	q78tzXNpwEEiLq3pztK8TYcHFTIjY5gQo7gFSyR3kgdpgsG+ELvaYhKs64QhEZAfc4TOV857SvG
	/XQPqfA70hnqMpn+Nj2ldhzzFh9oHyjEeiWLq7YvjsHpNWgNNaCvP/mHpcwPo4q/Qma+UKgSujY
	yh1KqbCJT4L1eU/9/1VhH8wHo/EP7OCLQvxH8znb4cIfCAR9aJgGAKYOJYbGV+hS40RzWNpuoiF
	+szOrCAJITGAb+I0DXEXsNO9YT2rdbRdMyZxWUYnPlvopbIw==
X-Received: by 2002:a05:6102:1609:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-6ff0285598bmr4103356137.16.1780748889309;
        Sat, 06 Jun 2026 05:28:09 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-6ff0285598bmr4103331137.16.1780748888840;
        Sat, 06 Jun 2026 05:28:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fddasm2401653e87.64.2026.06.06.05.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:28:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:28:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
Message-ID: <72heot3rh7mjhmo6vali7oh5ld2zpai4nakwmm2kajwbxheydh@xxk7d6dy6o4o>
References: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNSBTYWx0ZWRfX3brgdTf7P8gD
 BhiOyTmHi9nAtNQ36HFoFcyrXRlFXO0IVK2Mm+u4k/V7R++CBbEM7xcz0VUwmiZ8tX4l4kinFsY
 DS+Vx3iYT7taBfVuDQg3A7AhVOpV5vZkql93/uFaZpcI5JshHs4S/GoIt1ZFBlDrRnTHX/e5oEo
 CIuv83K2s2udGeTkPjWGCh8fhfjxualMeDwFsw5XfmNNtBNcJhAOwE60wpKLypHBj87t/cyIMz5
 5eZKH2FHis3ET3mpcFyGTS1KHdNcI7V+h8F10g44Vg8AdiwrcnTFVO3cgbcgIQJq560RaXcxbjr
 Lnx5Y3NKzaWLPbYIGkjoFC4C+fDW4eNPUEA3PAKBP8QVfFiLM7dtY+UBvWV+wgR9AHXpJlZZ+iC
 a+ScZO201kv+VBvkF3Hvf31CAP3a3tWcWEdq6bz8zHoVRbJxsUxhyjueHBH5yS3S7jK91bKyizZ
 bvgtBChAwp+t5mjg/kw==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a24125a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Ic1KOHRaER9q49jtsWgA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: w4tQZ2nrgPcQXOP3IN4-9jKgxKgwPfup
X-Proofpoint-GUID: w4tQZ2nrgPcQXOP3IN4-9jKgxKgwPfup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111502-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,xxk7d6dy6o4o:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wesley.cheng@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8B2164D690

On Tue, Jun 02, 2026 at 09:51:35AM -0700, Gopikrishna Garmidi wrote:
> usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
> no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.
> 
> This fixes the following dtbs_check warning:
> clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
> is too long
> from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
> 
> Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

