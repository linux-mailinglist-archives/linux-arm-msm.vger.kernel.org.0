Return-Path: <linux-arm-msm+bounces-99747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEH0Hn0Gw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:47:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF031D006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 525E33000BA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AEF2494F0;
	Tue, 24 Mar 2026 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpJv/ino";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQxE6zbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092333B6FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388836; cv=none; b=tI7iq+P4qT60q+vAjqM7fXDC1g8V1MahOFyaavH+AUKmwGNXoWR7YFQv5HIwXt9Ev/yvObYxGmswFxHcp6sR2gRO/yWSyPJSKHLtb2Na95MuMHwTgG+o+cYZm3ouFrvr9CVWLPSkujzyLufMUPbGs6BtGpKrCQqdTsaTTw82dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388836; c=relaxed/simple;
	bh=kzLceOkm0rv9OnjBTMqJWqtyILDlAZolgl77U5QQfLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5dm3dN9rve/wuUAfGbE/EZPR2miP487rBQW1rQfMhgpxq9S3iePyHgMxzl5KqrIV3qOTkSDTaT7fS9hN8Xq7kwiG1sQMgng58abQlw0UbKnKvjsT4b9xNd5p16ZJDGEU11HSU55fslR3dRFctpCowjqy5NXarUNQPbrA4XE4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpJv/ino; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQxE6zbN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCt7Q2808002
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fir721gWpT0ERjQgX4eC9WNS
	a1pM/w+kuBOKg0oOOcI=; b=QpJv/inoiW9ITgDTrAjvcr/PYJIKI35b0h1yprg4
	VCU9GyHQy7E0DeFOxI3j6sRue/a6TwqrpOtEfJSZwk0TZfk/mrRCnPH4cGtnT7Tp
	YkNC+nPiTre/9Xs31nC1ZMblKHqu2+aTgb+AAUIKDZcs6q1bUW3MzIezobLK2RkX
	Vu8HDUxB4RFDAR/jypznGlY5ugo4iMVRU56DbSKS5pF79DlwwpHgXZElOJ/96Vqa
	RSTIAhBSYAGGQzSwjuFhWoTkxh/pwGlrb4AePKVwt+pGRPxHT7NpDHFz5et5SIt3
	oOrt5dy60MYhlA98ZDq6oi1gHbivGofwu2+CEw5bKcULJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ej73a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:47:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so112225271cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774388834; x=1774993634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fir721gWpT0ERjQgX4eC9WNSa1pM/w+kuBOKg0oOOcI=;
        b=MQxE6zbNaMjhkMKDWvaJzdazL4+Ll23ENzB8u+WWr5PYGEtIjNgWTh3MbS26n5kr5w
         LxY+M84zdDnlioMGS1NwfsTWq9oRzwx1RKhqq+6xglbWIdQ+2nbC5fPYqKg6yiNt0gQR
         AH20KFrSMIhkweNnQhbOPwOAKxzzIWDwRHjGOprWRj8jj5STbW9p6F8np8o6MPWxAlwZ
         XbnmXE96ySHop5KWe3/NyUW+Rmbjz3w5KVbf0DwXy/xwbnyPLiF2ALLPWlzB9oZ48OWD
         k8mSLNbhGTRAYFqzavPJUOWW2nvdl2a0kNMyEA50+ZfGCCuJVKYdWAMNcuuqa3Vcfxw7
         Qe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388834; x=1774993634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fir721gWpT0ERjQgX4eC9WNSa1pM/w+kuBOKg0oOOcI=;
        b=TimxWLkRyrG6+gmzqYq5Me3Q9tnnjn2i3ofZUZxEXd0PDWLZ1GBd2aC/B5x0wAgvOZ
         Wp98jCR5hqc93Yikv4tDpzyaueW4TidMDysbdds3z6+ErlJbLJbn4T0hWc9px/9v5Sob
         iyj8FjUYq1tL6DAYpqMM75BI54Gq91V5qKTP91bxa6aTXmvY6gy8YU5ID17H5U3NYjct
         a9ndtVeoV1Vip3c2tJzUhGanNpsmfD4lGhMOy6VdwgI5hjpWh/0K0Okfx3esLxv1EB9W
         mklRXdwnt2BWRdrBbnAstb0aMRFxEHhxUyDsqcFY+hbjiTRd46hl8oJWCDLhcRuRUR99
         8ANw==
X-Forwarded-Encrypted: i=1; AJvYcCXMXJO37BtFDJuL8hszc23qgmWYh5plE1d4dCgNzFdky1OoCdvXNfxuz+EqKwfESHe80m1jGlIYejFz9c9v@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4WCgo6oYxfsYA2rQPHuCyTeBCVf1mAGcPLUwaNhfd6yIk+zyX
	B9c1M/9kHsxxd/8MHQrgklF8HAM5kh1IL8D6Q6TCsHBKKDd8JQ7+7CbNC6wnaXMJdLS/Dny1Zrb
	APNep4n3at6ixIf99KuIkcVxY2LO5aJcBuqdsFOs77AhxETWk5BRhNoVkZf2hP6mKqmlu
X-Gm-Gg: ATEYQzwy2pm2Bqc1C0bEvmRBCtz3EKrAnVq6EtwUQQWcttGjglZZxCak9usVYPuo/+w
	9qSRDTYzYIskgWYzLMFan8q+C//QUQpww83haZOdygyKSR6YMYwpRfK9q4vhHEKN2KqQ9fHBE4E
	cJG+oFvG7bzVrIhS25xVdPxb9Cb6vy1K4Zz6h6t9FjvDodhv+8Fhn2WO3zSkqd9yMsd95tEZ1JM
	m5cU4cNbjzRwOpp+SJMJgge86Jr+r4KBDYY6p7MyQUZPY37iLrvGWtCUCHZhigPoD0FqNfUV+rV
	yWS2kRdejXT6+F3iuOrfFUlV7yNCbFq9RIkMzhz0YTKvh/bYiVKnE6ejapYyl3t9W7KpfU5BQBY
	9f0Mmfb8sLzE/vS/9IO0W/w2SafdltOs4EpVhiVUQhIY6wR6Cr2w8SbJbd4dh0vcAUrJbp3awFo
	NHqgLjCz/9vFlE/xLYOzeyZTEBpy+0kzzcDRQ=
X-Received: by 2002:ac8:5913:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50b80e82708mr18636081cf.50.1774388833607;
        Tue, 24 Mar 2026 14:47:13 -0700 (PDT)
X-Received: by 2002:ac8:5913:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50b80e82708mr18635791cf.50.1774388833161;
        Tue, 24 Mar 2026 14:47:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a08dbsm3380571e87.24.2026.03.24.14.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:47:12 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for Glymur and Mahua
Message-ID: <77caclherfa5hqq3ovcka4lgjd3ehjprvjosllle4jae2rgekd@e22j7adgach4>
References: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: g2PmEVz8ks5ra-eiwoOc15gIH7tlwR4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2OCBTYWx0ZWRfX1+ARwdhd8/ts
 fO21q9ua8EreBvCqHs6ndRBg7PaWSYDGdO2tERGvjHq96cnZ+xeWglWfrDqFccLI7I+f9elmq7N
 /ghLbgYOOOHbxtfyRtW6wH273KgFAES37dD2/YBUF1NPLn7it5sO6UDhBEQSftSuO9r3GkEPvLi
 KiaSoInCHpDJwu3x0Y/lFX8iNgItt4WN31q+JuPmf0JEkuNFpN1/DqhI26D5/G18HvslLnRBGpU
 JhzFj5iKFAMvoFJfGHp9VDzm7PMLYxuIDnVnIGAeD0P1xzGdvOVRxIPYi5aIAXojNR86eoRFWdv
 mr+htx+l1Si87d7KOE8dnT04QUd5GTR3636Af1qId1+P3OirD+uc+PyiTezMYJfSEDC4eEECnx1
 uXF3CcQ7lGU2W/UnN9tfKsyLVFagkyEG2xHCK2//LUiS4QWjQxXv0R7HWWG2JpGJ/UmM/mEX0NI
 zH9WBbIxxX3q/YrstCw==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c30662 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jQUTPkoqiVZLWjHoC28A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g2PmEVz8ks5ra-eiwoOc15gIH7tlwR4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240168
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99747-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2AF031D006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:53:49PM +0000, Srinivas Kandagatla wrote:
> Add Protection Domains for Qualcomm Glymur and Mahua SoC which have
> both ADSP and CDSP.
> 
> Adding this entry to the kernel will avoid the need for userspace to provide
> this service.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> Changes since v1:
> 	- added Mahua as its identical to Glymur
> 
>  drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

