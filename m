Return-Path: <linux-arm-msm+bounces-114719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5mACptdP2raSAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 07:20:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B1A6D1296
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 07:20:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CUN2dO8U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FtJNrubo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F8843033081
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 05:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735B330C16A;
	Sat, 27 Jun 2026 05:20:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CB21CAA68
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782537622; cv=pass; b=mC98hrxTFnmpqoE6Jghcs0n0mkrhIgqI+4vuBL2OiUzXyPs4JwCSbDI8qXlo3ZHwQXBR2OtAGKn+RNye3G2CUJwrxJLAYQovPPlf1bPiSUyOcNet/xSaY/+QxEzB2gTpCZNx9J/VA9OpmKO3TgwHKHmT7LlWYT+3iMFP3yNUCN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782537622; c=relaxed/simple;
	bh=JazKb1s22fdMLXLs1H1wbAz3+xYEpc8IfYlazIB3pV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFuhp8MfM01ajgB1DFvoSR9Z539phKRcHczIrkHiGfn2dED33EvAswy6JYOVJ2C9ZnZ81pKdOqyLuWAT3Q++4jE1PGapsaa4aPXCPTI5Uy26qwXsM1jEx6VRSOWcjpB5tFcUXw2PAixoMsp4zbFtaS4yw7hqhBHaPGogDR2WmJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUN2dO8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtJNrubo; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R3f3pw006579
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=; b=CUN2dO8UKvOkbLKq
	QNoEuJQnmdY+wm7J2fvcei1yniWa04MtU4lxg6+2KJ9BrzUZ19bIG8ba/RyZh0Xw
	Kf39PTr7/AEj+CtK0YcVhjVBKuDwKd5KSs+3L67hssSTOwjV6A1HIrt8OI+Ny+G4
	PtK1pgRGxipU1e16BIgV3esM66fFIbTKuHdeaSKDp8AJochexfpEY06fR++6bXxW
	gNXMHQVgU19BYH8G3W4UUn8TML0YZyMYE08/I+xWQX+hyR1Ttd7P1CCkR08H7nRI
	gNCvlIMa4nDFi12dg9Dt39Oq2pJz3l3t6dllfm+pannAutgGKFLLUWtsoYlZHGan
	wUnnTQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tur4yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 05:20:19 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8067aec1f51so22786747b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 22:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782537619; cv=none;
        d=google.com; s=arc-20260327;
        b=UqysonxhxZBkzAyo3h5JVzd+nvreKeazoyRl9JDPcZhkavwVXQWwnBAnCdli3xz7qQ
         KqnnoBNCVbYtdmd160jN9eBXBKmwE0cXsuYhEbEOF2FdUMUOAENss8XWJfLfXC/P2WNN
         2EsUOak9wU/sFduzU3MCLp7rY/kqskAQ8HlEcDSFdNWU0kxtcgiRMlZEGv2GLyJSDpSZ
         iGxphvy2mRFucCJMrSNxijT8kOX7RCxUP3m7qt6gsd5MnJHVKSfqubA0abcLXtJrSp8l
         Eqzk9ambyRSKzRJuoXrBo3bQ5pTbYLVqiLCgS4QCKZMimQGJFQ1oqUcfSkPyUtj/o0T/
         TviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        fh=Gj7EjFc0HFKvlGPWc3OLws+N+Ii/p7uUie9WQCOwqi4=;
        b=WTYyftX9CJTTsiC+fwOCcw4JAzdslLGCNyG2GpVYpAUHgklPupjM/zeHwYPPIfRI+Z
         gxJJKQNRFSBd9NhcSm1SD2UE+9n+Fy5O6Dt9EWy/Kh5x/SXaT6UtQ5JMDvepou0HFQtN
         jWUamOJKqx6X/uhIBDTkiGenouwUSVl0lYUWyrpjur0O0IbqA9xDg97Zm0WjBn+qe6Ny
         NdbhFvqtqxL08Ou69XMBgM8eA7j+2VAcP1jgRayox1/J/dG+xgE1ZhGJ3PsBTaIvVDjx
         nmopylXdxs2LUd1SNTrCRAgpJhyTve8v4fnpCgxdrx8izN0y6thD4HmhrjPr3MeGGn9r
         3jwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782537619; x=1783142419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        b=FtJNrubohWxtbJLGKWeB6JNr+RjlPBD8NJuJ/1NPC5b0yn/W+A0/uMxHygeiMmz6O1
         ynhS+wlWSVhdNwluqrG9fMpjp+kVxqCsM/ElKlsFbgFvZG6SWi3ZpC6eZzFlzdf43VB8
         bx8zwGUn4Ch+uzDj62I2A3SwBvUfDg4sU1K1BnMWQYbbMz8foEwpXjs5zl3Sf99SHQ9h
         7nQnqUKCuA6kBQTLBF3HZRWDdL2jcpdoY6eJECxTc/dvvHKmQDcD0qMDWZYd/bV8//RZ
         gahSs2LZ8z1wuW1Xg5sjQpcEtjPXf5Bvagw42atfZUmOTQ6XEcDv0VgC/9UTtMWL3xbJ
         nnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782537619; x=1783142419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        b=UYRo8XY70Dv+AgjK63jrNbUnwQEVZ5dVS3xY6dqykW1PnRATjtXBNtrP0QRcRQNID6
         jf1VEa9GbUASHJKF+nQ2GhyNmGXUoIbnxJvNHpPxV8JgHmpruNtnhO7LA9PSHYN7aznU
         J4RswW0XhpykbvcFCI8hr0eHEaRBu1gbCSUIQSMgb0DpErjBe/g11agEn2xfITPn6tmh
         ZRX2qIWsuDsXJZy31xWMogFbsrFqDZd7oknIwD9ydXmdUOloIBn6T+jQe/IXSt8bhVvQ
         UoMOYmlRYunywtZk724vKCbYhnWalWT0THk0/wmls5YopUnLOX4Hc/A65UwZF7dNAKb5
         3bOw==
X-Forwarded-Encrypted: i=1; AHgh+Rokl+8fXGTDceQ2bQL0RJ/erfUA/XCzGUv90fofTJEwEl//gqscnXRpnhBPEL3GjzHwcTt5Ix0mZGuGIdPI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0Id3aov3Pa1acpvBAtbsOd2NMU7/+UCzHAOPZCDxm7xIqLWL
	MdkyLILi1rIS6vWgNm4a0a74pJWwVmf0RUpfcC71K0qYsBOxa7jRa3/0E409GfimGfs6ZOkbyUU
	XGuPOXO/6Nv5TxKmTKTb3kRRmJ0cXrv4MytmHIgprcaCmOgUlqdb2YXjFhnIoX/KHUfq9yTtbBN
	QfQXzk5cVChX+MqoPJ9l6xwQA+fbAFS7A9jJ8mA1S1KQA=
X-Gm-Gg: AfdE7clnsW5C5yVC0np2HjbsJiDHIlRLxWPKaofjrTKhRQIAIq5Y/rk3sTzovG/e8yB
	rvs3AR/fVPPlBsDdjq5mxF2lHxtDpQao/TIno/0Uvi1vhXV5VI+fkih5xk9tD5oSoyGvhfah7FJ
	RbrOTY0CYcaQ5daakC/y8HX5lsBnSSpRC+5DwSrFPP2l9ITREUHz57QvKAsMPjaiE6AnnI
X-Received: by 2002:a05:690c:9b12:b0:808:f9bb:3848 with SMTP id 00721157ae682-80a686ea671mr98741477b3.13.1782537619522;
        Fri, 26 Jun 2026 22:20:19 -0700 (PDT)
X-Received: by 2002:a05:690c:9b12:b0:808:f9bb:3848 with SMTP id
 00721157ae682-80a686ea671mr98741307b3.13.1782537619163; Fri, 26 Jun 2026
 22:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com> <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com> <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
 <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
In-Reply-To: <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 10:50:07 +0530
X-Gm-Features: AVVi8CfSGk4Ur6-NpU9JcWCxqSlaeNXgt_0c45dTtL9eqUNe3YnnYSnTGt5mpbo
Message-ID: <CAC-tS8B0+w2EOp4nMOq=egP_rLHtdNQx_SbjyMi+N+2axTrO0A@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA0MyBTYWx0ZWRfX1/fR0Z4UZ2D4
 bq2uWG9a8zDXIyD7wFyCYbX2xyz1WwOd0i9e1zjA9cIHn/fjP60YK9QTcqoAfIAimoO86CQFkc+
 qhBpTWgk4jmW96mihdcCrY6X3/IbGP4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA0MyBTYWx0ZWRfX5zaOHArbhRgV
 I7943V4ufOGpxuSipKx8g8FCWzuXoiNwoJYIFhPp+wQg7MWNHsBZpy+qDYGEdBrcf5NebdhXlx/
 6nGWPAYxXWqFSm9W+rwN7j4tPzYZJ6UATryoFjIWbV43yRG6qA/ZKYd/xaEW3KuMMUilArSP9yv
 lyak1/6X/KASl1AOAM/v0YHuQHYvAfOl+Y9L5memTPJTeZzE/fY0tNZKMsikmvAyc6jpcqbwdqw
 vEkUVi65RuvtUm8PReFCuQ7DGVRQGYtAuHfTEZ3sj4nTHJkW1JRosfArujkCC5PaCzE+FjFps2S
 d7lmorunS16Davz/JovObw7qMUEGWO6MUfoOGGy/krnOMcg6EtNnkcdY9DX/J4pj4rxeKtp4E0L
 cN6AskbfK8s46gULPvcELqND582P/BEKx1e/BrH6/JHXPif3jdt2h0AxQzR8Bao0dePnfGBYrDR
 KaS8J/Nu5StlEN2NrVQ==
X-Proofpoint-GUID: DKe4DSXpkDlbPqez_s-WftcnrCHeM5mk
X-Proofpoint-ORIG-GUID: DKe4DSXpkDlbPqez_s-WftcnrCHeM5mk
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a3f5d94 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ic5Di-vIGvb2KEz3KMEA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114719-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68B1A6D1296

On Thu, Jun 25, 2026 at 5:41=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/24/26 8:59 AM, Harendra Gautam wrote:
> > On Tue, Jun 23, 2026 at 9:18=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/23/26 2:26 PM, Harendra Gautam wrote:
> >>> On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
>
> [...]
>
> >>>>> +      qcom,qaif-aif-sync-mode:
> >>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +        description:
> >>>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (p=
ulse)
> >>>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) syn=
c.
> >>>>> +      qcom,qaif-aif-sync-src:
> >>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +        description:
> >>>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave m=
ode
> >>>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> >>>>
> >>>> Should these be boolean flags then?
> >>> It should not be, the intention is to define explicitly, for better
> >>> readability I can rename these flags as EXTERNAL/INTERNAL, Please
> >>> suggest.
> >>
> >> Are all 4 combinations of them being present/absent valid on shikra?
> >>
> >> Konrad
> > Sorry if I did not put details properly, I will be correcting in the
> > next patch. sync-src can be external clock or internal clock, where 0
> > means external and 1 means internal.
>
> What I meant to ask is whether all combinations of qcom,qaif-aif-sync-mod=
e
> and qcom,qaif-aif-sync-src being present/absent (set to 0/1) are actually
> valid and should be supported
>
> Konrad
Apologies, the correct sync-mode mapping is SHORT (0), ONE_SLOT (1),
and LONG (2) =E2=80=94 ONE_SLOT was missing and LONG was incorrectly assign=
ed
(1). This will be fixed in the next patch. Since sync-mode and
sync-src are independent controls, all combinations are valid and both
properties are retained as explicit uint32 fields for flexibility. On
Shikra, the validated combination is ONE_SLOT with INTERNAL sync
source.
-Harendra

