Return-Path: <linux-arm-msm+bounces-83245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97EC85062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BF76235011C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FAB320CDF;
	Tue, 25 Nov 2025 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEwdvki6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWM/Wyrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0112DEA67
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075141; cv=none; b=dN6asKIf5B6rUVQegtskVRuRfRJdlLDbchdag0xL9eY3hBCUz0WoqvlBcns3eWl19mwHzKqFB/qH02kX1kigptOG6G/nL1MwVKPvzS0tU2aRx+6z6mig1HeMFqxHZ9aBRP9YVCN1OvZqwcBmw6AqLxFjQJo6cpjf3gU7vEqccNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075141; c=relaxed/simple;
	bh=vIIA4mGVLl8jc/UPq9XG9j6Ah4loj0+Tur/++NhByww=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW2c6s/iuDsKa0hNnxpH503UOTlB1L7yvNqN9vLAvCQQa4i2yBtyY/pg/nhBh83F+PjnGD3EFNjhCdgi26hYH+h/WQXAKhlb16SiKyYZRcFQq0nxY7tKyDlCf9vB5Y0fA3qswZL7wrPp8If21hquQ+lQPYgCofe6Fr62WppqUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEwdvki6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWM/Wyrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APAAplq1939545
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ScsI51p3RWiGpmzl/Y8j4lB7
	RZh14EyXHK9ApFQwIe4=; b=QEwdvki6JE1nnKvi9Yh4vrMtgDgaAtvL/NipXHPw
	wAmlsqyOgXI3fhNfjajdVEHWAxK3F+K8ipISqIID92tMVjf0EqseAppM9pH0w9Q3
	wQaBvtzN3ltHeiGdvMMDuoFR5wBLaV+zdpdAVmPT5epttk78/omyvWS8SmLHZg8H
	I0jQ1e43W4GZ/2jCFaL9jF0ViiZEEGzjvnCKgx9v7VmQ0MuWXbLNdDaVKQHjytJO
	GEMp3HZMBdgSp5eD30gMzE8NR1VG+uQ6GPKqmoczrWFgndbNOYnKD6zTBCgmRpj/
	uKey5g5MfmdpEaeLoUN/yXcq1kPITyp6JeS4Q6FcNPdheg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsst3em0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:52:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so123353441cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764075137; x=1764679937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScsI51p3RWiGpmzl/Y8j4lB7RZh14EyXHK9ApFQwIe4=;
        b=VWM/WyrdRbRXvZr+N8RBz8hLJSjGxj+Tb8KvYvxUACj1fOnmOis3Twm8mYf/A3uyq9
         O6uzz3gStkl5/uTDp8InzXTh0uKklbARyAjZrVnj47bi1GFy5F32B65ywMQ4/5l3THpr
         LpccoGumDisaOIQygyN7d6+11385JJAtTO3Oy7l6PnwMIZarEUARXnKe6iIROY1E43Pz
         OklGgMRyFQKUISqpKfT8RXi/w2FqyxbSAzu71XJI7JIbWwjA2vuoKjco/MUhBwcrFf6d
         iZTdS6eV4dZUnWfFVhsolBUifP2OXqXLtAP35OmA/c3JWqd5XX183i9L/fBfaZ1VOX/0
         +/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075137; x=1764679937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScsI51p3RWiGpmzl/Y8j4lB7RZh14EyXHK9ApFQwIe4=;
        b=HqhHKoBdBa8ATYFqJgcP+0wAlSjKTGbzWjw3k76YQStcMr5k5QEEzbW+WrmvpyIHqf
         47r6ZtgLnPx9ibYP57NpZGUZs5LTdVMjdqihgxR8m1nvP1CkNuqsw9lkpNU4zGDITf8O
         14hpodLAMEtmb8DDg/eD5P/wwvxpJYAZ+RQ1iUVMNweKyVmYdi6/1EpvrOcCAESm6+4p
         9mEkFZ8Lh/qa1El2/PyehMDQJpl6jBe8HdosCCeB3167XC+Rqcqj9r8NaDn/hOxSDasP
         0KXV4ILi2uapMUIX9KUQ5Ui0uFLtHzBWqeyrW37vdJ5TPC4nCjIQm9zQqjLBZIxJWbvS
         cwoA==
X-Forwarded-Encrypted: i=1; AJvYcCVGBE6XHlUtM95peYdcBOboOz9paVwotCOKGZ54ME7oRLBWD78r/QTEyDiD7e5WkwU180w6YNlsd3MgWtVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyos+mvForamM9MRhYoJASfIRD31jvGaGCD3J5cc0gwsuSwx/Lp
	W5RiT2+TRnM7cOnSnYeE0yP6RMQcyaS0yDlVfsmDXMwTArqBpMteksYGy6cujJubjZz4dbyQQHE
	Qbb+y607xiCUpic4UE/VwYIaUV1Sax0+/ZlmiE0ZQHcdqG3DsskZu4yCzRo8uCPvG5Yh0
X-Gm-Gg: ASbGncv8GDOGyJSz2te7ur8MvxjYsahJfQ/2PJUQYFhh4pu575mtu+zI5Hx4oN53/Me
	1MO66MRCxAMiKOQMkJRZnpnRHT3uTOPGCfZnOtt8W2S63SkN4HAI6Ua6WKTUlLypedazEMazj1E
	PcrLEQguriKpOyRFJCHwuxUjVDPy7SSzoNZxA3PZSBYpyC1fRwzrx38oksU+hscc1Y2bNFC4YtH
	z6V5Ho1cUZy8xw6+AToTZ4USzSUiDAT4OmxVTq/sCKYNOFHeyy2oZFgZemgZGTOSYJCnRBxcgkB
	pSf26TCu/QFgpMYFdr2WPbB/WtWX4aZ+DjfaSayLdfFrdAXnmlvEoPwaw6OB19FoI9/eiyQBcBO
	/X6y7laMAwL5+tpYNVlYqm2CAdDeBJfWRmyi40R804eZg
X-Received: by 2002:ac8:5dc8:0:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ee4b418901mr258840901cf.4.1764075136808;
        Tue, 25 Nov 2025 04:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh976qJxsmgG1mRA1z6ZOeIgC3zUggBSkOeolUKxGfDS9bMppxdScyvFcId7vgKqtNNtwSgA==
X-Received: by 2002:ac8:5dc8:0:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ee4b418901mr258840511cf.4.1764075136248;
        Tue, 25 Nov 2025 04:52:16 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e872esm249357255e9.5.2025.11.25.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:52:15 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 25 Nov 2025 13:52:09 +0100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSWmeZHmeUWs1NwY@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bM0b4f+Z c=1 sm=1 tr=0 ts=6925a681 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8RCVjF8-wm2c15ljX7YA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: K6cK5oPLxzguLuXErlXtsfa0TT1Fr1C2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwNiBTYWx0ZWRfX+mXDJqW5UHTV
 a6enklUCuIBxTaBV9bHRMXQ5fWBlxBYJehZBog/lY3NCubAy0gX8+L+6uup3+3Yqc+F79AxFLCj
 EmJf5RkNzcql4jHCWJObKbyjcrjlsuODDq5kcCc0JkV3bsLv9iskJNbxwgTo4x5YwgccOoCCfzF
 XC/LA2pUO47WutN2ysMFgrCL7VV823cp3NEvRKnYKQu4nKuMhIBKwDZQGLAZc112OX8S4UTLAwz
 4xV1AlfqzYo2JAqrL2ZckezS7lEIEX5uqfft1wPXyFmQlfFDeFdfsbumrR4BGtcJu3a63u3DFms
 Qw6A9YugnXYBSKEkTJL5YwPj1Yf8udiNvibl8fHUhASeMxkS4+O2B31OSO1tG2RHWzp3UTq9lEd
 eEqgMPXd7NcgTn5yWnjzn8VrYzHy6g==
X-Proofpoint-ORIG-GUID: K6cK5oPLxzguLuXErlXtsfa0TT1Fr1C2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250106

On 25/11/25 13:59:56, Dikshita Agarwal wrote:
> 
> 
> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
> > The Venus encoder and decoder video devices currently report the same
> > bus_info string ("platform:qcom-venus").
> > 
> > Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> > parent device name. With this change v4l2-ctl will display two separate
> > logical devices
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
> >  drivers/media/platform/qcom/venus/venc.c | 5 +++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 4a6641fdffcf..63f6ae1ff6ac 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
> >  static int
> >  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> >  {
> > +	struct venus_inst *inst = to_inst(file);
> > +	struct venus_core *core = inst->core;
> > +
> >  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
> >  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
> >  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> > +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> > +		 "platform:%s:dec", dev_name(core->dev));
> 
> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
> The second call to snprintf() seems to overwrite the value set by
> strscpy(), making the first assignment redundant. Would it be cleaner to
> remove the strscpy() line and rely solely on snprintf()?

argh, my bad, you are right. will fix.

perhaps we should just have instead

decoder:
strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));

encoder:
strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder

I suppose the additional info provided by the dev_name is not really
important to consumers.

?

