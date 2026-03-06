Return-Path: <linux-arm-msm+bounces-95916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KOQKbgwq2n2agEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 20:53:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48022745C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 20:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8114B303E4B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B923242F57B;
	Fri,  6 Mar 2026 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCY4NdxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1bbnsDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885EF39890F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772826805; cv=pass; b=HgEAPeyRLCh5fFcjfsDmSFvhqwAgfYM6UJS2TqlrpjiSJ7/URtrCnsKIHJdaMsb31m+XMJp0iMUVrqiSxv8BR/j8vOFM+chEv1wA0pH+mbZUQfrpr1vItmNYLsCHCfyRCwNE8Wib4cGDE8brIP5hz4Y79Yum1ESfro5cUprzTnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772826805; c=relaxed/simple;
	bh=OjfTU+0hklkn3eFr8miMyNuw19Uifl76RY/4T8OKZvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw17d9If3rk0PZD9RnLwqFTzjDVVBcjTf240yc8gT1XP+qPO5jscggxCbq5pWBFwc/YLA1aryOwCJHXr6cTB6g23D/HjTRHd4p0wv2hjv/SNBvYyAzrLfiRv33D+IlWIRphpbhCVgrJ348af2Jt/5fq708H2+Ce87erFz5gkCtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCY4NdxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1bbnsDb; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1Y0r4115466
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 19:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=; b=iCY4NdxMkxM3P3/3
	1bB9jCpR98Rg3M/bZYigTlUbZJbzHn3XiAl+X/BlTpjNnTNogdtx9/PpIytAhPtq
	+KuHt793yFPxyh/SYrSZfVoy9uFqZvbJgmqmJY/mIT7jZmsI+8dfQYSwLgWfJm8M
	sA/Ng1AEJmpXTPuuM4wq9/KEaE59Y948YWE8Mz+JFHHs/5MBf3PFyNtosQv5J1wf
	PK9+KtDtYB3zeUM5JPgBBaRIQEFFki5Y2i1bIUE2n6dG4hOl3q5nLasrB5BuItVM
	uN1Leboko+28Mm77nwdaASL0ehKQp/yAbRjlQ/3K4tCuvw9JwkDIOvHZvToXwiR3
	zpXyLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ua0h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 19:53:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so5007865585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 11:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772826803; cv=none;
        d=google.com; s=arc-20240605;
        b=kkehLlTCJtAld4LgRKeNwzS9P+724DcrF3I/gmjOElHaFWXGKMl+hWhwD4v0nMcT8R
         cPLFNCnR0R8ste5zAohJgEeF4G2RPqrRhTJcSHreNQBZSM7pCEFBLLVhVV/SiRvS1yN/
         uxdRVsVCsNWS4286eglDqSI05rmrAf6um/q9uV/a3KTUfFzAwhyy9lxW6lyPx9uLCxi8
         oeOUvdkwPbv7SGX9RUFwhV6aZQ9Mmh1eK1F9FmAQ1Uld+DEEmpNQ4bcOLOwkLT0KWOgW
         7Z87ZUckD3hgLVMsnwQLglBknWjv5Ft/uj/IrQ4DOfy7M5CmvZYGfvsUBG2qG1Su+eDb
         +hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=;
        fh=EpiXrHRp/IEBglxUxo/MIVitdWXmSPbi0WHP/3uB8G0=;
        b=j2IvZAPxxjkVDT8eEs96lUg3Tw39cQ0b/InfxBg23VGlPr0F0HzRwcSTi1uleZbHGu
         uAe1EalqiJo7bs3JQb1CR2Z+YbmzB/wwJ24mXxBuggxLiM66q2KpGnFl601Eu83CfI/J
         dHL3FpgLpcvu/YbGCQB1+KKOc/HpuPvNiangc2UqvGDD7/8svhV2MeIHgoXZ3sreD+nm
         d5k9F61WnthImYBjMSFyyzxUc1BqD51hSKNELxfekMuW3vxCl4Pirpu4I8KEIkLw1SBP
         T85v4SZVJUSjH/W0PvlXaKzec88kUFMZyYJ1L+XuxA7V8sntW4OhsCOJwPjT8tLo/FCf
         pckA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772826803; x=1773431603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=;
        b=W1bbnsDbrIGNg3G+cubzbXnSgloaeGZKvMAP/RL1Q9OXAMjJgfQqbIfJGnsmmo191N
         P5wZlnzVjQ3hJzGJB1EI+3yryN1bFbDVqO62ws2yd+sqPE2JODhynWuXc8nnX7l6jzA6
         TnG8Tt7G9Nrf8xaGodqdiTze8QLcE6iKHG9x+Q+wFnvuuRzutPNW9BuS/FRkbbd/B/+n
         0KOwFvCXInN5gAiHtrwIssOkd5J0CD1LCDzRfioZR36O8dsGPa+jqtVpPeAdAFrCp8mE
         ulcuLdmT+Tco7lIWd0+f+wPGSOs8lyJjAX94BCUEMB4IJL6lYVJ4L4QA7Kp8EKhkELap
         a3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772826803; x=1773431603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=;
        b=NDppmB1+1I8o1hREkCJJ4RysGK7yEijn+rW1cyzj0fFR+6rg85TcA2VBQPuC0n4C/1
         lZyAwRIlN7c6OKwmpGx+OnAJ6tPsFglpTfNA3hPznbjdwdH6jfHL5eLUlxcvoTe3NyqT
         o/y9ORw0no3lWBw21cAXVtmMLFiLt7e6KhcHO6wOPMjV41Trhy0z5HhxYo6hnC74vgci
         4AhEQq7lO5z7qP12948wPmfRjoPHmtP0q+bs9X61ZPWXbQXLvxcex/D4yhgX8SEu4Ic4
         52uAez+uX9Lqq6aMXvDK80drg71A857rAmzxB28oMI3dsIwFviyXIs5j+Zrki9NYKKEa
         Of1w==
X-Forwarded-Encrypted: i=1; AJvYcCX4fW+naznqCldCLmLSqtieDFeZwEn0BLRNQAd+NcnNaDj/1x3fnT6IiNsSKmlhfkAfcVR2tdidOzB/1OTK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj4yra6L+s4isb9PJUki6hMOQtLZCnkisO2eYaPYNLcVRcP+qk
	8ovOGPD9i9uVNCIDL33nwXh3LAGVSKWNNV1AlsA16obw0FULjya4Yio10YWYdkqnNQtxAURguI6
	zowtgOA8AbTRJxj7ysujmsKc8lD+xdMBIENQBA2jGurNo6uspdG18xVntNzeJCyitzgaI0exZhJ
	p6elcCCiM0tdADBlCrj1I5gozqLGR70caYJAcHyzh/Xy4=
X-Gm-Gg: ATEYQzyWP6JQWccn5sjpeQ3g/W9W5kYwTWIScA0ycKFz92O+PdRvOfqOODQE4lRjuiE
	achPuDgY3fnuCZjFhYQV9WGf6YmU/iUIfbHVUe25XYeA8hgxbxdiu/jTh2n9wCFoekDBZ8sFi7P
	vLSOC/3TcDP6mqllaq4gZugtLMitAP5yOmi1LIVP/+zgWCZpsjS0X+cukurhD9tpNhlDLW5KoiJ
	zPhoHpJfxsClAghhF/ovPmnUt8OfXcyId9DpRg=
X-Received: by 2002:a05:620a:c4e:b0:8ca:90de:43f7 with SMTP id af79cd13be357-8cd6d52f361mr405114685a.74.1772826802790;
        Fri, 06 Mar 2026 11:53:22 -0800 (PST)
X-Received: by 2002:a05:620a:c4e:b0:8ca:90de:43f7 with SMTP id
 af79cd13be357-8cd6d52f361mr405112185a.74.1772826802351; Fri, 06 Mar 2026
 11:53:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com> <c15ce981-a14a-413e-8c81-7ec8521420a2@linaro.org>
In-Reply-To: <c15ce981-a14a-413e-8c81-7ec8521420a2@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:53:11 +0100
X-Gm-Features: AaiRm511H0k5u51RsbW7kfh7JFdb_mXCn4xI85_aj-Q-VMcInjAD-KxtBanlQlw
Message-ID: <CAFEp6-2K9kr_2WoA-KuLDfF7wO_p5q1G-pnw-EL6TCS0tfoKag@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: vfe-340: Proper client handling
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OCBTYWx0ZWRfX2iMXSg5/VbhM
 yqqGz/0NlY4UzPDOuhsSpL+Xtsw6v6jnA7NH6tnoBxqF3cHOpPkrXgUdnkv3HwB5tS3zOyeyWi9
 VLZhoDntE71JI2OLj8p6ohKt5Nfz6tJJjZ+zdNDcoWEF+LedM6rfmMjhwjHE5BuL0+YZVhoyzm+
 +E2ld6AcITAYxgW7G+Ao1i7NeRyUAdmtQ52H2pkZgexkv6Af2Q6T3H+XXMKZWm9wpVAHKYBYStu
 LkOeFMN8UIgvEo8ojFMSK7wuYSDC8ZrkfbDLFCvHo3VzvJq+N4SeADB2Zek7U6B1Ef/dvMCudei
 y3Ps4kWqSmTNf+1sCMzHnitvB/fHDOi/d/2f8JKhp1iO29CogRX3zpTm0ZA5e+ejhvXOOeXepQr
 Vi9POZ6Zbim5k9081p+q2cXGjINIpEr/Rgu51UbBFCOCfzTvkMaSw+2Cn5Cv9KXy1MVOqngeK54
 S6JCXO4jVr5wJEcnIfw==
X-Proofpoint-ORIG-GUID: Rfo6G3EWDvifoYb_yqw0weiVwZDJAAdF
X-Proofpoint-GUID: Rfo6G3EWDvifoYb_yqw0weiVwZDJAAdF
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab30b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EoIaBvceLRfHZLnecOMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060188
X-Rspamd-Queue-Id: 0A48022745C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95916-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.964];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 6:56=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/03/2026 14:02, Loic Poulain wrote:
> > +static inline enum tfe_client  __wm_to_client(u8 wm)
> > +{
> > +     if (wm >=3D ARRAY_SIZE(tfe_wm_client_map)) {
> > +             pr_warn("VFE: Invalid WM%u\n", wm);
> > +             return TFE_CLI_RDI0;
> > +     }
> > +
> > +     return tfe_wm_client_map[wm];
> > +}
> > +
>
> I still don't really agree that array out-of-bounds should result in RDI0=
.

Ah right, I will drop this.

Regards,
Loic
Regards

