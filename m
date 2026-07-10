Return-Path: <linux-arm-msm+bounces-118298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U3WzJY32UGqA9AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:41:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6373B59C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:41:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cTSRRDkT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aCtcwd7Z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118298-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118298-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DB693036745
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951CB39447C;
	Fri, 10 Jul 2026 13:37:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB05370AE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:37:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690672; cv=pass; b=HE+vAjZuXVBKVrWRQMV7l0nKHYD/cvu19VsXMJ9Bkzf1prSv8kqwhuw45/q5DHwfQjhqbtGTEugSIw8C5fUY3HTRRFvafPZjcWV8OwYN+DQq6/+6Bvg4b3F8BNhgRkKopxKoYx6Dm8ki6oJ1l1FJ88QDxEP9HANsuOltXqrqJ80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690672; c=relaxed/simple;
	bh=U0108WibK/hyV+slFrsqzunp8sDIwCV61jdEFP0VCcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSeIftO+jvQyGz+EtQO6H28wQOXBsf2bIrurlAdzEDxeL1BUX1ECCDPY4KrJ52++ZLxxHbyjn03C9I0gC9pLJBamLnugh1cjyqtsye7lrkQaiVqyxaoqxYHyPlf0r7+DC9ATjRmEKMru21APKjhu/V8GRWlXl03HfpY/dCkyIjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTSRRDkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCtcwd7Z; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD78Av919608
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twuh+OuducsJQQervD/gNfvCrxSkAtYfhN8NszsLb6k=; b=cTSRRDkT88U1XrcZ
	fiWUP1zh776kQv5xelQZIyBhkwrtgacVrZ+7Fi1zoBqz+pXwrl+PABW7XLL3lIas
	lw/h5NYdNRcCrluThPVC4BXYF7LpZGO0OA72oRV7goFIyz6/rx5uvZyXBVy8HU7j
	sq0QKorjTCmc1Dq+tE6dTXhdLNlAZt+05+G112wAbeLp95Sklx8TulVLMbeesc8X
	Xnea/3n4oMxPHYHNdiPWQOcJC2J1Be+5lpcEgGO+Ce+lcQwQMrbMQHY4eJIJaB27
	dT3nyRjxrO4bEQ5wBHviax7Xt9t10waU/9Usfp2tHtSqZfHXGogaChjlAavaLfra
	a0hAmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n22fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:37:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e606e8f3eso77033585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783690669; cv=none;
        d=google.com; s=arc-20260327;
        b=GqVSuIAJFLcYuFo2mDhkjmTmNErtXa0vr2l8zM55pU7jnfnDV/w93NDdG1KupeoFQG
         Uzx7MOvPOkuKOMoEc5bKUjHgj40Tw0WCxuKUMu0niJdrjwdyqrhdo06Q/AVgQYt+wGdH
         i3CFNkSpZ//6hjf+lMeQDQBC1o71CW2gvOQrpSs5daYtw6dM2vRnNtCIpD1QbgG8oI3M
         IS4iuhiJf13a7ATwgSoqg5wBG8ZrFekzpWnHHQoVzn60ztbp3j4q0/7mR0LTGPLEbdD1
         GTLT74F5oNZzwodot6nIlbLBwxEp+e++scVuV2fPrf6hMSQlHG5hjiNKYS4qqKQRC5mp
         sOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=twuh+OuducsJQQervD/gNfvCrxSkAtYfhN8NszsLb6k=;
        fh=ZnTc0JMurBfNpwLIb5AVW0V6LHsNMe+boUOU97maZNI=;
        b=hVE23GBURWB40rn0GzVrhCHA2OJHswOzdgo81dShpcevOa2pVF5ccsiYzo1nToxMFQ
         jndLSL2fVIdd7Pg8Sbpe2tbfIxmpfgnTBpgraACubMA9hbsOMpyWmGmFZcKvgdc5wfvV
         2ZtPXLfVhSX1lsJv9POjchn0OdcWwBx3QiWjX6nQQLdJBzVXo27MK+9E+os2ZhvikvGc
         g054dWjww1gunebW6mdU7Qz2JpNAiNXXb56b1FWGLvYYy50Fa0utfoY3WtAs+fATud7Z
         MYqeXcw+4dF5p0Dbl+R0ByiptqqXAu0dau4wgYZ8I9QmrflcyO06fbE6tSsBY5AUpl1D
         IHFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783690669; x=1784295469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twuh+OuducsJQQervD/gNfvCrxSkAtYfhN8NszsLb6k=;
        b=aCtcwd7ZRNGeNBSTUUOtkzj7SehZWKo9YbAFJnsNi7yQw5xgjvBTDoIZaXeEcxLTui
         RwpjOTUyeCWqcBSyflkKmhxxQAMSs/ytmki1ldRNY+9D8kQwzcAPyoozcNkeRBzAH/DK
         tVs49sJCL+wTv3Vqj1EDdrL2kTbzEMk7M7M2ahsavn9JmFpAdsrQM5ebfn7wAKx/pzTU
         isiakvrGU9O/j4s5nkR/RQD8iT2rlvnLnff2el3ZtTTWua3aupSGAk+pNye7cHqHyOZT
         6oxNRGqVl5EwOanrMtm9+DQFyTD/AMoOZwnnaKXjhMabOZPB18xcQ1wMMPFntE/9tATo
         AnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690669; x=1784295469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twuh+OuducsJQQervD/gNfvCrxSkAtYfhN8NszsLb6k=;
        b=ZM7Ix5UeLoQfef7z8VwprsxXZ2UA+/egjdMqfw4zg9TfXR0puD132Tg5Fx5DovAkhU
         8U+9OGkjWGVgZajx87YAxX1kbZWopPL0fqPpx8CECG8KWHRnHXO31/SnuZjKizpLjQeO
         iOylb4gAcYgFYKzwSB0ycAuuDh4oguuFfgPJXxaVEIpFH3imobs5l6HeHssQ/FJvFxqC
         svFOEHkjtS+goXiAs7SNRfuUaYeYzqAfEQs5NirRGtEuFDm4WfDxbNsWexaYpzJzXHd5
         VmnpdMgRfdbdexs61XJgdK/kqm2xc2OlZyFegJpP6cmFct07xMFQvYPRRDhnlPEf2r8a
         UxZg==
X-Forwarded-Encrypted: i=1; AHgh+RoPRj9V8NwOMrUgq+R0vxZNeArmwevhbigFvXY0VMaP5vPGtgy50lZ9KFD1fCLw+zjP0rnJtgnbKNH4W/R4@vger.kernel.org
X-Gm-Message-State: AOJu0Yykp3Xi5nnjcz2OVuvccNADM7mXRLyNBtFZC+gp89u6hD7sgoZf
	r4saZXhtbrYjwQIq8SPmLS//M9fSd09rDzy1GQ3FgFTyGlq5ainpHTY/N7RxCQddoThQ5Ehit6B
	PWXjNoSPz003U51lPX4YNR11vEQPjsmE79rrhvYG7SM+tYAVvjQ49QUTqRqYRRfLMVSdvkI3uAe
	u9EEyIKh/qF2DzuUJmYVkzKqnjrtEQWhGvFoTYngX87eo=
X-Gm-Gg: AfdE7cn9QZQheCmsmaA5CSr78UeHFuswVrSQeejiZD2QukYk8of2GaLc6wPhZLZM4US
	oXOnub4MDXlFIe4rf6aHClkgnOSIRYkFqE/TYkXflbMYcQFnteJgFH7Ly58Df6fXJnlfCCm0eYS
	8iMpb4vvURvNFWzaAyPZ2B0hXo6Gc+4sc6xyKMY05Zt3QPt/brGdxaFA8SNxKvenFnZY22j5S7Y
	2BzxkbXZO0JxAHzNci7lSg7GnzZ3lZcq1IftOdRQkq4DQt4J6uhY3Vl/KLgBIh5YJGV12/XN0Jv
	drKuGTmXZz8=
X-Received: by 2002:a05:620a:6412:b0:92e:7733:e390 with SMTP id af79cd13be357-92ecf5bef56mr1286638885a.19.1783690668928;
        Fri, 10 Jul 2026 06:37:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6412:b0:92e:7733:e390 with SMTP id
 af79cd13be357-92ecf5bef56mr1286634385a.19.1783690668445; Fri, 10 Jul 2026
 06:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-2-c1be0b472926@oss.qualcomm.com> <20260709113539.GH2045740@google.com>
In-Reply-To: <20260709113539.GH2045740@google.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:37:37 +0200
X-Gm-Features: AVVi8CcZDEvCH9VQ-D5oA3FETwZuNtugNhB0yEEYpPFm8vxZiaKlTuSVsEJKvjQ
Message-ID: <CAFEp6-32VqCdoFUG0ENVDt2jO_EqYFNU-ciQ-VBHV-D3DOuy6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] leds: pca963x: add multicolor LED class support
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfX0EJvCkT1zgU/
 b3SOQ/4ZH4E4UJUmBfsfWvonZP2ZTTmrga2LV5vQlGjIK4uEZq0eEak2Ih32lmlgVO7yzQUygTp
 Hb4xHjVxf9le7lIK7BdljCfTfPEGsK8=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50f5ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SSLBxCL5cuOkZd0wa1UA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _MoluW9JNe8CTQ7-oVPtbLvJv_lgcpcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfX9xcWVAl2+cqx
 yzmIrTaYbYha/5Zd/pUs7mhvsSwG/ZnZf+mUle0AGd0eHYKPfozI2ddWo8u91bivp9Ypt6cko1o
 t3UdLvqbcNXB7k0d0L0KKos/zJkbm81q54ib/BILtqzOIWeJHatlD4mbfZGvwwgPZSkzCZGc4Kk
 OcFqJscCXHg3hQMyo2/vaOzBumyAxzfhigDYHOxKg9kMvQuTMQlAsPEUICsArJRPs3aIEIdKvsi
 fub8rls3OfBVHyous9EsZai7vtBZfkrbh9suUq3OutB9sjLafMikpCTW2qRKhRd6gpRCj9Gf1oq
 YhsUVTM7iOUAla6DgmpvhU0OXKN1LHAZNH7jv2ppyLTNZuqdMnS4W3a2NxSZnisEx5o32fYHHzi
 3KpkRKup2ZZxo94qlK4n2JdSZKo5nQr+qUiyyeJK2aEQ6bV8xSqFXeL6Pmb9jXLQ+Mc+w4r2QsO
 P5LjWOq/spGHJ+wCbnA==
X-Proofpoint-GUID: _MoluW9JNe8CTQ7-oVPtbLvJv_lgcpcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118298-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AB6373B59C

On Thu, Jul 9, 2026 at 1:35=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> /* Sashiko Automation: Reviewed (0 Findings) */
>
> On Wed, 01 Jul 2026, Loic Poulain wrote:
>
> > Allow grouping of individual PCA963x PWM channels into a single
> > multicolor LED device by adding support for the LED multicolor class.
> >
> > A child node with sub-children is treated as a multicolor group,
> > others are treated as single leds, keeping full backwards compatibility=
.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/leds/Kconfig        |   1 +
> >  drivers/leds/leds-pca963x.c | 126 ++++++++++++++++++++++++++++++++++++=
++------
> >  2 files changed, 110 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67=
f9480cf23056e27e2 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -596,6 +596,7 @@ config LEDS_PCA963X
> >       tristate "LED support for PCA963x I2C chip"
> >       depends on LEDS_CLASS
> >       depends on I2C
> > +     select LEDS_CLASS_MULTICOLOR
> >       help
> >         This option enables support for LEDs connected to the PCA963x
> >         LED driver chip accessed via the I2C bus. Supported
> > diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> > index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f6f6bafcc2bd5bad51a3184=
c4cb08fc50693a0a5 100644
> > --- 'drivers/leds/leds-pca963x.c'
> > +++ 'drivers/leds/leds-pca963x.c'
> > @@ -27,6 +27,7 @@
> >  #include <linux/string.h>
> >  #include <linux/ctype.h>
> >  #include <linux/leds.h>
> > +#include <linux/led-class-multicolor.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> >  #include <linux/property.h>
> > @@ -101,8 +102,11 @@ struct pca963x;
> >  struct pca963x_led {
> >       struct pca963x *chip;
> >       struct led_classdev led_cdev;
> > +     struct led_classdev_mc mc_cdev;
> > +     struct mc_subled subleds[4];
> >       int led_num; /* 0 .. 15 potentially */
> >       bool blinking;
> > +     bool is_mc;
> >       u8 gdc;
> >       u8 gfrq;
> >  };
> > @@ -205,7 +209,7 @@ static int pca963x_power_state(struct pca963x_led *=
led)
> >       unsigned long *leds_on =3D &led->chip->leds_on;
> >       unsigned long cached_leds =3D *leds_on;
> >
> > -     if (led->led_cdev.brightness)
> > +     if (led->is_mc ? led->mc_cdev.led_cdev.brightness : led->led_cdev=
.brightness)
> >               set_bit(led->led_num, leds_on);
> >       else
> >               clear_bit(led->led_num, leds_on);
> > @@ -237,6 +241,28 @@ static int pca963x_led_set(struct led_classdev *le=
d_cdev,
> >       return ret;
> >  }
> >
> > +static int pca963x_led_mc_set(struct led_classdev *led_cdev,
> > +                           enum led_brightness value)
> > +{
> > +     struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
> > +     struct pca963x_led *led =3D container_of(mc_cdev, struct pca963x_=
led, mc_cdev);
> > +     unsigned int i;
>
> Remove this.
>
> > +     int ret;
> > +
> > +     led_mc_calc_color_components(mc_cdev, value);
> > +
> > +     guard(mutex)(&led->chip->mutex);
> > +
> > +     for (i =3D 0; i < mc_cdev->num_colors; i++) {
>
> for (int i =3D 0; ...

ack.

>
> > +             led->led_num =3D mc_cdev->subled_info[i].channel;
> > +             ret =3D pca963x_brightness(led, mc_cdev->subled_info[i].b=
rightness);
> > +             if (ret < 0)
>
> Can (ret) work?

sure.

>
> > +                     return ret;
> > +     }
> > +
> > +     return pca963x_power_state(led);
> > +}
> > +
> >  static unsigned int pca963x_period_scale(struct pca963x_led *led,
> >                                        unsigned int val)
> >  {
> > @@ -300,6 +326,84 @@ static int pca963x_blink_set(struct led_classdev *=
led_cdev,
> >       return 0;
> >  }
> >
> > +static int pca963x_register_single_led(struct device *dev,
> > +                                     struct pca963x_led *led, u32 reg,
> > +                                     struct fwnode_handle *fwnode,
> > +                                     bool hw_blink)
> > +{
> > +     struct led_init_data init_data =3D {};
> > +     char default_label[32];
>
> How sure are you that this cannot overflow?

This is unchanged from the existing driver, and snprintf() is bounded
by sizeof(default_label), so it can only truncate, never overflow. In
practice it won't even truncate: nr is the I2C bus index, addr is a
7-bit I2C address (2 hex chars), and reg is a channel index limited to
0-15, so the label is always well within 32 bytes.

>
> > +     struct i2c_client *client =3D led->chip->client;
> > +
> > +     led->led_num =3D reg;
>
> There's quite a bit of duplication here.  How about calling a common
> function an only do the genuinely different things in these two new
> functions?

Yes, make sense I will do that in v5.

>
> > +     led->is_mc =3D false;
> > +     led->led_cdev.brightness_set_blocking =3D pca963x_led_set;
> > +     if (hw_blink)
> > +             led->led_cdev.blink_set =3D pca963x_blink_set;
> > +
> > +     init_data.fwnode =3D fwnode;
> > +     init_data.devicename =3D "pca963x";
> > +     snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
> > +              client->adapter->nr, client->addr, reg);
> > +     init_data.default_label =3D default_label;
> > +
> > +     return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_=
data);
> > +}
> > +
> > +static int pca963x_register_mc_led(struct device *dev,
> > +                                struct pca963x_led *led, u32 reg,
> > +                                struct fwnode_handle *fwnode,
> > +                                const struct pca963x_chipdef *chipdef)
> > +{
> > +     struct mc_subled *subleds =3D led->subleds;
> > +     unsigned int num_colors =3D 0;
> > +     struct led_init_data init_data =3D {};
> > +     char default_label[32];
> > +     struct i2c_client *client =3D led->chip->client;
> > +     int ret;
> > +
> > +     fwnode_for_each_child_node_scoped(fwnode, sub) {
> > +             u32 color, subreg;
> > +
> > +             if (num_colors >=3D ARRAY_SIZE(led->subleds)) {
> > +                     dev_err(dev, "Too many sub-LEDs for node %pfw\n",=
 fwnode);
>
> dev_err_probe()
>
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret =3D fwnode_property_read_u32(sub, "reg", &subreg);
> > +             if (ret || subreg >=3D chipdef->n_leds) {
> > +                     dev_err(dev, "Invalid 'reg' for sub-LED %pfw\n", =
sub);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret =3D fwnode_property_read_u32(sub, "color", &color);
> > +             if (ret) {
> > +                     dev_err(dev, "Missing 'color' for sub-LED %pfw\n"=
, sub);
> > +                     return ret;
> > +             }
> > +
> > +             subleds[num_colors].channel =3D subreg;
> > +             subleds[num_colors].color_index =3D color;
> > +             subleds[num_colors].intensity =3D LED_FULL;
> > +             num_colors++;
> > +     }
> > +
> > +     led->led_num =3D reg;
> > +     led->is_mc =3D true;
> > +     led->mc_cdev.subled_info =3D subleds;
> > +     led->mc_cdev.num_colors =3D num_colors;
> > +     led->mc_cdev.led_cdev.max_brightness =3D LED_FULL;
> > +     led->mc_cdev.led_cdev.brightness_set_blocking =3D pca963x_led_mc_=
set;
> > +
> > +     init_data.fwnode =3D fwnode;
> > +     init_data.devicename =3D "pca963x";
> > +     snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
> > +              client->adapter->nr, client->addr, reg);
> > +     init_data.default_label =3D default_label;
> > +
> > +     return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cd=
ev, &init_data);
> > +}
> > +
> >  static int pca963x_register_leds(struct i2c_client *client,
> >                                struct pca963x *chip)
> >  {
> > @@ -338,9 +442,6 @@ static int pca963x_register_leds(struct i2c_client =
*client,
> >               return ret;
> >
> >       device_for_each_child_node_scoped(dev, child) {
> > -             struct led_init_data init_data =3D {};
> > -             char default_label[32];
> > -
> >               ret =3D fwnode_property_read_u32(child, "reg", &reg);
> >               if (ret || reg >=3D chipdef->n_leds) {
> >                       dev_err(dev, "Invalid 'reg' property for node %pf=
w\n",
> > @@ -348,22 +449,13 @@ static int pca963x_register_leds(struct i2c_clien=
t *client,
> >                       return -EINVAL;
> >               }
> >
> > -             led->led_num =3D reg;
> >               led->chip =3D chip;
> > -             led->led_cdev.brightness_set_blocking =3D pca963x_led_set=
;
> > -             if (hw_blink)
> > -                     led->led_cdev.blink_set =3D pca963x_blink_set;
> >               led->blinking =3D false;
> >
> > -             init_data.fwnode =3D child;
> > -             /* for backwards compatibility */
> > -             init_data.devicename =3D "pca963x";
> > -             snprintf(default_label, sizeof(default_label), "%d:%.2x:%=
u",
> > -                      client->adapter->nr, client->addr, reg);
> > -             init_data.default_label =3D default_label;
> > -
> > -             ret =3D devm_led_classdev_register_ext(dev, &led->led_cde=
v,
> > -                                                  &init_data);
> > +             if (fwnode_get_child_node_count(child) > 0)
> > +                     ret =3D pca963x_register_mc_led(dev, led, reg, ch=
ild, chipdef);
> > +             else
> > +                     ret =3D pca963x_register_single_led(dev, led, reg=
, child, hw_blink);
> >               if (ret) {
> >                       dev_err(dev, "Failed to register LED for node %pf=
w\n",
> >                               child);
>
> dev_err_probe()

Ok,

Will submit a new version.

Thanks,
Loic



>
> --
> Lee Jones

