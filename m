Return-Path: <linux-arm-msm+bounces-100608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHXMLMgGyWnxtQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:02:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B95351B68
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D273B3034B19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18BA314B63;
	Sun, 29 Mar 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lfuhz5AH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJyrsUKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E830E85C
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781847; cv=none; b=Fp75KPv23ST0Hm+wsuYN/bjLOynxcXghbkY6Uei7M/t1oSyMC2zh2hHaEr+uhq3q5F2I0fqVN1lDW4VWQcsGG8kUI8CxL7BpK6puigcgtBcsfrJ/dn2IxBx/t8suLBqJyQKgi79VFkl/EnfqdZa6XV+rFsERYVvleInLXw5Sy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781847; c=relaxed/simple;
	bh=d7PIfLIVz5R9AdcTPapjn5jjjBSMlfpUS6WPMkU2UAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDWKcbt7dj2vy+B1J/mZpSck7lOMhczaSOsTSmZvlemde7UX7ce++ewRrmXKKNItPpym0woza2V6SjfbSXR6fjX4SMLtKmKxWXphgQu59WdaFe06gAnE2/KFLpf1IqV+BRm2+Hbs6cOSZu5+Z0UHcOsqTLEoK80oh7n+vYOa0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lfuhz5AH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJyrsUKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhhNL3864195
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jheJ4cNHojAtDFO3PbK2hLz3
	dhJvovobrNzqjnMu+e4=; b=Lfuhz5AHZhyPTyFngbXnBZV4JbU+kDbhLyJVmE0R
	+fzR9sPI8/W1tdhI9x1lNLSTzbqfozjDLrtHv9iG0gH3NdqSd8DOfqI89i2Y4jGm
	AYfONY/2ntsUO330yAEeCw/Vv6QW2qEMymi71euQqnUiRbx11Z45Wc1JGnPGFHSW
	c9rLuFzGrnJoO3BZIdc/vilNWlOFWhUiwoEkq6RSgW/5WXhUV+Jtrm/8JGojb+ny
	BAd/pmHSd1lrins/Sf42weOROFdAQKJWMYXg2qxMVPrXL/kvt7CtmfWDgh4rt/Sj
	2PKPxLj0M87vZoOBhcwyFiBxOFN/x7JwDw743E33IIvZlQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm2y7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:57:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso113102351cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781844; x=1775386644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jheJ4cNHojAtDFO3PbK2hLz3dhJvovobrNzqjnMu+e4=;
        b=PJyrsUKLZpGlEu47H5ZQKfBzgc7Oskp89amQDri1pw77UfKd8G3kYZb7UmMan9y+NX
         IQy/rhKPa+IUoqKUQlf64YfSDrBzfpDKZ/yRTb62iVn3MwRN0PmWHy9mmeOKwUWKLTJf
         EvhTfSEXHYwaX6u3IZnQx8MueVMLRurZWLzB/kO9QRtAwHNH4NX9ahnfwSO29esFeCLi
         BNYepnBwvVrf2W2iurjLPRfyX9BWcEhRAX5AEv8VXDz/chIwMLLW/nEBl1XAruLvu92b
         ALrDH6ORs9vf+pIi5NqfWnsIi3knQ0tKEiR3ie67U1pmfwoO3JAJsXYLPS6vRYWkYbMo
         J7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781844; x=1775386644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jheJ4cNHojAtDFO3PbK2hLz3dhJvovobrNzqjnMu+e4=;
        b=RYbOs+X0R7ZLhsifxP3BD0WBJIWDbyVdqJJRhufgC3HhZrJ+TE8SAe3l3ja2ZItRiB
         x7j+PQ4VhVpZQAMNDWOb7OzUp4GDxe0Y9/mIHDN/bXvAmZWiQaYb30fr1g+eMRLbZop9
         M9vV699RXw2IfpP32cH2DiOECldaO9Inpagbp4gVVW5nnqHvppzAzIK4RjC8s1L86dNX
         Vxi68lN9xUi72KHJVckOpS8VXfJlhl5+08SErCRE1vVoOEanlScP6i4DxZcy14OvZTIW
         kahxIiqnGWw5PC9DPuhu2E5ZkpGO/e5vk2nlRvBuPIHKO9u6b3itz5kWCp4rcjej2DUp
         DTDg==
X-Forwarded-Encrypted: i=1; AJvYcCWsEMDeI4qXDs4f/0MSi9mIQCoQKd+QKQ7jF3CBtpuq/xz5E3zgJBr7c7ek2DktwSE+g9AJYvN2PRsPaOcK@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSMwpJcedvwU3FwYyFHc60ydQedsdS72UnNBXORhIEecwRWke
	BhtHwzaWi35nlT3j1COepeIIyyY5d2FK6NlhxbRqjgjt1NkRr4jfrm+oDFT2Z/Goz8lRRPKOv3X
	UXWZT4//IUUbJVOlyRbvnXwTj/5eb7nLwoBLsKYzApaA+o1LqcMSZIn2PsN+Qe/p8edgt
X-Gm-Gg: ATEYQzzVbEA1vSzvGJfwnM+VX9s0Y8RiIAwVCy/eM5cbrBHMVhc1QOkt6SwDt2CDymO
	bYf8HqNSJhFLslEP52pPi94rtZI87kHjrv0oZl1uLcbvGIGnKVnsiNZMBpHGH7Nu3ELpbJs5kGk
	Le736HWXu3NpMS5to25vZ+RnSHsapQzud13tK7OSVzfDBFNRT997swY8hLv4avicZ2jVtlDKnzp
	bk3QTaJ0mE//Ib78ZMFky92ylMGJOFr4Gn8FGwnpscH+K4zI74qFNKUIAnLzgJ96LlzUCZVysdd
	CWfoC2FMW3LHWtPrKbsoUqJBRxoRs2ValRFJciaHZQ6GU4hDDB5+70AHrjkAUkNPXSFTdFrszOF
	l4T1YFVbtYIvhvt7/8XBJsUcNWr9PpkIm37ZdYtH0que7XXlZDDKHFDzYWOngRolWzA7R5bbdTG
	2sGvBcP3zsmc1m8ToyDlsJshO8DmB4kQZoA9g=
X-Received: by 2002:ac8:58cc:0:b0:509:cbc:127b with SMTP id d75a77b69052e-50ba39a9d7fmr123028791cf.60.1774781843813;
        Sun, 29 Mar 2026 03:57:23 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:509:cbc:127b with SMTP id d75a77b69052e-50ba39a9d7fmr123028651cf.60.1774781843293;
        Sun, 29 Mar 2026 03:57:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f145sm971588e87.78.2026.03.29.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:57:22 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:57:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
Message-ID: <hc3bkodsdzq3to4aaax7vaeahhlrisk3iytuaxu46bjm37p75w@4e7c4a3gh3lb>
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
 <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Gt5gXp6GsjHHoHZjhBYPFUSHGyli4Cz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfX2o7lVGapogh2
 XObh5JHx5WCatvzheNJzCjeF9pGfP/UBCd5IVg1I9ysLC2cVF1B0htwl3yCtJwq28P3etOU30JT
 sGkfx+jcd/vXQW0pUWa0Jbs5anZqqJJvpIsh/cJVYmvaTjllasWJAVJWwMyzfiqFnDfxe1X7DP8
 MCirFCL/TJkW2KepBO+BT2QQBvDIrmfzmBgmHU7J6nt0EZqYFnQ04sHqZOoVJ5zZ/7YKPq+Btar
 7HCPpEHm6LgbtP1hbN0/JHttIFdidpiCnk9AZsUaTyGy+kOSJnVkB08PpUjk+XsqalOk2CQZoYq
 psEi1HuZkfRdgHopz9Zl903vm1GpEDgk2P8k1xY5Wsx0IAwv+s1hcHmYCNfkfGun6rDUmA687i/
 /xLUiyzfbxY8k7+Jwzk324+Vvet7W3NHNqAxmpN37lsC9KT8HZh5kJ9ntu1I2gVGscyn6Gh475+
 DXyB7SeLHoVSK38acxw==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69c90594 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=DYwwgnFDFWkK_D0auaoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Gt5gXp6GsjHHoHZjhBYPFUSHGyli4Cz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100608-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 11B95351B68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 06:16:59PM +0530, Gopikrishna Garmidi wrote:
> 
> 
> On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
> > On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
> > > The display, peripherals (touchpad/touchscreen/keypad), usb and their
> > > dependent device nodes are common to both Glymur and Mahua CRDs,
> > > so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
> > > reuse.
> > > 
> > 
> > Same questions as for earlier tries (why this has to be repeated?), e.g.
> > x1-crd: Please describe here what is the actual common hardware. In
> > terms of physical hardware, not what you want to share.
> > 
> 
> Hi krzysztof,
> 
> Thanks for the review,
> 
> Will update the commit message in the next re-spin.

Before you respin, you can actually respond to the question. Do Glymur
and Mahua CRD actually share those devices (in case of USB that would
mean having the same baseboard with different SoCs being wired) or is it
just "oh, this looks similar enough, let's create a common file".

-- 
With best wishes
Dmitry

