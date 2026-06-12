Return-Path: <linux-arm-msm+bounces-112946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oATGKXYKLGrRKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:32:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E4679DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H+lCBWFm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dSe3B+oc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 797DA3583AAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF4F3EDAD2;
	Fri, 12 Jun 2026 13:22:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E43ED5DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:22:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270575; cv=none; b=VNEj7OqNuKnwyeld3NetVYTdD3OS4fXn6+T6ly11ePc7XLxfOnXH0uL4MBqRFdwj8PJLoaXMWo8GKXrXK75AbeNzAmUvN6TvQMxOLWzjX1FjijofwFl9RdJdVY2sBoIWGzNGE8hlKKmeBEJbEsBOBxkK3jjrnYNfHebu9Jb52Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270575; c=relaxed/simple;
	bh=nf1g+Fqp30YmpIaTMZMXYpVgVvbsOlnzP3kXNlN79yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PW7qTlFo6lx5FKRYi73Xivxb2Lp0rOhsxwjKPVa/WlBRLmsjH6WPStEQovY121xrvbzDL8jAOKtVho0ya2Oohl2UtruuKlzbQyMZCMvyzVes/3I3H+kqczBAI+HBJVKz0lrioVBzNpEKPQ9DCxLAm0zLjnTXhV1YVIyaegVLT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+lCBWFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSe3B+oc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj1tF3732409
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=221wATpxxjDRdtKDabS+fEkS
	ffVXjJazSuJCFsqtxp8=; b=H+lCBWFmNNU/QZcPhIq4/YvZRJ1iWT5JDEdgwwhe
	IBZ7XSBZZi1iUvCHaRZeK1vSB3napk1wahd0XfYRlQHF+y5hgXN6hXG5IVWbTQ+C
	8b8Idv2+6IB1lyk7rcmZA+ymr6UkS/G/QUnbbLL/9VriGT+c4W5Qv8ymKUgNi56q
	I9c77UhJEk4Z0Dsf0qKIg7Dzptyj+vy2uOrcY0Gh1EDM+b30bvlntXIBtLEVbTmN
	sWYSRBkUo3Es2fK71uewQRQZ3nX9f5TvFkjNpgvtUuKbRQwD7aU5HSBKc0xsbekQ
	yRYx5n3LoMAsYBJ655rFUytFEbGVp2lsynKb5H375Cr4uw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72xtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:22:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a94a743521so495049e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270572; x=1781875372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=221wATpxxjDRdtKDabS+fEkSffVXjJazSuJCFsqtxp8=;
        b=dSe3B+oc5l2fLTZ5Qz5X8V46tlh96N+bREE5mLLwhhvBhlLNrFzLSRvTl4U0UC2Bcp
         9eXC4SbNmnbvTOy799ncq1BnMSOMC4yCdw1K2vo0YvzdyuTYm8epQ8DV1tWt4OzBHLBx
         fjXxz91/46UwBeowlRLE2uVBG40ww5qFTzdiE/6nOkVHM1ifUAWxP/1XoXkDr1Q/4i3Y
         3npTVoeQvQxpcvUoaJX2yk4++CC85IRjt5szigQKVeuRTSZuf7i8LTuQjetNSIyb+pXR
         nY8Sy3nPsV/JLriVIqxI+bNUaOTUJSA0VrmiN2bY1/p/H4nMXboZUCr3s4SsgyQoDJQV
         Mlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270572; x=1781875372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=221wATpxxjDRdtKDabS+fEkSffVXjJazSuJCFsqtxp8=;
        b=RqHxLVBZRknj2WfOGaWEGf13Bc3hsr+BU6LAEZBV3vn8uREbExKiMpJh7LXe3EeiFy
         8OfeFRSQFS8Mo0JXD9rGzAMubBD8dFxSiIaVSnP+7kG2dpK16ofShjJwMFy0Q5hkvhLw
         Zt+lfvEXfWYHzPA+h7ThQP9A+gvI57IpbA2/C5+Ml5iMBTukMeTCLiBHAnPK1ZyD0cA1
         xbgMK1Yu4AOQMW8Sn03f69EFEucSJ/7t0TK29cNt86VzL9L3x4239nKgzZwwJT8JI2Q/
         b8pPIfSMHD3mjBWzZ3RWV1EwpfZ13a/CVPRYRpFzSkDINMaDuxtUh35PLwKAcatvEtiU
         wZog==
X-Forwarded-Encrypted: i=1; AFNElJ/ZGvqTxeGesFeN+0PkFUZ8yhfWTcXXHAzgZ8LvpUXpWwXDIKOhi6aJHEB95z7vc0acLheiY+p4adq2hDqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdI/0M0yUd0P+qIqHspawWBvF7IgXpHpfx/v/WN8Wrtr4K/2B
	dj37Ne0x+QWqZHYGwxAnDSJ/Aau9OhGl4o3kCHNy/y/sfFWUHccqMf5W3BB0TMZg44i5GxZ3FP+
	wFOhuwIr27I2bBUDx1xFk4Ave8MebWNPB+QvYjtr0S9rGxXsYRMWjU443uLih4yw217HX
X-Gm-Gg: Acq92OFYjx6WQwLMjmGTodYa25gEpjtETGX53jhVfhxt5OWFPzIUXV/G+VNAV5XK32v
	AqddXcsw3f6691PlAsbQBokaXDf36rCRzZq0F9gMc9GBhediBGGpPOgTS4zMT55GzX0Cw/PHXH4
	Hg3KhSOUGRtMasxGFuk8IK7cLsj9g0GMXbjQeTwiBadJ1V0HxpLfZyKrmGqzymw+LConn+xqau1
	bYpDezNm1R/Tgim6uZ6qPJDgR/OC7HbzpKIrIpus7X3+/mb/NPvNuz6srr0wkwrVgj/sKYMtjQL
	y4llA/0TN4VbHk4H3TQAvkhmWluvEDTXvsaXrKKPfphRV0USPBWg+yYrtzA0b2CgL+JY/j5I/wk
	JaL4Cb/Q7rS7wrIJsJufxGJ8oZcUNNmCkuHXdmv8NWCBLzSVVEUXIQJ+QGRc6taYzZ6hfMEisc3
	cAbBWZXmLZjdkXOi0U0BNC5aGLEBaerKTYmU0=
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr1220311137.3.1781270572394;
        Fri, 12 Jun 2026 06:22:52 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr1220257137.3.1781270572006;
        Fri, 12 Jun 2026 06:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aea92sm532555e87.63.2026.06.12.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:22:50 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Message-ID: <qc3khvuiwllxkaj2btmtevh7vxvdkcnnqemetvh7mqeuoe6ieb@7nkztniqusxu>
References: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
X-Proofpoint-ORIG-GUID: 2LOr0dJd1nFkmK-xXUBBes_8XlU7XuqZ
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2c082d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=DvXHit-es2HtMH40iYAA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 2LOr0dJd1nFkmK-xXUBBes_8XlU7XuqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX9U8TGWhD7mF1
 SyiLKWrd3FItNPsRQoccSeA0O3x7WzmW9iROR7HngC8niUgAHdHf3oqHUvHCQj/jLB8bEHSrKgG
 rTwzOOn1bBbeU2tZ8kCh9jNsjsWrFrJuJGT2U0aIGgylQDoz/YdZVZ8WBAQlL449BI4WdDt4M9r
 +MYWA97essEBR8vqsftAWXzXxxUfML1PUN3Hx06tjI8FsgZKn+qwI8xHUIS68+T5R+Ubor9VwA2
 U9sMZbC7Oi+kWXXR0Xk+QQm5bWdnxdOUHlmrFIJQlheCLorBrb1S879469/SZ+D9v8RhKhQnBPK
 HP5/30xE3vyNI2pZpF39W7hYWMjDQ3Yw2S1AW2Xdtysj2vq7J+nIxVMcgk59Ja+kp5OsyxzdDRx
 +ZRHEPajDjey4Ea3lklpEykeQdpkrIl7aY8362kv7GDv2ZzfXCJNsiomEDs0fkA3y1ySynUS47z
 tF7AQ/b2koDInHVls0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXxdogG4mFMSXe
 lS4zqBUYNdh3p+gM/XpSlhD+ITp1uvCkS0g0w2nr1GWYgEh7dqvckyesHBYF8QP1szLZTbq7eKh
 EB9IQ2xkjJo9Pm0G8XK1dZesQLTdxpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112946-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:val@packett.cool,m:bharadwaj.raju@machinesoul.in,m:bhushan.shah@machinesoul.in,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,7nkztniqusxu:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 015E4679DC8

On Fri, Jun 12, 2026 at 02:52:43PM +0200, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Remove awinic,sync-flag for both amps since it's actually not needed
>   (Bhushan, off-list)
> - Remove RFC prefix
> - Pick up tags
> - Link to v1: https://patch.msgid.link/20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 57 +++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

