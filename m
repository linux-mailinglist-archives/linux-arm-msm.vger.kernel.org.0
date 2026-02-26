Return-Path: <linux-arm-msm+bounces-94194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKFbINWQn2kicwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 01:16:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3F19F550
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 01:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1EAA30276B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 00:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9664420010C;
	Thu, 26 Feb 2026 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOmqH7vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9H+mmxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA68632A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 00:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772064973; cv=none; b=MBxvMAidTaCjo2biAdx69eJaWFIzi93BySyCmdBSLVJomoYxn11X3HhUi3QtrOxAgr0Xyoq0AFDMejx029bHlnTp03zx5rKi+2a0MMvYfSx9cPkWbw/ZYGnnH3co74/CqgpTVBx7Z0G0KaKUq1kKHo7BSyF8UmAau7Idyc72WEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772064973; c=relaxed/simple;
	bh=vn3xmCPHtFKY3myhwzww/Wo1B6FR1PpO+l2/aSc9Xn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1t1YKhpiH/tv761XCcc7pluZsdvMdv0MmIavM5915hRtcDjXTIY6Aj8DSGJFedB6Udhv3HzdB22Ji7hI4ekAz/Alh+Xfb5dmti60gHgB1tfnClBCJRTfIzjz1ukb+IyArnVWq/U7vUt6TpgR0urIwlXA35/pJKGsPWGAgoHMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOmqH7vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9H+mmxz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHTHXo806514
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 00:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4RgE5re/OzjMiLf+d9I0aU94ZqFAAg+X73NhLIvtfVQ=; b=BOmqH7vpSJmJRmFF
	jHvE+iZ3Da797etp+z3+EIYU7Gd1RQcCBqphdzb9mhczIM+ohqg87jeJ4xSuu0lX
	316n9VvdfLr6Zm4RV3r33dAbzD/7zOgPstL5bWVX1l1U8TOSnfgeeFxUBfBpxUU0
	USTNo1p1OR4XSSbU5kHULzkwbIzAPnWrRkc6Uoq3LXKdgwAIch85r2rl0V+xttV4
	iMNgNcyetkEDeg0WJvitf9ZJXA/4Y0mZFkyWVNr2YPPHpNIRs8s3v6q3CngJ+/58
	ic3RVGBKsFv1Y6qCptF/aXsv131UMlplo/NfWo/9vJE4ojBI2gqZtbo97Cx026f2
	UQpq2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5pbmmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 00:16:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb37db8b79so292159785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 16:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772064970; x=1772669770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4RgE5re/OzjMiLf+d9I0aU94ZqFAAg+X73NhLIvtfVQ=;
        b=P9H+mmxzmTC6IjmukSew42o8hqKlYMnDxhpT6tsqJdimE7on5qKAPJcPX11ygUEZZ2
         +sv5BRaGacQA2ECU5Rypqe29DkS+bPtY9VXnpTQN9ntMzOM5oNGQTSJTJFLBbcb2DGEG
         TvaVkDVuzfSZvK8PJUqj+m75OvGBRAQzTm99Cnt54w3ogWKKPC1FO4v6MALuh6PsX4tB
         Nzn8f0SNOkZtvyt6laQ88wG3PLK+vy1TfDOSVfayqfx7TgojcHI8LGvgguNyafCVYZuE
         fg9568x8YvgaNydh1+9Elj68muN9VUV2OTxgUxhXXS2t+3a+ZV/0mqiKeWZwpOrj0dSM
         QeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772064970; x=1772669770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RgE5re/OzjMiLf+d9I0aU94ZqFAAg+X73NhLIvtfVQ=;
        b=irTpIw5WezWzwVW6YssL/5rB5HuPBvhKjFxn/qR1AaRDcrhoupYblm8Vrh8oPI+108
         e/+DZAreOriGPfKHxiiSetgVFMDjkwBQXMM0VD5tDaPqZCk45WyNbCscfgeA1AvY1Yo2
         MsTueEw9f5gGM9+tnXc87w9y1rCFRb8Kg/Qx+0dfPXHZSJNaXOHo0i2R7fvMOVEpSWKT
         JAse8fZ8a64x4uu1ZUQoElhX141cQeIKDGHiskopBsbHOtHxx057ugT2H6N7/JdRFfqd
         VL3c3YBGPdmos9Xt2b95LUyZ70Q4wqyNL47mtHIN05PmUVg8vQa6V5cglL8e32TFoGMW
         0MAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp1MAVCMg1Vx5sVsqcPhIDp/BGT9ySpsqG64+nqUQ9PrzmtrYoqs4kcPKjj9m70JfV7ub0ZTuPurCOdBDU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5q9cOp/GXyY6irWC0snbcy1rqasykxJ+ULqtFt8PRaRpKun9P
	i291nzhLBdsQmzxDlDBHhdp2M6Uj7a8J2YgtIQKkFqK4M6NUec5JrLcRjb1dAbKc9I5GxN4ZSC8
	f6RanGvphvI9Q5UluHE1Br+9Al9QlYwj6r67qhaTFUZqI1uPWckttZOj74kedAYQySIx7
X-Gm-Gg: ATEYQzwfGzn7rlJyot6rBanbRTAPzh5p8iIXZ0P6p675Vn2rRBn4NzL0tU8opSb1xYx
	pguJ1y0nk5E07FLFnlCZ7DesvU2u7YGhSfPP4epo+W8HPkslPZu9zVC7D9smIAO1XzHk09S9miz
	qFWF/12ckux0wckaetvpGFx3ljwpk1jHKKTMs/J9C0ssYB42egdlMZqIOexVhsHAxi9JsPZYaG8
	tOQx+aFrFrw/6sg7sHfF307nD27mrNUlSmzNwXuU2PW3ZbdIPHGUBdX+MMNf/II6evC/9RJNieN
	PT7whqev0/5dsy8nMNewds+ZCvCJ3P/Zy5EwxznOpjmmAoEBqLMXt27YW028oveePWrpoKmZmyX
	i5FALzR/cbs6jxH7xQlOoAtP+QuRZzMdqIG3fMRHpAh0ED6Vk5+3nXpwcqi0xis0n+FYNte5JhP
	87leyXgqDdOQSTIA/VzMCyMRs/sOmR5hc7mSY=
X-Received: by 2002:a05:620a:3725:b0:8ca:4288:b160 with SMTP id af79cd13be357-8cbbd07bdf3mr350514085a.72.1772064969725;
        Wed, 25 Feb 2026 16:16:09 -0800 (PST)
X-Received: by 2002:a05:620a:3725:b0:8ca:4288:b160 with SMTP id af79cd13be357-8cbbd07bdf3mr350510485a.72.1772064969243;
        Wed, 25 Feb 2026 16:16:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e1772esm84975e87.20.2026.02.25.16.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 16:16:08 -0800 (PST)
Date: Thu, 26 Feb 2026 02:16:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface
 mapping
Message-ID: <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225150122.766220-3-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAwMCBTYWx0ZWRfXw73FRuBlnUyW
 O8z6LDkLS7eHUNDqmzFEgAGzZP3v42TJC5E+BbFdwtGqpn6fvnR0o1VUQmqFlMPfjKyKFcsiBAF
 uVR98eMld8W5GRpYrOdtAWjZd/EbYDBmGKmh0fh+vhttBrxDJk6/uxUkjsWtBYk6qVZdf3EwHLa
 cq0NfC31KDs6z+J8VfDCgU0imC3QTQkX0s9h2a588S3GUmtgnu7E1PLXxe8Ie3qRq7ZfdOBac7q
 Nz+TEenrhkbZOotuMhe57I6v3ePET6eajZHW3Mt6IsCUFi9RLm5XrnJxWnn3BLv0GZxkCNw0eGz
 TVvA0Gh+6JyMeKoJKa6BQWqpBfjhx1cnkQ0gs2vbRRWJKj8CsNwcIASZO1l6oIYvEQcM7kByuGY
 m1IG0ocRb9QBN1qBo5WF0B3B77w1If9Nr+rI+O/LCHVvBRcilM83jf1SL+dYsWdw4enDTgHjo9O
 Dbl3PItX0ihE81CNMtQ==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699f90ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kx1wU2v_Smgsn5bZe3oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: h8AOZLhlCAcKqmpPalpYoPRF4ieXN0hu
X-Proofpoint-ORIG-GUID: h8AOZLhlCAcKqmpPalpYoPRF4ieXN0hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-94194-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDC3F19F550
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> The CSID‑340 block uses different register offsets for the PIX and RDI

So, what is PIX? I asked that question at v1.

> interfaces, but the driver previously indexed these registers directly
> with the VC number. This happened to work for RDI because the VC index
> matches the RDI register layout, but this assumption breaks with upcoming
> PIX‑interface support
> 
> Introduce an explicit VC-to-interface mapping and use the mapped iface
> index when programming CSID_CFG0 and CSID_CTRL. This replaces the
> standalone __csid_ctrl_rdi() helper and simplifies the RDI stream setup
> path.
> 
> Also correct the CSID_CFG0/CTRL base offsets and clean up the code in
> preparation for full PIX-path support.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++++-------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 

-- 
With best wishes
Dmitry

