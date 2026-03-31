Return-Path: <linux-arm-msm+bounces-101108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGkYOFcLzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:58:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378936F8F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FD943059D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94F7441041;
	Tue, 31 Mar 2026 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1l8XbV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIwiG4RM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512FF4418E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979711; cv=none; b=E9/v/ZNHSB4jQiGknxIaHIrJuwORQW5FNdRZHTEydVNSxn9q5ABSZ66M8OEzwlQ+yaVQN8dA3GvAbKD631vWVxhnlwja903R1VTpSE+5aw/02e5cJtXx8RMJiOOTRI0fal5D6HXYmgZpmpLv6Ho+B+igqBF2lmkisQ/8g0o6skg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979711; c=relaxed/simple;
	bh=ysBMc/d/bm8Vg/gCg26e+flxgxRWmXHAvsbtsXQGdDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9mZZS4I8a/MGSKxhf/cFumOTBfiVW0a1/zQki8rP+X1g54BHV6Q/1zFhVyx3y23ozv3qCfwArtax6//peAbHwpYan87E9AhjtcBIq89Ps7Fy57nB+hnjbI7EdMDjj0W9FIeA+MGaCPoREDBkEly+o1XIJVYvfclVPTUMBJyVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1l8XbV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIwiG4RM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdHAh1831876
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCX+3SO/R74+gTOVpzwntDTc
	bLEOU5Egzkn9WV1WEfs=; b=H1l8XbV6ur2Hu7XVturiGp2D64MbKfs+Iw5aaKam
	JBMORqcZ9gAZrfPEXThwsEhfeZuSNh0aAHzPXUrRtVlZCHxrlQWSIJ7Dwn+MwOk/
	Vgr51EpcG5Sx62znWo4il3vPtXFAZ8spIxUZc+e3qnXleJj4c3mwZxSfXmGHdbhN
	gzpPLsCzlVg9e+Bt+JnMYq9RjdKCYQRDrXKF76ET8CVnpbuFXp6VvV+uSbctwe8J
	E+aiCs0iv1/XQDSc3d0p0m+4sS25z7KDwTy2zqHFNrJ0V87e0y+UuptmJW3MIZf6
	BnMir5xOVy2163ZBrsXvi+kaGI3ZKUk8Wkym1JyqEhrGog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9jdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:55:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso66820381cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979702; x=1775584502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCX+3SO/R74+gTOVpzwntDTcbLEOU5Egzkn9WV1WEfs=;
        b=FIwiG4RM35wJNvEPRksbeF4aEkGCLuzJOWKgtX1N8GISb6myxGbTBzUP9ZXYRG7H3t
         BBxXbbo7ZUCPEEE3cIcCFeXdvA91x0B7GvbAFeb/t6wboilNwOvWIOxApOQhq0CDFM7p
         kiSA32UnVZgpscQvfB4S59EGTsoLD7MjoVIGpxNiFaG48mh3R9nrvCpDGlQc8LUpN8AA
         vABhZjorSBRFL8qaajDC1NUk/vJRJTsaZsA7NiDRRG1tB3nLWv3y394I0YT+BA1Q+hQ9
         RxsxhgurCUYc5k25XnDwSF3Ud/2+Sy+AxrZpAqViB3t/k0fDhx3jQeT/CGPrQ4FIi/x7
         D0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979702; x=1775584502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCX+3SO/R74+gTOVpzwntDTcbLEOU5Egzkn9WV1WEfs=;
        b=hA9+1sGJPZz19YFFed/ccFgupL9kwyR9pTo9a5rQM0eceXBsdxhZpZ41RR0eJJH7s6
         Uniw1zYeLdMxfq79c5Sp+M7EIKlLXWXfOhponCuRQc+b4gqoiASRZBgKSzjTTb9A9gM8
         YTcvC8lDHZAQdgUHK2Oyx4VCkH1r/Sr61PUBZAY3jbE1/qx5YUKg+QO6IoXCGul7azRW
         pGL8VPiThaU9s41VVmoXduCLlSPv3HTENm8MZz7k3MlgKi/DMJvldFuu7GMzrxyD6djb
         257VmNu/qh6Z6kZq3QtUs+NaYhakvcvZReuU0ZFzN02/WQftUt5nBQvMGyhW93gFVCQZ
         J9EA==
X-Forwarded-Encrypted: i=1; AJvYcCV1peiruVg4tUsOFuE29SKJsRq/5dtKZwCYtzk9VcAg3Q/4WpWM+zSBLDnH8ttLQOgthIrcL33NECRl/KII@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8tN9hKanOIV2ijePgVV566iu8MfW3GyPo02QKR4sUlrZVBqMe
	F39Al7l57eqEhms4QUFIZsL41kXy2JKxHtVyumvsAFJGI5l/vPSzpueosxmAK6qevMsyar+dMDg
	ztUOb7c7r6QX5MaoQkKMLP2Pr8jDwrLPtrD+K5NzH+tvihsB/D7S0JahXWA81TX0T4CO1
X-Gm-Gg: ATEYQzwvfAhBo3iPKyvPcTJcLwat8YhAiHgxcDM7FBfbckYnr8+TFOuxlR9qeeXhvFG
	icW2TfUojtiD/5oq6+HgpiYPZHdpXgpd7lz7kIHAeE23FnJV2kddTT8LCLRsfgwR0XOSZM6+9vM
	NMErOu5VQN89Rke5PGLao4PkSkokN0S0v6KXQQSGMAlUJS0+I5EpQK2SkgSh+3yXUl6o8zmW7QR
	ZYDpOfF974p6UrPFFEyTmZwRVjFPlmr7RFhAolxC0J2GLJ/BFWaXG62ZDfcHeBjty713pRIs/JZ
	DnXCWSUCSYCnyF3eHSYrAsTh4JZDwHbVQGgyi03+sE9VFLmbnfi2omCg+MZNlZHDG2QXQrO3kCF
	VJD6g0ZWeLBRRqRrvH6xUxJRssTFSZCw/oVIsj4Azg20h7W+MRuK20+g+0vtRzVUGL/CeFPUde+
	KgSFJq0H0lawbXNixDH3XfGzeqlTWwelqAl9M=
X-Received: by 2002:ac8:5a0d:0:b0:509:1a36:6aca with SMTP id d75a77b69052e-50d3bbe437bmr7197831cf.17.1774979702524;
        Tue, 31 Mar 2026 10:55:02 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:509:1a36:6aca with SMTP id d75a77b69052e-50d3bbe437bmr7197371cf.17.1774979701935;
        Tue, 31 Mar 2026 10:55:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838b7ce7sm22341951fa.28.2026.03.31.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:55:00 -0700 (PDT)
Date: Tue, 31 Mar 2026 20:54:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock
 rate
Message-ID: <o3xe7rfzwyendjd5yj3kquw6ayvxdo323bgw4fkhzsbjywceyw@5pifcduwqcq2>
References: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MSBTYWx0ZWRfX2osOZZeHrYio
 fdNRSmYba4MtwIrrCjAiEbUjm5EljYhcwBGG970j+fB3fScyb4L8GEXu7e1L1y8t8kj0s1dS7tJ
 k9PIjhLKo38Zx1rxUiNaayKRBiWPFFOlRVSdGvHypfAwVq9wfGVMtyM5u5RkoujLkAfDCsqIFxG
 zwDlX6gmzVjGlj7o3eFdpH+btURw+Z9XCPD/T2PyKBXh41m/c37YfOd+135rTuYK2RDmEjNexbl
 Bc3iMhV1kO/xfpYRqDuOdzB9NB8LK9kvuDFVQXq1Rw9nmQkTyygLJOPTtdTDCY3Ar8IvgN6kXWc
 EiOe8uYOW7sf79mmDp01hdr+t/bQaChiscXZ81xg0IRo+RqVR/zvh0uqWXUV7y+QUUPDFJGiMZ0
 BiuMRWsS3gm/AOG+lwtgOK+tsB29GbNawyZ0mJ1KatTFB6ZLQmnOkBQULY8IH9sIuNK1rcqXYn1
 rYSyLkH4H34t9G4mEYw==
X-Proofpoint-GUID: MHun1HrSbX4CBmYerI7X25cmmiKS-aEV
X-Proofpoint-ORIG-GUID: MHun1HrSbX4CBmYerI7X25cmmiKS-aEV
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc0a77 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=m4qzsdtWhx_JNS0JMQoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310171
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
	TAGGED_FROM(0.00)[bounces-101108-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 8378936F8F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 06:56:46PM +0200, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8650.  Wrong clock
> parent will cause incorrect DSI1 PHY PLL frequencies to be used making
> the DSI panel non-working, although there is no upstream user of DSI1.
> 
> Fixes: 818ae2b389bc ("arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Fix for next branch.
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

