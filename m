Return-Path: <linux-arm-msm+bounces-103561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMewKKl44mnh6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:15:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936E41DE39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 637093029E67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29C63C870E;
	Fri, 17 Apr 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL5U/iE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Skim6amV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323BD3603E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449590; cv=none; b=tk2ub9/w9kbcDJmtY3mSZ/6TnqvxPHEE/bnqF7zLDLivYHnSsrLEwl4Ogypn3arGqcA7nqCadPwGznaM0xCWYIq3GhJAUgstMvU7I9SIqkPWthgVxcpYJ+CeSjukS8n+SFRHINrMlSDM2egk9TgAw2EONrkFiU81pkOb2brpAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449590; c=relaxed/simple;
	bh=5LrPG2h15eGXxjkOxde4AqxHBBlTskH/i7tWWkEAgxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HphCWy9lJOAU7XEhPnzh48+XFOkUC4hoGxtbCJ7pFu3jWsUFDS93entW7pY59Yv6oEH6V/31nvhjVigqtnLNYPwe6Kmb6Cs0/4mQrpyI8bBtMnpE05d0J/geMtFj2gM7G/i0/sdGmyQcVkzePfw8yQDTVpx5E5qP5eSdJpI+B5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL5U/iE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Skim6amV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4SBj2945226
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3YW+27284v+29VnXaboK489
	5T39NFY/w+2gzkPSCeY=; b=XL5U/iE9rvs2MCQi7/WE5s3SAt/27IFDADSJ2W6d
	c7vFInXtGB8bac8jQFDy60XtvtSpsPSsFINeSBQYBivWGLuvztGir1wzzvakT0nZ
	dPLShhztnOUhXOs55FUS9w3zwVH8egpYtzYaflvf0AT9hPPPn+/VlLS12q+OAUbg
	vSK4mD9CyCorj6qTLfzEn4mYsrz/z5vybA+TCWhGoOEcdmOS10qsyhBWuKT1vlr7
	Z4BrCQ1FwJLDwsIF5KMdKFoxXynEF9uVQvPo35cYdZdyyK5MOlg+pyn14ZD34MiS
	qfsLPclcyaLh7Psea6Jb2wao+iTERnW/+3ETNC0bWO5Fcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy2uya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:12:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8dac6233so17232201cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449573; x=1777054373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3YW+27284v+29VnXaboK4895T39NFY/w+2gzkPSCeY=;
        b=Skim6amVI9ADeZuOmr/vEPONkERuZnvCYGuSZ+fsmkS5yBdNiGd3d65SIbpq4NGwbg
         IgTIESQJ63133K1Lth9Ak4gyKjLwVI4L9EjxomOdrS8W3pBiwEljHR4lnNDXklumLwtI
         /Rp0h+g7sVk5Jn2eqZXjirpPR+I/TGw+0hAkxduOHVokUjuFB9548SOWSh2Ys59i/5Ig
         2Eyb/sx8cjHINfmv2phKQyBpOU86+4ZjshYuh01MY50pdxqOf6oIbjBTFlgPSYMmD5x9
         RgH8F3NkyGWEhNFaoDsR/MePCdkSfIlDs8MeRs+R3V5VAUQubBH9XqtvgTfKidlxMPBL
         rXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449573; x=1777054373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3YW+27284v+29VnXaboK4895T39NFY/w+2gzkPSCeY=;
        b=ADOlXkGaCeE9RUB+cMlEAjhrXt6kJ6tJL6ObCkgYUomaNcNgTK3lSF8nK+0ogNnMlL
         rOqIsZWizDi+4MoU84gL17eDkC5upTP7Z4NOYWEDI/x0xI7ZLqEIYTGpN731OopO0kpW
         TWPAuZaXLSoYIsu81N4uvsyeikNAmC6RIOjgXxFtEHKxKDd2nUOQ2Xb+DI/UiQx55sQU
         EscC5l70wOKx3oOzc5yLNfqJZSpZtli64nD6fXK9/e2/hkSiNfOuaBBTQxmXTmwOsbC6
         t4GhbmynX60UWJhny6ydCLc4a+lSakhT1+CwYdZXpvJBDafBY4FUTOhA0jpTk91OgdeV
         I1Sg==
X-Forwarded-Encrypted: i=1; AFNElJ+kc64IoJN32dL4y0JNkpwLDbjXQn9pkHuawEGDk+cJpVKyTGcsTvOXPVjML3ZmTT9pOOKjS/PqZq2G5oaL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GvQvpYeMpFeGTLkeZlRA12XXAmMEp1sS7Y7aZ1lbftvSMFYe
	FPxMIROnzBk4aFGud9dJZ2xXQ8c3dAIvZjWtdl83dVSH8e9JX+rE7ycTZhXOQdLaAPCRq3Kyn1g
	y3BtYLeelbVMNEI4RMDeRi8UQhs/CqLJbjJEz+CG2LxjcYp/T8WXaiV1KdZnUzUOfo2hR
X-Gm-Gg: AeBDiesZkncayUX7tRe5qT1MTfUl1uzxynJS1Bm2rp1RSeZATmCKpYbjurj3tdc0eNr
	cGryJO+P/E/0gNUl1HDJx+d0ZpecP96ebGX/6EEMOUKRUtq7VOF5QjZY6HGSMQgTsCGTRjqnzOK
	mdo1+z6xzbLiCqGngZO0QTSS+QtsxcLYQZ/h/FFCREBdoWjReibPpfeFWoZbZwKPEUznJe7pFuW
	hM2jPbJZ74bWguld+dg9O6TVAQqh0keEGWT26tLjB4ErekL907lZnLdV6ya/qjEKuyr+CSssnn+
	kI3P1u5aGwmBrx8MFTfuGkH2FyGsXP0zlZn+8M6sxtIULTkWhP9r6/L9S4T9AhT29QKWxRir8GA
	Mc03dYkHtwWfW/mOcZ/K/gkgT8frSThjW84MaTyBgrfAgjzHhbN+qaZQ+SYpWF5JzAN11IwwbtL
	YbzKJEyltXomFkO4QzPm/vRj4HaPd7rfy0bep1Qvu6+IJYbA==
X-Received: by 2002:a05:622a:245:b0:50b:445a:4139 with SMTP id d75a77b69052e-50e36ebf0f5mr55681191cf.54.1776449572889;
        Fri, 17 Apr 2026 11:12:52 -0700 (PDT)
X-Received: by 2002:a05:622a:245:b0:50b:445a:4139 with SMTP id d75a77b69052e-50e36ebf0f5mr55680511cf.54.1776449572378;
        Fri, 17 Apr 2026 11:12:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm595987e87.82.2026.04.17.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:12:51 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:12:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Message-ID: <hsvyzibkggicvmxucwxjnss6moloujk4qk5h4ivxrzcv6ziejk@nnzx6lon3jca>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
X-Proofpoint-ORIG-GUID: detuTdDeYw5dD5lxCuYcruTYiI7QKKFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MyBTYWx0ZWRfX/1PJ7YUihMPs
 UhPCizqx8bvA/LKdccP9Jnoxa5W8Z/kb7UTYheXKgL8YDtXwdMoMyOYCzCC45BbfQqjHzowJU/F
 SFkEgD53IyWcZ9icMIT6t/WwXsLw+wbygBRNxDIaf07ih4c9hZhmHTxPu6akoi9xVkgm1tMF+QN
 jLpgCLyMclGabGwagz3EXMBG8FZjsVf3djS2cEBBKnxSNFA4MoZccmVyruvMBhIToutq+wPdR23
 JijSV1ZE2eV460lxZNKWrr6Ckf/glgTZ1vYC2Lsw8v3EroFVEWuZqM6le7ql9FID0x1gtQ2esyx
 fVAV79Xg9IZsiVXx1oh2KkB6ZH3qyhhWZDFOZqegm6xqxN3zP1EX8lzk0FgI1PCl5TVRTVE/NSz
 itckV/D/tls3LWf/XdKhMJptd79EFurCAaUDdAv7I5HrQm0c0hz5xgQeD8SwC5IWpM+Mb2NPood
 VR1tMWV8E7Si1MEUnMg==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e27825 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Gv3PURsRAAAA:20
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OSycEtKwGKZD5W1oKNQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: detuTdDeYw5dD5lxCuYcruTYiI7QKKFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170183
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
	TAGGED_FROM(0.00)[bounces-103561-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3936E41DE39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 12:40:26PM +0300, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

