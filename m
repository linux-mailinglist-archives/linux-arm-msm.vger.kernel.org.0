Return-Path: <linux-arm-msm+bounces-104156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKYnOsf56GnLSQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:39:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE2448C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8437C30056D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089B9249EB;
	Wed, 22 Apr 2026 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl9AyGXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJYSkCmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D337CD28
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776875625; cv=none; b=PQ9IWSELwsvtAxFUR5wQ59G1Rpcl8CmzsSMQotXt+JEgayRYJfelqT01y7F7RDO+/smnvN3wr2pN/mywKbxUFFKBUQjP7KO7CPG5Jvj0DS5S0aljKfFJHvR0tDVCQSZNE4smp97ibyvhtfwOndxBLcEkJAaLRWTNzTcfVRkkvYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776875625; c=relaxed/simple;
	bh=rZmSAIAqfaJXRSDmbRbjnmmb2Fm9XzXjbGL76/LnlAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMERCBloAZm2BfnBU+BYRsnmIBiRYSVl1rpwcri0jkJiQQF8DTUXBhVbixoKUcjHmUatUEt9kIzTmTXsX8aaIU2+QF7vQVSZL8Vqf7NVk/Cs1HFxjxkNV25e0GdhpFkAoDQG10wMQM9t80EW1zoyVxX1WT2CtdJ8bueGhCtU91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl9AyGXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJYSkCmt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3m382012173
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HRigFCG4ycwt4LxTWXw4QbrO
	ejQopPzrlRFYZsGJTnE=; b=Gl9AyGXQlbOqFY6lkNl8l64KgGYhbVIGrx+vlBgR
	f1Hbf7lGJvFVHGe4aZPySX3FgBrDfyP/E+Dzri+wjgWfe1JxDQSMpjbO6sN+xEUV
	WgbpOv+QPyJFXMropWBb9RxlQWyfF8FEVqErNv5GP4KEvqT9LA3NJj37loA++6Zj
	nOlbfgt6BnCRaLwJrPJCLp3EfVSNgmfnTMj5w4fYmBkJ6sry40YlVidG9j7Ydphl
	xBns3Gz7Kl10ke5GCwSyTMy952saEUBHFX0kH0ud0sQiZk7rsrUgPPtX85UQwZSh
	JwL2ElYROvHqisvOYchgqaEAvBEgNvcx2F72glXC473naA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h783r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:33:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953f37beed9so6823064241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776875623; x=1777480423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HRigFCG4ycwt4LxTWXw4QbrOejQopPzrlRFYZsGJTnE=;
        b=PJYSkCmtpqfhNpT1Au/U+aCHW041G0WYL2XL5IfTUWj4WkoXi7uptL/GVKHwQYkSW9
         xQChVII2iR1DRGsI69exUus2QDxJQVfuV/bhw69svg1Dl8xbv6NvCmRWW26+SfLSvVJv
         6eejEqzPlB3SxNpY+iEQY5afTPKRef6ieS3aImMlhW3+RXe/ynoIInZgi62dJtBvvGr+
         9zrw7wfE7WZAX0hHWTdNTyKiiecQKf0YX24j5seEesvk88hw9dDJJC/YxEmWFlAgKZ8O
         fB8mA4uLVKNRlNzPEnQwyP3MjW1QqP1ZUjcAohbixC/wzHloKT/JI/abgHbm51sxQVpY
         XwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875623; x=1777480423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRigFCG4ycwt4LxTWXw4QbrOejQopPzrlRFYZsGJTnE=;
        b=NVxItOIT56tVB8nQpO0qX0+bKAylbHk2sjMC01tw9x5FfSoc4YfPIGgXt5gJhGxRL8
         nybc9ND0u6I9mKK6PsfH2Xx3af7cFBYg6nDDTghQonpHdjGJ3dS1SMvfWt3rgRdhiTmZ
         oC9YJurIgA0+XzYg6aytTZq4DRdYE19xDyJcKpHBxutPT5+6T3xJ9sKoD8yzoqipIlwe
         9HAeqoLZOREWVErVVfZiu+n3HuW+zK+Iq4hfu56v+8ybQJRHomZlHy9PvNASd+cw4nD1
         9Aux4F9FzywtcROIyQQm6D9nmLu59TmRcgIgPbgKn14ps8EhlzkMbBb6igE064oHAUlL
         GkEA==
X-Forwarded-Encrypted: i=1; AFNElJ+kT1/aU4ehubtRRQAoOziUTSMt6vuK2z/XUaSE1mNx4ii87UKwN5+GHJYBbws7LeVnjAnNQkHCkcuTCkgz@vger.kernel.org
X-Gm-Message-State: AOJu0YxWf3gokg+4t3NEJgqWUlrAoFTPPF7KsqkfTcN3ncjg/f28YzYn
	vT99Fd3AuLIMCzfO/hzFKAuJT0SVRgbpnBk3Fk1MOuXLcZ3jE51cK9gWCYdLpzm80aapGtEkpQJ
	r1K7N9iVY5iPO2XBgvmAvBet9fmnwoIM2FWNe5opTo8r3wQueIzFF7z9uk0/a4cClv9YZ
X-Gm-Gg: AeBDietbQbDM3gxQJFX7DyhT9J4RfAM9iKLFmusU6awxWud1CkkIArqKARX53RUyGSG
	2lI/xMiqFIcJ/2LBN1LA6bDxkyW960FI1wx0ED+364HeajaKsB1boJT2RV+vZnpiqzjjU+FTFUZ
	MO1BLOMHgthAP6e4pn+tAvcc3oO/n3hPIeFaBfgaAjG/DeSurISYggKRtNjQzCjUV8K7xU0vwl9
	Aj/QTQZ+rRPAp6lQYYIvavV7spHBEnIUiojxLnlgSzzirUd/nVQDRUaqAlPefT23kyaZ/jjtnVN
	HbsHLvIcShifDJlldb/rEHBS77OV7c5gpHFGW5ULE33IxZxnxohb3Bjf4uQZt0/66Q2pi8Lsyhq
	f2yguNN13M9VSmXj8I3FQI4yHMj5YUVZajj+hQCyOawahAVNO48F7WVZQ3VLseO0plkJJc/v30s
	J8AIhJrWyYuF2vLsR5a3D8cyhiP8eBZHzdsCwl8ejC96cegg==
X-Received: by 2002:a05:6102:94f:b0:605:852e:6022 with SMTP id ada2fe7eead31-616f464119amr12703644137.2.1776875622793;
        Wed, 22 Apr 2026 09:33:42 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:605:852e:6022 with SMTP id ada2fe7eead31-616f464119amr12703618137.2.1776875622322;
        Wed, 22 Apr 2026 09:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc5e5sm4612926e87.27.2026.04.22.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:33:41 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
Message-ID: <dyyfmgpxzpdlrutxi7gy4fudhpwvlljiylbbcirq6tgs2zr5yt@lpkrehmzgqpq>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AMobi6ahdmMen6YJTiIOFprJNmrlgsRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE2MCBTYWx0ZWRfXxqV6+lla29oQ
 EXnYZYF3exWQmmSsiNj/FlYWI0rV59g/X8cEe452sbJF4rCFjxGFYK7OtCjsOA2wy5rY0oIYnO7
 FuFIHDPPEb3SZv2onIasadM2qpGQUxEoz80+BJFWA2lvKWqv5eAuVOangSqz3xdiFdpNNbmCHjv
 drArpZa1XljSchrXFA29rYm7PCeW5ynfDNOOH/6CbaxpP2N7OwW8RRY6cDIqbtw6mohhtqCIZSg
 hFo6G5gffg4lHGGIR05N0FCW2IKKqywFgKm8Df6V/JF17+9QwcjDoUU1jrCpixxwne03FclT3rV
 GDGAzFzyPYfxSnKAosVhJvRFW3gMMQZ2vTutadS8B/HjcDLeGu/9cKM2WjSTO0D4Uat2jMJwkQD
 yihS44Ie9W8Hzq2QTwyEuhkVAusMsnTLRUIQEZQCJhqGZbN4XmWI1BTIk54g3Phx9SkyDTVGu3L
 PUHD4dM+QGkidpcweRA==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e8f867 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=906CIqcWVj-ks7o9AA4A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: AMobi6ahdmMen6YJTiIOFprJNmrlgsRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104156-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44DE2448C91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 12:42:56PM +0200, Konrad Dybcio wrote:
> On 4/22/26 8:01 AM, Yongxing Mou wrote:
> > SC7280 and SC8180X previously shared the same cfg because they did not use
> > swing/pre-emphasis tables. Add the corresponding tables for these
> > platforms. Since they have different PHY sub-versions, their eDP/DP mode
> > tables also differ, so move SC8180X to its own cfg instead of reusing the
> > SC7280 one.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > ---
> 
> 
> 
> > +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
> > +	.swing_hbr_rbr = &edp_swing_hbr_rbr,
> 
> For eDP / low-Vdiff:
> 
> I believe the RBR swing settings for 8180 should
> instead be:
> 
> 0x07 0x0f 0x17 0x1f (matches)

0x07, 0x0f, 0x16, 0x1f

> (the rest differs)
> 0x0d 0x16 0x1e
> 0x11 0x1b
> 0x16
> 
> The preem RBR almost matches, one byte is off
> (arr[0][1] = 0x12 on poipu, 0x11 on kodiak)
> 
> The swing and preem settings for HBR3 look OK
> 

-- 
With best wishes
Dmitry

