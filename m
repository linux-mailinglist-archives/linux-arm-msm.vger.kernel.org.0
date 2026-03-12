Return-Path: <linux-arm-msm+bounces-97119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOJMHQwtsmmlJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:03:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EDF26C8E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813B4304E314
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24722376BE8;
	Thu, 12 Mar 2026 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VR3g2Yc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G62ppDwl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA572DF12F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284602; cv=none; b=jZhW/EGI6x0B65zV/qOzdDvJUWXuB+EUiMPv227eNQ2HnsttZ0HHh/lbHFZ8mFbTM+BKgE27mKMqVyklwDpdSvMm0O7njAEOOie3QCgcQmdct0LVJ4YEcsH1LI5ZkD6qMNyCOmDhHHXsxps6HsVGGMIf3kvVC/K7UnCyGhPv8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284602; c=relaxed/simple;
	bh=+cBWA0wqIlmtDkrLkI+B4oGYrRstDQJ9kbqoQeVs2bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8u4yktMvsBB4nCLmYNON0HKeh558n2pD55AN1fcSHpyIWsiMjnI7bn2veol8VDaY9oRgryuO/1iV/lXygUuhAHqFPWxigZvKQJ5PCXA5FgOQ2dJ2MWCr2B+t3mrYENxAWc1i5fVdL95s/NZPCOhYJH7jqd0M0wxa1D01Q818kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VR3g2Yc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G62ppDwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMnp34132592
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XbA+9SUk+EkKE8ZRl5ZN80Zi
	KUC6RbiScWDWCPJFj+g=; b=VR3g2Yc4DV4XieX5v69h68pabeSumTZfiFlXuR2O
	21hJRJqqrogWI22co0y8F5GkqUZe/DEdhbqqkV7mg1IU0TNpkh1PctCy4yIuVrm0
	VAkN08I9dYCkoKlf9CH1d7N+icIWA2WY2LuFEhU69o/kOxtxR31jyCcGNFZuM1yb
	VYViJuu+91aIdRGILtfpFQhVo+PnCxv35fWaSqAu0d892Cub1bY7VagL1dv1fhqG
	PwyfVGyOXZYPrAYzYlqrcg7C98Fk4chNInBjX4akeS2FdlShGXxJxpPtS+Ssf6OZ
	PcsLUVoYTXdO7xk3daJzfpSsONJBLh+ua0GUkH7SMqoJkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w0n3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:03:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso371710385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284598; x=1773889398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbA+9SUk+EkKE8ZRl5ZN80ZiKUC6RbiScWDWCPJFj+g=;
        b=G62ppDwlX/P+NoQqk7itHz4e/fuRrqv1jVG1e2syGdeLNvyZlok86Jlls4ulzqaGMv
         OWQfSifrpfhXjl/HT7R5baZDdKYtAN1USt9aE7ofoNuj57HIGJhE9fORkm59fbOSsA0A
         ohI71VZIm1JBhnVe7wqC6O+h3yi/uZitafGmk+7oj6z/2IX/gR8P23ru9ftcEoD52wgx
         5whG+X8oJwFbdPC+JLgLcOYTPDYDEw0Df+RBxgQdL50Jf8//s5IRQ7IL57gWQ5UMwjXO
         cGeujPhfUzMvPRf84nlJjhCTFPR71Iypqus3a4PsSHnzu5YbGY+omJ7oD6SmvdFGumaN
         fvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284598; x=1773889398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbA+9SUk+EkKE8ZRl5ZN80ZiKUC6RbiScWDWCPJFj+g=;
        b=Sh0AA81qg2QNlYZbFI9Dhy8Yt5XELSEQN6I7GWp1O2xR9srwue8Sue3s15bCmnZo/4
         sRRMLk9D4AZoPihtf+P+LfxXEUI2TIe6m4auErbj8SKga9h+Ll5S4Nyx5DPk43VkmWFr
         BBEyfTAD/GPILsuNi79z52qn59ISFI3+Yiv5BdXexOAAK6VS9U01DfyvPyOuAeUf+by5
         jp3tZCw6ntdIyd71kw/0S4l9RhpEHfLrUE7W5Wj4AXb/idyu0SxrJm/kHd/itOLbJbIq
         7hwCNWWiVMzsJCEw7b/kOpYtCtZ7vS/QJJ60CtjrLedYiHMYxaxiLPHEGudYyPFiKgt1
         EePA==
X-Forwarded-Encrypted: i=1; AJvYcCVgIoVOVTE2q0ixJ0vGzxrtbWu5Uy4qIAHPZo7pbZqLb7GlmthDLZgmJf3kDWrvj28FIXBfpX9FgfxxoQvu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn9Sq5HQqV9nK6tFxkB8WEZcmsjCiqGihRgmgnFU2PhqAudUeN
	zWJecHHvuuxlMQhk04P0VHJQRtAbU15tdu3WXDNVR6LBT7mC5KSNXOMr43gS6huGMaCD+zRbwJM
	GPcMhvvOpSIwtMKYkgXW39mcYhj5sjIFVBi8WvFWmmLx/65d5NjBT968b9zwUbA6+VZVu
X-Gm-Gg: ATEYQzwluHJTvtxeG2RL3eJ0y8ZRP1k2/ioCNCSZCmP6I3++BZEFsngoCQ/UgK43ehI
	3yI2O0gQliuGZc8z9I5bzipriDBkJw1RNAMQWUOxdbh8XpxjI62bNvN93nBBKAt67skqRaSCApV
	F5LyaeVatlNmYmJoKIG4vMFlop67/6/g4mIEt0GqBnLMrfEkLD3kh8CnDG02r8X7rIoqZM/7w5h
	lUofHqpOBazOA2b3PQGivGbKoTgYfN9lrGUcSTUmyeC6F3XhZROBbZzlwbtc/E6HIa6Jp0fP5SO
	NRMQ8eFdvNcJT+ZZPEs4Zg9MLdy2VpasNTIlix7CIuS5yStbaXO2rotU8mN6g2peWSQQfS0Gn6S
	MFBG/aaTEZvot+lBNql7CDYZ/fwzWUM9GXTC37XmS0dwZcp6+9c4QVvB6RkbxToWP0WHvZiRmeL
	/wZ99i7PyP+jvzEpb0oTTD9AsQNFnrF4kU5Pc=
X-Received: by 2002:a05:620a:4156:b0:8ca:a950:238f with SMTP id af79cd13be357-8cda19e507bmr593436085a.10.1773284598497;
        Wed, 11 Mar 2026 20:03:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8ca:a950:238f with SMTP id af79cd13be357-8cda19e507bmr593433685a.10.1773284598047;
        Wed, 11 Mar 2026 20:03:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156375198sm697197e87.88.2026.03.11.20.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:03:15 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:03:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Commonize Glymur CRD DTSI
Message-ID: <rdnz6fc3jfypy7yh6lkswvacarketkcepi3zfaq6pxlsljilbp@yzsyuirax2oy>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-3-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310054947.2114445-3-gopikrishna.garmidi@oss.qualcomm.com>
X-Proofpoint-GUID: 1IVMilLWCk89jRqlAMvYdAKSRIp_WPtA
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b22cf7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1qF0bZ_5sq_IZ3pRphcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1IVMilLWCk89jRqlAMvYdAKSRIp_WPtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfX29+MsFvNwDVA
 tYDfTrj8whqAsySp4cWXWaMd/jlRAv1jyOnWjNyx555FRJ827MWUcF0zrbmTIsrgLm/Q6io2XBx
 RanwcpDhNJpoxJWcTA0eiInsKWG7vsk64LHzOOs09SVUfsyD+NyZ6MwBFnX3ylGiQq04mljwPh2
 GNhoPpjyAfon6PfBPqN8DZ4UymVfLW1tydloD3ZxCW3F0rPZrJyABKy3v1WfY9QRi9oGoHkmg1i
 iZnzD2h9nfNrRoIzxJjRObxQFhcSVxAc0ImHLlzWNlNS83D20HtNDSiFQV+vvE/NhH6AnUkJXCX
 x9UcP3eJHB8SjayW4DViLe1V+CvdNVICSZGgiaZplZhrB/mOj6G9o9+uUS8JomXVst3hvlg/yMG
 6Di68vXgHCBF5jefr+/JNs3OBaIhRRMgYIpuYC047bSDIAsvXBC+zVL1VHksUlt8BNi1bNSd0Pn
 OZMuud72+39FbVdNq5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97119-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 22EDF26C8E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 10:49:46PM -0700, Gopikrishna Garmidi wrote:
> Commonize the existing Glymur DTSI to allow reuse across the different
> Glymur SKUs.

Is Mahua a Glymur SKU?

> 
> Also leave PCIe3b nodes disabled until the PCIe3b PHY init sequence
> support gets added, since it's disabled at the UEFI level by default.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts       | 586 +-----------------
>  .../qcom/{glymur-crd.dts => glymur-crd.dtsi}  |   7 -
>  2 files changed, 1 insertion(+), 592 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{glymur-crd.dts => glymur-crd.dtsi} (99%)
> 

-- 
With best wishes
Dmitry

