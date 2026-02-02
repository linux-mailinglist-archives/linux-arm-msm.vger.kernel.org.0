Return-Path: <linux-arm-msm+bounces-91527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jueHMgjCgGksBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:26:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C0CE2F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 506E33012427
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC90D37472B;
	Mon,  2 Feb 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLiUWCfY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNN1+605"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8304D1EBA19
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045928; cv=none; b=N0PJdK5bEo1dSImXeapfPZsHgE5SLrBs+IQmHTaVbf6znRYxKdvcRFzUyVkVCBwu0WTa284m3YuqoLIOaZobNZSsXLOBdCtiUf39v8ZUjWz3++5YIafFz+yreIk3VP7pmZ1Dqjxc6WOyN70WfallWzGqpBVpDA6uwkVV8905o2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045928; c=relaxed/simple;
	bh=oC3K9QcgVvVXAMz07uN8yyexhk1+HnYvnwk/8oczFI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSqzuShGx1ktxRLOyxphQanDDKRtNKUV8qWyq0RROE9AM9FXpWHAM+0zKvtP9h6uyTqZE/QL2x8kS9Sh12fJShmEKMJ5kPNwkPmMG64YHKhpq2/Hlu+iph76nO2yu11sVdlIJrPbbrH9qQYiaiqGzgsy2WS+a8I+OaiQATlFvgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLiUWCfY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNN1+605; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AtIjY3915994
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kG5yXRVCYLlGCi5qx+ggn4yP
	f612jvCEPPTrtUaE+rA=; b=hLiUWCfYPr645NJafl5FXjN3LKslXY/fsYw6CM/g
	LyKHVbvzhFPmujw8QayB7TxcL5kx8CxTUgbyrRHPlMd0v0w3A6eZIdb+dbC1Dlj9
	qM2DY1OZByZPKvSymP7nMwUaIrFBTDtDv0iOTsboA8ixearH6qmgxqbvkYywH83v
	674+p02EDkkmv2aFCM8vscWN+BEG9f7ws1RCyC2cmaeXTok8qFsPCV7A0H8SfGZ4
	FnRf2UVj3IEDociCbnWci7K4mYbqdW+0vp1TVdzYGhcJN3CnomKFH8WbUvEmMH9N
	BO5zarpK/RsSHQFW4aysdQK3tZK3h06Qp1QhulDv4KFvKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmgrtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:25:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so1223334485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770045926; x=1770650726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kG5yXRVCYLlGCi5qx+ggn4yPf612jvCEPPTrtUaE+rA=;
        b=QNN1+605UZ4CfkggP9+nq77kx9iMeg1HYOBtaWC6fL92wqYUq5w8JaNGHcpwkLa1hY
         jNQtmkBVNPVf5DIbs0xHy5OXaDY7sTuh70+SRHECZHqBacL3YqXufWv1QO9o0ICIhicD
         YAxeq7bZunFvbmrI9R4JzYit9JLVNJVjY6G8USZy0R8pfdq5T2M58APDlNZV0kiXykHH
         f7oRVzw4KzE29ln/ycOD5yrrej7HxsmppTx13W/cXVVjH8tnCCsnlUGy1SipG7AvWN/g
         DYlrhZN6kCe7AT3HDlhwK7y4tNUzLPtFjMHaqw+0uXurlw8dJLQPQlLGaNm9IH27x0Ik
         egBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045926; x=1770650726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG5yXRVCYLlGCi5qx+ggn4yPf612jvCEPPTrtUaE+rA=;
        b=lynEJ6tXHut5Yq8BMIfOCWpR8zIm/dXOdRws08w7RUUw8cQlFweoAxEP1AL+L9/Toj
         XdWkM5YXQvaF7mALnLCXkuIrtUPuA8jU6DJVhlApVANh+UMZnfLD0lJ/LYQNGcW+PeWx
         2cRJ6po1WPCVn7+9Azy9ULS/s1eXBNFhH8y1MrMB5KLXV7bUtqTZTFiyRposnDDtSkDs
         p+/rEt3J5h5ickohnxnhF510cqUamVXkPz6SylFrVpoeyrvo9HyAbd4xy2LjddgX0rp0
         2ETyWE/mYxrqfNBZ88LzuFIzrR2UPzchUikgj2v8RAlv2uGu6QoRPyDC8GhnQ4ipTxtL
         eMZg==
X-Forwarded-Encrypted: i=1; AJvYcCXFD4pVjT7aRoU3IRaPzZG2SEDbMnK4QkyYQAQDE+7g4BE8bLYs6GQyWO8UBYKChHga2osESdu5e8T5xErh@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8I5zyM/tVdaHmJvi+O860yJ67Nn6lT23auY9aPHTttqgQj9J
	AN1ZI5e7JKdmTjjIZmbbIRM27BfzDvLf7Z3troEB4MoMfl6Mu7hkWJBhe3Hv0UE7ZAYmFYz6pe6
	4z+WfFnueYv79ZFOsbBmKWy3AQ/jEY5d3prujiB3ku4v1351Iq6Ij302F4fS8NmZg9jla
X-Gm-Gg: AZuq6aLuO8nk8zc2O9SGNEzA4FwZavyZxKF+M0Gk9uR1LRvFPXzH4ctMSWaddxm+JBe
	njecHo0lPZXFDcVQnj+t5Trq6aJNUIZspAUt6pFI4L0l/lvXLHb0z4DVr99xOHFqLTi56P/IulH
	iov2XHIUfPs2OWSmOnZElmOy4WnoqdfjZZCp2eV04n3q/enkVgWXpqTCA6ujKB4plQXlj5fDxq1
	b8/hSky1XmYQ66fRYxK21pHjlXnCh4TH9VWNJnvW3PLbtaGw0lY3goUWLDoZOnvJSNn2bubrjbr
	1YJ+SmjA8onZs8rIangq9bdvRScQaLak4ALA/hFAwaoghjsifKN79y2T0joPbVX7RaIIk7ldJws
	B3ZwhBg9jHjz3k85XZYYsFMvE
X-Received: by 2002:a05:620a:3195:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c9eb25f5c8mr1508052385a.25.1770045923914;
        Mon, 02 Feb 2026 07:25:23 -0800 (PST)
X-Received: by 2002:a05:620a:3195:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c9eb25f5c8mr1508024485a.25.1770045918967;
        Mon, 02 Feb 2026 07:25:18 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132368csm41732774f8f.31.2026.02.02.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:25:18 -0800 (PST)
Date: Mon, 2 Feb 2026 17:25:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] firmware: qcom: scm: Allow QSEECOM on
 PURWA-IOT-EVK
Message-ID: <gzplcwftstlsbszrinsc5cwjxb3grmug4btnrrvbt7avxmxemo@lk7wpk3yitu7>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
 <20260202073555.1345260-2-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202073555.1345260-2-yijie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6980c1e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XsGshA-rMXuQ-jq-uTMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Fmb9wQrJjK8rvq6GCuw2aC-mX5kvF_OE
X-Proofpoint-ORIG-GUID: Fmb9wQrJjK8rvq6GCuw2aC-mX5kvF_OE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMSBTYWx0ZWRfX0HsRE12wwq3W
 WuDzKtfuVTGaQqLZwwRPcQZpvbZyigYD91URTG7a+c2hZ3AnFXigsNlrQKrPbb9kbJIpeiu4gvK
 ir3CvJO5hVJjptpkhSBwBmHEY7kequphnabr9prFBIdFjHc7vcTNiDn64b3LKyHlYz+aFVvJd/4
 /nJA/UrrwUcCK+bNhpV2W9tcfcpZAOn6QFHj342yr6WX+0S0I3IvtA27uX3sf9bYEM0L86ZMwW8
 V1t7jL2VCE73w4K+vh2PgpIqyqgaHLmthGxajJgwhEGGXM+A7KamHrVU4hsP3KOn8va+cSD0TIw
 kZn5Kke6rO333kkVvmfGKfC/fD+97XyBAb/bg/BOa+eyYiXH5uUhrowkrtmeYn6v7YFYaDLW8Do
 J+L+LAy1o4r/OBpjnUh+y4VuJBaMAL4Bw5NBhsp2MAPum0sKkMlmlizmPEfdLQtJzy/TO8kPzXt
 PPv428qLE40gpma44Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91527-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 924C0CE2F8
X-Rspamd-Action: no action

On 26-02-02 15:35:46, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.
> 
> Guarantee that subsystems relying on SCM services can access secure-world
> features. This change improves reliability and prevents missing
> functionality or boot-time issues by making service availability explicit.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

