Return-Path: <linux-arm-msm+bounces-107160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OE7Olx3A2pY6AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F05283B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF32C3030E39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1222356759;
	Tue, 12 May 2026 18:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WB+ckbmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzqqfaO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844625B08A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612047; cv=none; b=NM2Ax3w34k9U5hA7Z29RUb79Aa1AfYvr1s51b/QUAJfwxpNzqPR1Fc/nLj4syem32A4K1WJZOBbs6p8KErFlOBoZcnAEt0Xljp0Rc3LgnQeiXNlaSM0D1E9+cYHRnWC9nzVXIMm1maQWql5G0/z3V42ZrjoQQ06q2JOiYLrL88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612047; c=relaxed/simple;
	bh=tKyrrqOfAoVx0tAbfJFrj3PvYSlb8iMK9gZ64+0KzMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJZV60oyUhuYq3HZV9m7+sJ8yugYtuCZoUhiVGG5sJQPo5pNy4x6W/WzFPSrAD1sNazEyY0opHYYZl9lSUVC/lHhjXiKWzj53saHOsTYMQ42+3ZWzZO46PDtH/uklLIesW60wBj3yTUlrRFOxc3MEnnL0GnlWp40NhlxoI02Z3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WB+ckbmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzqqfaO0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLHJ43421808
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Hs+/WgVqjszPCwR/UM5TMDO
	2DCmTwzkLyLf8OQpdBU=; b=WB+ckbmBDFy6xh9bMQWS6dgp9RUXz/Tz5PiWMnCz
	AedJeCNeYoyzT64FadeyJgZqrrjbDpxeqVx7QwAnIAd1RF1Ov+/yOcFWnM1hEpuX
	+cRZ2cmlblor3EV6XYDZrKrzErEB0adQ0MddN7T2mvZSU777LpAQiRHuRqxdNICc
	3VZNml+Zc2XrmAD3VQSJb9/Hr+uuUzzmKGiKbm8aajTvYyH5F1KOvIhQYmRoKMjl
	iXrKulyGlyYV99x698s6kIvA1H8wqipu7kT6wxcNfonlWtP8I5bT1tnicyeN9qXV
	Gk77cY5Zjho69wej+Q2WmO3rwkWB+7gBMHEscq+kqM0nig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9rvce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:54:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb6d713ddso21121091cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778612045; x=1779216845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs+/WgVqjszPCwR/UM5TMDO2DCmTwzkLyLf8OQpdBU=;
        b=NzqqfaO05e2jNteDTY6Dd6P4VefhrVl2SUvrWlp3krS6eYehgFSoFu5baohqBmVFo7
         Z1oIChel/oOjv7P69pL4dPv8xgN/DeJIgDREalDu4Xcu6kcT3iwDvExvPtOzigi2bRJG
         33JXUeP0LGKFm+zniYPUEIm/mMkzCmOEHwbmZUiY+0gC9KEpmY7PchBjAF9OGop2xZ70
         xqzCPBpKoxiWneWag3j0GZhkk8cwiMUvwKw9EWCcDM/DoN3vzQMbbeSSmVeItWgoHHtt
         pCU/PLmVITdemFpJCKB7PRbIblH7zG58jEQw9SfDlDUPa9UVpBoC06qciGfYa/ZeBT7O
         k0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612045; x=1779216845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hs+/WgVqjszPCwR/UM5TMDO2DCmTwzkLyLf8OQpdBU=;
        b=LaHLEaile8V/GAYeTsozks3tT5SvZs9ybnBjIfaX62b81qSPsxUUrj+O9so/7isX9Q
         At7YADY1e/MJefNCFAF1OTDZDPixT88Ckyw5pXwx+MVKO9Y8wxmP8RGwhd+fbqFsZzfF
         jFtFJM9c2nJrikEDWcPMkF9N+9liQEGGAr08Oqfk9qBits5c8XoUxQWqZzWfpznblix5
         XiOWbae0ZkIyP7ahM3OZyHAh52d38SWAIvEcnt8lDVrPTlL+QkDzgPAteV7pEOA5ZeZH
         7F/wONbWvzl33Afi+iLMbYBqMNhxskeCZGvl21vuINoTLb8GKIj0fq4vO2wzcLlzl2+p
         GPgA==
X-Forwarded-Encrypted: i=1; AFNElJ/IS6ElS+GOLPIAbcdmf7oZM/LtdCOwIh77hQSN0IQl8tGufyYrYlHLg7ncVtZPSD1bMuLqX3f3IE1NzmYC@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfkssD0Kaag0DVUU0y0Ig7J6/lDBM7pPiJ3Je/83KT8+XLWQk
	JgPgKMPOvdo+T6N8k+nxzS98zxZgxmJJcpXw8TUmSXDI5zWotm7kr8k6H808QJCK6ePUFvUbCJJ
	bh1P/TzkcST1byGv6a6bedvaYQeuv0yHkCV1cbWJ6Oe42OdijThc6sNasHRbs3ZZpDmv4
X-Gm-Gg: Acq92OGyBynB3Tj3Pyw7ttUCXHgkgpoFaEbdDexhoXNYbvsEoA2ly13AkcVT4hMTaRe
	Y/uN0HAUrs80VsOAkqqCix5PczX0wmer/bT3pR16SHk77pN/7+kgdPfiAERqO04iV5DWlCRfRh4
	y7KhUoucW0FbzZ4eUIQqc1uC4alfDZAn7UAhOUCWgqxklW8SOU1WPkatTLRTtkwT962kG/Gm+W4
	5XdLzoEk9ADacRi2d/cI7eIgOWv7XPk/RmHgr0kTrsFO0I6lEN5U1ZIrUXL1w+r6qoZTP/QqZMV
	qHVfeL7l/c52rUH2Q6yIvxG9kwlasjwzJGAvs/fQPxXVlyukC2+c4d31Czm3SwOryeTCja97H+B
	A3FkARt+n0netk/3Rw2n+rT9JOljM4/KSwRbBTSpoBV7kQnWui7ZQpLwSoKaDWKwPZPFDVSmm7R
	9DC17TXjAuoUksIdH7tz3Ie30cJQXGVhJNWl0=
X-Received: by 2002:a05:622a:92:b0:50d:770f:ad23 with SMTP id d75a77b69052e-514d1c943c9mr57408411cf.26.1778612044358;
        Tue, 12 May 2026 11:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:92:b0:50d:770f:ad23 with SMTP id d75a77b69052e-514d1c943c9mr57407711cf.26.1778612043598;
        Tue, 12 May 2026 11:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3ae30sm35328071fa.14.2026.05.12.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:54:02 -0700 (PDT)
Date: Tue, 12 May 2026 21:54:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Message-ID: <lr2i5wufo5obwtlmbh5rittebohbpazfpgnlcrlia4usnyacvr@z5r4mrmewymp>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NSBTYWx0ZWRfX2q8ZaL2f0hjS
 aLorLRyI77tyKKt/aO2bGPKWWW9AIUZD27Bgq7BYc96K7N2Xgpy0FJ27ki+u+3uZz0dlkoI4loP
 wsq3g0HNVwLVhSy+xRfoD7lXJBEQ2ZEVdK7ImfiUvazWZakuM2TSy+qcPb2LC4+MzkyTAH/29J3
 MTZLMcS+3IBQ7H3YQHzKl3pFOIQ/rj+OQWbQ+Qeoddyl0bF0hk9SMv3RcgddupdKZf/5BWo750E
 ZQkJvQAZE6A1rEua1MvjG6SqWj0fDYr9J/9InoKQ/Ipj4X93yP5WExnwyT+KV4JQlrPpEgGzPVM
 mDfsIjsmJMKaQ1MSmcVPK9JsDqgWpy9WqZiBF4HktOtKU2yb2F4fykMISWx3WI2Sz4rvadbovxZ
 W9VaQ9NIxSnWrDr7304y3K0pmG+PgdPERMkzdd24s9d2N6kDwBZwWfqG+snC08kgl+C4XQDJu89
 z2iit8mMxvX6BtUgA0g==
X-Proofpoint-GUID: ToCdYat-xVHhjpm60OFlSC58c8j115cn
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a03774d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vUDcbcqZwFPzQ2NBqxgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ToCdYat-xVHhjpm60OFlSC58c8j115cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120195
X-Rspamd-Queue-Id: 8E4F05283B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107160-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:26:48PM +0300, Abel Vesa wrote:
> On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> explicit selection of the master for each PMIC.
> 
> The existing PM7750BA dtsi does not provide a way to describe this,
> so introduce an Eliza-specific variant with the appropriate bus
> configuration.
> 
> This duplication is required due to hardware differences in how the
> SPMI bus is exposed on this platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> +
> +		pm7550ba_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";

Nit, if this gets resent, please put one entry per line.

Nevertheless,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +};
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

