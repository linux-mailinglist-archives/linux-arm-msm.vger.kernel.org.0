Return-Path: <linux-arm-msm+bounces-116830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQTtCqm9S2r0ZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:37:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F967120D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:37:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="R/oRQoK8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="RY67iz/F";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A623756DEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52E03DDAE9;
	Mon,  6 Jul 2026 13:00:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B063DDB1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:00:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342831; cv=pass; b=Wyon9pUuZh27BFzcj6gnkZIkQgmLRCP4AtB97RzNsrD+0JhuZ8iHzK3TgdQRthYJyZ3smrs3td2F/if8VUYDJcV4ijdBKVOemUeOalncLTfwXGAIzCvTSa1VDreH0y3XsK4XkyA+Mj+29PmoLHPUzJ0xFQKIpKwW41oLDn4CBss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342831; c=relaxed/simple;
	bh=eiqSJadHp3ISIKl/s1+4iuwWSYrVH6x6p9Y/invwboc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbNrFgJZJqEHPXwRktFplp9SlQ5zu3b2wqAnPptjk6FxCIKl9smg0/ZFhkIMo78TbzFDqYs+bHG1tQJgwwU4pgDQ7nDqfN3ZjsqV5TUlzjK9vsYG7K1J/EbPjUIqQI1YBsbeNn9EJOZXrSRBWuhC5jTASSenvDCFqPzVEzeBofs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/oRQoK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RY67iz/F; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJTa387475
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64MqRWRxznl5rkvRwGBg/kpUpb8ntoqeisI46KakmIk=; b=R/oRQoK8O3cMIjVA
	KRb9SKLzzLMRVTi/01Ri3FyaQK18ZToWGPFhrpjOKYhmKokjP8XGd3VNNvIbEJPF
	udkFmbM6NcpXMUoGCr8dLY3X/GNNbEPvkSh1j9SRkqmCuhNL+bgghJYVRh4Mp0N2
	L0wulUHg/pqzCvI19OEBhtVDY/w/hWD1pYVc+VbKcpxRMiQG3J63Ij38nHQXPmJ9
	HBAgRYorwgOSYECOkqLNxIeD5NCmPmRO+j6SFeksrpgttKuhCT0ttLdYrvUz0nJN
	dIe/2wdjRm/oW4t+hZa2vdjfjMl+mD5zB/H2+VyX9oNXB1CGxPmTyVoKMBOUFsvN
	a5v56Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0pfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:00:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ee40bceb55so41128946d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783342828; cv=none;
        d=google.com; s=arc-20260327;
        b=FnSMhnAhie+oyBAYg1G22jfjAN8vnGnn1mYdP8dwV5Y7hhezjlaM182TBmWI9a7F9k
         WURQl/TuShn7FCSPgtpo+TO4CSNLoI7DjcpffbiPl4G+dYOhAYilVTi6QDp5AbkC99u4
         feetbx39TImH4aqsBqndUSuk1JCOYNI/UxweIinsrh+XZcWICX9bJfWm09G0omrLso0M
         b4Wvj4GcyOL07aWYoHKAydHB8qTHEUSyxZdeOl/Un7Rqvz9yTvxTrWqALmECD+Fx8h+w
         BlnU0LXadRMdvIJ9ePwalz0e42E7/bNtnrp3GImx59bRYSiieavipsTOvKcfvH9+u435
         Cfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64MqRWRxznl5rkvRwGBg/kpUpb8ntoqeisI46KakmIk=;
        fh=bnJGbiEt5p76tTOzuqBRW+8VM8KcShkFHjVO3tvdWPI=;
        b=gceIF7sd6c6aUPWeUEbX93KWde+H3+Fh2k+5HklZHaoepetof557jk9Zmu7BZHvPPZ
         EHZKhypGWleDRBsGXH00QkvZ5pnbkMuTfWjw2L6dKb3sb3jMDTj4+NDUq9sz7uQTErXr
         mM5qb9kDvcR+jmlYBgODUDXXHmMZ6GNxjRmgfiHZ4K8Mx9mpz8UmjTu/yq/A/vo+BQas
         MHslvjP7Fo1yu6sp26GAwhxJAiDykc4ikmsB2CDVVdWw5qTTnuTgeZRk/6iBqpIdepEv
         Ica2KjsdPhidiYuuBc0g6kPC6v3PDVsb1TX3bdaTf4pxb35xQgQxQrkx222yDFY2RVlR
         xnHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342828; x=1783947628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64MqRWRxznl5rkvRwGBg/kpUpb8ntoqeisI46KakmIk=;
        b=RY67iz/FC45YyHjfQdU4wVN4DHBCGgqCuTSHiy/tnR/N/+e5rj4BACk+aFaPG2QsKV
         d/nzBdDrVDqjmWN14mgvX/ph8F+lu7XgWShtnqF8A0lv3qr9EfOBpAF8JAcBXAsskZHE
         LbjfyStMInixZhaTMdz/FGU9VqglTbnIrt1Ri8W1XdAmVb0wHzFztA+rBYv6VaESVz7d
         A+Z28w5wXi8qHjfXwZXeKrj1AwoYFtgyasIBl9a5dtRqwdhHGt54aVtc4LpURZbV4CCj
         1cQnAwnm4lktzoKJBmjUPOUXb11a/bSV8gcFw3AemQeVV6rAydJacGrTd07kKRoM8CkH
         E+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342828; x=1783947628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=64MqRWRxznl5rkvRwGBg/kpUpb8ntoqeisI46KakmIk=;
        b=c5kHE+OlKqL9K7dvmF7FtzT/WKPgHV8HEtwmz0yefA/EhufLu55Qn7tNerR+uBFtYu
         jVG4oDMVOik+QzI+yHbWJm+XnOpJ+GB8hnY11VYwblE4VjTXL8jJsbbULX0TLFDnr+vZ
         E/Y+iZgzH9+ch5wasu1/ptd5j7bWiRVnYwJ7C94S4VygiXKi0KZ1x05WTEOdA6tuA8D0
         9lGk1Xh2DjuuFDQZoHpRRgMlOYSCj8HRQm61+lJu3R7wEoIMbhEHCiecbImSzxcpHL+u
         /uBdaRK2C7yLZ1hJGRb0UZvekUY0i1KtEOmjnIT9XXF+i6xedpkmqnfbNz+DQUD40u11
         pf7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrFJua+UgYk6HKSUbK8vt7dDYYd0DcfER3LImpWrfYC2XgPmOx5ys4lylIsKHMlrSyME9ccNSIvJmV5zwvH@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfGDGWWrJ4g3ITXju2Bx3t2KOAmP10/uoXxs6V+Ihd8P5ci0p
	o2fqFe9hadE1jn76VQabThkeXP1vcqHIgIY0XpMmFH4DppZj/qeeg+KFEZso4Ko3ZhBpMvHSc07
	JWg44jn39kHdJbb+Y/bT0VIbkYfv9FyXlu5XWquJQ90WHEMoRyeK9AqmobziI2evTwDx+Qmhdbb
	U0EXbH9jDi0VBUoYxPloYaA75jw8OJ2JvXhsX1gfz/I4k=
X-Gm-Gg: AfdE7cl2l/QyFiTv4pmBWvt6uNBBzQpX4Yuw0hD++lQSGY84DyUVa5SucXw/O717Pcp
	T+i7OXYAJghFD9NU4fGbqkvnzPyymARxMwTeobOKHIFFushPmTk25upZasMezxpEfwqGN90RaKA
	HPgsrnd06wUybYyuo/5IPg+jLmggqu3RfCRLfEts9BYQ9ntjBRiBUBLU5ngaWnCzGsfOjc
X-Received: by 2002:a05:6214:2683:b0:8f4:6909:2a22 with SMTP id 6a1803df08f44-8fcb54d2d56mr2280366d6.43.1783342826250;
        Mon, 06 Jul 2026 06:00:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2683:b0:8f4:6909:2a22 with SMTP id
 6a1803df08f44-8fcb54d2d56mr2276366d6.43.1783342824572; Mon, 06 Jul 2026
 06:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
 <CAPDyKFrOHqStZbsye9Quk71UGkzUxOkwG9yAGYFVvt+=nMJSyw@mail.gmail.com>
 <20260122011417.GB946159@google.com> <CAPDyKFoPVeu3xe7ZAxBTNFfHmf=f7OZ3iUG=pRG8mD=UOGNVPA@mail.gmail.com>
 <3e04735c-ce0c-b2b6-508d-57ec363b8894@oss.qualcomm.com> <625d16ec-052b-dfb2-61f4-bf0404297f28@oss.qualcomm.com>
In-Reply-To: <625d16ec-052b-dfb2-61f4-bf0404297f28@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:00:12 +0200
X-Gm-Features: AVVi8CesWqnHpSXsodm3hqYxrbuRIbmHfARMqjYVery7PG9F4Atk71NGD1KkCvg
Message-ID: <CAPx+jO8rUwYV6q1-RrA4aZ9XnomSf82fgf8Jh2fUC0fE03RFPw@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Eric Biggers <ebiggers@kernel.org>,
        adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXzPuLrxc4Ad/U
 hcGRFiGG5MOorD86mdtNHFfq3sJ3qMw6S2pyz4eUbv9b6iLUPO1BYZbZMKA6z89cPlS9FCoGtZy
 7N95Ht+icXgcn8KIq7l2JqmdotLI+E8+ebtPZ8XYhE19qQWVQNIZ3b7TES28yQCd98nlTxOuMag
 9wsO6QWYLKMZ6BJHfMt2dHUJVrNTyRdwezQgstKm372gGYFNqdAKlvMmmHWnKjdvotlX0vHWlLQ
 N2HdUsCJwFgETrTzYPaN88ORvAtMa9ocWruRuYTERa5b+9HzIIDUmbGffIMHz+uzoxpr1VKJJqq
 CqymFg686j71TSQq/LGhcAH3/ZInB2ktj245iNxcJRNf97I4iwpByWlR74oFrNEBiSGxfVo7FjY
 W8RqmHrIe7oILhmy5GGVkx2gVT9FcauguTDUdl1oRbOwtW/5cwYEHM8bp9sL+4sZFs5g5HIPXp3
 bpyeL4CXpBpONrl5lsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX5sDaaua/s7EJ
 wtv5Xyu3978lARsUVnm9sFODzN4WEZy+O5ItvUSB3SqvejfT0mUxlw8XTabrrnOc2KLqkep31KS
 WriWGl4j/PmdybQGbGqqRzt/B6IZUdg=
X-Proofpoint-GUID: VVRBXGISAV6fvNPr921hwXlV-Il249O3
X-Proofpoint-ORIG-GUID: VVRBXGISAV6fvNPr921hwXlV-Il249O3
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4ba6ec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pEt9RQvNSq73iK8vQlYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-116830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:neeraj.soni@oss.qualcomm.com,m:ulf.hansson@linaro.org,m:ebiggers@kernel.org,m:adrian.hunter@intel.com,m:quic_dmukhopa@quicinc.com,m:quic_rampraka@quicinc.com,m:quic_nitirawa@quicinc.com,m:quic_sachgupt@quicinc.com,m:quic_bhaskarv@quicinc.com,m:quic_gaurkash@quicinc.com,m:quic_sartgarg@quicinc.com,m:linux-mmc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8F967120D5

On Wed, May 20, 2026 at 12:50=E2=80=AFPM Neeraj Soni
<neeraj.soni@oss.qualcomm.com> wrote:
>
> Hello Ulf,
>
> Can you please help to clarify? If there is no more modifications expecte=
d
> then wanted to understand when this patch can be picked for mmc-next.

Apologize for the delay. See more comments below.

>
> Regards
> Neeraj
>
> On 5/14/2026 11:26 AM, Neeraj Soni wrote:
> >
> >
> > On 1/22/2026 3:44 PM, Ulf Hansson wrote:
> >> On Thu, 22 Jan 2026 at 02:14, Eric Biggers <ebiggers@kernel.org> wrote=
:
> >>>
> >>> On Wed, Jan 21, 2026 at 03:12:43PM +0100, Ulf Hansson wrote:
> >>>>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> >>>>> index fec4fbf16a5b..a5a90bfc634e 100644
> >>>>> --- a/drivers/mmc/core/crypto.c
> >>>>> +++ b/drivers/mmc/core/crypto.c
> >>>>> @@ -15,7 +15,7 @@
> >>>>>  void mmc_crypto_set_initial_state(struct mmc_host *host)
> >>>>>  {
> >>>>>         /* Reset might clear all keys, so reprogram all the keys. *=
/
> >>>>> -       if (host->caps2 & MMC_CAP2_CRYPTO)
> >>>>> +       if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_=
CAP2_CRYPTO_NO_REPROG))
> >>>>>                 blk_crypto_reprogram_all_keys(&host->crypto_profile=
);
> >>>>
> >>>> As far as I understand, calling blk_crypto_reprogram_all_keys() woul=
d
> >>>> only be needed for those mmc hosts that lose their corresponding ICE
> >>>> context during runtime+system suspend, reset and possibly during
> >>>> ->probe().
> >>>>
> >>>> In other words, calling mmc_crypto_set_initial_state() from
> >>>> mmc_set_initial_state() looks like it's a mistake, as it has really
> >>>> nothing to do with the card's initialization, unless I have understo=
od
> >>>> this wrong!?
> >>>>
> >>>> That said, I would rather make the mtk-sd and sdhci-msm drivers to
> >>>> handle this themselves, by explicitly calling
> >>>> blk_crypto_reprogram_all_keys() when needed - and drop
> >>>> mmc_crypto_set_initial_state() altogether.
> >>>>
> >>>> For the sdhci-msm case, it seems like the only case we need to care
> >>>> about is for the reset.
> >>>>
> >>>> For mtk-sd I don't know what is needed, but possibly Eric can help o=
ut here?
> >>>
> >>> The comment for mmc_set_initial_state() says "Set initial state after=
 a
> >>> power cycle or a hw_reset."  I relied on that when I added the call t=
o
> >>> mmc_crypto_set_initial_state() back in 2020.  In the following thread=
 it
> >>> was also discussed that the code was intended to reprogram the keys o=
n
> >>> reset, not runtime suspend as that shouldn't be needed:
> >>> https://lore.kernel.org/linux-mmc/X7gQ9Y44iIgkiM64@sol.localdomain/T/=
#u
> >>
> >> The comment in the mmc_set_initial_state() is referring to the card
> >> and not the host controller. There have been some similar
> >> misunderstandings in the past for other functions in the core, sorry.
> >>
> >> In any case, I have been trying to understand where the ICE context
> >> really belongs and recently Neeraj answered that question [1].
> >>
> >>>
> >>> If that is not what it actually does, it probably would be appropriat=
e
> >>> to replace it with something else.
> >>
> >> I agree, the comment(s) could deserve some clarifications.
> >
> > Hello Ulf. Do you expect modifications in the comment for mmc_set_initi=
al_state()?
> > I am sorry i did not follow up and assumed that no more changes are exp=
ected in
> > the patch but i stil see it is not yet reviewed or approved.

There are a couple of things needed to get this merged.

1) Please split up the patch into two pieces. Let the core change be a
separate patch preceding the change to sdhci-msm.

2) Clarify in the commit messages that the register context for the
crypto profile belongs to the sdhci/cqhci host and not the mmc card,
hence re-programming should be managed by the host driver itself.
Typically that should be done from the driver's runtime suspend/resume
callbacks, even if that isn't needed for sdhci-msm, it seems.

3) To avoid breaking the support for mediatek drivers, I agree that
adding MMC_CAP2_CRYPTO_NO_REPROG as proposed, makes sense as an
intermediate step. We can look into the mtk-sd driver later on and
clean things up properly.

4) The call to blk_crypto_reprogram_all_keys() that's added to
sdhci_msm_gcc_reset(), gets called once during ->probe(), is that
sufficient then? In any I would prefer that we don't use "#ifdef
CONFIG_MMC_CRYPTO" more than needed in the code, so  please, either
add a new function within the existing section along with a stub
function or - if it works, call blk_crypto_reprogram_all_keys() from
sdhci_msm_ice_init() directly instead.

Kind regards
Uffe

