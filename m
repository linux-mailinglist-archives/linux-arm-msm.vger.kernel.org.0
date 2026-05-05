Return-Path: <linux-arm-msm+bounces-105958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLgdNO7i+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E284CD85F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA04B30471C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD61642DFE6;
	Tue,  5 May 2026 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbfqLMlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPm3si8Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6942B720
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984193; cv=none; b=VpMGO7Sx5WfpZw9WVMeiyT7maC97PkqIm0YEfWmuBUvU4GFcioClV8N0zMPVgL2ccywFj3PAtrXhMNU28WYijSiFLoW1zEAGlufLtmezC47gWwT5nwhbGQzacn7x6hLW26M1miP/5fSHF+rLJovea013zSa/WDfoI6vlhXzwheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984193; c=relaxed/simple;
	bh=Cn51ePjUUcESZFXs4cU/XV6v9vmZu4pMaQvURdoADXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hq+CS/lfivyZ7qfKGrH1jSEk6Y+ePjblIqTMAwsEcW1n4/0gkCzzpeJbnXuxrb9ngqABP44khHIoECUg40XlzzRFY0McOmGQaklEnABREJn2LlIfW2+2gvqPDDeoU30tvDUW5a2vQ+rVWndK15ErDZgdk6tYxSPi7KfCo2uYook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbfqLMlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPm3si8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459A5443409777
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ly2WudEoWjl5NvunnKE2kBuL
	le68whP55xqm57rb0no=; b=QbfqLMlQIl1F9nNhLGQyycHSV5Y6IozVMeC0jfJ0
	r5dT0yXWBBoJxiWyAtzxHHgBHHlhruExfGznMA4rNGqYfvcPaTTTKndb2qfe4LKL
	mokhNGvcxz489xAADIy46+Aaj9zE/LInrqW9H3ZkpueNTECC3qFDmuVNlrUOhVkJ
	TksV58cGSQ33fJDI47Fqe4/tm06rmCKXmgPhQshv6XI/og5SbmnfPifIjliUfRLd
	csrsW6qpVcnw5yz2YfdkVlU6e4zLUqTzDmaMocQdCCPdnqpn35OJi5w/iY3WE3Qx
	NbTd2PSTcHPelcsd77Fo/pIsKPscbzGu30zJURJLtD3edg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00v1j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:29:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso70515711cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777984189; x=1778588989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly2WudEoWjl5NvunnKE2kBuLle68whP55xqm57rb0no=;
        b=PPm3si8Q6K4m3CgyoNWCFnyEoso/MSG5KT9/WluEOEQYNdpTM9Q71m4g1hgbV4ua+L
         vjY9yTrPnBmB0ZSj6aRKi+c8xHWmSFPItj4Gw1WXvstdEbyFmqbTde+ofagkBTuPzroq
         uzphY+wLavH6pDXN38YpPXj+Wbnm4L5SMooU7gdyVug5qym8/+xkKN5z+lBCYZuiqOw6
         W2FvoIwoXnG75rjFKUpJzzn24EXAh2qHeeXF3kDZgUyER9oC+vsaisWEVDn2MN9cCuCa
         /0dod7GayNNZjW4vmo0ylbMNIPmY8s68u8bUa3ZjAydSN3nEmlWeUqYsMl1Q+OCz+F/3
         vmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984189; x=1778588989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ly2WudEoWjl5NvunnKE2kBuLle68whP55xqm57rb0no=;
        b=eRqAdBzdmoBNxlqwbvPfj7ocQisGkYgGJE7AEAlwdzVHwrFIVnBZW5jP3Avjmec1gA
         VmFVnWe2L1SJyFjNIqAfT7kozU25kIrU3n6pBZdquQPk/5UFHm1hHAhA1UYH69IrDUzs
         48jU1JIC6WvMCaEoLFSSv6WvFsbww+Kxn6hIpDPRKNkJTHnMD6jRaHzqlMys1QUn63nA
         hFyceKs1IxtquEQhhUToyReEgMkr/llB2j//+3AQppvwYVcxD7QBOBXN36+3J0hZm+Xu
         khvqgmXXvosQG+/IpNdj74Zc2Pw9k2/lpUiIwGNk8zH40j5NBUj4oKUYPRYiwl7Lvacr
         93ug==
X-Forwarded-Encrypted: i=1; AFNElJ8SK9gV3rU44wuoW//XTKz8OxN7308nO+g1Vmez0w9NAarEeQyF1wh67w+FvP7Id2tBiQw34aKunxmisUnj@vger.kernel.org
X-Gm-Message-State: AOJu0YzN8dNmIMfG0T0DDRTie1qjJaXPaT70E+7pzQMvtW1yIsq0dtoK
	D5Y8p5i8D5a1KW2NBzyIJP5nnJ3CcvHYkLmwcxHr4Lo/dusmXj1oES+8vH/WoU49OaRyyfWloWf
	EHck0atMRuuPuQ2EC89PYf/kRiRhRKJwb9YbtqYY5Era8KSFZ5GFWXVI5Ic3+Yrkyr/aV
X-Gm-Gg: AeBDieuJW3MjcIbfSXu2AG2Bv+2xITUaN9n/RaqFndV5LVOnUZU419NU32MoP8cqfV0
	ug9FlZ+xzsbPgu4upxeHEC+1MLJUKcQk7/FozK1KZ0rXYYztOYgacaTtn32qnweQzVFEQVTj7Zr
	jhnim8H1HuQnJrVKMtFuHo1nfaQ7xgdbA3iUbre1tGfi9mIL8/uYyC8nVrqPDnU22d+TCadW/X5
	srX53+ibsUTs951raLbIaFXoyhJ8jhLWesHOzmtKBQQpHpPml6VSsIX5rT3DWEVrPq79FI3aexe
	PiwjMxoASIQqWHPV4Eb1EX6yzw10/Db5/z8h+t9ZfP5DSDHH1RDKsA2DdwjY43pxKVjax+yZpn4
	sJbI/r4ewDo6mfxm2Z6QJz4dsi0i8iRyfP/FRYvqqtx9rCOD6hJPZrVE+aYZIkxSm6UD9wjP0wU
	o4Il4kzBy8kev1V2tR0IOgd8J6Ah5hAwzRxxZQ2CK5+La6bw==
X-Received: by 2002:a05:622a:13cf:b0:50b:1e5d:992b with SMTP id d75a77b69052e-5104c15bca1mr197485771cf.54.1777984189252;
        Tue, 05 May 2026 05:29:49 -0700 (PDT)
X-Received: by 2002:a05:622a:13cf:b0:50b:1e5d:992b with SMTP id d75a77b69052e-5104c15bca1mr197485401cf.54.1777984188676;
        Tue, 05 May 2026 05:29:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c342498sm3810332e87.68.2026.05.05.05.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:29:47 -0700 (PDT)
Date: Tue, 5 May 2026 15:29:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Weber <thomas.x.weber@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Thomas Weber <thomas.weber@corscience.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Fix typo
Message-ID: <zt6yi3q6mirawiosllor6oylys7fkf2rwm4zsasotanofy2fgl@xh7gwbhxqmxj>
References: <20260505122412.59208-1-thomas.weber@corscience.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505122412.59208-1-thomas.weber@corscience.com>
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f9e2bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=YBLqvuP4AAAA:8
 a=EUspDBNiAAAA:8 a=OYyYjY58rp-n0skpd8IA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=mCMmONcAb4nW8Nt5RVYK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfX1pKhB8BiP81S
 QorO7ELZEJr1/k8y3fI312USItTlXBxqVPC45vVSWrVcZbrT9gn3+9qY7pHOQFhV1mIXNQN6Krn
 dNc4qxgXQ5MzVHa1avu5iAswj8FYe+QPMeGEq1Z70mFYt8t/CWqucyanZOcs4wlgcPWUmI8Car1
 Bti5UGG5el5W4fTeTU9TPJXZDB05OGtEONeD60JPCcdyBDTFrUBF8HJlfz36MgJJmzmtF/B9JOA
 siHX64irTIME8cikdTqaB4/OK4XBYavqitWwKGLbi+31rP+qOe41mcAu4bJvk4Cthh0H+zRRfPU
 QvgsG+/BiCCL7L/D62wUAvYPEYGbvwjzWTaxTcnJfw3zHtb9ViH453v7QZy1tWVEW77lA2g1GNR
 JskMsIWqxvFN2GuTcaTecBBODzb0IQDnWWQRP4jUeizK+73RF3bzNlI8UdgkXFAUWhcMiJg7fWM
 KpqOnh5DjookFCyfQnA==
X-Proofpoint-GUID: Z-_ucvFcaS-Za1DEYXeXdTVNZVeDwHVG
X-Proofpoint-ORIG-GUID: Z-_ucvFcaS-Za1DEYXeXdTVNZVeDwHVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050118
X-Rspamd-Queue-Id: 57E284CD85F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105958-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,corscience.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, May 05, 2026 at 02:24:12PM +0200, Thomas Weber wrote:
> STRENGH -> STRENGTH
> 
> Signed-off-by: Thomas Weber <thomas.weber@corscience.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

