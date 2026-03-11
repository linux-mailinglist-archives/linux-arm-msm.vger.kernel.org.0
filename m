Return-Path: <linux-arm-msm+bounces-96790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLPqKJS1sGlvmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:21:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B5259B3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DA8F3040059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC313009DA;
	Wed, 11 Mar 2026 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnkRx+Qt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nc5pZyYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D331E107
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188455; cv=none; b=QpQYqqo8SJi2jMtvEB65DBgsfbrYozhedVcUnuodG9QS0ZrAaGW9rOZ/lGdi6OYGOKb84sm2GBimYtyWTBbEhoKYosoQ+94KJjZ1dpNkTsds3RWxCeAzaP2GCqISVqXynXT2a4p9TwQXu1jgpjWkCgVZAkqMKrG2/WjHxSe4Z6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188455; c=relaxed/simple;
	bh=pelA03jj2FiDGxwf+XytSDv8oENkk9fAv5C4nFbyflE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puTsV4KVNoVp65+o3seFqKDLZ10vRlgpT7twOgKiPBwlnFQRuSNAd04jvKtmLgvthyx6keIWsCFa74YUfhNO6lELchnJy/rB+3CTznm91FOale0l0MSOviamDhNq6qzmNSigkrT0GbZfMwM/aKgpjxZ4oPb91j1qK0f8RNEiaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnkRx+Qt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nc5pZyYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AInfSU3417140
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Soyoe39fzWQDtJH6+LD4/cBb
	xae2zmQrTURDYpjYC90=; b=UnkRx+QtT29uS0f9N8unViMGjHj2+QQxbn50Jh/m
	NVdiVStfz0pEkzpeLvD30CgIUBWnWQpIr4BEZ4ifY84CMD/cAvabJ3Q09s8hk/B3
	X5hrekxqRZ2AkOcdIuJT+bWFu9O/4hHdOZel0irx7cqIo9Od7jfIYmhEZut8OroG
	QvzMs18RXHwfJ3XD02yUVXXU3yn3HFOIXH/CqZsXnRTLjK3Ao74RGTYo5oSh6IXC
	jdktJnUXxbZfLQFD7osocjTEXOfeA3KN1dmNIfSMODDFL7h6TqZwYaMS+GPd0Pw/
	GTI7BnpdugD5vcgmphji4p0MIfJGpl1SU7uQP+9NGYfkJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2aq9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:20:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd85e08fddso2578091285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773188452; x=1773793252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Soyoe39fzWQDtJH6+LD4/cBbxae2zmQrTURDYpjYC90=;
        b=Nc5pZyYa1R64PS6SpOavqKbhEgEgRWEnmvKL0arMdOhFXxonGEJV85XTacbtA5Ehen
         tZkE/TzK3n3UHaQCmm+jUrgRNU77D2bZ5+kex1d78HvOnJHrSRtc9ygZNvs7EIdA4rVb
         6zCDP1cZxgjYxlRenWlLn0rkNGQ+qwan2cjL5GjTBt7xXlu1wOxK8l4SgxZiag18W/fV
         /CneJ4xFc9sh0Iij/4Pht3nqRZHDPun4fDJ1AR7Nm/jfss2a5cpcmUCyCTDcS4Jn+7jE
         SWmmrm2d0nfICzaS/qgy+dTdoB76i+wHAplWgNopGdUCSa7GCyClY/bgEuhYxftSV3Zw
         YXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188452; x=1773793252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Soyoe39fzWQDtJH6+LD4/cBbxae2zmQrTURDYpjYC90=;
        b=pqYBmMaSKi1J/G+0CB6K0KbPRa/7NO+rA8KL/esLJCUJ/oAoBpQjP7PTSSnjo1nt7Q
         pnu83tlf34733oH/pZ8aJV6INY5EGEGZG1gSa3VHnT7RoTucRYro7GX82rnweHRyP+JL
         /CxfFovgcCm3zph5tP/eicZT17cy0I0FKxg4YPSfM18SnInSIUINIIPE6KXbpRX6VLJ6
         SZopo+ecAL3ddvs25X5cUUQklmjDBiIx9Kyn38rjSFUd5HCB1pSwtr5Jte1zQ7BQLSJT
         ZPL/sDxlv/mZ0VLw96PPeZ0Ag0b0YHm66H8GNvEeTVjvP3e3eliHA3KNjpJdMmWNcL2o
         ZLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVcc71mbWhzleMm68kPWcqdNkhVKxMDi/Oyjc5d2ME7bQPbpfuIwh+3Vppcz7VTq2nYr+w2yfqUdMN9l0F@vger.kernel.org
X-Gm-Message-State: AOJu0YzEKplJ5DWj9K1/XX6x5J6JQwsURzh0tvsPpfhcJrWscUBNKhqe
	mESly+RzBaMnuXUbMjkVTH50SISLG9KsHK4U05f0F73QEa/TX6jjDKFurfNJiem35Wqd0F3tzIU
	md1vUB+v/TThIiMc8Vz6FmEh+5KjzbfROnV3fYm8AvPq+YmQyUHnRk9Xk0YLf2+6BkuGN
X-Gm-Gg: ATEYQzxtXP9P5wdrdMacb4BchQJybIGkD534/7N4snA1GV+dd8gml01Z7hj3ju5bBRC
	CGRKGPOWxS7s9JH/XQY0v3mK1Q9J5v/xrHK9ope+M/qzBfDhc2T48lBab6aAxlwfvvKuOZr5Hko
	D9t0Ufu0sIv5p4auRcjujbE4U7ebesS1Llq+JvXG49D1oQvb1+wejr7y9TRuQiisxv0MPmifXEC
	ByElpBB7byGQGQD4221O88m4hwumpjAW3E+q6o/2sbe4YX525gY+UWVbHxuFpupy5VumdlTuUxA
	snGvFHqRYO2/hcp76+sd0Pr/XTiwGGT1BdDDQHxYKex8C2mlMC9qfcpWtIt11yOt0siyh3hqtvg
	qJGUE/ZqXSCQOuHJgIJ/VUsII6HXPNrzvPEw+shSj21JdXNanM2dveoJrVlUrVMIyvsj5ozdWMF
	tnIXwcteAXpndShWiPUY75GkunCM+iaWTc/xw=
X-Received: by 2002:a05:620a:4115:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cda1a3193bmr111462185a.53.1773188452179;
        Tue, 10 Mar 2026 17:20:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cda1a3193bmr111459685a.53.1773188451667;
        Tue, 10 Mar 2026 17:20:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm109086e87.32.2026.03.10.17.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:20:50 -0700 (PDT)
Date: Wed, 11 Mar 2026 02:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Message-ID: <3jr7gi4u6y4ldbqwrwlouhmem3mfzcs77sjwvxyhovl42qs4w3@3kwsx45o5e5n>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-8-acf036a3c84c@oss.qualcomm.com>
 <c37c4efe-c32c-7989-0c69-dfd0b6f71fb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c37c4efe-c32c-7989-0c69-dfd0b6f71fb8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0b564 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rXw9MLyP4ygTMl7QpFEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TNW_5Uvq0Hdn1rX7ysk4r4YICFhJZkqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwMSBTYWx0ZWRfXxYJiX+lR+khd
 +Fz95wEyKKF0vmF0VEutzsYgsmmZ+6o2LnRvFUATgxSpW8pY4VS8Gwfx30KqgoHxB87a8Rj/Czz
 L/LWICJwvKV0myiobqc0e3dx1hJ2PS12NphAxd8RgpB6tI3SKTP65kqJAH3NIjlQlsG9oEy8xOe
 Jk/Pio1QDyX6QK9xTccTevpvjYjenUqzi3bdYQ5eBkTRuBTvPSp+WerENPqkyVpHA6PyF8sUyrx
 lBBR4z6B0FF+99MPNOOtAuZnXymIJ8X3dNlhpQYb6MrzC9zW3ex52CaHX66QKsZ77I+wyMU1jzk
 C5jqm9Ffas8VQVQilZ/s2ygoxyHVK/cwUpFHvIzegwjgqAW45y0yr7HzszLPRA+92JhuzIz/U2l
 Hti+3wiApBKoEaoNr9TuUKHVi1bRMQ0GUcsrz1FpdeST3oMJAhFB+0qOmlFWF/3jqodgkSt64wj
 kuG2tuNjysN5MDwZ2wg==
X-Proofpoint-GUID: TNW_5Uvq0Hdn1rX7ysk4r4YICFhJZkqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110001
X-Rspamd-Queue-Id: 429B5259B3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96790-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:17:12PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> > There is little point in having two different structures for HFI-related
> > core ops. Merge both of them into the new iris_hfi_ops structure.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h              |  2 +-
> >  drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
> >  drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
> >  drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
> >  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
> >  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
> >  drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
> >  drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
> >  drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
> >  drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
> >  13 files changed, 31 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index d10a03aa5685..d919c7c16106 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -112,7 +112,7 @@ struct iris_core {
> >  	u32					header_id;
> >  	u32					packet_id;
> >  	struct iris_core_power			power;
> > -	const struct iris_hfi_command_ops	*hfi_ops;
> > +	const struct iris_hfi_ops		*hfi_ops;
> >  	const struct iris_hfi_response_ops	*hfi_response_ops;
> 
> isn't this creating compilation issue? This is being removed in this patch.

No, compiler ignores unknown struct pointers until one wants to peek
into it. But I should drop it anyway.


-- 
With best wishes
Dmitry

