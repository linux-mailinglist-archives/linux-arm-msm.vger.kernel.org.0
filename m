Return-Path: <linux-arm-msm+bounces-94375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK5nIWsZoWlhqQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:11:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA78D1B2833
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 864ED30F665C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41163451CC;
	Fri, 27 Feb 2026 04:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozUvYwwj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQv7n3zJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315BD341AB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772165477; cv=none; b=oULMLPsFgd6Vu7w1p6orqnOKkjafmqMULH7k/qAED+C2HRBW6yJn/W2iznVmP6eXy/O+4cQDF3q/QWcex7QOheIOSSN8WCNWxxXg+sYL5OaVnk9Vdiy8dLnKbgd4WaMTI1GrXAykpCHk36To8JaanAhIw9rakvKhyXq+zoPfEXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772165477; c=relaxed/simple;
	bh=uisT4pb2MAP4MH+TG3Jxw4TNM14eiYkiMkCLL1TUZxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0aeP1xkz95qxA0EgDT4SfVV3Y0P5o0Zkh1AwbSQafwvkFb6JTSNDnyqwrXKXzewVcVWONtmFJllbc/kbJGvs3OGT+/VYTA3gYrGbGvzgpAahdslkT7M9YUxK53BED+KC3oL7ElNKHled1eWA81zzaxRqwuCYeysr5IO5rcN3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozUvYwwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQv7n3zJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jvpg2413809
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CfM+uZFQJfh5VRYHJg43E6iQ
	JMmlRy1A6yYxh5884cI=; b=ozUvYwwjH4OpWioh4n3CfXPcdloTf0mo1f4879iM
	UXPWuDp70vXNbIhQrqstnuZa1TZk7C/Rp0Y6oLahGf4xi2hZXTfBjV0SgEGrlL7O
	rWZ8ugUR70OPfAhmDqj12exE/SZbW6CIC9k82JTIJlmZCy/gCP9Qkadtfek457X/
	mZeK1aWdm6dj9xLsUrS9CbgkkWqaSuimh9sLQ89k5n08lgmHVtgNqgM/0Fg6MdIW
	lcMZ43tiHF8tkpS3+Co1XxANa14S+LYShb57QhyoDRYX0JlLxUegTx7rGJeFnr9l
	v62GM74nzMn2iyNYzNEN+Z/ht2pwlxqMykw9pcy0nrKyhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gcwr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:11:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so201388485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 20:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772165474; x=1772770274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CfM+uZFQJfh5VRYHJg43E6iQJMmlRy1A6yYxh5884cI=;
        b=SQv7n3zJSa0LmXA9pzILW+Gtyq9A8vHmc0b5ehEy/YJZD7QPTWFORzFeQVZT4fAq37
         2H5Jx4g7lmiIoW9NLbQA/fU9ERQqZPu8vNOGK+jQ0jR+Uyecq58dsnYQChuhX90qfYDP
         fokwiNaw4h8l1rzjW+llFvGYmWy8nZ3jvqg7QN2pxwgPgd/cgevta3oPAmcaVs0j1wtc
         xaDDme0BzUA/fJKRe7VP0GBEir8EWfIh8bslfL1kqsoi44GmbtHtyCZKGYP4WyhWfzwl
         cAcFmZ9OLrqHm3kdgR9ez0YWRKrRpqlTCiYOgzVtnUJpOdevmaiL1FFS/xnkuBHs3JMh
         hf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772165474; x=1772770274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfM+uZFQJfh5VRYHJg43E6iQJMmlRy1A6yYxh5884cI=;
        b=AkuN1jO6EyMjRJ69pjoe6HTsbDdLYoQZKe7wermR6ZHXsPQeGyDLmSHM005qN8IErc
         TdntMeVJemakMpWLARxkNY2i7oq5ynWrKtymV5Tvy4NipISa1R4IS+rfj2mBKeFbr6LN
         DoAgBb+Aoy5zQSRJo2NnjVuQ8By3y++PeC9XzFBtFKedyWa681q3FD6ZLfRBSGr7cW2I
         L1vWhov43HbF3mBAhRg+HYmB0UNEh72nQ+HVQLSk7fQJvIJO6VfICVRCR9I5xqKoJOop
         oVTMr9owHf2cbpYoVWYp3ZLGnvx8Zx13e2FvJgp+w3xxuEXIe0US1GA+dLWGbEBUJ2CH
         QSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpbx/cE1QZVV2TTKfDcOtCdC58c+aGxhRSRZE8UUYLBaf5OWR2vc3J55OGx1IPMGGEFxfV0KvFfr3RxLGD@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMKxnGLbOA80fstTmx8foq7GBO7kiMTUQa2KW7+3P/6q/KyyB
	1kNEyaV68O30u2vuF9p0VJrnOwJX99LXmGrgEjCP+Y2t9KjfDaHbjvbSLGxDbAa+av7jNfhdZgN
	JHFIa0iJquswLKMXGrUReueLtCTypL8cryeekAVQ3XGJ/uAiiLTJKIe9HsGxsDywpUlDN
X-Gm-Gg: ATEYQzymosSuDQzhyVcN9amWifuU2+UhaIXfJFkKGCaHnO6/t5o3jBA+zd2+oLBdhAj
	8BOUAUOmnAp8zgAO1dBw5+i35IQ3+Df1Zkl1jHbtvUJteqwkbMvdm0xToJA8rYfyuHs6/zlGV9D
	4clS5QaOYSSXpiuSSFQzCT+ZHZyazFq5xakOlL1U+ioz5noQ8aZWr3Eh6dj3VypHASDLpbH7drk
	FSirY+pYTqTVWecCi22yIZU0WKz/itlZWKrZ+6TnQXKpi83i9NYawzyyWVBnAeRZA4u8A5SYn/0
	igmdoOmL6K5zuyqopqjAt3CiejOBOGgOYn4nYqaUSRGMLIKPuyVV/wimycMlMZ+FbmNaLjMfSLW
	ljOhuhrvflS007atYvbFeCO7RmSK3VhvRbzkY67ODMuD/x3+N4TAmZ2M7et3tuwjfbWa54N1gg4
	stnhOxy+Q3+TCLRiBLunMT/MN2KgJ0F4+Gn80=
X-Received: by 2002:a05:620a:4410:b0:8c5:1fd2:e9ef with SMTP id af79cd13be357-8cbc8e98257mr181231685a.28.1772165474449;
        Thu, 26 Feb 2026 20:11:14 -0800 (PST)
X-Received: by 2002:a05:620a:4410:b0:8c5:1fd2:e9ef with SMTP id af79cd13be357-8cbc8e98257mr181229085a.28.1772165473935;
        Thu, 26 Feb 2026 20:11:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a111bea36esm41164e87.21.2026.02.26.20.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:11:13 -0800 (PST)
Date: Fri, 27 Feb 2026 06:11:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH V1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for
 hamoa iot evk board
Message-ID: <a52p4rzggad5stohiebdj5ljeivjxifmnlliwrykfnx2yctvnq@jm7jw5xv62u2>
References: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
 <ac78f12a-b10d-46e4-97b2-57d826ebd893@oss.qualcomm.com>
 <738ed5dc-b018-457d-a516-5ae424854fe3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <738ed5dc-b018-457d-a516-5ae424854fe3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a11963 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=m_8YK5EzQP1jc4ZU4tAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOSBTYWx0ZWRfX+VSl/O6NAW45
 LkH6CAsGDO4qZKtT8AnJLWLLvR7G7XvLqbuwjCutkcq4oZZlpfUFvz3tbh2MC+6BSQs0bnXFF5g
 SsAwlsjo47frzdVoSUSQpBPJrZ9XyJX+VFwlIrWxmuHlniTVi2b2l6PxDTt5JUA4QZ6QyIW9ViO
 +AG+7Hrmuk3+wz6gcj95t7jgxO9rnzca6QG3gSLXJn46LuusZRDCSp3+u4y1HrbeZ35prGFraUb
 0RSusPmM3RRg7gYqs6kmUF0kl4bOFwyN2wrrAGhIKcEuAnS6egPHlk/fwkP8icASHW6HeWB9sfH
 WeKS0Py8lCHZmTLTWPQLpWyaEscf+i29WCRrER98vBJN9IrJd9vZ3qZzD6H34RVheKTrNCYnYLX
 FCzFXS9p/W0wJ6zipGopcimEO5QnJkOC1pR3cznT0NlU7whbD017q7UIvTrngd7erHZq4Htx5Pq
 uZhPT7AMexoyePVGAzw==
X-Proofpoint-ORIG-GUID: uicAZXh99ex0PWBUShK2Jybr2HdId7gE
X-Proofpoint-GUID: uicAZXh99ex0PWBUShK2Jybr2HdId7gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270029
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA78D1B2833
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:29:21AM +0530, Sarthak Garg wrote:
> 
> On 2/16/2026 6:23 PM, Konrad Dybcio wrote:
> > On 2/11/26 10:30 AM, Sarthak Garg wrote:
> > > Enable SD Card host controller for hamoa iot evk board.
> > > 
> > > Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> > > ---
> > nit: omit "V1" for the v1 in the subject
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Konrad
> 
> Sure will resend by omitting V1 from subject.

No need to. It's a nit.

> 
> Regards,
> Sarthak
> 
> 

-- 
With best wishes
Dmitry

