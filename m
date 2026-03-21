Return-Path: <linux-arm-msm+bounces-98990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDRzAJJCvmmhKwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:02:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 046252E3E61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D160300A5BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92239248F7C;
	Sat, 21 Mar 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lun4kW2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaQ/2Ykg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548AD2BEC55
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076555; cv=none; b=t0OP/8hkN0eH6sGhzo1RXyPd4EtAHVczW0HO8J0/OvUQXRDjkJkvtwmFRST4KQDy4t2SrsUNZ7RVqhGlXLxwXv6xhB6cZMrj8OpFXfFGwXzS/xKO5OMc0w1atGD+wF6+x4UXO0XGWVQ6VdCH0e1eRalhfr6bKzE9qz2Izrse65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076555; c=relaxed/simple;
	bh=orA7Kl2kyJJ+DwbqeM/sTgHWJlKWLtVGl9tfYIHIIc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYSdM+63Kesz6ftOJQK8g+TKKPMC4hm9G8uwqnm+RHthpJOoiN4AWFbkozSPRrDJoq6Belz6OJdUmEmaH5i3QXmXcw59KBq/8VYhZX7qy7XQlrLgx8U6fnOVyJ112C0BzSD+7hF22D6naAsAC5tu8C1MTREAmiyDxuYepzqdQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lun4kW2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaQ/2Ykg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4n0NB1228845
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2nL8wjs1/k1fQh6HkDKZxrP
	2ZPVK54z09kYBPEcoeA=; b=Lun4kW2xfYHpFg86F9Lhh0MmfqSZxXaWLpXM9t2f
	RYRuxYkgd7QjcB9qCMgViL8KU6af/Iqwz6e3hnQ37JPlZSVDuEy3amC8SZZYBp8K
	LmDzIr6g9/8+/uIlAadD5AIo91XLlq6esIULV91X2+aDHox81q++XwNs7U+GRYWv
	Ybs9vs1VHFpasNVREm0g67E68/K38Bs3XjgVPyLnctpXDIUfYLAgfIHUAejxlzvl
	wa1+VJBGx2A2+WSRwMFI/KOVe2HBvJ6oY99b03GiBxTa1bCem0CjGX89gS+hHQJ9
	Wr9ptuNVSSp0o8nYG/4nte/M5Utxd7HOyvFLXb4Ip7f7/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kdu88sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:02:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093787e2fdso182263551cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076553; x=1774681353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2nL8wjs1/k1fQh6HkDKZxrP2ZPVK54z09kYBPEcoeA=;
        b=LaQ/2YkgSkImz+LaOCkrzLT45IadnFRWbwQGvslu8r0hewtcf2Yg8vjGtc3D/vJcsn
         BsTw5Qo35yJzFUBDOtg3m142dGEAJkxrT5CKBeXR3DW8GmDFf3LCDZW94d1jWl1ASQt/
         1SwbQPZW2aT3okOno7JKpXw1Uhz9QdNj89nwY8F77SGKTmiLOPQ8Kt5b7GHEYVpyItUe
         kiQO4jvZOj0iPQwHF2i9DNZky7oXn9NCilFLf7jtWfwLdH6EDbuEsId3lOfpfiu2TJtV
         Zl1BcdosuiKGnWaSvstJp97YGFrYnoVGTghnjRqsTqvF8aQLfCcHDA4hnRDboHWTcR+H
         xlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076553; x=1774681353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2nL8wjs1/k1fQh6HkDKZxrP2ZPVK54z09kYBPEcoeA=;
        b=Jx3wyeBAHkTUaE+p9oALTKwYzL+LwOtVEsZkWvMa+L0u/lciF64t4Ed8YtqTeSGTeB
         jrL3NdbXzm4e46Mq/erb4tTFDxgX6R7BUioR6l9TBtZf7FZyPDmbM73gNncbc4aRhfG0
         0XgIAHsCHR1+L0PstRG1OBlFaVqnATF7l3opWO4x1tMEWNklLVRpyCvn/OOIZap38DKL
         LhQaZqH01L5f8aaUOI6si6up4yQIocNvWZaEuIxCwcWXacxnkWptjAqRF8Xm5y55s5XI
         xh5nYo887PK5LolsKUP1cm4FTrfXf/aoYceBucuzYamCgQksd4I2b06yX25k68YUcy1O
         OYXA==
X-Forwarded-Encrypted: i=1; AJvYcCWgOWntAUnjCpWniiLzron0COqKeir6SngFehMFYf9L6t+GyfdCDJlwIYg86ygs6tpgGRDkGXAJXZXVkc5l@vger.kernel.org
X-Gm-Message-State: AOJu0YyozUXKZ5F5uBNYGFxKpg1qdMtG3cRm7P2g2XE/m7KNlRDrt+83
	/chhGTea4g2x1msMBYa5DYVS1SVisDxc/4Qr6Ooel8sz0H3WRUZ7Mc7AXwaatXxyTlS0Dgi95kV
	Wx+xTtbM7GOUw+ninzg/O4RDhsC39HntQxSg86C2KqSB+YmjzzCkJlNTrwHvovhRt1ajY
X-Gm-Gg: ATEYQzznLiDzIMbWJu80TA3i6tVrDH9eVuBmZ+RzWNrFGPMYGfeTzxwL5E25ny8Xb9k
	ulGt+OhFZ3Szb1yHHeFEN0X9YcZNU4wUuuTGrXy6bekxf3jXHn1sYDSZgMEjPupf215hjtdpeUK
	ZQEUDSDh5gFSs1gdRjog6ZE/k7lzmJjCpiEGwV4GWWiXohwZ4QRdPHz4MtirqwUfdm0HtEHFHyj
	9srCBX7oShwUp8bZk2In7NWa2Bjlt4z0zgaT7ou7/4sUFtnzAgdVIVukSd1//FiWD06VbjAh7fB
	J1g4gmcSp0Ey31YiG2sbcLxKzatpyb0IpL+kcWhomMBGgu7fH6w+/pxkBaZ3EvDIAkOsheALsHq
	nutCn8vzIHeq8i61yas/CB52ygmupUOswe3iZeE78+oCnAIeC+i48wdUEGMjBi5zf+IgtvSKzjP
	z26ZDuP5nPnXPIO8BYM2Y8Ej9Dnk1ermcn91g=
X-Received: by 2002:a05:622a:cc:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50b4ad3d375mr12596681cf.61.1774076552718;
        Sat, 21 Mar 2026 00:02:32 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50b4ad3d375mr12596451cf.61.1774076552334;
        Sat, 21 Mar 2026 00:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm9003671fa.6.2026.03.21.00.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:02:31 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:02:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org,
        Petr Hodina <phodina@protonmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
Message-ID: <iallp4dnslfc6udkgqdgnvv635aa3eeq4hexyftljienfxssjh@mjfnc7dhtrti>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NSBTYWx0ZWRfX30k/GFBXQp5/
 GV9Uvf2H4IRmR2sVE4KPfyDevjaWqbE2f7gBMGpfD5PXWmAZTt7wr7CFKECmTycdcTEwi7fxUuj
 c9RUa0CHUbpfRGgILKE77sajt2tjOU8fg6NZEs63FRVuH2BHYNYX7mE7CZyzu/aEDQaF6C8vpvt
 aQjTS74U82d6eR5NN/QueW3DsEY4tq7vpnSba1qGi9BPunUY4CTTxyYqkUPH4wuSs/uVOGjcgrP
 m5hsMjJKZgmj6CTjlmmyJNyIppYixTFkWsS3NXtzbMXHsy5AFeMiDQOjqjsKZPjqfpmNZ1RGEdk
 m5vnDHhzp5sLxqZRKJ4asfxVOQP0/N00evRjrIvqmTNrgJfeE2nU3BVgB5mVb2A3uMGuc6gKZ0/
 c4SJomnSAnVd0+eKzJjFI6QhWkv/fHtfBHyXK5bjQ+Kd3CZtiVCu/HMGFuau6o1soM8deZE82Or
 ChYLfiGIBwn3OnkDGEg==
X-Proofpoint-ORIG-GUID: ietwGEmoy3aEjxno0vBDHOZBXZAzwfkN
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69be4289 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=7Ovdx5uLAAAA:8
 a=EUspDBNiAAAA:8 a=Fl_3bDCzLZ1VHmBS2HcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-GUID: ietwGEmoy3aEjxno0vBDHOZBXZAzwfkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210055
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98990-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,dylanvanassche.be,vger.kernel.org,protonmail.com,shiftphones.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,ixit.cz:email,shiftphones.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 046252E3E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 05:29:07PM +0100, David Heidelberg via B4 Relay wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Audio amplifier TFA9890 is present on the board.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

