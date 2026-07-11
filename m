Return-Path: <linux-arm-msm+bounces-118488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nDrGBM+CUmoTQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:52:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B04C74269E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:52:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mjL3IZxV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=egS1gVAL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118488-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118488-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D215301A383
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B922F25E4;
	Sat, 11 Jul 2026 17:51:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82841233932
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:51:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792310; cv=none; b=QX41Xvg4sUssia1+sf7Y95TPwfR46WdqGopS3uvPawAL6xuXe6oZn2CvS2vYT08DLr1iMU9Pmr4GvuO5mb3Upy4fKU0LCm2qhNj7v6i6zp1Wu+IYUux67fZz83HUw7jZWakppNycSCDQWPiriBJjPxZ5sRbqxD7zv4vv/4dV1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792310; c=relaxed/simple;
	bh=5CN0Zj625ZIH3LeM3lHnSoz5+f1rVL6W6reb9JHdtYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsBCt5AJ5hXrbtV3KIwuNkEFpdZwKfplpudkgCAnqeSWThr/IvmOKFGF9b3PmLluMry4c1rDpGjK5IoGv1/b4lTetakylGyPJyxaIgIAEtx1Dnn8pl7wmZOa25/Qi6hqC6mRIKWoJakVLEpLxcAphb5BuXGuiI5ucOEXlayASCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjL3IZxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egS1gVAL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHnHCW207072
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O92GE7cXDqJy6Gvk0FuHsmfU
	ufq3xepTjiD2tsLB/7o=; b=mjL3IZxVOwZ3DAPb3n0hmtb8FNIVgZhKJbDxT3+Y
	It1SREmU63RCsbfsBXOTD92vt6Z2EnaetW1NqvkuZVYkSSf+XU1XmH/l6TN6tme/
	V0qQUp835YEDe94+z3Y/bxgwc3l2Ey5aV6fMoIGGA4GPxZz+lyQiop7vGCC2A/Cu
	bcB2hxBld9oOaZr5fnrlSTKLiP0vpepVvv6jNRenBesm3wvb2wOjBayPlIzq9nrv
	nWdx8fAzYCw9kOjsxDZO10pyfV5m1LgIMO7Q8k05QP58xE4APRnGKPtTLlSgn+Q2
	tBzyFOMqu6RHPERBLoFuWNoLYHWlunDBhcYTRYvPba3I8Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekch9yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:51:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-736e9030d93so1850937137.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783792308; x=1784397108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O92GE7cXDqJy6Gvk0FuHsmfUufq3xepTjiD2tsLB/7o=;
        b=egS1gVALEPEeZiCPhr3C2vUo2qpNq5Qb+b2AFIxNIP5v9URun31sFk3Sdg0JIP5+Hp
         DP89x6V2m1TrVwBbIcy1EN35sswc/mOeJtw/lfzPsKCYCdjoSG/cv4zxOFM9Z699ySon
         +GPfm6qcLgffMPSyVqc4qQo6TVfz2vtsHoH9QjzMZfbN8JwgwwaMcIsI8QPu24JG0zW2
         z7VlmsOAIULlGEt9HIe4jVsfyodl3p3yUwDd7V1TPSj1fTCN7LKJcYEHoKEYRJvLXr+/
         7MSseOoXsS7aE9p7boTepdD3AMscgMVNKzdImhYjuMi8PK+mlvImrKBE8kcD9ABjjmpq
         oQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783792308; x=1784397108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O92GE7cXDqJy6Gvk0FuHsmfUufq3xepTjiD2tsLB/7o=;
        b=UNcL63/c4KZbzfwtLIo3WsZPI/gCzdMUemxDIiQVuCmGziOSuTkaKkjzjmhFRYgxVy
         FaStq/5htfZBvQrNn6M5KMWtws2arS3KIpmn6d71TRwoUa4LOUZU/eTCrdyp01iiqrVo
         XPfnwz3ntplIXOAF6FoCYZo+1WttOMstCP+bSXjIryhOe/n6cZxXP0V7ykf51F5ZLpYQ
         rRBTrcRRSJR/HOsuLLa2mHsZZbYfu6BIwGmSZsRzm1khZBgG8gjGRKGJuSb04Wd7N/c7
         HitvWSEHCet2bGcpNUb2yNx5foctCZj24NEcef53aFFr09H8djCnxtZ0z5ySkNUOxvR+
         9ROA==
X-Forwarded-Encrypted: i=1; AHgh+RrDISdSEX3E2WUMd47BzflzlF3Zv+hWDq1bZ5KGBK8/402he2aLnOcajDzlMVrbVqgxVL6gGtqddanWDw9y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3M3PXdavuyaNEe5Itydpf0KP/Jq9cZwXooe3tWs5Nssyg5rv6
	CNXmhGJ6Y9sxM5kpHFpE9UkpWjclMuaB/0wb6QAZzFd/5CMLVDz6GBGPHuqIDGAYC4Ux5Odf+8r
	0siYEkVwdDA5eYzeYgBY0bSQJTtmPrtGDaiNh77w862lEUSnMyTfsEByqPXxN++YHbmXD
X-Gm-Gg: AfdE7cmgemhatN+KQvjvsOARn2LoNkUnK5TWW+bCZc7C60dHuDS+0woco0Nah4WRecg
	hNSfG4ar6ChyRXZIMT3Q0iECJ4hSxF3IIiPBqBEJ5m6yPPHjV1Qe78YXU55CIXGOUSGRSVBrfGe
	E0tE1ROkQw+qgXmgrOWORrMOM6Z72NFN1FZMvj5hSmQ7J1I5DZ4z9CgCCfEYWTZ0olrT6C5AVvN
	DqMdui6kYFi1nqYfGVIM6t18gx3piWZlMSV4T5aa9fR7gkFRH4MtE0oBzB/EMymvIbpiZyZ8B9c
	L1whYtvuqeDzkoYs2nPB+ox5RhK1UKG5AwLUTz7+mEcHBp3/TMwFFgtgTusV4TraR4I2E3/21Gi
	Q2rC/Uul0Ynsp/aImx479BAKEDNaTumJ9iyD0XtV0Hal53OGWXJ+VCvnLh+wtG0Rn8iLkSorneL
	QABg0u7Rrepx3XTsdLiwQpXxj9
X-Received: by 2002:a05:6102:508a:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-74533b8430bmr2476148137.1.1783792307772;
        Sat, 11 Jul 2026 10:51:47 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-74533b8430bmr2476126137.1.1783792307346;
        Sat, 11 Jul 2026 10:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13542sm15908361fa.11.2026.07.11.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:51:44 -0700 (PDT)
Date: Sat, 11 Jul 2026 20:51:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] phy: qcom-qusb2: Add support for Shikra
Message-ID: <3xakwbmomubsf4ofztpzc5ckf6ftj6f7rssq6k4cywzldith6q@xhhj2rla4jg2>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
 <20260711-shikra-usbphy-v5-v5-3-229ba3602737@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-shikra-usbphy-v5-v5-3-229ba3602737@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MCBTYWx0ZWRfX5chr/eGuOxl6
 lkqd2DiVFcfjNdVazPpCsTtsCHmdz58V/7Ze91tfC0jq7Jh72BhsQM8kVB4WN2E9S5PrSCljXJ2
 Om+jlxqfdjg2unw1dhUnQY1cHMV1JiiWRVaxpT3JIq3lXHdkXhC6uwsTX0Z8is48igQQ5yM/Jj5
 7hloiICwgmIhOx0MacCTgmGeT+Ez+bfmus/udntQOm13vLO6c9L6z58XERTP2o7IYUqkL7/X7Bd
 al7bY5cbOITtgp7/Ww0K/GD4xjdFeebTC28CtNH9jg5kP0qMLuQujICgWQCA3pNxiY/b/xWrKFb
 xw3UqMxgX5ly9g5ULKCL3FYnsmCPpeLD8vezgtH31B+XsEj5TrlFiqyBLk0+mhWOH8TMkpsp4ne
 Qonl2bCq6JUQJZyMmPM+47rnjBjdmyAWiy0pI54XX+piLW0/4/ZkxtAjH9caGQPzCCWUSOPPIyz
 a3p5yR/nT0E2jKBggng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MCBTYWx0ZWRfX4ttSxLlQr89p
 Dovk0lv711pykDekmc+ViW95TW2eeufS9+lqDuXbtsJFAa6i6NSRqaegyFOL8RGj2m89XDWuuRk
 yxQej54cS7NXuXdl7UgepdTGLUzwndo=
X-Proofpoint-GUID: JfF1ZHTaWPfOkBVBWG2CxRg9Iu84CSLn
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a5282b4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=F9wK58hNblNa3jbkQ1AA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: JfF1ZHTaWPfOkBVBWG2CxRg9Iu84CSLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118488-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B04C74269E

On Sat, Jul 11, 2026 at 10:39:52PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for Shikra. Since the init
> sequence is same as that of QCS615, reuse the existing init table in
> Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

