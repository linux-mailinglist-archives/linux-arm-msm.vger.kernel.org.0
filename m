Return-Path: <linux-arm-msm+bounces-98209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCWjOOJsuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:01:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 346682AC992
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E0B2309A710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4728926F2AD;
	Tue, 17 Mar 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sm279Wj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTpof4j2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D463E3D81
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758879; cv=none; b=BA9Z7ojIKf6Ar1Ixz2zlyOwf52NyBaKDxmM5h3AsEgaSpuMCt5g4dhf9jVVdzDcT1YeBl/RxXvWJfD+nESDUJmBt5/wbOedHF64fDWvt7FXkLmiKE0FCTa3P88lklm4l9NGnWZwgvS/GqIlHVhwszKMi+QfDvJkbdy8e352YZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758879; c=relaxed/simple;
	bh=imEYVKw2ikzk34SNWoDfARLzCwp+j2gM0hRCKgnVAho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQnMQTElH4axvBaM03qkEfqG0KgQLcj0eS4udrSG9glZELWgX3E28U2rav9r+DTRA/Xg8MOG4i9DIhZe3jiRxPtPEm9QxWl6up9aWwPnW+CXjvR5F4TdoDCeIWc7wUJhQoffHWwnPspPdphVIuZhp0/U9YR1x5tDhuXOe6kEd3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sm279Wj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTpof4j2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDxW2e2907348
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l/tQmdeqMmPxPPt8d3p5Iiyl
	S8Qklua8YgPdyWhVMAo=; b=Sm279Wj06VUfSMTtFMn6PjQkVsnNaSOUUBzi/Lwt
	Je6vO8woWqYM0bg0VSpU9vYkOaP/fVQPJQ0i/KdGBYKAnojlrRDMLvFx2PYRiSQT
	YdemnjHsCk31fOqiT6D4p3vtw9+x3kZLVF2arEKqRiT3vgpSvTuSYYINDuXShHco
	CWBLn+C28H3FUD5X8zKmX8VGWlWBjslbUS3O+/K1a70SkCKu74JTwTCyZsKOaenR
	gqACrBOf0Im2+HCqrnCk6ZY5hALhE21lNw4hzmmYoeZ/j8/i4XvfDQyMoRqDbWOl
	issfGIgjKr2TOz/tzkqK8R2y5feVXzSX1PaD2D617zcQlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxhm77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:47:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso86822685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773758876; x=1774363676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/tQmdeqMmPxPPt8d3p5IiylS8Qklua8YgPdyWhVMAo=;
        b=WTpof4j2eIyhDuw5cY+6nRYmQfRHLC1sQiKH4d/C1pIOC3bCHMKx2xK8sjTmDZUH0/
         Abrz6TfzbFfAHWXYoUOFpadcj3G3tY9r/LJd19vkvGOAcx7VqLWRJa/OLR6NcljHQeNw
         CJWExKFlwA82CwCGd16jRSVhxX4BWTDI0NmjiDFF6Dail7euiPZDRSSVEYg6BAckAyBE
         CyXeya4yu8u/EHmoLn4fdGkidlimjW/7Xn/3c+E3XmHxI1Ilo5qVc2rcKTvtmk1Bemi+
         R11TcACAMjQHDG9OIE1HF+UAdpgTT0tWbit8j3ihobHh6Uw9XeC94w8sMe5a3rZqtjD6
         veMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758876; x=1774363676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/tQmdeqMmPxPPt8d3p5IiylS8Qklua8YgPdyWhVMAo=;
        b=AIRjQ4+B4PJ/5S8TpxUaTJJRxrnl87ZwIXcYQZDRbYYL/Hc7VHFYVPS8rdBcyXUiSk
         Qtoj4U0dSS8KZnPn2ddnsRtPUdN9XkX1JxbBZQO8eYA6YpSzqG8H4rfjX/b1OLDp2dw6
         dc+DM8WTaYTpd2sYxzcxT6OskCbFZ4fPjMPaEBfZpYgCm2PawCx2ohdZDV+8kLlYwodI
         KDsZ7uU9TJ+7GnLjdrMex/sTqOtwxye0nGEtyIjkulHJOucg7IEfFcz1y1D0LsxhapOq
         n5A3qvTPWSDtnLifYeuCj2/6yd49BUX4WRbnxwYzYX4Z0Q2YG4XX+bOrLNyIv1BRHk9A
         QL1g==
X-Forwarded-Encrypted: i=1; AJvYcCWCHIFiF51hcpMm5WS5y1zxM6TSyUfBmtckiheaZP81cbXLesNQmkGtOk1zXD0S/Y+vCT9nwdXbZBQf398p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhz5UeBfJPH3kl3k0ab5j96lHiQ5QhbP5Ltj7CjGzQgZX8qMX1
	pXDwxEM6KGDOrjD5CReSzmd5Q5GvsNTBxhRw8/FUpTi+MtIr1PBZw2aiK+MKFlzXKYh2nhHtrdL
	X3Obp5KIpRITQMko+ysmfZyIvvL6g2DUPAWwy0f3NkeCyGz2apN+7jpUaAioQBKkTTalW
X-Gm-Gg: ATEYQzyFm1qmTZgBxYiyzVPN6M0Bl6FJMm619v9YGmE+Q3EBVrpiS65KBWZ5KJzqjrg
	P5brNZblFl/oLYMoS+n+oF0PZrXx7VYdLDdfKHYVQkR9MOx+jgn6bA9FLJfDjUS7r71KJPNjctA
	cybjHscis5nsStKPKFPtVwk7mBGVQolHuKAYTrwrVfKt7tRQR0gbyDRJdtaq2I64J8SA2RC/lOm
	/zwVZQHtvS3YF0ZivkCwfuEes1O9crJ1i7QFOulLPajEjAnn26Y7einpOjXB5BNqnXEfCdzO/tP
	6mK8kleezJaRtOwSkB6hetqdvVyqqkAN8iHXVZPyKrgJtmYytlNZ2ZrFFcpwEyaW2lCica96UCZ
	iFcIDSxaQkp66rqhhU7sfM5+67uu0qL3TaODiuAGmj8nSCTCiDH2ly2+mi5dTiYiNiugNBP2k7s
	io+r4riDLNyyT5wdrs5/TG1h2Im+qXuwReW7E=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr2171639985a.38.1773758876414;
        Tue, 17 Mar 2026 07:47:56 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr2171634385a.38.1773758875803;
        Tue, 17 Mar 2026 07:47:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6dd87sm40751901fa.35.2026.03.17.07.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:47:54 -0700 (PDT)
Date: Tue, 17 Mar 2026 16:47:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/1] Enable UFS for purwa-iot-evk
Message-ID: <lmmlmpu7h6rm5ddi6aaspayhaibeyr274xjqqquaxtrovusnps@5p22xw3vcbnk>
References: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
X-Proofpoint-GUID: qBTYUI3KnCi32uBLITd1Wq0BeiC_Npr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfXzcFUt9/kJ0u7
 LaT+QDLpbeRHh1uGrtiqQmmQ0BWqdx20VIin5fPSCZBHHCum9yVr53Veccy5jdHSkN+Fc2NVH3P
 g92z4SzorD7JnhvmZvw2s1dDoV6LTcLMJahlye2tjf4sXtmCTfivh4f5smjFs1uv0Tm8H15HbSs
 iPRAh+TUCo5//JEwgL4dXnXv+UfZR5yhWQ8A0eBlZ6BiO/wf0azzhJbmv85S3JiVuvpYFkHmakk
 K4cDM0R22kQ0v87i9fI1OOmOB+XJv6icnwp6ZeEg7XQNeiXG6CFNtBye4NtI7H/SeQhZgg/23SA
 1I4/dfslk+f/duPJVy0yR8UAD0W8K8QubBUcU+BWUGc+s1z6S2sgstuMYru8O76xgpP5AsFEKrN
 dikT7v7w7z4tagq9IeXpzg4Sq7b/JU1oH+fqYi4f3de7wa0WiPJovQRPI0EMWsuzD6+QsH9Sd9Y
 QUHbLWZ9G0+1E51h+bA==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b9699d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MdNTHAFcOfdl-yjXUGcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qBTYUI3KnCi32uBLITd1Wq0BeiC_Npr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98209-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 346682AC992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:43:10PM +0530, Pradeep P V K wrote:
> Enable UFS for PURWA-IOT-EVK board.
> 
> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
> nodes for x1e80100 SoC
> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/

No need for the cover letter for 1-patch series. Please switch to the b4
tool.

> 
> Pradeep P V K (1):
>   arm64: dts: qcom: purwa-iot-evk: Enable UFS
> 
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

