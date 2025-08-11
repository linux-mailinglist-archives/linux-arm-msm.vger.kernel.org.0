Return-Path: <linux-arm-msm+bounces-68527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF11B21108
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A866C7B35BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B092DFA27;
	Mon, 11 Aug 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vl3rd4Ji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB32E11CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928025; cv=none; b=ly5Bs0qOKiFHdkmKAMZub9xRFi8jsOQp1RgUElmwLOVXXe7p5BMZ0lyxOtqwDOsDXm5iSASze4ujBUoxtnYQaYNjFSqIhqZbjq80xR2oDAN2XjZ2CThjs9CxGc7sWlP2EjrLDdM2cyxDLQPUufI/5qghnX1EgD0XiyifouODjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928025; c=relaxed/simple;
	bh=mmFlEJt9VDIvtYkM8ZXAOpn457dJ2h0vRLaBGmfQSE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5KvoxTdBzkQafK7c7pfzQywk52wj/BvjLAyAz8dey92B5EjN+6+p+u5yoscg0LmZo97IFbtqwEg0+kxv070Dw8KxCZSlVKTkuS/a86PECxFW9i+c5ktyao96+i+Iu295Q/jl8xO+JSs6tOYAwtQ3VXvsi598Fgc+qiTcD6JiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vl3rd4Ji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAIh013084
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 16:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rwpl8NbvWrHTC8U0UpOFWNBP
	WQ/11HBCPomPthDpd0U=; b=Vl3rd4JiMuVNbQ1GuulTX8kB2lUtpeTiv5qI2FUf
	jpzDPc8A+welBs+nhxeakBbne3ZpE87aHWK2n9EvCX4rO5zSJoYzk8SqKz1knjUs
	Xd3bY2UWutKjCyGEabYqofEeLaS1nkYw2ZrIzkAY2ljwuJKUSe+ZS1z8NU+iC6IB
	2ldDWGhuoduTe6oVmoKFVNnZ4gybZ0tu+JnTPprfPnNvz9EJs/54bT19JGy2iaDM
	7Nvt+/PSoTUXvMp2ZoVluirO9pPS/j/E7SvY38Tqxa/PMRUYXLqY1LW0H09m2p7J
	5FMo9aQd5ualSPwpj8RkBsC0FY2+OOxiMuKRWLh/5EDj4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmn4n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 16:00:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76c67258a9dso3369397b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 09:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928021; x=1755532821;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwpl8NbvWrHTC8U0UpOFWNBPWQ/11HBCPomPthDpd0U=;
        b=I8zXgJPjCF3Q+iDz2XD1uN2+ERhlLRFXSSQX1dsklYR1aPUK7gs0t5/p1gLo083/J+
         GAyzLZ628X1Aj+8LJ3b/h9Z1wwqORFcU7wrdii1PvjtGETF2oYzu/PW5A/tPBN73ik6B
         546lRBvGKCAROEtdJly6PFawe/zCg6aUcdqSzZrb8Pp+rIpcbX6JDcsTBw11atD4Vnpf
         sa1xiBIwxU7C6q0g9gmduLNIlr9nTJc0Z2fJSyYtMNA/+mJIj9Atz55uqxnDky8IDCpp
         YJ+y+Rp9LwCBZyyHsf4mv8eMqFpyvIQdxE94pAmrjj4af7qecSX+0j8IPxYw0Y5Kr7Sv
         CAjA==
X-Forwarded-Encrypted: i=1; AJvYcCX1JYbO6qpmR0LrmHtzr7E+kSyX5k9KoL3CH7WHFGEcmtNhlVhTR97KC8VG3pYTs1ggytVsZkUChVik/2Dc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLlpzSVGoVNKcz02tYaZWZlRBAXwlnplS473mw5i/xotFiWVj
	1NexCH/ZDHKxe82UKlFc0nq0JvLZ+oGrZqfZkgXapEIa98swJcFQQJe/25Evij2r3z66LrGPsyf
	Qwa/K7sdDtjrqOjnQY//RfkebftV8qlb8cNkZAx+kM+Nla9qcf93KGJbXzlaOlEiGPKO3
X-Gm-Gg: ASbGnct0+n+onUrXpo4q7iXSeJ0PpYz673nmof5YFfeVDIljNerfPZ8K2z1lDZDpvTV
	UOMS9QbnbJyO1ufDLpUzWTMFZ1o9cMdXw+rlupizpNFS2yeR1dEichoQvve5I+0AaaLp1u0kVsi
	xmRcUy9Wr8VC6AS5PabL4lBJJWNmvgvjxke/aUhNO0Xbw8jpLOjx7GOCKA1/a/TGsYTEfbjpu77
	XemHnESucR4RDHYMvvn6530lWisP36J0e0eNbMVjSSc/j0yvetF94RlvNlh/t+jjLf605VRVytf
	mb0moAbd72PwmWw6iHeydFrz5K/BD4pQHYBqlQmbncxV+vvmuuZE0wjRhC+GLxuXQr0=
X-Received: by 2002:a05:6a20:7287:b0:23f:f99d:462b with SMTP id adf61e73a8af0-240551e874emr20671278637.41.1754928021242;
        Mon, 11 Aug 2025 09:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGAtyjbitWbIUi5XpTAPbyaZ3A4sWY7sxO1y6tLsTdKONGIygeMTfR0M2u79UtjmF8pMWXwQ==
X-Received: by 2002:a05:6a20:7287:b0:23f:f99d:462b with SMTP id adf61e73a8af0-240551e874emr20671159637.41.1754928020419;
        Mon, 11 Aug 2025 09:00:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c672dc678sm5739477b3a.75.2025.08.11.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:00:20 -0700 (PDT)
Date: Mon, 11 Aug 2025 21:30:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Update MAX_NUM_OF_SS to 30
Message-ID: <20250811160015.wmlcmln3sxje3vjh@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com>
 <obqkobpnuccfsqvytoltspw5wh27zyhyankt6dju2u32y73odj@3gzhuicheqd7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <obqkobpnuccfsqvytoltspw5wh27zyhyankt6dju2u32y73odj@3gzhuicheqd7>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689a1396 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=uX29DGtN9997D0eWwb8A:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 8A-9N0USunsxAKjdbHCtW4MxsUIUUaYE
X-Proofpoint-ORIG-GUID: 8A-9N0USunsxAKjdbHCtW4MxsUIUUaYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX+EFUfSWPpKS0
 HDbJxwrQX7nFu0jk8riz+luYZyo/wlqS1+qf6J9xPiHIUF7bSM1DfEvLQnbEz5HLQPgkGs9jEo5
 Yc7VwwYOs37tMJEQKCE2YTJDHqLhxpQo8mRcDSi7wn2UvLPlWbpmdhiJKAVRD06yIiuAg0uufis
 4jfuEHqvWw7VTNDfuqSzo6EPPwhbFpHi9z+D5QR1R6MYGUf6Tj4aYczjFFY+7vLCmBCzPmt7gWS
 jlwganU/vm79ygLbQ0yfgKX1uKicqYoZLTNGzyqBJPJ2AAGpjiHhpDIJyN3xGfJZi7rs32penPo
 7jhxJorh0brICAQW1o7KZrIGEp0xnq9yJm60vcWEpbvdea9zeju4CE50RMNoW9BrIUhnH+u/Ttn
 2/Gcb/2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On Mon, Aug 11, 2025 at 09:49:08AM -0500, Bjorn Andersson wrote:
> On Fri, Aug 08, 2025 at 10:14:17PM +0530, Mukesh Ojha wrote:
> > In the latest firmware for Qualcomm SoCs, the value of MAX_NUM_OF_SS has
> > been increased to 30 to accumulate more subsystems.
> > 
> > Let's update so that we should not get array out of bound error when we
> > test minidump on these SoCs.
> > 
> 
> But this number is used to size the minidump_global_toc struct, which is
> used to describe the content of the smem item - and this item didn't
> grow on old platforms.
> 
> Doesn't this imply that on older platforms you've now told Linux (and
> your debugger) that it's fine to write beyond the smem item?
> 
> 
> It seems to me that it would be appropriate to check the returned size
> of the qcom_smem_get() call - in particular if the size of the item
> isn't fixed.

Yes, you are right., do you think it should a fix (cc stable) ?

-Mukesh
> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > index 8c8688f99f0a..dbe3bf852585 100644
> > --- a/drivers/remoteproc/qcom_common.c
> > +++ b/drivers/remoteproc/qcom_common.c
> > @@ -28,7 +28,7 @@
> >  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
> >  #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
> >  
> > -#define MAX_NUM_OF_SS           10
> > +#define MAX_NUM_OF_SS           30
> >  #define MAX_REGION_NAME_LENGTH  16
> >  #define SBL_MINIDUMP_SMEM_ID	602
> >  #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
> > -- 
> > 2.50.1
> > 

-- 
-Mukesh Ojha

