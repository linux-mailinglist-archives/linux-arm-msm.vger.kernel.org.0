Return-Path: <linux-arm-msm+bounces-99438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK73JUTGwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 364202FEB70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88DDB301E9A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D103381AE2;
	Mon, 23 Mar 2026 23:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvtDVydc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFZ49ESN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4EC331222
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306883; cv=none; b=UeA9Vefncca7PGY9BCGKsPrikmakfPjJaoeooR04UL04a7ozdDp9UNFPSaLD/3A/BUhpbnNcazmss8vfzu/Ywlkzfi229Hky/EQGsB+S4dbL2UZN/6EDWWQh1J9CGda/jRlRSU4BEryth8pSnQpo2wggJvDU6SeHPvTsGqAP8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306883; c=relaxed/simple;
	bh=Tb+Z8GuKeek48XbV6QIpX2DPLuWKYStlQGb3VmRTzFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/xEcud7+QW5R+m7Jg9/AycvDgezwdiFw5/LxcnA0NbVRCEDbr3VS/8X9LsFfuVc01q/bykVo5zGkMUMstGbv47okaNBN0O6QRItaAgisH510/1MvJtNNyXXtHtW/HkFxUXreA0/N0VgS6bSZEhNraSOofKyO01rq5O7MG2z4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvtDVydc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFZ49ESN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZHl362527
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q83DlxsCYpBtiw5cxyyfSIM+
	Az8n5kRS1O8Tx0ZwVCU=; b=BvtDVydc32e40118HQDIWurp9kmaWhyxxQDrEcy2
	KcVz2YDnEpysi5JrXCv9lpDt3RQXh7roVCIBVEPanaJXNW1vEP8dgaGUyUgzg/gW
	kYspIEiMzMFhBZo7f5fEsLaSMBFTpvGdPlu5JRqTvn7BQomeLvdEogxreU3abc4/
	NU+CLVkej7sgBCwuXXkhIpo2Q+Wkq4ZyD3XhYSg/s6V3ff1VdmlnTJLZXVqL6+HC
	UeJdT7Zy/WkNXdPZ6nsBQ2d8uubKgPe/3NxPuanDV/5XguRmtAzoOkkB25W5+qAQ
	SmAmSbdAcDM1RhkQy78raSM2A9kxvUhmDTGqInA+Xf3fjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32g6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:01:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so341925721cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306879; x=1774911679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q83DlxsCYpBtiw5cxyyfSIM+Az8n5kRS1O8Tx0ZwVCU=;
        b=KFZ49ESNXjMH1Jy/lHFsdHzEmOLwUQXu4ddDzGtWSkBiQkgS/KwmCTvb3RzYrd4+Ey
         xV5WEajpIFIVPSSey5g3MSBOtBsrUtJ4a2mNy29u5HCvR8ImEIyp3Z4yFlxeKsRTJXeA
         vU/tx5CsEVBi+awbePWbtT4vbWNxQNlV+OGrOtQbNlvcwTu1iw9o+uj8MtGivG0ukynn
         CmI1dvajkMGDOJUPt7POtyLLJFxSbbHttito8mKlARXuQcPzdsMVxr5wIWWknCzV8hGa
         L2cs6on1WrffHkqcQoIvsxSHQ4G3WC4Tcei/iHmhrDmedJ+kyhokkq/qzpX8xu0Ap0DB
         K5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306879; x=1774911679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q83DlxsCYpBtiw5cxyyfSIM+Az8n5kRS1O8Tx0ZwVCU=;
        b=dvWNj1OvXHqGd85viAGQB/0BGVBU6bJYj/tPIN1CAnDooRgaFq1x0jY6pB2DJD1VuO
         n6peHtPeoeFvLQRDQcm05/RGl1TnZvSgocavRToSY8jH1gCscRG2Ef9HHnz/A85bILe0
         s2UINKDYQipEAFH0Bo81TVYgIkboEkKlFMg07iyfC0tpAeZpUff9Rtf0WMR4JM+G43i6
         xcBO90a48EzOKloZTTy+4ioIkeHxAg046scJpeWpShGDC0ZpPGv92CJr+LVm3ihWogmM
         jpV9OtCEV5fcyDb4SXzsg0QO639nQNst1czCWznFkcQmi9wDM7li7Uh7jRAaE0h790MX
         Y9yA==
X-Forwarded-Encrypted: i=1; AJvYcCU0jsx39ngK3zr2jF/ANmsODFwaAtp8v4mEb/6Gw+S/6yjg4P8W3dBmMy8rJ0M4Kd/HBvwI+p7nUdF5DH4v@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhghcb8NPGC1v22j7YrHkKTvxDxRIY6FlrIywrLFJc7SfGdLFL
	UZVVKrrVHXxT4esAcQZJ7uCxSCC/ec+LXj/UhznyFO7G0tQXcer9ZAgjTnty2Uol89HTbZUtjOw
	oXAnRUI6ZaqF1B4aZR8ABXKmM9VaUXbQ1+n8YLbMs4aufvOuadTYu/ZFjI4LDGJ6LWCV5
X-Gm-Gg: ATEYQzwqZFsfAujCUDYNCloCtxUr7jwECtqmTsua4f/7cOgRBGPz5Vy9hgwzRaofCUu
	Ew9GBpmWd0AYVN5z0pIFn7RbJd6EnjWws8ksX/obfMEQAygZhkciM0ZEjTclKPegle1//QUIYxz
	CTVjznnkjJNiIc7aZ2OONVCKWL4P+2HSMTHsG/F4NTpmzeQWQjMj7IdP7OS0FHHE8GIpsY9pHQg
	DHPJ3z4rpMZJbZU9s6kbo4LGijdqLNDlqHQgMb/oMCl/1KvPdlrUMK5pFmIJOgLIEGIg9vCpAP2
	MeX87f/uO1Ek9Quw5sYmR6v6yazo+6mtpr+Jt93tJmYzRR8EfZKNC7IpzH0HoUZN6gtS4/jThX7
	YnL5MOjFl2RYsFRin7w5OZ5bzgYy/e2GVzEBGx8AFe5tWM5sNTpOzhqo2Tel5gHcR1N4L7yzStE
	wAZgb3bX2zKTacl+qxIAPY8d03MKSa4ZyeimE=
X-Received: by 2002:ac8:5894:0:b0:50b:6d63:6a2b with SMTP id d75a77b69052e-50b6ed42b5amr21243321cf.2.1774306879025;
        Mon, 23 Mar 2026 16:01:19 -0700 (PDT)
X-Received: by 2002:ac8:5894:0:b0:50b:6d63:6a2b with SMTP id d75a77b69052e-50b6ed42b5amr21242711cf.2.1774306878459;
        Mon, 23 Mar 2026 16:01:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a296d7c93fsm82072e87.51.2026.03.23.16.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:01:15 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:01:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa
 iot evk board
Message-ID: <7qjxbdsmscscpj4lx3cqs4endzjumoqbnqujnevnyks3dcqk6e@nv5d5ygyxoa5>
References: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1c63f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PX_5yWcNQeZoHduem6cA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MCBTYWx0ZWRfX0TtaV7jfmhYL
 63kTYTepve7LbhAikyemYbyeVohxZXpaEDsZQrMAOONK1KEV0RJpJhwqZAjC8HKyfQt72YjaZTL
 2u94XR+tAscfm3Vr+z55xr0szFQoTHPUVR8eknz0fz4xkUBbVv8av//KhUMMCUknsl3AxbRH9A3
 nMxvZqua+BdUMbUSDkhLX8f8MONBvgFDR8n7osxscax2JKSZ7yuJlywt5GujZ/l/eO1HAIO6LYj
 36KyUpFzGU8V3OFlGOJAFHpYJ7ZNXxbI2+ejaCjMO1mBahHT2VF+e1px2Uj2utPv40mznuCONHc
 SB532VWn1p8vB0Bj181sXZlG7EB9NmhSWnQF0FyICqJLcq5MZyNJC+XWbtRQmVM8ZV9vj17GSck
 Wrt9jbtXDrxREl6eqofBFfNd5PiJHui385S3EXE/pgYPUbPAOWpc4ho257yNzXM1AfXAyIt47Ot
 /Hlap3WbsKMHvHE63Bg==
X-Proofpoint-GUID: PmYHWkWwSfUQjtHBbRl5Es3atF_Vk_bP
X-Proofpoint-ORIG-GUID: PmYHWkWwSfUQjtHBbRl5Es3atF_Vk_bP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230170
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
	TAGGED_FROM(0.00)[bounces-99438-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 364202FEB70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:30:17PM +0530, Sarthak Garg wrote:
> Enable SD Card host controller for purwa iot evk board.

IoT, EVK. But more importantly: is there a uSD slot on Hamoa IoT EVK?

> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
-- 
With best wishes
Dmitry

