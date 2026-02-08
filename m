Return-Path: <linux-arm-msm+bounces-92171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EnGLikFiWnD1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:50:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E010A460
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BC22300A3BA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A7834D4EC;
	Sun,  8 Feb 2026 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvYhpCHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I93mrpZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE586344DAD
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770587428; cv=none; b=akgJoqESOUqz7n8VtfyGBfxH5HRBonIXmPsqrNvua5u9ZoRcFy+SoD3B2qocTmn1/jSCkrhidIU/vA97RnIlT95JrtDMPD8AIAllfTgvIs9yPgtctQFI11RUhk0DI0/oEmwTFla6nw6XTHeluTiuFDwZDJ+9dZAT9W9hcL473W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770587428; c=relaxed/simple;
	bh=3sqxfwiHpg9NGhfCvj/lwGpS6zdUgJo2L3SFNseKJBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjgKOKfGOIQv9kCCjI3iSb0ZK6TX/oc9En5FpbuYZy0Buxuqouk2D8TsOkhFPvB39HmG8YDgqOicKMreKLqTw6SA6O5/3wALC9dFqz6EQWna5rXvQ5J0UT06y8bOQw1TN1MtU/mS0hfITASxeRoGk9syGV1oF8hbiPcNbPLivqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvYhpCHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I93mrpZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618CRRPl4193293
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Feb 2026 21:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MoJhtGGFfr966sCxFmKDNUK0
	M+fXF8BrsqWGwL92JNk=; b=UvYhpCHFJ2sK9VuFKhYwJrXg6kJg1o+cnTL5yNTR
	3ujQ3+bZvHN1TB+y/gLiESaGenlnOdt5uX4QQAYralREINi5stiDJOJo9JZrGU/u
	CiAm0FuI8DfJXZULUgioZPfbqM5K1I7nlWffdCcUu3wUl+itUNVPMytLnAwV/+Ek
	kxfCiva2Ix0mcdMpxlRthraB/ar2uS47eVJ8MiyANmB901tKP6XXRB40AyheIck8
	8+XgUvTDnoAw8YoC+iniTzMI/fRuSbrI06OsenCcHu6WpKt2CDwhaXgdd0jEOpqs
	XP/n7+qqYRgWvLe73kYj+8BXGQ3QiMR1ycRdKwT4ZC9XPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4u0qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 21:50:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50340e2b4dfso161542211cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770587426; x=1771192226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MoJhtGGFfr966sCxFmKDNUK0M+fXF8BrsqWGwL92JNk=;
        b=I93mrpZz6Y7765L0Fpn2tu6mk8DqtJ1+lDThvwRhqdqLIn6YtH01NOOg5a1rOfJ7o6
         xFbgT9CIWkkvFoztsj+TeMmeloSKo9BMKBUR2fdySeKy+ApJBiUkPTB438HJhYBQdrtZ
         v0DstTaqlYLLQYEaDe1dXFtXpzSxdIkgYJgv7o1VyNwDDBd0K1pChy3C+qg3DQbnr+qd
         WBjzPcLSyVsW/nhHXkFeiGhMBfHYcol8JbSxZwNgJJPfeSZ3kfUeyEQ6CM5M0wj0JBbs
         SOH00DcrpGE2c4qi035a/8YbP6gzgqRkpbTw6RfrMi3R+vr9DGqe4X8WTCLNgbTwppTu
         Gi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770587426; x=1771192226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoJhtGGFfr966sCxFmKDNUK0M+fXF8BrsqWGwL92JNk=;
        b=K9TVsSAPudbVJ+O5hlTLsbu6jWQcW03rBPdfl1SGTdAwxR9ydxoA7kcoGQIxTHw7Sz
         y86llds2NX0Okyi/lijsTrcgTMWw1SmnXnOcugsrMW9Dfhqs+CSD05LaehlTOTjRFJw9
         mxKhTyi0DVEbxr+KESTOY+SJm+B4R7xtpIYEzYv9DX9Nscr1nuV0agiqVq7aQn7CrnRC
         NlULKvhYHRh8mMwBxWE07OVLayRV98XT9e7lecsrZ76t/VhmHVvLHd3A+ppMcbJPSosR
         lzePaTZmKpuY/0tIRw0sfsvGvplm5NqiTL3s/Y0D9cJuFpHNRbF/XMEYFARKpHaYkdMK
         ua2g==
X-Forwarded-Encrypted: i=1; AJvYcCU187OrBZ9k5qNYmoLO7NFirelowM/Ts34VDuKzQlFNgEdCN6mYeckXqTt/0aQbogQIzBhgh7spwGxfxmz2@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTJ9l8yNcKDO5KBj0+a6VI57ks3sssZcSjnGQFIzrV1eBZOos
	bTtk9RnMmTEThvtflitoLMynDx1nau5Jc4bOeB5gsUpxO09/evZ0DD4GTmNzLTZtoATR7ZjdYyX
	T4OJHENFZE1cC0Yk+ggUuMRraHgaSPgB4x85sSzvm3c7jrRrW39Osn4IEKWLnghac4HHu
X-Gm-Gg: AZuq6aKmeXXrgVnLZonsb3F4ZqUuWLiK8tzcfhhWhTgaOoC5F6qG/Z2NTuVb4apo+/e
	PcX4m1Wde+8jDcCea2ZqhTMh7yMhuzY8FSgNbZozvHVbPdKoCIIeCWUOxq5EtnkT1gyCwo+EjKx
	9SU1/OfHCbmnshj7vxstCItPQD5FJC5DMhrO1hRfhOxwKXkmA4BACW1jvYlxOK2TL8C46sehfDG
	ZxKfu7Tjz2dMYtGH+LNsWUxDcxQIZa0qrTOXbOEv6G8xyrYZH9CktFsJSA8Pi68lTZu58Udd9yh
	4Pm9EflzbapZ6PnsrpILPtJpu4PriG7waeGUXX6/nb4pdT1EEeOGyYnapjZo185TM0vH51flrl6
	Nk/b5T4GQURPHPyNUfRcb2ZAep763tQA1XzUKjRW/FNw30Ql8kmsgWMa+LiuyXQUekDYrBgSy6m
	xVHAMwbXqKMMjnln8xsvc/9I4=
X-Received: by 2002:ac8:7f0d:0:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-506398738f1mr130855381cf.20.1770587426073;
        Sun, 08 Feb 2026 13:50:26 -0800 (PST)
X-Received: by 2002:ac8:7f0d:0:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-506398738f1mr130855191cf.20.1770587425664;
        Sun, 08 Feb 2026 13:50:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d299ffsm2180093e87.55.2026.02.08.13.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 13:50:25 -0800 (PST)
Date: Sun, 8 Feb 2026 23:50:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: allow QSEECOM on ASUS Vivobook
 X1P42100 variant
Message-ID: <tedyxze5s5zziagmshe5p3ewnmdklkldrbsjvvkizwvxy4qeng@w46r2tg3i2bn>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <20260208-b4-vivobook-v1-2-3a9b5e153909@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208-b4-vivobook-v1-2-3a9b5e153909@oldschoolsolutions.biz>
X-Proofpoint-GUID: vYpSUbptxxH1OtKSRaKCBdNL2YS0W5bK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE4OCBTYWx0ZWRfXxm4be4NXPFTy
 LQg7/w48WjjAe7Od+J3OJE6mGDomz+C0qQq1bR6Hbcff2hyKPHC616nKLn+faAsUalkRp7acNX2
 WfR8zNiIVvd05HpV+vefbmVA7msqIZX12unpPP5knvoUpoIdW+wv3r2c6OyEy1FISVW+lrKv2Ml
 jtbqtxpdcJ7DwqUcGLF+H9DWtcRd6+6TpzBQlMo2t2qFM49AZLy1DCR0O5c38LZbT+5kYflw5JX
 8ZVcvQsTQxESlV3Nma8yBETTAMsxCadVZeLsNvSBmjRJHpEtr0Ku1CtQREMX7GDwjtMkNpNPw7Z
 2YFWBoIXkaZTqpPmDyfxhXi4eX4JXw6Svz0aZXPW33J1y0EFRcUVDJu2lYEjBe+37jLCUW3iQHF
 LbA5pOuiTiXG/rpeoqyWJ6y+JbEpVAQB76UpvlZcysXag9ZO4y1Gu/dyl0k94IUkQUGExGgbGLQ
 ePT7S8v4+BNT8iHRYPw==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=69890522 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gxl3bz0cAAAA:8
 a=EUspDBNiAAAA:8 a=itIGahJsI5aVLUWJxsUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: vYpSUbptxxH1OtKSRaKCBdNL2YS0W5bK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,hotmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92171-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 571E010A460
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 10:25:39PM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Enables access to EFI variables on this machine.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

