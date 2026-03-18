Return-Path: <linux-arm-msm+bounces-98502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFPEDLevumnkagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:59:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C78652BC80B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F8F1304590C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A229D3DB63B;
	Wed, 18 Mar 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ev7+U4Sq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtnI36wl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00E3D9DC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841918; cv=none; b=GqEjg2Gik7AZIvmlsKQS2b7RXl49TW6NGjdCqhbvDHWMHbWy/EnVf3qMjCTCb5N5TZIRgVB6qZzh/bAZ/LMeljzITj7ZFAG6q1yxF1RyVn++s1OPsMPQPux5T8gkI7cji02dBmrMcZhp1FsNjztMzrBAIV2/vmBPEb8DadB5R8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841918; c=relaxed/simple;
	bh=aag50//lDdfzqja/eyD6X6mOddhds9KlbYrSleXbZSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXrGxVIL1uc24vCGN5fulclEWLTZbHxz04e1+c1mVUSfpiyh/7pSNQNAEhsNwIwECsULe7JzsBklRFRIsmlSnS3b9onl32liMUsCbUHJM7A+kRJSSUT4+FaUytj68gJKVgnGyHhlsSlQe7j+myQxOhIHhj1qgvoAplz7Jkqpfm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ev7+U4Sq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtnI36wl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8n0EF084720
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b8p7N3WCAn9qh9C9Z8cgYRpI
	ohuqBmS5lvcYh8AWRMM=; b=ev7+U4SqVNmVTdlj6TNX5ZAAdC8q3ozu14yeBviH
	MUgTGClpCXwJYSO4aOheK2JNXr9UL/g2e0fh9/Kbktu1MK3B7kyqwWE8wxdYFpGC
	BVHzd/BLKb5+3VZLAhZW71g3Z0u/ChfUUpOTGpF4EByf4/PttfCv/7wvWumjyTX7
	Il2P7HmiQGJ6bRV2UCW0h52zptF0tmHBsC1mD4Ic5AddszoirWRHbzTM/urfiUyk
	50670nGi4DivgWO55Ibxw3s2Y91S/ZvaeccwP4FK42i++sal/fS2QzCQiUFmvqxl
	lymbK5HpDUDn2+3mVnle4NQCW8iA5i1dUVa+K4di20cakg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetftr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:51:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094ba09affso15601491cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841916; x=1774446716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8p7N3WCAn9qh9C9Z8cgYRpIohuqBmS5lvcYh8AWRMM=;
        b=JtnI36wloB4V9Z0c28rRH3NTatVXH8yHmEhAgABZFi+bEHobB1bWqvAtMFrz+ywb2F
         xCKh8296k7iOa5fmrdLdq3N1bD9N7og/2anS6LEfDHGaQxGPcBVP4HG0+Pn7ahyTgwfE
         UYocfAM3L3MnfgneeVYC7yxZiuvIbZcuaCvIatpOCaZZxYef6hKGRZw2jNJdAa2tzbDu
         +s+WGs/dQW/hSln6eWsidD35PXmnRKU32lvXUOiha+VUoFCFUAvnysYinJZH7wyeKn5j
         DJEKxAiUqt5u+cs3oB9PCittau2icinF5ftBDadc89hbT0TwvwmPE/pVwd8oShnUKCns
         JbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841916; x=1774446716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8p7N3WCAn9qh9C9Z8cgYRpIohuqBmS5lvcYh8AWRMM=;
        b=flT7uvuKrgBFHAzxnssBkIyjJmmG2Q6sAXgc6Uwx9Ug5msy7d06JEz5jMacvjD56h+
         Ade4X9aZnGB49Zjh2tqsVF67ApxrwuD6jQtKiajX0lAOZpDRa9+l1RH/T5kJI4RaSaBk
         s+2VBzRnoNN21HBF5O1ud1dtDAsUBHxvZYxZ3k7dr8SCceoyeQMuTWqwwE25irU2dxVP
         HBQ+ofoAlj9ZAIcYxciXhVTARSMyLL/ab0AmVCrX4eLIekMFrYWhDZs5Uy6DPKjB02pY
         jg5sv/dhQhqRZ12/dSmF7yFDT3+VR1lEILOoefDmn+H4snZTF1C76F0LK8vGJOV66mPH
         j+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVnr44bQ+8ezQRdhhY5SmtNQkcRYHg71hp6ZbQ3bLZerzumYQODN3YgDqhcKezDNXpRCJibtudO4aLX67ff@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LypXD3M7kXmOtFoiK5o+ppqTO0HmGmz0FPRYuzRUO2CjlTq9
	ioTkd8ME9eLSgHXsCbBaqE0CWVP7LmUM8Ev1WMb4m5sdvxR1TtwyC6ftTa/byRQ3J1fHhfebHGj
	BTYUOMO1ea3YMwFC2G01DbJdkrrm8TvAiGk1m8qM1CXonX9J8D+ogH9a1Y1+onD75SZUN
X-Gm-Gg: ATEYQzy0ERt5dgA2SpV7ABzRoevrbpBAeKHU/9Fx/Y0Vx5FxbkwdwYzec7BEecZVmrX
	1TXzYgyL1d8eOQ48CpoMN1iayjhwCALzVLNBUiSII4IJFNA6eoHZYJMGxMp2uz+s57ZQ2wzBJgY
	3mXaAkDo+LfsW4YkPZ+9RsHmqSPaGcGKe9lPoyL7E9uZZMisxCN8DZc5J49hFvqBXsRMszsuZWT
	8uFM+/OmrMLgQwyJTQ0XkfgfN7YyA76wM+9ErDBJroevflL5uMGqd0ypj6+S5XBOc+h+jKWVac2
	qavMU1AEhn5b86rucfkRf8VcN+Ybv+ZKCf/WOMFraKQSw03j3BL1BsbozxmjYGMPr/Xanet9OUG
	dfBZovFoogA+2Zytl3vsPit2fXsgFVziaC5FX0R7F9EPNPnveD75sy1vRswuoVPCJlKwP0TzkBz
	PYPH82WmCCI4ivNxCfjd5oKsRUO14XA7fimuA=
X-Received: by 2002:ac8:5988:0:b0:509:2ef7:704c with SMTP id d75a77b69052e-50b1491f2femr41998481cf.72.1773841915664;
        Wed, 18 Mar 2026 06:51:55 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:509:2ef7:704c with SMTP id d75a77b69052e-50b1491f2femr41997901cf.72.1773841915102;
        Wed, 18 Mar 2026 06:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c27346sm548561e87.16.2026.03.18.06.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:51:54 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:51:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Commonize Glymur CRD DTSI
Message-ID: <mbazinc7em24ormntqgwspjg7bkw5rft5ixirvmobwm542maag@2dm7pim7hmce>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260318124100.212992-3-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318124100.212992-3-gopikrishna.garmidi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOCBTYWx0ZWRfX30nAtwDS8Su/
 dbllkKaX5bXdcKJXZdOgmUANbapOUrlmq6/Nn5hF87Yc0+OkuS4c4mIpS86pzTwhGNRJUpkf5G3
 KW77aJjEK1k5P5Icd02afZ5RFJ4yNlkWoBNqS+eWCJUJYf4NQAsEDptj/0VxEj2Hd1DHQx6ozW+
 zyPytV3qSCzN1ycRpz3wx+nwM0eSrCMttXnD5MglJNfaUDktaJrGkYd7b8sCbNkvhr9mXr0IT6w
 ItGEBiOtjow6Zmy+ri9mVMGDMONnZQbPvUsFY/nGv8pXwLOUjvXZ8bNayHsUHIaEITtwqq9TQa7
 BVvfbUs3aX88YE0S0j0Rg1uBoFul95nz0+xe1sSSPY4hqRWpHyMXepvSvR15G9px8vGHKuclKqK
 WVXMoIQO8H/8R3sthqqAy/kfCEO02q+Y/NQ9yblrMPfcmoZpqsvsDi1HXlaQW3WFFCt54n+2yjt
 5rPYv/wxAgjmg3WZEFg==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69baadfc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1qF0bZ_5sq_IZ3pRphcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ulyeq7b-qAKYuvn-G0Rkf10_pnzyPPzf
X-Proofpoint-GUID: ulyeq7b-qAKYuvn-G0Rkf10_pnzyPPzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180118
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98502-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: C78652BC80B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 05:40:59AM -0700, Gopikrishna Garmidi wrote:
> Commonize the existing Glymur CRD DTSI to allow reuse with Mahua CRDs.
> 
> Leave the PCIe3b nodes disabled by default, since the UEFI has the instance
> disabled to avoid boot delays due to link failures.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts       | 586 +-----------------
>  .../qcom/{glymur-crd.dts => glymur-crd.dtsi}  |   7 -
>  2 files changed, 1 insertion(+), 592 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{glymur-crd.dts => glymur-crd.dtsi} (99%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

