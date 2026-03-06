Return-Path: <linux-arm-msm+bounces-95917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNfYE5gxq2n2agEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 20:57:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8812274C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 20:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B69330013B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 19:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181B64301B3;
	Fri,  6 Mar 2026 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhWM456f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ID2CJWGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7139438FFB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827027; cv=pass; b=LI1IIkEhDkG9kgqYshrCAMFys0BKVSH1dzzFXHsJGoGtoWK0Akwg7hcbQ4m9aGmk6QMsF6v1JbMPE/2XmtSYnwDZZmIh663IS7/hafbFz5IQgqu2X0PeYpPlstk7IJwq2fM95bJREWA7mFgdif3Tn/7Mq56NWjhhkGj3mPC+ZUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827027; c=relaxed/simple;
	bh=F1GXEAKFM9HW+kf+pB+r//7wuIewmU4KkClEAaN8ggw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vaqs5b75WmluFxrm85/qqU1LR4oyzVD9NxE8qodxGqdp+WykcGYb9mQwM70QZB1x+EsViuZHmY+7OOq3eHkE5NXBwPJQ027rS9NU6snuT0ZOucp1rbzggpZCZMfoWCrkiRQtCfcewqQocHeP/fIeGQz78xls/j5yh+7sXonDpls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhWM456f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ID2CJWGK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1fgc238669
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 19:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=; b=KhWM456fIFWD89ie
	ah+ZMSosj07JXMeCh80dSQFGNxUFgJpUGYmdchgW0YOESp/GYbrcHa+ztv9MGe8r
	WL5ubHBLptN5DfWPdCkQK73yJwCAtDqo5CfRmdmXWHXF8zzebBn7hBLNFJ+BEpui
	LOBKgZfTWwBPRuGyafufLoeDZV2LtqvAbNPEuWNeEfrxyDvKd5w5oV7/VReTKvaP
	4M1T8tuVs4FlOBGN+ERRA8S4/dIA9RUlM39CXqubbk93rUIoT7FgZzYZTnZ/4WnL
	DYNLsCg1issMNow6jFOJ7gqpSQvsS5gzvZcstxF/YK/rI5xpykqHsXhRmbB63knp
	h+2Xiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98j0s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 19:57:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so5229399385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 11:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772827024; cv=none;
        d=google.com; s=arc-20240605;
        b=Fu7HtNG8lq+8fswqBzhsXY7XHrrSjSOQDtbjuseRbeHuvqWn14YaMjP68BrpSDUUzT
         Zndf+bh2GerBoBcLmNxfaBBvtMDIN5zIOt2rE2bTm5tn9xvhgKtVqp/+D/vkJdoqMsk7
         FoLbdDfqaLDnpNylXr8QBlL0lHHaCAt0wyhIYVpEbqUjYzKPAZFRTGkxsgaVWdNgWhwa
         QevNfyChpumLDTDVt8SUvMwVZ48502T5jtP//IuBGL8bj7zZgH9Y54FFvkeqBKFrGaYp
         HoCnMeXlngECn8zdVPq+V7d7xlxXW5mnrIKJ1bnlzqVAWPGui6FC67bb2+ATb08KNidb
         4bIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=;
        fh=HTAk4mirlTlW1E83Lcags5DXKZo0xEj9LtpU/lpc7Fo=;
        b=S3lUz7Oq6+PAnb8gxdMMXMAIcDjjI6/omMVUqxPRNTW3H0u/5KDcg07H4TsEqu0Is8
         qaFNKOCN45MW3PZgdlcnmy9EhbPp0t/YjV+73iDS6v5pRzlzIgrA1pbAB1TJ4HT7x/Q0
         /USPP4c2WbHXUNIp4/ib5cz4GWcyn4gXnw2dc7YE1/dRHk8eek1ztwlZTZqEW6D1Yqc9
         EOrffxY9/TuK01qk3U/dbabi/TIXI48OEQHGdXkW1wedh0Pm9ptP78h2XjB8667KE+Qn
         gRQAhK1dJi3dBIfZx3QwuYfC1NMCyq++8LvxwXRcw/TM0TsqMCr3hUIR8mgfSO2NGUiq
         rpIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772827024; x=1773431824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=;
        b=ID2CJWGKMpFwCF/jfSlqkZkCvRjHX5SH7En1OpUdr82qYA2MiTceU9oLVvsAt8fcAF
         VEm0abw8XoioNekNnkbjAlxNsWk7PVNm1xMNS2XKGYy42bezE/bjIfoMjBUC28cEFrFY
         S11b9x5VdR71NLPjNwlvVj5fFw3LAOgyo6Bt+xWhoyuWTYk8QSXdE8xiHR5w2vY6+qBB
         Hbv6CMWqKk6mFxeR2Z1Gl19vQSX7wuYK1PLmB3aYoXO1ArMBWNdTYvL5EluL4CacjRNk
         /vziLGb05gbPCHA3yuYE3rXv4LMtu9xlW7ShJnIiT+pAdth9kKKdc/l/BqoHQ1JnbRIh
         1PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827024; x=1773431824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=;
        b=LB32JPJ0XwrKw77iS+4Kf+bIWv3GWcQAEJsX4i3t0UCfpuYm3NAQ0I+0Z1Tv4wq6Yf
         zk/J9lknvQlzOKtxC+5DsaeOistcPrZy4shRGknoxaDaH+hpQCfgRKbqQZxffExXPJs1
         NPhE+SMuLL1s3fYd8VXcomwvR4EiIUIvs/MS2/0YEc/LjhFX6Nb6eAJWGqSrzefbRM2q
         rw4m4bRHsYoIsuQ9NJFlU+/+2iq0atj3FYq7HVESJs6Alcf/wZeEeQA8nc+uVUKv13DP
         O3KZRT+m/N2GtAUyvOZ2PquDaLK0FcZ0UDP0yEmrrYjnZuIbG6XzyaqPdyyw8akP/mTB
         Up8g==
X-Forwarded-Encrypted: i=1; AJvYcCVfzapxQ8H9yVgqmHAGE81sZdHnbKpN4YuHNmzLgfWrlZOAjaOcO0mpWZkiBkp0fMqwDlPGL4HjgUqHLRF9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/dKfk05bTFOhjTwDHzO/bXnpjJ/Ser80KlUH48DStqfIyi45
	Mt2Ju4IIh0FaQCUDC//85FJORsz6OMBvFl+Jrzj4TwTBrHwRryfTMSQ2Polkw7uamQ2q9/p8XOD
	ZvQ58JIuZfYVWPqieUb5y2GrIHfGjf7o+nhF4vqVOXIXGsAHzjdQVgJvAbvNzU2ktH6E5Ij8vxw
	A80DqxIT7HOhBjlgXnKHld0V8JtUk/+4x+yfFFcULfluBKKkrQoUlygOyP
X-Gm-Gg: ATEYQzyveI+Pd79lNkk17ELyEp+lUy1SpjafAA04vjfrmvcyMz9vn7a5fuly0GXNzcJ
	c+rE/ytBsuweR6PnUPzUIunMPPTk1NjnSU/OF7K37tjJeVV6yqOvR1PwHOIiZjwikrbZFiTzGWA
	/jnrluyuNTZDUIhmKJYv9QuJmaEG8zddtFrXtrUgaaldP/Pd4I9osZAGdH0zYnFRpw8FB6YcmPz
	lmBFboewrtgFU1IRIfIwKsUOmIFXeVblKr+vrQ=
X-Received: by 2002:a05:620a:199b:b0:8c8:82a1:11bf with SMTP id af79cd13be357-8cd6d336123mr425693185a.2.1772827024175;
        Fri, 06 Mar 2026 11:57:04 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:8c8:82a1:11bf with SMTP id
 af79cd13be357-8cd6d336123mr425690485a.2.1772827023804; Fri, 06 Mar 2026
 11:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com> <273f0a36-599f-43f3-ae88-6c332fcec21c@linaro.org>
In-Reply-To: <273f0a36-599f-43f3-ae88-6c332fcec21c@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:56:52 +0100
X-Gm-Features: AaiRm53CDR5xigeVlLB_GfOidpJ32PIHvo34yoPy5FfuD4m0MAQ9A_TaJlqBwtc
Message-ID: <CAFEp6-19iFC3=mKj0GsyaUmLfa7MSp22hLH2q4UJn+aZGFACzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HaFE5RP-skGaVT0_pAIBaO4kqycSoaEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OSBTYWx0ZWRfX5tTfCVQ65UB4
 7/p/7bWgkI8LoHkQAsu2itJ67w867ePfeGIIzswDEe361BjHU/kO20RdhHTu+DbSgtZtY58J3L8
 eoMeMbq2je8zQcpWV2GK73jRvZkSc/+bmT3sQUS5GMAfa01KHXv4lwF7RZ4T+vWzU49uBxZTl4j
 7jhvxnknjeLdk1DCp/PIeIdN9tBw7ulonSLjOoQm7Qo7Eope6kZM3F+U3VQ337o84r/PQXFbFO4
 QXHIwRnNeIOp22y/R11kChF2NY0k8OQi7sUQS5be1LelwvNqGcxdHa8NbSLB2biTbaCmJa8Ctbo
 rwUwe3DyCrOzZoZZhJ4ZcBFpIxyT12FmQMv+dzWJn/PSaUIynyoROYnv1wOMkkw7ZlK5Xw8ICl8
 oOjZBlaFFO2BaAPGwMzF1/BwQGDdDpp55EGomZ37H/y4VeK/EmXcM3KcoYvDWYZGydf5C0kNxyj
 m/HvVvKVpGVe5Kwu/KA==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab3190 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=yoG-TFf7P2EgAD0aYroA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HaFE5RP-skGaVT0_pAIBaO4kqycSoaEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060189
X-Rspamd-Queue-Id: 4E8812274C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.964];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 7:00=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/03/2026 16:00, Loic Poulain wrote:
> > +     default:
> > +             WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> > +     }
> > +
> > +     return 1;
>
> An error should return an error not a default.
>
> -ENONOTSUPP, -EINVAL, -ENOWAYDUDE something to indicate failure.

Yes, here we return a 1=E2=80=91byte default alignment with a warning as a
best=E2=80=91effort guess. However, it would be indeed safer to return an
error and let the caller handle it.

Regards,
Loic

