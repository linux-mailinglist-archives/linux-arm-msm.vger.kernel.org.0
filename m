Return-Path: <linux-arm-msm+bounces-96383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGp+Kz9Ar2mYSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:48:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A75241DB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9CD4302A7DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D682368955;
	Mon,  9 Mar 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVGb67FU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcWh6Jpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C623603F9
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092924; cv=none; b=CFjw4LWDpMdceviee6bT3HkQgFKQGsyAzmfQoMfkvkF6eIfqS+ZwL8tzv7X1HEqMeOhvhvclctOkFKxEadwhExGXrbaj8jXJ6rFQZQZvMXtiLlWJxo4VBFer1g6WL4reyflyBLnbBHLeI8XP2Vuj6dB5gX4/K6nYIrqawCyijEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092924; c=relaxed/simple;
	bh=WUbxpw2C7sf0vuQmDFHy4rJAIta0rmYvvu4klnKlet8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7sPqRjirQYdaZokgpZNcNR7C8OPHNxR5k+BoSmeBXYYL92ZxKYNIq8EhXHCFKGRy4C2K6EHyerbHKvp/9COVy3K5FvfC0+KtmCiLv4t5rHwk0J9+JPq6taofWL0ZHwwJmSajxo25LPwgQe4nv9sidxYVDvAX2TwlEismdF5zSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVGb67FU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcWh6Jpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlKV296205
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2RuAxDQcvEoypV3BxinnmTJC
	gen5zAR0iCHU145RLJg=; b=gVGb67FUlUTJAmlYZDkZuepRmTaG5JAU8iU3h5vh
	gCdlL28/d95L7yvAtYPai2nMI0FDDZRpi8tjJXyeZ+AR7IGt58VC9U8UT0g/KY5N
	ZzhLRB25Fxsfj4OK96i5MAvHkPswvklFqWwlfkWvs6N8N5XiU2njLKOc+XhVG1g5
	arJkMyb4HJJVp81esZCD6jf+el4Ev+T/badaw4LQ9SXqCPrxP3iAUTX97/IUy9sk
	GpUsXtpRNiv25hOFYFD/5j1pGHA5HPaFVrfeH3GjP3aX3ivMVgZ9HxSvnpNhfUEl
	+wn43JsFj3oFewBJjKIr79sfdYZhlGgOSUTJchPbf5EGwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1kau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:48:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506549eb4b7so850887881cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773092922; x=1773697722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RuAxDQcvEoypV3BxinnmTJCgen5zAR0iCHU145RLJg=;
        b=AcWh6Jpf0EjnBKROpkpFPLocIc6ECWvbZf0CJtMM9Sq/Fwrknw+cBZzGylbTdv+w2Q
         HTPR4HV3MQwXhCI1dN2XxRu+diLnwM6/DhJEW1VXoOCjAYB2eRzWNIY6NQoxPtLt3y3a
         Goe+Q7zulmabzpqkxTJcldR7tBppsJTl/jv8W5aZNf/1YyOdv0Tnp/NMPMPHxHGdHgbj
         ExBGUbLFKF4Ofa6AOK+dzWxwJyMeecn7byDWFbMFtQNFtvR58e5aUESiDgMGlTSSdmMu
         gZOzbPCtjEUH3MLrcypmKXIq7X1T4CNOhwLF5Z2xAnbHceUw8rCjEMkU1g7+71XETlfn
         cS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773092922; x=1773697722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RuAxDQcvEoypV3BxinnmTJCgen5zAR0iCHU145RLJg=;
        b=A3H3eGhPLoiaQr04sFkTzlqZMqH4H88QM/ddDkwRA51kdMCFZV34vgA6e6tUbm4dio
         ORyWgNOSTwBcDl3GsE/DNTHNXzuYbs2AGr4X3jYhdodhntJnz+1rZbOFZsmU4NWqJNS8
         mOkg+vI4Ew3Ee06E9go67aOpA6ndCUWydMrA1F5QDcDfrR9CtSSIHcAxRSFIeWAOZUg/
         0fokAeY55CX9R+2dQJ4biTP3HMfks7ZpQ4v1dQphWr1XfnUIpG2joKUQ6hR4xGnvhSiD
         akIU2goGd+8KsgpGiigMiLQeNZtTefpbJLLqo+UmXYp5HT1BOPRrE3d5bmDbuOW0YGcG
         DvAA==
X-Forwarded-Encrypted: i=1; AJvYcCU2P/BY7rh7Kz6r59DwIe4UhLXhrVLtbIlb6XOYb2V+exTNZyDj2GHQVJUNewHQV4rIelLrjxhYmEylu7Gu@vger.kernel.org
X-Gm-Message-State: AOJu0YwInZgdfWrEy8Rk/jsvgcBLz9u9XIPoHScKX1L/1Yvvu3wob7YR
	d568oS42efiSihyj7XzSqHAHZz7Okj0XJVewux/z3JrI3mP0nu4zcTZs69OuOYmX1fVO+23Wd94
	NbxES6FCjsTtibIz4xHXqdx4zAyReJZ4dF6ptFv1+aPhjg92JSJ/5zf6Hxmfr5RKX47zp
X-Gm-Gg: ATEYQzzPFKIgwOVOGOtZZ5c7FHafmiW9xRqkdho1JCXqMghffusiPxv+OzcqfBY298D
	PxPS1OhvWCWASXB6P4Nw2LsxwbKkq7X3MzM+3lBQd+dDCMkCI6uokNH62aAIShgp3SH5866y6YD
	FyKJY3i8XYQkKRt5vjB1C+Bu2LTRMUt6lBTxUxAf0fQVgclU9FgXrSwVRatNFuAk6Uz9K4BtS1J
	qs8/SQm7OVY1NWYBIcRoz344tU+YKqtTa8NvmYHX9EafIvpSBxDYQ5mVpHS28nI52EouBdcgxv9
	276LgPuCOgIwShl225qp7RT6Hs2SZeohW8ttlpP9EkYaXQU5A+mdsNALkKRl8H+ilGEtXWitVgr
	6E14FUhkS8V88aMkFWW+f7D37Be6PfnV6Os6ArztHeH7aW4mYDO+VnriqN9xPIRm/EAPEyVuuiT
	/DqvR/iBjSmnSLlpXDb51/+Uv6vy5CCgsx9L8=
X-Received: by 2002:a05:620a:1925:b0:8cd:9322:7c55 with SMTP id af79cd13be357-8cd9322830bmr210725585a.17.1773092922027;
        Mon, 09 Mar 2026 14:48:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1925:b0:8cd:9322:7c55 with SMTP id af79cd13be357-8cd9322830bmr210723185a.17.1773092921516;
        Mon, 09 Mar 2026 14:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf1asm2382397e87.9.2026.03.09.14.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:48:39 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:48:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <fzs4fp7arvm6kvy5gj2oxqlntu7u2uwjo4ojy45isnbjpesp2e@3jxlydcyqd6k>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
 <20260309-dts-qcom-glymur-add-usb-support-v4-3-6bdc41f58d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-3-6bdc41f58d18@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5NCBTYWx0ZWRfX6vQdWNGP7cLw
 HJXdtDflIeCaTUjMTd2kILmnB6RGezD6RgrUMnXuBm7laNKb+CKQDsBjuaYV/iCHH+fn49ihQuT
 aLVxsHF+bsIU8MPfarZpd00h9Ns8xfVyZXUW5NtGfU/TQWExuP2BI2Gx9SUHRQBlFFtj03BcLVh
 SU+5r1H/66sjnFdenb9HsYURgEj8GzfINyx1KkPnPJxWoghiQYjPHNiTEfXo95+bB+tIJO0N+3Y
 yHICem3pWjDtally9UEH6g5CE4qjVp7A4VQ8Z293s/OB8PyzS8liGKrQf0u6bMVa3LA5t1sCwvn
 /ve61CLkwndqd87zA21zPbkJ4Vr2mJkbZ/NlCjNhuJZMs4xAPM8FFDHa/QMASnOo2ujIpUCYCdT
 YLjmeKOITV1uCXiJrBndenm8ydv6drGOU6fC7YTUlPx0d9oUI/0nT99TQUYlI5mO7vcYNCr/NS/
 3dwPyXIStoUFlKgBbvw==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af403b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jjo7NJrCQO57_7Q7sOwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bb_eeklzZh2xvQDeKoJsoNp4tpAiICQq
X-Proofpoint-ORIG-GUID: bb_eeklzZh2xvQDeKoJsoNp4tpAiICQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090194
X-Rspamd-Queue-Id: E7A75241DB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96383-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:56:53PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Qualcomm Glymur Compute Reference Device comes with 2 Type-C ports,
> one USB Type-A, and a fingerprint reader connected over USB. Each of these
> 2 Type-C ports are connected to one of the USB combo PHYs and one of the
> M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
> is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
> dedicated NXP PTN3222.
> 
> So enable all needed controllers, PHYs and repeaters, while describing
> their supplies. Also describe the PMIC glink graph for Type-C connectors.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 214 ++++++++++++++++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

