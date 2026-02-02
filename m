Return-Path: <linux-arm-msm+bounces-91561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHJiGD8KgWkCDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:34:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75738D11F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C93DB3007A79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 20:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8BB2C237F;
	Mon,  2 Feb 2026 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMcz/zUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIxhOo4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A512773FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 20:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064442; cv=none; b=aEdbkE9uupHAf1aALD9ifNvK5x1ksSA+M0zm4FQLBMVQ1EIC7E4akcuVCGTYqSmLVEQZD9+OzU9PBjCG93z9zQN2yyfLMnv4JfDjBw+YXRmexhsnZFg3UD0+JHvCpSJLomdFhLIG8CrQh8j9Vm2eE2dfS2/1cyMpGI9GSXpW+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064442; c=relaxed/simple;
	bh=AAGgoRaMg8X6w0FiRgwznJrC4vdntNkIqJEV9/0kQ/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj3Z3vIGL3c1qyOOP0rGcmDdSoUA/LnBbo0VooDT6uiDGWnPM6v6U8rMz7ig4DvnMQnXLYwAjTP04O9nBUe941UWtzN6taToZTdQHlILWpG3ix/qGzO1fWeCvbJwL+MMCQdx0vHXL16VAWHdkAuTV/JjZy42vRsWrgqARYtlr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMcz/zUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIxhOo4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVOR42357068
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 20:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ckMGDlkbd98kpK0JvG0HV1pF
	HxIC7BaO2528jq5jWA4=; b=EMcz/zUWkRPYHmlImw8hbDqaozu/L2J4Wik3iYF4
	mKHLDZqN5bpyfhId9Nt44qswZOU0xUuOkhI6oOCqbOZGgh9iMp+TWvnzqa3qFVhN
	HtnbSbrYMOM1lCWE027scA2SjsAEsv1gaguuZHTCIVV69MPdSoeo+IJbTLiPhOyx
	X45weeigqMF5QB5kZ9ASpYcpcSAhVt6DK+2RGQWu6pTDrJdsPk+hSEzhRMRXh0/9
	1pLZwoyc1sWuEFVSW2ZkaYX8eb5pHOPKfRJsXa0zkXLUFCo6B2PD2qtR179tLu3Y
	XjJ3yTnliq40GS1Uc60YycuyL7POLvCr7ZRfZJKFuZewFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m9g2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:33:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so1554949685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770064439; x=1770669239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckMGDlkbd98kpK0JvG0HV1pFHxIC7BaO2528jq5jWA4=;
        b=WIxhOo4S0w2K7z5+aFxcfoFUmhtRgvxsdYSjdfPXxTNMYX00HAAHgtVhglMcfQdR2S
         3KtcPdhfH5CfuSBAl3hjlBAgzpOdwjHb5aDfIqp4nWRm5Sf/6H8jTCrSmFucLaZFozSm
         esrfoBeQHghgu7aFRCIQjfMjt1V07RbhV2GPh5aG2vC2ZeRNbpOEVCvHMfdZRVPvYJ9+
         VGJ2GRJpf2MuAzKA5NGLJyAcIV9PkCS9ORqCg8/keDMBJlg2bWLkCVCCS9PjRCXodyGg
         9q89Aq78LKpiQSj11nfmAx/90xxOSlRI1OI8MNEaPAwIZ3WCV0pJ9GWC+28ZG/QwxEtl
         mqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064439; x=1770669239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckMGDlkbd98kpK0JvG0HV1pFHxIC7BaO2528jq5jWA4=;
        b=G/PiJYDfmvuJqnVGcZBCDOTMoROuntmKwszC9OMS6jKz4xRdnJxwuuf5O7204lwQM3
         xBM8/0qFCOmKvRWs9YXSwzKU6fuWGwaHImK5kYd01GS/DJfHx+EhAiKRMz/mdqsB2ota
         qHZjVCpRor5EV4bsxsnwE/Sf6DY8+J8HBjU1WPWkE0MOo5OZ6KQd9NqNnL+134Urq/GI
         DSd9s9Hnf9qPrEFd2PBCqaweBVoq9+T/ohrGCKCR/s7RHlva4X97WUJSh9PT/S3Ado5o
         eL2vymtWvVBdWswzCwkAMsLIS0B9kK1xusXmFo9t+rzzbRTCdrl02faFNqnL3wEkaMD9
         uSUA==
X-Forwarded-Encrypted: i=1; AJvYcCXxpx/LY+HhTgl51X1c1ZTdU2P86pwoWWXJ8JLORaytrvATeyTYL19Hg4jguq1KXM6TOrcPC+60Yv1oBzDj@vger.kernel.org
X-Gm-Message-State: AOJu0YwU4viEiK+T2Rv1Mg165JegIeyp1KAbIdnLPEj6F9vo82rNiXz2
	RmXvZ1RWsVPKfp+KFASY3OFYssnCFs8BXmMzkC1sxdOrCDaLdY/HYa638hnmOxTpJw1yhL9wZMZ
	KVs5OvEdDsAKHMCwcyXEp8yLdn/peT8f935M21Nxra3rUlgIxFEnio/VSwDXp6l6QqATO
X-Gm-Gg: AZuq6aJH205+DC3O+QB5zn7rtJ9CsLEVkEjgKj2LHVhY7pxhzFQs7qssl73Is81FwMQ
	vv/CgP1kBOKBdEABAOzAJJoI/56X3sYPHFc2I6mOv8fGeLMUS9Nd/Z3x/CYH7KiCJnORyo8usr+
	iJtYZwmSpSprVp1KkLJYA1ho1ozZ3iwlE0YTlit73Nkta/OM0T7V6vXFRoT5ZBWbmF/onJI6UN/
	8uotuoWFDzNHzpWHwoj3oT/DqGzN6wKFVyYf5OES35JWzd3LY2tP/L2GQa5C2n4g2F7cpj0X7ix
	H/za/OGJazKdj2eWKMP1fKZjVlDlx4YDlSUW+p2mOLxxmAVUpnHQ2GJouV/nkWbTCL1agHYDebi
	WLSSSZhMOTidnbPrxRY7FMRvX/PlWOOaBnidZyZQpg7ZsRkQ1xT1L0Q3btxYdT5iDwsutXaVcxq
	BHEehXNOGZApWdnBs6vAMpvoo=
X-Received: by 2002:a05:620a:294f:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c9eb34facamr1591675685a.74.1770064439027;
        Mon, 02 Feb 2026 12:33:59 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c9eb34facamr1591671085a.74.1770064438493;
        Mon, 02 Feb 2026 12:33:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0a2ddabasm3382564e87.25.2026.02.02.12.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:33:57 -0800 (PST)
Date: Mon, 2 Feb 2026 22:33:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] interconnect: qcom: qcs615: enable QoS configuration
Message-ID: <2tvwvaoyh7abkx547mmuknuzxh2hmxopodbfukmpmkgbvz4ghl@2svwizaxbca3>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-3-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202070534.1281652-3-odelu.kukatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69810a37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Np_ZfMqjrSSXuD8GcM4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _UAxJfqS0YDe8AwPtBUOASXEQtZIyEZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MSBTYWx0ZWRfX3srS8Ka4zE+s
 eOSOFno7POr0vCqR90SWNIevwflJF7emteGn8tDnK9jQXvg2k6Fa8Cn0cb9KXjtkmBbLFnxNKFS
 MikXHSppeaPByRUQ4OXXelU6QMn+CiaYbZiQtCiBwGddqiid8A7AwymDSslDrShOqWXYwF6M3Ze
 xwdsfVDLtHbyHtqP5FwkzejVGkDIK5srdp5b5REV/dnjK6NdSHRGo+ji2oQvCijVCxPLl3gPmqq
 W47uS1Un+EiSl1Wvf3K83+vEDHcSFwHenvNmNIMCCi3W+PpdC489q6+qIfaBsqsi7js7qdCiopK
 0xWvBHKx7Ou5llGW6/my73/04eFJ8QwyGiZsEvkbJXWF96CupyBS+tVVy06V4ApfL+/3rb4cvtm
 yU4l9UAOtEeY9Tyl1DauxoncZMrS5Lo0Oc7k0euOuMtLLsb1ObcbQsey3EBIIcGlDEkmOd/Xcg1
 3NftnlRShqiAW0r2SnA==
X-Proofpoint-ORIG-GUID: _UAxJfqS0YDe8AwPtBUOASXEQtZIyEZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91561-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75738D11F9
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:35:33PM +0530, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs615.c | 247 +++++++++++++++++++++++++++++
>  1 file changed, 247 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

