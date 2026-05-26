Return-Path: <linux-arm-msm+bounces-109731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOxpNJ9GFWqLUAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:07:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525C5D1793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2DB4302159A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC4D3AC0F0;
	Tue, 26 May 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvVUP92l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPKhnKOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5C73A83B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779226; cv=none; b=mfRWE6HwFRBBXMEpvLI0nTVzI76eghYmfK1YzfC2tSLZwfYtI1pEqpxJ1GfAZjs+vD18NrC2stZLF6QaICZz5B+IwESh+f5ti9XWYbTFjLN5Sr5KEaA20Q/RjvOjmLtQ0PRriZCZfmHV8r7E7mx2IB+FeUBu0/pTnYASkYOFnbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779226; c=relaxed/simple;
	bh=sJh6rB/aO2ak1QRosQzP2btcxo9y0othPfU7CnsNs9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFY4RT3+l/vL+yqWMMMTVwHo0/qusBxlEd7f23N5U5zBuftapqNizU6JAxPssektWgN3M9oi2/dnrecSXVNvDj9TRwjRnNgCJsbaw5OesFKh2ra1Kw+t8bxHXYvkKFdrcTU0dgadp01eTWI2OAx5XZ8GEFWkRouLdM5/HTD7BEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvVUP92l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPKhnKOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q1OvZt691683
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UM8f/CGKAxyqlDwVFwOQ1tg0
	0UT1/J9JW1xp0T1vsJQ=; b=GvVUP92ld44qhIqwZgHZeEporlNAUJf7GOJl6TfT
	Plf8x36WeNGwL8yIz/JFTqMkJ3469Ph0VBqzaSaBqJsm2eEYFIUAWIlCgRxWLco8
	nkCYmOPw/qH0PeoFb5Tl3twUmx0T1QbcZpr+k7NOD7Vi7bVCECaP2Dh3br11Aspx
	rDvyMkMY3FhbPc9UAmGyP/vLrck4QGzGzY1tAmz72V8xxIxgWMyZqyuo8CNEsmcz
	+lvekAflYI3DBv4NA5LPxbOTP+l2l+wahW5dxheuVIoXx5BDovizpuMv0ZEOWaoK
	VSkfko7bMG2rNLRLe1xvLl3Vqr7bdNda6ynZe88wIdDcjA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jt1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:07:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314220f28eso1208088137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779220; x=1780384020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UM8f/CGKAxyqlDwVFwOQ1tg00UT1/J9JW1xp0T1vsJQ=;
        b=FPKhnKODg4LKjMy6YRFeW0VNzd7wDjjnbCfb1secForoH5gKP+wvwOQNz8n8TQK9PJ
         Y6laEuz9wldSkp3OMCilrVyEWRBeo7V8+dQ5Fpl/ChG4quGnOXG4iWUzBcDnVnLxxJaN
         fvuAeS1mPez2w93fTDb5a+IVwDSxhEsr3/QepM/+GQryXx5K+PZ1DcIHTRViHNzycBLn
         L+1yyrT7ZRmDwOvUFFRxlG9FzdmEIk1f0CQ305tnMntwdpTPSg0prYnJs/F50fnRGMYP
         4s30o0m1kLZLKxm4q8uoCq9Zg5NtLf/i/qk4NhB+zfu5GUF5Jm2ndmMT+KRu/oT+JlSx
         XV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779220; x=1780384020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM8f/CGKAxyqlDwVFwOQ1tg00UT1/J9JW1xp0T1vsJQ=;
        b=Sr1Lb1DWwbFX/BhSIh6iFx+8P/Hy1uag447FtvfKVvuNwhEkESEaMqZCioJRsJkuU3
         CQpZJd0T8s4ChThjlZOVSjBvtmclg06rE/OWdVe7C0/ajFYwwqQaYCGVqBNKYwgcZdg3
         MJHSmeJ7KxjSVVY+zbFm1UQqil1sm7HqIhE2EbO0hIIgTEvv2r6rCNcS1TTC1GgGRxuI
         RN645QOxbjj4Mkfi77yjmcAIzRBnS8Id9w+O0tO3TMjWRzfPRks5DJLE3SAoJ3gSgrN8
         okA3rbjUsbHC+LRiAeO0fQXHmaSlMc+ZimGV9uPFReLwt5pRhat9vBK1ax8JFmAXzExh
         0zEA==
X-Forwarded-Encrypted: i=1; AFNElJ8s7uzkaPGgVIZSIiHZQzamqKtw8iBLuIeOOmn0LpCtvRdVxxqkdy2TAuEUrNRzIRf00kUU/MsFRkKBHQEB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+G3G2yfGlFnrT9yISuqsWEXenCGf05Wq0XfSXsJx704Ja2HJp
	81BjMhIYsCgPMxy02Kl4NCcIU24e4x4uAQCDGSVlxtOMuiK632k275WqOFnYEoF6yEg3MBHk9SN
	wZUjaJlrbRYrAjIjdCBKOR3RqP8B/C3Kg9Z/qiPmqDI5fWbKiL83bA/IHTzLSJgX+I9Tr
X-Gm-Gg: Acq92OF+oK8cIX+edUE/ZPllKtr2ir1wxMgi1z+dDeHwhQo0kNC6OlMz0ftj2t8v5uP
	onH4AbtEUY3ldTZsOxBjb03HHwYMwHhHVQGS7Q9ixfxvKtLhoZO1Dwxzwwvw1lIBpKvyBVnlVC9
	NdsdCg3PvRnEjbEMLAaxo5bFwiUQ6JR0ThffSBSuUkcbb2hTFxIHXgkSa6Y0pALPRXuf/k3Kp6L
	i6IIUd2amYrgkSgSPfSU3ep1vx2z50zdpRmHPSRPG1Ot1rsH/Ylu51RIs8sE6zTS3gdpFjnHw+M
	nM9/Vtc8mOMCFdCOUiXGXrPAXSBMCphSn0ILAtHexoUCUBQutVTe7OlXiuxdinEOJacFgHHijv4
	oLncL15gZKlJMEDWPZ1kazcWrkqF9d3K4KMN/xPaQ+nFemVp1fF8cESgGA/nS5//0kMEX+fVUOo
	JIiPIE2Wt05jXPCjLP3ZkaiiosikK2dIbYJLk=
X-Received: by 2002:a05:6102:3ec6:b0:631:26f6:7021 with SMTP id ada2fe7eead31-67c8ef49f8emr8748806137.26.1779779220666;
        Tue, 26 May 2026 00:07:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec6:b0:631:26f6:7021 with SMTP id ada2fe7eead31-67c8ef49f8emr8748797137.26.1779779220261;
        Tue, 26 May 2026 00:07:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322385sm231485e87.54.2026.05.26.00.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:06:58 -0700 (PDT)
Date: Tue, 26 May 2026 10:06:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <osegqij5pitd7fjgpbslddbqgbz7lqrsjoneyep6izwu3kynhx@afvrjqpib7bh>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
 <lvfwkplrktjldbvn3j3jqh7ds25prx723at5t5oobsvhgolngs@pme6jiac5xdg>
 <85c2bfd1-8e69-47e4-a360-10a2655bd43f@oss.qualcomm.com>
 <CAO9ioeUgeo-MiP7pNY16wL9d7LKEi7PR7pJtH=1hMg-mnMSOPQ@mail.gmail.com>
 <4dc05557-ab95-468f-b972-84fe9fa3cc51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dc05557-ab95-468f-b972-84fe9fa3cc51@oss.qualcomm.com>
X-Proofpoint-GUID: 4p-eOi17oj-0Rs9mDWJ7KZeVtTcxn7FL
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a154695 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=iAK14jTOHvnPAZLYtCMA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 4p-eOi17oj-0Rs9mDWJ7KZeVtTcxn7FL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfX0ivyfrAvy0BQ
 BT2q+ytMp45RNAoslLnL0V6n8AA4KRClNNZplazNUWBbw+0Nuug7OJ1AzjOqeKAEsrxMl5sm/7H
 LpaNbUOGvkV/Id7QfbznGWGzpp9X1R5mFm3bcWK/wxQfQHtVfQwas9vkfh37yWmjZ81CSP2MW0W
 RccqALitrs7DOKuxJPfLm7xGimSMn1ZW/4CxXkbl5h8LnMFkJFjS6U/hmL9HnFLar19W97fbgig
 Dcf5XWgr1VdliOXRmqHaGReBvg3lbDgP8Lgh8uWSS9nix/wLqWjvwSXOqFnB34a3/nlASSGmyHf
 LPWlN3hITmITF8QFlDmlWugQKbCgluhZwzTcS03Jc9/IldF974PDYGuOrY872LIF3NewCXi+9hP
 U7DKOlNIMv/9z4KsU6RW2MXrGM4GFYLphuLLBU49wGOWs/uVAGvyEFyBYSI4nIO6XAg2tdOhqsn
 rqbwDXDaC3cZ118x0jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260060
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109731-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5525C5D1793
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 02:59:31PM +0800, Jianping Li wrote:
> 
> On 5/25/2026 5:35 PM, Dmitry Baryshkov wrote:
> > On Mon, 25 May 2026 at 11:34, Jianping Li <jianping.li@oss.qualcomm.com> wrote:
> > > 
> > > On 5/25/2026 4:30 PM, Dmitry Baryshkov wrote:
> > > > On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
> > > > > On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
> > > > > > On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> > > > > > > From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
> > > > > > > 
> > > > > > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > > > > > getting removed from the list after it is unmapped from DSP. This can
> > > > > > > create potential race conditions if any other thread removes the entry
> > > > > > > from list while unmap operation is ongoing. Remove the entry before
> > > > > > How can it remove the entry from the list?
> > > > > Multiple threads sharing the same file descriptor may invoke unmap concurrently.
> > > > => commit message
> > > > 
> > > > > > > @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > > > > > >                     return -EINVAL;
> > > > > > >             }
> > > > > > > -  return fastrpc_req_munmap_impl(fl, buf);
> > > > > > > +  err = fastrpc_req_munmap_impl(fl, buf);
> > > > > > > +  if (err) {
> > > > > > > +          spin_lock(&fl->lock);
> > > > > > > +          list_add_tail(&buf->node, &fl->mmaps);
> > > > > > > +          spin_unlock(&fl->lock);
> > > > > > > +  }
> > > > > > Is it expected that userspace tries to unmap it again? Or why is it
> > > > > > being added to the list?
> > > > > User process can call unmap and fastrpc library won't call the unmap again.
> > > > In the other email you wrote that the driver can be used by random apps.
> > > > So... what happens if userspace unmaps it again? What if the userspace
> > > > _doesn't_ unmap it (although you've just readded it back)?
> > > If the same buf is unmapped again, because it has already been added back to the list, the unmap logic will be executed again.
> > > If userspace no longer performs unmap, the driver will not unmap it proactively.
> > > The Fastrpc driver will free up this list during fastrpc user-free.
> > It will free the list. But what happens with the memory mapping?
> 
> When device release is called, DSP side PD is also cleaned up, which includes cleaning up of DSP side mappings
> 
> Before kref_put of fl, we call DSP process release, where DSP PD is cleaned up.
> 
> After calling this, we go ahead and do buf_free of the list

Okay, capture this discussion in the commit message.

> 
> Thanks,
> Jianping.
> 
> > 
> > > > > Fastrpc driver will free up this list during fastrpc user-free.
> > 
> > 

-- 
With best wishes
Dmitry

