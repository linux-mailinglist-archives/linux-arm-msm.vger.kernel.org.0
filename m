Return-Path: <linux-arm-msm+bounces-98876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB19ECC2vGlv2QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:51:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CC2D53BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D909D300F5E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281A128468E;
	Fri, 20 Mar 2026 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYHm8Udw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCro74HY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824519DF6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 02:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773975030; cv=none; b=E7vk3/aKleM+82yQQjFp1GKpKrFeeGjFBkZDATucNzdtuMJImnDlxfm/u96WcGiMSehbIXGcvlpJ4hUWkmnhl5+I8aux2pFptGGxAAbfHT8mRH9uwoNQwKWbCjAF/QG+6+6H79q0MTq2VJ6607A3Qimp1jBFQHv2EG+hZ82YY1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773975030; c=relaxed/simple;
	bh=sGbineqHLHgks4SmnOMUvTtvmPAnsvxrKp6ALHOVPtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeQvZSgZ1kP6EZ61518OExJAzHDihWd8td3aTf0NacqIBehdH+2GO+7tJQXU0ZmaOMLxueOEmh8i85qp0Swa5dho70lkDWJnCPWXIIOuLWhBUw0qDL1WDvWA3+Z1sJBpV79HqnKFLjX8vC94qlWjQZQ/5+7FUuq9W1bfVRq1Qt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYHm8Udw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCro74HY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XjCR539238
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 02:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NmKAuTUkURchFcJsh4unNqPF
	m/QiUuZnrYkDgxPcw5g=; b=QYHm8Udwdhy0uP4A04gZZE8+t8leQ8ab46e+41+y
	sdF0PCoULnyQbX9wAM/aRhIE0Y5YD3XJFJsKIozKfbJgnHX6nW6cwcnioEqYHGr5
	fdv0g9XZs/jhctALFAWfY0VeSI7Q2RLu/Ig5N6vREhbA69vhQbgZlyhEUBnEaFlq
	51eTGOrPYpOsU7m2vR6y+XD9We+yquo1VDWQI3aUG1b0XDrd7f/aP6OTsu7nU2Yv
	BpWys4+Rd5sQA/HiyoQ2bRir9L6KXf4LcmO2jgH0iqrN3SB5tWTnFe3V+BJnBPDh
	ei6GOhWMCdJb3ss/UbzqsSoIk9n2qle4MaRZGEY+dPsmag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0sm6gm9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 02:50:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50921f7da67so14529871cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773975027; x=1774579827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NmKAuTUkURchFcJsh4unNqPFm/QiUuZnrYkDgxPcw5g=;
        b=KCro74HYNfAhxq3zNGq7X9dXWNJy2TaZQKE2m5aMt0WZZ8vvmFofYnGkMU2VCJBRBh
         qLXuMnR/GkAgF9GIjmbDdonMk74un+rAwJz6SDbwxfcdcMiBRsUofnOeEwSmLs2Rt/qI
         xFUsP5X09AezLc2dWumXENCiuoAhhhRHFCdKmOI1pGIBqQd/AoHVWE7B+XoKe2YUBvlL
         uNGkUIWT4qVGRMJKhf2oPmnZlEi9jMtB2bKpoK5DBtZeZigsUEQth8oSOUUW+jlsTNYM
         bscUic+X2EGSF/j5/ayLsIVOHEHiqC8tBwFinUOmW4J/C/gCE+W0QkbvBpMO/b8TDmiz
         pTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773975027; x=1774579827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmKAuTUkURchFcJsh4unNqPFm/QiUuZnrYkDgxPcw5g=;
        b=e7CDEmxn1a8Ihu37V/CvJmSE8RhrDpn1O+nVDtvUOaw1J6yAYUqxjR4K8RNb+FUgtJ
         zjrMypq1vebNX1ZkdacdZnCWxbMiBsiSo8ylpyq6xAu5SF4FqSAtYq+hOiaimCQiIQ3+
         QXMsvDiEFuhZYvMCGP98i88n83PLf7SY3mOy58jqP+VWVNSwAuiL8bnRhNtBipghshw8
         JkFC+2A7PwKTA39+wKzrFSbiUr2VBPiOLyv+CWqdxOyk2bc+SVoXgGrlbJywVPYsuZN1
         u+udYujFcd5F/J21Sat2GlhF2dO0DBBdqsJqpDVpZxsbe272ekiHGTqoKvsnUrxzpX1Z
         UrEw==
X-Forwarded-Encrypted: i=1; AJvYcCUukwgL7WS+wL6F+W7wIIkvckW3iaGQ9nYzPOe+YoSZg2YqoNg50t2wqZ+vIbp7lkhVQGt40oSW8KBhyZJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhnGAA8rkqnZ1OKM8ttri52MPJnzPTYNj4iNoKWXhbkcekPuy
	TBBWOMZAK2JpJhl6OUymuTL5Anj/f1Bgr72PFfzBMgFF2nwIn2EbXvS9z74ydXZHAPp6Nvx1u9k
	uMaQXLIdioRbyuk2dMfAirkN7/AeBcsUe162DNcTHPh/sTMAnBclRVhC0KQ1DMOelQyPq
X-Gm-Gg: ATEYQzxUXTQqjlIkHkgtgLnLd/JjoxUPXDn6nDeufvxb3KgP5D6OYVnzajK5NRNlvT6
	lUwma0zbr5PxQ83BWxF0D+dKMPSaki19v2Nm20p1bWwY0Mu/lwyMZeUwKrxecgKK1Rg7NWxMgiz
	ZAr59x7ySj/rsedBmH4kntATD0PmxIXHMA+oWPxwg6sVcW0Uvu+4m28rfWuiIWGtbgcLVohq8rk
	RjbOLKaVKf6cvpBKyT+J9lQXtt/LP/4ceI254ilAP5DuT6Ew84hrcgwFqlnkBjNLHIm6SFwT7ZO
	1rBnurhUzV/7uthiizH+k1kpNcnxd4G3fZzQnI98WjRQYWX4T9fF8DCCb2nBysJNYE9TTXiHk/A
	sJsEubDMTdBGM6oQHRzU05NjPhp/UZxe9s8y5EB0M6bkI39ND8RqPjO+xa1HOW88SgUUTLUdb5T
	YaJ9CjrFIS8V5XwKVW94Omnlr4ZKjveD75evw=
X-Received: by 2002:a05:622a:7c83:b0:509:14f6:9849 with SMTP id d75a77b69052e-50b37507278mr13876451cf.42.1773975027071;
        Thu, 19 Mar 2026 19:50:27 -0700 (PDT)
X-Received: by 2002:a05:622a:7c83:b0:509:14f6:9849 with SMTP id d75a77b69052e-50b37507278mr13876321cf.42.1773975026607;
        Thu, 19 Mar 2026 19:50:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f93fsm270628e87.21.2026.03.19.19.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 19:50:24 -0700 (PDT)
Date: Fri, 20 Mar 2026 04:50:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Message-ID: <iwx3pxkq3jrxxqusjmjf7aiwyrheitmh2mj7ny4siwvormxgd2@p35hmqtdkhry>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260318124100.212992-4-gopikrishna.garmidi@oss.qualcomm.com>
 <cnmqoyoezopwtkwzonfr2o3gphj67kozo4s663vcppsaoicuk4@d766vka7lv74>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cnmqoyoezopwtkwzonfr2o3gphj67kozo4s663vcppsaoicuk4@d766vka7lv74>
X-Proofpoint-GUID: _9kc94gJ2ZEE0UC8Ev1U87AiCcmcj6A9
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=69bcb5f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wNE-EAEg5L05xUdJOpEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAyMCBTYWx0ZWRfX5yGFf6+tTN0T
 wX8rEh575bNl2pKTNMiVudrdjsJLZr6jL1SP9wA0QSEvgmBZaAHqxXPhNKgaBxBgL0L55HvEY3v
 duqccnFt1/X9sF4+FG8RM3y0HBSQfbRcl6uSDjb4EngYbQfLxf08vn/dlcpCgcxHvQrOW+TfNR5
 YrZsQlZDMPMV772yYZurxS9YnfsNd1IVfXszrRjuDpwdRKQNdEYHkV5PYtbnnmCIS4bqNvFXy83
 JE8EVjZmlsWgtfqcScIF4DVY71GL64qeNQk3wOqw//FSzTETiHGxhCs3nyEPxhGXxdHuikVf+Vl
 0ydFTcFm8RWl5+hh3lLbmO7FrQsKYHHYu0WaMo1Ppxn7NvFEH8PRC7Kln4dAuVnSjY1FK5UYInW
 ltMFbKXfGP8OnMoFVOmMIqnYwp9E9gHfBBcNH27EQPCiAUj6/DheEPqTT5I7df8mH9KQI22qeo9
 sV/80J6wJNGd7thq/4A==
X-Proofpoint-ORIG-GUID: _9kc94gJ2ZEE0UC8Ev1U87AiCcmcj6A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200020
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
	TAGGED_FROM(0.00)[bounces-98876-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 995CC2D53BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:37:16AM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 05:41:00AM -0700, Gopikrishna Garmidi wrote:
> > Introduce support for the Mahua SoC and the CRD based on it. Some of
> > the notable differences are the absent CPU cluster, interconnect, TLMM,
> > thermal zones and adjusted PCIe west clocks. Everything else should
> > work as-is.
> > 
> > Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> > Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> > Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile            |   1 +
> >  arch/arm64/boot/dts/qcom/glymur.dtsi         |   2 +-
> >  arch/arm64/boot/dts/qcom/mahua-crd.dts       |  21 ++
> >  arch/arm64/boot/dts/qcom/mahua.dtsi          | 299 +++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |   2 +-
> >  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   4 +-
> >  6 files changed, 325 insertions(+), 4 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
> 
> 
> As a second thought, patching the nodes using node names is frowned
> upon. I've implemented the similar change for Hamoa/Purwa pair, but I
> ended up defining thermal_foo labels for all affected (removed or
> patched) nodes and then patching them using that label.
> 
> Would it make sense to implement a similar change here?

NVM, the patch was merged, I'll send a separate followup.

> 
> > +
> 

-- 
With best wishes
Dmitry

