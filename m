Return-Path: <linux-arm-msm+bounces-95906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bA3MH9IVq2nMZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:58:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4C226820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D2EC300AB33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 17:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B7D39FCD9;
	Fri,  6 Mar 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxBi4/x5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/mRepfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F73368B2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819920; cv=none; b=PeKCrlIqe2V5m1sD26rAltWhkx0ugaxeXH4TIbE5Q4okS/JrZo48pw2H/fBZAMlq7NvmAj/rTROd+9hSoDXktmIYdKOnH/I/8NVB5KmVeGOv5KYTwjboXKjU1IPUhXD5Q45q7FJ/INc74/wS+wPLQ0WI/YVVMTXrQc8XeJfbO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819920; c=relaxed/simple;
	bh=yJhn913eXVyhifrfb1IBzXC/CPUJgWEjYRDCaXjdlho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7Pva7A3+bv26Qd6sj/OOS+Pg9mhtYzvP+lgNarruDP+H7By+eEHBDaW8SPfUh2jm/EtEagWFDmiuVr3IPAJIiKxV52CI10tNkRtsdjI35ip5sETp4CDpOczNxSUmp0vVh4WcS0kzs6n73jJJcvZ+y7vIHTfmupYfwPFSHxKthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxBi4/x5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/mRepfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1Y2I4115483
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 17:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AFEPCtQae8NhD8mkBa23ITyj
	ffjI+Sm4c4yaSIQQWuM=; b=LxBi4/x55Sc/aX8qDsdDxILFxpw06WRZuIk6o0sQ
	I9o0pNCjZSWvnQaV8h6JEClJjB3IDXQKvUnEhQbaPgSO1gAShfg84uPwd5dW63eb
	CUYmimgfQzB0WjIuEBdA8zttOZg4HtuZgvk3CQ5ixVwazbiWs1ZNMnOS0mbReSv6
	UJujCv9uG1ajcVEoosdkGizqBlDZbrmS2rcz0UMlUIRlXvdfs17gMnZOl9G7GXt+
	tQP4t1u5ETF1G78rTzNMqCyk+DfvpXNozkleUi8Lwvj6bdaLL6Th/UvIZxNncb0C
	rwrsSVjkqK8GGb51Xkspu51ypSACtWG9a3PeQ/pgldCFjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9nu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 17:58:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so55404425ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772819916; x=1773424716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFEPCtQae8NhD8mkBa23ITyjffjI+Sm4c4yaSIQQWuM=;
        b=D/mRepfJs0+kjTSe4IzjfV5TPoAeszKk5bbhmAuirzRDjiO80U/VwIJ7Im8HXQYmhK
         hSawtrlxcfHh0MuVA20U04xhLuizMO1DKTRWvox1QJSZIRSh2gj1PC+9B+emaXIKrVS8
         SzZam3pCflkHm1Ag2fwLwr65Xi3JQQyQAvJiofqVLnhb+5MEWRJiQMLW/dZ+XvnqgrYW
         YGHC2If0Os7JDfDMqQryZxTPLNBbaG5hKHI2D6ImCDSE8dXZUOVgY+SWpe0zURO6YhUW
         BuEI4SbFW4J8+yVT3Ao29Hrp5Oiz7hgp6mRt2T7hjf9fa8OeZeJDCuTggM1VLKfspuMC
         qg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819916; x=1773424716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFEPCtQae8NhD8mkBa23ITyjffjI+Sm4c4yaSIQQWuM=;
        b=EP20o098wwJtXlACO+fFvnoTwrxHZxNwy0N2czKIO4djYc0a+fG6H+JpZ/LAvPcmQC
         mECrL61Nj7rmG0hyR1ePji2FeDqk8qUe/xdvYcqGzdqk0vw8opnBx1qYCJm6VCBl2Aop
         FOrWsh9WvmXxJ+q8Hdh3JhYMNspyAdegWmtEQyQGLwXPj6+7fc8YxKFiLWoLEtwrpnaK
         r4f/6aszJT6w9tVsmBSiuqhcj20WJ+7PE+dQzq6n+ECZerHl/m0PENo+RPADeW6dve0+
         QvkrKcV6z0o1w4XIfgMDvCoSrjaTgG1pXJoDegcSIp5RgYokJ8Lp4+gAoEj4qr1TgTJg
         O1KA==
X-Forwarded-Encrypted: i=1; AJvYcCWRUHx6kp6BG1ARp6qBrbg0/Ug6piXY62iS9ZZarjnoUbmL11MqZ52iuFVeV06gZCb9D0iilT0NpvB4iocB@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrPGQ7r7v7PsB3b/sQ20nJPJDG7junp6GiHgX0YSWfDmVFByG
	pc35H/TrUyl4XTFGlesDI1rZ4Nv/v4wvjh/T6aEFFbafkYN4+CFdJDlKeGrRJ6aDB5x5amxE3dB
	rBg0fqL3r7ha0hGGqBFB9waA7IfM+iY6d/XRFaTNkUhAC1qwqqSiG9aCY8++Hw3IqPdNz
X-Gm-Gg: ATEYQzw+4QcssFuuWzvPyON6JTxPLIDu/SEe4nspYbnTjYUyvTnd4j3xW8pKzdZgl7W
	5l1iWVNTjs5m0uADsg2I5tmEuI61jsXcLDSdhynWJQ0jvbYdCM02GvRyxOcosWFvgcQhVY11L2E
	CY/2a42aVYTIU4rVJdVdTWuBRcIXgqm/tLMNSpa6CaBSsdaC8SNqZpj3avanwCXPHWwquKLCm6O
	BXM+BIqVQVP0VLgIVHqJUaiPhwceZpZxAmnrCzxevahTNZEsfokTSmowLC9hoi2KageShXtQYBS
	f4J02z1WEKilo0gA+Q/hR0QyhOH/isc7K7S7WTWhGjwlhnYHSf0+/ezjQa8YG4olKRjQbwBOHI6
	kHlvwO3IqinJUhAd8VxEeIbNBGRwibEs4ru56jeUijqp9D4ax
X-Received: by 2002:a17:903:120f:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae824f4d5fmr29463965ad.34.1772819916222;
        Fri, 06 Mar 2026 09:58:36 -0800 (PST)
X-Received: by 2002:a17:903:120f:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae824f4d5fmr29463645ad.34.1772819915474;
        Fri, 06 Mar 2026 09:58:35 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2130sm28559125ad.83.2026.03.06.09.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:58:35 -0800 (PST)
Date: Fri, 6 Mar 2026 23:28:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Print error codes in failure paths
Message-ID: <20260306175829.25i5cg5zq5o4kw2z@hu-mojha-hyd.qualcomm.com>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
 <vrvbq6wih4jrq3rorshqpwzxkrwtknwh7pbub4xvunmnvf5fyu@45b7g4zrpdcu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vrvbq6wih4jrq3rorshqpwzxkrwtknwh7pbub4xvunmnvf5fyu@45b7g4zrpdcu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2OSBTYWx0ZWRfX3MVMC14j+X/r
 bT/0jvwCE+eayvy3OPCWwn49wiGhpDn3XJ+IHGHpar0Zq68PTCg36Eg+YoSF1TFiXxidSQFzPK9
 bVqe7ghhfMZMjOWLFWmV20/0bj35NYVZxuCFEXJvWJse8uO5tzGirlVCmo1EWDRGnjaiVfYlZyU
 0lsxB0nFbuu8/OfUbSkTJ4GXcL3N0mo4IQb01w/Eml9PqzXSllqs+C+Z+TQZMYGr4ZdbrH3gkI4
 reNVB+OiU78SoEUOi0k3jEXWtBfmSxAELGF7rVbdFppGrAcARAGlQKv6r5H8m0PWbWP2qTuV94K
 Hobl93UhkGG4zcQI5nMIJ9/Egmlekw9lZb4D5kAUlgPlh3nFjKdKyHRe7vPca2ofn7+9Nv2t9WX
 1E0zQHPeEgZLyZJZYYPtrwtCcz0urhIiJFVPOAQ0zEC8HEEZsttc7VGxByZ0bCP1b8TGx4YCxrT
 bMqrRDWS3L/cCRYrXvw==
X-Proofpoint-ORIG-GUID: NTQi6WSTCyFyZChPjvVcWp17OZ7oW0K5
X-Proofpoint-GUID: NTQi6WSTCyFyZChPjvVcWp17OZ7oW0K5
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab15cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NDkFOniKOsS54aqx_t0A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060169
X-Rspamd-Queue-Id: 0AE4C226820
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95906-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:04:11PM -0600, Bjorn Andersson wrote:
> On Thu, Jan 29, 2026 at 08:53:19PM +0530, Mukesh Ojha wrote:
> > Few error paths in the qmi_interface module log a failure message but
> > do not include the actual error code. Include the error value in the log
> > so debugging failures becomes easier.
> > 
> 
> I'm definitely in favor of such improvements! But I would like to make
> sure we get most signal-to-noise ratio out of it.

I double-checked and realized I was misled by downstream code that had
extra checks and returned errors without logs during debugging. Hence,
this change was made. For now, we can ignore it as we are already
covered

-Mukesh

> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/qmi_interface.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> > index 6500f863aae5..941612b1bd2e 100644
> > --- a/drivers/soc/qcom/qmi_interface.c
> > +++ b/drivers/soc/qcom/qmi_interface.c
> > @@ -321,7 +321,7 @@ int qmi_txn_init(struct qmi_handle *qmi, struct qmi_txn *txn,
> >  	mutex_lock(&qmi->txn_lock);
> >  	ret = idr_alloc_cyclic(&qmi->txns, txn, 0, U16_MAX, GFP_KERNEL);
> >  	if (ret < 0)
> > -		pr_err("failed to allocate transaction id\n");
> > +		pr_err("failed to allocate transaction id: %d\n", ret);
> 
> Seems this can be either -ENOMEM or -ENOSPC. In the prior case don't we
> already have an error message. For the latter, is it realistic that
> someone has created 16384 QMI transactions?
> 
> >  
> >  	txn->id = ret;
> >  	mutex_unlock(&qmi->txn_lock);
> > @@ -413,7 +413,7 @@ static void qmi_invoke_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> >  
> >  	ret = qmi_decode_message(buf, len, handler->ei, dest);
> >  	if (ret < 0)
> > -		pr_err("failed to decode incoming message\n");
> > +		pr_err("failed to decode incoming message: %d\n", ret);
> 
> As far as I can see, most of the qmi_decode_message() error paths has a
> more useful error print already. Which errors have you seen? Can we
> provide an even more useful print in those cases?
> 
> >  	else
> >  		handler->fn(qmi, sq, txn, dest);
> >  
> > @@ -502,7 +502,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
> >  		if (txn->dest && txn->ei) {
> >  			ret = qmi_decode_message(buf, len, txn->ei, txn->dest);
> >  			if (ret < 0)
> > -				pr_err("failed to decode incoming message\n");
> > +				pr_err("failed to decode incoming message: %d\n", ret);
> 
> Ditto
> 
> >  
> >  			txn->result = ret;
> >  			complete(&txn->completion);
> > @@ -661,8 +661,8 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
> >  		if (PTR_ERR(qmi->sock) == -EAFNOSUPPORT) {
> >  			ret = -EPROBE_DEFER;
> >  		} else {
> > -			pr_err("failed to create QMI socket\n");
> >  			ret = PTR_ERR(qmi->sock);
> > +			pr_err("failed to create QMI socket: %d\n", ret);
> 
> pr_err("failed to create QMI socket: %pe\n", qmi->soc) seems like it
> would be more helpful.
> 
> >  		}
> >  		goto err_destroy_wq;
> >  	}
> > @@ -766,7 +766,7 @@ static ssize_t qmi_send_message(struct qmi_handle *qmi,
> >  	if (qmi->sock) {
> >  		ret = kernel_sendmsg(qmi->sock, &msghdr, &iv, 1, len);
> >  		if (ret < 0)
> > -			pr_err("failed to send QMI message\n");
> > +			pr_err("failed to send QMI message: %d\n", ret);
> 
> Ditto.
> 
> Regards,
> Bjorn
> 
> >  	} else {
> >  		ret = -EPIPE;
> >  	}
> > -- 
> > 2.50.1
> > 

-- 
-Mukesh Ojha

