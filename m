Return-Path: <linux-arm-msm+bounces-99446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJMyHubJwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:16:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 100652FED5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C87A305E35C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1613384228;
	Mon, 23 Mar 2026 23:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boGqyvdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lvv8FWsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FC37FF79
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307559; cv=none; b=qWItnN4L6QCe8BH7bu1FCGcazKSTT7yQe7lsxoepCsoxvfXBxTkQ+CZqhniuLRoHnf9Xv6DBm+m/JLsN6BU8Tm9hJovuXsISeSkc/EIj0PsHV4tjDt42XQIpep8Nfm3i4BXG+apE3m50dBHV92R5KSz9eIa9XPaWA5bKKK6+/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307559; c=relaxed/simple;
	bh=u3k0L7eC4z3JMP4qLzXLeQhLtTu1Q7rpHXDyahGDVEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt/lvGiphp+u6swg6fPh3MOaMkpsS+EGmqh2iqSjOir1hWZf/pYOittAZgx9MlQzkls2W/oSuPGRVECmysdv1j3M0oYkAJMQsHtA+gciGqRwuBGQMELS9dfeS067zW6E3xL4t6SD8HhLibbN/zVFn0/QV08c0AjoxzSZraNHB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boGqyvdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lvv8FWsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqiCj3171141
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d8jeBjHIdKgRSLmkKWf+DcRp
	oUVB2Zuc1DPQEC6/awU=; b=boGqyvdWXDjNd2aKeBEy/+FzUSlFMZLELf3/qBD3
	y0pX3O2UpxyFkAqWwqwMsNCU7b9YM3eSgVEEr5ohFvZGCXhWP1KAuHRzrETKPzz3
	QTtJdUkdg9A7U/DDK8c6tOwqnt93sUCaX9e3nJKe9ozK/8Sv54etVOMiUUgfP9kc
	gggxNHvJBgxEb/aHShW3nctOnZqsTJVO6zajhLu8B6yaK6jgJmX6MdiKmzFVWldb
	v+QZ3eOu4FsG8bMD8lTDJN3s21zxeUQRZGofFYH1VwCYPWwSn1KTrPiyQhTuFeqa
	eEh6KW3M4XUggL89k7zM147cp01rWfjAhOfkFnJ9dR2fyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r221yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:12:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093025ffecso91807641cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307557; x=1774912357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8jeBjHIdKgRSLmkKWf+DcRpoUVB2Zuc1DPQEC6/awU=;
        b=Lvv8FWsGlZkZbwhgpv4UF6ab6QO78/KFx7fIzh0r929sfjN+6eBe4FaRR8rHN8AafF
         ul6HdhB2AClZY3PMHHRilTK/bzWGiZKz4GdaL5vs4pQ4btjivAuIhRfe38n/7i8YKs4g
         ejf4z4erHRLkaUAj1SzQ09Lgx6sQ/E0Y8I68HAGgKWGFpWF8KoZ61sYtT6dfuVRH3pmQ
         g7f0poyaDWpPdT/Iqj4djmkV6/NXfL5mag0SaDN1tUtZ4bpDAQVI9s3Olt9NZ5OX3jdT
         1o5ZUgGcI4QtNmQSxfaNh/EKykW7orCcbYQj3wHP4xhB18FzDLG+xaQ03ZHW4+gMlJTR
         awrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307557; x=1774912357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8jeBjHIdKgRSLmkKWf+DcRpoUVB2Zuc1DPQEC6/awU=;
        b=LeszJbxQ3tt/dtUqCnFIjE4SORDwGK3xvA4Zm+rIJjmAcOxj1jI1v33mcz4KWm91gY
         WP5lKWhei2QPtNZiijNV5YNcY8n970xCH3DH4tmJGF6KwodN0QLLH5+c7qQ5PE6E1OVA
         M3ehStJpR1W5gOKpsWgN9IdeawF7GPTOasG7MmxQlr92P9ibP6SO63nFIuLaVZmbFXfG
         I66FPIqm4iPs4YrjXpKXMbLnFEz2Jt1Zha/JdbeuyGlzZS9nrD+R9Ym81wMibCHyQLrs
         ++GmU0SU3MOBWn6mrA0qod96s6irWB9RkW7okyZc2r7vV22V+hYbE8ltDBM7otrwZBdN
         axbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqosQT5lVVfP9XctRHi23DD9pDmkVE/8fyFvYdsAln0cWjKYDF+lP1gW4ArwRTpwUrihsvbqOkqIQxvHye@vger.kernel.org
X-Gm-Message-State: AOJu0YwBC8Wxsyj0ZmOd1slCk1t20pcWTGs9tBAO0tYgnQSWnbF2TODh
	LuLTsdzEr+Fn5qJrrmSNBrYk5VnV1bGYo0sfAVQ/PkNYKzJwmtZITK4dOokKCmfM1w892TMB/Aa
	VyJfhLXlEyqHdagLSIj7iq5vbRwIpQhfid14x9PtSxHTiU8TQsIwXD9oxw45y5R/WYgAk
X-Gm-Gg: ATEYQzxGO+SYZ02kxnVDEh9WSTm7jFbi1Qf9sLA2Mpue3hTHo1JspHKMD89pP/WJjBU
	jargGE94EioF6U2arooh1z84WncWw58ksDQ4Rk+dwsxzE5nJN8A4nvCPraILd07EEOJ3cZXSfsm
	JTZE7OQbc7diwBtnIsAXHmqw7GtVN7ObV/E6PpFPLwz72z7HgHHHOdmRHrO/GzA8abhFJnnK8PG
	38MCZmCUPdypoLzr8d++QfGp/RfybSlky7Tik7snLAQmbiP98nT6lXKHGRb8Z2Z0RmPruNwA7Ci
	qdPBLvQpwcpP855FW6w2WRr0yVJC3C30eqpa++JRR0bgMz/xkug5/1F46wwn7DVVhrzhJgOi4w7
	gh8hU9Ddg9IqEkFd4ecJ226Psr4qtzQ2b6ZuajVLE9qdtLXwKl3f5T62ztOSqwGiPVjj6CY15cu
	ywiAw8Lrw8SH7Ga9nXvi13nJyC1TMKkzQtXTI=
X-Received: by 2002:ac8:5891:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b37536d3fmr203191121cf.59.1774307556719;
        Mon, 23 Mar 2026 16:12:36 -0700 (PDT)
X-Received: by 2002:ac8:5891:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b37536d3fmr203190841cf.59.1774307556187;
        Mon, 23 Mar 2026 16:12:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ac33dsm2858228e87.31.2026.03.23.16.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:12:35 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] interconnect: qcom: drop unused is_on flag
Message-ID: <ky6o64toksq4ozbbad4i7mrmrqjkq5ffphrwdruejq6godxco5@ds2een4mht2v>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
 <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1c8e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qbyBQusODcNATh3rj1kA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: G99mRmlyTzLUUC1Y_Bz3Vv8cbnISFq-L
X-Proofpoint-ORIG-GUID: G99mRmlyTzLUUC1Y_Bz3Vv8cbnISFq-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfX9KtMv/F5yidI
 /Xp94aRFxkzs/gnL2jr58B2S3yiwkK5kXIs6kMnwD/o5QsqYaZsiqlvW+cU/aU2zw/WmFHj4ed4
 E2FX4s2nGXIVWI5j/mHczMfRhcmf/rEQO+vK/FrmNx8qZuAXj3wYI6P9BtsCnKkQol0knTwBxPi
 oS6UYhKRY2Yb9Hqi1hQayGJej9Ec4vm0IOxm1JFMS43vRm2tPEmw1slzm0QA+D8SPl3nBf+15u8
 rh3Kz28Xmc8oKd/0kpbIH03DBMSfQlFFSM7qfH0uUyloTKZKPYH78Ko6rkzzRFtoxOdjTzdw+9O
 FJVYgRtvecdqUwalvWr2ExP9on6jL745skpIk9IgHT7Sr3KrYkur36U+lRYo1X/0Hyuegq8E316
 U+LKjBYa4O0uGqhqJ9pXGVRcXx4EFJ/ujVNw6Z4qrZEErarA41778Xasaxr7Z82ZgI2MCDtbgiZ
 lxuAP8e+qf15UWVmyRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230171
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99446-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 100652FED5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:26:47AM +0100, Konrad Dybcio wrote:
> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> > The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
> > clocks") has added the is_on flag to the qcom_icc_provider, but failed
> > to actually utilize it. Drop the flag.
> > 
> > Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/interconnect/qcom/icc-rpm.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> > index f4883d43eae4..3366531f66fc 100644
> > --- a/drivers/interconnect/qcom/icc-rpm.h
> > +++ b/drivers/interconnect/qcom/icc-rpm.h
> > @@ -51,7 +51,6 @@ struct rpm_clk_resource {
> >   * @bus_clk: a pointer to a HLOS-owned bus clock
> >   * @intf_clks: a clk_bulk_data array of interface clocks
> >   * @keep_alive: whether to always keep a minimum vote on the bus clocks
> > - * @is_on: whether the bus is powered on
> >   */
> >  struct qcom_icc_provider {
> >  	struct icc_provider provider;
> > @@ -66,7 +65,6 @@ struct qcom_icc_provider {
> >  	struct clk *bus_clk;
> >  	struct clk_bulk_data *intf_clks;
> >  	bool keep_alive;
> > -	bool is_on;
> 
> Hm, looks like the clock vote is kept all the way from .probe()
> to .remove(). I wonder if that's really what should happen..

Well, it's probably up to you to decide. I've a bit lost my way in the
vendor's adhoc / bus / etc. code.

> 
> That's what drivers/interconnect/qcom/holi.c does on msm-5.10
> 
> Maybe "iface clocks" are only needed to execute a ->set() on a node?

Hmm, I don't know. AXI clocks seems to describe the clocking between the
NoC and a particular device. So maybe it's required for as long as there
is something using the NoC.

-- 
With best wishes
Dmitry

