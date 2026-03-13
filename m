Return-Path: <linux-arm-msm+bounces-97310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMegKzeHs2nPXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:40:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DE27D2E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 996D4305DD12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E76F35AC35;
	Fri, 13 Mar 2026 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcDW0IOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLboecII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21608331A63
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773373232; cv=none; b=jc8NhusLLT9bB+lG/ORZvEnUFzAN0q/nBZoj56MfgakLXQ009PODjQ3PwuGbVkzUw8VGNLIwklOzR0U58LGq1DOx7QL5bN9GlwqzTee9GzZBHpGuBPc4bU1SKhiWIlHQ6Q0C7fUBlan3n3LdoqsvCAzHWT5mdIPHcvxx1/kXwQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773373232; c=relaxed/simple;
	bh=ltfiDfE5g5QX5g0lY3vlmncGCmA0gES71uxsyvPSnYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKs2vvUwPRP8hltk6QgNEkrovqqPEP9j/6lilRHQDRw/3yT5tnit/l2QYQdrpkJ7QBeJVqX67KNUq/xXBBMihljRAbTFw6kINgTwo25WIY2ifjNVyOO4hpHZM2eVfMqoctEpfxx4T8vqWdGmnKnguKp6cwub2vAEPyNJaGzdPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcDW0IOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLboecII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CIBF3m1922473
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=soEEFrnJQV4WHOjC4LmqXnEi
	VPaJ6DsC6HzsKtXirtE=; b=OcDW0IOX8DiRuMOWbMLiaqj2cc2fPYtrLgoalHmr
	VLs901+9+eD+dSKPSHWjKB1RuCmPLrstfkzpqOfoARO5MxIpNp0sFpqkXKN0XJf8
	wlzm/9djEt+8K9eB5VcZzP3yaV/Q9YHtFegqXVe2PiGFPIU7H/Zfz+nhLdIAfzpY
	LQdmtnTD5k+4w0Nv3mA+VokYxaMUldg4J/vpIwin0TguOPFqvWMYYCTQgYee5Blb
	bdmNpU/tn03y2FR5JnQgc1uDA2hQ34xmdR5p2UNvOwXBNw0TXQ90iKkkkjAdJlPF
	X34vB8maTZInbz9NbQlZyxIm4Ok+MWtj4JVC7H6qvgoFqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wvcab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:40:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a25c5a9so968048285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773373228; x=1773978028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=soEEFrnJQV4WHOjC4LmqXnEiVPaJ6DsC6HzsKtXirtE=;
        b=RLboecIIy3bbBziDSVLesmVNSq7LmqL7Uf0niQiRzcilay4grevdaj6wXhgMtTeba6
         xI7nCRcvg+19n+X9KCAMYYPpbsipbHDGpSB9VbLVDwIC6Vh2dqwwdFxGkjX6+pWFMlpU
         5AmQx3TK588yfsAbNs8VEpXRwaJu3VL2/VHprjX1R+02zbvwlwst69FNg63EGbelN3rr
         IMCQS1C1CVvIYk10Awvh/UA15EwmzJqVhoXztNOoNb9yWrHlCQbAGVnBZHfKl9FhMYls
         oIs+zgFMCJTkoG7sfM2JnZVaXhczlqznA8Bnjhb8kfHceF7XgDP6Q59aJXBxjXAeSHKB
         5Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773373228; x=1773978028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soEEFrnJQV4WHOjC4LmqXnEiVPaJ6DsC6HzsKtXirtE=;
        b=MQGOpe0Wql3ZiQSdrhYV+lQd46V584E8feVP4R2AAs7dDaAr5/U7Jt7ZPLPVqjS0l6
         gi4y8Mu/YXNr/bWEYFQWOnmdHN5QPAunc1GTrLJahJlMIy6b8QEBqIYOXvJi3pE2v1Hv
         zoTb46FMg6uiRokLJzUcux7YQVYplJmQxTTxoDKkpx1AKa2VQNsSUxoXUEiVW3lUdqSy
         S9OZR6ZwNoKidNBbmaV1bl4IjWCVjHHbkB1nFLpMOwC56uvAGuHcsrp6IhMMj1CMXVeK
         B/F/l2aNOKb8J6nHsCGMNDh+CCIkjrpzz5ji0YWOFzP+Xbhb6Hxh9K2q7QzDZleipjpe
         cgOw==
X-Forwarded-Encrypted: i=1; AJvYcCWt8MN+UJp+fb2f74MWW6u0w7HlA9CDwn6xjVUyuaIdc9cMaaneZhRhr4UUVLSjuxxVBgXc2hZ5AOUgQBf7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc83z/Vro8g2F/I4R6i02Ssuvy/zRRRwh+oLwzjQa5sAXx+exN
	KrrwyDbyvYEhldB2xcGKi1qOgojDuO3kp4Kfb8Kr+EKEyih1GJW2bOR2dj5okNsCzZeCXQW1sUU
	0u7wIkFESkrHyRWBur4pIxUwNGzMhpZQTvHvZUkyoMl6dOUNgZSWFpRxczbX/hMx6EhbH
X-Gm-Gg: ATEYQzzCBpnZ1CRYHZKeFxXsk0aLY/yST4dTfubYCbUrF9PBWqCfeg389ADeLx9KJjG
	7rTTsmb+w0WJUBTXtuhFdLiguxfbkllk6X+93vy0Lo7CC3+0jh1NgKQCjUsEalyrjs+WF2gyPC+
	EDUAc1bXV5OwCJOtrrS34rnZceas7BxfsEJUBVrylZ+lt1Jr052QG4qNh4jLc9I1bgXUowrVEF9
	RzpI0nOfK6xoCy7hYUpL4wBv8CXi9EZZXPEriW95c+XL+mrnGWO52pJo9S9QWivPEK9mclw7VWt
	Zv5KZiHO7Th9iEGU9PpCKINnAp11aGRLfSR2VuaYGJrFU27Ia9nk2mSyMtHcBaS0uEER0t2AqHz
	pOHF4pclNec4wdksSeoVJ/+zbXkd6noVAZR8ydNL05MkAStcxqSkN0ntnCQ5hEL2XVX7mOE5rGF
	y/+iJGPY/nlRXvFM59DDHVIOXgdQhpCLwk3S0=
X-Received: by 2002:a05:620a:2802:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cdb5a8d001mr285941085a.35.1773373228198;
        Thu, 12 Mar 2026 20:40:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2802:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cdb5a8d001mr285939985a.35.1773373227693;
        Thu, 12 Mar 2026 20:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ab8sm1274609e87.51.2026.03.12.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:40:25 -0700 (PDT)
Date: Fri, 13 Mar 2026 05:40:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <55oglwp3ejolkjyksn4am2dnx43k7axf5zl6tevkuuuww3n33u@jcffxhtaxxaq>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
 <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b3872d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3lGklYKCIXtHXvz2TNgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2ka46dhMx4DDcCY2F8l8yN-2Lm7gKoJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX3hXYtk3gg1ld
 SrmBT3HxAmpEfyobw4Sq1BB49gLL6JkvmmafhXYuwThXDdT9dxapW2z4bdTKGO2zZNO6kqJZsVH
 JfmGprNBxuVMyEoKyYwZSTGYzFsjGDvaccZNqrOJn5htTY2u8sjSnF0w141EV6hFTEdRt24bzTE
 FUvRizMfjfXwXjocStq1oV13KRxv5YPjl13Rq5xNQwF39sb0DzcJUtcEBUPFc7p8XIMJsKOoDvZ
 1xska9yxekcXtmNzxI4KPrltRzvBFUuOFH61jJ8KY71TQhgmSpTg+ZLEC3G+5BLiSnFBG4NLgG6
 ZSRSu9oRJgsV62y2SiiR1jpjR3qsiynEnjbpFLvZD6p4SsCrnfzXcUO/WWHOtEArHd3l703axHj
 lOzpAg0LfpD2BNu/dylREuSXT/IdNMo0Z4HDdxrXB9mkshWX1X/phdVzGqMfLfF3t6Nkec0S1TH
 NUKT8APUilki2WSYwOQ==
X-Proofpoint-ORIG-GUID: 2ka46dhMx4DDcCY2F8l8yN-2Lm7gKoJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130026
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
	TAGGED_FROM(0.00)[bounces-97310-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 713DE27D2E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:19:18PM +0530, Mukesh Ojha wrote:
> On Wed, Mar 11, 2026 at 04:34:53AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> > > Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> > > Peripheral Authentication Service (PAS), always map the MBA region before
> > > use and unmap it once the usage is complete. This behavior was introduced
> > > to avoid issues seen in the past where speculative accesses from the
> > > application processor to the MBA region after it was assigned to the remote
> > > Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> > > before handing control to the remote Q6.
> > > 
> > > Currently, most Qualcomm SoCs using the PAS driver run either with a
> > > standalone QHEE or the Gunyah hypervisor. In these environments, the
> > > hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> > > Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> > > reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> > > violations cannot occur.
> > > 
> > > However, when the same SoC runs Linux at EL2, Linux itself must perform the
> > > unmapping to avoid such issues. It is still correct to apply this mapping/
> > > unmapping sequence even for SoCs that run under Gunyah, so this behavior
> > > should not be conditional.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
> > >  1 file changed, 38 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index 3bde37ac510c..033d618ccba9 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > >  		return;
> > >  	}
> > >  
> > > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > 
> > Which will be called once per segment. Move this to qcom_pas_minidump()
> > and call iounmap() afterwards.
> 
> Good eyes!, Ah!! my bad.
> 
> And moving it to qcom_pas_minidump() will cover minidump cases and
> fallback cases to full dumps if minidump_id is mentioned for a
> subsystem. However, we may miss mapping for pure rproc_coredump() case
> when the framework assigned .coredump = rproc_coredump when vendor
> coredump callback is not provided when subsystem does not have minidump_id
> mentioned. Do you think writing qcom_pas_coredump() wrapper over
> rproc_coredump() will be fine ?
> 
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -141,6 +141,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>         memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
> 
> +static void qcom_pas_coredump(struct rproc *rproc)
> +{
> +       rproc_coredump(rproc);

It won't be that simple, most likely. You'd need to call ioremap_wc()
before and iounmap() afterwards. Then it would make sense.

And alternative option would be to use
rproc_coredump_add_custom_segment() and add a custom function which
would perform ioremap() / memcpy() / iounmap().

> +}
> +
>  static void qcom_pas_minidump(struct rproc *rproc)
>  {
>         struct qcom_pas *pas = rproc->priv;

-- 
With best wishes
Dmitry

